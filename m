Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB42FBC89
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 17:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70577.126736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ty0-0005EQ-Ky; Tue, 19 Jan 2021 16:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70577.126736; Tue, 19 Jan 2021 16:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ty0-0005Du-Gk; Tue, 19 Jan 2021 16:34:52 +0000
Received: by outflank-mailman (input) for mailman id 70577;
 Tue, 19 Jan 2021 16:34:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g3v7=GW=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1l1txy-0004wn-Ig
 for xen-devel@lists.xen.org; Tue, 19 Jan 2021 16:34:50 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c928cbda-231e-4f7d-ba83-acdfdaf41600;
 Tue, 19 Jan 2021 16:34:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1l1txT-0004vd-Jx; Tue, 19 Jan 2021 16:34:19 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1l1txT-0002xV-JD; Tue, 19 Jan 2021 16:34:19 +0000
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
X-Inumbo-ID: c928cbda-231e-4f7d-ba83-acdfdaf41600
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=C5UK2QtG/S7aEUEH9HsxEYXIX3VPu03wMMkvuOHpN9s=; b=r9ncFBV/rNhrGQF79pMEu4Izgc
	AoB35AXs+zQdh8jmIGAqiDeXyocBCfOs4Tm3mYo4jyvm/4YDDwPmnUeaXpEoi7j9DmMrA3Ao7yD/t
	tmn6B7WfftmlOqRB4lnvfVt68Ua8sg5XZ/n1QLGoPpiDhQ4y94xoN2bT/OATGzrMfmV4=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 355 v3 (CVE-2020-29040) - stack corruption
 from XSA-346 change
Message-Id: <E1l1txT-0002xV-JD@xenbits.xenproject.org>
Date: Tue, 19 Jan 2021 16:34:19 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29040 / XSA-355
                              version 3

                 stack corruption from XSA-346 change

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

One of the two changes for XSA-346 introduced an on-stack array.  The
check for guarding against overrunning this array was off by one,
allowing for corruption of the first stack slot immediately following
this array.

IMPACT
======

A malicious or buggy HVM or PVH guest can cause Xen to crash, resulting
in a Denial of Service (DoS) to the entire host.  Privilege escalation
as well as information leaks cannot be excluded.

VULNERABLE SYSTEMS
==================

All Xen versions which have the patches for XSA-346 applied are
vulnerable.

Only x86 HVM and PVH guests can leverage the vulnerability.  Arm guests
and x86 PV guests cannot leverage the vulnerability.

Only x86 HVM and PVH guests which have physical devices passed through
to them can leverage the vulnerability.

MITIGATION
==========

Not passing through physical devices to untrusted guests will avoid
the vulnerability.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa355.patch           xen-unstable - Xen 4.10.x

$ sha256sum xsa355*
a93bfc376897e7cffd095d395f1a66476adb9503d7d80a59b7861e64c2675323  xsa355.meta
dae633c11cf2eff3e304737265e18ab09213e8e4640458080a944ae7a40819a4  xsa355.patch
$

NOTE CONCERNING SHORT EMBARGO
=============================

