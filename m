Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40190566B2B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360843.590357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hIG-0005nn-Lz; Tue, 05 Jul 2022 12:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360843.590357; Tue, 05 Jul 2022 12:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hIG-0005bb-AD; Tue, 05 Jul 2022 12:04:40 +0000
Received: by outflank-mailman (input) for mailman id 360843;
 Tue, 05 Jul 2022 12:04:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eb3+=XK=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1o8hID-0003yR-LE
 for xen-devel@lists.xen.org; Tue, 05 Jul 2022 12:04:37 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ee01fca-fc5a-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:04:32 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1o8hHz-0003No-39; Tue, 05 Jul 2022 12:04:23 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1o8hHz-0004HG-2A; Tue, 05 Jul 2022 12:04:23 +0000
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
X-Inumbo-ID: 9ee01fca-fc5a-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=Y5Aw9EVfdlix6vLX+W3t433fZ2ikgPc5rEtvnO0yoTc=; b=6IRBwThY58/hcpCkCLK0hyENDW
	8XR2RDCYKEVOKCt7BuUgJ7foGl4bn/dauM9CxptAo7l9+p9OrH15Q8WSeymvy3a72TRQXKA6XEuwl
	KniRi3zsFG6jE0O5iuaMOskb783tET01dY8aIPjMwPO2QEACTpxJAkNlOf80Puv+NzBk=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 406 v3 (CVE-2022-33744) - Arm guests can
 cause Dom0 DoS via PV devices
Message-Id: <E1o8hHz-0004HG-2A@xenbits.xenproject.org>
Date: Tue, 05 Jul 2022 12:04:23 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2022-33744 / XSA-406
                               version 3

             Arm guests can cause Dom0 DoS via PV devices

UPDATES IN VERSION 3
====================

Public release.

ISSUE DESCRIPTION
=================

When mapping pages of guests on Arm, dom0 is using an rbtree to keep
track of the foreign mappings.

Updating of that rbtree is not always done completely with the related
lock held, resulting in a small race window, which can be used by
unprivileged guests via PV devices to cause inconsistencies of the
rbtree. These inconsistencies can lead to Denial of Service (DoS) of
dom0, e.g. by causing crashes or the inability to perform further
mappings of other guests' memory pages.

IMPACT
======

A guest performing multiple I/Os of PV devices in parallel can cause
DoS of dom0 and thus of the complete host.

VULNERABLE SYSTEMS
==================

Only Arm systems (32-bit and 64-bit) are vulnerable. Dom0 Linux versions
3.13 - 5.18 are vulnerable.

X86 systems are not vulnerable.

MITIGATION
==========

There is no mitigation available.

CREDITS
=======

This issue was discovered by Oleksandr Tyshchenko of EPAM.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa406-linux.patch     Linux 3.13 - 5.19-rc

$ sha256sum xsa406*
7a789f564b3365cade6e95d549dbbd5a8b7b5e53d09bc5a463c77dfefd5a4182  xsa406-linux.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmLEFgEMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZwJUIAJSrSYNMQE4jo1sJFKjEJ3cHy6CymbJC94JSm2Tf
HzeMlwd7NQF3Sc2HSWQoCSI+0TiRb6bJpfZASsbL/E3b6zcm3+VxwS7HVUtvHXhN
HJYRUMN9vckUkGwWDYbgveI7uie9P7gpjwi5CEXxQf4NO9Oloyk2J5bijktzbBN2
9FIZ7zFuiSRwGtr2WRaozCSzgg4EGiPRc5eMCFMP+K0P+oRvpkE52wWo/ZOPzW8T
xocUIcvQK335ib04OCS3oqJZrRNwrvX6Vn+CifXac2WHR9tQ24VnTq1iYRrVD+5x
kxpg4IuiNc2eD8lZCLnKEUDUj6LzWvgxKoxXgJFKXlESb0A=
=57so
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa406-linux.patch"
Content-Disposition: attachment; filename="xsa406-linux.patch"
Content-Transfer-Encoding: base64

