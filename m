Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6B3C1F23
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1F-0007fx-W5; Mon, 30 Sep 2019 10:35:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1E-0007ex-Rq
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:04 +0000
X-Inumbo-ID: ee832c70-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id ee832c70-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839690; x=1601375690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HOlQh5k1oNPRVyL9EqE56c5arborDHenMa3MWF/9pfs=;
 b=HY+nhe6Ib1orxn5CDGGEDstp8oZoYsU4k+VAuaeQgRdc36v3TmrhQA4x
 d5N8xfLLpT4G2W1nRTcTuZW0jAzrPFYZmic2o98gr3dHwt3lawHzsryTQ
 hVICG7pzDwz4HeqCDZjtCfiWPI+npGlaLSRcfwG1AKauR4Zh+4sreAam5 c=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="754242253"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Sep 2019 10:34:50 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id CAAA8282413; Mon, 30 Sep 2019 10:34:48 +0000 (UTC)
Received: from EX13D09UEE001.ant.amazon.com (10.43.62.205) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:20 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D09UEE001.ant.amazon.com (10.43.62.205) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:20 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:19 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:24 +0100
Message-ID: <ff3a1e6ce710a7a29c6c254490dcba72efbd5f46.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 32/55] efi: switch EFI L4 table to use new
 APIs
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoaXMgcmVxdWlyZXMgc3Rvcmlu
ZyB0aGUgTUZOIGluc3RlYWQgb2YgbGluZWFyIGFkZHJlc3Mgb2YgdGhlIEw0CnRhYmxlLiBBZGp1
c3QgY29kZSBhY2NvcmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2VmaS9ydW50aW1lLmggfCAxMiArKysrKysrKyst
LS0KIHhlbi9jb21tb24vZWZpL2Jvb3QuYyAgICAgIHwgIDggKysrKysrLS0KIHhlbi9jb21tb24v
ZWZpL2VmaS5oICAgICAgIHwgIDMgKystCiB4ZW4vY29tbW9uL2VmaS9ydW50aW1lLmMgICB8ICA4
ICsrKystLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9lZmkvcnVudGltZS5oIGIveGVuL2FyY2gv
eDg2L2VmaS9ydW50aW1lLmgKaW5kZXggZDllYjhmNWMyNy4uMjc3ZDIzNzk1MyAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2VmaS9ydW50aW1lLmgKKysrIGIveGVuL2FyY2gveDg2L2VmaS9ydW50
aW1lLmgKQEAgLTIsMTEgKzIsMTcgQEAKICNpbmNsdWRlIDxhc20vbWMxNDY4MThydGMuaD4KIAog
I2lmbmRlZiBDT01QQVQKLWw0X3BnZW50cnlfdCAqX19yZWFkX21vc3RseSBlZmlfbDRfcGd0YWJs
ZTsKK21mbl90IF9fcmVhZF9tb3N0bHkgZWZpX2w0X21mbiA9IElOVkFMSURfTUZOX0lOSVRJQUxJ
WkVSOwogCiB2b2lkIGVmaV91cGRhdGVfbDRfcGd0YWJsZSh1bnNpZ25lZCBpbnQgbDRpZHgsIGw0
X3BnZW50cnlfdCBsNGUpCiB7Ci0gICAgaWYgKCBlZmlfbDRfcGd0YWJsZSApCi0gICAgICAgIGw0
ZV93cml0ZShlZmlfbDRfcGd0YWJsZSArIGw0aWR4LCBsNGUpOworICAgIGlmICggIW1mbl9lcShl
ZmlfbDRfbWZuLCBJTlZBTElEX01GTikgKQorICAgIHsKKyAgICAgICAgbDRfcGdlbnRyeV90ICps
NHQ7CisKKyAgICAgICAgbDR0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGVmaV9sNF9tZm4pOwor
ICAgICAgICBsNGVfd3JpdGUobDR0ICsgbDRpZHgsIGw0ZSk7CisgICAgICAgIFVOTUFQX1hFTl9Q
QUdFVEFCTEVfTkVXKGw0dCk7CisgICAgfQogfQogI2VuZGlmCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL2VmaS9ib290LmMgYi94ZW4vY29tbW9uL2VmaS9ib290LmMKaW5kZXggMzg2ODI5M2QwNi4u
ZjU1ZDZhNmQ3NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jCisrKyBiL3hlbi9j
b21tb24vZWZpL2Jvb3QuYwpAQCAtMTQ4OCw2ICsxNDg4LDcgQEAgdm9pZCBfX2luaXQgZWZpX2lu
aXRfbWVtb3J5KHZvaWQpCiAgICAgICAgIHVuc2lnbmVkIGludCBwcm90OwogICAgIH0gKmV4dHJh
LCAqZXh0cmFfaGVhZCA9IE5VTEw7CiAjZW5kaWYKKyAgICBsNF9wZ2VudHJ5X3QgKmVmaV9sNF9w
Z3RhYmxlOwogCiAgICAgZnJlZV9lYm1hbGxvY191bnVzZWRfbWVtKCk7CiAKQEAgLTE2MDMsOCAr
MTYwNCw5IEBAIHZvaWQgX19pbml0IGVmaV9pbml0X21lbW9yeSh2b2lkKQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbWRlc2NfdmVyLCBlZmlfbWVtbWFwKTsKICNlbHNlCiAgICAg
LyogU2V0IHVwIDE6MSBwYWdlIHRhYmxlcyB0byBkbyBydW50aW1lIGNhbGxzIGluICJwaHlzaWNh
bCIgbW9kZS4gKi8KLSAgICBlZmlfbDRfcGd0YWJsZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsK
LSAgICBCVUdfT04oIWVmaV9sNF9wZ3RhYmxlKTsKKyAgICBlZmlfbDRfbWZuID0gYWxsb2NfeGVu
X3BhZ2V0YWJsZV9uZXcoKTsKKyAgICBCVUdfT04obWZuX2VxKGVmaV9sNF9tZm4sIElOVkFMSURf
TUZOKSk7CisgICAgZWZpX2w0X3BndGFibGUgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcoZWZpX2w0
X21mbik7CiAgICAgY2xlYXJfcGFnZShlZmlfbDRfcGd0YWJsZSk7CiAKICAgICBjb3B5X21hcHBp
bmcoZWZpX2w0X3BndGFibGUsIDAsIG1heF9wYWdlLCByYW1fcmFuZ2VfdmFsaWQpOwpAQCAtMTcw
Myw2ICsxNzA1LDggQEAgdm9pZCBfX2luaXQgZWZpX2luaXRfbWVtb3J5KHZvaWQpCiAgICAgICAg
ICAgaSA8IGw0X3RhYmxlX29mZnNldChESVJFQ1RNQVBfVklSVF9FTkQpOyArK2kgKQogICAgICAg
ICBlZmlfbDRfcGd0YWJsZVtpXSA9IGlkbGVfcGdfdGFibGVbaV07CiAjZW5kaWYKKworICAgIFVO
TUFQX1hFTl9QQUdFVEFCTEVfTkVXKGVmaV9sNF9wZ3RhYmxlKTsKIH0KICNlbmRpZgogCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL2VmaS9lZmkuaCBiL3hlbi9jb21tb24vZWZpL2VmaS5oCmluZGV4
IDZiOWM1NmVhZDEuLjEzOWI2NjBlZDcgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZWZpL2VmaS5o
CisrKyBiL3hlbi9jb21tb24vZWZpL2VmaS5oCkBAIC02LDYgKzYsNyBAQAogI2luY2x1ZGUgPGVm
aS9lZmljYXBzdWxlLmg+CiAjaW5jbHVkZSA8ZWZpL2VmaWFwaS5oPgogI2luY2x1ZGUgPHhlbi9l
ZmkuaD4KKyNpbmNsdWRlIDx4ZW4vbW0uaD4KICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4KICNp
bmNsdWRlIDxhc20vcGFnZS5oPgogCkBAIC0yOSw3ICszMCw3IEBAIGV4dGVybiBVSU5UTiBlZmlf
bWVtbWFwX3NpemUsIGVmaV9tZGVzY19zaXplOwogZXh0ZXJuIHZvaWQgKmVmaV9tZW1tYXA7CiAK
ICNpZmRlZiBDT05GSUdfWDg2Ci1leHRlcm4gbDRfcGdlbnRyeV90ICplZmlfbDRfcGd0YWJsZTsK
K2V4dGVybiBtZm5fdCBlZmlfbDRfbWZuOwogI2VuZGlmCiAKIGV4dGVybiBjb25zdCBzdHJ1Y3Qg
ZWZpX3BjaV9yb20gKmVmaV9wY2lfcm9tczsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL3J1
bnRpbWUuYyBiL3hlbi9jb21tb24vZWZpL3J1bnRpbWUuYwppbmRleCBhYjUzZWJjYzU1Li5kNGIw
NGEwNGY0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2VmaS9ydW50aW1lLmMKKysrIGIveGVuL2Nv
bW1vbi9lZmkvcnVudGltZS5jCkBAIC04NSw3ICs4NSw3IEBAIHN0cnVjdCBlZmlfcnNfc3RhdGUg
ZWZpX3JzX2VudGVyKHZvaWQpCiAgICAgc3RhdGljIGNvbnN0IHUzMiBteGNzciA9IE1YQ1NSX0RF
RkFVTFQ7CiAgICAgc3RydWN0IGVmaV9yc19zdGF0ZSBzdGF0ZSA9IHsgLmNyMyA9IDAgfTsKIAot
ICAgIGlmICggIWVmaV9sNF9wZ3RhYmxlICkKKyAgICBpZiAoIG1mbl9lcShlZmlfbDRfbWZuLCBJ
TlZBTElEX01GTikgKQogICAgICAgICByZXR1cm4gc3RhdGU7CiAKICAgICBzdGF0ZS5jcjMgPSBy
ZWFkX2NyMygpOwpAQCAtMTExLDcgKzExMSw3IEBAIHN0cnVjdCBlZmlfcnNfc3RhdGUgZWZpX3Jz
X2VudGVyKHZvaWQpCiAgICAgICAgIGxnZHQoJmdkdF9kZXNjKTsKICAgICB9CiAKLSAgICBzd2l0
Y2hfY3IzX2NyNCh2aXJ0X3RvX21hZGRyKGVmaV9sNF9wZ3RhYmxlKSwgcmVhZF9jcjQoKSk7Cisg
ICAgc3dpdGNoX2NyM19jcjQobWZuX3RvX21hZGRyKGVmaV9sNF9tZm4pLCByZWFkX2NyNCgpKTsK
IAogICAgIHJldHVybiBzdGF0ZTsKIH0KQEAgLTE0MCw5ICsxNDAsOSBAQCB2b2lkIGVmaV9yc19s
ZWF2ZShzdHJ1Y3QgZWZpX3JzX3N0YXRlICpzdGF0ZSkKIAogYm9vbCBlZmlfcnNfdXNpbmdfcGd0
YWJsZXModm9pZCkKIHsKLSAgICByZXR1cm4gZWZpX2w0X3BndGFibGUgJiYKKyAgICByZXR1cm4g
IW1mbl9lcShlZmlfbDRfbWZuLCBJTlZBTElEX01GTikgJiYKICAgICAgICAgICAgKHNtcF9wcm9j
ZXNzb3JfaWQoKSA9PSBlZmlfcnNfb25fY3B1KSAmJgotICAgICAgICAgICAocmVhZF9jcjMoKSA9
PSB2aXJ0X3RvX21hZGRyKGVmaV9sNF9wZ3RhYmxlKSk7CisgICAgICAgICAgIChyZWFkX2NyMygp
ID09IG1mbl90b19tYWRkcihlZmlfbDRfbWZuKSk7CiB9CiAKIHVuc2lnbmVkIGxvbmcgZWZpX2dl
dF90aW1lKHZvaWQpCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
