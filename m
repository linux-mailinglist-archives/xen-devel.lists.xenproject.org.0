Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A206216CAB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 14:19:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsmYm-0005UF-VF; Tue, 07 Jul 2020 12:18:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1g3R=AS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1jsmYl-0005Sv-Qd
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 12:18:51 +0000
X-Inumbo-ID: ff1edf8c-c04b-11ea-8d5d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff1edf8c-c04b-11ea-8d5d-12813bfff9fa;
 Tue, 07 Jul 2020 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pka224yeKHvOnBWMQf/upTLDc1Wie4UNUJLCWEs/KC4=; b=HQHGlhpB4pJrFNJPJts4F2QL3R
 BQ8USz9N48wvmAx4C9Hsi8zpMVPfGYxWgbuTHqr25bH3KPLI9XeapPHLF+eP1JJPUrwYLtnhlOtCs
 CS7wTaNjlsJK/5yRIieZVFv3NcoeRZ8I/aREgxO68K+iVFFpoOs0R5EKNcaapHhbYUw0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jsmYX-0002mz-D6; Tue, 07 Jul 2020 12:18:37 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1jsmYX-0000Xl-BV; Tue, 07 Jul 2020 12:18:37 +0000
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 319 v3 (CVE-2020-15563) - inverted code
 paths in x86 dirty VRAM tracking
Message-Id: <E1jsmYX-0000Xl-BV@xenbits.xenproject.org>
Date: Tue, 07 Jul 2020 12:18:37 +0000
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
Cc: "Xen.org security team" <security-team-members@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-15563 / XSA-319
                               version 3

            inverted code paths in x86 dirty VRAM tracking

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

An inverted conditional in x86 HVM guests' dirty video RAM tracking
code allows such guests to make Xen de-reference a pointer guaranteed
to point at unmapped space.

IMPACT
======

A malicious or buggy HVM guest may cause the hypervisor to crash,
resulting in Denial of Service (DoS) affecting the entire host.

VULNERABLE SYSTEMS
==================

Xen versions from 4.8 onwards are affected.  Xen versions 4.7 and
earlier are not affected.

Only x86 systems are affected.  Arm systems are not affected.

Only x86 HVM guests using shadow paging can leverage the vulnerability.
In addition there needs to be an entity actively monitoring a guest's
video frame buffer (typically for display purposes) in order for such a
guest to be able to leverage the vulnerability.  x86 PV guests as well
as x86 HVM guest using hardware assisted paging (HAP) cannot leverage
the vulnerability.

MITIGATION
==========

Running only PV guests will avoid the vulnerability.

