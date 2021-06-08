Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96039FD0F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 19:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138612.256559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqf9i-0000K6-Dl; Tue, 08 Jun 2021 17:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138612.256559; Tue, 08 Jun 2021 17:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqf9i-0000H2-9F; Tue, 08 Jun 2021 17:04:46 +0000
Received: by outflank-mailman (input) for mailman id 138612;
 Tue, 08 Jun 2021 17:04:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CbVg=LC=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lqf9h-0007tO-D5
 for xen-devel@lists.xen.org; Tue, 08 Jun 2021 17:04:45 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd84a956-bc60-4155-82fb-83c1a5a14b45;
 Tue, 08 Jun 2021 17:04:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lqf9S-0004ge-29; Tue, 08 Jun 2021 17:04:30 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lqf9S-0004tH-13; Tue, 08 Jun 2021 17:04:30 +0000
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
X-Inumbo-ID: fd84a956-bc60-4155-82fb-83c1a5a14b45
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=Ii1NiQUN0sqcBtUpODfucz8MN9ngRgodsEM4sMsoxgo=; b=AYW4NCBzwch4WTdQyjRQjS5biA
	z3hiKC/BTFd1NDPrmKwEWP5GhyrkCATB8fpZ3GqoJvGjKbVT2xqaVKWkjxtIsMu564xCH8M/dGOs4
	V75qrgF2D+/cQm80M1ByYNpW2bwHE5dnPbpOnv00MmiND5r5QE4e9zXuo/4W7/0Kpf8M=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 374 v2 (CVE-2021-28691) - Guest triggered
 use-after-free in Linux xen-netback
Message-Id: <E1lqf9S-0004tH-13@xenbits.xenproject.org>
Date: Tue, 08 Jun 2021 17:04:30 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-28691 / XSA-374
                               version 2

          Guest triggered use-after-free in Linux xen-netback

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

A malicious or buggy network PV frontend can force Linux netback to
disable the interface and terminate the receive kernel thread
associated with queue 0 in response to the frontend sending a
malformed packet.

Such kernel thread termination will lead to a use-after-free in Linux
netback when the backend is destroyed, as the kernel thread associated
with queue 0 will have already exited and thus the call to
kthread_stop will be performed against a stale pointer.

IMPACT
======

A malicious or buggy frontend driver can trigger a dom0 crash.
Privilege escalation and information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Systems using Linux version 5.5 or newer are vulnerable.

MITIGATION
==========

On x86 running only HVM guests with emulated network cards will avoid the
issue.  There's however no option in the upstream toolstack to offer only
emulated network cards to guests.

CREDITS
=======

This issue was discovered by Michael Brown of iPXE and diagnosed by
Olivier Benjamin, Michael Kurth and Martin Mazein of AWS.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa374-linux.patch     Linux 5.5.0 - 5.12.2

