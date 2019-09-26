Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE02BEEDB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQO0-0004eB-UJ; Thu, 26 Sep 2019 09:48:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNy-0004bU-O5
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:30 +0000
X-Inumbo-ID: c6a914e0-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id c6a914e0-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491301; x=1601027301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HOlQh5k1oNPRVyL9EqE56c5arborDHenMa3MWF/9pfs=;
 b=IlM/KF4qOHtiHobdIhoy4X9IQKrT7Z/OOlTfJ6iGL3z10hBx4FYvTdTs
 6dvfDM/kb539B7sKCllwfWiawVSFIPMfU+QULXjtvj9A4X9gVWYxyhJFB
 Zhv0+joeWcrUveDuNYEo6EEG1TZbRZbnoF3uOFQ+hkLb+BE1fjn55D5BK M=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535108"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:48:21 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 53C5DA299F; Thu, 26 Sep 2019 09:48:19 +0000 (UTC)
Received: from EX13D18UWA004.ant.amazon.com (10.43.160.45) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:53 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D18UWA004.ant.amazon.com (10.43.160.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:52 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:51 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:56 +0100
Message-ID: <8f0acf3643328ce680cb9aac0eccb7d724fd1b40.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 33/84] efi: switch EFI L4 table to use new
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
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
