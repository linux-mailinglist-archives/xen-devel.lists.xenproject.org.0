Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3640531CA9E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 13:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85636.160596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzdM-0004Ti-Gc; Tue, 16 Feb 2021 12:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85636.160596; Tue, 16 Feb 2021 12:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzdM-0004Sq-9h; Tue, 16 Feb 2021 12:39:16 +0000
Received: by outflank-mailman (input) for mailman id 85636;
 Tue, 16 Feb 2021 12:39:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y7oK=HS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lBzaW-0001zG-R3
 for xen-devel@lists.xen.org; Tue, 16 Feb 2021 12:36:20 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 058e238a-214d-4b02-9732-042ee8802a6c;
 Tue, 16 Feb 2021 12:35:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZi-0008Mp-47; Tue, 16 Feb 2021 12:35:30 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZi-0002aT-2R; Tue, 16 Feb 2021 12:35:30 +0000
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
X-Inumbo-ID: 058e238a-214d-4b02-9732-042ee8802a6c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=lZWifSAdWtqIapxaF/ABMz5U1NS2kxDVUZoclZKPguo=; b=3nniZQLh/q0JG34VPD0xs4VeUH
	HRegZFYig+FQgXOTHx7CBcDBYFzPhSB9NE/4qvF9EaEZzkFN4C7HWi+Ijs4luDq/2w1LavEck4otJ
	K5LTGecfopcu3c7q8XREM2KCw7iwukc1ZQArBpWjLiqQSujSvRNvJ+g9EccWSLbSk00g=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 362 v3 (CVE-2021-26931) - Linux: backends
 treating grant mapping errors as bugs
Message-Id: <E1lBzZi-0002aT-2R@xenbits.xenproject.org>
Date: Tue, 16 Feb 2021 12:35:30 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-26931 / XSA-362
                               version 3

         Linux: backends treating grant mapping errors as bugs

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Block, net, and SCSI backends consider certain errors a plain bug,
deliberately causing a kernel crash.  For errors potentially being at
least under the influence of guests, like out of memory conditions, it
isn't correct to assume so.  Memory allocations potentially causing
such crashes occur only when Linux is running in PV mode, though.

IMPACT
======

A malicious or buggy frontend driver may be able to crash the
corresponding backend driver, potentially affecting the entire domain
running the backend driver.

VULNERABLE SYSTEMS
==================

Linux versions from at least 2.6.39 onwards are vulnerable, when run in
PV mode.  Earlier versions differ significantly in behavior and may
therefore instead surface other issues under the same conditions.  Linux
run in HVM / PVH modes is not vulnerable.

MITIGATION
==========

For Linux, running the backends in HVM or PVH domains will avoid the
vulnerability.

For protocols where non-Linux-kernel based backends are available,
reconfiguring guests to use alternative (e.g. qemu-based) backends may
allow to avoid the vulnerability.

In all other cases there is no known mitigation.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the appropriate attached patches resolves this issue.

Applying the attached patches resolves this issue.

xsa362-linux-1.patch           Linux 5.11-rc - 5.10
xsa362-linux-2.patch           Linux 5.11-rc - 3.16
xsa362-linux-3.patch           Linux 5.11-rc - 4.1

$ sha256sum xsa362*
d64334807f16ff9909503b3cc9b8b93fd42d2c36e1fb0e508b89a765a53071a8  xsa362-linux-1.patch
b6d02952e7fbede55b868cb2dc4d8853284996883dc72518a0cd5b14d6c7fdd4  xsa362-linux-2.patch
0a2661380d8f786fefe12e5a8b1528d4a79f1ad058c26b417c52449a7e16a302  xsa362-linux-3.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

Deployment of the mitigation to switch to HVM / PVH backend domains
is also permitted during the embargo, even on public-facing systems with
untrusted guest users and administrators.

HOWEVER, deployment of the non-kernel-based backends mitigation
described above is NOT permitted during the embargo on public-facing
systems with untrusted guest users and administrators.  This is because
such a configuration change may be recognizable by the affected guests.

