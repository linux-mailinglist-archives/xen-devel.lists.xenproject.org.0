Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF4614A38
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 13:01:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433479.686471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppwy-0005bG-Ht; Tue, 01 Nov 2022 12:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433479.686471; Tue, 01 Nov 2022 12:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppwy-0005WL-4A; Tue, 01 Nov 2022 12:01:00 +0000
Received: by outflank-mailman (input) for mailman id 433479;
 Tue, 01 Nov 2022 12:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lfjo=3B=xenbits.xen.org=jgross@srs-se1.protection.inumbo.net>)
 id 1oppww-0004y3-By
 for xen-devel@lists.xen.org; Tue, 01 Nov 2022 12:00:58 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6d206bc-59dc-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 13:00:56 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@xenbits.xen.org>)
 id 1oppwh-0005XG-N2; Tue, 01 Nov 2022 12:00:43 +0000
Received: from jgross by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <jgross@xenbits.xen.org>)
 id 1oppwh-0005PS-M8; Tue, 01 Nov 2022 12:00:43 +0000
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
X-Inumbo-ID: d6d206bc-59dc-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=AH/j94KkZfS2zE+nUaiOPhdMtZkHUY+OiHTksg14QRQ=; b=NHgg/Soi67ZndehJbymFyQ92nv
	zVxsy5EEJbMUAsxbHUQU9HCSdEX140njp45UTgvFGvxKrq4i0snyiogBozqPO95LhScBX+QJcUzBi
	7E1yAZxVBbXvKGTgziG3BPjTFYFyZPxwFET4ENUMmMV6IS8Ds1+oVhF5znP4sVybR8hg=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 414 v2 (CVE-2022-42309) - Xenstore: Guests
 can crash xenstored
Message-Id: <E1oppwh-0005PS-M8@xenbits.xenproject.org>
Date: Tue, 01 Nov 2022 12:00:43 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-42309 / XSA-414
                               version 2

                 Xenstore: Guests can crash xenstored

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Due to a bug in the fix of XSA-115 a malicious guest can cause xenstored
to use a wrong pointer during node creation in an error path, resulting
in a crash of xenstored or a memory corruption in xenstored causing
further damage.

Entering the error path can be controlled by the guest e.g. by exceeding
the quota value of maximum nodes per domain.

IMPACT
======

A malicious guest can cause xenstored to crash, resulting in the inability
to create new guests or to change the configuration of running guests.

Memory corruption in xenstored or privilege escalation of a guest can't
be ruled out.

VULNERABLE SYSTEMS
==================

All Xen versions with the fix for XSA-115 running the C variant of Xenstore
(xenstored or xenstore-stubdom) are vulnerable.

Systems using the Ocaml variant of Xenstore (oxenstored) are not vulnerable.

MITIGATION
==========

Using oxenstored instead of xenstored will avoid the vulnerability.

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

xsa414.patch           xen-unstable, Xen 4.16.x - 4.15.x
xsa414-4.14.patch      Xen 4.14.x - 4.13.x

