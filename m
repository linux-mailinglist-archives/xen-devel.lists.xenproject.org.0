Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6561D39FD53
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 19:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138711.256750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqfHu-0002Pv-4C; Tue, 08 Jun 2021 17:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138711.256750; Tue, 08 Jun 2021 17:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqfHu-0002NW-0R; Tue, 08 Jun 2021 17:13:14 +0000
Received: by outflank-mailman (input) for mailman id 138711;
 Tue, 08 Jun 2021 17:13:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CbVg=LC=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lqfA6-0007tO-E9
 for xen-devel@lists.xen.org; Tue, 08 Jun 2021 17:05:10 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30c86ed4-349b-4cfd-81aa-9080b02df5f3;
 Tue, 08 Jun 2021 17:04:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lqf9T-0004hB-KV; Tue, 08 Jun 2021 17:04:31 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lqf9T-0004vc-JX; Tue, 08 Jun 2021 17:04:31 +0000
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
X-Inumbo-ID: 30c86ed4-349b-4cfd-81aa-9080b02df5f3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=YQPfBSO74QvjUcDBr5ntUsPt+VI0GpRiGD3hrWKvTk0=; b=iQOQHvopS5dPP5RekZ3mQlKPNl
	uu1nhvctPYmkry7eCRLjsiHeB+k4O1jZ/Hh3DLEH19sTRbbm+dFCg3ujsKXGD5bjSqizrgVHwPzFO
	X52P3MGlYhlZySwrQLuv8IjYlz6RccNNzji1Th+24/3HF4q1HokQX5Eh97V774abJCwg=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 377 v2 (CVE-2021-28690) - x86: TSX Async
 Abort protections not restored after S3
Message-Id: <E1lqf9T-0004vc-JX@xenbits.xenproject.org>
Date: Tue, 08 Jun 2021 17:04:31 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-28690 / XSA-377
                               version 2

        x86: TSX Async Abort protections not restored after S3

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

This issue relates to the TSX Async Abort speculative security vulnerability.
Please see https://xenbits.xen.org/xsa/advisory-305.html for details.

Mitigating TAA by disabling TSX (the default and preferred option) requires
selecting a non-default setting in MSR_TSX_CTRL.  This setting isn't restored
after S3 suspend.

IMPACT
======

After using S3 suspend at least once, CPU0 remains vulnerable to TAA.

This is an information leak.  For full details of the impact, see
XSA-305.

VULNERABLE SYSTEMS
==================

See XSA-305 for details of susceptibility to TAA.

Only systems which are susceptible to TAA and have the XSA-305 fix are
vulnerable.  Only systems which support S3 suspend/resume are vulnerable.

The vulnerability is only exposed if S3 suspend/resume is used.

MITIGATION
==========

Not using S3 suspend/resume avoids the vulnerability.

CREDITS
=======

This issue was discovered by Andrew Cooper of Citrix.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa377.patch           xen-unstable - Xen 4.13.x
xsa377-4.12.patch      Xen 4.12.x
xsa377-4.11.patch      Xen 4.11.x