For HVM guest explicitly configured to use shadow paging (e.g. via the
`hap=0' xl domain configuration file parameter), changing to HAP (e.g.
by setting `hap=1') will avoid exposing the vulnerability to those
guests.  HAP is the default (in upstream Xen), where the hardware
supports it; so this mitigation is only applicable if HAP has been
disabled by configuration.

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

xsa319.patch           xen-unstable, 4.13 - 4.9

$ sha256sum xsa319*
1fe0dc2e274776b8e1275f85129280f280f94ca4eabe6a8166113283dad93ed8  xsa319.meta
c145f394f8ac7d8838c376a97e1850c4125c12e478fc66ebe025ae397b27e6ea  xsa319.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patch described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

HOWEVER deployment of the "use HAP mode" mitigation described above is
NOT permitted (except where all the affected systems and VMs are
administered and used only by organisations which are members of the Xen
Project Security Issues Predisclosure List).  Specifically, deployment
on public cloud systems is NOT permitted.

This is because in that case the configuration change can be observed
by guests, which could lead to the rediscovery of the vulnerability.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl8EZ/sMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ75YH/jX/sAs0icOgBtHkwVZHg318OBExxt9x+ehk/pxb
i+1ZlS/IrJ8eJdHJYq8HYvAlxmtmFP1I0t+C9vmwbP4QMcR++RmKgdJI4+/sqCsB
AMEnK+cVJSbHxD7y7eW2CPuU3h0cKx0H24JgtzA2ONse7dVz7RN+oa97D5IKryTL
cBW8WroMn2InbKMCUy/5zj89NLAlbSuWSVZzQidDwzTITukzhZZ7Xw0+Q2yh1nkK
S4kcmz7Bzzd5Mc1gFr1Eh1FxfmVVl5RxwDE//3a5VbmfPVo/f0kMOIWjXVd1R1dj
x78SPrPojOAZbb8+f1LYqHmqzCgzvpa4EFbsOnsB7CBmP2Q=
=bDFh
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa319.meta"
Content-Disposition: attachment; filename="xsa319.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzMTksCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMyIsCiAgICAiNC4xMiIsCiAgICAiNC4xMSIs
CiAgICAiNC4xMCIsCiAgICAiNC45IgogIF0sCiAgIlRyZWVzIjogWwogICAg
InhlbiIKICBdLAogICJSZWNpcGVzIjogewogICAgIjQuMTAiOiB7CiAgICAg
ICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3Rh
YmxlUmVmIjogImZkNmU0OWVjYWUwMzg0MDYxMGZkYzZhNDE2YTYzODU5MGMw
YjY1MzUiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDMx
NwogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAg
ICAgICAieHNhMzE5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAg
ICAgfQogICAgfSwKICAgICI0LjExIjogewogICAgICAiUmVjaXBlcyI6IHsK
ICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIyYjc3
NzI5ODg4ZmI4NTFhYjk2ZTdmNzdiYzg1NDEyMjYyNmI0ODYxIiwKICAgICAg
ICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAzMTcKICAgICAgICAgIF0s
CiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTMxOS5w
YXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAg
ICAiNC4xMiI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAgInhlbiI6
IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMDUwZmU0OGRjOTgxZTA0ODhk
ZTFmNmM2YzA3ZDgxMTBmM2I3NTIzYiIsCiAgICAgICAgICAiUHJlcmVxcyI6
IFsKICAgICAgICAgICAgMzE3CiAgICAgICAgICBdLAogICAgICAgICAgIlBh
dGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2EzMTkucGF0Y2giCiAgICAgICAg
ICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTMiOiB7CiAg
ICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAi
U3RhYmxlUmVmIjogIjlmN2U4YmFjNGNhMjc5YjNiZmNjYjVmMzczMGZiMmU1
Mzk4Yzk1YWIiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAg
IDMxNwogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAg
ICAgICAgICAieHNhMzE5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0K
ICAgICAgfQogICAgfSwKICAgICI0LjkiOiB7CiAgICAgICJSZWNpcGVzIjog
ewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjZl
NDc3YzJlYTRkNWMyNmE3YTdiMmY4NTAxNjZhYTc5ZWRjNTIyNWMiLAogICAg
ICAgICAgIlByZXJlcXMiOiBbXSwKICAgICAgICAgICJQYXRjaGVzIjogWwog
ICAgICAgICAgICAieHNhMzE5LnBhdGNoIgogICAgICAgICAgXQogICAgICAg
IH0KICAgICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAgICJSZWNp
cGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVm
IjogImU0ZDIyMDcxNjViMzc5ZWMxM2M4YjUxMjkzNmY2Mzk4MmFmNjJkMTMi
LAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDMxNwogICAg
ICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAi
eHNhMzE5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQog
ICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa319.patch"
Content-Disposition: attachment; filename="xsa319.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvc2hhZG93OiBjb3JyZWN0IGFuIGludmVydGVkIGNvbmRpdGlvbmFs
IGluIGRpcnR5IFZSQU0gdHJhY2tpbmcKClRoaXMgb3JpZ2luYWxseSB3YXMg
Im1mbl94KG1mbikgPT0gSU5WQUxJRF9NRk4iLiBNYWtlIGl0IGxpa2UgdGhp
cwphZ2FpbiwgdGFraW5nIHRoZSBvcHBvcnR1bml0eSB0byBhbHNvIGRyb3Ag
dGhlIHVubmVjZXNzYXJ5IG5lYXJieQpicmFjZXMuCgpUaGlzIGlzIFhTQS0z
MTkuCgpGaXhlczogMjQ2YTVhMzM3N2MyICgieGVuOiBVc2UgYSB0eXBlc2Fm
ZSB0byBkZWZpbmUgSU5WQUxJRF9NRk4iKQpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKLS0tIGEv
eGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYworKysgYi94ZW4vYXJj
aC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCkBAIC0zMjUyLDEwICszMjUyLDgg
QEAgaW50IHNoYWRvd190cmFja19kaXJ0eV92cmFtKHN0cnVjdCBkb21haQog
ICAgICAgICAgICAgaW50IGRpcnR5ID0gMDsKICAgICAgICAgICAgIHBhZGRy
X3Qgc2wxbWEgPSBkaXJ0eV92cmFtLT5zbDFtYVtpXTsKIAotICAgICAgICAg
ICAgaWYgKCAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKLSAgICAgICAg
ICAgIHsKKyAgICAgICAgICAgIGlmICggbWZuX2VxKG1mbiwgSU5WQUxJRF9N
Rk4pICkKICAgICAgICAgICAgICAgICBkaXJ0eSA9IDE7Ci0gICAgICAgICAg
ICB9CiAgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7Cg==

--=separator--

