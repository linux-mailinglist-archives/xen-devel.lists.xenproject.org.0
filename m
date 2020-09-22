Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D75274342
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:37:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiU8-0001iQ-Kl; Tue, 22 Sep 2020 13:37:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzSo=C7=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kKiU7-0001gh-Gl
 for xen-devel@lists.xen.org; Tue, 22 Sep 2020 13:37:31 +0000
X-Inumbo-ID: a84a11f0-876e-431b-9d98-2d509504715f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a84a11f0-876e-431b-9d98-2d509504715f;
 Tue, 22 Sep 2020 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 bh=c6RX2Eh49YE7OXM04xyXFpYd39JbxFOoTIStedBMvL8=; b=rM6xd5wRjGqlRV/jEulI4YD5Lu
 42Vf+LRsF2W7mjTgLVmHwGQ1cYiUcH09sdB+hsIVjzuCHvpWHwiLfxULIwAp4lW7WHY6B77tCW/eR
 noNMrDMJ8lBJdW+HjU3rfgXy7Yktlan5Ss7tWjYbGF+1KOqxb5k1WUPRa211QWBfXH5I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTr-0006ox-1Y; Tue, 22 Sep 2020 13:37:15 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTq-0002Hq-W9; Tue, 22 Sep 2020 13:37:14 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 334 v3 (CVE-2020-25598) - Missing unlock in
 XENMEM_acquire_resource error path
Message-Id: <E1kKiTq-0002Hq-W9@xenbits.xenproject.org>
Date: Tue, 22 Sep 2020 13:37:14 +0000
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

            Xen Security Advisory CVE-2020-25598 / XSA-334
                               version 3

         Missing unlock in XENMEM_acquire_resource error path

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

The RCU (Read, Copy, Update) mechanism is a synchronisation primitive.

A buggy error path in the XENMEM_acquire_resource exits without
releasing an RCU reference, which is conceptually similar to forgetting
to unlock a spinlock.

IMPACT
======

A buggy or malicious HVM stubdomain can cause an RCU reference to be
leaked.  This causes subsequent administration operations, (e.g. CPU
offline) to livelock, resulting in a host Denial of Service.

VULNERABLE SYSTEMS
==================

The buggy codepath has been present since Xen 4.12.  Xen 4.14 and later
are vulnerable to the DoS.  The side effects are believed to be benign
on Xen 4.12 and 4.13, but patches are provided nevertheless.

The vulnerability can generally only be exploited by x86 HVM VMs, as
these are generally the only type of VM which have a Qemu stubdomain.
x86 PV and PVH domains, as well as ARM VMs typically don't use a
stubdomain.

Only VMs using HVM stubdomains can exploit the vulnerability.  VMs using
PV stubdomains, or with emulators running in dom0 cannot exploit the
vulnerability.

MITIGATION
==========

Running only x86 PV or PVH VMs will avoid the vulnerability.
Reconfiguring x86 HVM guests to use a PV or no stubdom will also avoid
the vulnerability.

CREDITS
=======

This issue was discovered by Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa334.patch           Xen 4.13 - xen-unstable
xsa334-4.12.patch      Xen 4.12

