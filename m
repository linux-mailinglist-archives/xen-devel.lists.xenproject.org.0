Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E3A566B30
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360839.590329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hIE-00059o-Om; Tue, 05 Jul 2022 12:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360839.590329; Tue, 05 Jul 2022 12:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hIE-00056o-AD; Tue, 05 Jul 2022 12:04:38 +0000
Received: by outflank-mailman (input) for mailman id 360839;
 Tue, 05 Jul 2022 12:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eb3+=XK=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1o8hIB-0003yR-Kz
 for xen-devel@lists.xen.org; Tue, 05 Jul 2022 12:04:35 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb7ed0d-fc5a-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:04:32 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1o8hHu-0003NI-Fw; Tue, 05 Jul 2022 12:04:18 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1o8hHu-0004G2-Eq; Tue, 05 Jul 2022 12:04:18 +0000
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
X-Inumbo-ID: 9eb7ed0d-fc5a-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=QAl9nOVTcMC4khUODf/sp9Yo/Uls9NnRuFaD0BAPueY=; b=l6Mf2w3V7T4K7eM3Mo/eb7VX3F
	xemvX6yj6UVHsLHOZT1kzGbGTkp9kZ+K1SKP3ai1rk+8jFWo4iv9Bq5eDYYTgEJps+wKn+YoxqOyB
	3upUaM0vPzMA4/g1x2Y1tus1ZGTcLCTGxZkJObN/hFG6mxSklMZI7Ln9RBswKGV9vITw=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 405 v3 (CVE-2022-33743) - network backend
 may cause Linux netfront to use freed SKBs
Message-Id: <E1o8hHu-0004G2-Eq@xenbits.xenproject.org>
Date: Tue, 05 Jul 2022 12:04:18 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-33743 / XSA-405
                               version 3

       network backend may cause Linux netfront to use freed SKBs

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

While adding logic to support XDP (eXpress Data Path), a code label was
moved in a way allowing for SKBs having references (pointers) retained
for further processing to nevertheless be freed.

IMPACT
======

A misbehaving or malicious backend may cause a Denial of Service (DoS)
in the guest.  Information leaks or privilege escalation cannot be
ruled out.

VULNERABLE SYSTEMS
==================

Linux versions 5.9 - 5.18 are vulnerable.  Linux versions 5.8 and
earlier are not vulnerable.

This vulnerability only increases the capability of an attacker in systems
with less than fully privileged network backends (e.g. network driver
domains).  For systems where netback runs in dom0 (the default
configuration), this vulnerability does not increase the capabilities of
an attacker.

MITIGATION
==========

There is no mitigation available other than not using PV devices in case
a backend is suspected to be potentially malicious.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa405-linux.patch     Linux 5.9 - 5.19-rc

$ sha256sum xsa405*
69716b78fbd996bce0414079bbb5f002029c5a82924aaae0db78a13c4b385f0a  xsa405-linux.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of patches or mitigations is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because the patches need to be applied in the affected guests.
Switching from PV to non-PV devices is observable by the guests and has
usually a bad performance impact.

Deployment is permitted only AFTER the embargo ends.

