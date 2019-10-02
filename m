Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C535BC8FBC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:21:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiHj-0000Rd-Ch; Wed, 02 Oct 2019 17:19:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMxB=X3=amazon.com=prvs=17142d732=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFiHh-0000RP-Fv
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:19:29 +0000
X-Inumbo-ID: ca23a3ec-e538-11e9-bf31-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id ca23a3ec-e538-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1570036769; x=1601572769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Dlve+Wyb9tqo/66ImCfcUmRynkVkhYK/y9vCkHe0JZE=;
 b=ClC9h2Msdw6qF5iJ959bZ5E6KcBL/+KkRDZ9qj8OUaw/0BsNVeSJ4izv
 N9XYWas06/EnoiW4H3ZJ95VnAYR3NPrbUV48F9R85x0kUyXvDtZ4C1tJF
 mUwv3AU7HBthhcQK8mpT6YkvGutLMuGFBneCKDsKlWRM/NLuFWvuuItCk 0=;
X-IronPort-AV: E=Sophos;i="5.67,249,1566864000"; d="scan'208";a="706204314"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 02 Oct 2019 17:17:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8C493A062E; Wed,  2 Oct 2019 17:16:58 +0000 (UTC)
Received: from EX13D23UEE002.ant.amazon.com (10.43.62.97) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:16:58 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D23UEE002.ant.amazon.com (10.43.62.97) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:16:58 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 2 Oct 2019 17:16:57 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 2 Oct 2019 18:16:47 +0100
Message-ID: <177843fa29560291b8af90db5daffe4852ea96b7.1570034362.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570034362.git.hongyax@amazon.com>
References: <cover.1570034362.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 2/9] x86: introduce a new set of APIs to
 manage Xen page tables
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIGFyZSBnb2luZyB0byBzd2l0
Y2ggdG8gdXNpbmcgZG9taGVhcCBwYWdlIGZvciBwYWdlIHRhYmxlcy4KQSBuZXcgc2V0IG9mIEFQ
SXMgaXMgaW50cm9kdWNlZCB0byBhbGxvY2F0ZSwgbWFwLCB1bm1hcCBhbmQgZnJlZSBwYWdlcwpm
b3IgcGFnZSB0YWJsZXMuCgpUaGUgYWxsb2NhdGlvbiBhbmQgZGVhbGxvY2F0aW9uIHdvcmsgb24g
bWZuX3QgYnV0IG5vdCBwYWdlX2luZm8sCmJlY2F1c2UgdGhleSBhcmUgcmVxdWlyZWQgdG8gd29y
ayBldmVuIGJlZm9yZSBmcmFtZSB0YWJsZSBpcyBzZXQgdXAuCgpJbXBsZW1lbnQgdGhlIG9sZCBm
dW5jdGlvbnMgd2l0aCB0aGUgbmV3IG9uZXMuIFdlIHdpbGwgcmV3cml0ZSwgc2l0ZQpieSBzaXRl
LCBvdGhlciBtbSBmdW5jdGlvbnMgdGhhdCBtYW5pcHVsYXRlIHBhZ2UgdGFibGVzIHRvIHVzZSB0
aGUgbmV3CkFQSXMuCgpOb3RlIHRoZXNlIG5ldyBBUElzIHN0aWxsIHVzZSB4ZW5oZWFwIHBhZ2Ug
dW5kZXJuZWF0aCBhbmQgbm8gYWN0dWFsCm1hcCBhbmQgdW5tYXAgaXMgZG9uZSBzbyB0aGF0IHdl
IGRvbid0IGJyZWFrIHhlbiBoYWxmIHdheS4gVGhleSB3aWxsCmJlIHN3aXRjaGVkIHRvIHVzZSBk
b21oZWFwIGFuZCBkeW5hbWljIG1hcHBpbmdzIHdoZW4gdXNhZ2Ugb2Ygb2xkIEFQSXMKaXMgZWxp
bWluYXRlZC4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkIGluIHRoaXMgcGF0Y2guCgpT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNo
L3g4Ni9tbS5jICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIHwgMTEgKysrKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDk5ODE2ZmM2N2MuLjg4
YTE1ZWNkZjIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9tbS5jCkBAIC0xMTksNiArMTE5LDcgQEAKICNpbmNsdWRlIDx4ZW4vZWZpLmg+CiAjaW5jbHVk
ZSA8eGVuL2dyYW50X3RhYmxlLmg+CiAjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgorI2luY2x1
ZGUgPHhlbi9tbS5oPgogI2luY2x1ZGUgPGFzbS9wYWdpbmcuaD4KICNpbmNsdWRlIDxhc20vc2hh
ZG93Lmg+CiAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KQEAgLTQ4NDcsMjIgKzQ4NDgsNTAgQEAgaW50
IG1tY2ZnX2ludGVyY2VwdF93cml0ZSgKIH0KIAogdm9pZCAqYWxsb2NfeGVuX3BhZ2V0YWJsZSh2
b2lkKQoreworICAgIG1mbl90IG1mbjsKKworICAgIG1mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVf
bmV3KCk7CisgICAgQVNTRVJUKCFtZm5fZXEobWZuLCBJTlZBTElEX01GTikpOworCisgICAgcmV0
dXJuIG1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOworfQorCit2b2lkIGZyZWVfeGVuX3BhZ2V0
YWJsZSh2b2lkICp2KQoreworICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJs
eV9ib290ICkKKyAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyh2aXJ0X3RvX21mbih2KSk7
Cit9CisKK21mbl90IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KHZvaWQpCiB7CiAgICAgaWYgKCBz
eXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgKQogICAgIHsKICAgICAgICAgdm9p
ZCAqcHRyID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7CiAKICAgICAgICAgQlVHX09OKCFoYXJkd2Fy
ZV9kb21haW4gJiYgIXB0cik7Ci0gICAgICAgIHJldHVybiBwdHI7CisgICAgICAgIHJldHVybiB2
aXJ0X3RvX21mbihwdHIpOwogICAgIH0KIAotICAgIHJldHVybiBtZm5fdG9fdmlydChtZm5feChh
bGxvY19ib290X3BhZ2VzKDEsIDEpKSk7CisgICAgcmV0dXJuIGFsbG9jX2Jvb3RfcGFnZXMoMSwg
MSk7CiB9CiAKLXZvaWQgZnJlZV94ZW5fcGFnZXRhYmxlKHZvaWQgKnYpCit2b2lkICptYXBfeGVu
X3BhZ2V0YWJsZV9uZXcobWZuX3QgbWZuKQogewotICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZ
U19TVEFURV9lYXJseV9ib290ICkKLSAgICAgICAgZnJlZV94ZW5oZWFwX3BhZ2Uodik7CisgICAg
cmV0dXJuIG1mbl90b192aXJ0KG1mbl94KG1mbikpOworfQorCisvKiB2IGNhbiBwb2ludCB0byBh
biBlbnRyeSB3aXRoaW4gYSB0YWJsZSBvciBiZSBOVUxMICovCit2b2lkIHVubWFwX3hlbl9wYWdl
dGFibGVfbmV3KHZvaWQgKnYpCit7CisgICAgLyogWFhYIHN0aWxsIHVzaW5nIHhlbmhlYXAgcGFn
ZSwgbm8gbmVlZCB0byBkbyBhbnl0aGluZy4gICovCit9CisKKy8qIG1mbiBjYW4gYmUgSU5WQUxJ
RF9NRk4gKi8KK3ZvaWQgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pCit7CisgICAg
aWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgJiYgIW1mbl9lcShtZm4s
IElOVkFMSURfTUZOKSApCisgICAgICAgIGZyZWVfeGVuaGVhcF9wYWdlKG1mbl90b192aXJ0KG1m
bl94KG1mbikpKTsKIH0KIAogc3RhdGljIERFRklORV9TUElOTE9DSyhtYXBfcGdkaXJfbG9jayk7
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20t
eDg2L21tLmgKaW5kZXggMjgwMDEwNjMyNy4uODAxNzNlYjRjMyAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaApAQCAtNjMz
LDYgKzYzMywxNyBAQCBpbnQgYXJjaF9hY3F1aXJlX3Jlc291cmNlKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCB0eXBlLAogLyogQWxsb2NhdG9yIGZ1bmN0aW9ucyBmb3IgWGVuIHBhZ2V0
YWJsZXMuICovCiB2b2lkICphbGxvY194ZW5fcGFnZXRhYmxlKHZvaWQpOwogdm9pZCBmcmVlX3hl
bl9wYWdldGFibGUodm9pZCAqdik7CittZm5fdCBhbGxvY194ZW5fcGFnZXRhYmxlX25ldyh2b2lk
KTsKK3ZvaWQgKm1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pOwordm9pZCB1bm1hcF94
ZW5fcGFnZXRhYmxlX25ldyh2b2lkICp2KTsKK3ZvaWQgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyht
Zm5fdCBtZm4pOworCisjZGVmaW5lIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHB0cikgICAgXAor
ICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgdW5tYXBf
eGVuX3BhZ2V0YWJsZV9uZXcoKHB0cikpOyBcCisgICAgICAgIChwdHIpID0gTlVMTDsgICAgICAg
ICAgICAgICAgICAgXAorICAgIH0gd2hpbGUgKDApCisKIGwxX3BnZW50cnlfdCAqdmlydF90b194
ZW5fbDFlKHVuc2lnbmVkIGxvbmcgdik7CiAKICNlbmRpZiAvKiBfX0FTTV9YODZfTU1fSF9fICov
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
