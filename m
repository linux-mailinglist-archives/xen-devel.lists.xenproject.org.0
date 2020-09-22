Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80311274344
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:38:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiUi-000257-3s; Tue, 22 Sep 2020 13:38:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzSo=C7=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kKiUg-0001gh-Hv
 for xen-devel@lists.xen.org; Tue, 22 Sep 2020 13:38:06 +0000
X-Inumbo-ID: c848ba9c-7649-4b31-8d4d-31d28757ef0a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c848ba9c-7649-4b31-8d4d-31d28757ef0a;
 Tue, 22 Sep 2020 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 bh=mW+BhOO+gLBe3N5yVv/AmCHZwB1mJcUT0ffbghSDYeg=; b=wy0GH4ziap/HWkXdZrqidx8kl+
 F4YDk6IlVxg95QmmwBcpz3sOqjqZ1O9hJpk+NnGlQyRTXnRoSzMnqrtXeSDMFF48l1rIcsKswhwxU
 yDvCGW4VuoDXs5YFClNmnvUxOiQr19kHkz/yDMYAg3xveZL+97Cx9G23kETAUrA/WPrI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTt-0006pl-Ix; Tue, 22 Sep 2020 13:37:17 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTt-0002Lq-ID; Tue, 22 Sep 2020 13:37:17 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 339 v3 (CVE-2020-25596) - x86 pv guest
 kernel DoS via SYSENTER
Message-Id: <E1kKiTt-0002Lq-ID@xenbits.xenproject.org>
Date: Tue, 22 Sep 2020 13:37:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-25596 / XSA-339
                               version 3

                 x86 pv guest kernel DoS via SYSENTER

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

The SYSENTER instruction leaves various state sanitization activities
to software.  One of Xen's sanitization paths injects a #GP fault, and
incorrectly delivers it twice to the guest.

This causes the guest kernel to observe a kernel-privilege #GP fault
(typically fatal) rather than a user-privilege #GP fault (usually
converted into SIGSEGV/etc).

IMPACT
======

Malicious or buggy userspace can crash the guest kernel, resulting in
a VM Denial of Service.

VULNERABLE SYSTEMS
==================

All versions of Xen from 3.2 onwards are vulnerable.

Only x86 systems are vulnerable.  ARM platforms are not vulnerable.

Only x86 systems which support the SYSENTER instruction in 64bit mode
are vulnerable.  This is believed to be Intel, Centaur and Shanghai
CPUs.  AMD and Hygon CPUs are not believed to be vulnerable.

Only x86 PV guests can exploit the vulnerability.  x86 PVH / HVM
guests cannot exploit the vulnerability.

MITIGATION
==========

Running only x86 PVH / HVM guests avoids the vulnerability.

CREDITS
=======

This issue was discovered by Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa339.patch           Xen 4.10 - xen-unstable

$ sha256sum xsa339*
5cece13878cc40b32bc5753c0ef64f989f9b1c7f9549d62ea4fcd06e9620de9e  xsa339.meta
b6ffa7671d905aa12498ad64915be3b7cba74ce1c5bf6bce18b1f106ebf6d715  xsa339.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.


