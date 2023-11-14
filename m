Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4557C7EB170
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632466.986823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2tyl-0006uG-Eg; Tue, 14 Nov 2023 14:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632466.986823; Tue, 14 Nov 2023 14:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2tyl-0006pa-7c; Tue, 14 Nov 2023 14:01:23 +0000
Received: by outflank-mailman (input) for mailman id 632466;
 Tue, 14 Nov 2023 14:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ep+=G3=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1r2tyj-00059B-5v
 for xen-devel@lists.xen.org; Tue, 14 Nov 2023 14:01:21 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46674327-82f6-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 15:01:15 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1r2tyQ-0007EB-QY; Tue, 14 Nov 2023 14:01:02 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1r2tyQ-0002ID-NV; Tue, 14 Nov 2023 14:01:02 +0000
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
X-Inumbo-ID: 46674327-82f6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=LAYrzNJ1fYRbLdxpkbpHhbCzfoPYG95/y4+xPEqM1vI=; b=hWRCVd2GRTveuTBRiTi5kBoV/7
	fITfCpThEI0pyYXQz0XzZ8N7yrbJr+hmqA1QLZiV9izxGq69FzULvUohGJ2OugtjnWU+mrEviSwyj
	LI9oLKHw9fAA2nEpmhJ7xLt9sILaSzBVVGaTtaPF31OwRQuQYmSQ3/GU282l5ZdC1sak=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 446 v2 (CVE-2023-46836) - x86: BTC/SRSO
 fixes not fully effective
Message-Id: <E1r2tyQ-0002ID-NV@xenbits.xenproject.org>
Date: Tue, 14 Nov 2023 14:01:02 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-46836 / XSA-446
                               version 2

                x86: BTC/SRSO fixes not fully effective

UPDATES IN VERSION 2
====================

Grammar fixes.

Public release.

ISSUE DESCRIPTION
=================

The fixes for XSA-422 (Branch Type Confusion) and XSA-434 (Speculative
Return Stack Overflow) are not IRQ-safe.  It was believed that the
mitigations always operated in contexts with IRQs disabled.

However, the original XSA-254 fix for Meltdown (XPTI) deliberately left
interrupts enabled on two entry paths; one unconditionally, and one
conditionally on whether XPTI was active.

As BTC/SRSO and Meltdown affect different CPU vendors, the mitigations
are not active together by default.  Therefore, there is a race
condition whereby a malicious PV guest can bypass BTC/SRSO protections
and launch a BTC/SRSO attack against Xen.

IMPACT
======

An attacker in a PV guest might be able to infer the contents of memory
belonging to other guests.

VULNERABLE SYSTEMS
==================

All versions of Xen are vulnerable.

Xen is only vulnerable in default configurations on AMD and Hygon CPUs.

Xen is not believed to be vulnerable in default configurations on CPUs
from other hardware vendors.

Only PV guests can leverage the vulnerability.

MITIGATION
==========

Running only HVM or PVH VMs will avoid the vulnerability.

CREDITS
=======

This issue was discovered by Andrew Cooper of XenServer.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa446.patch           xen-unstable - Xen 4.15.x

$ sha256sum xsa446*
ed27ad5f36af31233e25c80daefb8b0078eeb18cacbc1923fdd6f10f0b394201  xsa446.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmVTfRgMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZfLoH/iZJzkNK4d6vUrx8F5Srm8mAIDMGL4fPvJz00IsO
7h7+/wz0+FdnaWgT/12kHjIJv7p38rNkyJ3UC3p55NFFGUXKQxaKjJ6YU70IdHmY
zbQDdYd2eB9dGbAq2NEkZibtg5mhhThBsQw9Sf+YZuSzOV5xRWiEhnBGz7l4+Dym
bM7vuusZo3/iUc0WgE+p+j85QmzgTFdt7VEUYY2mSTFud+hDYtvx62Ej3AkwCRdu
I0JbGYcRaDR9RPDae2d9yvz0+E473rFgOSX6DqZLjnQ+UQivZ7eo8soJD87qY4Jh
OrEDMQWysSNiT90NYWZ+HxsRRZVjPVPoxX6EWEkwC7+CffI=
=2Xtx
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa446.patch"
Content-Disposition: attachment; filename="xsa446.patch"
Content-Transfer-Encoding: base64

