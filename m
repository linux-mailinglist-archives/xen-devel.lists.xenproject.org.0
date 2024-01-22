Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA19983700D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 19:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670077.1042711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRz68-00012t-IZ; Mon, 22 Jan 2024 18:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670077.1042711; Mon, 22 Jan 2024 18:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRz68-000109-Eh; Mon, 22 Jan 2024 18:32:40 +0000
Received: by outflank-mailman (input) for mailman id 670077;
 Mon, 22 Jan 2024 18:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IdsA=JA=xenbits.xen.org=andrewcoop@srs-se1.protection.inumbo.net>)
 id 1rRz67-0000hw-2x
 for xen-devel@lists.xen.org; Mon, 22 Jan 2024 18:32:39 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a3e484c-b954-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 19:32:33 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1rRz5s-0006An-5b; Mon, 22 Jan 2024 18:32:24 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1rRz5s-0003tE-3o; Mon, 22 Jan 2024 18:32:24 +0000
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
X-Inumbo-ID: 9a3e484c-b954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=jQ2S1lvmSX4xfvrw+eMwl1VWUBAWJ50rqkkdceJepl8=; b=EBi2YM2eakxsvTwT0CXLPe3TCG
	XRdj7cMvAbNk3IrXMywjZtW9HVaXMMeVzKhxaiQCj440jOpyyKI5MdT4rGXrCpeZXY/i8oSQR4FLe
	qOCSD9pPGbf+Uti4LOFkz2lu1vRHXJzPotWXbb9RGJklHQcR+6dbKCySbR2bzETdMXao=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 448 v2 (CVE-2023-46838) - Linux: netback
 processing of zero-length transmit fragment
Message-Id: <E1rRz5s-0003tE-3o@xenbits.xenproject.org>
Date: Mon, 22 Jan 2024 18:32:24 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2023-46838 / XSA-448
                               version 2

      Linux: netback processing of zero-length transmit fragment

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

Transmit requests in Xen's virtual network protocol can consist of
multiple parts.  While not really useful, except for the initial part
any of them may be of zero length, i.e. carry no data at all.  Besides a
certain initial portion of the to be transferred data, these parts are
directly translated into what Linux calls SKB fragments.  Such converted
request parts can, when for a particular SKB they are all of length
zero, lead to a de-reference of NULL in core networking code.

IMPACT
======

An unprivileged guest can cause Denial of Service (DoS) of the host by
sending network packets to the backend, causing the backend to crash.

Data corruption or privilege escalation have not been ruled out.

VULNERABLE SYSTEMS
==================

All systems using a Linux based network backend with kernel 4.14 and
newer are vulnerable.  Earlier versions may also be vulnerable.  Systems
using other network backends are not known to be vulnerable.

MITIGATION
==========

Using a userspace PV network backend (e.g. the qemu based "qnic" backend)
will mitigate the problem.

Using a dedicated network driver domain per guest will mitigate the
problem.

CREDITS
=======

This issue was discovered by Pratyush Yadav of Amazon.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa448-linux.patch           Linux 6.7-rc - 6.5

$ sha256sum xsa448*
f8c87cf546c2bc70970ca151c0ec8c1940f969e29c4cb3d2ec37ff9e43ddfc36  xsa448-linux.patch
$

NOTE CONCERNING EARLY DISCLOSURE
================================