This issue is likely to be re-discovered as the changes for XSA-346
are deployed more widely, since the issue is also triggerable without
any malice or bugginess.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmAHB6UMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZpMAH/AwWuyJ0tQS95kJmfCSe9gxFkIZwnoOlxAIF1fQ8
0W7OXmgrr9giz3lVR6Kjannq3HextHuLoVttg3soJ6pCqPBOH84/k0vyHEb9ChBF
ypkvH0iG1wnpVo+DdYOnY7OnaBHrPsB0E83WfKohP05e+Ymcroq09vKw02fR6B+z
+D3uNzbNi1kZz1DcTZFsCAmHJsc3zS+D8jyEwOFQwlVckugJ+zDuylKtSDau56CN
WGG3nkoDldWm1687ui4stnal8WIBP6sMgErwnv9hpzfL5glc/m0PSELQ8hZgNmAX
KMoWvdjPenwPQEhrii92P15DbXGz6uktIZFrKRgCUx2u5ss=
=1hd2
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa355.meta"
Content-Disposition: attachment; filename="xsa355.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNTUsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIsCiAgICAiNC4xMCIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjEwIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIxNWIyOTgwOTcyODlmMWMxMWI5ODE0NTRhM2RjOTEyYjk1
ZTJmNjViIiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM1NS5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMSI6IHsK
ICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAg
ICJTdGFibGVSZWYiOiAiMTQ0N2Q0NDlmYWI3ZTQ4Yzg1ZmFmODM5NTE4NDJi
YjYwZDdkYWJlNSIsCiAgICAgICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAg
ICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzNTUucGF0Y2giCiAg
ICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTIi
OiB7CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAg
ICAgICAiU3RhYmxlUmVmIjogIjE0YzljMGZjZWFlOTJhMThkZWRjM2YyODBl
YmY4YjlmNTJlMzlkZTUiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMzU1LnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjEzIjogewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewog
ICAgICAgICAgIlN0YWJsZVJlZiI6ICJkNGMwNDgzYzBiODc3NjhjZDliOTU1
NDJlOTgxMTFlNGMwOThkNTdmIiwKICAgICAgICAgICJQcmVyZXFzIjogW10s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTM1NS5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiZDEwMWI0MTdiNzg0YTI2MzI2
ZmM3ODAwYTc5Y2M1MzliYTU3MGI3OSIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ez
NTUucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiYjY1OWE1Y2ViZDYx
MWRiZTY5OGU2M2MwMzQ4NWI1ZmU4Y2Q5NjRhZCIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAg
ICJ4c2EzNTUucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9
CiAgICB9CiAgfQp9

--=separator
Content-Type: application/octet-stream; name="xsa355.patch"
Content-Disposition: attachment; filename="xsa355.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBtZW1vcnk6IGZpeCBvZmYtYnktb25lIGluIFhTQS0zNDYgY2hhbmdlCgpU
aGUgY29tcGFyaXNvbiBhZ2FpbnN0IEFSUkFZX1NJWkUoKSBuZWVkcyB0byBi
ZSA+PSBpbiBvcmRlciB0byBhdm9pZApvdmVycnVubmluZyB0aGUgcGFnZXNb
XSBhcnJheS4KClRoaXMgaXMgWFNBLTM1NS4KCkZpeGVzOiA1Nzc3YTM3NDJk
ODggKCJJT01NVTogaG9sZCBwYWdlIHJlZiB1bnRpbCBhZnRlciBkZWZlcnJl
ZCBUTEIgZmx1c2giKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPgoKLS0tIGEveGVuL2NvbW1vbi9tZW1vcnkuYwor
KysgYi94ZW4vY29tbW9uL21lbW9yeS5jCkBAIC04NTQsNyArODU0LDcgQEAg
aW50IHhlbm1lbV9hZGRfdG9fcGh5c21hcChzdHJ1Y3QgZG9tYWluCiAgICAg
ICAgICAgICArK2V4dHJhLnBwYWdlOwogCiAgICAgICAgIC8qIENoZWNrIGZv
ciBjb250aW51YXRpb24gaWYgaXQncyBub3QgdGhlIGxhc3QgaXRlcmF0aW9u
LiAqLwotICAgICAgICBpZiAoICgrK2RvbmUgPiBBUlJBWV9TSVpFKHBhZ2Vz
KSAmJiBleHRyYS5wcGFnZSkgfHwKKyAgICAgICAgaWYgKCAoKytkb25lID49
IEFSUkFZX1NJWkUocGFnZXMpICYmIGV4dHJhLnBwYWdlKSB8fAogICAgICAg
ICAgICAgICh4YXRwLT5zaXplID4gZG9uZSAmJiBoeXBlcmNhbGxfcHJlZW1w
dF9jaGVjaygpKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHJjID0gc3Rh
cnQgKyBkb25lOwo=

--=separator--