$ sha256sum xsa377*
532cb030f97d72e8e534ad97182cd5e3aa0efeef405e255bb49649b4f0dd9947  xsa377.meta
21a30dbf80f6e78057cc7e785c8fda475d5a8a0b6b9442af3bd8ca31dd69becf  xsa377.patch
3279317d56e7b8d0a2b0152b64b4c577381b8b01fa0a1a21ec6f855bb964278a  xsa377-4.11.patch
65f61f1cb7bb0e068fd32e40755b9a9aae464d15ccd42c94dae68e495c5a45e0  xsa377-4.12.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmC/oxIMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZZ0wH/AyYmZO221SvMaSa1kGaV9+tATBWtxKEmUr2I+/Y
jOHJ4Ydw2RarJtZ6reYJ+J0qlTdgI65ceo87VEm1bm+LyvxhlLRmkBfavdTg66aX
VU6uPGqJ9HMUY4rwN7aUgsc/qhquMZQYSWd5A/QknhNHlOtXhX0bnaIqgXoAroi7
PRVs3sawkEizIn1Rqc8nLk+xkOrV3xvu+ollj/VNHgPDKU7SFKZiraBzUW7bErCZ
AjCsgM7SalHDKIMpUqco4hutVJ7ykPE/pbEdC7q93TQ+PWE4/QY3JXcjC7L6KN1/
v9rRTIFTR6fc5EcJfhH2zpWi69OWfE/vjM7k9XhpMoAdUZc=
=fqiA
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa377.meta"
Content-Disposition: attachment; filename="xsa377.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAzNzcsCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xNSIsCiAgICAiNC4xNCIsCiAgICAiNC4xMyIs
CiAgICAiNC4xMiIsCiAgICAiNC4xMSIKICBdLAogICJUcmVlcyI6IFsKICAg
ICJ4ZW4iCiAgXSwKICAiUmVjaXBlcyI6IHsKICAgICI0LjExIjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICJiMWU0NmJjMzY5YmI0OTBiNzIxYzc3ZjE1ZDI1ODNiYmY0
NjYxNTJkIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
NzIsCiAgICAgICAgICAgIDM3MywKICAgICAgICAgICAgMzc1CiAgICAgICAg
ICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ez
NzctNC4xMS5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0K
ICAgIH0sCiAgICAiNC4xMiI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAg
ICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiNTk4NDkwNWIy
NjM4ZGY4N2EwMjYyZDFlZTkxZjBhNmUxNGE4NmRmNiIsCiAgICAgICAgICAi
UHJlcmVxcyI6IFsKICAgICAgICAgICAgMzcyLAogICAgICAgICAgICAzNzMs
CiAgICAgICAgICAgIDM3NQogICAgICAgICAgXSwKICAgICAgICAgICJQYXRj
aGVzIjogWwogICAgICAgICAgICAieHNhMzc3LTQuMTIucGF0Y2giCiAgICAg
ICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9LAogICAgIjQuMTMiOiB7
CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAg
ICAiU3RhYmxlUmVmIjogIjI4NDEzMjkzODkwMGNlOGMzYjExYmFiZjcyNTVm
NWM2ZGJiMjE3MTYiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAg
ICAgIDM3MiwKICAgICAgICAgICAgMzczLAogICAgICAgICAgICAzNzUKICAg
ICAgICAgIF0sCiAgICAgICAgICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAg
InhzYTM3Ny5wYXRjaCIKICAgICAgICAgIF0KICAgICAgICB9CiAgICAgIH0K
ICAgIH0sCiAgICAiNC4xNCI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAg
ICAgInhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiMTBmMGIyZDQ5
Mzc2ODY1ZDQ5NjgwZjA2YzUyYjQ1MWZhYmNlM2JiNSIsCiAgICAgICAgICAi
UHJlcmVxcyI6IFsKICAgICAgICAgICAgMzcyLAogICAgICAgICAgICAzNzMs
CiAgICAgICAgICAgIDM3NQogICAgICAgICAgXSwKICAgICAgICAgICJQYXRj
aGVzIjogWwogICAgICAgICAgICAieHNhMzc3LnBhdGNoIgogICAgICAgICAg
XQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjE1IjogewogICAg
ICAiUmVjaXBlcyI6IHsKICAgICAgICAieGVuIjogewogICAgICAgICAgIlN0
YWJsZVJlZiI6ICIyODBkNDcyZjRmY2EwNzBhMTAzNzdlMzE4ZDkwY2FiZmMy
NTQwODEwIiwKICAgICAgICAgICJQcmVyZXFzIjogWwogICAgICAgICAgICAz
NzIsCiAgICAgICAgICAgIDM3MywKICAgICAgICAgICAgMzc1CiAgICAgICAg
ICBdLAogICAgICAgICAgIlBhdGNoZXMiOiBbCiAgICAgICAgICAgICJ4c2Ez
NzcucGF0Y2giCiAgICAgICAgICBdCiAgICAgICAgfQogICAgICB9CiAgICB9
LAogICAgIm1hc3RlciI6IHsKICAgICAgIlJlY2lwZXMiOiB7CiAgICAgICAg
InhlbiI6IHsKICAgICAgICAgICJTdGFibGVSZWYiOiAiYWE3N2FjYzI4MDk4
ZDA0OTQ1YWY5OThmM2ZjMGRiZDM3NTliNWI0MSIsCiAgICAgICAgICAiUHJl
cmVxcyI6IFsKICAgICAgICAgICAgMzcyLAogICAgICAgICAgICAzNzMsCiAg
ICAgICAgICAgIDM3NQogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVz
IjogWwogICAgICAgICAgICAieHNhMzc3LnBhdGNoIgogICAgICAgICAgXQog
ICAgICAgIH0KICAgICAgfQogICAgfQogIH0KfQ==

--=separator
Content-Type: application/octet-stream; name="xsa377.patch"
Content-Disposition: attachment; filename="xsa377.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogTWl0aWdhdGUgVEFBIGFmdGVy
IFMzIHJlc3VtZQoKVGhlIHVzZXIgY2hvc2VuIHNldHRpbmcgZm9yIE1TUl9U
U1hfQ1RSTCBuZWVkcyByZXN0b3JpbmcgYWZ0ZXIgUzMuCgpBbGwgQVBzIGdl
dCB0aGUgY29ycmVjdCBzZXR0aW5nIHZpYSBzdGFydF9zZWNvbmRhcnkoKSwg
YnV0IHRoZSBCU1Agd2FzIG1pc3NlZApvdXQuCgpUaGlzIGlzIFhTQS0zNzcg
LyBDVkUtMjAyMS0yODY5MC4KCkZpeGVzOiA4YzQzMzA4MThmNiAoIng4Ni9z
cGVjLWN0cmw6IE1pdGlnYXRlIHRoZSBUU1ggQXN5bmNocm9ub3VzIEFib3J0
IHNpZGVjaGFubmVsIikKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvYWNwaS9wb3dlci5jIGIveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYwppbmRleCA5MWE4YzRkMGJkLi4zMWE1NmYwMmQwIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9hY3BpL3Bvd2VyLmMKQEAgLTI4OCw2ICsyODgsOCBAQCBzdGF0aWMgaW50
IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkKIAogICAgIG1pY3JvY29kZV91cGRh
dGVfb25lKCk7CiAKKyAgICB0c3hfaW5pdCgpOyAvKiBOZWVkcyBtaWNyb2Nv
ZGUuICBNYXkgY2hhbmdlIEhMRS9SVE0gZmVhdHVyZSBiaXRzLiAqLworCiAg
ICAgaWYgKCAhcmVjaGVja19jcHVfZmVhdHVyZXMoMCkgKQogICAgICAgICBw
YW5pYygiTWlzc2luZyBwcmV2aW91c2x5IGF2YWlsYWJsZSBmZWF0dXJlKHMp
XG4iKTsKIAo=