$ sha256sum xsa334*
80e7725a56c4244d860e9aebb56710a8165f7ffeae3fb67365cbc85b3b0518b3  xsa334.meta
323cd9d24b2e95643833865a9943172c56edd25dfd170e4741034d28dfd0d4bd  xsa334.patch
85341ba6322ea6279c0851493ce61e822c8560850034f5f26cbcb26be85ca102  xsa334-4.12.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl9p/eYMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZV94H/jhwML6zObPz+zvjbwwAUoHsYiQ66CSUlxluqjN5
PXWpm56RzArptGIUakQyXKNI2Ht2fUn3Lu3w9JllujJRfmhbhiJJvI9Ar2QzOcri
+XylcK9rRspfmNUgXB629BTEcGUuo9/J+T+O4T544zfWUBncixyDq9/Q9SGAdz9c
kDZkL6UebpIFLtD6jrgYd4XAK9b1c6T7SmsGzq26m/zwGqJ1jol58kHl5GMXe7uX
rd9xZbERKIhaABbTQ10zY5IDIE4oplibSLOiJVSTz6KSyzD9by+M7oszqeIbIiRV
rY49lettdD4jfmzp5bbXQnf+9T31rG3AEHWaiOGdVcRFoq8=
=a23E
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa334.meta"
Content-Disposition: attachment; filename="xsa334.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMzQsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIK
ICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6
IHsKICAgICI0LjEyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAi
eGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIxMzM2Y2ExNzc0MjQ3
MWZjNGE1OTg3OWFlMmY2MzdhNTk1MzBhOTMzIiwKICAgICAgICAgICJQcmVy
ZXFzIjogWwogICAgICAgICAgICAzMzMKICAgICAgICAgIF0sCiAgICAgICAg
ICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMzNC00LjEyLnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewog
ICAgICAgICAgIlN0YWJsZVJlZiI6ICI5YjM2N2IyYjBiNzE0ZjNmZmI2OWVk
NmJlMGExMThlOGQzZWFjMDdmIiwKICAgICAgICAgICJQcmVyZXFzIjogWwog
ICAgICAgICAgICAzMzMKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hl
cyI6IFsKICAgICAgICAgICAgInhzYTMzNC5wYXRjaCIKICAgICAgICAgIF0K
ICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xNCI6IHsKICAgICAg
IlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFi
bGVSZWYiOiAiYzNhMGZjMjJhZjkwZWYyOGU2OGIxMTZjNmE0OWQ5Y2VjNTdm
NzFjZiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzMz
CiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAg
ICAgICJ4c2EzMzQucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAg
ICB9CiAgICB9LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMiOiB7
CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiYjEx
OTEwMDgyZDkwYmIxNTk3ZjY2Nzk1MjRlYjcyNmEzMzMwNjY3MiIsCiAgICAg
ICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzMzCiAgICAgICAgICBd
LAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMzQu
cGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9CiAg
fQp9

--=separator
Content-Type: application/octet-stream; name="xsa334.patch"
Content-Disposition: attachment; filename="xsa334.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeGVuL21lbW9yeTogRG9uJ3Qgc2tpcCB0aGUgUkNVIHVu
bG9jayBwYXRoIGluIGFjcXVpcmVfcmVzb3VyY2UoKQoKSW4gdGhlIGNhc2Ug
dGhhdCBhbiBIVk0gU3R1YmRvbWFpbiBtYWtlcyBhbiBYRU5NRU1fYWNxdWly
ZV9yZXNvdXJjZSBoeXBlcmNhbGwsCnRoZSBGSVhNRSBwYXRoIHdpbGwgYnlw
YXNzIHJjdV91bmxvY2tfZG9tYWluKCkgb24gdGhlIHdheSBvdXQgb2YgdGhl
IGZ1bmN0aW9uLgoKTW92ZSB0aGUgY2hlY2sgdG8gdGhlIHN0YXJ0IG9mIHRo
ZSBmdW5jdGlvbi4gIFRoaXMgZG9lcyBjaGFuZ2UgdGhlIGJlaGF2aW91cgpv
ZiB0aGUgZ2V0LXNpemUgcGF0aCBmb3IgSFZNIFN0dWJkb21haW5zLCBidXQg
dGhhdCBmdW5jdGlvbmFsaXR5IGlzIGN1cnJlbnRseQpicm9rZW4gYW5kIHVu
dXNlZCBhbnl3YXksIGFzIHdlbGwgYXMgYmVpbmcgcXVpdGUgdXNlbGVzcyB0
byBlbnRpdGllcyB3aGljaApjYW4ndCBhY3R1YWxseSBtYXAgdGhlIHJlc291
cmNlIGFueXdheS4KClRoaXMgaXMgWFNBLTMzNC4KCkZpeGVzOiA4M2ZhNjU1
MmNlICgiY29tbW9uOiBhZGQgYSBuZXcgbWFwcGFibGUgcmVzb3VyY2UgdHlw
ZTogWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlIikKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL21lbW9yeS5jIGIveGVuL2NvbW1v
bi9tZW1vcnkuYwppbmRleCAxYTNjOWZmYjMwLi4yOTc0MWQ4OTA0IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL21lbW9yeS5jCisrKyBiL3hlbi9jb21tb24v
bWVtb3J5LmMKQEAgLTEwNTgsNiArMTA1OCwxNCBAQCBzdGF0aWMgaW50IGFj
cXVpcmVfcmVzb3VyY2UoCiAgICAgeGVuX3Bmbl90IG1mbl9saXN0WzMyXTsK
ICAgICBpbnQgcmM7CiAKKyAgICAvKgorICAgICAqIEZJWE1FOiBVbnRpbCBm
b3JlaWduIHBhZ2VzIGluc2VydGVkIGludG8gdGhlIFAyTSBhcmUgcHJvcGVy
bHkKKyAgICAgKiAgICAgICAgcmVmZXJlbmNlIGNvdW50ZWQsIGl0IGlzIHVu
c2FmZSB0byBhbGxvdyBtYXBwaW5nIG9mCisgICAgICogICAgICAgIHJlc291
cmNlIHBhZ2VzIHVubGVzcyB0aGUgY2FsbGVyIGlzIHRoZSBoYXJkd2FyZSBk
b21haW4uCisgICAgICovCisgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xh
dGUoY3VycmQpICYmICFpc19oYXJkd2FyZV9kb21haW4oY3VycmQpICkKKyAg
ICAgICAgcmV0dXJuIC1FQUNDRVM7CisKICAgICBpZiAoIGNvcHlfZnJvbV9n
dWVzdCgmeG1hciwgYXJnLCAxKSApCiAgICAgICAgIHJldHVybiAtRUZBVUxU
OwogCkBAIC0xMTE0LDE0ICsxMTIyLDYgQEAgc3RhdGljIGludCBhY3F1aXJl
X3Jlc291cmNlKAogICAgICAgICB4ZW5fcGZuX3QgZ2ZuX2xpc3RbQVJSQVlf
U0laRShtZm5fbGlzdCldOwogICAgICAgICB1bnNpZ25lZCBpbnQgaTsKIAot
ICAgICAgICAvKgotICAgICAgICAgKiBGSVhNRTogVW50aWwgZm9yZWlnbiBw
YWdlcyBpbnNlcnRlZCBpbnRvIHRoZSBQMk0gYXJlIHByb3Blcmx5Ci0gICAg
ICAgICAqICAgICAgICByZWZlcmVuY2UgY291bnRlZCwgaXQgaXMgdW5zYWZl
IHRvIGFsbG93IG1hcHBpbmcgb2YKLSAgICAgICAgICogICAgICAgIHJlc291
cmNlIHBhZ2VzIHVubGVzcyB0aGUgY2FsbGVyIGlzIHRoZSBoYXJkd2FyZSBk
b21haW4uCi0gICAgICAgICAqLwotICAgICAgICBpZiAoICFpc19oYXJkd2Fy
ZV9kb21haW4oY3VycmQpICkKLSAgICAgICAgICAgIHJldHVybiAtRUFDQ0VT
OwotCiAgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KGdmbl9saXN0LCB4
bWFyLmZyYW1lX2xpc3QsIHhtYXIubnJfZnJhbWVzKSApCiAgICAgICAgICAg
ICByYyA9IC1FRkFVTFQ7CiAK

