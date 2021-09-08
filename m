Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4464039BE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 14:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181843.329182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwgp-00010j-Jw; Wed, 08 Sep 2021 12:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181843.329182; Wed, 08 Sep 2021 12:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNwgp-0000xx-FE; Wed, 08 Sep 2021 12:28:31 +0000
Received: by outflank-mailman (input) for mailman id 181843;
 Wed, 08 Sep 2021 12:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aiV0=N6=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1mNwgn-0000wB-KA
 for xen-devel@lists.xen.org; Wed, 08 Sep 2021 12:28:29 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89e63179-d4a1-4c8a-a7ae-19edf7ed1ee0;
 Wed, 08 Sep 2021 12:28:23 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mNwgb-0004Q2-Do; Wed, 08 Sep 2021 12:28:17 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1mNwgb-0005t1-CE; Wed, 08 Sep 2021 12:28:17 +0000
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
X-Inumbo-ID: 89e63179-d4a1-4c8a-a7ae-19edf7ed1ee0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=+eTtHa9X8dbPGooWfB6LFRjJ0dBQugzbxCtJcYazIaI=; b=CALfCEjYZv13z/LZ0e48Yvcjbv
	fG0cfbLQApmAroNd5XRz8KxlLnPyDswqBy8fmomWKoy4NWuCPCwaQXeBMZGybPoM/TWahCkwObP03
	L/IBJT9nHOl8zwWk8exDd8Zdlg6aYtG0syBXPrBASc+VN/NAoe7QD+nMxT6Kmi4J0mm4=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 384 v3 (CVE-2021-28701) - Another race in
 XENMAPSPACE_grant_table handling
Message-Id: <E1mNwgb-0005t1-CE@xenbits.xenproject.org>
Date: Wed, 08 Sep 2021 12:28:17 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-28701 / XSA-384
                               version 3

            Another race in XENMAPSPACE_grant_table handling

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Guests are permitted access to certain Xen-owned pages of memory.  The
majority of such pages remain allocated / associated with a guest for
its entire lifetime.  Grant table v2 status pages, however, are
de-allocated when a guest switches (back) from v2 to v1.  Freeing
such pages requires that the hypervisor enforce that no parallel request
can result in the addition of a mapping of such a page to a guest.  That
enforcement was missing, allowing guests to retain access to pages
that were freed and perhaps re-used for other purposes.

Unfortunately, when XSA-379 was being prepared, this similar issue was
not noticed.

IMPACT
======

A malicious guest may be able to elevate its privileges to that of the
host, cause host or guest Denial of Service (DoS), or cause information
leaks.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.0 onwards are affected.  Xen versions 3.4 and
older are not affected.

Only x86 HVM and PVH guests permitted to use grant table version 2
interfaces can leverage this vulnerability.  x86 PV guests cannot
leverage this vulnerability.  On Arm, grant table v2 use is explicitly
unsupported.

MITIGATION
==========

Running only PV guests will avoid this vulnerability.

Suppressing use of grant table v2 interfaces for HVM or PVH guests will
also avoid this vulnerability.

NOTE REGARDING EMBARGO
======================

Please note that the public embargo time for this advisory is
2021-09-08, two weeks later than XSA-378,379,380,382,383.

CREDITS
=======

This issue was discovered by Julien Grall of Amazon.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa384.patch           xen-unstable - Xen 4.15.x
xsa384-4.14.patch      Xen 4.14.x - 4.12.x
xsa384-4.11.patch      Xen 4.11.x

$ sha256sum xsa384*
3bf555e8b2a37dec361b86c0b6a3f59af2e1a24e3457ed92e0cfeaa662f1663a  xsa384.patch
435b431dc77d255031832dc265a8d5aa2f13f3b1a7de497b62ac2df5ad61da90  xsa384-4.11.patch
f98ec4c25fb122de6353eb7d9f5678dd09982f887bf201d6f178e9b647618c9a  xsa384-4.14.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or PV-guest-only mitigations described
above (or others which are substantially similar) is permitted during
the embargo, even on public-facing systems with untrusted guest users
and administrators.