(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmLEFgAMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZgG4H/3KYUQdJlSEq2AEmIZhh1HDdhj/9n9Wxm0eHEqEQ
pXvflqbqb2glZpQyWcFPcY4oRRYvy58p9FIEi3PJD+52K/7h58XcTEZKDFP87z53
iqATbN4s/wHQ45xWAuIEHsmfLRtj3gIr4qviux3dtygKMjo6cZDX7Ethv6j0xdgc
lEUfvisH+3ZXG+JOQbZyxmi6g1SGDf1TJQczXR1rJjIp/npTupfFO+4r+vpiypbI
6ytFrRwmqfzuO8Mz5Wqrda8Fkk3JYoYtJdBfd/hYNu5vBN0d4o82sbZpuzVgdRI4
H+R90MB1XpZJ/mSYEDBbEctbmTFfJrRvr9yGjtCi8ivvQ5I=
=fMa/
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa405-linux.patch"
Content-Disposition: attachment; filename="xsa405-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4tbmV0ZnJvbnQ6IHJlc3RvcmUgX19za2JfcXVldWVfdGFpbCgpIHBv
c2l0aW9uaW5nIGluIHhlbm5ldF9nZXRfcmVzcG9uc2VzKCkKClRoZSBjb21t
aXQgcmVmZXJlbmNlZCBiZWxvdyBtb3ZlZCB0aGUgaW52b2NhdGlvbiBwYXN0
IHRoZSAibmV4dCIgbGFiZWwsCndpdGhvdXQgYW55IGV4cGxhbmF0aW9uLiBJ
biBmYWN0IHRoaXMgYWxsb3dzIG1pc2JlaGF2aW5nIGJhY2tlbmRzIHVuZHVl
CmNvbnRyb2wgb3ZlciB0aGUgZG9tYWluIHRoZSBmcm9udGVuZCBydW5zIGlu
LCBhcyBlYXJsaWVyIGRldGVjdGVkIGVycm9ycwpyZXF1aXJlIHRoZSBza2Ig
dG8gbm90IGJlIGZyZWVkIChpdCBtYXkgYmUgcmV0YWluZWQgZm9yIGxhdGVy
IHByb2Nlc3NpbmcKdmlhIHhlbm5ldF9tb3ZlX3J4X3Nsb3QoKSwgb3IgaXQg
bWF5IHNpbXBseSBiZSB1bnNhZmUgdG8gaGF2ZSBpdCBmcmVlZCkuCgpUaGlz
IGlzIENWRS0yMDIyLTMzNzQzIC8gWFNBLTQwNS4KCkZpeGVzOiA2YzVhYTZm
YzRkZWYgKCJ4ZW4gbmV0d29ya2luZzogYWRkIGJhc2ljIFhEUCBzdXBwb3J0
IGZvciB4ZW4tbmV0ZnJvbnQiKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpUaGUgY2hhbmdlIGluIHF1ZXN0
aW9uIGFzIHdlbGwgYXMgdGhlIHJlc3BlY3RpdmUgbmV0aWYuaCBjaGFuZ2Ug
d2VudAppbiB3aXRob3V0IGFueSBYZW4gcGVyc29uJ3MgYWNrIG9yIFItYjsg
b25seSB0aGUgY29ycmVzcG9uZGluZyBiYWNrZW5kCmNoYW5nZSBoYXMgUGF1
bCdzIFItYi4gVGhpcyBpbiBwYXJ0aWN1bGFyIG1lYW5zIHRoYXQgdGhlIGlu
dGVyZmFjZQphZGRpdGlvbiBpcyBzdGlsbCB1bm9mZmljaWFsIChhbmQgYXQg
cmlzayBvZiBjb2xsaWRpbmcgd2l0aCBzb21lb25lCmVsc2UncyksIGZvciBu
b3QgaGF2aW5nIGJlZW4gY29tbWl0dGVkIHRvIHRoZSBjYW5vbmljYWwgY29w
eSBvZiB0aGUKaGVhZGVyIGluIHhlbi5naXQuCgotLS0gYS9kcml2ZXJzL25l
dC94ZW4tbmV0ZnJvbnQuYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0ZnJv
bnQuYwpAQCAtMTA1Myw4ICsxMDUzLDEwIEBAIHN0YXRpYyBpbnQgeGVubmV0
X2dldF9yZXNwb25zZXMoc3RydWN0IG4KIAkJCX0KIAkJfQogCQlyY3VfcmVh
ZF91bmxvY2soKTsKLW5leHQ6CisKIAkJX19za2JfcXVldWVfdGFpbChsaXN0
LCBza2IpOworCituZXh0OgogCQlpZiAoIShyeC0+ZmxhZ3MgJiBYRU5fTkVU
UlhGX21vcmVfZGF0YSkpCiAJCQlicmVhazsKIAo=

--=separator--

