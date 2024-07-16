Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC6932613
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 14:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759476.1169182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTgrA-0004Pt-Lw; Tue, 16 Jul 2024 12:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759476.1169182; Tue, 16 Jul 2024 12:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTgrA-0004NO-J9; Tue, 16 Jul 2024 12:00:32 +0000
Received: by outflank-mailman (input) for mailman id 759476;
 Tue, 16 Jul 2024 12:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P7YT=OQ=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1sTgr9-0004LV-OS
 for xen-devel@lists.xen.org; Tue, 16 Jul 2024 12:00:31 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf4dd84-436a-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 14:00:27 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1sTgqz-0004pQ-Fp; Tue, 16 Jul 2024 12:00:21 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1sTgqz-0008JB-EB; Tue, 16 Jul 2024 12:00:21 +0000
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
X-Inumbo-ID: fcf4dd84-436a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=jBqT5J8VwiTbmzsqgceP4IWvsu1bh07Z7+ZRyPwcv04=; b=vqTyEUoXboHjsbz3rgWsn6oexc
	ETcbzOg0pzznRPuXcqWNomY2rCqoyuc3JdRiupp+3NpMdOF6SseUaEKTPwFrahalzcZ0O03+wz+Q1
	y0qICRtQWfkKF++qIsBvnQoHFRCLHqYMxa5yT09GWd7LSGTjPBGqEiNQ5hkwEtb8On/0=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 458 v2 (CVE-2024-31143) - double unlock in
 x86 guest IRQ handling
Message-Id: <E1sTgqz-0008JB-EB@xenbits.xenproject.org>
Date: Tue, 16 Jul 2024 12:00:21 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2024-31143 / XSA-458
                               version 2

                double unlock in x86 guest IRQ handling

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

An optional feature of PCI MSI called "Multiple Message" allows a
device to use multiple consecutive interrupt vectors.  Unlike for MSI-X,
the setting up of these consecutive vectors needs to happen all in one
go.  In this handling an error path could be taken in different
situations, with or without a particular lock held.  This error path
wrongly releases the lock even when it is not currently held.

IMPACT
======

Denial of Service (DoS) affecting the entire host, crashes, information
leaks, or elevation of privilege all cannot be ruled out.

VULNERABLE SYSTEMS
==================

Xen versions 4.4 and newer are vulnerable.  Xen versions 4.3 and older
are not vulnerable.

Only x86 guest which have a multi-vector MSI capable device passed
through to them can leverage the vulnerability.

MITIGATION
==========

Not passing through multi-vector MSI capable devices to x86 guests will
avoid the vulnerability.

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

xsa458.patch           xen-unstable - Xen 4.16.x

$ sha256sum xsa458*
22dd1071755b1fd6b4ea3ce18a200f626ee796e77b7e7d93a3a5b33d2a896706  xsa458.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patch described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

HOWEVER, deployment of the mitigation is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because removing/replacing of pass-through devices or their
replacement by emulated devices is a guest visible configuration
change, which may lead to re-discovery of the issue.

Deployment of this mitigation is permitted only AFTER the embargo ends.

AND: Distribution of updated software is prohibited (except to other
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmaWYKoMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZKLgH/1uXqtha34XUX2xCayPYMss6yIwXDuugw4Z/F8Ap
tb+p65idTw5s2X0BXLpCcvhBZNY151DQXi0BZhTMewO8+JxrdjKPLthNSkGtF+/W
issUCQ9cuSj84n7n5AeMq1WDqVBYMnqNlgrsv9oiKAQ5g+9Rf8Mpu7RG1NrNcTCs
CfeDgMTOQcBuYG2xW2+46SXHVXKLA28uq6w4nIns4JpPF63DUJQKDDdypky1CSf1
9Z81Axi3cpk3NPvTw7TW2csO1C04XBVJvVVHJtUF1FVUhe0NboQy/zbh2te3QdJ8
KPXsQ55p0AZm3x8K2qM+Lsm1DqYhG5/ORMGC/+bXWc2H/nU=
=ZqmX
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa458.patch"
Content-Disposition: attachment; filename="xsa458.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvSVJROiBhdm9pZCBkb3VibGUgdW5sb2NrIGluIG1hcF9kb21haW5f
cGlycSgpCgpGb3JldmVyIHNpbmNlIGl0cyBpbnRyb2R1Y3Rpb24gdGhlIG1h
aW4gbG9vcCBpbiB0aGUgZnVuY3Rpb24gZGVhbGluZwp3aXRoIG11bHRpLXZl
Y3RvciBNU0kgaGFkIGVycm9yIGV4aXQgcG9pbnRzICgiYnJlYWsiKSB3aXRo
IGRpZmZlcmVudApwcm9wZXJ0aWVzOiBJbiBvbmUgY2FzZSBubyBJUlEgZGVz
Y3JpcHRvciBsb2NrIGlzIGJlaW5nIGhlbGQuCk5ldmVydGhlbGVzcyB0aGUg
c3Vic2VxdWVudCBlcnJvciBjbGVhbnVwIHBhdGggYXNzdW1lZCBzdWNoIGEg
bG9jayB3b3VsZAp1bmlmb3JtbHkgbmVlZCByZWxlYXNpbmcuIElkZW50aWZ5
IHRoZSBjYXNlIGJ5IHNldHRpbmcgImRlc2MiIHRvIE5VTEwsCnRodXMgYWxs
b3dpbmcgdGhlIHVubG9jayB0byBiZSBza2lwcGVkIGFzIG5lY2Vzc2FyeS4K
ClRoaXMgaXMgQ1ZFLTIwMjQtMzExNDMgLyBYU0EtNDU4LgoKQ292ZXJpdHkg
SUQ6IDE2MDUyOTgKRml4ZXM6IGQxYjZkMGEwMjQ4OSAoIng4NjogZW5hYmxl
IG11bHRpLXZlY3RvciBNU0kiKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9pcnEuYworKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTIyNzMs
NiArMjI3Myw3IEBAIGludCBtYXBfZG9tYWluX3BpcnEoCiAKICAgICAgICAg
ICAgIHNldF9kb21haW5faXJxX3BpcnEoZCwgaXJxLCBpbmZvKTsKICAgICAg
ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRlc2MtPmxvY2ssIGZs
YWdzKTsKKyAgICAgICAgICAgIGRlc2MgPSBOVUxMOwogCiAgICAgICAgICAg
ICBpbmZvID0gTlVMTDsKICAgICAgICAgICAgIGlycSA9IGNyZWF0ZV9pcnEo
TlVNQV9OT19OT0RFLCB0cnVlKTsKQEAgLTIzMDgsNyArMjMwOSw5IEBAIGlu
dCBtYXBfZG9tYWluX3BpcnEoCiAKICAgICAgICAgaWYgKCByZXQgKQogICAg
ICAgICB7Ci0gICAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZk
ZXNjLT5sb2NrLCBmbGFncyk7CisgICAgICAgICAgICBpZiAoIGRlc2MgKQor
ICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRlc2Mt
PmxvY2ssIGZsYWdzKTsKKwogICAgICAgICAgICAgcGNpX2Rpc2FibGVfbXNp
KG1zaV9kZXNjKTsKICAgICAgICAgICAgIGlmICggbnIgKQogICAgICAgICAg
ICAgewo=

--=separator--

