Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587CC1F49
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:39:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt32-0002Zh-EW; Mon, 30 Sep 2019 10:36:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2z-0002Vy-VG
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:53 +0000
X-Inumbo-ID: 204a6cd2-e36e-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 204a6cd2-e36e-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839774; x=1601375774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=zFXi/k64yLkM6tHejVb24ikKLaRDehabVXLDoC8Mbn0=;
 b=JcYC3qBF1+EJV9lU5ZsFyN1NKb+2msnRdSpurFG357t30z/ziT1dxAVX
 waRPYLKKb4BF0L2ZNBZ1syjwmqkleGTgzs42a1Ml9Wwc5MyLHML2e/+eY
 JZGu9PdbH/K0rs8JNhH2WGP2f9ivoZLUlTLf0XcISoEyRw7MH+GBC+v2m M=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="838005698"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Sep 2019 10:35:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9BB8FA21DC; Mon, 30 Sep 2019 10:34:59 +0000 (UTC)
Received: from EX13D05UEE003.ant.amazon.com (10.43.62.168) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:40 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D05UEE003.ant.amazon.com (10.43.62.168) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:39 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:38 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:45 +0100
Message-ID: <df032470e631f8f3e8cdf7b1289e1ca204692652.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 53/55] x86/mm: drop old page table APIs
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCk5vdyB0aGF0IHdlJ3ZlIHN3aXRj
aGVkIGFsbCB1c2VycyB0byB0aGUgbmV3IEFQSXMsIHRoZSBvbGQgb25lcyBhcmVuJ3QKbmVlZGVk
IGFueW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgfCAgMiAtLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdl
LmggfCAgNSAtLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDVjMWQ2NWQy
NjcuLmM5YmUyMzlkNTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCkBAIC00ODUwLDIyICs0ODUwLDYgQEAgaW50IG1tY2ZnX2ludGVyY2VwdF93
cml0ZSgKICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwogfQogCi12b2lkICphbGxvY194ZW5fcGFn
ZXRhYmxlKHZvaWQpCi17Ci0gICAgbWZuX3QgbWZuOwotCi0gICAgbWZuID0gYWxsb2NfeGVuX3Bh
Z2V0YWJsZV9uZXcoKTsKLSAgICBBU1NFUlQoIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSk7Ci0K
LSAgICByZXR1cm4gbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbik7Ci19Ci0KLXZvaWQgZnJlZV94
ZW5fcGFnZXRhYmxlKHZvaWQgKnYpCi17Ci0gICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NU
QVRFX2Vhcmx5X2Jvb3QgKQotICAgICAgICBmcmVlX3hlbl9wYWdldGFibGVfbmV3KHZpcnRfdG9f
bWZuKHYpKTsKLX0KLQogbWZuX3QgYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXcodm9pZCkKIHsKICAg
ICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCApCmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKaW5k
ZXggMTJhMTBiMjcwZC4uNGZiNzlhYjhmMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaApAQCAtNjMxLDggKzYzMSw2IEBA
IGludCBhcmNoX2FjcXVpcmVfcmVzb3VyY2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50
IHR5cGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9mcmFtZXMs
IHhlbl9wZm5fdCBtZm5fbGlzdFtdKTsKIAogLyogQWxsb2NhdG9yIGZ1bmN0aW9ucyBmb3IgWGVu
IHBhZ2V0YWJsZXMuICovCi12b2lkICphbGxvY194ZW5fcGFnZXRhYmxlKHZvaWQpOwotdm9pZCBm
cmVlX3hlbl9wYWdldGFibGUodm9pZCAqdik7CiBtZm5fdCBhbGxvY194ZW5fcGFnZXRhYmxlX25l
dyh2b2lkKTsKIHZvaWQgKm1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pOwogdm9pZCB1
bm1hcF94ZW5fcGFnZXRhYmxlX25ldyh2b2lkICp2KTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvcGFnZS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKaW5kZXggMDVhOGIx
ZWZhNi4uOTA2ZWM3MDFhMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmgKQEAgLTE4NywxMSArMTg3LDYgQEAgc3Rh
dGljIGlubGluZSBsNF9wZ2VudHJ5X3QgbDRlX2Zyb21fcGFkZHIocGFkZHJfdCBwYSwgdW5zaWdu
ZWQgaW50IGZsYWdzKQogI2RlZmluZSBsNGVfaGFzX2NoYW5nZWQoeCx5LGZsYWdzKSBcCiAgICAg
KCAhISgoKHgpLmw0IF4gKHkpLmw0KSAmICgoUEFERFJfTUFTSyZQQUdFX01BU0spfHB1dF9wdGVf
ZmxhZ3MoZmxhZ3MpKSkgKQogCi0vKiBQYWdldGFibGUgd2Fsa2luZy4gKi8KLSNkZWZpbmUgbDJl
X3RvX2wxZSh4KSAgICAgICAgICAgICAgKChsMV9wZ2VudHJ5X3QgKilfX3ZhKGwyZV9nZXRfcGFk
ZHIoeCkpKQotI2RlZmluZSBsM2VfdG9fbDJlKHgpICAgICAgICAgICAgICAoKGwyX3BnZW50cnlf
dCAqKV9fdmEobDNlX2dldF9wYWRkcih4KSkpCi0jZGVmaW5lIGw0ZV90b19sM2UoeCkgICAgICAg
ICAgICAgICgobDNfcGdlbnRyeV90ICopX192YShsNGVfZ2V0X3BhZGRyKHgpKSkKLQogI2RlZmlu
ZSBtYXBfbDF0X2Zyb21fbDJlKHgpICAgICAgICAobDFfcGdlbnRyeV90ICopbWFwX2RvbWFpbl9w
YWdlKGwyZV9nZXRfbWZuKHgpKQogI2RlZmluZSBtYXBfbDJ0X2Zyb21fbDNlKHgpICAgICAgICAo
bDJfcGdlbnRyeV90ICopbWFwX2RvbWFpbl9wYWdlKGwzZV9nZXRfbWZuKHgpKQogI2RlZmluZSBt
YXBfbDN0X2Zyb21fbDRlKHgpICAgICAgICAobDNfcGdlbnRyeV90ICopbWFwX2RvbWFpbl9wYWdl
KGw0ZV9nZXRfbWZuKHgpKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
