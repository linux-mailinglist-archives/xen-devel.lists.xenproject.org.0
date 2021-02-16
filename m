Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA32831CA95
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 13:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85541.160516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzaM-0002Uw-GD; Tue, 16 Feb 2021 12:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85541.160516; Tue, 16 Feb 2021 12:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBzaM-0002Tu-AK; Tue, 16 Feb 2021 12:36:10 +0000
Received: by outflank-mailman (input) for mailman id 85541;
 Tue, 16 Feb 2021 12:36:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y7oK=HS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lBzaK-0001zb-55
 for xen-devel@lists.xen.org; Tue, 16 Feb 2021 12:36:08 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9ef4170-2346-4d91-8c5f-8c90166e5d6e;
 Tue, 16 Feb 2021 12:35:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZj-0008N9-FT; Tue, 16 Feb 2021 12:35:31 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZj-0002cK-EW; Tue, 16 Feb 2021 12:35:31 +0000
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
X-Inumbo-ID: d9ef4170-2346-4d91-8c5f-8c90166e5d6e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=IHjlcNqY9zVQG6xPpJPwS1esZBtm3kl4cjbgTTWsTRU=; b=Ww+Gi67omVf9Ru77k14K1xTV/Z
	h3mTaS7e/r1khuCnYVxpZuOomlXQz+ykuTN4mO1X4xfDDy1ChAc4a4lwU0tVy4yIifF0tXvA7LxU7
	/9uRxUDcrduK7p9U1CnLG9275u2h31jacTH0Yh+J7ZERTlYM9RfSGhAXQpMg7WMtrb+0=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 364 v3 (CVE-2021-26933) - arm: The cache
 may not be cleaned for newly allocated scrubbed pages
Message-Id: <E1lBzZj-0002cK-EW@xenbits.xenproject.org>
Date: Tue, 16 Feb 2021 12:35:31 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-26933 / XSA-364
                               version 3

 arm: The cache may not be cleaned for newly allocated scrubbed pages

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

On Arm, a guest is allowed to control whether memory access bypass the
cache.  This means that Xen needs to ensure that all writes (such as
the ones during scrubbing) have reached memory before handing over the
page to a guest.

Unfortunately the operation to clean the cache happens before checking
if the page was scrubbed.  Therefore there is no guarantee when all
the writes will reach the memory.

IMPACT
======

A malicious guest may be able to read sensitive data from memory that
previously belonged to another guest.

VULNERABLE SYSTEMS
==================

Xen version 4.9 onwards are vulnerable. Only Arm systems are vulnerable.

MITIGATION
==========

There is no known mitigation.

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

xsa364.patch           xen-unstable - 4.11

$ sha256sum xsa364*
c9dcb3052bb6ca4001e02b3ad889c70b4eebf1931bef83dfb7de86452851f3c8  xsa364.meta
dc313c70bb07b4096bbc4612cbbc180589923277411dede2fda37f04ecc846d6  xsa364.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmAru/UMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZT0UH/0Lzw4sShqmyO06n0HWcXyzXKx7Qh67tjBglmB0D
XHKrlTKR0Cs1S2NR3GCSZCSPNKXcXU689qEXlvK07EpheO/xCUgpZNkt/Eab/JFK
NngYbuev1z6+bGeCi70b6RItCXoWiwDWEJqLlLKROwBXMZaodwgjY7/o3GR2D8ZV
Qyz2EcAdJUIYmMsLC3hJ7gTLXvdySp+0lZ9oO6qe4YYQ3CIwPJnlflWFTzcASfML
D9lMVG6u6ratiqt4N1egE0gxBe3/QP8KoptSqiV+MDdwPnsK009g/G+0Ea430ZEh
lviVSgCxhdELx2Tv+Q7qSSbnfMSdnibSHAxipcbyhvjiEJU=
=mHyv
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa364.meta"
Content-Disposition: attachment; filename="xsa364.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNjQsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwK
ICAiUmVjaXBlcyI6IHsKICAgICI0LjExIjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIz
MTBhYjc5ODc1Y2I3MDVjYzJjN2RhZGRmZjQxMmI1YTQ4OTlmOGM5IiwKICAg
ICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsK
ICAgICAgICAgICAgInhzYTM2NC5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMiI6IHsKICAgICAgIlJlY2lw
ZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYi
OiAiY2NlN2NiZDk4NmMxMjJhODY1ODJmZjM3NzViNmI1NTlkODc3NDA3YyIs
CiAgICAgICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMi
OiBbCiAgICAgICAgICAgICJ4c2EzNjQucGF0Y2giCiAgICAgICAgICBdCiAg
ICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTMiOiB7CiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogImU0MTYxOTM4YjMxNWYzYjljNmExM2FkZTMwZDE2YzExNTA0YTJk
MTYiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQYXRj
aGVzIjogWwogICAgICAgICAgICAieHNhMzY0LnBhdGNoIgogICAgICAgICAg
XQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjE0IjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICI0MTcwMjE4Y2I5NjU0NjQyNjY2NGU1YzFkMDBjNWE4NDhh
MjZhZTllIiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM2NC5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAibWFzdGVyIjog
ewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAg
ICAgIlN0YWJsZVJlZiI6ICI1ZTdhYTkwNDQwNWZhMmYyNjhjM2FmMjEzNTE2
YmFlMjcxZGUzMjY1IiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAg
ICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM2NC5wYXRjaCIK
ICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9Cn0K

