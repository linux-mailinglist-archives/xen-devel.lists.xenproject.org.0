Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1431274341
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 15:37:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKiU8-0001iH-9W; Tue, 22 Sep 2020 13:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzSo=C7=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kKiU7-0001gf-7s
 for xen-devel@lists.xen.org; Tue, 22 Sep 2020 13:37:31 +0000
X-Inumbo-ID: dcb14a4f-30c8-490d-b16c-ef647f6b43a5
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcb14a4f-30c8-490d-b16c-ef647f6b43a5;
 Tue, 22 Sep 2020 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 bh=BxNezBWGti6nsU94q+z58yWcVgKhlmyDeek0n1noYmg=; b=AbXMDa10H2scOBE7v+BUG8qPZO
 EQIea4geLLcicDhM+8VSUWpEgQb/LUiAhCVDUu2yEH+qevBtKnMl5qu7BaRJIxRQ+XTwyLgt3rSkh
 PjpH/9x3XHewqW+8eCojnnq5O3+ryts+046dc72rouw8ZbWaKmcHjYCzfMaW7ifnH8qg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTq-0006ot-BP; Tue, 22 Sep 2020 13:37:14 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1kKiTq-0002Gr-8r; Tue, 22 Sep 2020 13:37:14 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 333 v3 (CVE-2020-25602) - x86 pv: Crash
 when handling guest access to MSR_MISC_ENABLE
Message-Id: <E1kKiTq-0002Gr-8r@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2020-25602 / XSA-333
                               version 3

      x86 pv: Crash when handling guest access to MSR_MISC_ENABLE

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

When a guest accesses certain Model Specific Registers, Xen first reads
the value from hardware to use as the basis for auditing the guest
access.

For the MISC_ENABLE MSR, which is an Intel specific MSR, this MSR read
is performed without error handling for a #GP fault, which is the
consequence of trying to read this MSR on non-Intel hardware.

IMPACT
======

A buggy or malicious PV guest administrator can crash Xen, resulting in
a host Denial of Service.

VULNERABLE SYSTEMS
==================

Only x86 systems are vulnerable.  ARM systems are not vulnerable.

Only Xen versions 4.11 and onwards are vulnerable.  4.10 and earlier are
not vulnerable.

Only x86 systems which do not implement the MISC_ENABLE MSR (0x1a0) are
vulnerable.  AMD and Hygon systems do not implement this MSR and are
vulnerable.  Intel systems do implement this MSR and are not vulnerable.
Other manufacturers have not been checked.

Only x86 PV guests can exploit the vulnerability.  x86 HVM/PVH guests
cannot exploit the vulnerability.

MITIGATION
==========

Running only HVM/PVH guests avoids the vulnerability.

CREDITS
=======

This issue was discovered by Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa333.patch           Xen 4.11 - xen-unstable

