Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E510F960
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 09:01:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic33j-0007Sy-6S; Tue, 03 Dec 2019 07:57:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QNQZ=ZZ=amazon.de=prvs=2337aaad1=wipawel@srs-us1.protection.inumbo.net>)
 id 1ic33h-0007St-Kg
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 07:57:21 +0000
X-Inumbo-ID: 88c2adae-15a2-11ea-81d2-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88c2adae-15a2-11ea-81d2-12813bfff9fa;
 Tue, 03 Dec 2019 07:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1575359841; x=1606895841;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Mp0tzNGXgD5kIMNh5lf0e3ibqs5Z6nvc/kffxKhU9kI=;
 b=qbypf07PoMNvsC4UWiOT6Os07DYWDPuVo8WD3dyxqQKccfbI5bgF8ym0
 6GKeYAilin0CvnbCjvuDmstcyaypeVi93xx5wlsbRpDPa888ovJ0YFlUd
 cyQ+YCsC1rFeOKE/LEpn1NzVpk3dfd2xwtXk3ho+4Am3gGZyN9DVUld/f M=;
IronPort-SDR: yxel2GpR1dGRRlkQWLvvS87e3y2V52dIzttZtYkGqArZbsMv/rnFrT3d0912nUm1nG2OxaCwQV
 uvvQOiS5ArPQ==
X-IronPort-AV: E=Sophos;i="5.69,272,1571702400"; 
   d="scan'208";a="6765653"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 03 Dec 2019 07:57:20 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 45E56A119D; Tue,  3 Dec 2019 07:57:19 +0000 (UTC)
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Dec 2019 07:57:18 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Dec 2019 07:57:17 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id 15.0.1367.3 via Frontend Transport; Tue, 3 Dec 2019 07:57:15 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Dec 2019 07:57:09 +0000
Message-ID: <20191203075709.107811-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH livepatch-build-tools] create-diff-object:
 Ignore .init sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIC5pbml0IHNlY3Rpb25zIG11c3Qgbm90IGJlIGNvbnNpZGVyZWQgZm9yIHBhdGNoaW5nIHJl
