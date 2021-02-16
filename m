Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657F31CA94
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 13:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85529.160397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBza1-00022W-BD; Tue, 16 Feb 2021 12:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85529.160397; Tue, 16 Feb 2021 12:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBza1-000221-7w; Tue, 16 Feb 2021 12:35:49 +0000
Received: by outflank-mailman (input) for mailman id 85529;
 Tue, 16 Feb 2021 12:35:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y7oK=HS=xenbits.xen.org=iwj@srs-us1.protection.inumbo.net>)
 id 1lBza0-0001zb-4Z
 for xen-devel@lists.xen.org; Tue, 16 Feb 2021 12:35:48 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7cbe405-2f49-4d8d-b1e0-17b00f36c61f;
 Tue, 16 Feb 2021 12:35:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZk-0008NO-5U; Tue, 16 Feb 2021 12:35:32 +0000
Received: from iwj by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <iwj@xenbits.xen.org>)
 id 1lBzZk-0002dG-4W; Tue, 16 Feb 2021 12:35:32 +0000
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
X-Inumbo-ID: e7cbe405-2f49-4d8d-b1e0-17b00f36c61f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=6tV55iGlOj7+xKBOO1uuq23eO+x9bBJGrqnaJXGM2+U=; b=roUx5Vw3x3kv1tIxON22i8ODSL
	MsKzPjCaj+6V9eQ8nrLYY4nOCpHM789U9I2GXZR4Pzx3QDB99QDFDwUCtg1m0/ShnLcSmp+Douwsi
	zEYJDCmJqNDdvdWN5BUUOGSds7M2oo9OFj+OwoRAzEyJ7NYSvexCbsO6z6mKFGcGXsTs=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 365 v3 (CVE-2021-26930) - Linux: error
 handling issues in blkback's grant mapping
Message-Id: <E1lBzZk-0002dG-4W@xenbits.xenproject.org>
Date: Tue, 16 Feb 2021 12:35:32 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2021-26930 / XSA-365
                               version 3

        Linux: error handling issues in blkback's grant mapping

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

To service requests, the driver maps grant references provided by the
frontend.  In this process, errors may be encountered.  In one case an
error encountered earlier might be discarded by later processing,
resulting in the caller assuming successful mapping, and hence
subsequent operations trying to access space that wasn't mapped.  In
another case internal state would be insufficiently updated, preventing
safe recovery from the error.

IMPACT
======

A malicious or buggy frontend driver may be able to crash the
corresponding backend driver, potentially affecting the entire domain
running the backend driver.  In configurations without driver domains
or similar disaggregation, that is a host-wide denial of sevice.

Privilege escalation and information leaks cannot be ruled out.

VULNERABLE SYSTEMS
==================

Linux versions from at least 3.11 onwards are vulnerable.

MITIGATION
==========

Reconfiguring guests to use alternative (e.g. qemu-based) backends may
avoid the vulnerability.

CREDITS
=======

This issue was discovered by Olivier Benjamin, Norbert Manthey, Martin
Mazein, and Jan H. Schönherr, all from Amazon.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa365-linux.patch           Linux 5.11-rc - 5.10

$ sha256sum xsa365*
7e45fcf3c70eb40debe9997a1773de7c4a2edcde5c23f76aeb5c1b6e3a34a654  xsa365-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on
public-facing systems with untrusted guest users and administrators.

