Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2447A274365
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:41:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiXh-0004AZ-Ao; Tue, 22 Sep 2020 13:41:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzSo=C7=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kKiUv-0001gf-9G
 for xen-devel@lists.xen.org; Tue, 22 Sep 2020 13:38:21 +0000
X-Inumbo-ID: 73231768-1263-448c-8ad1-53a6b84e9198
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73231768-1263-448c-8ad1-53a6b84e9198;
 Tue, 22 Sep 2020 13:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 bh=P9III5Ux8cBix1wVhd0lKbgBUp5J/+qWRAlqvlc02KY=; b=7LIeJZJF+SZ6Vy2H5SIuPPRyuy
 uPP23GEDZCR3nvAE1lh0RqPNq3QsXAI+dbU/KaxRJTpwwYnVjVxtddeRDcFsNah8wrssl+OeKgXxK
 6U0OKYLU6P6aFsynnyZV7Be+rZ6tcW2h4HjkEbP4ruDyM81CFadvv9yR5o84W94EKSOU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTu-0006px-7s; Tue, 22 Sep 2020 13:37:18 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTu-0002Mo-6u; Tue, 22 Sep 2020 13:37:18 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 340 v3 (CVE-2020-25603) - Missing memory
 barriers when accessing/allocating an event channel
Message-Id: <E1kKiTu-0002Mo-6u@xenbits.xenproject.org>
Date: Tue, 22 Sep 2020 13:37:18 +0000
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

            Xen Security Advisory CVE-2020-25603 / XSA-340
                               version 3

  Missing memory barriers when accessing/allocating an event channel

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Event channels control structures can be accessed lockless as long as the port
is considered to be valid. Such sequence is missing appropriate memory barrier
(e.g smp_*mb()) to prevent both the compiler and CPU to re-order access.

IMPACT
======

A malicious guest may be able to cause a hypervisor crash resulting in a
Denial of Service (DoS). Information leak and privilege escalation cannot be
excluded.

VULNERABLE SYSTEMS
==================

Systems running all versions of Xen are affected.  Whether a system is
vulnerable will depend on the CPU and compiler used to build Xen.

For all the systems, the presence and the scope of the vulnerability
depends on the precise re-ordering performed by the compiler used to
build Xen.

We have not been able to survey compilers; consequently we cannot say
which compiler(s) might produce vulnerable code (with which code generation
options).  GCC documentation clearly suggests that re-ordering is possible.

Arm systems will also be vulnerable if the CPU is able to re-order memory
access.  Please consult your CPU vendor.

x86 systems are only vulnerable if a compiler performs re-ordering.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Julien Grall of Amazon.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa340.patch           Xen 4.10 - xen-unstable