$ sha256sum xsa333*
3f3d974ede9fe80f4eb63640dce058cf9e2073cd79e4c085c944f3ca5e454e26  xsa333.meta
8edec914fbdf036fba8cb54a75d3a9b025fac936e0af35512954a2dc2b12a26f  xsa333.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl9p/eUMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZu5EH/RAaLJocX5UJfEZ4QT2osvnc1aaZjBXNz4JN1HDj
46pGxBOv1kEDxBu/lqbbXEY2aLeBLder2nj0OHCYgDkPCh4fqaciBqCEO97COqzo
dFvN17dZ0pjyBUoSXs8mVPWjMblBjf6/Mt+/gh8speJQ32V3lHz6xYc9Nu0CVoL5
+RiaRVPGYOVndF5A0XK6UIiiMAOcVgPHpg485QFT2EIVPlKVu/jDrrsYep/9OrmP
bamEjKcYoFBBsMlpUNAtUK0QZGnSAe2vVtbUNeHgY5T5BDuJzLZXdMDGmBDXK2vV
0PNMOoIeFev6Pq7yuvvTqI0PKEBmO825hkbZ5sEva/7pZ60=
=zf3E
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa333.meta"
Content-Disposition: attachment; filename="xsa333.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMzMsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIs
CiAgICAiNC4xMSIKICBdLAogICJUcmVlcyI6IFsKICAgICJ4ZW4iCiAgXSwK
ICAiUmVjaXBlcyI6IHsKICAgICI0LjExIjogewogICAgICAiUmVjaXBlcyI6
IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICJk
ZGFhY2NiYmFiNmIxOWJmMjFlZDJjMDk3ZjMwNTVhM2MyNTQ0YzhkIiwKICAg
ICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsK
ICAgICAgICAgICAgInhzYTMzMy5wYXRjaCIKICAgICAgICAgIF0KICAgICAg
ICB9CiAgICAgIH0KICAgIH0sCiAgICAiNC4xMiI6IHsKICAgICAgIlJlY2lw
ZXMiOiB7CiAgICAgICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYi
OiAiMTMzNmNhMTc3NDI0NzFmYzRhNTk4NzlhZTJmNjM3YTU5NTMwYTkzMyIs
CiAgICAgICAgICAiUHJlcmVxcyI6IFtdLAogICAgICAgICAgIlBhdGNoZXMi
OiBbCiAgICAgICAgICAgICJ4c2EzMzMucGF0Y2giCiAgICAgICAgICBdCiAg
ICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTMiOiB7CiAgICAgICJS
ZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxl
UmVmIjogIjliMzY3YjJiMGI3MTRmM2ZmYjY5ZWQ2YmUwYTExOGU4ZDNlYWMw
N2YiLAogICAgICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQYXRj
aGVzIjogWwogICAgICAgICAgICAieHNhMzMzLnBhdGNoIgogICAgICAgICAg
XQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjE0IjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICJjM2EwZmMyMmFmOTBlZjI4ZTY4YjExNmM2YTQ5ZDljZWM1
N2Y3MWNmIiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAgICAgICAi
UGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMzMy5wYXRjaCIKICAgICAg
ICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICAibWFzdGVyIjog
ewogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAg
ICAgIlN0YWJsZVJlZiI6ICJiMTE5MTAwODJkOTBiYjE1OTdmNjY3OTUyNGVi
NzI2YTMzMzA2NjcyIiwKICAgICAgICAgICJQcmVyZXFzIjogW10sCiAgICAg
ICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMzMy5wYXRjaCIK
ICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa333.patch"
Content-Disposition: attachment; filename="xsa333.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3B2OiBIYW5kbGUgdGhlIEludGVsLXNwZWNpZmlj
IE1TUl9NSVNDX0VOQUJMRSBjb3JyZWN0bHkKClRoaXMgTVNSIGRvZXNuJ3Qg
ZXhpc3Qgb24gQU1EIGhhcmR3YXJlLCBhbmQgc3dpdGNoaW5nIGF3YXkgZnJv
bSB0aGUgc2FmZQpmdW5jdGlvbnMgaW4gdGhlIGNvbW1vbiBNU1IgcGF0aCB3
YXMgYW4gZXJyb25lb3VzIGNoYW5nZS4KClBhcnRpYWxseSByZXZlcnQgdGhl
IGNoYW5nZS4KClRoaXMgaXMgWFNBLTMzMy4KCkZpeGVzOiA0ZmRjOTMyYjNj
YyAoIng4Ni9JbnRlbDogZHJvcCBhbm90aGVyIDMyLWJpdCBsZWZ0b3ZlciIp
ClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3Au
YyBiL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYwppbmRleCBlZmVi
MmE3MjdlLi42MzMyYzc0YjgwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
cHYvZW11bC1wcml2LW9wLmMKKysrIGIveGVuL2FyY2gveDg2L3B2L2VtdWwt
cHJpdi1vcC5jCkBAIC05MjQsNyArOTI0LDggQEAgc3RhdGljIGludCByZWFk
X21zcih1bnNpZ25lZCBpbnQgcmVnLCB1aW50NjRfdCAqdmFsLAogICAgICAg
ICByZXR1cm4gWDg2RU1VTF9PS0FZOwogCiAgICAgY2FzZSBNU1JfSUEzMl9N
SVNDX0VOQUJMRToKLSAgICAgICAgcmRtc3JsKHJlZywgKnZhbCk7CisgICAg
ICAgIGlmICggcmRtc3Jfc2FmZShyZWcsICp2YWwpICkKKyAgICAgICAgICAg
IGJyZWFrOwogICAgICAgICAqdmFsID0gZ3Vlc3RfbWlzY19lbmFibGUoKnZh
bCk7CiAgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7CiAKQEAgLTEwNTks
NyArMTA2MCw4IEBAIHN0YXRpYyBpbnQgd3JpdGVfbXNyKHVuc2lnbmVkIGlu
dCByZWcsIHVpbnQ2NF90IHZhbCwKICAgICAgICAgYnJlYWs7CiAKICAgICBj
YXNlIE1TUl9JQTMyX01JU0NfRU5BQkxFOgotICAgICAgICByZG1zcmwocmVn
LCB0ZW1wKTsKKyAgICAgICAgaWYgKCByZG1zcl9zYWZlKHJlZywgdGVtcCkg
KQorICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIGlmICggdmFsICE9IGd1
ZXN0X21pc2NfZW5hYmxlKHRlbXApICkKICAgICAgICAgICAgIGdvdG8gaW52
YWxpZDsKICAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsK

--=separator--