$ sha256sum xsa414*
aad9be1af22eec504bf45ff651509be9106e7d4ceb7552befcf3152a17e5efbe  xsa414.meta
f0683bce3b27dd516367091e845559359c12a193b4e051867b580ea46d58359f  xsa414.patch
6eb053052786c738abaf747ea69384fd47525186fa6b6ea247383c7cbfbf3e07  xsa414-4.14.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmNg+58MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZYVAH/1m7ox0cI4jg17wM8ri+cWi0O4bp68MFQKG887DJ
2WZsObdY3SYkUO1YBMg9qu9l5G11+z3UW8KBznafVPweyt35CZJdq6E82SfNc+uf
6/9hmDvXl3fwNJDP9AQBEKMXHPMjRYmIPaniuQdRgnqKSZNUXefbyHZFuHqKabSq
cIEJebNHyNWYmC5fulu53YHuX2WHCkUhlcYYLfqbqd+THGt6Aqj+1NxS3QZ/7zBC
Jiw1eLjzyOGeARkmobl9FJuQpyB9ZmiyenrJCzFMR3uh0njMnMys95VgWxBH+uBe
ooe2vvcoE9EpY8MPmV3UhA+q3JsIis+dkZ2vJQAjaQAomXQ=
=NNSk
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa414.meta"
Content-Disposition: attachment; filename="xsa414.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiA0MTQsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNiIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIs
CiAgICAiNC4xMyIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwK
ICAiUmVjaXBlcyI6IHsKICAgICI0LjEzIjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIw
YmU2M2MyNjE1YjI2ODAwMWY3Y2M5YjcyY2UyNWVlZDk1MjczN2RjIiwKICAg
ICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICA0MTQKICAgICAgICAg
IF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTQx
NC00LjE0LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQog
ICAgfSwKICAgICI0LjE0IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAg
ICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIwMTZkZTYyNzQ3
YjI2ZWFkNWE1Yzc2M2I2NDBmZThlMjA1Y2QxODJiIiwKICAgICAgICAgICJQ
cmVyZXFzIjogWwogICAgICAgICAgICA0MTQKICAgICAgICAgIF0sCiAgICAg
ICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTQxNC00LjE0LnBh
dGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAg
ICI0LjE1IjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjog
ewogICAgICAgICAgIlN0YWJsZVJlZiI6ICI4MTY1ODBhZmRkMTczMGQ0Zjg1
ZjY0NDc3YTI0MmE0MzlhZjFjZGY4IiwKICAgICAgICAgICJQcmVyZXFzIjog
WwogICAgICAgICAgICA0MTQKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0
Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTQxNC5wYXRjaCIKICAgICAgICAg
IF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xNiI6IHsKICAg
ICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJT
dGFibGVSZWYiOiAiMWJjZTdmYjFmNzAyZGE0ZjdhNzQ5YzZmMTQ1N2VjYjIw
YmY3NGZjYSIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAg
NDEyLAogICAgICAgICAgICA0MTQKICAgICAgICAgIF0sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTQxNC5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAibWFzdGVyIjog
ewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAg
ICAgIlN0YWJsZVJlZiI6ICJjYzQ3NDdiZThiYTE1N2EzYjMxMDkyMWU5ZWUw
N2ZiODU0NWFhMjA2IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAg
ICAgICA0MTIsCiAgICAgICAgICAgIDQxNAogICAgICAgICAgXSwKICAgICAg
ICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhNDE0LnBhdGNoIgog
ICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa414.patch"
Content-Disposition: attachment; filename="xsa414.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KU3ViamVj
dDogdG9vbHMveGVuc3RvcmU6IGNyZWF0ZV9ub2RlOiBEb24ndCBkZWZlciB3
b3JrIHRvIHVuZG8gYW55IGNoYW5nZXMgb24KIGZhaWx1cmUKClhTQS0xMTUg
ZXh0ZW5kZWQgZGVzdHJveV9ub2RlKCkgdG8gdXBkYXRlIHRoZSBub2RlIGFj
Y291bnRpbmcgZm9yIHRoZQpjb25uZWN0aW9uLiBUaGUgaW1wbGVtZW50YXRp
b24gaXMgYXNzdW1pbmcgdGhlIGNvbm5lY3Rpb24gaXMgdGhlIHBhcmVudApv
ZiB0aGUgbm9kZSwgaG93ZXZlciBhbGwgdGhlIG5vZGVzIGFyZSBhbGxvY2F0
ZWQgdXNpbmcgYSBzZXBhcmF0ZSBjb250ZXh0CihzZWUgcHJvY2Vzc19tZXNz
YWdlKCkpLiBUaGlzIHdpbGwgcmVzdWx0IHRvIGNyYXNoIChvciBjb3JydXB0
KSB4ZW5zdG9yZWQKYXMgdGhlIHBvaW50ZXIgaXMgd3JvbmdseSB1c2VkLgoK
SW4gY2FzZSBvZiBhbiBlcnJvciwgYW55IGNoYW5nZXMgdG8gdGhlIGRhdGFi
YXNlIG9yIHVwZGF0ZSB0byB0aGUKYWNjb3VudGluZyB3aWxsIG5vdyBiZSBy
ZXZlcnRlZCBpbiBjcmVhdGVfbm9kZSgpIGJ5IGNhbGxpbmcgZGlyZWN0bHkK
ZGVzdHJveV9ub2RlKCkuIFRoaXMgaGFzIHRoZSBuaWNlIGFkdmFudGFnZSB0
byByZW1vdmUgdGhlIGxvb3AgdG8gdW5zZXQKdGhlIGRlc3RydWN0b3JzIGlu
IGNhc2Ugb2Ygc3VjY2Vzcy4KClRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGZy
ZWUgdGhlIG5vZGVzIHJpZ2h0IG5vdyBhcyB0aGV5IGFyZSBub3QKZ29pbmcg
dG8gYmUgcmVhY2hhYmxlICh0aGUgZnVuY3Rpb24gcmV0dXJucyBOVUxMKSBh
bmQgYXJlIGp1c3Qgd2FzdGluZwpyZXNvdXJjZXMuCgpUaGlzIGlzIFhTQS00
MTQgLyBDVkUtMjAyMi00MjMwOS4KClJlcG9ydGVkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgpGaXhlczogMGJmYjIxMDFmMjQzICgi
dG9vbHMveGVuc3RvcmU6IGZpeCBub2RlIGFjY291bnRpbmcgYWZ0ZXIgZmFp
bGVkIG5vZGUgY3JlYXRpb24iKQpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9yZS94ZW5z
dG9yZWRfY29yZS5jCmluZGV4IDg4NjdmOTM0MzFkNC4uYzMwZDE0Y2JmMmFi
IDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5j
CisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMKQEAgLTEw
ODQsOSArMTA4NCw4IEBAIHN0YXRpYyBzdHJ1Y3Qgbm9kZSAqY29uc3RydWN0
X25vZGUoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNvbnN0IHZvaWQgKmN0
eCwKIAlyZXR1cm4gTlVMTDsKIH0KIAotc3RhdGljIGludCBkZXN0cm95X25v
ZGUodm9pZCAqX25vZGUpCitzdGF0aWMgaW50IGRlc3Ryb3lfbm9kZShzdHJ1
Y3QgY29ubmVjdGlvbiAqY29ubiwgc3RydWN0IG5vZGUgKm5vZGUpCiB7Ci0J
c3RydWN0IG5vZGUgKm5vZGUgPSBfbm9kZTsKIAlUREJfREFUQSBrZXk7CiAK
IAlpZiAoc3RyZXEobm9kZS0+bmFtZSwgIi8iKSkKQEAgLTEwOTUsNyArMTA5
NCw3IEBAIHN0YXRpYyBpbnQgZGVzdHJveV9ub2RlKHZvaWQgKl9ub2RlKQog
CXNldF90ZGJfa2V5KG5vZGUtPm5hbWUsICZrZXkpOwogCXRkYl9kZWxldGUo
dGRiX2N0eCwga2V5KTsKIAotCWRvbWFpbl9lbnRyeV9kZWModGFsbG9jX3Bh
cmVudChub2RlKSwgbm9kZSk7CisJZG9tYWluX2VudHJ5X2RlYyhjb25uLCBu
b2RlKTsKIAogCXJldHVybiAwOwogfQpAQCAtMTEwNCw3ICsxMTAzLDggQEAg
c3RhdGljIHN0cnVjdCBub2RlICpjcmVhdGVfbm9kZShzdHJ1Y3QgY29ubmVj
dGlvbiAqY29ubiwgY29uc3Qgdm9pZCAqY3R4LAogCQkJCWNvbnN0IGNoYXIg
Km5hbWUsCiAJCQkJdm9pZCAqZGF0YSwgdW5zaWduZWQgaW50IGRhdGFsZW4p
CiB7Ci0Jc3RydWN0IG5vZGUgKm5vZGUsICppOworCXN0cnVjdCBub2RlICpu
b2RlLCAqaSwgKmo7CisJaW50IHJldDsKIAogCW5vZGUgPSBjb25zdHJ1Y3Rf
bm9kZShjb25uLCBjdHgsIG5hbWUpOwogCWlmICghbm9kZSkKQEAgLTExMjYs
MjMgKzExMjYsNDAgQEAgc3RhdGljIHN0cnVjdCBub2RlICpjcmVhdGVfbm9k
ZShzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgY29uc3Qgdm9pZCAqY3R4LAog
CQkvKiBpLT5wYXJlbnQgaXMgc2V0IGZvciBlYWNoIG5ldyBub2RlLCBzbyBj
aGVjayBxdW90YS4gKi8KIAkJaWYgKGktPnBhcmVudCAmJgogCQkgICAgZG9t
YWluX2VudHJ5KGNvbm4pID49IHF1b3RhX25iX2VudHJ5X3Blcl9kb21haW4p
IHsKLQkJCWVycm5vID0gRU5PU1BDOwotCQkJcmV0dXJuIE5VTEw7CisJCQly
ZXQgPSBFTk9TUEM7CisJCQlnb3RvIGVycjsKIAkJfQotCQlpZiAod3JpdGVf
bm9kZShjb25uLCBpLCBmYWxzZSkpCi0JCQlyZXR1cm4gTlVMTDsKIAotCQkv
KiBBY2NvdW50IGZvciBuZXcgbm9kZSwgc2V0IGRlc3RydWN0b3IgZm9yIGVy
cm9yIGNhc2UuICovCi0JCWlmIChpLT5wYXJlbnQpIHsKKwkJcmV0ID0gd3Jp
dGVfbm9kZShjb25uLCBpLCBmYWxzZSk7CisJCWlmIChyZXQpCisJCQlnb3Rv
IGVycjsKKworCQkvKiBBY2NvdW50IGZvciBuZXcgbm9kZSAqLworCQlpZiAo
aS0+cGFyZW50KQogCQkJZG9tYWluX2VudHJ5X2luYyhjb25uLCBpKTsKLQkJ
CXRhbGxvY19zZXRfZGVzdHJ1Y3RvcihpLCBkZXN0cm95X25vZGUpOwotCQl9
CiAJfQogCi0JLyogT0ssIG5vdyByZW1vdmUgZGVzdHJ1Y3RvcnMgc28gdGhl
eSBzdGF5IGFyb3VuZCAqLwotCWZvciAoaSA9IG5vZGU7IGktPnBhcmVudDsg
aSA9IGktPnBhcmVudCkKLQkJdGFsbG9jX3NldF9kZXN0cnVjdG9yKGksIE5V
TEwpOwogCXJldHVybiBub2RlOworCitlcnI6CisJLyoKKwkgKiBXZSBmYWls
ZWQgdG8gdXBkYXRlIFREQiBmb3Igc29tZSBvZiB0aGUgbm9kZXMuIFVuZG8g
YW55IHdvcmsgdGhhdAorCSAqIGhhdmUgYWxyZWFkeSBiZWVuIGRvbmUuCisJ
ICovCisJZm9yIChqID0gbm9kZTsgaiAhPSBpOyBqID0gai0+cGFyZW50KQor
CQlkZXN0cm95X25vZGUoY29ubiwgaik7CisKKwkvKiBXZSBkb24ndCBuZWVk
IHRvIGtlZXAgdGhlIG5vZGVzIGFyb3VuZCwgc28gZnJlZSB0aGVtLiAqLwor
CWkgPSBub2RlOworCXdoaWxlIChpKSB7CisJCWogPSBpOworCQlpID0gaS0+
cGFyZW50OworCQl0YWxsb2NfZnJlZShqKTsKKwl9CisKKwllcnJubyA9IHJl
dDsKKworCXJldHVybiBOVUxMOwogfQogCiAvKiBwYXRoLCBkYXRhLi4uICov
Cg==

