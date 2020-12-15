Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F62DAD37
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53293.92959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9S4-00087I-U0; Tue, 15 Dec 2020 12:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53293.92959; Tue, 15 Dec 2020 12:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9S4-00086g-Q1; Tue, 15 Dec 2020 12:29:12 +0000
Received: by outflank-mailman (input) for mailman id 53293;
 Tue, 15 Dec 2020 12:29:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdgx=FT=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1kp9LE-0004t1-Np
 for xen-devel@lists.xen.org; Tue, 15 Dec 2020 12:22:08 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9ed13a3-001c-42d7-bd7b-5df69308f6e2;
 Tue, 15 Dec 2020 12:20:29 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JY-0005iy-HV; Tue, 15 Dec 2020 12:20:24 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JY-00077n-Gf; Tue, 15 Dec 2020 12:20:24 +0000
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
X-Inumbo-ID: f9ed13a3-001c-42d7-bd7b-5df69308f6e2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=uYWuLcCdiUHZLGjev7Gvd/q5tS79ig4/rGX9a5apYZ0=; b=f6/CH+jpFM6gHWYcAuxqThNC0K
	i86i5vqH7m91T4pFPOm++A6y8td5XvdCLy/WbntkXWDNH4vJ6dmfdQHlesfdng3+zqvHZQci2Xluf
	rvwgBEdIJ21pOpEO8SmD7UsVct+OzwE0Yhr3MkjCLrOhEN3L0I8kjVjIrkUKvLbvuois=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 352 v3 (CVE-2020-29486) - oxenstored: node
 ownership can be changed by unprivileged clients
Message-Id: <E1kp9JY-00077n-Gf@xenbits.xenproject.org>
Date: Tue, 15 Dec 2020 12:20:24 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29486 / XSA-352
                               version 3

   oxenstored: node ownership can be changed by unprivileged clients

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

Nodes in xenstore have an ownership.  In oxenstored, a owner could
give a node away.  But node ownership has quota implications.

Any guest can run another guest out of quota, or create an unbounded
number of nodes owned by dom0, thus running xenstored out of memory

IMPACT
======

A malicious guest administrator can cause denial of service, against a
specific guest or against the whole host.

VULNERABLE SYSTEMS
==================

All systems using oxenstored are vulnerable.  Building and using
oxenstored is the default in the upstream Xen distribution, if the
Ocaml compiler is available.

Systems using C xenstored are not vulnerable.

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

xsa352.patch           xen-unstable - 4.10

