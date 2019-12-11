Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C2E11AA7B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 13:08:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0kc-00052s-LL; Wed, 11 Dec 2019 12:05:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+9Em=2B=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1if0ka-00052f-OM
 for xen-devel@lists.xen.org; Wed, 11 Dec 2019 12:05:52 +0000
X-Inumbo-ID: 92eba66a-1c0e-11ea-88e7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92eba66a-1c0e-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 12:05:51 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1if0kQ-0008LX-Qu; Wed, 11 Dec 2019 12:05:42 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1if0kQ-0008H0-ON; Wed, 11 Dec 2019 12:05:42 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Message-Id: <E1if0kQ-0008H0-ON@xenbits.xenproject.org>
Date: Wed, 11 Dec 2019 12:05:42 +0000
Subject: [Xen-devel] Xen Security Advisory 307 v3 (CVE-2019-19581,
 CVE-2019-19582) - find_next_bit() issues
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Xen.org security team" <security-team-members@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

    Xen Security Advisory CVE-2019-19581,CVE-2019-19582 / XSA-307
                              version 3

                        find_next_bit() issues

UPDATES IN VERSION 3
====================

Public release.

Updated metadata to add 4.13, update StableRef's

ISSUE DESCRIPTION
=================

In a number of places bitmaps are being used by the hypervisor to track
certain state.  Iteration over all bits involves functions which may
misbehave in certain corner cases:
- - On 32-bit Arm accesses to bitmaps with bit a count which is a multiple
  of 32, an out of bounds access may occur.  (CVE-2019-19581)
- - On x86 accesses to bitmaps with a compile time known size of 64 may
  incur undefined behavior, which may in particular result in infinite
  loops. (CVE-2019-19582)

IMPACT
======

A malicious guest may cause a hypervisor crash or hang, resulting in a
Denial of Service (DoS).

VULNERABLE SYSTEMS
==================

All versions of Xen are vulnerable.

32-bit Arm systems are vulnerable.

x86 systems with 64 or more nodes are vulnerable.  We are unaware of any
such systems that Xen would run on.

64-bit Arm systems as well as x86 systems with less than 64 nodes are
not vulnerable.

MITIGATION
==========

There is no known mitigation for 32-bit Arm systems.

For x86 systems the issue can be avoided by suppressing the use of NUMA
information provided by firmware, via the "numa=off" command line
option.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa307.patch           xen-unstable, Xen 4.13.x ... 4.8.x