--=separator
Content-Type: application/octet-stream; name="xsa364.patch"
Content-Disposition: attachment; filename="xsa364.patch"
Content-Transfer-Encoding: base64

RnJvbSBkYWRiNWI0YjIxYzkwNGNlNTkwMjRjNjg2ZWIxYzU1YmU4ZjQ2YzUy
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgpEYXRlOiBUaHUsIDIxIEphbiAyMDIxIDEw
OjE2OjA4ICswMDAwClN1YmplY3Q6IFtQQVRDSF0geGVuL3BhZ2VfYWxsb2M6
IE9ubHkgZmx1c2ggdGhlIHBhZ2UgdG8gUkFNIG9uY2Ugd2Uga25vdyB0aGV5
CiBhcmUgc2NydWJiZWQKCkF0IHRoZSBtb21lbnQsIGVhY2ggcGFnZSBhcmUg
Zmx1c2hlZCB0byBSQU0ganVzdCBhZnRlciB0aGUgYWxsb2NhdG9yCmZvdW5k
IHNvbWUgZnJlZSBwYWdlcy4gSG93ZXZlciwgdGhpcyBpcyBoYXBwZW5pbmcg
YmVmb3JlIGNoZWNrIGlmIHRoZQpwYWdlIHdhcyBzY3J1YmJlZC4KCkFzIGEg
Y29uc2VxdWVuY2UsIG9uIEFybSwgYSBndWVzdCBtYXkgYmUgYWJsZSB0byBh
Y2Nlc3MgdGhlIG9sZCBjb250ZW50Cm9mIHRoZSBzY3J1YmJlZCBwYWdlcyBp
ZiBpdCBoYXMgY2FjaGUgZGlzYWJsZWQgKGRlZmF1bHQgYXQgYm9vdCkgYW5k
CnRoZSBjb250ZW50IGRpZG4ndCByZWFjaCB0aGUgUG9pbnQgb2YgQ29oZXJl
bmN5LgoKVGhlIGZsdXNoIGlzIG5vdyBtb3ZlZCBhZnRlciB3ZSBrbm93IHRo
ZSBjb250ZW50IG9mIHRoZSBwYWdlIHdpbGwgbm90CmNoYW5nZS4gVGhpcyBh
bHNvIGhhcyB0aGUgYmVuZWZpdCB0byByZWR1Y2UgdGhlIGFtb3VudCBvZiB3
b3JrIGhhcHBlbmluZwp3aXRoIHRoZSBoZWFwX2xvY2sgaGVsZC4KClRoaXMg
aXMgWFNBLTM2NC4KCkZpeGVzOiAzMDdjM2JlM2NjYjIgKCJtbTogRG9uJ3Qg
c2NydWIgcGFnZXMgd2hpbGUgaG9sZGluZyBoZWFwIGxvY2sgaW4gYWxsb2Nf
aGVhcF9wYWdlcygpIikKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3BhZ2VfYWxsb2Mu
YyB8IDE0ICsrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMK
aW5kZXggMDJhYzFmYTYxM2U3Li4xNzQ0ZTZmYWE1YzQgMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCisrKyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jCkBAIC05MjQsNiArOTI0LDcgQEAgc3RhdGljIHN0cnVjdCBw
YWdlX2luZm8gKmFsbG9jX2hlYXBfcGFnZXMoCiAgICAgYm9vbCBuZWVkX3Rs
YmZsdXNoID0gZmFsc2U7CiAgICAgdWludDMyX3QgdGxiZmx1c2hfdGltZXN0
YW1wID0gMDsKICAgICB1bnNpZ25lZCBpbnQgZGlydHlfY250ID0gMDsKKyAg
ICBtZm5fdCBtZm47CiAKICAgICAvKiBNYWtlIHN1cmUgdGhlcmUgYXJlIGVu
b3VnaCBiaXRzIGluIG1lbWZsYWdzIGZvciBub2RlSUQuICovCiAgICAgQlVJ
TERfQlVHX09OKChfTUVNRl9iaXRzIC0gX01FTUZfbm9kZSkgPCAoOCAqIHNp
emVvZihub2RlaWRfdCkpKTsKQEAgLTEwMjIsMTEgKzEwMjMsNiBAQCBzdGF0
aWMgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfaGVhcF9wYWdlcygKICAgICAg
ICAgcGdbaV0udS5pbnVzZS50eXBlX2luZm8gPSAwOwogICAgICAgICBwYWdl
X3NldF9vd25lcigmcGdbaV0sIE5VTEwpOwogCi0gICAgICAgIC8qIEVuc3Vy
ZSBjYWNoZSBhbmQgUkFNIGFyZSBjb25zaXN0ZW50IGZvciBwbGF0Zm9ybXMg
d2hlcmUgdGhlCi0gICAgICAgICAqIGd1ZXN0IGNhbiBjb250cm9sIGl0cyBv
d24gdmlzaWJpbGl0eSBvZi90aHJvdWdoIHRoZSBjYWNoZS4KLSAgICAgICAg
ICovCi0gICAgICAgIGZsdXNoX3BhZ2VfdG9fcmFtKG1mbl94KHBhZ2VfdG9f
bWZuKCZwZ1tpXSkpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAhKG1l
bWZsYWdzICYgTUVNRl9ub19pY2FjaGVfZmx1c2gpKTsKICAgICB9CiAKICAg
ICBzcGluX3VubG9jaygmaGVhcF9sb2NrKTsKQEAgLTEwNjIsNiArMTA1OCwx
NCBAQCBzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfaGVhcF9wYWdl
cygKICAgICBpZiAoIG5lZWRfdGxiZmx1c2ggKQogICAgICAgICBmaWx0ZXJl
ZF9mbHVzaF90bGJfbWFzayh0bGJmbHVzaF90aW1lc3RhbXApOwogCisgICAg
LyoKKyAgICAgKiBFbnN1cmUgY2FjaGUgYW5kIFJBTSBhcmUgY29uc2lzdGVu
dCBmb3IgcGxhdGZvcm1zIHdoZXJlIHRoZSBndWVzdAorICAgICAqIGNhbiBj
b250cm9sIGl0cyBvd24gdmlzaWJpbGl0eSBvZi90aHJvdWdoIHRoZSBjYWNo
ZS4KKyAgICAgKi8KKyAgICBtZm4gPSBwYWdlX3RvX21mbihwZyk7CisgICAg
Zm9yICggaSA9IDA7IGkgPCAoMVUgPDwgb3JkZXIpOyBpKysgKQorICAgICAg
ICBmbHVzaF9wYWdlX3RvX3JhbShtZm5feChtZm4pICsgaSwgIShtZW1mbGFn
cyAmIE1FTUZfbm9faWNhY2hlX2ZsdXNoKSk7CisKICAgICByZXR1cm4gcGc7
CiB9CiAKLS0gCjIuMTcuMQoK

--=separator--