--=separator
Content-Type: application/octet-stream; name="xsa334-4.12.patch"
Content-Disposition: attachment; filename="xsa334-4.12.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeGVuL21lbW9yeTogRG9uJ3Qgc2tpcCB0aGUgUkNVIHVu
bG9jayBwYXRoIGluIGFjcXVpcmVfcmVzb3VyY2UoKQoKSW4gdGhlIGNhc2Ug
dGhhdCBhbiBIVk0gU3R1YmRvbWFpbiBtYWtlcyBhbiBYRU5NRU1fYWNxdWly
ZV9yZXNvdXJjZSBoeXBlcmNhbGwsCnRoZSBGSVhNRSBwYXRoIHdpbGwgYnlw
YXNzIHJjdV91bmxvY2tfZG9tYWluKCkgb24gdGhlIHdheSBvdXQgb2YgdGhl
IGZ1bmN0aW9uLgoKTW92ZSB0aGUgY2hlY2sgdG8gdGhlIHN0YXJ0IG9mIHRo
ZSBmdW5jdGlvbi4gIFRoaXMgZG9lcyBjaGFuZ2UgdGhlIGJlaGF2aW91cgpv
ZiB0aGUgZ2V0LXNpemUgcGF0aCBmb3IgSFZNIFN0dWJkb21haW5zLCBidXQg
dGhhdCBmdW5jdGlvbmFsaXR5IGlzIGN1cnJlbnRseQpicm9rZW4gYW5kIHVu
dXNlZCBhbnl3YXksIGFzIHdlbGwgYXMgYmVpbmcgcXVpdGUgdXNlbGVzcyB0
byBlbnRpdGllcyB3aGljaApjYW4ndCBhY3R1YWxseSBtYXAgdGhlIHJlc291
cmNlIGFueXdheS4KClRoaXMgaXMgWFNBLTMzNC4KCkZpeGVzOiA4M2ZhNjU1
MmNlICgiY29tbW9uOiBhZGQgYSBuZXcgbWFwcGFibGUgcmVzb3VyY2UgdHlw
ZTogWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlIikKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkJhY2twb3J0IG5vdGU6IFRoZSBkZWxldGlvbiBvZiB0aGUgWEVOTUVNX3Jz
cmNfYWNxX2NhbGxlcl9vd25lZCBjbGF1c2UgaXMKY29ycmVjdCBhbmQgaW50
ZW50aW9uYWwuICBUaGlzIHdhcyBhbiBvdXRwdXQtb25seSBmbGFnIHdobydz
IHVzZSBuZXZlcgpzdXJ2aXZlZCBpbnRvIHRoZSBYZW4gNC4xMiByZWxlYXNl
LCBhbmQgd2FzIHN1YnNlcXVlbnRseSBkZWxldGVkIGluIFhlbiA0LjEzLgoK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbWVtb3J5LmMgYi94ZW4vY29tbW9u
L21lbW9yeS5jCmluZGV4IGRiYzA2ZmIwYmYuLmZmODhlYmIzMTQgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vbWVtb3J5LmMKKysrIGIveGVuL2NvbW1vbi9t
ZW1vcnkuYwpAQCAtMTA1OSw2ICsxMDU5LDE0IEBAIHN0YXRpYyBpbnQgYWNx
dWlyZV9yZXNvdXJjZSgKICAgICB4ZW5fcGZuX3QgbWZuX2xpc3RbMzJdOwog
ICAgIGludCByYzsKIAorICAgIC8qCisgICAgICogRklYTUU6IFVudGlsIGZv
cmVpZ24gcGFnZXMgaW5zZXJ0ZWQgaW50byB0aGUgUDJNIGFyZSBwcm9wZXJs
eQorICAgICAqICAgICAgICByZWZlcmVuY2UgY291bnRlZCwgaXQgaXMgdW5z
YWZlIHRvIGFsbG93IG1hcHBpbmcgb2YKKyAgICAgKiAgICAgICAgcmVzb3Vy
Y2UgcGFnZXMgdW5sZXNzIHRoZSBjYWxsZXIgaXMgdGhlIGhhcmR3YXJlIGRv
bWFpbi4KKyAgICAgKi8KKyAgICBpZiAoIHBhZ2luZ19tb2RlX3RyYW5zbGF0
ZShjdXJyZCkgJiYgIWlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZCkgKQorICAg
ICAgICByZXR1cm4gLUVBQ0NFUzsKKwogICAgIGlmICggY29weV9mcm9tX2d1
ZXN0KCZ4bWFyLCBhcmcsIDEpICkKICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7
CiAKQEAgLTExMTUsMTYgKzExMjMsNiBAQCBzdGF0aWMgaW50IGFjcXVpcmVf
cmVzb3VyY2UoCiAgICAgICAgIHhlbl9wZm5fdCBnZm5fbGlzdFtBUlJBWV9T
SVpFKG1mbl9saXN0KV07CiAgICAgICAgIHVuc2lnbmVkIGludCBpOwogCi0g
ICAgICAgIC8qCi0gICAgICAgICAqIEZJWE1FOiBVbnRpbCBmb3JlaWduIHBh
Z2VzIGluc2VydGVkIGludG8gdGhlIFAyTSBhcmUgcHJvcGVybHkKLSAgICAg
ICAgICogICAgICAgIHJlZmVyZW5jZSBjb3VudGVkLCBpdCBpcyB1bnNhZmUg
dG8gYWxsb3cgbWFwcGluZyBvZgotICAgICAgICAgKiAgICAgICAgbm9uLWNh
bGxlci1vd25lZCByZXNvdXJjZSBwYWdlcyB1bmxlc3MgdGhlIGNhbGxlciBp
cwotICAgICAgICAgKiAgICAgICAgdGhlIGhhcmR3YXJlIGRvbWFpbi4KLSAg
ICAgICAgICovCi0gICAgICAgIGlmICggISh4bWFyLmZsYWdzICYgWEVOTUVN
X3JzcmNfYWNxX2NhbGxlcl9vd25lZCkgJiYKLSAgICAgICAgICAgICAhaXNf
aGFyZHdhcmVfZG9tYWluKGN1cnJkKSApCi0gICAgICAgICAgICByZXR1cm4g
LUVBQ0NFUzsKLQogICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdChnZm5f
bGlzdCwgeG1hci5mcmFtZV9saXN0LCB4bWFyLm5yX2ZyYW1lcykgKQogICAg
ICAgICAgICAgcmMgPSAtRUZBVUxUOwogCg==

--=separator--

