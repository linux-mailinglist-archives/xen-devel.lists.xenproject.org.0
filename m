Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0FB11308F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:14:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYBD-0003Zv-0m; Wed, 04 Dec 2019 17:11:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYBB-0003Zq-Fo
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:11:09 +0000
X-Inumbo-ID: 105d1328-16b9-11ea-8206-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 105d1328-16b9-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575479468; x=1607015468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=eTYMfNKFGd1QO/1jhYdMM6duQPKa4/DHgiQ8LFUbFwk=;
 b=cMM9KTSJc1I8V8k/T/39X7Mp1TlENFKJExZv9+czt++GairNRGvBi+tB
 +NQSUrFOpB9rL02KPVqzJ/6aNifgakxTqxVFWLqlzw4dr5z6Im7e7a3O7
 n+JNkm+NvXuobdT7eLS+u9Y2UpeoKDLpoJXxwiP6i+FLtOTWD/aGG45C3 s=;
IronPort-SDR: aead8iyIb2sTM4HMIC4juFd75F0Cy+XK3yd6XTi1/GmAZ9iiBCOgAw4LNPr326bR5uSoZDYz4v
 CNHOHVg9Dt/Q==
X-IronPort-AV: E=Sophos;i="5.69,278,1571702400"; 
   d="scan'208";a="6210793"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 04 Dec 2019 17:11:07 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id C26CDA235B; Wed,  4 Dec 2019 17:11:06 +0000 (UTC)
