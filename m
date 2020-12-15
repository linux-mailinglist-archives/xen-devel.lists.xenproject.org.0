Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFB52DAD45
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53490.93228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9Uy-0003j3-4O; Tue, 15 Dec 2020 12:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53490.93228; Tue, 15 Dec 2020 12:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9Uy-0003iH-0K; Tue, 15 Dec 2020 12:32:12 +0000
Received: by outflank-mailman (input) for mailman id 53490;
 Tue, 15 Dec 2020 12:32:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdgx=FT=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1kp9LT-0004t1-OH
 for xen-devel@lists.xen.org; Tue, 15 Dec 2020 12:22:23 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a059f6f-2452-4d41-9ed3-0e5c6dc26be0;
 Tue, 15 Dec 2020 12:20:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JZ-0005jO-F6; Tue, 15 Dec 2020 12:20:25 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JZ-00078k-EE; Tue, 15 Dec 2020 12:20:25 +0000
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
X-Inumbo-ID: 3a059f6f-2452-4d41-9ed3-0e5c6dc26be0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=BaAJ8QKJeq1ljLB3TDgqpsTvHwMGW/R9qzkqO6VU4x0=; b=yvvPot2xwUVKOqHBgSbzzmujWu
	xcvh2Ln9bNXqRyomWSuq3/PG7iYzbE2YHQ0rnjCrqUZKHOqSD5/09hYontEHFQHHsEsupU3wznG0d
	htQTPnxA3JesQnfR4R6+Z/4qZ45cFhpAxjAO+n4HAZxyNwK5MgXUHsAjDfWHbGIkIh7M=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 353 v4 (CVE-2020-29479) - oxenstored:
 permissions not checked on root node
Message-Id: <E1kp9JZ-00078k-EE@xenbits.xenproject.org>
Date: Tue, 15 Dec 2020 12:20:25 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29479 / XSA-353
                               version 4

           oxenstored: permissions not checked on root node

UPDATES IN VERSION 4
====================

Public release.

ISSUE DESCRIPTION
=================

In the Ocaml xenstored implementation, the internal representation of
the tree has special cases for the root node, because this node has no
parent.

Unfortunately, permissions were not checked for certain operations on
the root node.

Unprivileged guests can get and modify permissions, list, and delete
the root node.  Deleting the whole xenstore tree is a hostwide denial
of service.  Depending on the circumstances, the vulnerability can
also be leveraged into an ability to gain write access to any part of
xenstore.

IMPACT
======

A guest administrator can deny service to the whole system
simply by deleting the whole of xenstore.

Additionally, depending on other software in use, privilege escalation
may be possible.  With the default "xl" toolstack, a guest
administrator can escalate their privilege to that of the host.

VULNERABLE SYSTEMS
==================

All systems using oxenstored are vulnerable.  Building and using
oxenstored is the default in the upstream Xen distribution, if the
Ocaml compiler is available.

The impact depends on the toolstack and other management software in
use.  Systems using libxl (for example, via "xl" or libvirt) are
vulnerable to privilege escalation.

Systems using C xenstored are not vulnerable, no matter what toolstack
or management software is in use.

MITIGATION
==========

There are no mitigations.

Changing to use of C xenstored would avoid this vulnerability.  However,
given the other vulnerabilities in both versions of xenstored being
reported at this time, changing xenstored implementation is not a
recommended approach to mitigation of individual issues.

CREDITS
=======

This issue was discovered by Edwin Török of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

Note that the Ocaml patches for XSA-115 depend on this patch.

xsa353.patch           xen-unstable - 4.10

