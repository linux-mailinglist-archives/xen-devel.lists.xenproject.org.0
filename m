Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F7D2DAD38
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 13:29:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.53283.92947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9S2-00085P-IB; Tue, 15 Dec 2020 12:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 53283.92947; Tue, 15 Dec 2020 12:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp9S2-00084w-Ch; Tue, 15 Dec 2020 12:29:10 +0000
Received: by outflank-mailman (input) for mailman id 53283;
 Tue, 15 Dec 2020 12:29:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdgx=FT=xenbits.xen.org=gdunlap@srs-us1.protection.inumbo.net>)
 id 1kp9L4-0004t1-NO
 for xen-devel@lists.xen.org; Tue, 15 Dec 2020 12:21:58 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 279c1cd4-6af2-4629-b2e7-f45c24386efb;
 Tue, 15 Dec 2020 12:20:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JX-0005if-Il; Tue, 15 Dec 2020 12:20:23 +0000
Received: from gdunlap by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <gdunlap@xenbits.xen.org>)
 id 1kp9JX-00076t-Hu; Tue, 15 Dec 2020 12:20:23 +0000
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
X-Inumbo-ID: 279c1cd4-6af2-4629-b2e7-f45c24386efb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=5n8SeiIEVb8RcosU747UsxvMRIFOSkp4JJhpJmbwYlU=; b=drj5Pcpf1lbWB+dWDTvdLE2s2D
	N79UhxvEHl0QE2VDbdg7KzxNMd3YuqPG3QaH3lRhyjD3vw1uEjEtOK1V1TuNvjjtRwyW/z0KDzpr7
	9+cZ0qx9E7Dc7LNScz+53Ynh7KHXA2hKMlYvxJqKR4w60temtoTYWqHelYPEAnn6HZBA=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 350 v4 (CVE-2020-29569) - Use after free
 triggered by block frontend in Linux blkback
Message-Id: <E1kp9JX-00076t-Hu@xenbits.xenproject.org>
Date: Tue, 15 Dec 2020 12:20:23 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2020-29569 / XSA-350
                               version 4

      Use after free triggered by block frontend in Linux blkback

UPDATES IN VERSION 4
====================

Public release.

ISSUE DESCRIPTION
=================

The Linux kernel PV block backend expects the kernel thread handler
to reset ring->xenblkd to NULL when stopped. However, the handler may
not have time to run if the frontend quickly toggle between the states
connect and disconnect.

As a consequence, the block backend may re-use a pointer after it was
freed.

IMPACT
======

A misbehaving guest can trigger a dom0 crash by continuously
connecting / disconnecting a block frontend. Privileged escalation and
information leak cannot be ruled out.

VULNERABLE SYSTEMS
==================

Systems using Linux blkback are vulnerable.  This includes most
systems with a Linux dom0, or Linux driver domains.

Linux versions containing a24fa22ce22a ("xen/blkback: don't use
xen_blkif_get() in xen-blkback kthread"), or its backports, are
vulnerable.  This includes all current linux-stable branches back to
at least linux-stable/linux-4.4.y.

When the Xen PV block backend is provided by userspace (eg qemu), that
backend is not vulnerable.  So configurations where the xl.cfg domain
configuration file specifies all disks with backendtype="qdisk" are
not vulnerable.

The Linux blkback only supports raw format images, so when all disks
have a format than format="raw", the system is not vulnerable.

MITIGATION
==========

Switching the disk backend to qemu with backendtype="qdisk" will avoid
the vulnerability.  This mitigation is not always available, depending
on the other aspects of the configuration.

CREDITS
=======

This issue was discovered by Olivier Benjamin and Pawel Wieczorkiewicz of
Amazon.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa350-linux.patch     Linux

$ sha256sum xsa350*
46e8141bcfd21629043df0af4d237d6c264b27c1137fc84d4a1127ace30926c4  xsa350-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).


Deployment of the mitigation to change the block backend is NOT
permitted (except where all the affected systems and VMs are
administered and used only by organisations which are members of the
Xen Project Security Issues Predisclosure List).  Specifically,
deployment on public cloud systems is NOT permitted.

This is because this is a guest-visible change, which will indicate
that it is the block backend which has a vulnerability.

Deployment is permitted only AFTER the embargo ends.


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

