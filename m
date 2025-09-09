Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54535B4AD13
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 14:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116439.1462760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvx1Y-0004WL-Es; Tue, 09 Sep 2025 12:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116439.1462760; Tue, 09 Sep 2025 12:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvx1Y-0004Tq-C1; Tue, 09 Sep 2025 12:00:36 +0000
Received: by outflank-mailman (input) for mailman id 1116439;
 Tue, 09 Sep 2025 12:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEb6=3U=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1uvx1X-0004Tc-BT
 for xen-devel@lists.xen.org; Tue, 09 Sep 2025 12:00:35 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93c5610d-8d74-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 14:00:30 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1uvx1K-001exF-14;
 Tue, 09 Sep 2025 12:00:22 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1uvx1K-001SUg-0t;
 Tue, 09 Sep 2025 12:00:22 +0000
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
X-Inumbo-ID: 93c5610d-8d74-11f0-9809-7dc792cee155
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 472 v2 (CVE-2025-27466,CVE-2025-58142,CVE-2025-58143)
 - Mutiple vulnerabilities in the Viridian interface
Message-Id: <E1uvx1K-001SUg-0t@xenbits.xenproject.org>
Date: Tue, 09 Sep 2025 12:00:22 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

 Xen Security Advisory CVE-2025-27466,CVE-2025-58142,CVE-2025-58143 / XSA-472
                                   version 2

           Mutiple vulnerabilities in the Viridian interface

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

There are multiple issues related to the handling and accessing of guest
memory pages in the viridian code:

 1. A NULL pointer dereference in the updating of the reference TSC area.
    This is CVE-2025-27466.

 2. A NULL pointer dereference by assuming the SIM page is mapped when
    a synthetic timer message has to be delivered.  This is
    CVE-2025-58142.

 3. A race in the mapping of the reference TSC page, where a guest can
    get Xen to free a page while still present in the guest physical to
    machine (p2m) page tables.  This is CVE-2025-58143.

IMPACT
======

Denial of Service (DoS) affecting the entire host, information leaks, or
elevation of privilege.

VULNERABLE SYSTEMS
==================

Xen versions 4.13 and newer are vulnerable.  Xen versions 4.12 and older
are not vulnerable.

Only x86 HVM guests which have the reference_tsc or stimer viridian
extensions enabled are vulnerable.

MITIGATION
==========

Not enabling the reference_tsc and stimer viridian extensions will avoid
the issues.

CREDITS
=======

This issue was discovered by Roger Pau Monné of XenServer.

RESOLUTION
==========

Applying the appropriate set of attached patches resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa472-?.patch         xen-unstable - Xen 4.17.x

