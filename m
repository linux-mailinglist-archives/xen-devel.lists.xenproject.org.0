Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9452CB4AD15
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 14:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116444.1462801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvx1c-0005SX-I6; Tue, 09 Sep 2025 12:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116444.1462801; Tue, 09 Sep 2025 12:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvx1c-0005OZ-D0; Tue, 09 Sep 2025 12:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1116444;
 Tue, 09 Sep 2025 12:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEb6=3U=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1uvx1a-0004Tc-0O
 for xen-devel@lists.xen.org; Tue, 09 Sep 2025 12:00:38 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95a14277-8d74-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 14:00:32 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1uvx1O-001exT-1m;
 Tue, 09 Sep 2025 12:00:26 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1uvx1O-001SVn-1d;
 Tue, 09 Sep 2025 12:00:26 +0000
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
X-Inumbo-ID: 95a14277-8d74-11f0-9809-7dc792cee155
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 473 v2 (CVE-2025-58144,CVE-2025-58145) -
 Arm issues with page refcounting
Message-Id: <E1uvx1O-001SVn-1d@xenbits.xenproject.org>
Date: Tue, 09 Sep 2025 12:00:26 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

     Xen Security Advisory CVE-2025-58144,CVE-2025-58145 / XSA-473
                               version 2

                   Arm issues with page refcounting

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

There are two issues related to the mapping of pages belonging to other
domains: For one, an assertion is wrong there, where the case actually
needs handling.  A NULL pointer de-reference could result on a release
build.  This is CVE-2025-58144.

And then the P2M lock isn't held until a page reference was actually
obtained (or the attempt to do so has failed).  Otherwise the page can
not only change type, but even ownership in between, thus allowing
domain boundaries to be violated.  This is CVE-2025-58145.

IMPACT
======

An unprivileged guest can cause a hypervisor crash, causing a Denial of
Service (DoS) of the entire host.  Privilege escalation and information
leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Xen versions 4.12 and onwards are vulnerable.  Xen versions 4.11 and
earlier are not vulnerable.

Only Arm systems are affected.  x86 systems are not affected.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the appropriate set of attached patches resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa473-?.patch           xen-unstable - Xen 4.19.x
xsa473-4.18-?.patch      Xen 4.18.x - Xen 4.17.x