HOWEVER, distribution of updated software is prohibited (except to other
members of the predisclosure list).

ADDITIONALLY, deployment of the grant table v2 disabling mitigation
described above *is* now (following the public release of XSA-379)
permitted during the embargo on public-facing systems with untrusted
guest users and administrators.  This is because (although such a
configuration change is recognizable by the affected guests) it is a
mitigation recommended in XSA-379, so such a change would not reveal
the existence of a further problem.

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

iQE/BAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmE4rD4MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ8S8H+ITq1u5AaK+N1wgsgztLJRh1cjFTDaLZdI0mypwV
+wPhNdw1FFH19wYDZhOJIzv3h5352YVUYs8P6HvhFWrsUaq5n4cz17wxUHch74r3
MUUU9WUdTffQrAAOSSK65yWTUewv/FglEWP55YFBDPqBJHpVWt2MMidmP6My6azK
GZAHSWU7+qNXbs4/OM+dQJyUJm6yZtAltVtVmiJdJ5bSZyqe+82zRMnS39jlkZEh
VwFnw6rdlPcYO/fNYi25bQSlXbFeruSJYK+omrrFsyd65Z4D5LyZc5CQkfRJgEt6
vMDsQR+5hrE/KXKr2mfyTx6nh0RdR8kcI2Wh017BYuLqhA==
=AEo5
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa384.patch"
Content-Disposition: attachment; filename="xsa384.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IGRlYWwgd2l0aCBzdGF0dXMgZnJhbWUgbWFwcGluZyByYWNl
CgpPbmNlIGdudHRhYl9tYXBfZnJhbWUoKSBkcm9wcyB0aGUgZ3JhbnQgdGFi
bGUgbG9jaywgdGhlIE1GTiBpdCByZXBvcnRzCmJhY2sgdG8gaXRzIGNhbGxl
ciBpcyBmcmVlIHRvIG90aGVyIG1hbmlwdWxhdGlvbi4gSW4gcGFydGljdWxh
cgpnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzKCkgbWlnaHQgZnJl
ZSBpdCwgYnkgYSByYWNpbmcgcmVxdWVzdCBvbgphbm90aGVyIENQVSwgdGh1
cyByZXN1bHRpbmcgaW4gYSByZWZlcmVuY2UgdG8gYSBkZWFsbG9jYXRlZCBw
YWdlIGdldHRpbmcKYWRkZWQgdG8gYSBkb21haW4ncyBQMk0uCgpPYnRhaW4g
YSBwYWdlIHJlZmVyZW5jZSBpbiBnbnR0YWJfbWFwX2ZyYW1lKCkgdG8gcHJl
dmVudCBmcmVlaW5nIG9mIHRoZQpwYWdlIHVudGlsIHhlbm1lbV9hZGRfdG9f
cGh5c21hcF9vbmUoKSBoYXMgYWN0dWFsbHkgY29tcGxldGVkIGl0cyBhY3Rp
bmcKb24gdGhlIHBhZ2UuIERvIHNvIHVuaWZvcm1seSwgZXZlbiBpZiBvbmx5
IHN0cmljdGx5IHJlcXVpcmVkIGZvciB2MgpzdGF0dXMgcGFnZXMsIHRvIGF2
b2lkIGV4dHJhIGNvbmRpdGlvbmFscyAod2hpY2ggdGhlbiB3b3VsZCBhbGwg
bmVlZCB0bwpiZSBrZXB0IGluIHN5bmMgZ29pbmcgZm9yd2FyZCkuCgpUaGlz
IGlzIENWRS0yMDIxLTI4NzAxIC8gWFNBLTM4NC4KClJlcG9ydGVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgotLS0KdjI6IFB1
bGwgZ2V0X3BhZ2UoKSBlYXJsaWVyIGFuZCBmb2xkIGlmKClzLgoKLS0tIGEv
eGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAg
LTE0MjAsNiArMTQyMCw4IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBf
b25lKAogICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIHJldHVybiBy
YzsKIAorICAgICAgICAvKiBOZWVkIHRvIHRha2UgY2FyZSBvZiB0aGUgcmVm
ZXJlbmNlIG9idGFpbmVkIGluIGdudHRhYl9tYXBfZnJhbWUoKS4gKi8KKyAg
ICAgICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7CiAgICAgICAgIHQgPSBw
Mm1fcmFtX3J3OwogCiAgICAgICAgIGJyZWFrOwpAQCAtMTQ4Nyw5ICsxNDg5
LDEyIEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKAogICAgIC8q
IE1hcCBhdCBuZXcgbG9jYXRpb24uICovCiAgICAgcmMgPSBndWVzdF9waHlz
bWFwX2FkZF9lbnRyeShkLCBnZm4sIG1mbiwgMCwgdCk7CiAKLSAgICAvKiBJ
ZiB3ZSBmYWlsIHRvIGFkZCB0aGUgbWFwcGluZywgd2UgbmVlZCB0byBkcm9w
IHRoZSByZWZlcmVuY2Ugd2UKLSAgICAgKiB0b29rIGVhcmxpZXIgb24gZm9y
ZWlnbiBwYWdlcyAqLwotICAgIGlmICggcmMgJiYgc3BhY2UgPT0gWEVOTUFQ
U1BBQ0VfZ21mbl9mb3JlaWduICkKKyAgICAvKgorICAgICAqIEZvciBYRU5N
QVBTUEFDRV9nbWZuX2ZvcmVpZ24gaWYgd2UgZmFpbGVkIHRvIGFkZCB0aGUg
bWFwcGluZywgd2UgbmVlZAorICAgICAqIHRvIGRyb3AgdGhlIHJlZmVyZW5j
ZSB3ZSB0b29rIGVhcmxpZXIuIEluIGFsbCBvdGhlciBjYXNlcyB3ZSBuZWVk
IHRvCisgICAgICogZHJvcCBhbnkgcmVmZXJlbmNlIHdlIHRvb2sgZWFybGll
ciAocGVyaGFwcyBpbmRpcmVjdGx5KS4KKyAgICAgKi8KKyAgICBpZiAoIHNw
YWNlID09IFhFTk1BUFNQQUNFX2dtZm5fZm9yZWlnbiA/IHJjIDogcGFnZSAh
PSBOVUxMICkKICAgICB7CiAgICAgICAgIEFTU0VSVChwYWdlICE9IE5VTEwp
OwogICAgICAgICBwdXRfcGFnZShwYWdlKTsKLS0tIGEveGVuL2FyY2gveDg2
L21tL3AybS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtMjcy
Niw2ICsyNzI2LDggQEAgaW50IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9vbmUo
CiAgICAgICAgIHJjID0gZ250dGFiX21hcF9mcmFtZShkLCBpZHgsIGdwZm4s
ICZtZm4pOwogICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIHJldHVy
biByYzsKKyAgICAgICAgLyogTmVlZCB0byB0YWtlIGNhcmUgb2YgdGhlIHJl
ZmVyZW5jZSBvYnRhaW5lZCBpbiBnbnR0YWJfbWFwX2ZyYW1lKCkuICovCisg
ICAgICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwogICAgICAgICBicmVh
azsKIAogICAgIGNhc2UgWEVOTUFQU1BBQ0VfZ21mbjoKLS0tIGEveGVuL2Nv
bW1vbi9ncmFudF90YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYwpAQCAtNDA5Nyw3ICs0MDk3LDE2IEBAIGludCBnbnR0YWJfbWFwX2Zy
YW1lKHN0cnVjdCBkb21haW4gKmQsIHUKICAgICB9CiAKICAgICBpZiAoICFy
YyApCi0gICAgICAgIGdudHRhYl9zZXRfZnJhbWVfZ2ZuKGd0LCBzdGF0dXMs
IGlkeCwgZ2ZuKTsKKyAgICB7CisgICAgICAgIC8qCisgICAgICAgICAqIE1h
a2Ugc3VyZSBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzKCkgd29u
J3QgKHN1Y2Nlc3NmdWxseSkKKyAgICAgICAgICogZnJlZSB0aGUgcGFnZSB1
bnRpbCBvdXIgY2FsbGVyIGhhcyBjb21wbGV0ZWQgaXRzIG9wZXJhdGlvbi4K
KyAgICAgICAgICovCisgICAgICAgIGlmICggZ2V0X3BhZ2UobWZuX3RvX3Bh
Z2UoKm1mbiksIGQpICkKKyAgICAgICAgICAgIGdudHRhYl9zZXRfZnJhbWVf
Z2ZuKGd0LCBzdGF0dXMsIGlkeCwgZ2ZuKTsKKyAgICAgICAgZWxzZQorICAg
ICAgICAgICAgcmMgPSAtRUJVU1k7CisgICAgfQogCiAgICAgZ3JhbnRfd3Jp
dGVfdW5sb2NrKGd0KTsKIAo=

