Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D37BFAC6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 14:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614710.955986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBVA-0006ZU-VF; Tue, 10 Oct 2023 12:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614710.955986; Tue, 10 Oct 2023 12:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqBVA-0006W8-Rs; Tue, 10 Oct 2023 12:06:16 +0000
Received: by outflank-mailman (input) for mailman id 614710;
 Tue, 10 Oct 2023 12:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mmp=FY=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1qqBV8-00062X-RI
 for xen-devel@lists.xen.org; Tue, 10 Oct 2023 12:06:14 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6713e493-6765-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 14:06:13 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1qqBUv-0007u2-Lf; Tue, 10 Oct 2023 12:06:01 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1qqBUv-0002HO-Is; Tue, 10 Oct 2023 12:06:01 +0000
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
X-Inumbo-ID: 6713e493-6765-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=K2lt6cJE5t+D8CxjCaXxlcARhHDQeGgkh+3U8vR7Wxw=; b=u0YN7rzH6hHPf4VBIVkaecmBmB
	m/OqSzv9nRzsdgHFc15xUR3R4/ZDGxZCdmyiL0zWVTzcBFjtGg0NxBauPo0GtOqZR9NVAIeMUJWj+
	bBncunSK6wJWb3UADNKdeV0A8tTSqg+1F/XOvoeNtHwT61ak9jv+gn4RDKgAQ7aRhEC4=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 441 v4 (CVE-2023-34324) - Possible deadlock
 in Linux kernel event handling
Message-Id: <E1qqBUv-0002HO-Is@xenbits.xenproject.org>
Date: Tue, 10 Oct 2023 12:06:01 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-34324 / XSA-441
                               version 4

           Possible deadlock in Linux kernel event handling

UPDATES IN VERSION 4
====================

Public release.

Modified advisory again to state that Arm32 guests are NOT affected.

ISSUE DESCRIPTION
=================

Closing of an event channel in the Linux kernel can result in a deadlock.
This happens when the close is being performed in parallel to an unrelated
Xen console action and the handling of a Xen console interrupt in an
unprivileged guest.

The closing of an event channel is e.g. triggered by removal of a
paravirtual device on the other side. As this action will cause console
messages to be issued on the other side quite often, the chance of
triggering the deadlock is not neglectable.

Note that 32-bit Arm-guests are not affected, as the 32-bit Linux kernel
on Arm doesn't use queued-RW-locks, which are required to trigger the
issue (on Arm32 a waiting writer doesn't block further readers to get
the lock).

IMPACT
======

A (malicious) guest administrator could cause a denial of service (DoS)
in a backend domain (other than dom0) by disabling a paravirtualized
device.

A malicious backend could cause DoS in a guest running a Linux kernel by
disabling a paravirtualized device.

VULNERABLE SYSTEMS
==================

All unprivileged guests running a Linux kernel of version 5.10 and later,
or with the fixes for XSA-332, are vulnerable.

All guest types are vulnerable.

Only x86- and 64-bit Arm-guests are vulnerable.

Arm-guests running in 32-bit mode are not vulnerable.

Guests not using paravirtualized drivers are not vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered as a bug by Marek Marczykowski-Górecki of
Invisible Things Lab; the security impact was recognised by Jürgen
Groß of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa441-linux.patch     Linux

$ sha256sum xsa441*
937406d86dd6dd3e389fdae726a25e5f0e960f7004c314e370cb2369d6715c24  xsa441-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) on the host and on VMs being
administered and used only by organisations which are members of the Xen
Project Security Issue Predisclosure List is permitted during the embargo,
even on public-facing systems with other untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.

Deployment of patches or mitigations is NOT permitted on VMs being
administered or used by organisations which are not members of the Xen
Project Security Issue Predisclosure List. On those VMs deployment is
permitted only AFTER the embargo ends.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmUlNOkMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZOmAH/3D7dRH11wIRyFZ/nj4pwkPfPXvCDtUmaRXfAaV4
Xe9ODMSevcEQpSFW4VY6eK7DP6kqYMM7myoy+np8Ttnin7+y+PYUJkxM+liqhLyT
fhGi74NNuQLMvGcSKp26aIHAJNtZqWFeRTlEFJHlY4S6ENRoupWd2T2qgnts00NX
R4NzZ8yQFcsmvy9gqgq6MYoa2VIrhQlpiDPX81pA/HViv0GiXab1QSYTyI9jQ2EX
WC19sELYSK2jMAjuejHlw28B+giy0KxcJv6zewn3Jwn8h3ft4AI1OIh4KfOtEad+
wptYB87EM76Lr3B8ipFEvN4sSU1yBnE4iVOgZpAs74mylN8=
=hOm2
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa441-linux.patch"
Content-Disposition: attachment; filename="xsa441-linux.patch"
Content-Transfer-Encoding: base64