$ sha256sum xsa473*
e70f71258f1998eddafcdb5f4cb46d98e9dedc529f102b85dfb4e5310faf48eb  xsa473-1.patch
a501bde6ffb7391387cffe74e3eb9bd5c06d70bd7695aa811d42c75d3903fa59  xsa473-2.patch
e8a27f02e57d1a8d956cca9c9ed2db90c328911ff3a9434883baf633a0f3be5c  xsa473-4.18-1.patch
b2f6f4560d6082e0fb040f7352dda8963ab2dce207efce289131c10b69ebf656  xsa473-4.18-2.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmjAFU8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ/k0IAMjOW7n+dt0rgaRfwA7twgv8OLLOkuw/+DcPYuR0
tm43Y/5OtqThqmtVqOYdZNA91EQ2rIdh2hkhrCcLI1wrm6qWHvWw4ZUp5VMLyLka
u616++Uk3vlc3BrfVEVXzWgGOGYW1o7KP5njiTGcEMR/3BYC3bYBbrf7PHoDgSUR
xCmHB/tMCZ/XNkYly1oZntlQTyDjW4lnMJJMTJGXqVOviXmpGs52PRsiClk5kUuB
HU8wPkjpw2VQR43iJQWkLQykHnTGWWW/V271br1cJVDHylKaAxETBDUu44JkXTHx
voqmAG9cwm6K5Rlh6junqnfW6+UOe6Ib+FGmRXcBZ8zRAV4=
=Mloq
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa473-1.patch"
Content-Disposition: attachment; filename="xsa473-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBBcm06IGZvcmVpZ24gcGFnZSBoYW5kbGluZyBpbiBwMm1fZ2V0X3BhZ2Vf
ZnJvbV9nZm4oKQoKSSBjYW4ndCBzZWUgd2hhdCB3b3VsZCBtYWtlIHRoZSAx
c3Qgb2YgdGhlIGFzc2VydGlvbnMgc2FmZTogRm9yIGV4YW1wbGUsCnRoZSBQ
Mk0gbG9jayBub3QgYmVpbmcgaGVsZCwgdGhlIGZvcmVpZ24gcGFnZSBtYXkg
ZGlzYXBwZWFyIGJlZm9yZSB3ZQpnZXQgdG8gY2FsbCBwYWdlX2dldF9vd25l
cl9hbmRfcmVmZXJlbmNlKCksIHdoaWNoIGhlbmNlIG1heSByZXR1cm4gTlVM
TC4KCkV2ZW4gdGhlIDJuZCwgd2hpY2ggYXBwZWFycyB0byBiZSBzYWZlIHNh
ZmUsIGlzIGxhY2tpbmcgcHJvcGVyIHJlbGVhc2UKYnVpbGQgZmFsbGJhY2tz
LgoKRHJvcCB0aGUgZm9ybWVyIGluIGZhdm9yIG9mIGFuIGlmKCksIGFuZCBj
b252ZXJ0IHRoZSBsYXR0ZXIgdG8gdGhlCmVxdWl2YWxlbnQgb2Ygd2hhdCB4
ODYgdXNlczogQVNTRVJUX1VOUkVBQ0hBQkxFKCkgcGx1cyBwdXR0aW5nIG9m
IHRoZQpvYnRhaW5lZCBwYWdlLgoKVGhpcyBpcyBDVkUtMjAyNS01ODE0NCAv
IHBhcnQgb2YgWFNBLTQ3My4KCkZpeGVzOiA5NDg2YThkMDdiYTggKCJ4ZW4v
YXJtOiBIYW5kbGUgcmVtb3ZlIGZvcmVpZ24gbWFwcGluZyIpClNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3
ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgotLS0g
YS94ZW4vYXJjaC9hcm0vcDJtLmMKKysrIGIveGVuL2FyY2gvYXJtL3AybS5j
CkBAIC03NCwxMCArNzQsMTYgQEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dl
dF9wYWdlX2Zyb21fZ2ZuKAogICAgICAqLwogICAgIGlmICggcDJtX2lzX2Zv
cmVpZ24ocDJtdCkgKQogICAgIHsKLSAgICAgICAgc3RydWN0IGRvbWFpbiAq
ZmRvbSA9IHBhZ2VfZ2V0X293bmVyX2FuZF9yZWZlcmVuY2UocGFnZSk7Ci0g
ICAgICAgIEFTU0VSVChmZG9tICE9IE5VTEwpOwotICAgICAgICBBU1NFUlQo
ZmRvbSAhPSBkKTsKLSAgICAgICAgcmV0dXJuIHBhZ2U7CisgICAgICAgIGNv
bnN0IHN0cnVjdCBkb21haW4gKmZkb20gPSBwYWdlX2dldF9vd25lcl9hbmRf
cmVmZXJlbmNlKHBhZ2UpOworCisgICAgICAgIGlmICggZmRvbSApCisgICAg
ICAgIHsKKyAgICAgICAgICAgIGlmICggZmRvbSAhPSBkICkKKyAgICAgICAg
ICAgICAgICByZXR1cm4gcGFnZTsKKyAgICAgICAgICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOworICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7CisgICAg
ICAgIH0KKyAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgfQogCiAgICAgcmV0
dXJuIGdldF9wYWdlKHBhZ2UsIGQpID8gcGFnZSA6IE5VTEw7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa473-2.patch"
Content-Disposition: attachment; filename="xsa473-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBBcm06IGFkanVzdCBsb2NraW5nIGluIHAybV9nZXRfcGFnZV9mcm9tX2dm
bigpCgpJbiBvcmRlciB0byBzYWZlbHkgYWNxdWlyZSBhIHJlZmVyZW5jZSBm
b3IgYSBmb3JlaWduIHBhZ2UgbWFwcGluZywgdGhlClAyTSBsb2NrIG5lZWRz
IHRvIGJlIGhlbGQgdW50aWwgd2UgaGF2ZSB0aGUgcmVmZXJlbmNlIGluIGhh
bmQgKG9yCmdldHRpbmcgb25lIGZhaWxlZCkuIE90aGVyd2lzZSB0aGUgcGFn
ZSBjYW4gY2hhbmdlIFAyTSB0eXBlIGFuZApvd25lcnNoaXAgaW4gYmV0d2Vl
bi4KClRoaXMgaXMgQ1ZFLTIwMjUtNTgxNDUgLyBwYXJ0IG9mIFhTQS00NzMu
CgpGaXhlczogOTQ4NmE4ZDA3YmE4ICgieGVuL2FybTogSGFuZGxlIHJlbW92
ZSBmb3JlaWduIG1hcHBpbmciKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgoKLS0tIGEveGVuL2FyY2gvYXJtL3Ay
bS5jCisrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwpAQCAtNTMsMTggKzUzLDIy
IEBAIG1mbl90IHAybV9sb29rdXAoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QK
IHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbihzdHJ1
Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCAqdCkKIHsKKyAgICBz
dHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwog
ICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7CiAgICAgcDJtX3R5cGVfdCBw
Mm10OwotICAgIG1mbl90IG1mbiA9IHAybV9sb29rdXAoZCwgZ2ZuLCAmcDJt
dCk7CisgICAgbWZuX3QgbWZuOworCisgICAgcDJtX3JlYWRfbG9jayhwMm0p
OworICAgIG1mbiA9IHAybV9nZXRfZW50cnkocDJtLCBnZm4sICZwMm10LCBO
VUxMLCBOVUxMLCBOVUxMKTsKIAogICAgIGlmICggdCApCiAgICAgICAgICp0
ID0gcDJtdDsKIAotICAgIGlmICggIXAybV9pc19hbnlfcmFtKHAybXQpICkK
LSAgICAgICAgcmV0dXJuIE5VTEw7Ci0KLSAgICBpZiAoICFtZm5fdmFsaWQo
bWZuKSApCisgICAgaWYgKCAhcDJtX2lzX2FueV9yYW0ocDJtdCkgfHwgIW1m
bl92YWxpZChtZm4pICkKKyAgICB7CisgICAgICAgIHAybV9yZWFkX3VubG9j
ayhwMm0pOwogICAgICAgICByZXR1cm4gTlVMTDsKKyAgICB9CiAKICAgICBw
YWdlID0gbWZuX3RvX3BhZ2UobWZuKTsKIApAQCAtNzYsNiArODAsOCBAQCBz
dHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCiAgICAg
ewogICAgICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpmZG9tID0gcGFnZV9n
ZXRfb3duZXJfYW5kX3JlZmVyZW5jZShwYWdlKTsKIAorICAgICAgICBwMm1f
cmVhZF91bmxvY2socDJtKTsKKwogICAgICAgICBpZiAoIGZkb20gKQogICAg
ICAgICB7CiAgICAgICAgICAgICBpZiAoIGZkb20gIT0gZCApCkBAIC04Niw2
ICs5Miw4IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9t
X2dmbigKICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgfQogCisgICAgcDJt
X3JlYWRfdW5sb2NrKHAybSk7CisKICAgICByZXR1cm4gZ2V0X3BhZ2UocGFn
ZSwgZCkgPyBwYWdlIDogTlVMTDsKIH0KIAo=

