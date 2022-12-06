Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF16447D1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 16:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455053.712719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Zhi-0002Px-Uz; Tue, 06 Dec 2022 15:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455053.712719; Tue, 06 Dec 2022 15:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Zhi-0002Jl-PB; Tue, 06 Dec 2022 15:17:54 +0000
Received: by outflank-mailman (input) for mailman id 455053;
 Tue, 06 Dec 2022 15:17:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Anb0=4E=xenbits.xen.org=julieng@srs-se1.protection.inumbo.net>)
 id 1p2Zhh-0000rk-UG
 for xen-devel@lists.xen.org; Tue, 06 Dec 2022 15:17:54 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2523dc8d-7579-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 16:17:51 +0100 (CET)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1p2ZhW-0002F4-HL; Tue, 06 Dec 2022 15:17:42 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1p2ZhW-0005Xe-FG; Tue, 06 Dec 2022 15:17:42 +0000
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
X-Inumbo-ID: 2523dc8d-7579-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Date:Message-Id:Subject:CC:From:To:MIME-Version:
	Content-Transfer-Encoding:Content-Type;
	bh=hd8QhOCTIJExTLVLEAatGfJ4X1SBeDr2UlJZh/kN5Ok=; b=Lfb2+tYbV4KFM3+xBbC+vwqW9Q
	Gr3R2JpEEK2aZJjdbKryaFrgHTxwh+Btg2B91ih/OvxIo/ut5BfbAOM0nE+jvSkI/dxHVTOnLVTov
	PeCv3hLET6vE2lk5nu61mhDjEPDSKWfN8UGYLLIYx0dk8+Y/tCB1qsoLM3VULeXzcKhw=;
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.509 (Entity 5.509)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 424 v1 (CVE-2022-42328,CVE-2022-42329) -
 Guests can trigger deadlock in Linux netback driver
Message-Id: <E1p2ZhW-0005Xe-FG@xenbits.xenproject.org>
Date: Tue, 06 Dec 2022 15:17:42 +0000

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

     Xen Security Advisory CVE-2022-42328,CVE-2022-42329 / XSA-424

          Guests can trigger deadlock in Linux netback driver

ISSUE DESCRIPTION
=================

The patch for XSA-392 introduced another issue which might result in
a deadlock when trying to free the SKB of a packet dropped due to
the XSA-392 handling (CVE-2022-42328).

Additionally when dropping packages for other reasons the same
deadlock could occur in case of netpoll being active for the interface
the xen-netback driver is connected to (CVE-2022-42329).

IMPACT
======

A malicious guest could cause Denial of Service (DoS) of the host via
the paravirtualized network interface.

VULNERABLE SYSTEMS
==================

All systems using the Linux kernel based network backend xen-netback
are vulnerable.

MITIGATION
==========

Using another PV network backend (e.g. the qemu based "qnic" backend)
will mitigate the problem.

Using a dedicated network driver domain per guest will mitigate the
problem.

NOTE REGARDING LACK OF EMBARGO
==============================

This issue was discussed in public already.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa424-linux.patch     Linux 6.0, 6.1-rc

$ sha256sum xsa424*
89db7cad9694f498c4ac450356932fb69fb514162e07aea0343776effa821fc8  xsa424-linux.patch
$

-----BEGIN PGP SIGNATURE-----

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmOPXKYMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ30IH/1GZwPXXAqMjN3d1n7BotiDLfmDiNp8e92wvQvmh
cXgsBtvTZ+oDzI7J+Xr/42c4IN41s34fWl0hmNbdrw4lwrOSoj0rnCP73Bn22oUT
jbv3bmFOHytCs5crvVrA4S7dCNcdpoEmfOoSaz1cBPhMecotlgTQo7M2Cagv3O9a
a9fR+KGMk9EBDGdo2wBJyEcD9ApASPEV+LJgLoTOuYFIStCO/+TTBfJx5H7T/vgK
Dqxsq1nULCSBc5Z5wrmtF49G3asBrAbPTkRhpyp9giXU+UV0QNJclnc+IJPdLIOe
jISAvpHQ3Fkb7Q25jaBg+c0bf9KzT3ekBOaf1RofgA84Jg0=
=4J/5
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa424-linux.patch"
Content-Disposition: attachment; filename="xsa424-linux.patch"
Content-Transfer-Encoding: base64