RnJvbSBiOTUxOGJiMTA1NjM1MTQ0YWNkYmY5MTYwNTgzYWI5ODUyMWFmODll
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IE1vbiwgMjggQXVnIDIwMjMgMDg6
MDk6NDcgKzAyMDAKU3ViamVjdDogW1BBVENIIHYzXSB4ZW4vZXZlbnRzOiBy
ZXBsYWNlIGV2dGNobl9yd2xvY2sgd2l0aCBSQ1UKCkluIHVucHJpdmlsZWdl
ZCBYZW4gZ3Vlc3RzIGV2ZW50IGhhbmRsaW5nIGNhbiBjYXVzZSBhIGRlYWRs
b2NrIHdpdGgKWGVuIGNvbnNvbGUgaGFuZGxpbmcuIFRoZSBldnRjaG5fcnds
b2NrIGFuZCB0aGUgaHZjX2xvY2sgYXJlIHRha2VuIGluCm9wcG9zaXRlIHNl
cXVlbmNlIGluIF9faHZjX3BvbGwoKSBhbmQgaW4gWGVuIGNvbnNvbGUgSVJR
IGhhbmRsaW5nLgpOb3JtYWxseSB0aGlzIGlzIG5vIHByb2JsZW0sIGFzIHRo
ZSBldnRjaG5fcndsb2NrIGlzIHRha2VuIGFzIGEgcmVhZGVyCmluIGJvdGgg
cGF0aHMsIGJ1dCBhcyBzb29uIGFzIGFuIGV2ZW50IGNoYW5uZWwgaXMgYmVp
bmcgY2xvc2VkLCB0aGUKbG9jayB3aWxsIGJlIHRha2VuIGFzIGEgd3JpdGVy
LCB3aGljaCB3aWxsIGNhdXNlIHJlYWRfbG9jaygpIHRvIGJsb2NrOgoKQ1BV
MCAgICAgICAgICAgICAgICAgICAgIENQVTEgICAgICAgICAgICAgICAgQ1BV
MgooSVJRIGhhbmRsaW5nKSAgICAgICAgICAgKF9faHZjX3BvbGwoKSkgICAg
ICAoY2xvc2luZyBldmVudCBjaGFubmVsKQoKcmVhZF9sb2NrKGV2dGNobl9y
d2xvY2spCiAgICAgICAgICAgICAgICAgICAgICAgICBzcGluX2xvY2soaHZj
X2xvY2spCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHdyaXRlX2xvY2soZXZ0Y2huX3J3bG9jaykKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtibG9ja3Nd
CnNwaW5fbG9jayhodmNfbG9jaykKICAgIFtibG9ja3NdCiAgICAgICAgICAg
ICAgICAgICAgICAgIHJlYWRfbG9jayhldnRjaG5fcndsb2NrKQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgW2Jsb2NrcyBkdWUgdG8gd3JpdGVyIHdh
aXRpbmcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kIG5vdCBp
bl9pbnRlcnJ1cHQoKV0KClRoaXMgaXNzdWUgY2FuIGJlIGF2b2lkZWQgYnkg
cmVwbGFjaW5nIGV2dGNobl9yd2xvY2sgd2l0aCBSQ1UgaW4KeGVuX2ZyZWVf
aXJxKCkuIE5vdGUgdGhhdCBSQ1UgaXMgdXNlZCBvbmx5IHRvIGRlbGF5IGZy
ZWVpbmcgb2YgdGhlCmlycV9pbmZvIG1lbW9yeS4gVGhlcmUgaXMgbm8gUkNV
IGJhc2VkIGRlcmVmZXJlbmNpbmcgb3IgcmVwbGFjZW1lbnQgb2YKcG9pbnRl
cnMgaW52b2x2ZWQuCgpJbiBvcmRlciB0byBhdm9pZCBwb3RlbnRpYWwgcmFj
ZXMgYmV0d2VlbiByZW1vdmluZyB0aGUgaXJxX2luZm8KcmVmZXJlbmNlIGFu
ZCBoYW5kbGluZyBvZiBpbnRlcnJ1cHRzLCBzZXQgdGhlIGlycV9pbmZvIHBv
aW50ZXIgdG8gTlVMTApvbmx5IHdoZW4gZnJlZWluZyBpdHMgbWVtb3J5LiBU
aGUgSVJRIGl0c2VsZiBtdXN0IGJlIGZyZWVkIGF0IHRoYXQKdGltZSwgdG9v
LCBhcyBvdGhlcndpc2UgdGhlIHNhbWUgSVJRIG51bWJlciBjb3VsZCBiZSBh
bGxvY2F0ZWQgYWdhaW4KYmVmb3JlIGhhbmRsaW5nIG9mIHRoZSBvbGQgaW5z
dGFuY2Ugd291bGQgaGF2ZSBiZWVuIGZpbmlzaGVkLgoKVGhpcyBpcyBYU0Et
NDQxIC8gQ1ZFLTIwMjMtMzQzMjQuCgpSZXBvcnRlZC1ieTogTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3Ns
YWIuY29tPgpGaXhlczogNTRjOWRlODk4OTVlICgieGVuL2V2ZW50czogYWRk
IGEgbmV3ICJsYXRlIEVPSSIgZXZ0Y2huIGZyYW1ld29yayIpClNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KUmV2aWV3
ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Ci0tLQog
ZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgfCA4NyArKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ2
IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJpdmVycy94
ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKaW5kZXggMGJiODZlNmM0ZDBhLi4x
YjIxMzZmZTBmYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9l
dmVudHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNf
YmFzZS5jCkBAIC0zMyw2ICszMyw3IEBACiAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgogI2luY2x1ZGUgPGxpbnV4L2lycW5yLmg+CiAjaW5jbHVkZSA8bGlu
dXgvcGNpLmg+CisjaW5jbHVkZSA8bGludXgvcmN1cGRhdGUuaD4KICNpbmNs
dWRlIDxsaW51eC9zcGlubG9jay5oPgogI2luY2x1ZGUgPGxpbnV4L2NwdWhv
dHBsdWcuaD4KICNpbmNsdWRlIDxsaW51eC9hdG9taWMuaD4KQEAgLTk2LDYg
Kzk3LDcgQEAgZW51bSB4ZW5faXJxX3R5cGUgewogc3RydWN0IGlycV9pbmZv
IHsKIAlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7CiAJc3RydWN0IGxpc3RfaGVh
ZCBlb2lfbGlzdDsKKwlzdHJ1Y3QgcmN1X3dvcmsgcndvcms7CiAJc2hvcnQg
cmVmY250OwogCXU4IHNwdXJpb3VzX2NudDsKIAl1OCBpc19hY2NvdW50ZWQ7
CkBAIC0xNDYsMjMgKzE0OCwxMyBAQCBjb25zdCBzdHJ1Y3QgZXZ0Y2huX29w
cyAqZXZ0Y2huX29wczsKICAqLwogc3RhdGljIERFRklORV9NVVRFWChpcnFf
bWFwcGluZ191cGRhdGVfbG9jayk7CiAKLS8qCi0gKiBMb2NrIHByb3RlY3Rp
bmcgZXZlbnQgaGFuZGxpbmcgbG9vcCBhZ2FpbnN0IHJlbW92aW5nIGV2ZW50
IGNoYW5uZWxzLgotICogQWRkaW5nIG9mIGV2ZW50IGNoYW5uZWxzIGlzIG5v
IGlzc3VlIGFzIHRoZSBhc3NvY2lhdGVkIElSUSBiZWNvbWVzIGFjdGl2ZQot
ICogb25seSBhZnRlciBldmVyeXRoaW5nIGlzIHNldHVwIChiZWZvcmUgcmVx
dWVzdF9bdGhyZWFkZWRfXWlycSgpIHRoZSBoYW5kbGVyCi0gKiBjYW4ndCBi
ZSBlbnRlcmVkIGZvciBhbiBldmVudCwgYXMgdGhlIGV2ZW50IGNoYW5uZWwg
d2lsbCBiZSB1bm1hc2tlZCBvbmx5Ci0gKiB0aGVuKS4KLSAqLwotc3RhdGlj
IERFRklORV9SV0xPQ0soZXZ0Y2huX3J3bG9jayk7Ci0KIC8qCiAgKiBMb2Nr
IGhpZXJhcmNoeToKICAqCiAgKiBpcnFfbWFwcGluZ191cGRhdGVfbG9jawot
ICogICBldnRjaG5fcndsb2NrCi0gKiAgICAgSVJRLWRlc2MgbG9jawotICog
ICAgICAgcGVyY3B1IGVvaV9saXN0X2xvY2sKLSAqICAgICAgICAgaXJxX2lu
Zm8tPmxvY2sKKyAqICAgSVJRLWRlc2MgbG9jaworICogICAgIHBlcmNwdSBl
b2lfbGlzdF9sb2NrCisgKiAgICAgICBpcnFfaW5mby0+bG9jawogICovCiAK
IHN0YXRpYyBMSVNUX0hFQUQoeGVuX2lycV9saXN0X2hlYWQpOwpAQCAtMzA2
LDYgKzI5OCwyMiBAQCBzdGF0aWMgdm9pZCBjaGFubmVsc19vbl9jcHVfaW5j
KHN0cnVjdCBpcnFfaW5mbyAqaW5mbykKIAlpbmZvLT5pc19hY2NvdW50ZWQg
PSAxOwogfQogCitzdGF0aWMgdm9pZCBkZWxheWVkX2ZyZWVfaXJxKHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgaXJxX2luZm8gKmlu
Zm8gPSBjb250YWluZXJfb2YodG9fcmN1X3dvcmsod29yayksIHN0cnVjdCBp
cnFfaW5mbywKKwkJCQkJICAgICByd29yayk7CisJdW5zaWduZWQgaW50IGly
cSA9IGluZm8tPmlycTsKKworCS8qIFJlbW92ZSB0aGUgaW5mbyBwb2ludGVy
IG9ubHkgbm93LCB3aXRoIG5vIHBvdGVudGlhbCB1c2VycyBsZWZ0LiAqLwor
CXNldF9pbmZvX2Zvcl9pcnEoaXJxLCBOVUxMKTsKKworCWtmcmVlKGluZm8p
OworCisJLyogTGVnYWN5IElSUSBkZXNjcmlwdG9ycyBhcmUgbWFuYWdlZCBi
eSB0aGUgYXJjaC4gKi8KKwlpZiAoaXJxID49IG5yX2xlZ2FjeV9pcnFzKCkp
CisJCWlycV9mcmVlX2Rlc2MoaXJxKTsKK30KKwogLyogQ29uc3RydWN0b3Jz
IGZvciBwYWNrZWQgSVJRIGluZm9ybWF0aW9uLiAqLwogc3RhdGljIGludCB4
ZW5faXJxX2luZm9fY29tbW9uX3NldHVwKHN0cnVjdCBpcnFfaW5mbyAqaW5m
bywKIAkJCQkgICAgIHVuc2lnbmVkIGlycSwKQEAgLTY2OCwzMyArNjc2LDM2
IEBAIHN0YXRpYyB2b2lkIHhlbl9pcnFfbGF0ZWVvaV93b3JrZXIoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQogCiAJZW9pID0gY29udGFpbmVyX29mKHRv
X2RlbGF5ZWRfd29yayh3b3JrKSwgc3RydWN0IGxhdGVlb2lfd29yaywgZGVs
YXllZCk7CiAKLQlyZWFkX2xvY2tfaXJxc2F2ZSgmZXZ0Y2huX3J3bG9jaywg
ZmxhZ3MpOworCXJjdV9yZWFkX2xvY2soKTsKIAogCXdoaWxlICh0cnVlKSB7
Ci0JCXNwaW5fbG9jaygmZW9pLT5lb2lfbGlzdF9sb2NrKTsKKwkJc3Bpbl9s
b2NrX2lycXNhdmUoJmVvaS0+ZW9pX2xpc3RfbG9jaywgZmxhZ3MpOwogCiAJ
CWluZm8gPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJmVvaS0+ZW9pX2xp
c3QsIHN0cnVjdCBpcnFfaW5mbywKIAkJCQkJCWVvaV9saXN0KTsKIAotCQlp
ZiAoaW5mbyA9PSBOVUxMIHx8IG5vdyA8IGluZm8tPmVvaV90aW1lKSB7Ci0J
CQlzcGluX3VubG9jaygmZW9pLT5lb2lfbGlzdF9sb2NrKTsKKwkJaWYgKGlu
Zm8gPT0gTlVMTCkKKwkJCWJyZWFrOworCisJCWlmIChub3cgPCBpbmZvLT5l
b2lfdGltZSkgeworCQkJbW9kX2RlbGF5ZWRfd29ya19vbihpbmZvLT5lb2lf
Y3B1LCBzeXN0ZW1fd3EsCisJCQkJCSAgICAmZW9pLT5kZWxheWVkLAorCQkJ
CQkgICAgaW5mby0+ZW9pX3RpbWUgLSBub3cpOwogCQkJYnJlYWs7CiAJCX0K
IAogCQlsaXN0X2RlbF9pbml0KCZpbmZvLT5lb2lfbGlzdCk7CiAKLQkJc3Bp
bl91bmxvY2soJmVvaS0+ZW9pX2xpc3RfbG9jayk7CisJCXNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmVvaS0+ZW9pX2xpc3RfbG9jaywgZmxhZ3MpOwogCiAJ
CWluZm8tPmVvaV90aW1lID0gMDsKIAogCQl4ZW5faXJxX2xhdGVlb2lfbG9j
a2VkKGluZm8sIGZhbHNlKTsKIAl9CiAKLQlpZiAoaW5mbykKLQkJbW9kX2Rl
bGF5ZWRfd29ya19vbihpbmZvLT5lb2lfY3B1LCBzeXN0ZW1fd3EsCi0JCQkJ
ICAgICZlb2ktPmRlbGF5ZWQsIGluZm8tPmVvaV90aW1lIC0gbm93KTsKKwlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZlb2ktPmVvaV9saXN0X2xvY2ssIGZs
YWdzKTsKIAotCXJlYWRfdW5sb2NrX2lycXJlc3RvcmUoJmV2dGNobl9yd2xv
Y2ssIGZsYWdzKTsKKwlyY3VfcmVhZF91bmxvY2soKTsKIH0KIAogc3RhdGlj
IHZvaWQgeGVuX2NwdV9pbml0X2VvaSh1bnNpZ25lZCBpbnQgY3B1KQpAQCAt
NzA5LDE2ICs3MjAsMTUgQEAgc3RhdGljIHZvaWQgeGVuX2NwdV9pbml0X2Vv
aSh1bnNpZ25lZCBpbnQgY3B1KQogdm9pZCB4ZW5faXJxX2xhdGVlb2kodW5z
aWduZWQgaW50IGlycSwgdW5zaWduZWQgaW50IGVvaV9mbGFncykKIHsKIAlz
dHJ1Y3QgaXJxX2luZm8gKmluZm87Ci0JdW5zaWduZWQgbG9uZyBmbGFnczsK
IAotCXJlYWRfbG9ja19pcnFzYXZlKCZldnRjaG5fcndsb2NrLCBmbGFncyk7
CisJcmN1X3JlYWRfbG9jaygpOwogCiAJaW5mbyA9IGluZm9fZm9yX2lycShp
cnEpOwogCiAJaWYgKGluZm8pCiAJCXhlbl9pcnFfbGF0ZWVvaV9sb2NrZWQo
aW5mbywgZW9pX2ZsYWdzICYgWEVOX0VPSV9GTEFHX1NQVVJJT1VTKTsKIAot
CXJlYWRfdW5sb2NrX2lycXJlc3RvcmUoJmV2dGNobl9yd2xvY2ssIGZsYWdz
KTsKKwlyY3VfcmVhZF91bmxvY2soKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BM
KHhlbl9pcnFfbGF0ZWVvaSk7CiAKQEAgLTczMiw2ICs3NDIsNyBAQCBzdGF0
aWMgdm9pZCB4ZW5faXJxX2luaXQodW5zaWduZWQgaXJxKQogCiAJaW5mby0+
dHlwZSA9IElSUVRfVU5CT1VORDsKIAlpbmZvLT5yZWZjbnQgPSAtMTsKKwlJ
TklUX1JDVV9XT1JLKCZpbmZvLT5yd29yaywgZGVsYXllZF9mcmVlX2lycSk7
CiAKIAlzZXRfaW5mb19mb3JfaXJxKGlycSwgaW5mbyk7CiAJLyoKQEAgLTc4
OSwzMSArODAwLDE4IEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIHhlbl9h
bGxvY2F0ZV9pcnFfZ3NpKHVuc2lnbmVkIGdzaSkKIHN0YXRpYyB2b2lkIHhl
bl9mcmVlX2lycSh1bnNpZ25lZCBpcnEpCiB7CiAJc3RydWN0IGlycV9pbmZv
ICppbmZvID0gaW5mb19mb3JfaXJxKGlycSk7Ci0JdW5zaWduZWQgbG9uZyBm
bGFnczsKIAogCWlmIChXQVJOX09OKCFpbmZvKSkKIAkJcmV0dXJuOwogCi0J
d3JpdGVfbG9ja19pcnFzYXZlKCZldnRjaG5fcndsb2NrLCBmbGFncyk7Ci0K
IAlpZiAoIWxpc3RfZW1wdHkoJmluZm8tPmVvaV9saXN0KSkKIAkJbGF0ZWVv
aV9saXN0X2RlbChpbmZvKTsKIAogCWxpc3RfZGVsKCZpbmZvLT5saXN0KTsK
IAotCXNldF9pbmZvX2Zvcl9pcnEoaXJxLCBOVUxMKTsKLQogCVdBUk5fT04o
aW5mby0+cmVmY250ID4gMCk7CiAKLQl3cml0ZV91bmxvY2tfaXJxcmVzdG9y
ZSgmZXZ0Y2huX3J3bG9jaywgZmxhZ3MpOwotCi0Ja2ZyZWUoaW5mbyk7Ci0K
LQkvKiBMZWdhY3kgSVJRIGRlc2NyaXB0b3JzIGFyZSBtYW5hZ2VkIGJ5IHRo
ZSBhcmNoLiAqLwotCWlmIChpcnEgPCBucl9sZWdhY3lfaXJxcygpKQotCQly
ZXR1cm47Ci0KLQlpcnFfZnJlZV9kZXNjKGlycSk7CisJcXVldWVfcmN1X3dv
cmsoc3lzdGVtX3dxLCAmaW5mby0+cndvcmspOwogfQogCiAvKiBOb3QgY2Fs
bGVkIGZvciBsYXRlZW9pIGV2ZW50cy4gKi8KQEAgLTE3MTEsNyArMTcwOSwx
NCBAQCBpbnQgeGVuX2V2dGNobl9kb191cGNhbGwodm9pZCkKIAlpbnQgY3B1
ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwogCXN0cnVjdCBldnRjaG5fbG9vcF9j
dHJsIGN0cmwgPSB7IDAgfTsKIAotCXJlYWRfbG9jaygmZXZ0Y2huX3J3bG9j
ayk7CisJLyoKKwkgKiBXaGVuIGNsb3NpbmcgYW4gZXZlbnQgY2hhbm5lbCB0
aGUgYXNzb2NpYXRlZCBJUlEgbXVzdCBub3QgYmUgZnJlZWQKKwkgKiB1bnRp
bCBhbGwgY3B1cyBoYXZlIGxlZnQgdGhlIGV2ZW50IGhhbmRsaW5nIGxvb3Au
IFRoaXMgaXMgZW5zdXJlZAorCSAqIGJ5IHRha2luZyB0aGUgcmN1X3JlYWRf
bG9jaygpIHdoaWxlIGhhbmRsaW5nIGV2ZW50cywgYXMgZnJlZWluZyBvZgor
CSAqIHRoZSBJUlEgaXMgaGFuZGxlZCB2aWEgcXVldWVfcmN1X3dvcmsoKSBf
YWZ0ZXJfIGNsb3NpbmcgdGhlIGV2ZW50CisJICogY2hhbm5lbC4KKwkgKi8K
KwlyY3VfcmVhZF9sb2NrKCk7CiAKIAlkbyB7CiAJCXZjcHVfaW5mby0+ZXZ0
Y2huX3VwY2FsbF9wZW5kaW5nID0gMDsKQEAgLTE3MjQsNyArMTcyOSw3IEBA
IGludCB4ZW5fZXZ0Y2huX2RvX3VwY2FsbCh2b2lkKQogCiAJfSB3aGlsZSAo
dmNwdV9pbmZvLT5ldnRjaG5fdXBjYWxsX3BlbmRpbmcpOwogCi0JcmVhZF91
bmxvY2soJmV2dGNobl9yd2xvY2spOworCXJjdV9yZWFkX3VubG9jaygpOwog
CiAJLyoKIAkgKiBJbmNyZW1lbnQgaXJxX2Vwb2NoIG9ubHkgbm93IHRvIGRl
ZmVyIEVPSXMgb25seSBmb3IKLS0gCjIuMzUuMwoK

--=separator--