HOWEVER, deployment of the non-kernel-based backends mitigation
described above is NOT permitted during the embargo on public-facing
systems with untrusted guest users and administrators.  This is because
such a configuration change may be recognizable by the affected guests.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmAru/UMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZnpQH/jMHOQao08C5s4VlCUIDJTJ8AZXIjFKW2zOKBqt5
Gp7HiRZSLKa2s/dqxIdiVHTnMzGyFegfzK0AeLjLeftSbOANSvI9tx/S6ajOr6Mx
s5j0r2JzCBsh1bULJbRV7MBVaRqyOR77i3sREu7o0uuRxMd0RNnck7rVm0slmG1P
FoFfC2tF+gxnYZi8tpBS4aY/e3tZ4y+J6s0Fgyfln4p33/j1JwILzzYscGnRdDvG
31DnotOq3E+TqcTZRK4BrLJqZodZLsd9en1DriJj2dDqrobs6QS4sZkHKX20gcxC
RnGvkdHXI+u/du6qpb3GHep2F5pg5+2vMzBNvxxBjr8vmi4=
=HBCB
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa365-linux.patch"
Content-Disposition: attachment; filename="xsa365-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4tYmxrYmFjazogZml4IGVycm9yIGhhbmRsaW5nIGluIHhlbl9ibGti
a19tYXAoKQoKVGhlIGZ1bmN0aW9uIHVzZXMgYSBnb3RvLWJhc2VkIGxvb3As
IHdoaWNoIG1heSBsZWFkIHRvIGFuIGVhcmxpZXIgZXJyb3IKZ2V0dGluZyBk
aXNjYXJkZWQgYnkgYSBsYXRlciBpdGVyYXRpb24uIEV4aXQgdGhpcyBhZC1o
b2MgbG9vcCB3aGVuIGFuCmVycm9yIHdhcyBlbmNvdW50ZXJlZC4KClRoZSBv
dXQtb2YtbWVtb3J5IGVycm9yIHBhdGggYWRkaXRpb25hbGx5IGZhaWxzIHRv
IGZpbGwgYSBzdHJ1Y3R1cmUKZmllbGQgbG9va2VkIGF0IGJ5IHhlbl9ibGti
a191bm1hcF9wcmVwYXJlKCkgYmVmb3JlIGluc3BlY3RpbmcgdGhlCmhhbmRs
ZSB3aGljaCBkb2VzIGdldCBwcm9wZXJseSBzZXQgKHRvIEJMS0JBQ0tfSU5W
QUxJRF9IQU5ETEUpLgoKU2luY2UgdGhlIGVhcmxpZXIgZXhpdGluZyBmcm9t
IHRoZSBhZC1ob2MgbG9vcCByZXF1aXJlcyB0aGUgc2FtZSBmaWVsZApmaWxs
aW5nIChpbnZhbGlkYXRpb24pIGFzIHRoYXQgb24gdGhlIG91dC1vZi1tZW1v
cnkgcGF0aCwgZm9sZCBib3RoCnBhdGhzLiBXaGlsZSBkb2luZyBzbywgZHJv
cCB0aGUgcHJfYWxlcnQoKSwgYXMgZXh0cmEgbG9nIG1lc3NhZ2VzIGFyZW4n
dApnb2luZyB0byBoZWxwIHRoZSBzaXR1YXRpb24gKHRoZSBrZXJuZWwgd2ls
bCBsb2cgb29tIGNvbmRpdGlvbnMgYWxyZWFkeQphbnl3YXkpLgoKVGhpcyBp
cyBYU0EtMzY1LgoKUmVwb3J0ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJl
bEBhbWF6b24uZGU+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+Ci0tLQp2MjogQXZvaWQgb3ZlcndyaXRpbmcgdmFsaWQg
LT5wZXJzaXN0ZW50X2dudCBmaWVsZHMuCgotLS0gYS9kcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL2Jsa2JhY2suYworKysgYi9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtiYWNrL2Jsa2JhY2suYwpAQCAtNzk0LDggKzc5NCwxMyBAQCBhZ2Fp
bjoKIAkJCXBhZ2VzW2ldLT5wZXJzaXN0ZW50X2dudCA9IHBlcnNpc3RlbnRf
Z250OwogCQl9IGVsc2UgewogCQkJaWYgKGdudHRhYl9wYWdlX2NhY2hlX2dl
dCgmcmluZy0+ZnJlZV9wYWdlcywKLQkJCQkJCSAgJnBhZ2VzW2ldLT5wYWdl
KSkKLQkJCQlnb3RvIG91dF9vZl9tZW1vcnk7CisJCQkJCQkgICZwYWdlc1tp
XS0+cGFnZSkpIHsKKwkJCQlnbnR0YWJfcGFnZV9jYWNoZV9wdXQoJnJpbmct
PmZyZWVfcGFnZXMsCisJCQkJCQkgICAgICBwYWdlc190b19nbnQsCisJCQkJ
CQkgICAgICBzZWdzX3RvX21hcCk7CisJCQkJcmV0ID0gLUVOT01FTTsKKwkJ
CQlnb3RvIG91dDsKKwkJCX0KIAkJCWFkZHIgPSB2YWRkcihwYWdlc1tpXS0+
cGFnZSk7CiAJCQlwYWdlc190b19nbnRbc2Vnc190b19tYXBdID0gcGFnZXNb
aV0tPnBhZ2U7CiAJCQlwYWdlc1tpXS0+cGVyc2lzdGVudF9nbnQgPSBOVUxM
OwpAQCAtODgwLDE3ICs4ODUsMTggQEAgbmV4dDoKIAl9CiAJc2Vnc190b19t
YXAgPSAwOwogCWxhc3RfbWFwID0gbWFwX3VudGlsOwotCWlmIChtYXBfdW50
aWwgIT0gbnVtKQorCWlmICghcmV0ICYmIG1hcF91bnRpbCAhPSBudW0pCiAJ
CWdvdG8gYWdhaW47CiAKLQlyZXR1cm4gcmV0OwotCi1vdXRfb2ZfbWVtb3J5
OgotCXByX2FsZXJ0KCIlczogb3V0IG9mIG1lbW9yeVxuIiwgX19mdW5jX18p
OwotCWdudHRhYl9wYWdlX2NhY2hlX3B1dCgmcmluZy0+ZnJlZV9wYWdlcywg
cGFnZXNfdG9fZ250LCBzZWdzX3RvX21hcCk7Ci0JZm9yIChpID0gbGFzdF9t
YXA7IGkgPCBudW07IGkrKykKK291dDoKKwlmb3IgKGkgPSBsYXN0X21hcDsg
aSA8IG51bTsgaSsrKSB7CisJCS8qIERvbid0IHphcCBjdXJyZW50IGJhdGNo
J3MgdmFsaWQgcGVyc2lzdGVudCBncmFudHMuICovCisJCWlmKGkgPj0gbGFz
dF9tYXAgKyBzZWdzX3RvX21hcCkKKwkJCXBhZ2VzW2ldLT5wZXJzaXN0ZW50
X2dudCA9IE5VTEw7CiAJCXBhZ2VzW2ldLT5oYW5kbGUgPSBCTEtCQUNLX0lO
VkFMSURfSEFORExFOwotCXJldHVybiAtRU5PTUVNOworCX0KKworCXJldHVy
biByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgeGVuX2Jsa2JrX21hcF9zZWcoc3Ry
dWN0IHBlbmRpbmdfcmVxICpwZW5kaW5nX3JlcSkK

--=separator--