$ sha256sum xsa352*
a3b2b2bd4c6b49c472df23f88fb9a5e204d2ba3cd0c3901f8ed057566ef98c85  xsa352.meta
6f9798e20282d4e06f0a8a1abd0d147649e20b33c21559d5a1ea0b1a73a2a4e4  xsa352.patch
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
b3JnAAoJEIP+FMlX6CvZ/JgH/Rb3BDBjWi+fTDsPMr21yDsrCWGzpyBabflpglQt
b3rTDEx7YlNCkb32xYvZLR9mGAGg8X01zIQVKOQ10Hnib6Vx4TvcdwPqSYGMn3U6
4g3TmWpZJZNfCIbdznXGhOmTLZzVEGDZu1+S+mE3aAdtDGEE98p9P/J43dEt/kWX
R/DcMrCe9LOHKi+MCxZqAFlbZ79QJls6G/sH6VWSUp/Bq8hCtsd/C0Jk3LIBZgnW
V3SUYLhR7Tp7Pkda4m4lVLlvCo+9jlVwevs/MmvyFulxUrDN1/9LrHpZyJ7ZMBwt
2N7zpJpdrY5JiEH6d4fuVUsH78+9+zVxs5PFDXUc7ud2QyA=
=ofMB
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa352.meta"
Content-Disposition: attachment; filename="xsa352.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNTIsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIxZDcyZDk5MTVlZGZmMGRkNDFmNjAxYmJiMGIxZjgzYzAy
ZmYxNjg5IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
NTMsCiAgICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAg
ICAgICAzMjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1LAog
ICAgICAgICAgICAzMzAKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hl
cyI6IFsKICAgICAgICAgICAgInhzYTM1Mi5wYXRjaCIKICAgICAgICAgIF0K
ICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMSI6IHsKICAgICAg
IlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFi
bGVSZWYiOiAiNDFhODIyYzM5MjYzNTBmMjY5MTdkNzQ3YzhkZmVkMWM0NGEy
Y2Y0MiIsCiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzUz
LAogICAgICAgICAgICAxMTUsCiAgICAgICAgICAgIDMyMiwKICAgICAgICAg
ICAgMzIzLAogICAgICAgICAgICAzMjQsCiAgICAgICAgICAgIDMyNSwKICAg
ICAgICAgICAgMzMwCiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMi
OiBbCiAgICAgICAgICAgICJ4c2EzNTIucGF0Y2giCiAgICAgICAgICBdCiAg
ICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTIiOiB7CiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogIjgxNDVkMzhiNDgwMDkyNTVhMzJhYjg3YTAyZTQ4MWNkMDljODEx
ZjkiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDM1MywK
ICAgICAgICAgICAgMTE1LAogICAgICAgICAgICAzMjIsCiAgICAgICAgICAg
IDMyMywKICAgICAgICAgICAgMzI0LAogICAgICAgICAgICAzMjUsCiAgICAg
ICAgICAgIDMzMAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjog
WwogICAgICAgICAgICAieHNhMzUyLnBhdGNoIgogICAgICAgICAgXQogICAg
ICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjEzIjogewogICAgICAiUmVj
aXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJl
ZiI6ICJiNTMwMjI3M2UyYzUxOTQwMTcyNDAwNDg2NjQ0NjM2ZjJmNGZjNjRh
IiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzNTMsCiAg
ICAgICAgICAgIDExNSwKICAgICAgICAgICAgMzIyLAogICAgICAgICAgICAz
MjMsCiAgICAgICAgICAgIDMyNCwKICAgICAgICAgICAgMzI1LAogICAgICAg
ICAgICAzMzAKICAgICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsK
ICAgICAgICAgICAgInhzYTM1Mi5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xNCI6IHsKICAgICAgIlJlY2lw
ZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYi
OiAiMWQxZDFmNTM5MTk3NjQ1NmE3OWRhYWMwZGNmZTcxNTdkYTFlNTRmNyIs
CiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzUzLAogICAg
ICAgICAgICAxMTUsCiAgICAgICAgICAgIDMyMiwKICAgICAgICAgICAgMzIz
LAogICAgICAgICAgICAzMjQsCiAgICAgICAgICAgIDMyNSwKICAgICAgICAg
ICAgMzMwCiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAg
ICAgICAgICAgICJ4c2EzNTIucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAg
fQogICAgICB9CiAgICB9LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lw
ZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYi
OiAiM2FlNDY5YWY4ZTY4MGRmMzFlZWNkMGEyYWM2YTgzYjU4YWQ3Y2U1MyIs
CiAgICAgICAgICAiUHJlcmVxcyI6IFsKICAgICAgICAgICAgMzUzLAogICAg
ICAgICAgICAxMTUsCiAgICAgICAgICAgIDMyMiwKICAgICAgICAgICAgMzIz
LAogICAgICAgICAgICAzMjQsCiAgICAgICAgICAgIDMyNSwKICAgICAgICAg
ICAgMzMwCiAgICAgICAgICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAg
ICAgICAgICAgICJ4c2EzNTIucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAg
fQogICAgICB9CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa352.patch"
Content-Disposition: attachment; filename="xsa352.patch"
Content-Transfer-Encoding: base64

