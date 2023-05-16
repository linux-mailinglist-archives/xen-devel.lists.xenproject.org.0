Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232237051C8
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 17:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535314.833061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pywOE-0005dC-TZ; Tue, 16 May 2023 15:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535314.833061; Tue, 16 May 2023 15:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pywOE-0005Zc-P5; Tue, 16 May 2023 15:15:02 +0000
Received: by outflank-mailman (input) for mailman id 535314;
 Tue, 16 May 2023 15:15:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IEz5=BF=xenbits.xen.org=jbeulich@srs-se1.protection.inumbo.net>)
 id 1pywOC-0004qr-GP
 for xen-devel@lists.xen.org; Tue, 16 May 2023 15:15:00 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68adb48a-f3fc-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 17:14:54 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@xenbits.xen.org>)
 id 1pywNt-0002Kn-R5; Tue, 16 May 2023 15:14:41 +0000
Received: from jbeulich by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <jbeulich@xenbits.xen.org>)
 id 1pywNt-00034k-MT; Tue, 16 May 2023 15:14:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 68adb48a-f3fc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=FSgKutlkty7XrjsLRVvpNZO6nUhKYovxPjAqthRaHbQ=; b=ovfB4G/yeLEMgz9vOE3aL5+5wx
	h7gfJpfRfc1U/gf3oQC+VFUEQlfUIXXYlJJfrcv4BfCfOpIoAEnVs3HAgIWWIV+/n5sgvXmQBZ8tG
	D7IklvZiR1JeDJzTmHTfQJgsCVwS0Xa4csgHisszbvBer3dO/95cJNb+4c6Teo+R20X4=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 431 v1 (CVE-2022-42336) - Mishandling of
 guest SSBD selection on AMD hardware
Message-Id: <E1pywNt-00034k-MT@xenbits.xenproject.org>
Date: Tue, 16 May 2023 15:14:41 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-42336 / XSA-431

          Mishandling of guest SSBD selection on AMD hardware

ISSUE DESCRIPTION
=================

The current logic to set SSBD on AMD Family 17h and Hygon Family 18h
processors requires that the setting of SSBD is coordinated at a core
level, as the setting is shared between threads.  Logic was introduced
to keep track of how many threads require SSBD active in order to
coordinate it, such logic relies on using a per-core counter of threads
that have SSBD active.

When running on the mentioned hardware, it's possible for a guest to
under or overflow the thread counter, because each write to
VIRT_SPEC_CTRL.SSBD by the guest gets propagated to the helper that does
the per-core active accounting.  Underflowing the counter causes the
value to get saturated, and thus attempts for guests running on the same
core to set SSBD won't have effect because the hypervisor assumes it's
already active.

IMPACT
======

An attacker with control over a guest can mislead other guests into
observing SSBD active when it is not.

VULNERABLE SYSTEMS
==================

Only Xen version 4.17 is vulnerable.

Only x86 AMD systems are vulnerable.  The vulnerability can be leveraged
by and affects only HVM guests.

MITIGATION
==========

Running PV guests only will prevent the vulnerability.

Setting `spec-ctrl=ssbd` on the hypervisor command line will force SSBD
to be unconditionally active.

NOTE REGARDING LACK OF EMBARGO
==============================

This issue was discussed in public already.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa431.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa431*
e71a8b7e251adf4832a4de9e452c2fd895a56314729c54698d10e344f1996a99  xsa431.patch
$
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmRjkhsMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZDb8H/0vKLOgBhwKCVc8VYm59FIALd69k4qCLcwwfDuro
jFum5ATC3Cbx+iEXD2URFY6O+eE71mMBqw3/GT/BiKvsBHQhX5lsJUpxZFscqW9J
diM69a9BYuNNy+qW3TsslRsW9WGHH5bZoAhxpNKgciE17svJ76IRUsgNf806VRX+
VBI61wK2s9oqzfTazhQVR9zxFLANTyw7M4EtUXs0y49IUFjnSeVpW7/PdoloPC1C
m0SG6HSIJ4bH+yAWMqY5GYYVgJOkaStxEM6YLGjT/V078xcDyW2cie3BOtQ8/BI0
FJ7iwEh932k7VLtd+htBF3vo7CD+teGneeaktqKK2h55ps0=
=dmhW
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa431.patch"
Content-Disposition: attachment; filename="xsa431.patch"
Content-Transfer-Encoding: base64