$ sha256sum xsa353*
48fa1f414773ab1a4135fe62aaae25c7c543efe5a4c5dba71db9e497fa9f3362  xsa353.meta
e14922bf6b2095c1b17849b130e999726a1a31e29be1374e0cd3f9a8fa59fd3d  xsa353.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl/Yqd8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZmg8IALQltyH/EPk78gGNyeb/1ri3jr7IVR5lyCy1Aedg
zckh8FNaaRCplZAoa2Kc2aV2H1Lc5x/UfWtoOLaiSdcyRNXRKRFwq7LoBT7OH2SH
KSo2HK0licTOv61SL2LoJ38tXec86V0Cos89DuWtSMLQT3LUmixQlSdiTUueFidH
Fei8mqoYor5WtzjfgKjdR5KwrrPj65QFyUic3bRgdcc/t27Wr+oQU5iGg7ayeCNw
5Ylz8eyJj88rkNVw1S4jFH815lyENaJbVn56VvlEm0KDsnY7G4YAHExZ1lElrOdj
nkOXN3o6CGiHTkXPOsbPuy0WboSrXK9AZykasml/EDw41Vg=
=V1xW
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa353.meta"
Content-Disposition: attachment; filename="xsa353.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNTMsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIxZDcyZDk5MTVlZGZmMGRkNDFmNjAxYmJiMGIxZjgzYzAy
ZmYxNjg5IiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM1My5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMSI6IHsK
ICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAg
ICJTdGFibGVSZWYiOiAiNDFhODIyYzM5MjYzNTBmMjY5MTdkNzQ3YzhkZmVk
MWM0NGEyY2Y0MiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAg
ICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzNTMucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTIi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogIjgxNDVkMzhiNDgwMDkyNTVhMzJhYjg3YTAy
ZTQ4MWNkMDljODExZjkiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzUzLnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewog
ICAgICAgICAgIlN0YWJsZVJlZiI6ICJiNTMwMjI3M2UyYzUxOTQwMTcyNDAw
NDg2NjQ0NjM2ZjJmNGZjNjRhIiwKICAgICAgICAgICJQcmVyZXFzIjogW10s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM1My5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMWQxZDFmNTM5MTk3NjQ1NmE3
OWRhYWMwZGNmZTcxNTdkYTFlNTRmNyIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ez
NTMucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiM2FlNDY5YWY4ZTY4
MGRmMzFlZWNkMGEyYWM2YTgzYjU4YWQ3Y2U1MyIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAg
ICJ4c2EzNTMucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9
CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa353.patch"
Content-Disposition: attachment; filename="xsa353.patch"
Content-Transfer-Encoding: base64