RnJvbTogPT9VVEYtOD9xP0Vkd2luPTIwVD1DMz1CNnI9QzM9QjZrPz0gPGVk
dmluLnRvcm9rQGNpdHJpeC5jb20+ClN1YmplY3Q6IHRvb2xzL29jYW1sL3hl
bnN0b3JlZDogb25seSBEb20wIGNhbiBjaGFuZ2Ugbm9kZSBvd25lcgpNSU1F
LVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKT3Ro
ZXJ3aXNlIHdlIGNhbiBnaXZlIHF1b3RhIGF3YXkgdG8gYW5vdGhlciBkb21h
aW4sIGVpdGhlciBjYXVzaW5nIGl0IHRvIHJ1bgpvdXQgb2YgcXVvdGEsIG9y
IGluIGNhc2Ugb2YgRG9tMCB1c2UgdW5ib3VuZGVkIGFtb3VudHMgb2YgbWVt
b3J5IGFuZCBieXBhc3MKdGhlIHF1b3RhIHN5c3RlbSBlbnRpcmVseS4KClRo
aXMgd2FzIGZpeGVkIGluIHRoZSBDIHZlcnNpb24gb2YgeGVuc3RvcmVkIGlu
IDIwMDYgKGMvcyBkYjM0ZDJhYWE1ZjUsCnByZWRhdGluZyB0aGUgWFNBIHBy
b2Nlc3MgYnkgNSB5ZWFycykuCgpJdCB3YXMgYWxzbyBmaXhlZCBpbiB0aGUg
bWlyYWdlIHZlcnNpb24gb2YgeGVuc3RvcmUgaW4gMjAxMiwgd2l0aCBhIHVu
aXQgdGVzdApkZW1vbnN0cmF0aW5nIHRoZSB2dWxuZXJhYmlsaXR5OgoKICBo
dHRwczovL2dpdGh1Yi5jb20vbWlyYWdlL29jYW1sLXhlbnN0b3JlL2NvbW1p
dC82YjkxZjNhYzQ2Yjg4NWQwNTMwYTUxZDU3YTliM2E1N2Q2NDkyM2E3CiAg
aHR0cHM6Ly9naXRodWIuY29tL21pcmFnZS9vY2FtbC14ZW5zdG9yZS9jb21t
aXQvMjJlZTU0MTdjOTBiOGZkYTkwNWMzOGRlMGQ1MzQ1MDYxNTJlYWNlNgoK
YnV0IHBvc3NpYmx5IHdpdGhvdXQgcmVhbGlzaW5nIHRoYXQgdGhlIHZ1bG5l
cmFiaWxpdHkgc3RpbGwgYWZmZWN0ZWQgdGhlCmluLXRyZWUgb3hlbnN0b3Jl
ZCAoYWRkZWQgYy9zIGY0NGFmNjYwNDEyIGluIDIwMTApLgoKVGhpcyBpcyBY
U0EtMzUyLgoKU2lnbmVkLW9mZi1ieTogRWR3aW4gVMO2csO2ayA8ZWR2aW4u
dG9yb2tAY2l0cml4LmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcg
PGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpkaWZm
IC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3N0b3JlLm1sIGIvdG9v
bHMvb2NhbWwveGVuc3RvcmVkL3N0b3JlLm1sCmluZGV4IDNiMDUxMjhmMWIu
LjVmOTE1ZjJiYmUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL3hlbnN0b3Jl
ZC9zdG9yZS5tbAorKysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvc3RvcmUu
bWwKQEAgLTQwNyw3ICs0MDcsOCBAQCBsZXQgc2V0cGVybXMgc3RvcmUgcGVy
bSBwYXRoIG5wZXJtcyA9CiAJfCBTb21lIG5vZGUgLT4KIAkJbGV0IG9sZF9v
d25lciA9IE5vZGUuZ2V0X293bmVyIG5vZGUgaW4KIAkJbGV0IG5ld19vd25l
ciA9IFBlcm1zLk5vZGUuZ2V0X293bmVyIG5wZXJtcyBpbgotCQlpZiBub3Qg
KChvbGRfb3duZXIgPSBuZXdfb3duZXIpIHx8IChQZXJtcy5Db25uZWN0aW9u
LmlzX2RvbTAgcGVybSkpIHRoZW4gUXVvdGEuY2hlY2sgc3RvcmUucXVvdGEg
bmV3X293bmVyIDA7CisJCWlmIG5vdCAoKG9sZF9vd25lciA9IG5ld19vd25l
cikgfHwgKFBlcm1zLkNvbm5lY3Rpb24uaXNfZG9tMCBwZXJtKSkgdGhlbgor
CQkJcmFpc2UgRGVmaW5lLlBlcm1pc3Npb25fZGVuaWVkOwogCQlzdG9yZS5y
b290IDwtIHBhdGhfc2V0cGVybXMgc3RvcmUgcGVybSBwYXRoIG5wZXJtczsK
IAkJUXVvdGEuZGVsX2VudHJ5IHN0b3JlLnF1b3RhIG9sZF9vd25lcjsKIAkJ
UXVvdGEuYWRkX2VudHJ5IHN0b3JlLnF1b3RhIG5ld19vd25lcgo=

--=separator--