--=separator
Content-Type: application/octet-stream; name="xsa473-4.18-1.patch"
Content-Disposition: attachment; filename="xsa473-4.18-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBBcm06IGZvcmVpZ24gcGFnZSBoYW5kbGluZyBpbiBwMm1fZ2V0X3BhZ2Vf
ZnJvbV9nZm4oKQoKSSBjYW4ndCBzZWUgd2hhdCB3b3VsZCBtYWtlIHRoZSAx
c3Qgb2YgdGhlIGFzc2VydGlvbnMgc2FmZTogRm9yIGV4YW1wbGUsCnRoZSBQ
Mk0gbG9jayBub3QgYmVpbmcgaGVsZCwgdGhlIGZvcmVpZ24gcGFnZSBtYXkg
ZGlzYXBwZWFyIGJlZm9yZSB3ZQpnZXQgdG8gY2FsbCBwYWdlX2dldF9vd25l
cl9hbmRfcmVmZXJlbmNlKCksIHdoaWNoIGhlbmNlIG1heSByZXR1cm4gTlVM
TC4KCkV2ZW4gdGhlIDJuZCwgd2hpY2ggYXBwZWFycyB0byBiZSBzYWZlIHNh
ZmUsIGlzIGxhY2tpbmcgcHJvcGVyIHJlbGVhc2UKYnVpbGQgZmFsbGJhY2tz
LgoKRHJvcCB0aGUgZm9ybWVyIGluIGZhdm9yIG9mIGFuIGlmKCksIGFuZCBj
b252ZXJ0IHRoZSBsYXR0ZXIgdG8gdGhlCmVxdWl2YWxlbnQgb2Ygd2hhdCB4
ODYgdXNlczogQVNTRVJUX1VOUkVBQ0hBQkxFKCkgcGx1cyBwdXR0aW5nIG9m
IHRoZQpvYnRhaW5lZCBwYWdlLgoKVGhpcyBpcyBDVkUtMjAyNS01ODE0NCAv
IHBhcnQgb2YgWFNBLTQ3My4KCkZpeGVzOiA5NDg2YThkMDdiYTggKCJ4ZW4v
YXJtOiBIYW5kbGUgcmVtb3ZlIGZvcmVpZ24gbWFwcGluZyIpClNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3
ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgotLS0g
YS94ZW4vYXJjaC9hcm0vcDJtLmMKKysrIGIveGVuL2FyY2gvYXJtL3AybS5j
CkBAIC02MTIsMTAgKzYxMiwxNiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1f
Z2V0X3BhZ2VfZnJvbV9nZm4oCiAgICAgICovCiAgICAgaWYgKCBwMm1faXNf
Zm9yZWlnbihwMm10KSApCiAgICAgewotICAgICAgICBzdHJ1Y3QgZG9tYWlu
ICpmZG9tID0gcGFnZV9nZXRfb3duZXJfYW5kX3JlZmVyZW5jZShwYWdlKTsK
LSAgICAgICAgQVNTRVJUKGZkb20gIT0gTlVMTCk7Ci0gICAgICAgIEFTU0VS
VChmZG9tICE9IGQpOwotICAgICAgICByZXR1cm4gcGFnZTsKKyAgICAgICAg
Y29uc3Qgc3RydWN0IGRvbWFpbiAqZmRvbSA9IHBhZ2VfZ2V0X293bmVyX2Fu
ZF9yZWZlcmVuY2UocGFnZSk7CisKKyAgICAgICAgaWYgKCBmZG9tICkKKyAg
ICAgICAgeworICAgICAgICAgICAgaWYgKCBmZG9tICE9IGQgKQorICAgICAg
ICAgICAgICAgIHJldHVybiBwYWdlOworICAgICAgICAgICAgQVNTRVJUX1VO
UkVBQ0hBQkxFKCk7CisgICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKKyAg
ICAgICAgfQorICAgICAgICByZXR1cm4gTlVMTDsKICAgICB9CiAKICAgICBy
ZXR1cm4gZ2V0X3BhZ2UocGFnZSwgZCkgPyBwYWdlIDogTlVMTDsK

