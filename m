Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468EE18F218
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 10:45:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGJat-0004Ju-6E; Mon, 23 Mar 2020 09:42:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGJar-0004Ir-Vc
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 09:42:02 +0000
X-Inumbo-ID: 8a9208c4-6cea-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a9208c4-6cea-11ea-a6c1-bc764e2007e4;
 Mon, 23 Mar 2020 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WtqvUHDDBJQ+6nudvL16KfvlHXSoyjOwNd2TthZe2rc=; b=kzjTVEwYIUmcDoZjmeDWdWdjW5
 JhcwI/aivOvej2GZCqzC54p65c4R+GjpjgLfanuGMyt5JfNaa5F6b9E241QFRDVojHJ819D2s8Ld5
 lHC82x40J3knM1ndwLpGeTW5eYUC93TcckhXVhB2gyHlYlJucyyI+4jPtNo6XZYSfDFk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGJao-00006f-VU; Mon, 23 Mar 2020 09:41:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jGJao-00041e-Lv; Mon, 23 Mar 2020 09:41:58 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 23 Mar 2020 09:41:40 +0000
Message-Id: <2fa83ef5818805c179757caac99ccf7ab4f7ba3a.1584955616.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
In-Reply-To: <cover.1584955616.git.hongyxia@amazon.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
Subject: [Xen-devel] [PATCH 3/5] x86_64/mm: map and unmap page tables in
 share_hotadd_m2p_table
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkZldGNoIGxZZSBieSBtYXBwaW5n
IGFuZCB1bm1hcHBpbmcgbFhlIGluc3RlYWQgb2YgdXNpbmcgdGhlIGRpcmVjdCBtYXAsCndoaWNo
IGlzIG5vdyBkb25lIHZpYSB0aGUgbmV3IGxZZV9mcm9tX2xYZSgpIGhlbHBlcnMuCgpTaWduZWQt
b2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBIb25n
eWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYveDg2XzY0L21t
LmMgICB8IDEyICsrKysrKy0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmggfCAxOCAr
KysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4v
YXJjaC94ODYveDg2XzY0L21tLmMKaW5kZXggYTQ0MGRhYzI1ZS4uMjY4MDE3M2ZhYiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQv
bW0uYwpAQCAtMTczLDE0ICsxNzMsMTQgQEAgc3RhdGljIGludCBzaGFyZV9ob3RhZGRfbTJwX3Rh
YmxlKHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAgICAgICAgICAgdiArPSBuIDw8IFBB
R0VfU0hJRlQgKQogICAgIHsKICAgICAgICAgbiA9IEwyX1BBR0VUQUJMRV9FTlRSSUVTICogTDFf
UEFHRVRBQkxFX0VOVFJJRVM7Ci0gICAgICAgIGwzZSA9IGw0ZV90b19sM2UoaWRsZV9wZ190YWJs
ZVtsNF90YWJsZV9vZmZzZXQodildKVsKLSAgICAgICAgICAgIGwzX3RhYmxlX29mZnNldCh2KV07
CisgICAgICAgIGwzZSA9IGwzZV9mcm9tX2w0ZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNl
dCh2KV0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICBsM190YWJsZV9vZmZzZXQodikpOwog
ICAgICAgICBpZiAoICEobDNlX2dldF9mbGFncyhsM2UpICYgX1BBR0VfUFJFU0VOVCkgKQogICAg
ICAgICAgICAgY29udGludWU7CiAgICAgICAgIGlmICggIShsM2VfZ2V0X2ZsYWdzKGwzZSkgJiBf
UEFHRV9QU0UpICkKICAgICAgICAgewogICAgICAgICAgICAgbiA9IEwxX1BBR0VUQUJMRV9FTlRS
SUVTOwotICAgICAgICAgICAgbDJlID0gbDNlX3RvX2wyZShsM2UpW2wyX3RhYmxlX29mZnNldCh2
KV07CisgICAgICAgICAgICBsMmUgPSBsMmVfZnJvbV9sM2UobDNlLCBsMl90YWJsZV9vZmZzZXQo
dikpOwogICAgICAgICAgICAgaWYgKCAhKGwyZV9nZXRfZmxhZ3MobDJlKSAmIF9QQUdFX1BSRVNF
TlQpICkKICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgIG0ycF9zdGFydF9t
Zm4gPSBsMmVfZ2V0X21mbihsMmUpOwpAQCAtMjAxLDExICsyMDEsMTEgQEAgc3RhdGljIGludCBz
aGFyZV9ob3RhZGRfbTJwX3RhYmxlKHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAgICAg
ICAgICAgdiAhPSBSRFdSX0NPTVBBVF9NUFRfVklSVF9FTkQ7CiAgICAgICAgICAgdiArPSAxIDw8
IEwyX1BBR0VUQUJMRV9TSElGVCApCiAgICAgewotICAgICAgICBsM2UgPSBsNGVfdG9fbDNlKGlk
bGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KHYpXSlbCi0gICAgICAgICAgICBsM190YWJsZV9v
ZmZzZXQodildOworICAgICAgICBsM2UgPSBsM2VfZnJvbV9sNGUoaWRsZV9wZ190YWJsZVtsNF90
YWJsZV9vZmZzZXQodildLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgbDNfdGFibGVfb2Zm
c2V0KHYpKTsKICAgICAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdFX1BSRVNF
TlQpICkKICAgICAgICAgICAgIGNvbnRpbnVlOwotICAgICAgICBsMmUgPSBsM2VfdG9fbDJlKGwz
ZSlbbDJfdGFibGVfb2Zmc2V0KHYpXTsKKyAgICAgICAgbDJlID0gbDJlX2Zyb21fbDNlKGwzZSwg
bDJfdGFibGVfb2Zmc2V0KHYpKTsKICAgICAgICAgaWYgKCAhKGwyZV9nZXRfZmxhZ3MobDJlKSAm
IF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICBtMnBfc3Rh
cnRfbWZuID0gbDJlX2dldF9tZm4obDJlKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvcGFnZS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKaW5kZXggYzk4ZDhmNWVkZS4u
ZDQ3NTJhNTkyNSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKQEAgLTE5Niw2ICsxOTYsMjQgQEAgc3RhdGljIGlu
bGluZSBsNF9wZ2VudHJ5X3QgbDRlX2Zyb21fcGFkZHIocGFkZHJfdCBwYSwgdW5zaWduZWQgaW50
IGZsYWdzKQogI2RlZmluZSBtYXBfbDJ0X2Zyb21fbDNlKHgpICAgICAgICAobDJfcGdlbnRyeV90
ICopbWFwX2RvbWFpbl9wYWdlKGwzZV9nZXRfbWZuKHgpKQogI2RlZmluZSBtYXBfbDN0X2Zyb21f
bDRlKHgpICAgICAgICAobDNfcGdlbnRyeV90ICopbWFwX2RvbWFpbl9wYWdlKGw0ZV9nZXRfbWZu
KHgpKQogCisjZGVmaW5lIGwxZV9mcm9tX2wyZShsMmUsIG9mZikgKHsgICAgICAgICAgICAgICAg
ICAgXAorICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdCA9IG1hcF9sMXRfZnJvbV9sMmUobDJlKTsg
IFwKKyAgICAgICAgbDFfcGdlbnRyeV90IGwxZSA9IGwxdFtvZmZdOyAgICAgICAgICAgICAgICBc
CisgICAgICAgIFVOTUFQX0RPTUFJTl9QQUdFKGwxdCk7ICAgICAgICAgICAgICAgICAgICAgXAor
ICAgICAgICBsMWU7IH0pCisKKyNkZWZpbmUgbDJlX2Zyb21fbDNlKGwzZSwgb2ZmKSAoeyAgICAg
ICAgICAgICAgICAgICBcCisgICAgICAgIGwyX3BnZW50cnlfdCAqbDJ0ID0gbWFwX2wydF9mcm9t
X2wzZShsM2UpOyAgXAorICAgICAgICBsMl9wZ2VudHJ5X3QgbDJlID0gbDJ0W29mZl07ICAgICAg
ICAgICAgICAgIFwKKyAgICAgICAgVU5NQVBfRE9NQUlOX1BBR0UobDJ0KTsgICAgICAgICAgICAg
ICAgICAgICBcCisgICAgICAgIGwyZTsgfSkKKworI2RlZmluZSBsM2VfZnJvbV9sNGUobDRlLCBv
ZmYpICh7ICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBt
YXBfbDN0X2Zyb21fbDRlKGw0ZSk7ICBcCisgICAgICAgIGwzX3BnZW50cnlfdCBsM2UgPSBsM3Rb
b2ZmXTsgICAgICAgICAgICAgICAgXAorICAgICAgICBVTk1BUF9ET01BSU5fUEFHRShsM3QpOyAg
ICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgbDNlOyB9KQorCiAvKiBHaXZlbiBhIHZpcnR1
YWwgYWRkcmVzcywgZ2V0IGFuIGVudHJ5IG9mZnNldCBpbnRvIGEgcGFnZSB0YWJsZS4gKi8KICNk
ZWZpbmUgbDFfdGFibGVfb2Zmc2V0KGEpICAgICAgICAgXAogICAgICgoKGEpID4+IEwxX1BBR0VU
QUJMRV9TSElGVCkgJiAoTDFfUEFHRVRBQkxFX0VOVFJJRVMgLSAxKSkKLS0gCjIuMjQuMS5BTVpO
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