eGVuL2FybTogRml4IHJhY2UgaW4gUkItdHJlZSBiYXNlZCBQMk0gYWNjb3Vu
dGluZwoKRHVyaW5nIHRoZSBQViBkcml2ZXIgbGlmZSBjeWNsZSB0aGUgbWFw
cGluZ3MgYXJlIGFkZGVkIHRvCnRoZSBSQi10cmVlIGJ5IHNldF9mb3JlaWdu
X3AybV9tYXBwaW5nKCksIHdoaWNoIGlzIGNhbGxlZCBmcm9tCmdudHRhYl9t
YXBfcmVmcygpIGFuZCBhcmUgcmVtb3ZlZCBieSBjbGVhcl9mb3JlaWduX3Ay
bV9tYXBwaW5nKCkKd2hpY2ggaXMgY2FsbGVkIGZyb20gZ250dGFiX3VubWFw
X3JlZnMoKS4gQXMgYm90aCBmdW5jdGlvbnMgZW5kCnVwIGNhbGxpbmcgX19z
ZXRfcGh5c190b19tYWNoaW5lX211bHRpKCkgd2hpY2ggdXBkYXRlcyB0aGUg
UkItdHJlZSwKdGhpcyBmdW5jdGlvbiBjYW4gYmUgY2FsbGVkIGNvbmN1cnJl
bnRseS4KClRoZXJlIGlzIGFscmVhZHkgYSAicDJtX2xvY2siIHRvIHByb3Rl
Y3QgYWdhaW5zdCBjb25jdXJyZW50IGFjY2Vzc2VzLApidXQgdGhlIHByb2Js
ZW0gaXMgdGhhdCB0aGUgZmlyc3QgcmVhZCBvZiAicGh5c190b19tYWNoLnJi
X25vZGUiCmluIF9fc2V0X3BoeXNfdG9fbWFjaGluZV9tdWx0aSgpIGlzIG5v
dCBjb3ZlcmVkIGJ5IGl0LCBzbyB0aGlzIG1pZ2h0CmxlYWQgdG8gdGhlIGlu
Y29ycmVjdCBtYXBwaW5ncyB1cGRhdGUgKHJlbW92aW5nIGluIG91ciBjYXNl
KSBpbiBSQi10cmVlLgoKSW4gbXkgZW52aXJvbm1lbnQgdGhlIHJlbGF0ZWQg
aXNzdWUgaGFwcGVucyByYXJlbHkgYW5kIG9ubHkgd2hlbgpQViBuZXQgYmFj
a2VuZCBpcyBydW5uaW5nLCB0aGUgeGVuX2FkZF9waHlzX3RvX21hY2hfZW50
cnkoKSBjbGFpbXMKdGhhdCBpdCBjYW5ub3QgYWRkIG5ldyBwZm4gPC0+IG1m
biBtYXBwaW5nIHRvIHRoZSB0cmVlIHNpbmNlIGl0IGlzCmFscmVhZHkgZXhp
c3RzIHdoaWNoIHJlc3VsdHMgaW4gYSBmYWlsdXJlIHdoZW4gbWFwcGluZyBm
b3JlaWduIHBhZ2VzLgoKQnV0IHRoZXJlIG1pZ2h0IGJlIG90aGVyIGJhZCBj
b25zZXF1ZW5jZXMgcmVsYXRlZCB0byB0aGUgbm9uLXByb3RlY3RlZApyb290
IHJlYWRzIHN1Y2ggdXNlLWFmdGVyLWZyZWUsIGV0Yy4KCldoaWxlIGF0IGl0
LCBhbHNvIGZpeCB0aGUgc2ltaWxhciB1c2FnZSBpbiBfX3Bmbl90b19tZm4o
KSwgc28KaW5pdGlhbGl6ZSAic3RydWN0IHJiX25vZGUgKm4iIHdpdGggdGhl
ICJwMm1fbG9jayIgaGVsZCBpbiBib3RoCmZ1bmN0aW9ucyB0byBhdm9pZCBw
b3NzaWJsZSBiYWQgY29uc2VxdWVuY2VzLgoKVGhpcyBpcyBDVkUtMjAyMi0z
Mzc0NCAvIFhTQS00MDYuCgpSZXBvcnRlZC1ieTogT2xla3NhbmRyIFR5c2hj
aGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgpTaWduZWQt
b2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hj
aGVua29AZXBhbS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9hcm0veGVu
L3AybS5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
eGVuL3AybS5jIGIvYXJjaC9hcm0veGVuL3AybS5jCmluZGV4IDg0YTFjZWEu
LjMwOTY0OGMxIDEwMDY0NAotLS0gYS9hcmNoL2FybS94ZW4vcDJtLmMKKysr
IGIvYXJjaC9hcm0veGVuL3AybS5jCkBAIC02MywxMSArNjMsMTIgQEAgc3Rh
dGljIGludCB4ZW5fYWRkX3BoeXNfdG9fbWFjaF9lbnRyeShzdHJ1Y3QgeGVu
X3AybV9lbnRyeSAqbmV3KQogCiB1bnNpZ25lZCBsb25nIF9fcGZuX3RvX21m
bih1bnNpZ25lZCBsb25nIHBmbikKIHsKLQlzdHJ1Y3QgcmJfbm9kZSAqbiA9
IHBoeXNfdG9fbWFjaC5yYl9ub2RlOworCXN0cnVjdCByYl9ub2RlICpuOwog
CXN0cnVjdCB4ZW5fcDJtX2VudHJ5ICplbnRyeTsKIAl1bnNpZ25lZCBsb25n
IGlycWZsYWdzOwogCiAJcmVhZF9sb2NrX2lycXNhdmUoJnAybV9sb2NrLCBp
cnFmbGFncyk7CisJbiA9IHBoeXNfdG9fbWFjaC5yYl9ub2RlOwogCXdoaWxl
IChuKSB7CiAJCWVudHJ5ID0gcmJfZW50cnkobiwgc3RydWN0IHhlbl9wMm1f
ZW50cnksIHJibm9kZV9waHlzKTsKIAkJaWYgKGVudHJ5LT5wZm4gPD0gcGZu
ICYmCkBAIC0xNTIsMTAgKzE1MywxMSBAQCBib29sIF9fc2V0X3BoeXNfdG9f
bWFjaGluZV9tdWx0aSh1bnNpZ25lZCBsb25nIHBmbiwKIAlpbnQgcmM7CiAJ
dW5zaWduZWQgbG9uZyBpcnFmbGFnczsKIAlzdHJ1Y3QgeGVuX3AybV9lbnRy
eSAqcDJtX2VudHJ5OwotCXN0cnVjdCByYl9ub2RlICpuID0gcGh5c190b19t
YWNoLnJiX25vZGU7CisJc3RydWN0IHJiX25vZGUgKm47CiAKIAlpZiAobWZu
ID09IElOVkFMSURfUDJNX0VOVFJZKSB7CiAJCXdyaXRlX2xvY2tfaXJxc2F2
ZSgmcDJtX2xvY2ssIGlycWZsYWdzKTsKKwkJbiA9IHBoeXNfdG9fbWFjaC5y
Yl9ub2RlOwogCQl3aGlsZSAobikgewogCQkJcDJtX2VudHJ5ID0gcmJfZW50
cnkobiwgc3RydWN0IHhlbl9wMm1fZW50cnksIHJibm9kZV9waHlzKTsKIAkJ
CWlmIChwMm1fZW50cnktPnBmbiA8PSBwZm4gJiYKLS0gCjIuNy40Cgo=

--=separator--