RnJvbTogPT9VVEYtOD9xP0Vkd2luPTIwVD1DMz1CNnI9QzM9QjZrPz0gPGVk
dmluLnRvcm9rQGNpdHJpeC5jb20+ClN1YmplY3Q6IHRvb2xzL29jYW1sL3hl
bnN0b3JlZDogZG8gcGVybWlzc2lvbiBjaGVja3Mgb24geGVuc3RvcmUgcm9v
dApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47
IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dAoKVGhpcyB3YXMgbGFja2luZyBpbiBhIGRpc2FwcG9pbnRpbmcgbnVtYmVy
IG9mIHBsYWNlcy4KClRoZSB4ZW5zdG9yZSByb290IG5vZGUgaXMgdHJlYXRl
ZCBkaWZmZXJlbnRseSBmcm9tIGFsbCBvdGhlciBub2RlcywgYmVjYXVzZSBp
dApkb2Vzbid0IGhhdmUgYSBwYXJlbnQsIGFuZCBtdXRhdGlvbiByZXF1aXJl
cyBjaGFuZ2luZyB0aGUgcGFyZW50LgoKVW5mb3J0dW5hdGVseSB0aGlzIGxl
YWQgdG8gb3Blbi1jb2RpbmcgdGhlIHNwZWNpYWwgY2FzZSBmb3Igcm9vdCBp
bnRvIGV2ZXJ5CnNpbmdsZSB4ZW5zdG9yZSBvcGVyYXRpb24sIGFuZCBvdXQg
b2YgYWxsIHRoZSB4ZW5zdG9yZSBvcGVyYXRpb25zIG9ubHkgcmVhZApkaWQg
YSBwZXJtaXNzaW9uIGNoZWNrIHdoZW4gaGFuZGxpbmcgdGhlIHJvb3Qgbm9k
ZS4KClRoaXMgbWVhbnMgdGhhdCBhbiB1bnByaXZpbGVnZWQgZ3Vlc3QgY2Fu
OgoKICogeGVuc3RvcmUtY2htb2QgLyB0byBpdHMgbGlraW5nIGFuZCBzdWJz
ZXF1ZW50bHkgd3JpdGUgbmV3IGFyYml0cmFyeSBub2RlcwogICB0aGVyZSAo
c3ViamVjdCB0byBxdW90YSkKICogeGVuc3RvcmUtcm0gLXIgLyBkZWxldGVz
IGFsbW9zdCB0aGUgZW50aXJlIHhlbnN0b3JlIHRyZWUgKHhlbm9wc2QgcXVp
Y2tseQogICByZWZpbGxzIHNvbWUsIGJ1dCB5b3UgYXJlIGxlZnQgd2l0aCBh
IGJyb2tlbiBzeXN0ZW0pCiAqIERJUkVDVE9SWSBvbiAvIGxpc3RzIGFsbCBj
aGlsZHJlbiB3aGVuIGNhbGxlZCB0aHJvdWdoIHB5dGhvbgogICBiaW5kaW5n
cyAoeGVuc3RvcmUtbHMgc3RvcHMgYXQgL2xvY2FsIGJlY2F1c2UgaXQgdHJp
ZXMgdG8gbGlzdCByZWN1cnNpdmVseSkKICogZ2V0LXBlcm1zIG9uIC8gd29y
a3MgdG9vLCBidXQgdGhhdCBpcyBqdXN0IGEgbWlub3IgaW5mb3JtYXRpb24g
bGVhawoKQWRkIHRoZSBtaXNzaW5nIHBlcm1pc3Npb24gY2hlY2tzLCBidXQg
dGhpcyBzaG91bGQgcmVhbGx5IGJlIHJlZmFjdG9yZWQgdG8gZG8KdGhlIHJv
b3QgaGFuZGxpbmcgYW5kIHBlcm1pc3Npb24gY2hlY2tzIG9uIHRoZSBub2Rl
IG9ubHkgb25jZSBmcm9tIGEgc2luZ2xlCmZ1bmN0aW9uLCBpbnN0ZWFkIG9m
IGdldHRpbmcgaXQgd3JvbmcgbmVhcmx5IGV2ZXJ5d2hlcmUuCgpUaGlzIGlz
IFhTQS0zNTMuCgpTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZp
bi50b3Jva0BjaXRyaXguY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRp
ZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpSZXZpZXdlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCmRp
ZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5zdG9yZWQvc3RvcmUubWwgYi90
b29scy9vY2FtbC94ZW5zdG9yZWQvc3RvcmUubWwKaW5kZXggZjI5OWVjNjQ2
MS4uOTJiNjI4OWI1ZSAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwveGVuc3Rv
cmVkL3N0b3JlLm1sCisrKyBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9zdG9y
ZS5tbApAQCAtMjczLDE1ICsyNzMsMTcgQEAgbGV0IHBhdGhfcm0gc3RvcmUg
cGVybSBwYXRoID0KIAkJCU5vZGUuZGVsX2NoaWxkbmFtZSBub2RlIG5hbWUK
IAkJd2l0aCBOb3RfZm91bmQgLT4KIAkJCXJhaXNlIERlZmluZS5Eb2VzbnRf
ZXhpc3QgaW4KLQlpZiBwYXRoID0gW10gdGhlbgorCWlmIHBhdGggPSBbXSB0
aGVuICgKKwkJTm9kZS5jaGVja19wZXJtIHN0b3JlLnJvb3QgcGVybSBQZXJt
cy5XUklURTsKIAkJTm9kZS5kZWxfYWxsX2NoaWxkcmVuIHN0b3JlLnJvb3QK
LQllbHNlCisJKSBlbHNlCiAJCVBhdGguYXBwbHlfbW9kaWZ5IHN0b3JlLnJv
b3QgcGF0aCBkb19ybQogCiBsZXQgcGF0aF9zZXRwZXJtcyBzdG9yZSBwZXJt
IHBhdGggcGVybXMgPQotCWlmIHBhdGggPSBbXSB0aGVuCisJaWYgcGF0aCA9
IFtdIHRoZW4gKAorCQlOb2RlLmNoZWNrX3Blcm0gc3RvcmUucm9vdCBwZXJt
IFBlcm1zLldSSVRFOwogCQlOb2RlLnNldF9wZXJtcyBzdG9yZS5yb290IHBl
cm1zCi0JZWxzZQorCSkgZWxzZQogCQlsZXQgZG9fc2V0cGVybXMgbm9kZSBu
YW1lID0KIAkJCWxldCBjID0gTm9kZS5maW5kIG5vZGUgbmFtZSBpbgogCQkJ
Tm9kZS5jaGVja19vd25lciBjIHBlcm07CkBAIC0zMTMsOSArMzE1LDEwIEBA
IGxldCByZWFkIHN0b3JlIHBlcm0gcGF0aCA9CiAKIGxldCBscyBzdG9yZSBw
ZXJtIHBhdGggPQogCWxldCBjaGlsZHJlbiA9Ci0JCWlmIHBhdGggPSBbXSB0
aGVuCi0JCQkoTm9kZS5nZXRfY2hpbGRyZW4gc3RvcmUucm9vdCkKLQkJZWxz
ZQorCQlpZiBwYXRoID0gW10gdGhlbiAoCisJCQlOb2RlLmNoZWNrX3Blcm0g
c3RvcmUucm9vdCBwZXJtIFBlcm1zLlJFQUQ7CisJCQlOb2RlLmdldF9jaGls
ZHJlbiBzdG9yZS5yb290CisJCSkgZWxzZQogCQkJbGV0IGRvX2xzIG5vZGUg
bmFtZSA9CiAJCQkJbGV0IGNub2RlID0gTm9kZS5maW5kIG5vZGUgbmFtZSBp
bgogCQkJCU5vZGUuY2hlY2tfcGVybSBjbm9kZSBwZXJtIFBlcm1zLlJFQUQ7
CkBAIC0zMjQsOSArMzI3LDEwIEBAIGxldCBscyBzdG9yZSBwZXJtIHBhdGgg
PQogCUxpc3QucmV2IChMaXN0Lm1hcCAoZnVuIG4gLT4gU3ltYm9sLnRvX3N0
cmluZyBuLk5vZGUubmFtZSkgY2hpbGRyZW4pCiAKIGxldCBnZXRwZXJtcyBz
dG9yZSBwZXJtIHBhdGggPQotCWlmIHBhdGggPSBbXSB0aGVuCi0JCShOb2Rl
LmdldF9wZXJtcyBzdG9yZS5yb290KQotCWVsc2UKKwlpZiBwYXRoID0gW10g
dGhlbiAoCisJCU5vZGUuY2hlY2tfcGVybSBzdG9yZS5yb290IHBlcm0gUGVy
bXMuUkVBRDsKKwkJTm9kZS5nZXRfcGVybXMgc3RvcmUucm9vdAorCSkgZWxz
ZQogCQlsZXQgZmN0IG4gbmFtZSA9CiAJCQlsZXQgYyA9IE5vZGUuZmluZCBu
IG5hbWUgaW4KIAkJCU5vZGUuY2hlY2tfcGVybSBjIHBlcm0gUGVybXMuUkVB
RDsK

--=separator--