--=separator
Content-Type: application/octet-stream; name="xsa384-4.11.patch"
Content-Disposition: attachment; filename="xsa384-4.11.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IGRlYWwgd2l0aCBzdGF0dXMgZnJhbWUgbWFwcGluZyByYWNl
CgpPbmNlIGdudHRhYl9tYXBfZnJhbWUoKSBkcm9wcyB0aGUgZ3JhbnQgdGFi
bGUgbG9jaywgdGhlIE1GTiBpdCByZXBvcnRzCmJhY2sgdG8gaXRzIGNhbGxl
ciBpcyBmcmVlIHRvIG90aGVyIG1hbmlwdWxhdGlvbi4gSW4gcGFydGljdWxh
cgpnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzKCkgbWlnaHQgZnJl
ZSBpdCwgYnkgYSByYWNpbmcgcmVxdWVzdCBvbgphbm90aGVyIENQVSwgdGh1
cyByZXN1bHRpbmcgaW4gYSByZWZlcmVuY2UgdG8gYSBkZWFsbG9jYXRlZCBw
YWdlIGdldHRpbmcKYWRkZWQgdG8gYSBkb21haW4ncyBQMk0uCgpPYnRhaW4g
YSBwYWdlIHJlZmVyZW5jZSBpbiBnbnR0YWJfbWFwX2ZyYW1lKCkgdG8gcHJl
dmVudCBmcmVlaW5nIG9mIHRoZQpwYWdlIHVudGlsIHhlbm1lbV9hZGRfdG9f
cGh5c21hcF9vbmUoKSBoYXMgYWN0dWFsbHkgY29tcGxldGVkIGl0cyBhY3Rp
bmcKb24gdGhlIHBhZ2UuIERvIHNvIHVuaWZvcm1seSwgZXZlbiBpZiBvbmx5
IHN0cmljdGx5IHJlcXVpcmVkIGZvciB2MgpzdGF0dXMgcGFnZXMsIHRvIGF2
b2lkIGV4dHJhIGNvbmRpdGlvbmFscyAod2hpY2ggdGhlbiB3b3VsZCBhbGwg
bmVlZCB0bwpiZSBrZXB0IGluIHN5bmMgZ29pbmcgZm9yd2FyZCkuCgpUaGlz
IGlzIENWRS0yMDIxLTI4NzAxIC8gWFNBLTM4NC4KClJlcG9ydGVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgoKLS0tIGEveGVu
L2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTEy
MzgsNiArMTIzOCw4IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25l
KAogICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIHJldHVybiByYzsK
IAorICAgICAgICAvKiBOZWVkIHRvIHRha2UgY2FyZSBvZiB0aGUgcmVmZXJl
bmNlIG9idGFpbmVkIGluIGdudHRhYl9tYXBfZnJhbWUoKS4gKi8KKyAgICAg
ICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7CiAgICAgICAgIHQgPSBwMm1f
cmFtX3J3OwogCiAgICAgICAgIGJyZWFrOwpAQCAtMTMwNCw5ICsxMzA2LDEy
IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKAogICAgIC8qIE1h
cCBhdCBuZXcgbG9jYXRpb24uICovCiAgICAgcmMgPSBndWVzdF9waHlzbWFw
X2FkZF9lbnRyeShkLCBnZm4sIG1mbiwgMCwgdCk7CiAKLSAgICAvKiBJZiB3
ZSBmYWlsIHRvIGFkZCB0aGUgbWFwcGluZywgd2UgbmVlZCB0byBkcm9wIHRo
ZSByZWZlcmVuY2Ugd2UKLSAgICAgKiB0b29rIGVhcmxpZXIgb24gZm9yZWln
biBwYWdlcyAqLwotICAgIGlmICggcmMgJiYgc3BhY2UgPT0gWEVOTUFQU1BB
Q0VfZ21mbl9mb3JlaWduICkKKyAgICAvKgorICAgICAqIEZvciBYRU5NQVBT
UEFDRV9nbWZuX2ZvcmVpZ24gaWYgd2UgZmFpbGVkIHRvIGFkZCB0aGUgbWFw
cGluZywgd2UgbmVlZAorICAgICAqIHRvIGRyb3AgdGhlIHJlZmVyZW5jZSB3
ZSB0b29rIGVhcmxpZXIuIEluIGFsbCBvdGhlciBjYXNlcyB3ZSBuZWVkIHRv
CisgICAgICogZHJvcCBhbnkgcmVmZXJlbmNlIHdlIHRvb2sgZWFybGllciAo
cGVyaGFwcyBpbmRpcmVjdGx5KS4KKyAgICAgKi8KKyAgICBpZiAoIHNwYWNl
ID09IFhFTk1BUFNQQUNFX2dtZm5fZm9yZWlnbiA/IHJjIDogcGFnZSAhPSBO
VUxMICkKICAgICB7CiAgICAgICAgIEFTU0VSVChwYWdlICE9IE5VTEwpOwog
ICAgICAgICBwdXRfcGFnZShwYWdlKTsKLS0tIGEveGVuL2FyY2gveDg2L21t
LmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTQ3NTEsNiArNDc1MSw4
IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKAogICAgICAgICAg
ICAgcmMgPSBnbnR0YWJfbWFwX2ZyYW1lKGQsIGlkeCwgZ3BmbiwgJm1mbik7
CiAgICAgICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgICAgICByZXR1
cm4gcmM7CisgICAgICAgICAgICAvKiBOZWVkIHRvIHRha2UgY2FyZSBvZiB0
aGUgcmVmIG9idGFpbmVkIGluIGdudHRhYl9tYXBfZnJhbWUoKS4gKi8KKyAg
ICAgICAgICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwogICAgICAgICAg
ICAgYnJlYWs7CiAgICAgICAgIGNhc2UgWEVOTUFQU1BBQ0VfZ21mbjoKICAg
ICAgICAgewotLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKKysrIGIv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBAIC0zOTY0LDcgKzM5NjQsMTYg
QEAgaW50IGdudHRhYl9tYXBfZnJhbWUoc3RydWN0IGRvbWFpbiAqZCwgdQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKm1mbiwg
MCk7CiAKICAgICBpZiAoICFyYyApCi0gICAgICAgIGdudHRhYl9zZXRfZnJh
bWVfZ2ZuKGd0LCBzdGF0dXMsIGlkeCwgZ2ZuKTsKKyAgICB7CisgICAgICAg
IC8qCisgICAgICAgICAqIE1ha2Ugc3VyZSBnbnR0YWJfdW5wb3B1bGF0ZV9z
dGF0dXNfZnJhbWVzKCkgd29uJ3QgKHN1Y2Nlc3NmdWxseSkKKyAgICAgICAg
ICogZnJlZSB0aGUgcGFnZSB1bnRpbCBvdXIgY2FsbGVyIGhhcyBjb21wbGV0
ZWQgaXRzIG9wZXJhdGlvbi4KKyAgICAgICAgICovCisgICAgICAgIGlmICgg
Z2V0X3BhZ2UobWZuX3RvX3BhZ2UoKm1mbiksIGQpICkKKyAgICAgICAgICAg
IGdudHRhYl9zZXRfZnJhbWVfZ2ZuKGd0LCBzdGF0dXMsIGlkeCwgZ2ZuKTsK
KyAgICAgICAgZWxzZQorICAgICAgICAgICAgcmMgPSAtRUJVU1k7CisgICAg
fQogCiAgICAgZ3JhbnRfd3JpdGVfdW5sb2NrKGd0KTsKIAo=