--=separator
Content-Type: application/octet-stream; name="xsa414-4.14.patch"
Content-Disposition: attachment; filename="xsa414-4.14.patch"
Content-Transfer-Encoding: base64

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KU3ViamVj
dDogdG9vbHMveGVuc3RvcmU6IGNyZWF0ZV9ub2RlOiBEb24ndCBkZWZlciB3
b3JrIHRvIHVuZG8gYW55IGNoYW5nZXMgb24KIGZhaWx1cmUKClhTQS0xMTUg
ZXh0ZW5kZWQgZGVzdHJveV9ub2RlKCkgdG8gdXBkYXRlIHRoZSBub2RlIGFj
Y291bnRpbmcgZm9yIHRoZQpjb25uZWN0aW9uLiBUaGUgaW1wbGVtZW50YXRp
b24gaXMgYXNzdW1pbmcgdGhlIGNvbm5lY3Rpb24gaXMgdGhlIHBhcmVudApv
ZiB0aGUgbm9kZSwgaG93ZXZlciBhbGwgdGhlIG5vZGVzIGFyZSBhbGxvY2F0
ZWQgdXNpbmcgYSBzZXBhcmF0ZSBjb250ZXh0CihzZWUgcHJvY2Vzc19tZXNz
YWdlKCkpLiBUaGlzIHdpbGwgcmVzdWx0IHRvIGNyYXNoIChvciBjb3JydXB0
KSB4ZW5zdG9yZWQKYXMgdGhlIHBvaW50ZXIgaXMgd3JvbmdseSB1c2VkLgoK
SW4gY2FzZSBvZiBhbiBlcnJvciwgYW55IGNoYW5nZXMgdG8gdGhlIGRhdGFi
YXNlIG9yIHVwZGF0ZSB0byB0aGUKYWNjb3VudGluZyB3aWxsIG5vdyBiZSBy
ZXZlcnRlZCBpbiBjcmVhdGVfbm9kZSgpIGJ5IGNhbGxpbmcgZGlyZWN0bHkK
ZGVzdHJveV9ub2RlKCkuIFRoaXMgaGFzIHRoZSBuaWNlIGFkdmFudGFnZSB0
byByZW1vdmUgdGhlIGxvb3AgdG8gdW5zZXQKdGhlIGRlc3RydWN0b3JzIGlu
IGNhc2Ugb2Ygc3VjY2Vzcy4KClRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGZy
ZWUgdGhlIG5vZGVzIHJpZ2h0IG5vdyBhcyB0aGV5IGFyZSBub3QKZ29pbmcg
dG8gYmUgcmVhY2hhYmxlICh0aGUgZnVuY3Rpb24gcmV0dXJucyBOVUxMKSBh
bmQgYXJlIGp1c3Qgd2FzdGluZwpyZXNvdXJjZXMuCgpUaGlzIGlzIFhTQS00
MTQgLyBDVkUtMjAyMi00MjMwOS4KClJlcG9ydGVkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgpGaXhlczogMGJmYjIxMDFmMjQzICgi
dG9vbHMveGVuc3RvcmU6IGZpeCBub2RlIGFjY291bnRpbmcgYWZ0ZXIgZmFp
bGVkIG5vZGUgY3JlYXRpb24iKQpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9yZS94ZW5z
dG9yZWRfY29yZS5jCmluZGV4IDFkMDVkMjVhNDg2NC4uNmFmZThjYjU5ZDdl
IDEwMDY0NAotLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5j
CisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMKQEAgLTk3
Nyw5ICs5NzcsOCBAQCBzdGF0aWMgc3RydWN0IG5vZGUgKmNvbnN0cnVjdF9u
b2RlKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBjb25zdCB2b2lkICpjdHgs
CiAJcmV0dXJuIE5VTEw7CiB9CiAKLXN0YXRpYyBpbnQgZGVzdHJveV9ub2Rl
KHZvaWQgKl9ub2RlKQorc3RhdGljIGludCBkZXN0cm95X25vZGUoc3RydWN0
IGNvbm5lY3Rpb24gKmNvbm4sIHN0cnVjdCBub2RlICpub2RlKQogewotCXN0
cnVjdCBub2RlICpub2RlID0gX25vZGU7CiAJVERCX0RBVEEga2V5OwogCiAJ
aWYgKHN0cmVxKG5vZGUtPm5hbWUsICIvIikpCkBAIC05OTAsNyArOTg5LDcg
QEAgc3RhdGljIGludCBkZXN0cm95X25vZGUodm9pZCAqX25vZGUpCiAKIAl0
ZGJfZGVsZXRlKHRkYl9jdHgsIGtleSk7CiAKLQlkb21haW5fZW50cnlfZGVj
KHRhbGxvY19wYXJlbnQobm9kZSksIG5vZGUpOworCWRvbWFpbl9lbnRyeV9k
ZWMoY29ubiwgbm9kZSk7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTk5OSw3ICs5
OTgsOCBAQCBzdGF0aWMgc3RydWN0IG5vZGUgKmNyZWF0ZV9ub2RlKHN0cnVj
dCBjb25uZWN0aW9uICpjb25uLCBjb25zdCB2b2lkICpjdHgsCiAJCQkJY29u
c3QgY2hhciAqbmFtZSwKIAkJCQl2b2lkICpkYXRhLCB1bnNpZ25lZCBpbnQg
ZGF0YWxlbikKIHsKLQlzdHJ1Y3Qgbm9kZSAqbm9kZSwgKmk7CisJc3RydWN0
IG5vZGUgKm5vZGUsICppLCAqajsKKwlpbnQgcmV0OwogCiAJbm9kZSA9IGNv
bnN0cnVjdF9ub2RlKGNvbm4sIGN0eCwgbmFtZSk7CiAJaWYgKCFub2RlKQpA
QCAtMTAyMSwyMyArMTAyMSw0MCBAQCBzdGF0aWMgc3RydWN0IG5vZGUgKmNy
ZWF0ZV9ub2RlKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBjb25zdCB2b2lk
ICpjdHgsCiAJCS8qIGktPnBhcmVudCBpcyBzZXQgZm9yIGVhY2ggbmV3IG5v
ZGUsIHNvIGNoZWNrIHF1b3RhLiAqLwogCQlpZiAoaS0+cGFyZW50ICYmCiAJ
CSAgICBkb21haW5fZW50cnkoY29ubikgPj0gcXVvdGFfbmJfZW50cnlfcGVy
X2RvbWFpbikgewotCQkJZXJybm8gPSBFTk9TUEM7Ci0JCQlyZXR1cm4gTlVM
TDsKKwkJCXJldCA9IEVOT1NQQzsKKwkJCWdvdG8gZXJyOwogCQl9Ci0JCWlm
ICh3cml0ZV9ub2RlKGNvbm4sIGksIGZhbHNlKSkKLQkJCXJldHVybiBOVUxM
OwogCi0JCS8qIEFjY291bnQgZm9yIG5ldyBub2RlLCBzZXQgZGVzdHJ1Y3Rv
ciBmb3IgZXJyb3IgY2FzZS4gKi8KLQkJaWYgKGktPnBhcmVudCkgeworCQly
ZXQgPSB3cml0ZV9ub2RlKGNvbm4sIGksIGZhbHNlKTsKKwkJaWYgKHJldCkK
KwkJCWdvdG8gZXJyOworCisJCS8qIEFjY291bnQgZm9yIG5ldyBub2RlICov
CisJCWlmIChpLT5wYXJlbnQpCiAJCQlkb21haW5fZW50cnlfaW5jKGNvbm4s
IGkpOwotCQkJdGFsbG9jX3NldF9kZXN0cnVjdG9yKGksIGRlc3Ryb3lfbm9k
ZSk7Ci0JCX0KIAl9CiAKLQkvKiBPSywgbm93IHJlbW92ZSBkZXN0cnVjdG9y
cyBzbyB0aGV5IHN0YXkgYXJvdW5kICovCi0JZm9yIChpID0gbm9kZTsgaS0+
cGFyZW50OyBpID0gaS0+cGFyZW50KQotCQl0YWxsb2Nfc2V0X2Rlc3RydWN0
b3IoaSwgTlVMTCk7CiAJcmV0dXJuIG5vZGU7CisKK2VycjoKKwkvKgorCSAq
IFdlIGZhaWxlZCB0byB1cGRhdGUgVERCIGZvciBzb21lIG9mIHRoZSBub2Rl
cy4gVW5kbyBhbnkgd29yayB0aGF0CisJICogaGF2ZSBhbHJlYWR5IGJlZW4g
ZG9uZS4KKwkgKi8KKwlmb3IgKGogPSBub2RlOyBqICE9IGk7IGogPSBqLT5w
YXJlbnQpCisJCWRlc3Ryb3lfbm9kZShjb25uLCBqKTsKKworCS8qIFdlIGRv
bid0IG5lZWQgdG8ga2VlcCB0aGUgbm9kZXMgYXJvdW5kLCBzbyBmcmVlIHRo
ZW0uICovCisJaSA9IG5vZGU7CisJd2hpbGUgKGkpIHsKKwkJaiA9IGk7CisJ
CWkgPSBpLT5wYXJlbnQ7CisJCXRhbGxvY19mcmVlKGopOworCX0KKworCWVy
cm5vID0gcmV0OworCisJcmV0dXJuIE5VTEw7CiB9CiAKIC8qIHBhdGgsIGRh
dGEuLi4gKi8K

--=separator--