--=separator
Content-Type: application/octet-stream; name="xsa473-4.18-2.patch"
Content-Disposition: attachment; filename="xsa473-4.18-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBBcm06IGFkanVzdCBsb2NraW5nIGluIHAybV9nZXRfcGFnZV9mcm9tX2dm
bigpCgpJbiBvcmRlciB0byBzYWZlbHkgYWNxdWlyZSBhIHJlZmVyZW5jZSBm
b3IgYSBmb3JlaWduIHBhZ2UgbWFwcGluZywgdGhlClAyTSBsb2NrIG5lZWRz
IHRvIGJlIGhlbGQgdW50aWwgd2UgaGF2ZSB0aGUgcmVmZXJlbmNlIGluIGhh
bmQgKG9yCmdldHRpbmcgb25lIGZhaWxlZCkuIE90aGVyd2lzZSB0aGUgcGFn
ZSBjYW4gY2hhbmdlIFAyTSB0eXBlIGFuZApvd25lcnNoaXAgaW4gYmV0d2Vl
bi4KClRoaXMgaXMgQ1ZFLTIwMjUtNTgxNDUgLyBwYXJ0IG9mIFhTQS00NzMu
CgpGaXhlczogOTQ4NmE4ZDA3YmE4ICgieGVuL2FybTogSGFuZGxlIHJlbW92
ZSBmb3JlaWduIG1hcHBpbmciKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgoKLS0tIGEveGVuL2FyY2gvYXJtL3Ay
bS5jCisrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwpAQCAtNTkxLDE4ICs1OTEs
MjIgQEAgbWZuX3QgcDJtX2xvb2t1cChzdHJ1Y3QgZG9tYWluICpkLCBnZm5f
dAogc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9wYWdlX2Zyb21fZ2ZuKHN0
cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90ICp0KQogeworICAg
IHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7
CiAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKICAgICBwMm1fdHlwZV90
IHAybXQ7Ci0gICAgbWZuX3QgbWZuID0gcDJtX2xvb2t1cChkLCBnZm4sICZw
Mm10KTsKKyAgICBtZm5fdCBtZm47CisKKyAgICBwMm1fcmVhZF9sb2NrKHAy
bSk7CisgICAgbWZuID0gcDJtX2dldF9lbnRyeShwMm0sIGdmbiwgJnAybXQs
IE5VTEwsIE5VTEwsIE5VTEwpOwogCiAgICAgaWYgKCB0ICkKICAgICAgICAg
KnQgPSBwMm10OwogCi0gICAgaWYgKCAhcDJtX2lzX2FueV9yYW0ocDJtdCkg
KQotICAgICAgICByZXR1cm4gTlVMTDsKLQotICAgIGlmICggIW1mbl92YWxp
ZChtZm4pICkKKyAgICBpZiAoICFwMm1faXNfYW55X3JhbShwMm10KSB8fCAh
bWZuX3ZhbGlkKG1mbikgKQorICAgIHsKKyAgICAgICAgcDJtX3JlYWRfdW5s
b2NrKHAybSk7CiAgICAgICAgIHJldHVybiBOVUxMOworICAgIH0KIAogICAg
IHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwogCkBAIC02MTQsNiArNjE4LDgg
QEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9wYWdlX2Zyb21fZ2ZuKAog
ICAgIHsKICAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZmRvbSA9IHBh
Z2VfZ2V0X293bmVyX2FuZF9yZWZlcmVuY2UocGFnZSk7CiAKKyAgICAgICAg
cDJtX3JlYWRfdW5sb2NrKHAybSk7CisKICAgICAgICAgaWYgKCBmZG9tICkK
ICAgICAgICAgewogICAgICAgICAgICAgaWYgKCBmZG9tICE9IGQgKQpAQCAt
NjI0LDYgKzYzMCw4IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFn
ZV9mcm9tX2dmbigKICAgICAgICAgcmV0dXJuIE5VTEw7CiAgICAgfQogCisg
ICAgcDJtX3JlYWRfdW5sb2NrKHAybSk7CisKICAgICByZXR1cm4gZ2V0X3Bh
Z2UocGFnZSwgZCkgPyBwYWdlIDogTlVMTDsKIH0KIAo=

--=separator--