--=separator
Content-Type: application/octet-stream; name="xsa377-4.11.patch"
Content-Disposition: attachment; filename="xsa377-4.11.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogTWl0aWdhdGUgVEFBIGFmdGVy
IFMzIHJlc3VtZQoKVGhlIHVzZXIgY2hvc2VuIHNldHRpbmcgZm9yIE1TUl9U
U1hfQ1RSTCBuZWVkcyByZXN0b3JpbmcgYWZ0ZXIgUzMuCgpBbGwgQVBzIGdl
dCB0aGUgY29ycmVjdCBzZXR0aW5nIHZpYSBzdGFydF9zZWNvbmRhcnkoKSwg
YnV0IHRoZSBCU1Agd2FzIG1pc3NlZApvdXQuCgpUaGlzIGlzIFhTQS0zNzcg
LyBDVkUtMjAyMS0yODY5MC4KCkZpeGVzOiA4YzQzMzA4MThmNiAoIng4Ni9z
cGVjLWN0cmw6IE1pdGlnYXRlIHRoZSBUU1ggQXN5bmNocm9ub3VzIEFib3J0
IHNpZGVjaGFubmVsIikKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvYWNwaS9wb3dlci5jIGIveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYwppbmRleCAzMGUxYmQ1Y2QzLi40NTFjYmE2MjJjIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9hY3BpL3Bvd2VyLmMKQEAgLTI1OSw2ICsyNTksOCBAQCBzdGF0aWMgaW50
IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkKIAogICAgIG1pY3JvY29kZV9yZXN1
bWVfY3B1KDApOwogCisgICAgdHN4X2luaXQoKTsgLyogTmVlZHMgbWljcm9j
b2RlLiAgTWF5IGNoYW5nZSBITEUvUlRNIGZlYXR1cmUgYml0cy4gKi8KKwog
ICAgIGlmICggIXJlY2hlY2tfY3B1X2ZlYXR1cmVzKDApICkKICAgICAgICAg
cGFuaWMoIk1pc3NpbmcgcHJldmlvdXNseSBhdmFpbGFibGUgZmVhdHVyZShz
KS4iKTsKIAo=

--=separator
Content-Type: application/octet-stream; name="xsa377-4.12.patch"
Content-Disposition: attachment; filename="xsa377-4.12.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KU3ViamVjdDogeDg2L3NwZWMtY3RybDogTWl0aWdhdGUgVEFBIGFmdGVy
IFMzIHJlc3VtZQoKVGhlIHVzZXIgY2hvc2VuIHNldHRpbmcgZm9yIE1TUl9U
U1hfQ1RSTCBuZWVkcyByZXN0b3JpbmcgYWZ0ZXIgUzMuCgpBbGwgQVBzIGdl
dCB0aGUgY29ycmVjdCBzZXR0aW5nIHZpYSBzdGFydF9zZWNvbmRhcnkoKSwg
YnV0IHRoZSBCU1Agd2FzIG1pc3NlZApvdXQuCgpUaGlzIGlzIFhTQS0zNzcg
LyBDVkUtMjAyMS0yODY5MC4KCkZpeGVzOiA4YzQzMzA4MThmNiAoIng4Ni9z
cGVjLWN0cmw6IE1pdGlnYXRlIHRoZSBUU1ggQXN5bmNocm9ub3VzIEFib3J0
IHNpZGVjaGFubmVsIikKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvYWNwaS9wb3dlci5jIGIveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYwppbmRleCBhMDdhYTNiOWVkLi42NjAzNjNhM2RmIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9hY3BpL3Bvd2VyLmMKQEAgLTI1OSw2ICsyNTksOCBAQCBzdGF0aWMgaW50
IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkKIAogICAgIG1pY3JvY29kZV9yZXN1
bWVfY3B1KDApOwogCisgICAgdHN4X2luaXQoKTsgLyogTmVlZHMgbWljcm9j
b2RlLiAgTWF5IGNoYW5nZSBITEUvUlRNIGZlYXR1cmUgYml0cy4gKi8KKwog
ICAgIGlmICggIXJlY2hlY2tfY3B1X2ZlYXR1cmVzKDApICkKICAgICAgICAg
cGFuaWMoIk1pc3NpbmcgcHJldmlvdXNseSBhdmFpbGFibGUgZmVhdHVyZShz
KVxuIik7CiAK

--=separator--