$ sha256sum xsa340*
72b75011b99e914ddb479082f88329063dcd1f55cc931059d950ecda276ee944  xsa340.meta
2bb088fcc1f8f79bf5ddb7b4e101cb1db76a343d2fb1cdafb7cd54612e4009da  xsa340.patch
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
b3JnAAoJEIP+FMlX6CvZaBsH/RbQVpTAfl0zd7RyKXO34WZnWsYfwC+l8erEtf51
rmETfcqQP5rjNZZKEIDWcoYbJQU1DdC5tfVarUEYbGzCxPyBXlckcNKWmIVpkWnC
i+/XBALNjErN3AoJJOc8Tb3nfOZJlRrh3PXaqFo+xOqBn2vijgQJCXlpr1yRLDov
CatUy5DWmzVWVgByrkHs9Y+hsK7hb+DzxFvNiZUE7kv8a+R3F3smNgXDe/N7AasL
ZCJNVpfJGjqpk+EnffaTti9gd2aPxxzzmsWAoiW0C/6s/eJckhj/LxF7ZG5WbuVT
inhxm6zkQwBwvSTM7GLZpOuPXPegI8/RX+fO6lqsD0bcuQo=
=J1Xd
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa340.meta"
Content-Disposition: attachment; filename="xsa340.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNDAsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICI5M2JlOTQzZTdkNzU5MDE1YmQ1ZGI0MWE0OGY2ZGNlNThl
NTgwZDVhIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
MzYsCiAgICAgICAgICAgIDMzNywKICAgICAgICAgICAgMzM4LAogICAgICAg
ICAgICAzMzkKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsK
ICAgICAgICAgICAgInhzYTM0MC5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMSI6IHsKICAgICAgIlJlY2lw
ZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYi
OiAiZGRhYWNjYmJhYjZiMTliZjIxZWQyYzA5N2YzMDU1YTNjMjU0NGM4ZCIs
CiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzMzLAogICAg
ICAgICAgICAzMzYsCiAgICAgICAgICAgIDMzNywKICAgICAgICAgICAgMzM4
LAogICAgICAgICAgICAzMzkKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0
Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM0MC5wYXRjaCIKICAgICAgICAg
IF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMiI6IHsKICAg
ICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJT
dGFibGVSZWYiOiAiMTMzNmNhMTc3NDI0NzFmYzRhNTk4NzlhZTJmNjM3YTU5
NTMwYTkzMyIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAg
MzMzLAogICAgICAgICAgICAzMzQsCiAgICAgICAgICAgIDMzNiwKICAgICAg
ICAgICAgMzM3LAogICAgICAgICAgICAzMzgsCiAgICAgICAgICAgIDMzOQog
ICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAg
ICAieHNhMzQwLnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAg
fQogICAgfSwKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAg
ICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI5YjM2N2Iy
YjBiNzE0ZjNmZmI2OWVkNmJlMGExMThlOGQzZWFjMDdmIiwKICAgICAgICAg
ICJQcmVyZXFzIjogWwogICAgICAgICAgICAzMzMsCiAgICAgICAgICAgIDMz
NCwKICAgICAgICAgICAgMzM2LAogICAgICAgICAgICAzMzcsCiAgICAgICAg
ICAgIDMzOCwKICAgICAgICAgICAgMzM5CiAgICAgICAgICBdLAogICAgICAg
ICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzNDAucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTQi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogImMzYTBmYzIyYWY5MGVmMjhlNjhiMTE2YzZh
NDlkOWNlYzU3ZjcxY2YiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAg
ICAgICAgIDMzMywKICAgICAgICAgICAgMzM0LAogICAgICAgICAgICAzMzYs
CiAgICAgICAgICAgIDMzNywKICAgICAgICAgICAgMzM4LAogICAgICAgICAg
ICAzMzkKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAg
ICAgICAgICAgInhzYTM0MC5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9
CiAgICAgIH0KICAgIH0sCiAgICAibWFzdGVyIjogewogICAgICAiUmVjaXBl
cyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6
ICJiMTE5MTAwODJkOTBiYjE1OTdmNjY3OTUyNGViNzI2YTMzMzA2NjcyIiwK
ICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzMzMsCiAgICAg
ICAgICAgIDMzNCwKICAgICAgICAgICAgMzM2LAogICAgICAgICAgICAzMzcs
CiAgICAgICAgICAgIDMzOCwKICAgICAgICAgICAgMzM5CiAgICAgICAgICBd
LAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzNDAu
cGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9CiAg
fQp9