Received: from EX13D19UWA001.ant.amazon.com (10.43.160.169) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:06 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D19UWA001.ant.amazon.com (10.43.160.169) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:05 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 17:11:05 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:10:54 +0000
Message-ID: <fba262641f8233b4b9856cffeeb7a3ad0bad086a.1575477921.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575477921.git.hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 2/9] x86: introduce a new set of APIs to
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
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
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5
OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNvbT4KCi0tLQpDaGFuZ2VkIHNpbmNlIHYz
OgotIGNvbnN0IHF1YWxpZnkgdW5tYXBfeGVuX3BhZ2V0YWJsZV9uZXcoKS4KLSByZW1vdmUgcmVk
dW5kYW50IHBhcmVudGhlc2VzLgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICB8IDM5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9tbS5oIHwgMTEgKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCmluZGV4IDdkNGRkODBhODUuLmNhMzYyYWQ2MzggMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC0xMTksNiArMTE5LDcg
QEAKICNpbmNsdWRlIDx4ZW4vZWZpLmg+CiAjaW5jbHVkZSA8eGVuL2dyYW50X3RhYmxlLmg+CiAj
aW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgorI2luY2x1ZGUgPHhlbi9tbS5oPgogI2luY2x1ZGUg
PGFzbS9wYWdpbmcuaD4KICNpbmNsdWRlIDxhc20vc2hhZG93Lmg+CiAjaW5jbHVkZSA8YXNtL3Bh
Z2UuaD4KQEAgLTUwMjAsMjIgKzUwMjEsNTAgQEAgaW50IG1tY2ZnX2ludGVyY2VwdF93cml0ZSgK
IH0KIAogdm9pZCAqYWxsb2NfeGVuX3BhZ2V0YWJsZSh2b2lkKQoreworICAgIG1mbl90IG1mbjsK
KworICAgIG1mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7CisgICAgQVNTRVJUKCFtZm5f
ZXEobWZuLCBJTlZBTElEX01GTikpOworCisgICAgcmV0dXJuIG1hcF94ZW5fcGFnZXRhYmxlX25l
dyhtZm4pOworfQorCit2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KQoreworICAgIGlm
ICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290ICkKKyAgICAgICAgZnJlZV94
ZW5fcGFnZXRhYmxlX25ldyh2aXJ0X3RvX21mbih2KSk7Cit9CisKK21mbl90IGFsbG9jX3hlbl9w
YWdldGFibGVfbmV3KHZvaWQpCiB7CiAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRF
X2Vhcmx5X2Jvb3QgKQogICAgIHsKICAgICAgICAgdm9pZCAqcHRyID0gYWxsb2NfeGVuaGVhcF9w
YWdlKCk7CiAKICAgICAgICAgQlVHX09OKCFoYXJkd2FyZV9kb21haW4gJiYgIXB0cik7Ci0gICAg
ICAgIHJldHVybiBwdHI7CisgICAgICAgIHJldHVybiB2aXJ0X3RvX21mbihwdHIpOwogICAgIH0K
IAotICAgIHJldHVybiBtZm5fdG9fdmlydChtZm5feChhbGxvY19ib290X3BhZ2VzKDEsIDEpKSk7
CisgICAgcmV0dXJuIGFsbG9jX2Jvb3RfcGFnZXMoMSwgMSk7CiB9CiAKLXZvaWQgZnJlZV94ZW5f
cGFnZXRhYmxlKHZvaWQgKnYpCit2b2lkICptYXBfeGVuX3BhZ2V0YWJsZV9uZXcobWZuX3QgbWZu
KQogewotICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290ICkKLSAg
ICAgICAgZnJlZV94ZW5oZWFwX3BhZ2Uodik7CisgICAgcmV0dXJuIG1mbl90b192aXJ0KG1mbl94
KG1mbikpOworfQorCisvKiB2IGNhbiBwb2ludCB0byBhbiBlbnRyeSB3aXRoaW4gYSB0YWJsZSBv
ciBiZSBOVUxMICovCit2b2lkIHVubWFwX3hlbl9wYWdldGFibGVfbmV3KGNvbnN0IHZvaWQgKnYp
Cit7CisgICAgLyogWFhYIHN0aWxsIHVzaW5nIHhlbmhlYXAgcGFnZSwgbm8gbmVlZCB0byBkbyBh
bnl0aGluZy4gICovCit9CisKKy8qIG1mbiBjYW4gYmUgSU5WQUxJRF9NRk4gKi8KK3ZvaWQgZnJl
ZV94ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pCit7CisgICAgaWYgKCBzeXN0ZW1fc3RhdGUg
IT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgJiYgIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCisg
ICAgICAgIGZyZWVfeGVuaGVhcF9wYWdlKG1mbl90b192aXJ0KG1mbl94KG1mbikpKTsKIH0KIAog
c3RhdGljIERFRklORV9TUElOTE9DSyhtYXBfcGdkaXJfbG9jayk7CmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKaW5kZXggOWQy
YjgzMzU3OS4uNzY1OTNmZTllNyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaApAQCAtNTgyLDYgKzU4MiwxNyBAQCB2b2lk
ICpkb19wYWdlX3dhbGsoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgYWRkcik7CiAvKiBB
bGxvY2F0b3IgZnVuY3Rpb25zIGZvciBYZW4gcGFnZXRhYmxlcy4gKi8KIHZvaWQgKmFsbG9jX3hl
bl9wYWdldGFibGUodm9pZCk7CiB2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KTsKK21m
bl90IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KHZvaWQpOwordm9pZCAqbWFwX3hlbl9wYWdldGFi
bGVfbmV3KG1mbl90IG1mbik7Cit2b2lkIHVubWFwX3hlbl9wYWdldGFibGVfbmV3KGNvbnN0IHZv
aWQgKnYpOwordm9pZCBmcmVlX3hlbl9wYWdldGFibGVfbmV3KG1mbl90IG1mbik7CisKKyNkZWZp
bmUgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcocHRyKSAgICBcCisgICAgZG8geyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICB1bm1hcF94ZW5fcGFnZXRhYmxlX25ldyhw
dHIpOyAgIFwKKyAgICAgICAgKHB0cikgPSBOVUxMOyAgICAgICAgICAgICAgICAgICBcCisgICAg
fSB3aGlsZSAoMCkKKwogbDFfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9u
ZyB2KTsKIAogaW50IF9fc3luY19sb2NhbF9leGVjc3RhdGUodm9pZCk7Ci0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