--=separator
Content-Type: application/octet-stream; name="xsa384-4.14.patch"
Content-Disposition: attachment; filename="xsa384-4.14.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IGRlYWwgd2l0aCBzdGF0dXMgZnJhbWUgbWFwcGluZyByYWNl
CgpPbmNlIGdudHRhYl9tYXBfZnJhbWUoKSBkcm9wcyB0aGUgZ3JhbnQgdGFi
bGUgbG9jaywgdGhlIE1GTiBpdCByZXBvcnRzCmJhY2sgdG8gaXRzIGNhbGxl
ciBpcyBmcmVlIHRvIG90aGVyIG1hbmlwdWxhdGlvbi4gSW4gcGFydGljdWxh
cgpnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzKCkgbWlnaHQgZnJl
ZSBpdCwgYnkgYSByYWNpbmcgcmVxdWVzdCBvbgphbm90aGVyIENQVSwgdGh1
cyByZXN1bHRpbmcgaW4gYSByZWZlcmVuY2UgdG8gYSBkZWFsbG9jYXRlZCBw
YWdlIGdldHRpbmcKYWRkZWQgdG8gYSBkb21haW4ncyBQMk0uCgpPYnRhaW4g
YSBwYWdlIHJlZmVyZW5jZSBpbiBnbnR0YWJfbWFwX2ZyYW1lKCkgdG8gcHJl
dmVudCBmcmVlaW5nIG9mIHRoZQpwYWdlIHVudGlsIHhlbm1lbV9hZGRfdG9f
cGh5c21hcF9vbmUoKSBoYXMgYWN0dWFsbHkgY29tcGxldGVkIGl0cyBhY3Rp
bmcKb24gdGhlIHBhZ2UuIERvIHNvIHVuaWZvcm1seSwgZXZlbiBpZiBvbmx5
IHN0cmljdGx5IHJlcXVpcmVkIGZvciB2MgpzdGF0dXMgcGFnZXMsIHRvIGF2
b2lkIGV4dHJhIGNvbmRpdGlvbmFscyAod2hpY2ggdGhlbiB3b3VsZCBhbGwg
bmVlZCB0bwpiZSBrZXB0IGluIHN5bmMgZ29pbmcgZm9yd2FyZCkuCgpUaGlz
IGlzIENWRS0yMDIxLTI4NzAxIC8gWFNBLTM4NC4KClJlcG9ydGVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgoKLS0tIGEveGVu
L2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTE0
MjMsNiArMTQyMyw4IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25l
KAogICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgIHJldHVybiByYzsK
IAorICAgICAgICAvKiBOZWVkIHRvIHRha2UgY2FyZSBvZiB0aGUgcmVmZXJl
bmNlIG9idGFpbmVkIGluIGdudHRhYl9tYXBfZnJhbWUoKS4gKi8KKyAgICAg
ICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7CiAgICAgICAgIHQgPSBwMm1f
cmFtX3J3OwogCiAgICAgICAgIGJyZWFrOwpAQCAtMTQ5MCw5ICsxNDkyLDEy
IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKAogICAgIC8qIE1h
cCBhdCBuZXcgbG9jYXRpb24uICovCiAgICAgcmMgPSBndWVzdF9waHlzbWFw
X2FkZF9lbnRyeShkLCBnZm4sIG1mbiwgMCwgdCk7CiAKLSAgICAvKiBJZiB3
ZSBmYWlsIHRvIGFkZCB0aGUgbWFwcGluZywgd2UgbmVlZCB0byBkcm9wIHRo
ZSByZWZlcmVuY2Ugd2UKLSAgICAgKiB0b29rIGVhcmxpZXIgb24gZm9yZWln
biBwYWdlcyAqLwotICAgIGlmICggcmMgJiYgc3BhY2UgPT0gWEVOTUFQU1BB
Q0VfZ21mbl9mb3JlaWduICkKKyAgICAvKgorICAgICAqIEZvciBYRU5NQVBT
UEFDRV9nbWZuX2ZvcmVpZ24gaWYgd2UgZmFpbGVkIHRvIGFkZCB0aGUgbWFw
cGluZywgd2UgbmVlZAorICAgICAqIHRvIGRyb3AgdGhlIHJlZmVyZW5jZSB3
ZSB0b29rIGVhcmxpZXIuIEluIGFsbCBvdGhlciBjYXNlcyB3ZSBuZWVkIHRv
CisgICAgICogZHJvcCBhbnkgcmVmZXJlbmNlIHdlIHRvb2sgZWFybGllciAo
cGVyaGFwcyBpbmRpcmVjdGx5KS4KKyAgICAgKi8KKyAgICBpZiAoIHNwYWNl
ID09IFhFTk1BUFNQQUNFX2dtZm5fZm9yZWlnbiA/IHJjIDogcGFnZSAhPSBO
VUxMICkKICAgICB7CiAgICAgICAgIEFTU0VSVChwYWdlICE9IE5VTEwpOwog
ICAgICAgICBwdXRfcGFnZShwYWdlKTsKLS0tIGEveGVuL2FyY2gveDg2L21t
LmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTQ2MjAsNiArNDYyMCw4
IEBAIGludCB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKAogICAgICAgICAg
ICAgcmMgPSBnbnR0YWJfbWFwX2ZyYW1lKGQsIGlkeCwgZ3BmbiwgJm1mbik7
CiAgICAgICAgICAgICBpZiAoIHJjICkKICAgICAgICAgICAgICAgICByZXR1
cm4gcmM7CisgICAgICAgICAgICAvKiBOZWVkIHRvIHRha2UgY2FyZSBvZiB0
aGUgcmVmIG9idGFpbmVkIGluIGdudHRhYl9tYXBfZnJhbWUoKS4gKi8KKyAg
ICAgICAgICAgIHBhZ2UgPSBtZm5fdG9fcGFnZShtZm4pOwogICAgICAgICAg
ICAgYnJlYWs7CiAgICAgICAgIGNhc2UgWEVOTUFQU1BBQ0VfZ21mbjoKICAg
ICAgICAgewotLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKKysrIGIv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCkBAIC00MTAyLDcgKzQxMDIsMTYg
QEAgaW50IGdudHRhYl9tYXBfZnJhbWUoc3RydWN0IGRvbWFpbiAqZCwgdQog
ICAgIH0KIAogICAgIGlmICggIXJjICkKLSAgICAgICAgZ250dGFiX3NldF9m
cmFtZV9nZm4oZ3QsIHN0YXR1cywgaWR4LCBnZm4pOworICAgIHsKKyAgICAg
ICAgLyoKKyAgICAgICAgICogTWFrZSBzdXJlIGdudHRhYl91bnBvcHVsYXRl
X3N0YXR1c19mcmFtZXMoKSB3b24ndCAoc3VjY2Vzc2Z1bGx5KQorICAgICAg
ICAgKiBmcmVlIHRoZSBwYWdlIHVudGlsIG91ciBjYWxsZXIgaGFzIGNvbXBs
ZXRlZCBpdHMgb3BlcmF0aW9uLgorICAgICAgICAgKi8KKyAgICAgICAgaWYg
KCBnZXRfcGFnZShtZm5fdG9fcGFnZSgqbWZuKSwgZCkgKQorICAgICAgICAg
ICAgZ250dGFiX3NldF9mcmFtZV9nZm4oZ3QsIHN0YXR1cywgaWR4LCBnZm4p
OworICAgICAgICBlbHNlCisgICAgICAgICAgICByYyA9IC1FQlVTWTsKKyAg
ICB9CiAKICAgICBncmFudF93cml0ZV91bmxvY2soZ3QpOwogCg==

--=separator--