--=separator
Content-Type: application/octet-stream; name="xsa340.patch"
Content-Disposition: attachment; filename="xsa340.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KU3ViamVj
dDogeGVuL2V2dGNobjogQWRkIG1pc3NpbmcgYmFycmllcnMgd2hlbiBhY2Nl
c3NpbmcvYWxsb2NhdGluZyBhbiBldmVudCBjaGFubmVsCgpXaGlsZSB0aGUg
YWxsb2NhdGlvbiBvZiBhIGJ1Y2tldCBpcyBhbHdheXMgcGVyZm9ybWVkIHdp
dGggdGhlIHBlci1kb21haW4KbG9jaywgdGhlIGJ1Y2tldCBtYXkgYmUgYWNj
ZXNzZWQgd2l0aG91dCB0aGUgbG9jayB0YWtlbiAoZm9yIGluc3RhbmNlLCBz
ZWUKZXZ0Y2huX3NlbmQoKSkuCgpJbnN0ZWFkIHN1Y2ggc2l0ZXMgcmVsaWVz
IG9uIHBvcnRfaXNfdmFsaWQoKSB0byByZXR1cm4gYSBub24temVybyB2YWx1
ZQp3aGVuIHRoZSBwb3J0IGhhcyBhIHN0cnVjdCBldnRjaG4gYXNzb2NpYXRl
ZCB0byBpdC4gVGhlIGZ1bmN0aW9uIHdpbGwKbW9zdGx5IGNoZWNrIHdoZXRo
ZXIgdGhlIHBvcnQgaXMgbGVzcyB0aGFuIGQtPnZhbGlkX2V2dGNobnMgYXMg
YWxsIHRoZQpidWNrZXRzL2V2ZW50IGNoYW5uZWxzIHNob3VsZCBiZSBhbGxv
Y2F0ZWQgdXAgdG8gdGhhdCBwb2ludC4KClVuZm9ydHVuYXRlbHkgYSBjb21w
aWxlciBpcyBmcmVlIHRvIHJlLW9yZGVyIHRoZSBhc3NpZ25tZW50IGluCmV2
dGNobl9hbGxvY2F0ZV9wb3J0KCkgc28gaXQgd291bGQgYmUgcG9zc2libGUg
dG8gaGF2ZSBkLT52YWxpZF9ldnRjaG5zCnVwZGF0ZWQgYmVmb3JlIHRoZSBu
ZXcgYnVja2V0IGhhcyBmaW5pc2ggdG8gYWxsb2NhdGUuCgpBZGRpdGlvbmFs
bHkgb24gQXJtLCBldmVuIGlmIHRoaXMgd2FzIGNvbXBpbGVkICJjb3JyZWN0
bHkiLCB0aGUKcHJvY2Vzc29yIGNhbiBzdGlsbCByZS1vcmRlciB0aGUgbWVt
b3J5IGFjY2Vzcy4KCkFkZCBhIHdyaXRlIG1lbW9yeSBiYXJyaWVyIGluIHRo
ZSBhbGxvY2F0aW9uIHNpZGUgYW5kIGEgcmVhZCBtZW1vcnkKYmFycmllciB3
aGVuIHRoZSBwb3J0IGlzIHZhbGlkIHRvIHByZXZlbnQgYW55IHJlLW9yZGVy
aW5nIGlzc3VlLgoKVGhpcyBpcyBYU0EtMzQwLgoKUmVwb3J0ZWQtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+ClNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
CgotLS0gYS94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYworKysgYi94ZW4v
Y29tbW9uL2V2ZW50X2NoYW5uZWwuYwpAQCAtMTc4LDYgKzE3OCwxMyBAQCBp
bnQgZXZ0Y2huX2FsbG9jYXRlX3BvcnQoc3RydWN0IGRvbWFpbiAqCiAgICAg
ICAgICAgICByZXR1cm4gLUVOT01FTTsKICAgICAgICAgYnVja2V0X2Zyb21f
cG9ydChkLCBwb3J0KSA9IGNobjsKCisgICAgICAgIC8qCisgICAgICAgICAq
IGQtPnZhbGlkX2V2dGNobnMgaXMgdXNlZCB0byBjaGVjayB3aGV0aGVyIHRo
ZSBidWNrZXQgY2FuIGJlCisgICAgICAgICAqIGFjY2Vzc2VkIHdpdGhvdXQg
dGhlIHBlci1kb21haW4gbG9jay4gVGhlcmVmb3JlLAorICAgICAgICAgKiBk
LT52YWxpZF9ldnRjaG5zIHNob3VsZCBiZSBzZWVuICphZnRlciogdGhlIG5l
dyBidWNrZXQgaGFzCisgICAgICAgICAqIGJlZW4gc2V0dXAuCisgICAgICAg
ICAqLworICAgICAgICBzbXBfd21iKCk7CiAgICAgICAgIHdyaXRlX2F0b21p
YygmZC0+dmFsaWRfZXZ0Y2hucywgZC0+dmFsaWRfZXZ0Y2hucyArIEVWVENI
TlNfUEVSX0JVQ0tFVCk7CiAgICAgfQoKLS0tIGEveGVuL2luY2x1ZGUveGVu
L2V2ZW50LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2V2ZW50LmgKQEAgLTEw
Nyw3ICsxMDcsMTcgQEAgdm9pZCBub3RpZnlfdmlhX3hlbl9ldmVudF9jaGFu
bmVsKHN0cnVjdAoKIHN0YXRpYyBpbmxpbmUgYm9vbF90IHBvcnRfaXNfdmFs
aWQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHApCiB7Ci0gICAg
cmV0dXJuIHAgPCByZWFkX2F0b21pYygmZC0+dmFsaWRfZXZ0Y2hucyk7Cisg
ICAgaWYgKCBwID49IHJlYWRfYXRvbWljKCZkLT52YWxpZF9ldnRjaG5zKSAp
CisgICAgICAgIHJldHVybiBmYWxzZTsKKworICAgIC8qCisgICAgICogVGhl
IGNhbGxlciB3aWxsIHVzdWFsbHkgYWNjZXNzIHRoZSBldmVudCBjaGFubmVs
IGFmdGVyd2FyZHMgYW5kCisgICAgICogbWF5IGJlIGRvbmUgd2l0aG91dCB0
YWtpbmcgdGhlIHBlci1kb21haW4gbG9jay4gVGhlIGJhcnJpZXIgaXMKKyAg
ICAgKiBnb2luZyBpbiBwYWlyIHRoZSBzbXBfd21iKCkgYmFycmllciBpbiBl
dnRjaG5fYWxsb2NhdGVfcG9ydCgpLgorICAgICAqLworICAgIHNtcF9ybWIo
KTsKKworICAgIHJldHVybiB0cnVlOwogfQoKIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IGV2dGNobiAqZXZ0Y2huX2Zyb21fcG9ydChzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBpbnQgcCkK

--=separator--