The embargo was intended to be 2024-01-23 12:00 UTC, but a downstream
had a mixup of days and published early.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmWutGMMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ9h0H/26sgfTHO0vnTZ8cnisn3aC5VTvrx9nY5fcCe2cJ
/KgN3q3mtb3w41/2LD/rR0Zpw4SkeTaFp69Mz2hQa37gLVDSK5lDJDR61lwhiwrQ
MSsdPHs91EDJhF6aX/S7wsQkBZYPq1S9aOuIxJbDYN3D9WsTUWvuocXNxeqTx5q9
iWVSJTH5NkRSAaIVldyNVkQ7pWaSrwqmBzolnrZIsDUjYU1Lk/j0u6GFbkOF9SIg
onFiFbJhCOaIZOIP2Tfz7nHGBnxucI4cjjwy4BWM+Va35Pg4mbHaBuVGnQsaBtVF
UdY6/jw6Qk4ktV34il3+jlgGfAFC6GILJoraASjaFCEQ7jM=
=IPLz
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa448-linux.patch"
Content-Disposition: attachment; filename="xsa448-linux.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ZW4tbmV0YmFjazogZG9uJ3QgcHJvZHVjZSB6ZXJvLXNpemUgU0tCIGZy
YWdzCgpXaGlsZSBmcm9udGVuZHMgbWF5IHN1Ym1pdCB6ZXJvLXNpemUgcmVx
dWVzdHMgKHdhc3RpbmcgYSBwcmVjaW91cyBzbG90KSwKY29yZSBuZXR3b3Jr
aW5nIGNvZGUgYXMgb2YgYXQgbGVhc3QgM2VjZTc4MjY5M2M0YiAoInNvY2s6
IHNrYl9jb3B5X3VidWZzCnN1cHBvcnQgZm9yIGNvbXBvdW5kIHBhZ2VzIikg
Y2FuJ3QgZGVhbCB3aXRoIFNLQnMgd2hlbiB0aGV5IGhhdmUgYWxsCnplcm8t
c2l6ZSBmcmFnbWVudHMuIFJlc3BvbmQgdG8gZW1wdHkgcmVxdWVzdHMgcmln
aHQgd2hlbiBwb3B1bGF0aW5nCmZyYWdtZW50czsgYWxsIGZ1cnRoZXIgcHJv
Y2Vzc2luZyBpcyBmcmFnbWVudCBiYXNlZCBhbmQgaGVuY2Ugd29uJ3QKZW5j
b3VudGVyIHRoZXNlIGVtcHR5IHJlcXVlc3RzIGFueW1vcmUuCgpJbiBhIHdh
eSB0aGlzIHNob3VsZCBoYXZlIGJlZW4gdGhhdCB3YXkgZnJvbSB0aGUgYmVn
aW5uaW5nOiBXaGVuIG5vIGRhdGEKaXMgdG8gYmUgdHJhbnNmZXJyZWQgZm9y
IGEgcGFydGljdWxhciByZXF1ZXN0LCB0aGVyZSdzIG5vdCBldmVuIGEgcG9p
bnQKaW4gdmFsaWRhdGluZyB0aGUgcmVzcGVjdGl2ZSBncmFudCByZWYuIFRo
YXQncyBubyBkaWZmZXJlbnQgZnJvbSBlLmcuCnBhc3NpbmcgTlVMTCBpbnRv
IG1lbWNweSgpIHdoZW4gYXQgdGhlIHNhbWUgdGltZSB0aGUgc2l6ZSBpcyAw
LgoKVGhpcyBpcyBYU0EtNDQ4IC8gQ1ZFLTIwMjMtNDY4MzguCgpSZXBvcnRl
ZC1ieTogUHJhdHl1c2ggWWFkYXYgPHB0eWFkYXZAYW1hem9uLmRlPgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4KQWNrZWQtYnk6IFByYXR5dXNoIFlhZGF2
IDxwdHlhZGF2QGFtYXpvbi5kZT4KCi0tLSBhL2RyaXZlcnMvbmV0L3hlbi1u
ZXRiYWNrL25ldGJhY2suYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9uZXRiYWNrLmMKQEAgLTQ2MywxMiArNDYzLDI1IEBAIHN0YXRpYyB2b2lk
IHhlbnZpZl9nZXRfcmVxdWVzdHMoc3RydWN0IHgKIAl9CiAKIAlmb3IgKHNo
aW5mby0+bnJfZnJhZ3MgPSAwOyBucl9zbG90cyA+IDAgJiYgc2hpbmZvLT5u
cl9mcmFncyA8IE1BWF9TS0JfRlJBR1M7Ci0JICAgICBzaGluZm8tPm5yX2Zy
YWdzKyssIGdvcCsrLCBucl9zbG90cy0tKSB7CisJICAgICBucl9zbG90cy0t
KSB7CisJCWlmICh1bmxpa2VseSghdHhwLT5zaXplKSkgeworCQkJdW5zaWdu
ZWQgbG9uZyBmbGFnczsKKworCQkJc3Bpbl9sb2NrX2lycXNhdmUoJnF1ZXVl
LT5yZXNwb25zZV9sb2NrLCBmbGFncyk7CisJCQltYWtlX3R4X3Jlc3BvbnNl
KHF1ZXVlLCB0eHAsIDAsIFhFTl9ORVRJRl9SU1BfT0tBWSk7CisJCQlwdXNo
X3R4X3Jlc3BvbnNlcyhxdWV1ZSk7CisJCQlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZxdWV1ZS0+cmVzcG9uc2VfbG9jaywgZmxhZ3MpOworCQkJKyt0eHA7
CisJCQljb250aW51ZTsKKwkJfQorCiAJCWluZGV4ID0gcGVuZGluZ19pbmRl
eChxdWV1ZS0+cGVuZGluZ19jb25zKyspOwogCQlwZW5kaW5nX2lkeCA9IHF1
ZXVlLT5wZW5kaW5nX3JpbmdbaW5kZXhdOwogCQl4ZW52aWZfdHhfY3JlYXRl
X21hcF9vcChxdWV1ZSwgcGVuZGluZ19pZHgsIHR4cCwKIAkJCQkgICAgICAg
IHR4cCA9PSBmaXJzdCA/IGV4dHJhX2NvdW50IDogMCwgZ29wKTsKIAkJZnJh
Z19zZXRfcGVuZGluZ19pZHgoJmZyYWdzW3NoaW5mby0+bnJfZnJhZ3NdLCBw
ZW5kaW5nX2lkeCk7CisJCSsrc2hpbmZvLT5ucl9mcmFnczsKKwkJKytnb3A7
CiAKIAkJaWYgKHR4cCA9PSBmaXJzdCkKIAkJCXR4cCA9IHR4ZnJhZ3M7CkBA
IC00ODEsMjAgKzQ5NCwzOSBAQCBzdGF0aWMgdm9pZCB4ZW52aWZfZ2V0X3Jl
cXVlc3RzKHN0cnVjdCB4CiAJCXNoaW5mbyA9IHNrYl9zaGluZm8obnNrYik7
CiAJCWZyYWdzID0gc2hpbmZvLT5mcmFnczsKIAotCQlmb3IgKHNoaW5mby0+
bnJfZnJhZ3MgPSAwOyBzaGluZm8tPm5yX2ZyYWdzIDwgbnJfc2xvdHM7Ci0J
CSAgICAgc2hpbmZvLT5ucl9mcmFncysrLCB0eHArKywgZ29wKyspIHsKKwkJ
Zm9yIChzaGluZm8tPm5yX2ZyYWdzID0gMDsgc2hpbmZvLT5ucl9mcmFncyA8
IG5yX3Nsb3RzOyArK3R4cCkgeworCQkJaWYgKHVubGlrZWx5KCF0eHAtPnNp
emUpKSB7CisJCQkJdW5zaWduZWQgbG9uZyBmbGFnczsKKworCQkJCXNwaW5f
bG9ja19pcnFzYXZlKCZxdWV1ZS0+cmVzcG9uc2VfbG9jaywgZmxhZ3MpOwor
CQkJCW1ha2VfdHhfcmVzcG9uc2UocXVldWUsIHR4cCwgMCwKKwkJCQkJCSBY
RU5fTkVUSUZfUlNQX09LQVkpOworCQkJCXB1c2hfdHhfcmVzcG9uc2VzKHF1
ZXVlKTsKKwkJCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZxdWV1ZS0+cmVz
cG9uc2VfbG9jaywKKwkJCQkJCSAgICAgICBmbGFncyk7CisJCQkJY29udGlu
dWU7CisJCQl9CisKIAkJCWluZGV4ID0gcGVuZGluZ19pbmRleChxdWV1ZS0+
cGVuZGluZ19jb25zKyspOwogCQkJcGVuZGluZ19pZHggPSBxdWV1ZS0+cGVu
ZGluZ19yaW5nW2luZGV4XTsKIAkJCXhlbnZpZl90eF9jcmVhdGVfbWFwX29w
KHF1ZXVlLCBwZW5kaW5nX2lkeCwgdHhwLCAwLAogCQkJCQkJZ29wKTsKIAkJ
CWZyYWdfc2V0X3BlbmRpbmdfaWR4KCZmcmFnc1tzaGluZm8tPm5yX2ZyYWdz
XSwKIAkJCQkJICAgICBwZW5kaW5nX2lkeCk7CisJCQkrK3NoaW5mby0+bnJf
ZnJhZ3M7CisJCQkrK2dvcDsKIAkJfQogCi0JCXNrYl9zaGluZm8oc2tiKS0+
ZnJhZ19saXN0ID0gbnNrYjsKLQl9IGVsc2UgaWYgKG5za2IpIHsKKwkJaWYg
KHNoaW5mby0+bnJfZnJhZ3MpIHsKKwkJCXNrYl9zaGluZm8oc2tiKS0+ZnJh
Z19saXN0ID0gbnNrYjsKKwkJCW5za2IgPSBOVUxMOworCQl9CisJfQorCisJ
aWYgKG5za2IpIHsKIAkJLyogQSBmcmFnX2xpc3Qgc2tiIHdhcyBhbGxvY2F0
ZWQgYnV0IGl0IGlzIG5vIGxvbmdlciBuZWVkZWQKLQkJICogYmVjYXVzZSBl
bm91Z2ggc2xvdHMgd2VyZSBjb252ZXJ0ZWQgdG8gY29weSBvcHMgYWJvdmUu
CisJCSAqIGJlY2F1c2UgZW5vdWdoIHNsb3RzIHdlcmUgY29udmVydGVkIHRv
IGNvcHkgb3BzIGFib3ZlIG9yIHNvbWUKKwkJICogd2VyZSBlbXB0eS4KIAkJ
ICovCiAJCWtmcmVlX3NrYihuc2tiKTsKIAl9Cg==

--=separator--

