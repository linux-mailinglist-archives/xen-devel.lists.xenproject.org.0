Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4CC1F2A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2D-00010U-5e; Mon, 30 Sep 2019 10:36:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2B-0000z7-Ug
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:03 +0000
X-Inumbo-ID: 05795f62-e36e-11e9-8628-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 05795f62-e36e-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 10:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839729; x=1601375729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=hTkmNlwsOjF0Hl2l2Hvic+lIfqYsmmXAm8fsLU5GbNQ=;
 b=Cgk7xJLUvaqCFgCf9Bx9b0BkHTkDY22STw6P84tLZeDaaOcC9APvlnxd
 pMTq9G6q+jT9rQLT/3heTek6ZpGHOzh5+qpNqOrM6fh55UuJLdis51bo1
 tKhN+Mlwu/0kAL4bRQRBdnWAKzztWCKJWJMXBxNZIBAH9aQXygsw9vW3O 4=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="838005541"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Sep 2019 10:34:29 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id CE25CA2EBA; Mon, 30 Sep 2019 10:34:16 +0000 (UTC)
Received: from EX13D15UEE002.ant.amazon.com (10.43.62.80) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:02 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D15UEE002.ant.amazon.com (10.43.62.80) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:01 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:01 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:06 +0100
Message-ID: <12674b11445769ccf7aae2d732580a711bc25bd2.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 14/55] x86/mm: rewrite xen_to_virt_l2e
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJld3JpdGUgdGhhdCBmdW5jdGlv
biB0byB1c2UgdGhlIG5ldyBBUElzLiBNb2RpZnkgaXRzIGNhbGxlcnMgdG8gdW5tYXAKdGhlIHBv
aW50ZXIgcmV0dXJuZWQuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJj
aC94ODYvbW0uYwppbmRleCAxZGNkNDI4OWQxLi5hZDBkN2EwYjgwIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtNDk1Miw2ICs0OTUyLDEw
IEBAIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wzZSh1bnNpZ25lZCBsb25nIHYp
CiAgICAgcmV0dXJuIHBsM2U7CiB9CiAKKy8qCisgKiBHaXZlbiBhIHZpcnR1YWwgYWRkcmVzcywg
cmV0dXJuIGEgcG9pbnRlciB0byB4ZW4ncyBMMiBlbnRyeS4gQ2FsbGVyCisgKiBuZWVkcyB0byB1
bm1hcCB0aGUgcG9pbnRlci4KKyAqLwogc3RhdGljIGwyX3BnZW50cnlfdCAqdmlydF90b194ZW5f
bDJlKHVuc2lnbmVkIGxvbmcgdikKIHsKICAgICBsM19wZ2VudHJ5X3QgKnBsM2U7CkBAIC00OTY0
LDI3ICs0OTY4LDQ0IEBAIHN0YXRpYyBsMl9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wyZSh1bnNp
Z25lZCBsb25nIHYpCiAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJF
U0VOVCkgKQogICAgIHsKICAgICAgICAgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRlID4gU1lT
X1NUQVRFX2Jvb3Q7Ci0gICAgICAgIGwyX3BnZW50cnlfdCAqbDJ0ID0gYWxsb2NfeGVuX3BhZ2V0
YWJsZSgpOworICAgICAgICBsMl9wZ2VudHJ5X3QgKmwydDsKKyAgICAgICAgbWZuX3QgbWZuOwog
Ci0gICAgICAgIGlmICggIWwydCApCisgICAgICAgIG1mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVf
bmV3KCk7CisgICAgICAgIGlmICggbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKICAgICAgICAg
ICAgIGdvdG8gb3V0OwogCisgICAgICAgIGwydCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm4p
OworCiAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAgICBzcGluX2xvY2soJm1hcF9w
Z2Rpcl9sb2NrKTsKICAgICAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0Vf
UFJFU0VOVCkgKQogICAgICAgICB7CiAgICAgICAgICAgICBjbGVhcl9wYWdlKGwydCk7Ci0gICAg
ICAgICAgICBsM2Vfd3JpdGUocGwzZSwgbDNlX2Zyb21fcGFkZHIoX19wYShsMnQpLCBfX1BBR0Vf
SFlQRVJWSVNPUikpOworICAgICAgICAgICAgbDNlX3dyaXRlKHBsM2UsIGwzZV9mcm9tX21mbiht
Zm4sIF9fUEFHRV9IWVBFUlZJU09SKSk7CisgICAgICAgICAgICBwbDJlID0gbDJ0ICsgbDJfdGFi
bGVfb2Zmc2V0KHYpOwogICAgICAgICAgICAgbDJ0ID0gTlVMTDsKICAgICAgICAgfQogICAgICAg
ICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2Nr
KTsKKwogICAgICAgICBpZiAoIGwydCApCi0gICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUo
bDJ0KTsKKyAgICAgICAgeworICAgICAgICAgICAgQVNTRVJUKCFwbDJlKTsKKyAgICAgICAgICAg
IEFTU0VSVCghbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pKTsKKyAgICAgICAgICAgIFVOTUFQX1hF
Tl9QQUdFVEFCTEVfTkVXKGwydCk7CisgICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGVfbmV3
KG1mbik7CisgICAgICAgIH0KICAgICB9CiAKICAgICBCVUdfT04obDNlX2dldF9mbGFncygqcGwz
ZSkgJiBfUEFHRV9QU0UpOwotICAgIHBsMmUgPSBsM2VfdG9fbDJlKCpwbDNlKSArIGwyX3RhYmxl
X29mZnNldCh2KTsKKworICAgIGlmICggIXBsMmUgKQorICAgIHsKKyAgICAgICAgQVNTRVJUKGwz
ZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCk7CisgICAgICAgIHBsMmUgPSAobDJf
cGdlbnRyeV90ICopbWFwX3hlbl9wYWdldGFibGVfbmV3KGwzZV9nZXRfbWZuKCpwbDNlKSkKKyAg
ICAgICAgICAgICsgbDJfdGFibGVfb2Zmc2V0KHYpOworICAgIH0KIAogIG91dDoKICAgICBVTk1B
UF9YRU5fUEFHRVRBQkxFX05FVyhwbDNlKTsKQEAgLTQ5OTQsMTAgKzUwMTUsMTEgQEAgc3RhdGlj
IGwyX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDJlKHVuc2lnbmVkIGxvbmcgdikKIGwxX3BnZW50
cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVkIGxvbmcgdikKIHsKICAgICBsMl9wZ2VudHJ5
X3QgKnBsMmU7CisgICAgbDFfcGdlbnRyeV90ICpwbDFlID0gTlVMTDsKIAogICAgIHBsMmUgPSB2
aXJ0X3RvX3hlbl9sMmUodik7CiAgICAgaWYgKCAhcGwyZSApCi0gICAgICAgIHJldHVybiBOVUxM
OworICAgICAgICBnb3RvIG91dDsKIAogICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAm
IF9QQUdFX1BSRVNFTlQpICkKICAgICB7CkBAIC01MDA1LDcgKzUwMjcsNyBAQCBsMV9wZ2VudHJ5
X3QgKnZpcnRfdG9feGVuX2wxZSh1bnNpZ25lZCBsb25nIHYpCiAgICAgICAgIGwxX3BnZW50cnlf
dCAqbDF0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwogCiAgICAgICAgIGlmICggIWwxdCApCi0g
ICAgICAgICAgICByZXR1cm4gTlVMTDsKKyAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICBp
ZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAg
ICAgICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKQEAg
LTUwMjEsNyArNTA0MywxMSBAQCBsMV9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wxZSh1bnNpZ25l
ZCBsb25nIHYpCiAgICAgfQogCiAgICAgQlVHX09OKGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BB
R0VfUFNFKTsKLSAgICByZXR1cm4gbDJlX3RvX2wxZSgqcGwyZSkgKyBsMV90YWJsZV9vZmZzZXQo
dik7CisgICAgcGwxZSA9IGwyZV90b19sMWUoKnBsMmUpICsgbDFfdGFibGVfb2Zmc2V0KHYpOwor
Cisgb3V0OgorICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsMmUpOworICAgIHJldHVybiBw
bDFlOwogfQogCiAvKiBDb252ZXJ0IHRvIGZyb20gc3VwZXJwYWdlLW1hcHBpbmcgZmxhZ3MgZm9y
IG1hcF9wYWdlc190b194ZW4oKS4gKi8KQEAgLTUwNDUsNyArNTA3MSw3IEBAIGludCBtYXBfcGFn
ZXNfdG9feGVuKAogewogICAgIGJvb2wgbG9ja2luZyA9IHN5c3RlbV9zdGF0ZSA+IFNZU19TVEFU
RV9ib290OwogICAgIGwzX3BnZW50cnlfdCAqcGwzZSA9IE5VTEwsIG9sM2U7Ci0gICAgbDJfcGdl
bnRyeV90ICpwbDJlLCBvbDJlOworICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9IE5VTEwsIG9sMmU7
CiAgICAgbDFfcGdlbnRyeV90ICpwbDFlLCBvbDFlOwogICAgIHVuc2lnbmVkIGludCAgaTsKICAg
ICBpbnQgcmMgPSAtRU5PTUVNOwpAQCAtNTQyMSw2ICs1NDQ3LDcgQEAgaW50IG1hcF9wYWdlc190
b194ZW4oCiAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKICAg
ICAgICAgfQogICAgIGVuZF9vZl9sb29wOgorICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05F
VyhwbDJlKTsKICAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcocGwzZSk7CiAgICAgfQog
CkBAIC01NDI5LDYgKzU0NTYsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICByYyA9IDA7
CiAKICBvdXQ6CisgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcocGwyZSk7CiAgICAgVU5NQVBf
WEVOX1BBR0VUQUJMRV9ORVcocGwzZSk7CiAgICAgcmV0dXJuIHJjOwogfQotLSAKMi4xNy4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