Z2FyZGxlc3Mgb2YKd2hldGhlciB0aGV5IGFyZSBDSEFOR0VEIG9yIE5FVy4KRXhwbGljaXRlbHkg
ZGV0ZWN0IGFuZCBpZ25vcmUgYWxsIHN1Y2ggc2VjdGlvbnMsIGJlZm9yZSBtYXJraW5nCmlnbm9y
ZWQgc2VjdGlvbnMgYXMgU0FNRS4KClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6
IDx3aXBhd2VsQGFtYXpvbi5kZT4KLS0tCiBjb21tb24uYyAgICAgICAgICAgICB8ICA3ICsrKysr
KysKIGNvbW1vbi5oICAgICAgICAgICAgIHwgIDEgKwogY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCAx
NSArKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2NvbW1vbi5jIGIvY29tbW9uLmMKaW5kZXggOGY1NTNlYS4uNjhhNzFmNyAxMDA2
NDQKLS0tIGEvY29tbW9uLmMKKysrIGIvY29tbW9uLmMKQEAgLTI1Niw2ICsyNTYsMTMgQEAgaW50
IGlzX3JvZGF0YV9zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpCiAJICAgICAgICFzdHJuY21w
KHNlYy0+bmFtZSwgIi5yb2RhdGEiLCA3KTsKIH0KIAoraW50IGlzX2luaXRfc2VjdGlvbihzdHJ1
Y3Qgc2VjdGlvbiAqc2VjKQoreworCXJldHVybiBzZWMtPnNoLnNoX3R5cGUgPT0gU0hUX1BST0dC
SVRTICYmCisJICAgICAgIChzZWMtPnNoLnNoX2ZsYWdzICYgU0hGX0FMTE9DKSAmJgorCSAgICAg
ICAhc3RybmNtcChzZWMtPm5hbWUsICIuaW5pdCIsIDUpOworfQorCiBpbnQgaXNfZGVidWdfc2Vj
dGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKQogewogCWNoYXIgKm5hbWU7CmRpZmYgLS1naXQgYS9j
b21tb24uaCBiL2NvbW1vbi5oCmluZGV4IGI2NDg5ZGIuLjAyYzliN2IgMTAwNjQ0Ci0tLSBhL2Nv
bW1vbi5oCisrKyBiL2NvbW1vbi5oCkBAIC0xNjAsNiArMTYwLDcgQEAgc3RydWN0IHN5bWJvbCAq
ZmluZF9zeW1ib2xfYnlfbmFtZShzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0LCBjb25zdCBjaGFyICpu
YW1lKTsKIAogaW50IGlzX3RleHRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKIGludCBp
c19yb2RhdGFfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKK2ludCBpc19pbml0X3NlY3Rp
b24oc3RydWN0IHNlY3Rpb24gKnNlYyk7CiBpbnQgaXNfZGVidWdfc2VjdGlvbihzdHJ1Y3Qgc2Vj
dGlvbiAqc2VjKTsKIGludCBpc19yZWxhX3NlY3Rpb24oc3RydWN0IHNlY3Rpb24gKnNlYyk7CiBp
bnQgaXNfc3RhbmRhcmRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKZGlmZiAtLWdpdCBh
L2NyZWF0ZS1kaWZmLW9iamVjdC5jIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKaW5kZXggYWJmM2Nj
Ny4uMWNlNWMwOSAxMDA2NDQKLS0tIGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMKKysrIGIvY3JlYXRl
LWRpZmYtb2JqZWN0LmMKQEAgLTg4MSw2ICs4ODEsMTkgQEAgc3RhdGljIHZvaWQga3BhdGNoX21h
cmtfaWdub3JlZF9mdW5jdGlvbnNfc2FtZShzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKIAl9CiB9
CiAKK3N0YXRpYyB2b2lkIGxpdmVwYXRjaF9pZ25vcmVfaW5pdF9zZWN0aW9ucyhzdHJ1Y3Qga3Bh
dGNoX2VsZiAqa2VsZikKK3sKKwlzdHJ1Y3Qgc2VjdGlvbiAqc2VjOworCisJbGlzdF9mb3JfZWFj
aF9lbnRyeShzZWMsICZrZWxmLT5zZWN0aW9ucywgbGlzdCkgeworCQlpZiAoaXNfaW5pdF9zZWN0
aW9uKHNlYykpIHsKKwkJCWxvZ19ub3JtYWwoIldBUk5JTkc6IEV4cGxpY2l0bHkgaWdub3Jpbmcg
LmluaXQgc2VjdGlvbjogJXNcbiIsCisJCQkJICAgc2VjLT5uYW1lKTsKKwkJCXNlYy0+aWdub3Jl
ID0gMTsKKwkJfQorCX0KK30KKwogc3RhdGljIHZvaWQga3BhdGNoX21hcmtfaWdub3JlZF9zZWN0
aW9ucyhzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKIHsKIAlzdHJ1Y3Qgc2VjdGlvbiAqc2VjLCAq
c3Ryc2VjLCAqaWdub3Jlc2VjOwpAQCAtMjMzMiw2ICsyMzQ1LDggQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKmFyZ3ZbXSkKIAkgKiBXZSBhY2Nlc3MgaXRzIHNlY3Rpb25zIHZpYSB0aGUgdHdp
biBwb2ludGVycyBpbiB0aGUKIAkgKiBzZWN0aW9uLCBzeW1ib2wsIGFuZCByZWxhIGxpc3RzIG9m
IGtlbGZfcGF0Y2hlZC4KIAkgKi8KKwlsb2dfZGVidWcoIklnbm9yZSAuaW5pdCBzZWN0aW9uc1xu
Iik7CisJbGl2ZXBhdGNoX2lnbm9yZV9pbml0X3NlY3Rpb25zKGtlbGZfcGF0Y2hlZCk7CiAJbG9n
X2RlYnVnKCJNYXJrIGlnbm9yZWQgc2VjdGlvbnNcbiIpOwogCWtwYXRjaF9tYXJrX2lnbm9yZWRf
c2VjdGlvbnMoa2VsZl9wYXRjaGVkKTsKIAlsb2dfZGVidWcoIkNvbXBhcmUgY29ycmVsYXRlZCBl
bGVtZW50c1xuIik7Ci0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