iQE/BAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAl/Yqd8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZRusH9RGJFExFzCDQ/y99mvchhcIXGf4g0V373W9YrPAF
zUIiKBGEWuE07tY9YVKV5ocNnPQNdGwsnKJXPsFJAjW4DTDyL00e0yFUNQ7c1kTl
vdRgh0D5VtzIcaiqIC/4GjRzuBTQ3d9gTSOzJGhBS0yoIsZTSr5KyJBAiw1Slz7Y
IHmLZawGdQrDF6YpGLEXPRM7TxNNLn0wPqpPTxC+qMnTThdLuogf4HWLae7xHqX+
Q8b6KYxnkouq5sOddESglf+Gh+j9JHoLCIRm3XA4LrtGtQoUrvdqeS8rklRPH7Xk
yGP99M+J++KMx02ZJJUNrJmtSExDl35liz84qRiRfcKpxQ==
=qnB/
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa350-linux.patch"
Content-Disposition: attachment; filename="xsa350-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogQXV0aG9yIFJlZGFjdGVkIDxzZWN1cml0eUB4ZW4ub3JnPgpTdWJq
ZWN0OiBbUEFUQ0hdIHhlbi1ibGtiYWNrOiBzZXQgcmluZy0+eGVuYmxrZCB0
byBOVUxMIGFmdGVyIGt0aHJlYWRfc3RvcCgpCgpXaGVuIHhlbl9ibGtpZl9k
aXNjb25uZWN0KCkgaXMgY2FsbGVkLCB0aGUga2VybmVsIHRocmVhZCBiZWhp
bmQgdGhlCmJsb2NrIGludGVyZmFjZSBpcyBzdG9wcGVkIGJ5IGNhbGxpbmcg
a3RocmVhZF9zdG9wKHJpbmctPnhlbmJsa2QpLgpUaGUgcmluZy0+eGVuYmxr
ZCB0aHJlYWQgcG9pbnRlciBiZWluZyBub24tTlVMTCBkZXRlcm1pbmVzIGlm
IHRoZQp0aHJlYWQgaGFzIGJlZW4gYWxyZWFkeSBzdG9wcGVkLgpOb3JtYWxs
eSwgdGhlIHRocmVhZCdzIGZ1bmN0aW9uIHhlbl9ibGtpZl9zY2hlZHVsZSgp
IHNldHMgdGhlCnJpbmctPnhlbmJsa2QgdG8gTlVMTCwgd2hlbiB0aGUgdGhy
ZWFkJ3MgbWFpbiBsb29wIGVuZHMuCgpIb3dldmVyLCB3aGVuIHRoZSB0aHJl
YWQgaGFzIG5vdCBiZWVuIHN0YXJ0ZWQgeWV0IChpLmUuCndha2VfdXBfcHJv
Y2VzcygpIGhhcyBub3QgYmVlbiBjYWxsZWQgb24gaXQpLCB0aGUgeGVuX2Js
a2lmX3NjaGVkdWxlKCkKZnVuY3Rpb24gd291bGQgbm90IGJlIGNhbGxlZCB5
ZXQuCgpJbiBzdWNoIGNhc2UgdGhlIGt0aHJlYWRfc3RvcCgpIGNhbGwgcmV0
dXJucyAtRUlOVFIgYW5kIHRoZQpyaW5nLT54ZW5ibGtkIHJlbWFpbnMgZGFu
Z2xpbmcuCldoZW4gdGhpcyBoYXBwZW5zLCBhbnkgY29uc2VjdXRpdmUgY2Fs
bCB0byB4ZW5fYmxraWZfZGlzY29ubmVjdCAoZm9yCmV4YW1wbGUgaW4gZnJv
bnRlbmRfY2hhbmdlZCgpIGNhbGxiYWNrKSBsZWFkcyB0byBhIGtlcm5lbCBj
cmFzaCBpbgprdGhyZWFkX3N0b3AoKSAoZS5nLiBOVUxMIHBvaW50ZXIgZGVy
ZWZlcmVuY2UgaW4gZXhpdF9jcmVkcygpKS4KClRoaXMgaXMgWFNBLTM1MC4K
ClJlcG9ydGVkLWJ5OiBPbGl2aWVyIEJlbmphbWluIDxvbGliZW5AYW1hem9u
LmNvbT4KUmVwb3J0ZWQtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBh
d2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtp
ZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgpGaXhlczogYTI0ZmEyMmNlMjJh
ICgieGVuL2Jsa2JhY2s6IGRvbid0IHVzZSB4ZW5fYmxraWZfZ2V0KCkgaW4g
eGVuLWJsa2JhY2sga3RocmVhZCIpClNpZ25lZC1vZmYtYnk6IEF1dGhvciBS
ZWRhY3RlZCA8c2VjdXJpdHlAeGVuLm9yZz4KUmV2aWV3ZWQtYnk6IEp1bGll
biBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay94ZW5idXMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94
ZW4tYmxrYmFjay94ZW5idXMuYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Jh
Y2sveGVuYnVzLmMKaW5kZXggZjU3MDU1NjllMmE3Li5mN2I5YjFmMzg5ZmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVz
LmMKKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwpA
QCAtMjc1LDYgKzI3NSw3IEBAIHN0YXRpYyBpbnQgeGVuX2Jsa2lmX2Rpc2Nv
bm5lY3Qoc3RydWN0IHhlbl9ibGtpZiAqYmxraWYpCiAKIAkJaWYgKHJpbmct
PnhlbmJsa2QpIHsKIAkJCWt0aHJlYWRfc3RvcChyaW5nLT54ZW5ibGtkKTsK
KwkJCXJpbmctPnhlbmJsa2QgPSBOVUxMOwogCQkJd2FrZV91cCgmcmluZy0+
c2h1dGRvd25fd3EpOwogCQl9CiAKLS0gCjIuMTcuMQoK

--=separator--

