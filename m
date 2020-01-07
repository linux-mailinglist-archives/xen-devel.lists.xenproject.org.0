Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7A31325AC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:09:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iondq-00050G-NH; Tue, 07 Jan 2020 12:07:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tB6F=24=amazon.com=prvs=2686fb3d9=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iondo-0004zO-Kt
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:07:20 +0000
X-Inumbo-ID: 3d172c30-3146-11ea-abea-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d172c30-3146-11ea-abea-12813bfff9fa;
 Tue, 07 Jan 2020 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578398833; x=1609934833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=U3mwHbcFdCe6JbFMFdiwFqByzpljucm+6vyznbEIxNA=;
 b=QOPt5pTZAD4ajyoPoVXfaK1lq+OcbpVvlACkG5leLVgqfVj9M1puvUOe
 GQ0JV8XB1YxScc0oDff5Q5wZUU+G9KG4nbYA7Dwocvqgt9pjvDPN7pTLF
 J0zSNmXP/FSIDbsblrQmNC9FPXu1g2c2mxr+Vf35OOlO4Ia8GICd+GV9x A=;
IronPort-SDR: FmaljOdqBog0xHdR+wgVkeh5NmYRhrHEFLXQiMGOf9xM2IRUWIt4kkZzZDB3vDDi5dkU7IYyeo
 CaQptbVupt7A==
