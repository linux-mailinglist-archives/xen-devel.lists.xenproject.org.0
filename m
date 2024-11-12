Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C139C574E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 13:06:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834422.1250079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tApem-0001JG-9q; Tue, 12 Nov 2024 12:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834422.1250079; Tue, 12 Nov 2024 12:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tApem-0001Hb-5p; Tue, 12 Nov 2024 12:06:04 +0000
Received: by outflank-mailman (input) for mailman id 834422;
 Tue, 12 Nov 2024 12:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3GC9=SH=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1tApek-0000xb-32
 for xen-devel@lists.xen.org; Tue, 12 Nov 2024 12:06:02 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75de791e-a0ee-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 13:05:52 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1tApeV-001dw3-1W;
 Tue, 12 Nov 2024 12:05:47 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1tApeV-001S2c-2H;
 Tue, 12 Nov 2024 12:05:47 +0000
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
X-Inumbo-ID: 75de791e-a0ee-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEwNC4xMzAuMjE1LjM3IiwiaGVsbyI6Im1haWwueGVucHJvamVjdC5vcmcifQ==
X-Custom-Transaction: eyJpZCI6Ijc1ZGU3OTFlLWEwZWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDEzMTU1LjkyMzQ4MSwic2VuZGVyIjoiYW5kcmV3Y29vcEB4ZW5iaXRzLnhlbi5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZyJ9
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 464 v2 (CVE-2024-45819) - libxl leaks data
 to PVH guests via ACPI tables
Message-Id: <E1tApeV-001S2c-2H@xenbits.xenproject.org>
Date: Tue, 12 Nov 2024 12:05:47 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2024-45819 / XSA-464
                               version 2

            libxl leaks data to PVH guests via ACPI tables

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

PVH guests have their ACPI tables constructed by the toolstack.  The
construction involves building the tables in local memory, which are
then copied into guest memory.  While actually used parts of the local
memory are filled in correctly, excess space that is being allocated is
left with its prior contents.

IMPACT
======

An unprivileged guest may be able to access sensitive information
pertaining to the host, control domain, or other guests.

VULNERABLE SYSTEMS
==================

Xen versions 4.8 and onwards are vulnerable.  Xen 4.7 and older are not
vulnerable.

Only x86 systems running PVH guests are vulnerable.  Architectures other
than x86 are not vulnerable.

Only PVH guests can leverage the vulnerability.  HVM and PV guests
cannot leverage the vulnerability.  Note that PV guests when run inside
the (PVH) shim can't leverage the vulnerability.

MITIGATION
==========

Running only PV or HVM guests will avoid this vulnerability.

CREDITS
=======

This issue was discovered by Jason Andryuk of AMD.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa464.patch           xen-unstable - Xen 4.16.x

$ sha256sum xsa464*
16bca39d6136141e030276f588f1e77f634fce8301b42fb0848ddf2b611d835a  xsa464.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmczRE4MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZTG8H+wV+jRjwQcgPa2OQBuedO8V0Lpu1DqQnANU//oZK
4p5ntCeMJ9MnMlWGZhdOAwSQNgwYf17G2DezNK0XvRacfvB0/pUTH94EmKmyRkVl
vGgs302HkNb0Il84JN/HA9TtK5+g2kSa5J5prV9tu+nGvRZ1zZPnBEFohXvXdjr7
/KGSrbHbi5+6DdBZmmEUu65PLvQAochHvQLEHpoRp0MCVE8g0FQPFikmST39TLpJ
6SFfVZjdmYfOUN1BYcH6AYCuCXZfbUOlqm9y1Z2EX6N0chQXsBDbOFx7/0ey23fw
Wy9l49G//xaTR4X4uXTRiiXC7qxpclD0VKGlHKz1AUyUw6c=
=lRfn
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa464.patch"
Content-Disposition: attachment; filename="xsa464.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFzb24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPgpT
dWJqZWN0OiBsaWJ4bDogVXNlIHplcm8tZWQgbWVtb3J5IGZvciBQVkggYWNw
aSB0YWJsZXMKCnhsL2xpYnhsIG1lbW9yeSBpcyBsZWFraW5nIGludG8gYSBQ
VkggZ3Vlc3QgdGhyb3VnaCB1bmluaXRpYWxpemVkCnBvcnRpb25zIG9mIHRo
ZSBBQ1BJIHRhYmxlcy4KClVzZSBsaWJ4bF96YWxsb2MoKSB0byBvYnRhaW4g
emVyby1lZCBtZW1vcnkgdG8gYXZvaWQgdGhpcyBpc3N1ZS4KClRoaXMgaXMg
WFNBLTQ2NCAvIENWRS0yMDI0LTQ1ODE5LgoKU2lnbmVkLW9mZi1ieTogSmFz
b24gQW5kcnl1ayA8amFzb24uYW5kcnl1a0BhbWQuY29tPgpGaXhlczogMTRj
MGQzMjhkYTJiICgibGlieGwvYWNwaTogQnVpbGQgQUNQSSB0YWJsZXMgZm9y
IEhWTWxpdGUgZ3Vlc3RzIikKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGli
eGxfeDg2X2FjcGkuYworKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3g4
Nl9hY3BpLmMKQEAgLTE3NiwxMCArMTc2LDExIEBAIGludCBsaWJ4bF9fZG9t
X2xvYWRfYWNwaShsaWJ4bF9fZ2MgKmdjLAogICAgICAgICBnb3RvIG91dDsK
ICAgICB9CiAKLSAgICBjb25maWcucnNkcCA9ICh1bnNpZ25lZCBsb25nKWxp
YnhsX19tYWxsb2MoZ2MsIGxpYnhsX2N0eHQucGFnZV9zaXplKTsKLSAgICBj
b25maWcuaW5mb3AgPSAodW5zaWduZWQgbG9uZylsaWJ4bF9fbWFsbG9jKGdj
LCBsaWJ4bF9jdHh0LnBhZ2Vfc2l6ZSk7CisgICAgLyogVGhlc2UgYXJlIGFs
bCBjb3BpZWQgaW50byBndWVzdCBtZW1vcnksIHNvIHVzZSB6ZXJvLWVkIG1l
bW9yeS4gKi8KKyAgICBjb25maWcucnNkcCA9ICh1bnNpZ25lZCBsb25nKWxp
YnhsX196YWxsb2MoZ2MsIGxpYnhsX2N0eHQucGFnZV9zaXplKTsKKyAgICBj
b25maWcuaW5mb3AgPSAodW5zaWduZWQgbG9uZylsaWJ4bF9femFsbG9jKGdj
LCBsaWJ4bF9jdHh0LnBhZ2Vfc2l6ZSk7CiAgICAgLyogUGFnZXMgdG8gaG9s
ZCBBQ1BJIHRhYmxlcyAqLwotICAgIGxpYnhsX2N0eHQuYnVmID0gbGlieGxf
X21hbGxvYyhnYywgTlVNX0FDUElfUEFHRVMgKgorICAgIGxpYnhsX2N0eHQu
YnVmID0gbGlieGxfX3phbGxvYyhnYywgTlVNX0FDUElfUEFHRVMgKgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9jdHh0LnBh
Z2Vfc2l6ZSk7CiAKICAgICAvKgo=

--=separator--