$ sha256sum xsa472*
16e14b3cc87800c08d96adc18e66aa4a20a77834af12b9cdd01d739882f07b7d  xsa472-1.patch
4be6a1066fbec367e8c9883240cec2a78671d484928d51ac5fb82e2c539e38ca  xsa472-2.patch
9e1972a2b5a7a817b25cad0fa80c983198bb73a2788a4d0b5cdcaca4518a57cf  xsa472-3.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches (but not mitigations) described above (or others
which are substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

This is because the mitigations are guest visible changes, and hence could
give hints to users about the upcoming vulnerabilities.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmjAFT8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZGV8H+QEb73eX4Nf/BSKpeLxzO5vpieWv9vFX83Tq9/LH
KFQKbz4Y13XjtrxEpQhnZCYBEjgByBECrCnngaqjT8P3G17fhiEp2pMgMsU783mz
TPtmdDcC63WGNyqB/7j3jxDLuCscPKKGjS+DHmcIbiV9H820EYQi83mWOGNwXRQP
pYaMz5HSO15YypxKgK4i+piVceTS/fL0dclFU/vY13bq9sCqE/E4XRsClPgk1ryS
LqUBtXbQJfxSK9asMxd0BLozVsWNVgZ6e2XTWpPf/T5EBoOo+qhQ2XaRmGCyVi98
D5t8BJ0HV83Ptik37QlosjsRbtogPXpOiaPsFmB15WFlxk8=
=/zd8
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa472-1.patch"
Content-Disposition: attachment; filename="xsa472-1.patch"
Content-Transfer-Encoding: base64

RnJvbSAyNjIxMTRhNDQwYmY3YzMyZmQ2ZDIxNWUyNDNiM2VhZWJkZDZkN2Nk
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBUaHUsIDEwIEp1bCAy
MDI1IDE1OjUxOjQwICswMjAwClN1YmplY3Q6IFtQQVRDSCAxLzNdIHg4Ni92
aXJpZGlhbjogYXZvaWQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluCiB1
cGRhdGVfcmVmZXJlbmNlX3RzYygpCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CgpUaGUgZnVuY3Rpb24gaXMgb25seSBj
YWxsZWQgd2hlbiB0aGUgTVNSIGhhcyB0aGUgZW5hYmxlZCBiaXQgc2V0LCBi
dXQgZXZlbgp0aGVuIHRoZSBwYWdlIG1pZ2h0IG5vdCBiZSBtYXBwZWQgYmVj
YXVzZSB0aGUgZ3Vlc3QgcHJvdmlkZWQgZ2ZuIGlzIG5vdApzdWl0YWJsZS4K
ClByZXZlbnQgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gdXBkYXRl
X3JlZmVyZW5jZV90c2MoKSBieSBjaGVja2luZwp3aGV0aGVyIHRoZSBwYWdl
IGlzIG1hcHBlZC4KClRoaXMgaXMgQ1ZFLTIwMjUtMjc0NjYgLyBwYXJ0IG9m
IFhTQS00NzIuCgpGaXhlczogMzg2YjMzNjUyMjFkICgndmlyaWRpYW46IHVz
ZSB2aXJpZGlhbl9tYXAvdW5tYXBfZ3Vlc3RfcGFnZSgpIGZvciByZWZlcmVu
Y2UgdHNjIHBhZ2UnKQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZt
L3ZpcmlkaWFuL3RpbWUuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0v
dmlyaWRpYW4vdGltZS5jIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90
aW1lLmMKaW5kZXggMTM3NTc3Mzg0ZjFlLi5jYTZkNTI2ZjQ2YjcgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCkBAIC0yNiw2ICsy
NiwxMCBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcmVmZXJlbmNlX3RzYyhjb25z
dCBzdHJ1Y3QgZG9tYWluICpkLCBib29sIGluaXRpYWxpemUpCiAgICAgSFZf
UkVGRVJFTkNFX1RTQ19QQUdFICpwID0gcnQtPnB0cjsKICAgICB1aW50MzJf
dCBzZXE7CiAKKyAgICAvKiBSZWZlcmVuY2UgVFNDIHBhZ2UgbWlnaHQgbm90
IGJlIG1hcHBlZCBldmVuIGlmIHRoZSBNU1IgaXMgZW5hYmxlZC4gKi8KKyAg
ICBpZiAoICFwICkKKyAgICAgICAgcmV0dXJuOworCiAgICAgaWYgKCBpbml0
aWFsaXplICkKICAgICAgICAgY2xlYXJfcGFnZShwKTsKIAotLSAKMi40OS4w
Cgo=

--=separator
Content-Type: application/octet-stream; name="xsa472-2.patch"
Content-Disposition: attachment; filename="xsa472-2.patch"
Content-Transfer-Encoding: base64

RnJvbSA3MWM5NTY4ZTI5MGI1MWRmZDdhYjA5MWFjOThiMjcyZmQwYWEwYjkw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBUaHUsIDEwIEp1bCAy
MDI1IDE1OjU4OjUxICswMjAwClN1YmplY3Q6IFtQQVRDSCAyLzNdIHg4Ni92
aXJpZGlhbjogYXZvaWQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluCiB2
aXJpZGlhbl9zeW5pY19kZWxpdmVyX3RpbWVyX21zZygpCk1JTUUtVmVyc2lv
bjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYt
OApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpUaGUgZnVuY3Rp
b24gaXMgY2FsbGVkIHVuY29uZGl0aW9uYWxseSwgcmVnYXJkbGVzcyBvZiB3
aGV0aGVyIHRoZSBTSU0gcGFnZQppcyBtYXBwZWQuICBBdm9pZCBhIE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZSBpbgp2aXJpZGlhbl9zeW5pY19kZWxpdmVy
X3RpbWVyX21zZygpIGJ5IGNoZWNraW5nIHdoZXRoZXIgdGhlIFNJTSBwYWdl
IGlzCm1hcHBlZC4KClRoaXMgaXMgQ1ZFLTIwMjUtNTgxNDIgLyBwYXJ0IG9m
IFhTQS00NzIuCgpGaXhlczogMjZmYmEzYzg1NTcxICgndmlyaWRpYW46IGFk
ZCBpbXBsZW1lbnRhdGlvbiBvZiBzeW50aGV0aWMgdGltZXJzJykKU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9zeW5pYy5jIHwg
NCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9zeW5pYy5jIGIv
eGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9zeW5pYy5jCmluZGV4IGMzZGM1
NzNiMDAzZC4uZTZjYmE3NTQ4ZjFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3ZpcmlkaWFuL3N5bmljLmMKKysrIGIveGVuL2FyY2gveDg2L2h2
bS92aXJpZGlhbi9zeW5pYy5jCkBAIC0zMzgsNiArMzM4LDEwIEBAIGJvb2wg
dmlyaWRpYW5fc3luaWNfZGVsaXZlcl90aW1lcl9tc2coc3RydWN0IHZjcHUg
KnYsIHVuc2lnbmVkIGludCBzaW50eCwKICAgICAgICAgLkRlbGl2ZXJ5VGlt
ZSA9IGRlbGl2ZXJ5LAogICAgIH07CiAKKyAgICAvKiBEb24ndCBhc3N1bWUg
U0lNIHBhZ2UgdG8gYmUgbWFwcGVkLiAqLworICAgIGlmICggIW1zZyApCisg
ICAgICAgIHJldHVybiBmYWxzZTsKKwogICAgIC8qCiAgICAgICogVG8gYXZv
aWQgdXNpbmcgYW4gYXRvbWljIHRlc3QtYW5kLXNldCwgYW5kIGJhcnJpZXIg
YmVmb3JlIGNhbGxpbmcKICAgICAgKiB2bGFwaWNfc2V0X2lycSgpLCB0aGlz
IGZ1bmN0aW9uIG11c3QgYmUgY2FsbGVkIGluIGNvbnRleHQgb2YgdGhlCi0t
IAoyLjQ5LjAKCg==

--=separator
Content-Type: application/octet-stream; name="xsa472-3.patch"
Content-Disposition: attachment; filename="xsa472-3.patch"
Content-Transfer-Encoding: base64

RnJvbSBhZWQ0Y2ZkNjRkMTc4YWVlNjc3YTg3OTA0NDBhZGRkYTAzNjc4Y2Q2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBUaHUsIDMgSnVsIDIw
MjUgMTM6MDk6MDMgKzAyMDAKU3ViamVjdDogW1BBVENIIDMvM10geDg2L3Zp
cmlkaWFuOiBwcm90ZWN0IGNvbmN1cnJlbnQgbW9kaWZpY2F0aW9uIG9mIHRo
ZQogcmVmZXJlbmNlIFRTQyBwYWdlCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CgpUaGUgcmVmZXJlbmNlIFRTQyBwYWdl
IGlzIHNoYXJlZCBiZXR3ZWVuIGFsbCB2Q1BVcywgYW5kIHRoZSBkYXRhIHN0
b3JlZCBpbgp0aGUgZG9tYWluIHN0cnVjdC4gIEhvd2V2ZXIgdGhlIGhhbmRs
ZXJzIHRvIHNldCBhbmQgY2xlYXIgaXQgYXJlIG5vdCBzYWZlCmFnYWluc3Qg
Y29uY3VycmVudCBhY2Nlc3Nlcy4gIEl0J3MgcG9zc2libGUgZm9yIHR3byAo
b3IgbW9yZSkgdkNQVXMgdG8gY2FsbApIVl9YNjRfTVNSX1JFRkVSRU5DRV9U
U0MgYXQgdGhlIHNhbWUgdGltZSBhbmQgY2F1c2UgdGhlIGluLXVzZSByZWZl
cmVuY2UKVFNDIHBhZ2UgdG8gYmUgZnJlZWQsIHdoaWxlIHN0aWxsIGJlaW5n
IG9uIHRoZSBwMm0uICBUaGlzIGNyZWF0ZXMgYW4KaW5mb3JtYXRpb24gbGVh
aywgd2hlcmUgdGhlIHBhZ2UgY2FuIGVuZCB1cCBtYXBwZWQgaW4gYW5vdGhl
ciBkb21haW4gd2hpbGUKc3RpbGwgYmVpbmcgcGFydCBvZiB0aGUgb3JpZ2lu
YWwgZG9tYWluIHAybS4KCkl0J3MgYWxzbyBwb3NzaWJsZSB0byB1bmRlcmZs
b3cgdGhlIHJlZmVyZW5jZSBjb3VudGVyLCBhcyBtdWx0aXBsZQpjb25jdXJy
ZW50IHdyaXRlcyB0byBIVl9YNjRfTVNSX1JFRkVSRU5DRV9UU0MgY2FuIGNy
ZWF0ZSBhbiBpbWJhbGFuY2Ugb24KdGhlIG51bWJlciBvZiBwdXRfcGFnZV9h
bmRfdHlwZSgpIGNhbGxzLgoKSW50cm9kdWNlIGEgbG9jayB0byBwcm90ZWN0
IHRoZSByZWZlcmVuY2UgVFNDIGRvbWFpbiBmaWVsZCwgdGh1cwpzZXJpYWxp
emluZyBjb25jdXJyZW50IHZDUFUgYWNjZXNzZXMuCgpUaGlzIGlzIENWRS0y
MDI1LTU4MTQzIC8gcGFydCBvZiBYU0EtNDcyLgoKRml4ZXM6IDM4NmIzMzY1
MjIxZCAoJ3ZpcmlkaWFuOiB1c2UgdmlyaWRpYW5fbWFwL3VubWFwX2d1ZXN0
X3BhZ2UoKSBmb3IgcmVmZXJlbmNlIHRzYyBwYWdlJykKU2lnbmVkLW9mZi1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0t
LQogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMgICAgICAgIHwg
NCArKysrCiB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMg
ICAgfCAyICsrCiB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL3Zpcmlk
aWFuLmggfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1l
LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYwppbmRleCBj
YTZkNTI2ZjQ2YjcuLjkzMTE4NThkNjNjMCAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2
L2h2bS92aXJpZGlhbi90aW1lLmMKQEAgLTEwOCw4ICsxMDgsMTAgQEAgc3Rh
dGljIHZvaWQgdGltZV9yZWZfY291bnRfdGhhdyhjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKQogCiAgICAgdHJjLT5vZmYgPSAoaW50NjRfdCl0cmMtPnZhbCAt
IHRyY192YWwoZCwgMCk7CiAKKyAgICBzcGluX2xvY2soJnZkLT5sb2NrKTsK
ICAgICBpZiAoIHZkLT5yZWZlcmVuY2VfdHNjLm1zci5lbmFibGVkICkKICAg
ICAgICAgdXBkYXRlX3JlZmVyZW5jZV90c2MoZCwgZmFsc2UpOworICAgIHNw
aW5fdW5sb2NrKCZ2ZC0+bG9jayk7CiB9CiAKIHN0YXRpYyB1aW50NjRfdCB0
aW1lX3JlZl9jb3VudChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQpAQCAtMzMx
LDYgKzMzMyw3IEBAIGludCB2aXJpZGlhbl90aW1lX3dybXNyKHN0cnVjdCB2
Y3B1ICp2LCB1aW50MzJfdCBpZHgsIHVpbnQ2NF90IHZhbCkKICAgICAgICAg
aWYgKCAhKHZpcmlkaWFuX2ZlYXR1cmVfbWFzayhkKSAmIEhWTVBWX3JlZmVy
ZW5jZV90c2MpICkKICAgICAgICAgICAgIHJldHVybiBYODZFTVVMX0VYQ0VQ
VElPTjsKIAorICAgICAgICBzcGluX2xvY2soJnZkLT5sb2NrKTsKICAgICAg
ICAgdmlyaWRpYW5fdW5tYXBfZ3Vlc3RfcGFnZSgmdmQtPnJlZmVyZW5jZV90
c2MpOwogICAgICAgICB2ZC0+cmVmZXJlbmNlX3RzYy5tc3IucmF3ID0gdmFs
OwogICAgICAgICB2aXJpZGlhbl9kdW1wX2d1ZXN0X3BhZ2UodiwgIlJFRkVS
RU5DRV9UU0MiLCAmdmQtPnJlZmVyZW5jZV90c2MpOwpAQCAtMzM5LDYgKzM0
Miw3IEBAIGludCB2aXJpZGlhbl90aW1lX3dybXNyKHN0cnVjdCB2Y3B1ICp2
LCB1aW50MzJfdCBpZHgsIHVpbnQ2NF90IHZhbCkKICAgICAgICAgICAgIHZp
cmlkaWFuX21hcF9ndWVzdF9wYWdlKGQsICZ2ZC0+cmVmZXJlbmNlX3RzYyk7
CiAgICAgICAgICAgICB1cGRhdGVfcmVmZXJlbmNlX3RzYyhkLCB0cnVlKTsK
ICAgICAgICAgfQorICAgICAgICBzcGluX3VubG9jaygmdmQtPmxvY2spOwog
ICAgICAgICBicmVhazsKIAogICAgIGNhc2UgSFZfWDY0X01TUl9USU1FX1JF
Rl9DT1VOVDoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRp
YW4vdmlyaWRpYW4uYyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmly
aWRpYW4uYwppbmRleCA3ZWE2YzkwMTY4OTQuLmMwYmUyNGJkMjIxMCAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYwpA
QCAtNDk0LDYgKzQ5NCw4IEBAIGludCB2aXJpZGlhbl9kb21haW5faW5pdChz
dHJ1Y3QgZG9tYWluICpkKQogICAgIGlmICggIWQtPmFyY2guaHZtLnZpcmlk
aWFuICkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKKyAgICBzcGluX2xv
Y2tfaW5pdCgmZC0+YXJjaC5odm0udmlyaWRpYW4tPmxvY2spOworCiAgICAg
cmMgPSB2aXJpZGlhbl9zeW5pY19kb21haW5faW5pdChkKTsKICAgICBpZiAo
IHJjICkKICAgICAgICAgZ290byBmYWlsOwpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2h2bS92aXJpZGlhbi5oIGIveGVuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2h2bS92aXJpZGlhbi5oCmluZGV4IDRjOGZmNmU4
MGI2Zi4uNDdjOWQxMzg0MWFjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
aW5jbHVkZS9hc20vaHZtL3ZpcmlkaWFuLmgKKysrIGIveGVuL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2h2bS92aXJpZGlhbi5oCkBAIC03MSw2ICs3MSw3IEBA
IHN0cnVjdCB2aXJpZGlhbl9kb21haW4KICAgICBERUNMQVJFX0JJVE1BUCho
eXBlcmNhbGxfZmxhZ3MsIF9IQ0FMTF9ucik7CiAgICAgc3RydWN0IHZpcmlk
aWFuX3RpbWVfcmVmX2NvdW50IHRpbWVfcmVmX2NvdW50OwogICAgIHN0cnVj
dCB2aXJpZGlhbl9wYWdlIHJlZmVyZW5jZV90c2M7CisgICAgc3BpbmxvY2tf
dCBsb2NrOwogfTsKIAogdm9pZCBjcHVpZF92aXJpZGlhbl9sZWF2ZXMoY29u
c3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IGxlYWYsCi0tIAoyLjQ5LjAK
Cg==

--=separator--