RnJvbSA4MGQ1YWFkYTU5OGMzYTgwMGEzNTAwMDNkNWQ1ODI5MzE1NDVlMTNj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpEYXRlOiBUaHUsIDI2IE9j
dCAyMDIzIDE0OjM3OjM4ICswMTAwClN1YmplY3Q6IFtQQVRDSF0geDg2L3Nw
ZWMtY3RybDogUmVtb3ZlIGNvbmRpdGlvbmFsIElSUXMtb24tbmVzcyBmb3Ig
SU5UCiAkMHg4MC8weDgyIHBhdGhzCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CgpCZWZvcmUgc3BlY3VsYXRpb24gZGVm
ZW5jZXMsIHNvbWUgcGF0aHMgaW4gWGVuIGNvdWxkIGdlbnVpbmVseSBnZXQg
YXdheSB3aXRoCmJlaW5nIElSUXMtb24gYXQgZW50cnkuICBCdXQgWFBUSSBp
bnZhbGlkYXRlZCB0aGlzIHByb3BlcnR5IG9uIG1vc3QgcGF0aHMsIGFuZAph
dHRlbXB0aW5nIHRvIG1haW50YWluIGl0IG9uIHRoZSByZW1haW5pbmcgcGF0
aHMgd2FzIGEgbWlzdGFrZS4KCkZhc3QgZm9yd2FyZCwgYW5kIERPX1NQRUNf
Q1RSTF9DT05EX0lCUEIgKHByb3RlY3Rpb24gZm9yIEFNRCBCVEMvU1JTTykg
aXMgbm90CklSUS1zYWZlLCBydW5uaW5nIHdpdGggSVJRcyBlbmFibGVkIGlu
IHNvbWUgY2FzZXMuICBUaGUgb3RoZXIgYWN0aW9ucyB0YWtlbiBvbgp0aGVz
ZSBwYXRocyBoYXBwZW4gdG8gYmUgSVJRLXNhZmUuCgpNYWtlIGVudHJ5X2lu
dDgyKCkgYW5kIGludDgwX2RpcmVjdF90cmFwKCkgdW5jb25kaXRpb25hbGx5
IEludGVycnVwdCBHYXRlcwpyYXRoZXIgdGhhbiBUcmFwIEdhdGVzLiAgUmVt
b3ZlIHRoZSBjb25kaXRpb25hbCByZS1hZGp1c3RtZW50IG9mCmludDgwX2Rp
cmVjdF90cmFwKCkgaW4gc21wX3ByZXBhcmVfY3B1cygpLCBhbmQgaGF2ZSBl
bnRyeV9pbnQ4MigpIGV4cGxpY2l0bHkKZW5hYmxlIGludGVycnVwdHMgd2hl
biBzYWZlIHRvIGRvIHNvLgoKSW4gc21wX3ByZXBhcmVfY3B1cygpLCB3aXRo
IHRoZSBjb25kaXRpb25hbCByZS1hZGp1c3RtZW50IHJlbW92ZWQsIHRoZQpj
bGVhcmluZyBvZiBwdl9jcjMgaXMgdGhlIG9ubHkgcmVtYWluaW5nIGFjdGlv
biBnYXRlZCBvbiBYUFRJLCBhbmQgaXQgaXMgb3V0Cm9mIHBsYWNlIGFueXdh
eSwgcmVwZWF0aW5nIHdvcmsgYWxyZWFkeSBkb25lIGJ5IHNtcF9wcmVwYXJl
X2Jvb3RfY3B1KCkuICBEcm9wCnRoZSBlbnRpcmUgaWYoKSBjb25kaXRpb24g
dG8gYXZvaWQgbGVhdmluZyBhbiBpbmNvcnJlY3QgdmVzdGlnaWFsIHJlbW5h
bnQuCgpBbHNvIGRyb3AgY29tbWVudHMgd2hpY2ggbWFrZSBpbmNvcnJlY3Qg
c3RhdGVtZW50cyBhYm91dCB3aGVuIGl0cyBzYWZlIHRvCmVuYWJsZSBpbnRl
cnJ1cHRzLgoKVGhpcyBpcyBYU0EtNDQ2IC8gQ1ZFLTIwMjMtNDY4MzYKClNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvcHYvdHJhcHMu
YyAgICAgICAgICAgIHwgIDQgKystLQogeGVuL2FyY2gveDg2L3NtcGJvb3Qu
YyAgICAgICAgICAgICB8IDE0IC0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJjaC94
ODYveDg2XzY0L2NvbXBhdC9lbnRyeS5TIHwgIDIgKysKIHhlbi9hcmNoL3g4
Ni94ODZfNjQvZW50cnkuUyAgICAgICAgfCAgMSAtCiA0IGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L3B2L3RyYXBzLmMgYi94ZW4vYXJjaC94ODYv
cHYvdHJhcHMuYwppbmRleCA3NGYzMzNkYTdlMWMuLjI0MGQxYTJkYjdhMyAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L3RyYXBzLmMKKysrIGIveGVu
L2FyY2gveDg2L3B2L3RyYXBzLmMKQEAgLTEzOSwxMSArMTM5LDExIEBAIHZv
aWQgX19pbml0IHB2X3RyYXBfaW5pdCh2b2lkKQogI2lmZGVmIENPTkZJR19Q
VjMyCiAgICAgLyogVGhlIDMyLW9uLTY0IGh5cGVyY2FsbCB2ZWN0b3IgaXMg
b25seSBhY2Nlc3NpYmxlIGZyb20gcmluZyAxLiAqLwogICAgIF9zZXRfZ2F0
ZShpZHRfdGFibGUgKyBIWVBFUkNBTExfVkVDVE9SLAotICAgICAgICAgICAg
ICBTWVNfREVTQ190cmFwX2dhdGUsIDEsIGVudHJ5X2ludDgyKTsKKyAgICAg
ICAgICAgICAgU1lTX0RFU0NfaXJxX2dhdGUsIDEsIGVudHJ5X2ludDgyKTsK
ICNlbmRpZgogCiAgICAgLyogRmFzdCB0cmFwIGZvciBpbnQ4MCAoZmFzdGVy
IHRoYW4gdGFraW5nIHRoZSAjR1AtZml4dXAgcGF0aCkuICovCi0gICAgX3Nl
dF9nYXRlKGlkdF90YWJsZSArIExFR0FDWV9TWVNDQUxMX1ZFQ1RPUiwgU1lT
X0RFU0NfdHJhcF9nYXRlLCAzLAorICAgIF9zZXRfZ2F0ZShpZHRfdGFibGUg
KyBMRUdBQ1lfU1lTQ0FMTF9WRUNUT1IsIFNZU19ERVNDX2lycV9nYXRlLCAz
LAogICAgICAgICAgICAgICAmaW50ODBfZGlyZWN0X3RyYXApOwogCiAgICAg
b3Blbl9zb2Z0aXJxKE5NSV9TT0ZUSVJRLCBubWlfc29mdGlycSk7CmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2
L3NtcGJvb3QuYwppbmRleCAzYTFhNjU5MDgyYzYuLjRjNTRlY2JjOTFkNyAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCkBAIC0xMTU4LDIwICsxMTU4LDYgQEAgdm9p
ZCBfX2luaXQgc21wX3ByZXBhcmVfY3B1cyh2b2lkKQogCiAgICAgc3RhY2tf
YmFzZVswXSA9ICh2b2lkICopKCh1bnNpZ25lZCBsb25nKXN0YWNrX3N0YXJ0
ICYgfihTVEFDS19TSVpFIC0gMSkpOwogCi0gICAgaWYgKCBvcHRfeHB0aV9o
d2RvbSB8fCBvcHRfeHB0aV9kb211ICkKLSAgICB7Ci0gICAgICAgIGdldF9j
cHVfaW5mbygpLT5wdl9jcjMgPSAwOwotCi0jaWZkZWYgQ09ORklHX1BWCi0g
ICAgICAgIC8qCi0gICAgICAgICAqIEFsbCBlbnRyeSBwb2ludHMgd2hpY2gg
bWF5IG5lZWQgdG8gc3dpdGNoIHBhZ2UgdGFibGVzIGhhdmUgdG8gc3RhcnQK
LSAgICAgICAgICogd2l0aCBpbnRlcnJ1cHRzIG9mZi4gUmUtd3JpdGUgd2hh
dCBwdl90cmFwX2luaXQoKSBoYXMgcHV0IHRoZXJlLgotICAgICAgICAgKi8K
LSAgICAgICAgX3NldF9nYXRlKGlkdF90YWJsZSArIExFR0FDWV9TWVNDQUxM
X1ZFQ1RPUiwgU1lTX0RFU0NfaXJxX2dhdGUsIDMsCi0gICAgICAgICAgICAg
ICAgICAmaW50ODBfZGlyZWN0X3RyYXApOwotI2VuZGlmCi0gICAgfQotCiAg
ICAgc2V0X25yX3NvY2tldHMoKTsKIAogICAgIHNvY2tldF9jcHVtYXNrID0g
eHphbGxvY19hcnJheShjcHVtYXNrX3QgKiwgbnJfc29ja2V0cyk7CmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L2NvbXBhdC9lbnRyeS5TIGIv
eGVuL2FyY2gveDg2L3g4Nl82NC9jb21wYXQvZW50cnkuUwppbmRleCBiZDVh
YmQ4MDQwYmQuLmZjYzNhNzIxZjE0NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L3g4Nl82NC9jb21wYXQvZW50cnkuUworKysgYi94ZW4vYXJjaC94ODYv
eDg2XzY0L2NvbXBhdC9lbnRyeS5TCkBAIC0yMSw2ICsyMSw4IEBAIEVOVFJZ
KGVudHJ5X2ludDgyKQogICAgICAgICBTUEVDX0NUUkxfRU5UUllfRlJPTV9Q
ViAvKiBSZXE6ICVyc3A9cmVncy9jcHVpbmZvLCAlcmR4PTAsIENsb2I6IGFj
ZCAqLwogICAgICAgICAvKiBXQVJOSU5HISBgcmV0YCwgYGNhbGwgKmAsIGBq
bXAgKmAgbm90IHNhZmUgYmVmb3JlIHRoaXMgcG9pbnQuICovCiAKKyAgICAg
ICAgc3RpCisKICAgICAgICAgQ1I0X1BWMzJfUkVTVE9SRQogCiAgICAgICAg
IEdFVF9DVVJSRU5UKGJ4KQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4
Nl82NC9lbnRyeS5TIGIveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCmlu
ZGV4IDVjYTc0ZjVmNjJiMi4uOWE3YjEyOWFhN2U0IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYveDg2XzY0L2VudHJ5LlMKKysrIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9lbnRyeS5TCkBAIC0zMjcsNyArMzI3LDYgQEAgRU5UUlkoc3lz
ZW50ZXJfZW50cnkpCiAjaWZkZWYgQ09ORklHX1hFTl9TSFNUSwogICAgICAg
ICBBTFRFUk5BVElWRSAiIiwgInNldHNzYnN5IiwgWDg2X0ZFQVRVUkVfWEVO
X1NIU1RLCiAjZW5kaWYKLSAgICAgICAgLyogc3RpIGNvdWxkIGxpdmUgaGVy
ZSB3aGVuIHdlIGRvbid0IHN3aXRjaCBwYWdlIHRhYmxlcyBiZWxvdy4gKi8K
ICAgICAgICAgcHVzaHEgJEZMQVRfVVNFUl9TUwogICAgICAgICBwdXNocSAk
MAogICAgICAgICBwdXNoZnEKCmJhc2UtY29tbWl0OiA3YmVmZWY4N2NjOWIx
YmI4Y2ExNWQ4NjZjZTFlY2Q5MTY1Y2NiNThjCnByZXJlcXVpc2l0ZS1wYXRj
aC1pZDogMTQyYTg3YzcwNzQxMWQ0OWUxMzZjM2ZiNzZmMWIxNDk2M2VjNmRj
OAotLSAKMi4zMC4yCgo=

--=separator--

