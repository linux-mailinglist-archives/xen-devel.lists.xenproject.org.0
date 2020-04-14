Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0C81A7A3B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 14:01:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOKFl-0007ka-JT; Tue, 14 Apr 2020 12:01:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/bN9=56=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1jOKFj-0007jP-32
 for xen-devel@lists.xen.org; Tue, 14 Apr 2020 12:01:19 +0000
X-Inumbo-ID: 97cf226a-7e47-11ea-8927-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97cf226a-7e47-11ea-8927-12813bfff9fa;
 Tue, 14 Apr 2020 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LgG6yNBk6P6fulZ3TDuK42nX5L8NWGH0VJ9PKzbpb4w=; b=f+XLhCs5NJwWOX0af8pWUNosyf
 IHue8q37Qy5Eq8W3ml8vbj0A98N3NKuKJOh6LguhENaX2OLTDrrikXsf4FhqEVxpcB7u1Z2KBT/b4
 8mLo/5REBYj1nr99JPsUyijycpZ5c4/mUt1+m0X8CcvUT3hRh6OeImV9XI3XsDWE06o4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jOKFE-0000Yj-9E; Tue, 14 Apr 2020 12:00:48 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.89)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jOKFE-00074e-81; Tue, 14 Apr 2020 12:00:48 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.508 (Entity 5.508)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 316 v3 (CVE-2020-11743) - Bad error path in
 GNTTABOP_map_grant
Message-Id: <E1jOKFE-00074e-81@xenbits.xenproject.org>
Date: Tue, 14 Apr 2020 12:00:48 +0000
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

            Xen Security Advisory CVE-2020-11743 / XSA-316
                               version 3

                 Bad error path in GNTTABOP_map_grant

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Grant table operations are expected to return 0 for success, and a
negative number for errors.  Some misplaced brackets cause one error
path to return 1 instead of a negative value.

The grant table code in Linux treats this condition as success, and
proceeds with incorrectly initialised state.

IMPACT
======

A buggy or malicious guest can construct its grant table in such a way
that, when a backend domain tries to map a grant, it hits the incorrect
error path.

This will crash a Linux based dom0 or backend domain.

VULNERABLE SYSTEMS
==================

Systems running any version of Xen with the XSA-295 fixes are
vulnerable.  Systems which have not yet taken the XSA-295 fixes are not
vulnerable.

Systems running a Linux based dom0 or driver domain are vulnerable.

Systems running a FreeBSD or NetBSD based dom0 or driver domain are not
impacted, as they both treat any nonzero value as a failure.

The vulnerability of other systems will depend on how they behave when
getting an unexpected positive number from the GNTTABOP_map_grant
hypercall.

MITIGATION
==========

Applying the Linux patches alone is sufficient to mitigate the issue.
This might be a preferred route for downstreams who support livepatching
Linux but not Xen.

CREDITS
=======

This issue was discovered by Ross Lagerwall of Citrix.

RESOLUTION
==========

Applying the appropriate Xen patch will resolve this issue.

Additionally, a Linux patch is provided to make Linux's behaviour more
robust to unexpected values.

We recommend taking both patches if at all possible.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa316/xsa316-xen.patch       Xen 4.9 - xen-unstable
xsa316/xsa316-linux.patch     Linux