X-IronPort-AV: E=Sophos;i="5.69,406,1571702400"; d="scan'208";a="17196813"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 07 Jan 2020 12:07:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 783D9A2384; Tue,  7 Jan 2020 12:07:00 +0000 (UTC)
Received: from EX13D37EUB003.ant.amazon.com (10.43.166.251) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:06:59 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D37EUB003.ant.amazon.com (10.43.166.251) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:06:58 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 12:06:55 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 12:06:44 +0000
Message-ID: <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578397252.git.hongyxia@amazon.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 2/7] x86: introduce a new set of APIs to
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
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
OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNvbT4KUmV2aWV3ZWQtYnk6IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgotLS0KQ2hhbmdlZCBzaW5jZSB2NDoKLSBwcm9wZXJs
eSBoYW5kbGUgSU5WQUxJRF9NRk4uCi0gcmVtb3ZlIHRoZSBfbmV3IHN1ZmZpeCBmb3IgbWFwL3Vu
bWFwX3hlbl9wYWdldGFibGUgYmVjYXVzZSB0aGV5IGRvIG5vdAogIGhhdmUgb2xkIGFsdGVybmF0
aXZlcy4KCkNoYW5nZWQgc2luY2UgdjM6Ci0gY29uc3QgcXVhbGlmeSB1bm1hcF94ZW5fcGFnZXRh
YmxlX25ldygpLgotIHJlbW92ZSByZWR1bmRhbnQgcGFyZW50aGVzZXMuCi0tLQogeGVuL2FyY2gv
eDg2L21tLmMgICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCB8IDExICsrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCBjYzBkNzE5OTZj
Li4yMmI1NTM5MGYxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJj
aC94ODYvbW0uYwpAQCAtMTE5LDYgKzExOSw3IEBACiAjaW5jbHVkZSA8eGVuL2VmaS5oPgogI2lu
Y2x1ZGUgPHhlbi9ncmFudF90YWJsZS5oPgogI2luY2x1ZGUgPHhlbi9oeXBlcmNhbGwuaD4KKyNp
bmNsdWRlIDx4ZW4vbW0uaD4KICNpbmNsdWRlIDxhc20vcGFnaW5nLmg+CiAjaW5jbHVkZSA8YXNt
L3NoYWRvdy5oPgogI2luY2x1ZGUgPGFzbS9wYWdlLmg+CkBAIC00OTkyLDIyICs0OTkzLDU1IEBA
IGludCBtbWNmZ19pbnRlcmNlcHRfd3JpdGUoCiB9CiAKIHZvaWQgKmFsbG9jX3hlbl9wYWdldGFi
bGUodm9pZCkKK3sKKyAgICBtZm5fdCBtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOwor
CisgICAgcmV0dXJuIG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSA/IE5VTEwgOiBtZm5fdG9fdmly
dChtZm5feChtZm4pKTsKK30KKwordm9pZCBmcmVlX3hlbl9wYWdldGFibGUodm9pZCAqdikKK3sK
KyAgICBtZm5fdCBtZm4gPSB2ID8gdmlydF90b19tZm4odikgOiBJTlZBTElEX01GTjsKKworICAg
IGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290ICkKKyAgICAgICAgZnJl
ZV94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOworfQorCisvKgorICogRm9yIHRoZXNlIFBURSBBUElz
LCB0aGUgY2FsbGVyIG11c3QgZm9sbG93IHRoZSBhbGxvYy1tYXAtdW5tYXAtZnJlZQorICogbGlm
ZWN5Y2xlLCB3aGljaCBtZWFucyBleHBsaWNpdGx5IG1hcHBpbmcgdGhlIFBURSBwYWdlcyBiZWZv
cmUgYWNjZXNzaW5nCisgKiB0aGVtLiBUaGUgY2FsbGVyIG11c3QgY2hlY2sgd2hldGhlciB0aGUg
YWxsb2NhdGlvbiBoYXMgc3VjY2VlZGVkLCBhbmQgb25seQorICogcGFzcyB2YWxpZCBNRk5zIHRv
IG1hcF94ZW5fcGFnZXRhYmxlKCkuCisgKi8KK21mbl90IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3
KHZvaWQpCiB7CiAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3Qg
KQogICAgIHsKICAgICAgICAgdm9pZCAqcHRyID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7CiAKICAg
ICAgICAgQlVHX09OKCFoYXJkd2FyZV9kb21haW4gJiYgIXB0cik7Ci0gICAgICAgIHJldHVybiBw
dHI7CisgICAgICAgIHJldHVybiBwdHIgPyB2aXJ0X3RvX21mbihwdHIpIDogSU5WQUxJRF9NRk47
CiAgICAgfQogCi0gICAgcmV0dXJuIG1mbl90b192aXJ0KG1mbl94KGFsbG9jX2Jvb3RfcGFnZXMo
MSwgMSkpKTsKKyAgICByZXR1cm4gYWxsb2NfYm9vdF9wYWdlcygxLCAxKTsKIH0KIAotdm9pZCBm
cmVlX3hlbl9wYWdldGFibGUodm9pZCAqdikKK3ZvaWQgKm1hcF94ZW5fcGFnZXRhYmxlKG1mbl90
IG1mbikKIHsKLSAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCAp
Ci0gICAgICAgIGZyZWVfeGVuaGVhcF9wYWdlKHYpOworICAgIHJldHVybiBtZm5fdG9fdmlydCht
Zm5feChtZm4pKTsKK30KKworLyogdiBjYW4gcG9pbnQgdG8gYW4gZW50cnkgd2l0aGluIGEgdGFi
bGUgb3IgYmUgTlVMTCAqLwordm9pZCB1bm1hcF94ZW5fcGFnZXRhYmxlKGNvbnN0IHZvaWQgKnYp
Cit7CisgICAgLyogWFhYIHN0aWxsIHVzaW5nIHhlbmhlYXAgcGFnZSwgbm8gbmVlZCB0byBkbyBh
bnl0aGluZy4gICovCit9CisKKy8qIG1mbiBjYW4gYmUgSU5WQUxJRF9NRk4gKi8KK3ZvaWQgZnJl
ZV94ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pCit7CisgICAgaWYgKCBzeXN0ZW1fc3RhdGUg
IT0gU1lTX1NUQVRFX2Vhcmx5X2Jvb3QgJiYgIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCisg
ICAgICAgIGZyZWVfeGVuaGVhcF9wYWdlKG1mbl90b192aXJ0KG1mbl94KG1mbikpKTsKIH0KIAog
c3RhdGljIERFRklORV9TUElOTE9DSyhtYXBfcGdkaXJfbG9jayk7CmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L21tLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKaW5kZXggMmNh
ODg4MmFkMC4uODYxZWRiYTM0ZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaApAQCAtNTgyLDYgKzU4MiwxNyBAQCB2b2lk
ICpkb19wYWdlX3dhbGsoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgYWRkcik7CiAvKiBB
bGxvY2F0b3IgZnVuY3Rpb25zIGZvciBYZW4gcGFnZXRhYmxlcy4gKi8KIHZvaWQgKmFsbG9jX3hl
bl9wYWdldGFibGUodm9pZCk7CiB2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZSh2b2lkICp2KTsKK21m
bl90IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KHZvaWQpOwordm9pZCAqbWFwX3hlbl9wYWdldGFi
bGUobWZuX3QgbWZuKTsKK3ZvaWQgdW5tYXBfeGVuX3BhZ2V0YWJsZShjb25zdCB2b2lkICp2KTsK
K3ZvaWQgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyhtZm5fdCBtZm4pOworCisjZGVmaW5lIFVOTUFQ
X1hFTl9QQUdFVEFCTEUocHRyKSAgICBcCisgICAgZG8geyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCisgICAgICAgIHVubWFwX3hlbl9wYWdldGFibGUocHRyKTsgICBcCisgICAgICAgIChw
dHIpID0gTlVMTDsgICAgICAgICAgICAgICBcCisgICAgfSB3aGlsZSAoMCkKKwogbDFfcGdlbnRy
eV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KTsKIAogaW50IF9fc3luY19sb2Nh
bF9leGVjc3RhdGUodm9pZCk7Ci0tIAoyLjE1LjMuQU1aTgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