AND: Distribution of updated software is prohibited (except to other
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmAru/UMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZszQH/jwCgehGBbejtpFjiOqEPdqIQhd0X+Q1feFD9PB6
07gfGanmSds5mitr0ezTHbfLw85CoFbAJhalNdx9XeQrZTIvRAizkCi779rE9UYZ
H0CN73GoObF4E8q+tVRpZni0Rcnb77bETRsmlYjRYRjtZNZ1+7vbn4tf4JMccoo0
qhz1/bqY3e4yHPcdxb9P3T/DQKNG+nJjkn4kNueYo1PUGUetxw6HXbXWHh6WvbOr
mfd+sTxRSf+Nk2OZhtofjIYEIeL058axZoSuARBIPphBmOCumUTGzrypZwe5BTuF
GMQqlguxPU0rFscGd/Js05suFhQQR4ccJlSGRs7pswt9i0M=
=KnG3
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa362-linux-1.patch"
Content-Disposition: attachment; filename="xsa362-linux-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4tYmxrYmFjazogZG9uJ3QgImhhbmRsZSIgZXJyb3IgYnkgQlVHKCkK
CkluIHBhcnRpY3VsYXIgLUVOT01FTSBtYXkgY29tZSBiYWNrIGhlcmUsIGZy
b20gc2V0X2ZvcmVpZ25fcDJtX21hcHBpbmcoKS4KRG9uJ3QgbWFrZSBwcm9i
bGVtcyB3b3JzZSwgdGhlIG1vcmUgdGhhdCBoYW5kbGluZyBlbHNld2hlcmUg
KHRvZ2V0aGVyCndpdGggbWFwJ3Mgc3RhdHVzIGZpZWxkcyBub3cgaW5kaWNh
dGluZyB3aGV0aGVyIGEgbWFwcGluZyB3YXNuJ3QgZXZlbgphdHRlbXB0ZWQs
IGFuZCBoZW5jZSBoYXMgdG8gYmUgY29uc2lkZXJlZCBmYWlsZWQpIGRvZXNu
J3QgcmVxdWlyZSB0aGlzCm9kZCB3YXkgb2YgZGVhbGluZyB3aXRoIGVycm9y
cy4KClRoaXMgaXMgcGFydCBvZiBYU0EtMzYyLgoKU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFj
ay9ibGtiYWNrLmMKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9i
bGtiYWNrLmMKQEAgLTgxMSwxMCArODExLDggQEAgYWdhaW46CiAJCQlicmVh
azsKIAl9CiAKLQlpZiAoc2Vnc190b19tYXApIHsKKwlpZiAoc2Vnc190b19t
YXApCiAJCXJldCA9IGdudHRhYl9tYXBfcmVmcyhtYXAsIE5VTEwsIHBhZ2Vz
X3RvX2dudCwgc2Vnc190b19tYXApOwotCQlCVUdfT04ocmV0KTsKLQl9CiAK
IAkvKgogCSAqIE5vdyBzd2l6emxlIHRoZSBNRk4gaW4gb3VyIGRvbWFpbiB3
aXRoIHRoZSBNRk4gZnJvbSB0aGUgb3RoZXIgZG9tYWluCkBAIC04MzAsNyAr
ODI4LDcgQEAgYWdhaW46CiAJCQkJZ250dGFiX3BhZ2VfY2FjaGVfcHV0KCZy
aW5nLT5mcmVlX3BhZ2VzLAogCQkJCQkJICAgICAgJnBhZ2VzW3NlZ19pZHhd
LT5wYWdlLCAxKTsKIAkJCQlwYWdlc1tzZWdfaWR4XS0+aGFuZGxlID0gQkxL
QkFDS19JTlZBTElEX0hBTkRMRTsKLQkJCQlyZXQgfD0gMTsKKwkJCQlyZXQg
fD0gIXJldDsKIAkJCQlnb3RvIG5leHQ7CiAJCQl9CiAJCQlwYWdlc1tzZWdf
aWR4XS0+aGFuZGxlID0gbWFwW25ld19tYXBfaWR4XS5oYW5kbGU7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa362-linux-2.patch"
Content-Disposition: attachment; filename="xsa362-linux-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4tbmV0YmFjazogZG9uJ3QgImhhbmRsZSIgZXJyb3IgYnkgQlVHKCkK
CkluIHBhcnRpY3VsYXIgLUVOT01FTSBtYXkgY29tZSBiYWNrIGhlcmUsIGZy
b20gc2V0X2ZvcmVpZ25fcDJtX21hcHBpbmcoKS4KRG9uJ3QgbWFrZSBwcm9i
bGVtcyB3b3JzZSwgdGhlIG1vcmUgdGhhdCBoYW5kbGluZyBlbHNld2hlcmUg
KHRvZ2V0aGVyCndpdGggbWFwJ3Mgc3RhdHVzIGZpZWxkcyBub3cgaW5kaWNh
dGluZyB3aGV0aGVyIGEgbWFwcGluZyB3YXNuJ3QgZXZlbgphdHRlbXB0ZWQs
IGFuZCBoZW5jZSBoYXMgdG8gYmUgY29uc2lkZXJlZCBmYWlsZWQpIGRvZXNu
J3QgcmVxdWlyZSB0aGlzCm9kZCB3YXkgb2YgZGVhbGluZyB3aXRoIGVycm9y
cy4KClRoaXMgaXMgcGFydCBvZiBYU0EtMzYyLgoKU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
bmV0YmFjay5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJh
Y2suYwpAQCAtMTM0MiwxMyArMTM0MiwxMSBAQCBpbnQgeGVudmlmX3R4X2Fj
dGlvbihzdHJ1Y3QgeGVudmlmX3F1ZXVlCiAJCXJldHVybiAwOwogCiAJZ250
dGFiX2JhdGNoX2NvcHkocXVldWUtPnR4X2NvcHlfb3BzLCBucl9jb3BzKTsK
LQlpZiAobnJfbW9wcyAhPSAwKSB7CisJaWYgKG5yX21vcHMgIT0gMCkKIAkJ
cmV0ID0gZ250dGFiX21hcF9yZWZzKHF1ZXVlLT50eF9tYXBfb3BzLAogCQkJ
CSAgICAgIE5VTEwsCiAJCQkJICAgICAgcXVldWUtPnBhZ2VzX3RvX21hcCwK
IAkJCQkgICAgICBucl9tb3BzKTsKLQkJQlVHX09OKHJldCk7Ci0JfQogCiAJ
d29ya19kb25lID0geGVudmlmX3R4X3N1Ym1pdChxdWV1ZSk7CiAK

--=separator
Content-Type: application/octet-stream; name="xsa362-linux-3.patch"
Content-Disposition: attachment; filename="xsa362-linux-3.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4tc2NzaWJhY2s6IGRvbid0ICJoYW5kbGUiIGVycm9yIGJ5IEJVRygp
CgpJbiBwYXJ0aWN1bGFyIC1FTk9NRU0gbWF5IGNvbWUgYmFjayBoZXJlLCBm
cm9tIHNldF9mb3JlaWduX3AybV9tYXBwaW5nKCkuCkRvbid0IG1ha2UgcHJv
YmxlbXMgd29yc2UsIHRoZSBtb3JlIHRoYXQgaGFuZGxpbmcgZWxzZXdoZXJl
ICh0b2dldGhlcgp3aXRoIG1hcCdzIHN0YXR1cyBmaWVsZHMgbm93IGluZGlj
YXRpbmcgd2hldGhlciBhIG1hcHBpbmcgd2Fzbid0IGV2ZW4KYXR0ZW1wdGVk
LCBhbmQgaGVuY2UgaGFzIHRvIGJlIGNvbnNpZGVyZWQgZmFpbGVkKSBkb2Vz
bid0IHJlcXVpcmUgdGhpcwpvZGQgd2F5IG9mIGRlYWxpbmcgd2l0aCBlcnJv
cnMuCgpUaGlzIGlzIHBhcnQgb2YgWFNBLTM2Mi4KClNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KCi0tLSBhL2RyaXZlcnMveGVuL3hlbi1zY3NpYmFj
ay5jCisrKyBiL2RyaXZlcnMveGVuL3hlbi1zY3NpYmFjay5jCkBAIC0zODYs
MTIgKzM4NiwxMiBAQCBzdGF0aWMgaW50IHNjc2liYWNrX2dudHRhYl9kYXRh
X21hcF9iYXRjCiAJCXJldHVybiAwOwogCiAJZXJyID0gZ250dGFiX21hcF9y
ZWZzKG1hcCwgTlVMTCwgcGcsIGNudCk7Ci0JQlVHX09OKGVycik7CiAJZm9y
IChpID0gMDsgaSA8IGNudDsgaSsrKSB7CiAJCWlmICh1bmxpa2VseShtYXBb
aV0uc3RhdHVzICE9IEdOVFNUX29rYXkpKSB7CiAJCQlwcl9lcnIoImludmFs
aWQgYnVmZmVyIC0tIGNvdWxkIG5vdCByZW1hcCBpdFxuIik7CiAJCQltYXBb
aV0uaGFuZGxlID0gU0NTSUJBQ0tfSU5WQUxJRF9IQU5ETEU7Ci0JCQllcnIg
PSAtRU5PTUVNOworCQkJaWYgKCFlcnIpCisJCQkJZXJyID0gLUVOT01FTTsK
IAkJfSBlbHNlIHsKIAkJCWdldF9wYWdlKHBnW2ldKTsKIAkJfQo=

--=separator--