$ sha256sum xsa316*/*
7dcd02e8cc0434046747d572bc6c77cd3a2e4041eefd2fa703f4130e998b58dd  xsa316/xsa316-linux.patch
4007578e30730861750d8808c0b63f2e03bbb05df909d71de19201084816a8b9  xsa316/xsa316-xen.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl6Vpd0MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZjOgH/1xKsvqDnR04knl9OWvgL690gqxZpwliRRDwwkWh
1kOHJq2jsvm5bq38fYY9WpvmtvHW/RoM53Kacyz1Rl0y9VvK6hDU7P5np4WkMueX
iEJOcIbQau1Pg8/zD8hYkqNNGTCjb79ZhggTih1HxpeZJTa7TJv9bNsZpCQkw+P/
EBXpfsqoPqAMN1qt5PclCT5zlasyBUVjW6+lF3tF6q77knQoWNpKbIOSqL2/V2/p
vUMP/qyUikWW8JLH8N48jpRmFzjxwoDI4/3E1sbSv2VxlX1FksbZxan1cwcjoSG6
004GYSxqOjP4oPEAOrC6sXxc6DKoLLa8SVzYNhkg3XoScY0=
=qCJA
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa316/xsa316-linux.patch"
Content-Disposition: attachment; filename="xsa316/xsa316-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4veGVuYnVzOiBlbnN1cmUgeGVuYnVzX21hcF9yaW5nX3ZhbGxvYygp
IHJldHVybnMgcHJvcGVyIGdyYW50IHN0YXR1cwoKeGVuYnVzX21hcF9yaW5n
X3ZhbGxvYygpIG1hcHMgYSByaW5nIHBhZ2UgYW5kIHJldHVybnMgdGhlIHN0
YXR1cyBvZiB0aGUKdXNlZCBncmFudCAoMCBtZWFuaW5nIHN1Y2Nlc3MpLgoK
VGhlcmUgYXJlIFhlbiBoeXBlcnZpc29ycyB3aGljaCBtaWdodCByZXR1cm4g
dGhlIHZhbHVlIDEgZm9yIHRoZSBzdGF0dXMKb2YgYSBmYWlsZWQgZ3JhbnQg
bWFwcGluZyBkdWUgdG8gYSBidWcuIFNvbWUgY2FsbGVycyBvZgp4ZW5idXNf
bWFwX3JpbmdfdmFsbG9jKCkgdGVzdCBmb3IgZXJyb3JzIGJ5IHRlc3Rpbmcg
dGhlIHJldHVybmVkIHN0YXR1cwp0byBiZSBsZXNzIHRoYW4gemVybywgcmVz
dWx0aW5nIGluIG5vIGVycm9yIGRldGVjdGVkIGFuZCBjcmFzaGluZyBsYXRl
cgpkdWUgdG8gYSBub3QgYXZhaWxhYmxlIHJpbmcgcGFnZS4KClNldCB0aGUg
cmV0dXJuIHZhbHVlIG9mIHhlbmJ1c19tYXBfcmluZ192YWxsb2MoKSB0byBH
TlRTVF9nZW5lcmFsX2Vycm9yCmluIGNhc2UgdGhlIGdyYW50IHN0YXR1cyBy
ZXBvcnRlZCBieSBYZW4gaXMgZ3JlYXRlciB0aGFuIHplcm8uCgpUaGlzIGlz
IHBhcnQgb2YgWFNBLTMxNi4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHds
QHhlbi5vcmc+CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hl
bmJ1c19jbGllbnQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY2xp
ZW50LmMKaW5kZXggZTE3Y2E4MTU2MTcxLi5hMzgyOTJlZjc5ZjYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY2xpZW50LmMKKysr
IGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jbGllbnQuYwpAQCAtNDQ4
LDcgKzQ0OCwxNCBAQCBFWFBPUlRfU1lNQk9MX0dQTCh4ZW5idXNfZnJlZV9l
dnRjaG4pOwogaW50IHhlbmJ1c19tYXBfcmluZ192YWxsb2Moc3RydWN0IHhl
bmJ1c19kZXZpY2UgKmRldiwgZ3JhbnRfcmVmX3QgKmdudF9yZWZzLAogCQkJ
ICAgdW5zaWduZWQgaW50IG5yX2dyZWZzLCB2b2lkICoqdmFkZHIpCiB7Ci0J
cmV0dXJuIHJpbmdfb3BzLT5tYXAoZGV2LCBnbnRfcmVmcywgbnJfZ3JlZnMs
IHZhZGRyKTsKKwlpbnQgZXJyOworCisJZXJyID0gcmluZ19vcHMtPm1hcChk
ZXYsIGdudF9yZWZzLCBucl9ncmVmcywgdmFkZHIpOworCS8qIFNvbWUgaHlw
ZXJ2aXNvcnMgYXJlIGJ1Z2d5IGFuZCBjYW4gcmV0dXJuIDEuICovCisJaWYg
KGVyciA+IDApCisJCWVyciA9IEdOVFNUX2dlbmVyYWxfZXJyb3I7CisKKwly
ZXR1cm4gZXJyOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoeGVuYnVzX21hcF9y
aW5nX3ZhbGxvYyk7CiAK

--=separator
Content-Type: application/octet-stream; name="xsa316/xsa316-xen.patch"
Content-Disposition: attachment; filename="xsa316/xsa316-xen.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5j
b20+ClN1YmplY3Q6IHhlbi9nbnR0YWI6IEZpeCBlcnJvciBwYXRoIGluIG1h
cF9ncmFudF9yZWYoKQoKUGFydCBvZiBYU0EtMjk1IChjL3MgODYzZTc0ZWIy
Y2ZmYikgaW5hZHZlcnRlbnRseSByZS1wb3NpdGlvbmVkIHRoZSBicmFja2V0
cywKY2hhbmdpbmcgdGhlIGxvZ2ljLiAgSWYgdGhlIF9zZXRfc3RhdHVzKCkg
Y2FsbCBmYWlscywgdGhlIGdyYW50X21hcCBoeXBlcmNhbGwKd291bGQgZmFp
bCB3aXRoIGEgc3RhdHVzIG9mIDEgKHJjICE9IEdOVFNUX29rYXkpIGluc3Rl
YWQgb2YgdGhlIGV4cGVjdGVkCm5lZ2F0aXZlIEdOVFNUXyogZXJyb3IuCgpU
aGlzIGVycm9yIHBhdGggY2FuIGJlIHRha2VuIGR1ZSB0byBiYWQgZ3Vlc3Qg
c3RhdGUsIGFuZCBjYXVzZXMgbmV0L2Jsay1iYWNrCmluIExpbnV4IHRvIGNy
YXNoLgoKVGhpcyBpcyBYU0EtMzE2LgoKU2lnbmVkLW9mZi1ieTogUm9zcyBM
YWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+ClJldmlld2Vk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4KCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKaW5kZXggOWZkNmU2MDQxNi4uNGI1
MzQ0ZGMyMSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
CisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMTAzMSw3ICsx
MDMxLDcgQEAgbWFwX2dyYW50X3JlZigKICAgICB7CiAgICAgICAgIGlmICgg
KHJjID0gX3NldF9zdGF0dXMoc2hhaCwgc3RhdHVzLCByZCwgcmd0LT5ndF92
ZXJzaW9uLCBhY3QsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
b3AtPmZsYWdzICYgR05UTUFQX3JlYWRvbmx5LCAxLAotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxkLT5kb21haW5faWQpICE9IEdOVFNUX29r
YXkpICkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZC0+ZG9t
YWluX2lkKSkgIT0gR05UU1Rfb2theSApCiAgICAgICAgICAgICBnb3RvIGFj
dF9yZWxlYXNlX291dDsKIAogICAgICAgICBpZiAoICFhY3QtPnBpbiApCg==

--=separator--