(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl9p/ecMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZgEUH/1/5DUgXRKzwvYuERdBintUdCUaezYpjY0VEJ/v5
nPXEZDDkBFZZxtWmLg6gqMsJg4O6npTcZ6Z3ZpP8xTiRexr0fHHRY5FHqOCW0aS+
c0WYQzSvfDW1L/m9fjwsbFKKRCmrwE24L/Jc7GZJlpps22f1mZpn3cwsjidlofHi
WxqpdAPNDLsPDF3+iwt5a8gL3onyeo03MaBhO29UAJIKCo4hxiKu5/e3upXFBdN2
Z4Pyr79E51SiCGxZ/A1NTil9+FyYkP1DgBQdJ6pVrxMnZUhdcjbGLEbrUNaTfgox
yORU8rE3XS2ZajRpW3D2CIGnKJj3zGWaQqx+FufX1m6Y8qE=
=tkQp
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa339.meta"
Content-Disposition: attachment; filename="xsa339.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMzksCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICI5M2JlOTQzZTdkNzU5MDE1YmQ1ZGI0MWE0OGY2ZGNlNThl
NTgwZDVhIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
MzYsCiAgICAgICAgICAgIDMzNywKICAgICAgICAgICAgMzM4CiAgICAgICAg
ICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ez
MzkucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
LAogICAgIjQuMTEiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4
ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogImRkYWFjY2JiYWI2YjE5
YmYyMWVkMmMwOTdmMzA1NWEzYzI1NDRjOGQiLAogICAgICAgICAgIlByZXJl
cXMiOiBbCiAgICAgICAgICAgIDMzMywKICAgICAgICAgICAgMzM2LAogICAg
ICAgICAgICAzMzcsCiAgICAgICAgICAgIDMzOAogICAgICAgICAgXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzM5LnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjEyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewog
ICAgICAgICAgIlN0YWJsZVJlZiI6ICIxMzM2Y2ExNzc0MjQ3MWZjNGE1OTg3
OWFlMmY2MzdhNTk1MzBhOTMzIiwKICAgICAgICAgICJQcmVyZXFzIjogWwog
ICAgICAgICAgICAzMzMsCiAgICAgICAgICAgIDMzNCwKICAgICAgICAgICAg
MzM2LAogICAgICAgICAgICAzMzcsCiAgICAgICAgICAgIDMzOAogICAgICAg
ICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNh
MzM5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAg
fSwKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAi
eGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI5YjM2N2IyYjBiNzE0
ZjNmZmI2OWVkNmJlMGExMThlOGQzZWFjMDdmIiwKICAgICAgICAgICJQcmVy
ZXFzIjogWwogICAgICAgICAgICAzMzMsCiAgICAgICAgICAgIDMzNCwKICAg
ICAgICAgICAgMzM2LAogICAgICAgICAgICAzMzcsCiAgICAgICAgICAgIDMz
OAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAg
ICAgICAieHNhMzM5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAg
ICAgfQogICAgfSwKICAgICI0LjE0IjogewogICAgICAiUmVjaXBlcyI6IHsK
ICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJjM2Ew
ZmMyMmFmOTBlZjI4ZTY4YjExNmM2YTQ5ZDljZWM1N2Y3MWNmIiwKICAgICAg
ICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzMzMsCiAgICAgICAgICAg
IDMzNCwKICAgICAgICAgICAgMzM2LAogICAgICAgICAgICAzMzcsCiAgICAg
ICAgICAgIDMzOAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjog
WwogICAgICAgICAgICAieHNhMzM5LnBhdGNoIgogICAgICAgICAgXQogICAg
ICAgIH0KICAgICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogImIxMTkxMDA4MmQ5MGJiMTU5N2Y2Njc5NTI0ZWI3MjZhMzMzMDY2
NzIiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDMzMywK
ICAgICAgICAgICAgMzM0LAogICAgICAgICAgICAzMzYsCiAgICAgICAgICAg
IDMzNywKICAgICAgICAgICAgMzM4CiAgICAgICAgICBdLAogICAgICAgICAg
IlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMzkucGF0Y2giCiAgICAg
ICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa339.patch"
Content-Disposition: attachment; filename="xsa339.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3B2OiBBdm9pZCBkb3VibGUgZXhjZXB0aW9uIGlu
amVjdGlvbgoKVGhlcmUgaXMgYXQgbGVhc3Qgb25lIHBhdGggKFNZU0VOVEVS
IHdpdGggTlQgc2V0LCBYZW4gY29udmVydHMgdG8gI0dQKSB3aGljaAplbmRz
IHVwIGluamVjdGluZyB0aGUgI0dQIGZhdWx0IHR3aWNlLCBmaXJzdCBpbiBj
b21wYXRfc3lzZW50ZXIoKSwgYW5kIHRoZW4gYQpzZWNvbmQgdGltZSBpbiBj
b21wYXRfdGVzdF9hbGxfZXZlbnRzKCksIGR1ZSB0byB0aGUgc3RhbGUgVEJG
X0VYQ0VQVElPTiBsZWZ0CmluIFRSQVBCT1VOQ0VfZmxhZ3MuCgpUaGUgZ3Vl
c3Qga2VybmVsIHNlZXMgdGhlIHNlY29uZCBmYXVsdCBmaXJzdCwgd2hpY2gg
aXMgYSBrZXJuZWwgbGV2ZWwgI0dQCnBvaW50aW5nIGF0IHRoZSBoZWFkIG9m
IHRoZSAjR1AgaGFuZGxlciwgYW5kIGlzIHRoZXJlZm9yZSBhIHVzZXJzcGFj
ZQp0cmlnZ2VyLWFibGUgRG9TLgoKVGhpcyBwYXJ0aWN1bGFyIGJ1ZyBoYXMg
Yml0dGVuIHVzIHNldmVyYWwgdGltZXMgYmVmb3JlLCBzbyByZWFycmFuZ2UK
e2NvbXBhdF8sfWNyZWF0ZV9ib3VuY2VfZnJhbWUoKSB0byBjbG9iYmVyIFRS
QVBCT1VOQ0Ugb24gc3VjY2VzcywgcmF0aGVyIHRoYW4KbGVhdmluZyB0aGlz
IHRhc2sgdG8gb25lIGFyZWEgb2YgY29kZSB3aGljaCBpc24ndCB1c2VkIHVu
aWZvcm1seS4KCk90aGVyIHNjZW5hcmlvcyB3aGljaCBtaWdodCByZXN1bHQg
aW4gYSBkb3VibGUgaW5qZWN0aW9uIChlLmcuIHR3byBjYWxscwpkaXJlY3Rs
eSB0byBjb21wYXRfY3JlYXRlX2JvdW5jZV9mcmFtZSkgd2lsbCBub3cgY3Jh
c2ggdGhlIGd1ZXN0LCB3aGljaCBpcyBmYXIKbW9yZSBvYnZpb3VzIHRoYW4g
bGV0dGluZyB0aGUga2VybmVsIHJ1biB3aXRoIGNvcnJ1cHQgc3RhdGUuCgpU
aGlzIGlzIFhTQS0zMzkKCkZpeGVzOiBmZGFjOTUxNTYwN2IgKCJ4ODY6IGNs
ZWFyIEVGTEFHUy5OVCBpbiBTWVNFTlRFUiBlbnRyeSBwYXRoIikKU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L2NvbXBh
dC9lbnRyeS5TIGIveGVuL2FyY2gveDg2L3g4Nl82NC9jb21wYXQvZW50cnku
UwppbmRleCBjM2U2MmY4NzM0Li43MzYxOWY1N2NhIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYveDg2XzY0L2NvbXBhdC9lbnRyeS5TCisrKyBiL3hlbi9h
cmNoL3g4Ni94ODZfNjQvY29tcGF0L2VudHJ5LlMKQEAgLTc4LDcgKzc4LDYg
QEAgY29tcGF0X3Byb2Nlc3Nfc29mdGlycXM6CiAgICAgICAgIHN0aQogLkxj
b21wYXRfYm91bmNlX2V4Y2VwdGlvbjoKICAgICAgICAgY2FsbCAgY29tcGF0
X2NyZWF0ZV9ib3VuY2VfZnJhbWUKLSAgICAgICAgbW92YiAgJDAsIFRSQVBC
T1VOQ0VfZmxhZ3MoJXJkeCkKICAgICAgICAgam1wICAgY29tcGF0X3Rlc3Rf
YWxsX2V2ZW50cwogCiAJQUxJR04KQEAgLTM1Miw3ICszNTEsMTMgQEAgX19V
TkxJS0VMWV9FTkQoY29tcGF0X2JvdW5jZV9udWxsX3NlbGVjdG9yKQogICAg
ICAgICBtb3ZsICAlZWF4LFVSRUdTX2NzKzgoJXJzcCkKICAgICAgICAgbW92
bCAgVFJBUEJPVU5DRV9laXAoJXJkeCksJWVheAogICAgICAgICBtb3ZsICAl
ZWF4LFVSRUdTX3JpcCs4KCVyc3ApCisKKyAgICAgICAgLyogVHJhcGJvdW5j
ZSBjb21wbGV0ZS4gIENsb2JiZXIgc3RhdGUgdG8gYXZvaWQgYW4gZXJyb25l
b3VzIHNlY29uZCBpbmplY3Rpb24uICovCisgICAgICAgIHhvciAgICVlYXgs
ICVlYXgKKyAgICAgICAgbW92ICAgJWF4LCAgVFJBUEJPVU5DRV9jcyglcmR4
KQorICAgICAgICBtb3YgICAlYWwsICBUUkFQQk9VTkNFX2ZsYWdzKCVyZHgp
CiAgICAgICAgIHJldAorCiAuc2VjdGlvbiAuZml4dXAsImF4IgogLkxmeDEz
OgogICAgICAgICB4b3JsICAlZWRpLCVlZGkKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni94ODZfNjQvZW50cnkuUyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQv
ZW50cnkuUwppbmRleCAxZTg4MGViOWY2Li43MWEwMGU4NDZiIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMKKysrIGIveGVuL2Fy
Y2gveDg2L3g4Nl82NC9lbnRyeS5TCkBAIC05MCw3ICs5MCw2IEBAIHByb2Nl
c3Nfc29mdGlycXM6CiAgICAgICAgIHN0aQogLkxib3VuY2VfZXhjZXB0aW9u
OgogICAgICAgICBjYWxsICBjcmVhdGVfYm91bmNlX2ZyYW1lCi0gICAgICAg
IG1vdmIgICQwLCBUUkFQQk9VTkNFX2ZsYWdzKCVyZHgpCiAgICAgICAgIGpt
cCAgIHRlc3RfYWxsX2V2ZW50cwogCiAgICAgICAgIEFMSUdOCkBAIC01MTIs
NiArNTExLDExIEBAIFVOTElLRUxZX1NUQVJUKHosIGNyZWF0ZV9ib3VuY2Vf
ZnJhbWVfYmFkX2JvdW5jZV9pcCkKICAgICAgICAgam1wICAgYXNtX2RvbWFp
bl9jcmFzaF9zeW5jaHJvbm91cyAgLyogRG9lcyBub3QgcmV0dXJuICovCiBf
X1VOTElLRUxZX0VORChjcmVhdGVfYm91bmNlX2ZyYW1lX2JhZF9ib3VuY2Vf
aXApCiAgICAgICAgIG1vdnEgICVyYXgsVVJFR1NfcmlwKzgoJXJzcCkKKwor
ICAgICAgICAvKiBUcmFwYm91bmNlIGNvbXBsZXRlLiAgQ2xvYmJlciBzdGF0
ZSB0byBhdm9pZCBhbiBlcnJvbmVvdXMgc2Vjb25kIGluamVjdGlvbi4gKi8K
KyAgICAgICAgeG9yICAgJWVheCwgJWVheAorICAgICAgICBtb3YgICAlcmF4
LCBUUkFQQk9VTkNFX2VpcCglcmR4KQorICAgICAgICBtb3YgICAlYWwsICBU
UkFQQk9VTkNFX2ZsYWdzKCVyZHgpCiAgICAgICAgIHJldAogCiAgICAgICAg
IC5wdXNoc2VjdGlvbiAuZml4dXAsICJheCIsIEBwcm9nYml0cwo=

--=separator--