RnJvbSA5YzAzMzgwZmM5ZTMyOGYwY2NiYTg2MGNiZTA5ZWY1OGVhMzY2Zjcx
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBXZWQsIDIyIE1hciAy
MDIzIDExOjUyOjA3ICswMTAwClN1YmplY3Q6IFtQQVRDSF0geDg2L2FtZDog
Zml4IGxlZ2FjeSBzZXR0aW5nIG9mIFNTQkQgb24gQU1EIEZhbWlseSAxN2gK
TUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQK
ClRoZSBjdXJyZW50IGxvZ2ljIHRvIHNldCBTU0JEIG9uIEFNRCBGYW1pbHkg
MTdoIGFuZCBIeWdvbiBGYW1pbHkgMThoCnByb2Nlc3NvcnMgcmVxdWlyZXMg
dGhhdCB0aGUgc2V0dGluZyBvZiBTU0JEIGlzIGNvb3JkaW5hdGVkIGF0IGEg
Y29yZQpsZXZlbCwgYXMgdGhlIHNldHRpbmcgaXMgc2hhcmVkIGJldHdlZW4g
dGhyZWFkcy4gIExvZ2ljIHdhcyBpbnRyb2R1Y2VkCnRvIGtlZXAgdHJhY2sg
b2YgaG93IG1hbnkgdGhyZWFkcyByZXF1aXJlIFNTQkQgYWN0aXZlIGluIG9y
ZGVyIHRvCmNvb3JkaW5hdGUgaXQsIHN1Y2ggbG9naWMgcmVsaWVzIG9uIHVz
aW5nIGEgcGVyLWNvcmUgY291bnRlciBvZgp0aHJlYWRzIHRoYXQgaGF2ZSBT
U0JEIGFjdGl2ZS4KCkdpdmVuIHRoZSBjdXJyZW50IGxvZ2ljLCBpdCdzIHBv
c3NpYmxlIGZvciBhIGd1ZXN0IHRvIHVuZGVyIG9yCm92ZXJmbG93IHRoZSB0
aHJlYWQgY291bnRlciwgYmVjYXVzZSBlYWNoIHdyaXRlIHRvIFZJUlRfU1BF
Q19DVFJMLlNTQkQKYnkgdGhlIGd1ZXN0IGdldHMgcHJvcGFnYXRlZCB0byB0
aGUgaGVscGVyIHRoYXQgZG9lcyB0aGUgcGVyLWNvcmUKYWN0aXZlIGFjY291
bnRpbmcuICBPdmVyZmxvd2luZyB0aGUgY291bnRlciBpcyBub3Qgc28gbXVj
aCBvZiBhbgppc3N1ZSwgYXMgdGhpcyB3b3VsZCBqdXN0IG1ha2UgU1NCRCBz
dGlja3kuCgpVbmRlcmZsb3dpbmcgaG93ZXZlciBpcyBtb3JlIHByb2JsZW1h
dGljOiBvbiBub24tZGVidWcgWGVuIGJ1aWxkcyBhCmd1ZXN0IGNhbiBwZXJm
b3JtIGVtcHR5IHdyaXRlcyB0byBWSVJUX1NQRUNfQ1RSTCB0aGF0IHdvdWxk
IGNhdXNlIHRoZQpjb3VudGVyIHRvIHVuZGVyZmxvdyBhbmQgdGh1cyB0aGUg
dmFsdWUgZ2V0cyBzYXR1cmF0ZWQgdG8gdGhlIG1heAp2YWx1ZSBvZiB1bnNp
Z25lZCBpbnQuICBBdCB3aGljaCBwb2ludHMgYXR0ZW1wdHMgZnJvbSBhbnkg
dGhyZWFkIHRvCnNldCBWSVJUX1NQRUNfQ1RSTC5TU0JEIHdvbid0IGdldCBw
cm9wYWdhdGVkIHRvIHRoZSBoYXJkd2FyZSBhbnltb3JlLApiZWNhdXNlIHRo
ZSBsb2dpYyB3aWxsIHNlZSB0aGF0IHRoZSBjb3VudGVyIGlzIGdyZWF0ZXIg
dGhhbiAxIGFuZAphc3N1bWUgdGhhdCBTU0JEIGlzIGFscmVhZHkgYWN0aXZl
LCBlZmZlY3RpdmVseSBsb29zaW5nIHRoZSBzZXR0aW5nCm9mIFNTQkQgYW5k
IHRoZSBwcm90ZWN0aW9uIGl0IHByb3ZpZGVzLgoKRml4IHRoaXMgYnkgaW50
cm9kdWNpbmcgYSBwZXItQ1BVIHZhcmlhYmxlIHRoYXQga2VlcHMgdHJhY2sg
b2Ygd2hldGhlcgp0aGUgY3VycmVudCB0aHJlYWQgaGFzIGxlZ2FjeSBTU0JE
IGFjdGl2ZSBvciBub3QsIGFuZCB0aHVzIG9ubHkKYXR0ZW1wdCB0byBwcm9w
YWdhdGUgdGhlIHZhbHVlIHRvIHRoZSBoYXJkd2FyZSBvbmNlIHRoZSB0aHJl
YWQKc2VsZWN0ZWQgdmFsdWUgY2hhbmdlcy4KClRoaXMgaXMgWFNBLTQzMSAv
IENWRS0yMDIyLTQyMzM2CgpGaXhlczogYjIwMzBlNjczMGEyICgnYW1kL3Zp
cnRfc3NiZDogc2V0IFNTQkQgYXQgdkNQVSBjb250ZXh0IHN3aXRjaCcpClJl
cG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L2FtZC5j
IHwgMTYgKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L2Ft
ZC5jIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwppbmRleCBjYWFmZTQ0NzQw
MjEuLjlhMWEzODU4ZWRkNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Nw
dS9hbWQuYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2FtZC5jCkBAIC03ODMs
MTIgKzc4MywyMyBAQCBib29sIF9faW5pdCBhbWRfc2V0dXBfbGVnYWN5X3Nz
YmQodm9pZCkKIAlyZXR1cm4gdHJ1ZTsKIH0KIAorLyoKKyAqIGxlZ2FjeV9z
c2JkIGlzIGFsd2F5cyBpbml0aWFsaXplZCB0byBmYWxzZSBiZWNhdXNlIHdo
ZW4gU1NCRCBpcyBzZXQKKyAqIGZyb20gdGhlIGNvbW1hbmQgbGluZSBndWVz
dCBhdHRlbXB0cyB0byBjaGFuZ2UgaXQgYXJlIGEgbm8tb3AgKHNlZQorICog
YW1kX3NldF9sZWdhY3lfc3NiZCgpKSwgd2hlcmVhcyB3aGVuIFNTQkQgaXMg
aW5hY3RpdmUgaGFyZHdhcmUgd2lsbAorICogYmUgZm9yY2VkIGludG8gdGhh
dCBtb2RlIChzZWUgYW1kX2luaXRfc3NiZCgpKS4KKyAqLworc3RhdGljIERF
RklORV9QRVJfQ1BVKGJvb2wsIGxlZ2FjeV9zc2JkKTsKKworLyogTXVzdCBi
ZSBjYWxsZWQgb25seSB3aGVuIHRoZSBTU0JEIHNldHRpbmcgbmVlZHMgdG9n
Z2xpbmcuICovCiBzdGF0aWMgdm9pZCBjb3JlX3NldF9sZWdhY3lfc3NiZChi
b29sIGVuYWJsZSkKIHsKIAljb25zdCBzdHJ1Y3QgY3B1aW5mb194ODYgKmMg
PSAmY3VycmVudF9jcHVfZGF0YTsKIAlzdHJ1Y3Qgc3NiZF9sc19jZmcgKnN0
YXR1czsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwogCisJQlVHX09OKHRoaXNf
Y3B1KGxlZ2FjeV9zc2JkKSA9PSBlbmFibGUpOworCiAJaWYgKChjLT54ODYg
IT0gMHgxNyAmJiBjLT54ODYgIT0gMHgxOCkgfHwgYy0+eDg2X251bV9zaWJs
aW5ncyA8PSAxKSB7CiAJCUJVR19PTighc2V0X2xlZ2FjeV9zc2JkKGMsIGVu
YWJsZSkpOwogCQlyZXR1cm47CkBAIC04MTYsMTIgKzgyNywxNyBAQCB2b2lk
IGFtZF9zZXRfbGVnYWN5X3NzYmQoYm9vbCBlbmFibGUpCiAJCSAqLwogCQly
ZXR1cm47CiAKKwlpZiAodGhpc19jcHUobGVnYWN5X3NzYmQpID09IGVuYWJs
ZSkKKwkJcmV0dXJuOworCiAJaWYgKGNwdV9oYXNfdmlydF9zc2JkKQogCQl3
cm1zcihNU1JfVklSVF9TUEVDX0NUUkwsIGVuYWJsZSA/IFNQRUNfQ1RSTF9T
U0JEIDogMCwgMCk7CiAJZWxzZSBpZiAoYW1kX2xlZ2FjeV9zc2JkKQogCQlj
b3JlX3NldF9sZWdhY3lfc3NiZChlbmFibGUpOwogCWVsc2UKIAkJQVNTRVJU
X1VOUkVBQ0hBQkxFKCk7CisKKwl0aGlzX2NwdShsZWdhY3lfc3NiZCkgPSBl
bmFibGU7CiB9CiAKIC8qCi0tIAoyLjQwLjAKCg==

--=separator--