RnJvbSBjZmRmOGZkODE4NDU3MzRiNjE1MmI0NjE3NzQ2YzExMjdlYzUyMjI4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6IFR1ZSwgNiBEZWMgMjAyMiAwODo1
NDoyNCArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHhlbi9uZXRiYWNrOiBkb24n
dCBjYWxsIGtmcmVlX3NrYigpIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZAoK
SXQgaXMgbm90IGFsbG93ZWQgdG8gY2FsbCBrZnJlZV9za2IoKSBmcm9tIGhh
cmR3YXJlIGludGVycnVwdApjb250ZXh0IG9yIHdpdGggaW50ZXJydXB0cyBi
ZWluZyBkaXNhYmxlZC4gU28gcmVtb3ZlIGtmcmVlX3NrYigpCmZyb20gdGhl
IHNwaW5fbG9ja19pcnFzYXZlKCkgc2VjdGlvbiBhbmQgdXNlIHRoZSBhbHJl
YWR5IGV4aXN0aW5nCiJkcm9wIiBsYWJlbCBpbiB4ZW52aWZfc3RhcnRfeG1p
dCgpIGZvciBkcm9wcGluZyB0aGUgU0tCLiBBdCB0aGUKc2FtZSB0aW1lIHJl
cGxhY2UgdGhlIGRldl9rZnJlZV9za2IoKSBjYWxsIHRoZXJlIHdpdGggYSBj
YWxsIG9mCmRldl9rZnJlZV9za2JfYW55KCksIGFzIHhlbnZpZl9zdGFydF94
bWl0KCkgY2FuIGJlIGNhbGxlZCB3aXRoCmRpc2FibGVkIGludGVycnVwdHMu
CgpUaGlzIGlzIFhTQS00MjQgLyBDVkUtMjAyMi00MjMyOCAvIENWRS0yMDIy
LTQyMzI5LgoKRml4ZXM6IGJlODE5OTJmOTA4NiAoInhlbi9uZXRiYWNrOiBk
b24ndCBxdWV1ZSB1bmxpbWl0ZWQgbnVtYmVyIG9mIHBhY2thZ2VzIikKUmVw
b3J0ZWQtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdl
aS5jb20+ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KLS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9jb21tb24u
aCAgICB8IDIgKy0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFj
ZS5jIHwgNiArKysrLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3J4LmMg
ICAgICAgIHwgOCArKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5oIGIvZHJpdmVycy9uZXQveGVu
LW5ldGJhY2svY29tbW9uLmgKaW5kZXggMTU0NWNiZWU3N2E0Li4zZGJmYzhh
NjkyNGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2Nv
bW1vbi5oCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5o
CkBAIC0zODYsNyArMzg2LDcgQEAgaW50IHhlbnZpZl9kZWFsbG9jX2t0aHJl
YWQodm9pZCAqZGF0YSk7CiBpcnFyZXR1cm5fdCB4ZW52aWZfY3RybF9pcnFf
Zm4oaW50IGlycSwgdm9pZCAqZGF0YSk7CiAKIGJvb2wgeGVudmlmX2hhdmVf
cnhfd29yayhzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwgYm9vbCB0ZXN0
X2t0aHJlYWQpOwotdm9pZCB4ZW52aWZfcnhfcXVldWVfdGFpbChzdHJ1Y3Qg
eGVudmlmX3F1ZXVlICpxdWV1ZSwgc3RydWN0IHNrX2J1ZmYgKnNrYik7Citi
b29sIHhlbnZpZl9yeF9xdWV1ZV90YWlsKHN0cnVjdCB4ZW52aWZfcXVldWUg
KnF1ZXVlLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsKIAogdm9pZCB4ZW52aWZf
Y2Fycmllcl9vbihzdHJ1Y3QgeGVudmlmICp2aWYpOwogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYyBiL2RyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jCmluZGV4IDY1MGZhMTgw
MjIwZi4uZjNmMmMwNzQyM2E2IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94
ZW4tbmV0YmFjay9pbnRlcmZhY2UuYworKysgYi9kcml2ZXJzL25ldC94ZW4t
bmV0YmFjay9pbnRlcmZhY2UuYwpAQCAtMjU0LDE0ICsyNTQsMTYgQEAgeGVu
dmlmX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5l
dF9kZXZpY2UgKmRldikKIAlpZiAodmlmLT5oYXNoLmFsZyA9PSBYRU5fTkVU
SUZfQ1RSTF9IQVNIX0FMR09SSVRITV9OT05FKQogCQlza2JfY2xlYXJfaGFz
aChza2IpOwogCi0JeGVudmlmX3J4X3F1ZXVlX3RhaWwocXVldWUsIHNrYik7
CisJaWYgKCF4ZW52aWZfcnhfcXVldWVfdGFpbChxdWV1ZSwgc2tiKSkKKwkJ
Z290byBkcm9wOworCiAJeGVudmlmX2tpY2tfdGhyZWFkKHF1ZXVlKTsKIAog
CXJldHVybiBORVRERVZfVFhfT0s7CiAKICBkcm9wOgogCXZpZi0+ZGV2LT5z
dGF0cy50eF9kcm9wcGVkKys7Ci0JZGV2X2tmcmVlX3NrYihza2IpOworCWRl
dl9rZnJlZV9za2JfYW55KHNrYik7CiAJcmV0dXJuIE5FVERFVl9UWF9PSzsK
IH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svcngu
YyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3J4LmMKaW5kZXggOTMyNzYy
MTc3MTEwLi4wYmE3NTRlYmM1YmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0
L3hlbi1uZXRiYWNrL3J4LmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJh
Y2svcnguYwpAQCAtODIsOSArODIsMTAgQEAgc3RhdGljIGJvb2wgeGVudmlm
X3J4X3Jpbmdfc2xvdHNfYXZhaWxhYmxlKHN0cnVjdCB4ZW52aWZfcXVldWUg
KnF1ZXVlKQogCXJldHVybiBmYWxzZTsKIH0KIAotdm9pZCB4ZW52aWZfcnhf
cXVldWVfdGFpbChzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwgc3RydWN0
IHNrX2J1ZmYgKnNrYikKK2Jvb2wgeGVudmlmX3J4X3F1ZXVlX3RhaWwoc3Ry
dWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUsIHN0cnVjdCBza19idWZmICpza2Ip
CiB7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKKwlib29sIHJldCA9IHRydWU7
CiAKIAlzcGluX2xvY2tfaXJxc2F2ZSgmcXVldWUtPnJ4X3F1ZXVlLmxvY2ss
IGZsYWdzKTsKIApAQCAtOTIsOCArOTMsNyBAQCB2b2lkIHhlbnZpZl9yeF9x
dWV1ZV90YWlsKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLCBzdHJ1Y3Qg
c2tfYnVmZiAqc2tiKQogCQlzdHJ1Y3QgbmV0X2RldmljZSAqZGV2ID0gcXVl
dWUtPnZpZi0+ZGV2OwogCiAJCW5ldGlmX3R4X3N0b3BfcXVldWUobmV0ZGV2
X2dldF90eF9xdWV1ZShkZXYsIHF1ZXVlLT5pZCkpOwotCQlrZnJlZV9za2Io
c2tiKTsKLQkJcXVldWUtPnZpZi0+ZGV2LT5zdGF0cy5yeF9kcm9wcGVkKys7
CisJCXJldCA9IGZhbHNlOwogCX0gZWxzZSB7CiAJCWlmIChza2JfcXVldWVf
ZW1wdHkoJnF1ZXVlLT5yeF9xdWV1ZSkpCiAJCQl4ZW52aWZfdXBkYXRlX25l
ZWRlZF9zbG90cyhxdWV1ZSwgc2tiKTsKQEAgLTEwNCw2ICsxMDQsOCBAQCB2
b2lkIHhlbnZpZl9yeF9xdWV1ZV90YWlsKHN0cnVjdCB4ZW52aWZfcXVldWUg
KnF1ZXVlLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQogCX0KIAogCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJnF1ZXVlLT5yeF9xdWV1ZS5sb2NrLCBmbGFncyk7
CisKKwlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgc3RydWN0IHNrX2J1ZmYg
KnhlbnZpZl9yeF9kZXF1ZXVlKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVl
KQotLSAKMi4zNS4zCgo=

--=separator--