$ sha256sum xsa307*
e589e96a0b3ec66f1d2d6393b82fab13ed18fd9fb112044a12263336b8499c68  xsa307.meta
7df052768cc05329bc44bf724897227885da8bb2cde9ff01d0ba2a34611bde97  xsa307.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl3w24gMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZxokH/2bGTmGUZP0tyc+oDHjlrr3+FarhoJnRTl4EoqJS
hzsa5OkcqzcEgrQ+7VL7dLW3AboT2zcx2RQ9HyxCz61BfDY1XF8EDDr6chJiNofN
J7OGirNzSBHFFQJOc2KFG8al+1F8WzzKP3UMbqNBrqB07/tQc5lttdbA/t5Tnp9c
xreCAkkBscDk1LFR8HiUA3YeykiHQtF09O+VnxXO2AD/Dpo8e+K6AmJkCZ4+ysNP
JKMc13vQ3UKjMmYzgbuNCIswNu1Wy3EnNZMf2zvGIhuw6iN6vSJJgoz0OSPUb4yY
kXEe1dlgseSbMxXEqj4IyZ69pEw6Ijj+H6PybQo/IOie7q0=
=7XWU
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa307.meta"
Content-Disposition: attachment; filename="xsa307.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMDcsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIsCiAgICAiNC4xMSIs
CiAgICAiNC4xMCIsCiAgICAiNC45IiwKICAgICI0LjgiCiAgXSwKICAiVHJl
ZXMiOiBbCiAgICAieGVuIgogIF0sCiAgIlJlY2lwZXMiOiB7CiAgICAiNC4x
MCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAg
ICAgICAgICJTdGFibGVSZWYiOiAiZTQ4OTk1NTBmZjc4MzRlMWVhNWRmYmJm
YjFjNjE4ZjY0ZTI0Nzc2MSIsCiAgICAgICAgICAiUHJlcmVxcyI6IFtdLAog
ICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMDcucGF0
Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAg
IjQuMTEiOiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7
CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjIzOWQzN2U1MTRjOTNlMjlkNTBk
NzFmNzM0YjFkYzQ1M2IyMjM2YTYiLAogICAgICAgICAgIlByZXJlcXMiOiBb
XSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzA3
LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwK
ICAgICI0LjEyIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVu
IjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIyMTJiODUwMGNiMzk0YjNh
NjY0NjU1Zjc5Y2EwYmRjYjMxMjQ2ZmY3IiwKICAgICAgICAgICJQcmVyZXFz
IjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhz
YTMwNy5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAg
IH0sCiAgICAiNC4xMyI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiZmQ5YmZhYmY2OWVh
NTlmMjI4MGMxNzAzNTAwNzkzZmExNWU4MTk1NiIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAg
ICJ4c2EzMDcucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9
CiAgICB9LAogICAgIjQuOCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAg
ICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiYTI2MGU5M2Ri
Nzk0ZjU2MDUwMmU4OTg1OWFhZjExMWQxNzhlODBlNCIsCiAgICAgICAgICAi
UHJlcmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAg
ICAgICJ4c2EzMDcucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAg
ICB9CiAgICB9LAogICAgIjQuOSI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAg
ICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiOGQxZWU5
ZjJjNDczZmVjNTRiNTAxOGMwMWFkNTU2ZDdhZmQ2MmMxNyIsCiAgICAgICAg
ICAiUHJlcmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAg
ICAgICAgICJ4c2EzMDcucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQog
ICAgICB9CiAgICB9LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMi
OiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAi
YjczYWFkNGM4YjZhNzY3Y2UxNWNjOGNiNjVmOWVlYWI3YmZjY2RhZSIsCiAg
ICAgICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBb
CiAgICAgICAgICAgICJ4c2EzMDcucGF0Y2giCiAgICAgICAgICBdCiAgICAg
ICAgfQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa307.patch"
Content-Disposition: attachment; filename="xsa307.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYrQXJtMzI6IG1ha2UgZmluZF9uZXh0X3ssemVyb199Yml0KCkgaGF2
ZSB3ZWxsIGRlZmluZWQgYmVoYXZpb3IKClRoZXNlIGZ1bmN0aW9ucyBnZXR0
aW5nIHVzZWQgd2l0aCB0aGUgMm5kIGFuZCAzcmQgYXJndW1lbnRzIGJlaW5n
IGVxdWFsCndhc24ndCB3ZWxsIGRlZmluZWQ6IEFybTY0IHJlbGlhYmx5IHJl
dHVybnMgdGhlIHZhbHVlIG9mIHRoZSAybmQKYXJndW1lbnQgaW4gdGhpcyBj
YXNlLCB3aGlsZSBvbiB4ODYgZm9yIGJpdG1hcHMgdXAgdG8gNjQgYml0cyB3
aWRlIHRoZQpyZXR1cm4gdmFsdWUgd2FzIHVuZGVmaW5lZCAoZHVlIHRvIHRo
ZSB1bmRlZmluZWQgYmVoYXZpb3Igb2YgYSBzaGlmdCBvZgphIHZhbHVlIGJ5
IHRoZSBudW1iZXIgb2YgYml0cyBpdCdzIHdpZGUpIHdoZW4gdGhlIGluY29t
aW5nIHZhbHVlIHdhcyA2NC4KT24gQXJtMzIgYW4gYWN0dWFsIG91dCBvZiBi
b3VuZHMgYWNjZXNzIHdvdWxkIGhhcHBlbiB3aGVuIHRoZQpzaXplL29mZnNl
dCB2YWx1ZSBpcyBhIG11bHRpcGxlIG9mIDMyOyBpZiB0aGlzIGFjY2VzcyBk
b2Vzbid0IGZhdWx0LCB0aGUKcmV0dXJuIHZhbHVlIHdvdWxkIGhhdmUgYmVl
biBzdWZmaWNpZW50bHkgY29ycmVjdCBhZmFpY3QuCgpNYWtlIHRoZSBmdW5j
dGlvbnMgY29uc2lzdGVudGx5IHRvbGVyYXRlIHRoZSBsYXN0IHR3byBhcmd1
bWVudHMgYmVpbmcKZXF1YWwgKGFuZCBpbiBmYWN0IHRoZSAzcmQgYXJndW1l
bnQgYmVpbmcgZ3JlYXRlciBvciBlcXVhbCB0byB0aGUgMm5kKSwKaW4gZmF2
b3Igb2YgZmluZGluZyBhbmQgZml4aW5nIGFsbCB0aGUgdXNlIHNpdGVzIHRo
YXQgdmlvbGF0ZSB0aGUKb3JpZ2luYWwgbW9yZSBzdHJpY3QgYXNzdW1wdGlv
bi4KClRoaXMgaXMgWFNBLTMwNy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQWNrZWQtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+Ci0tLQpUaGUgbW9zdCBvYnZpb3VzIChhbGJl
aXQgc3RpbGwgaW5kaXJlY3QpIGV4cG9zdXJlIHRvIGd1ZXN0cyBpcwpldnRj
aG5fY2hlY2tfcG9sbGVycygpLCB3aGljaCBpbW8gbWFrZXMgdGhpcyBhIHNl
Y3VyaXR5IGlzc3VlIGF0IGxlYXN0CmZvciBBcm0zMi4KClRoaXMgd2FzIG9y
aWdpbmFsbHkgYWxyZWFkeSBkaXNjdXNzZWQgYmV0d2VlbiAoYXQgbGVhc3Qp
IEFuZHJldyBhbmQgbWUsCmFuZCBJIGRvbid0IHJlYWxseSByZWNhbGwgd2hv
IGJyb3VnaHQgdXAgdGhlIGlzc3VlIGZpcnN0LgoKTm90ZSB0aGF0IEFybSdz
IExpbnV4IG9yaWdpbiBvZiB0aGUgY29kZSBtYXkgY2FsbCBmb3Igc3luY2lu
ZwpwdWJsaWNhdGlvbiB3aXRoIHRoZW0uIFRoZW4gYWdhaW4gSSBkb24ndCB3
YW50IHRvIHRlbGwgdGhlbSBqdXN0IHRvIHNlZQp0aGVtIGdvIHB1YmxpYyBh
aGVhZCBvZiB1cy4KCi0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9saWIvZmlu
ZGJpdC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9saWIvZmluZGJpdC5T
CkBAIC00Miw4ICs0Miw4IEBAIEVORFBST0MoX2ZpbmRfZmlyc3RfemVyb19i
aXRfbGUpCiAgKiBQcm90b3R5cGU6IGludCBmaW5kX25leHRfemVyb19iaXQo
dm9pZCAqYWRkciwgdW5zaWduZWQgaW50IG1heGJpdCwgaW50IG9mZnNldCkK
ICAqLwogRU5UUlkoX2ZpbmRfbmV4dF96ZXJvX2JpdF9sZSkKLQkJdGVxCXIx
LCAjMAotCQliZXEJM2IKKwkJY21wCXIxLCByMgorCQlibHMJM2IKIAkJYW5k
cwlpcCwgcjIsICM3CiAJCWJlcQkxYgkJCUAgSWYgbmV3IGJ5dGUsIGdvdG8g
b2xkIHJvdXRpbmUKICBBUk0oCQlsZHJiCXIzLCBbcjAsIHIyLCBsc3IgIzNd
CSkKQEAgLTgzLDggKzgzLDggQEAgRU5EUFJPQyhfZmluZF9maXJzdF9iaXRf
bGUpCiAgKiBQcm90b3R5cGU6IGludCBmaW5kX25leHRfemVyb19iaXQodm9p
ZCAqYWRkciwgdW5zaWduZWQgaW50IG1heGJpdCwgaW50IG9mZnNldCkKICAq
LwogRU5UUlkoX2ZpbmRfbmV4dF9iaXRfbGUpCi0JCXRlcQlyMSwgIzAKLQkJ
YmVxCTNiCisJCWNtcAlyMSwgcjIKKwkJYmxzCTNiCiAJCWFuZHMJaXAsIHIy
LCAjNwogCQliZXEJMWIJCQlAIElmIG5ldyBieXRlLCBnb3RvIG9sZCByb3V0
aW5lCiAgQVJNKAkJbGRyYglyMywgW3IwLCByMiwgbHNyICMzXQkpCkBAIC0x
MTcsOCArMTE3LDggQEAgRU5UUlkoX2ZpbmRfZmlyc3RfemVyb19iaXRfYmUp
CiBFTkRQUk9DKF9maW5kX2ZpcnN0X3plcm9fYml0X2JlKQogCiBFTlRSWShf
ZmluZF9uZXh0X3plcm9fYml0X2JlKQotCQl0ZXEJcjEsICMwCi0JCWJlcQkz
YgorCQljbXAJcjEsIHIyCisJCWJscwkzYgogCQlhbmRzCWlwLCByMiwgIzcK
IAkJYmVxCTFiCQkJQCBJZiBuZXcgYnl0ZSwgZ290byBvbGQgcm91dGluZQog
CQllb3IJcjMsIHIyLCAjMHgxOAkJQCBiaWcgZW5kaWFuIGJ5dGUgb3JkZXJp
bmcKQEAgLTE1MSw4ICsxNTEsOCBAQCBFTlRSWShfZmluZF9maXJzdF9iaXRf
YmUpCiBFTkRQUk9DKF9maW5kX2ZpcnN0X2JpdF9iZSkKIAogRU5UUlkoX2Zp
bmRfbmV4dF9iaXRfYmUpCi0JCXRlcQlyMSwgIzAKLQkJYmVxCTNiCisJCWNt
cAlyMSwgcjIKKwkJYmxzCTNiCiAJCWFuZHMJaXAsIHIyLCAjNwogCQliZXEJ
MWIJCQlAIElmIG5ldyBieXRlLCBnb3RvIG9sZCByb3V0aW5lCiAJCWVvcgly
MywgcjIsICMweDE4CQlAIGJpZyBlbmRpYW4gYnl0ZSBvcmRlcmluZwotLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2JpdG9wcy5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvYml0b3BzLmgKQEAgLTM1OCw3ICszNTgsNyBAQCBzdGF0
aWMgYWx3YXlzX2lubGluZSB1bnNpZ25lZCBpbnQgX19zY2FuCiAgICAgY29u
c3QgdW5zaWduZWQgbG9uZyAqYV9fID0gKGFkZHIpOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgIHVuc2lnbmVkIGludCBz
X18gPSAoc2l6ZSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKICAgICB1bnNpZ25lZCBpbnQgb19fID0gKG9mZik7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCi0gICAgaWYgKCBfX2J1aWx0aW5fY29uc3RhbnRfcChzaXplKSAmJiAh
c19fICkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgIGlm
ICggb19fID49IHNfXyApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgcl9fID0gc19f
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCiAgICAgZWxzZSBpZiAoIF9fYnVpbHRpbl9jb25z
dGFudF9wKHNpemUpICYmIHNfXyA8PSBCSVRTX1BFUl9MT05HICkgICAgICAg
ICAgXAogICAgICAgICByX18gPSBvX18gKyBfX3NjYW5iaXQoKihjb25zdCB1
bnNpZ25lZCBsb25nICopKGFfXykgPj4gb19fLCBzX18pOyAgIFwKQEAgLTM5
MCw3ICszOTAsNyBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSB1bnNpZ25lZCBp
bnQgX19zY2FuCiAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAqYV9fID0gKGFk
ZHIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAog
ICAgIHVuc2lnbmVkIGludCBzX18gPSAoc2l6ZSk7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICB1bnNpZ25l
ZCBpbnQgb19fID0gKG9mZik7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCi0gICAgaWYgKCBfX2J1aWx0aW5fY29u
c3RhbnRfcChzaXplKSAmJiAhc19fICkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAorICAgIGlmICggb19fID49IHNfXyApICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
ICAgICAgICAgcl9fID0gc19fOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgZWxzZSBp
ZiAoIF9fYnVpbHRpbl9jb25zdGFudF9wKHNpemUpICYmIHNfXyA8PSBCSVRT
X1BFUl9MT05HICkgICAgICAgICAgXAogICAgICAgICByX18gPSBvX18gKyBf
X3NjYW5iaXQofiooY29uc3QgdW5zaWduZWQgbG9uZyAqKShhX18pID4+IG9f
Xywgc19fKTsgIFwK

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--