$ sha256sum xsa374*
156cee65022359a5901cce97714d2abb16fef786246b1c4bf509083d21e085d6  xsa374-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Deployment of the mitigation to disable PV network interfaces is NOT
permitted (except where all the affected systems and VMs are
administered and used only by organisations which are members of the
Xen Project Security Issues Predisclosure List).  Specifically,
deployment on public cloud systems is NOT permitted.

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
b3JnAAoJEIP+FMlX6CvZigoIAKNYimzTYl6VQYaqgwMdNzqXCF/PdlQF/tf8PSwm
5VP0ZPbLq6Zn4HOgMBtBzs/GCFtrIWsQGnZji611dkaAh21N1YErXW5jFYMnf1DI
rruCXE1GuL5B4sFvWw7CnMXax6vYe0q5KPoGmyZRV77aT5T+gNMONlGl6raw7/Ne
UAtAv4JDSR5Nc53X0HNK7tNU9tdr4VaLqEKWs+C0W+azOFNGvrTeNDVjBiLqDZbA
st62i3PIFTXu+XzbjZNdM/RMpVVxFSkfdWn53RDVJ2JaFBMxrcVs75aVo3Nfr34Z
Iho+eTPDywP9+4zl/FoModMYHg4rTMHf+jmbi3M/aCOal2U=
=1Dhy
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa374-linux.patch"
Content-Disposition: attachment; filename="xsa374-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
U3ViamVjdDogeGVuLW5ldGJhY2s6IHRha2UgYSByZWZlcmVuY2UgdG8gdGhl
IFJYIHRhc2sgdGhyZWFkCgpEbyB0aGlzIGluIG9yZGVyIHRvIHByZXZlbnQg
dGhlIHRhc2sgZnJvbSBiZWluZyBmcmVlZCBpZiB0aGUgdGhyZWFkCnJldHVy
bnMgKHdoaWNoIGNhbiBiZSB0cmlnZ2VyZWQgYnkgdGhlIGZyb250ZW5kKSBi
ZWZvcmUgdGhlIGNhbGwgdG8Ka3RocmVhZF9zdG9wIGRvbmUgYXMgcGFydCBv
ZiB0aGUgYmFja2VuZCB0ZWFyIGRvd24uIE5vdCB0YWtpbmcgdGhlCnJlZmVy
ZW5jZSB3aWxsIGxlYWQgdG8gYSB1c2UtYWZ0ZXItZnJlZSBpbiB0aGF0IHNj
ZW5hcmlvLiBTdWNoCnJlZmVyZW5jZSB3YXMgdGFrZW4gYmVmb3JlIGJ1dCBk
cm9wcGVkIGFzIHBhcnQgb2YgdGhlIHJld29yayBkb25lIGluCjJhYzA2MWNl
OTdmNC4KClJlaW50cm9kdWNlIHRoZSByZWZlcmVuY2UgdGFraW5nIGFuZCBh
ZGQgYSBjb21tZW50IHRoaXMgdGltZQpleHBsYWluaW5nIHdoeSBpdCdzIG5l
ZWRlZC4KClRoaXMgaXMgWFNBLTM3NCAvIENWRS0yMDIxLTI4NjkxLgoKUmVw
b3J0ZWQtYnk6IE1pY2hhZWwgQnJvd24gPG1jYjMwQGlweGUub3JnPgpGaXhl
czogMmFjMDYxY2U5N2Y0ICgneGVuL25ldGJhY2s6IGNsZWFudXAgaW5pdCBh
bmQgZGVpbml0IGNvZGUnKQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9pbnRlcmZhY2UuYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVy
ZmFjZS5jCmluZGV4IDE5M2I3MjNmZTNiZC4uYzU4OTk2YzFlMjMwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwor
KysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwpAQCAt
Njg0LDYgKzY4NCw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl9kaXNjb25uZWN0
X3F1ZXVlKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlKQogewogCWlmIChx
dWV1ZS0+dGFzaykgewogCQlrdGhyZWFkX3N0b3AocXVldWUtPnRhc2spOwor
CQlwdXRfdGFza19zdHJ1Y3QocXVldWUtPnRhc2spOwogCQlxdWV1ZS0+dGFz
ayA9IE5VTEw7CiAJfQogCkBAIC03NDUsNiArNzQ2LDExIEBAIGludCB4ZW52
aWZfY29ubmVjdF9kYXRhKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAog
CWlmIChJU19FUlIodGFzaykpCiAJCWdvdG8ga3RocmVhZF9lcnI7CiAJcXVl
dWUtPnRhc2sgPSB0YXNrOworCS8qCisJICogVGFrZSBhIHJlZmVyZW5jZSB0
byB0aGUgdGFzayBpbiBvcmRlciB0byBwcmV2ZW50IGl0IGZyb20gYmVpbmcg
ZnJlZWQKKwkgKiBpZiB0aGUgdGhyZWFkIGZ1bmN0aW9uIHJldHVybnMgYmVm
b3JlIGt0aHJlYWRfc3RvcCBpcyBjYWxsZWQuCisJICovCisJZ2V0X3Rhc2tf
c3RydWN0KHRhc2spOwogCiAJdGFzayA9IGt0aHJlYWRfcnVuKHhlbnZpZl9k
ZWFsbG9jX2t0aHJlYWQsIHF1ZXVlLAogCQkJICAgIiVzLWRlYWxsb2MiLCBx
dWV1ZS0+bmFtZSk7Cg==

--=separator--

