Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630E8C1F32
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1w-0000Qy-6D; Mon, 30 Sep 2019 10:35:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1t-0000NT-TY
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:45 +0000
X-Inumbo-ID: 0ed47cf5-e36e-11e9-96cd-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 0ed47cf5-e36e-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839745; x=1601375745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JW1mEkfXYjbs9OD1jt/4mHgboEXE6nCGeRdIpKSOO9s=;
 b=QQN2UZy+dsE9k03t6fqOO1qoHafIB2w4IWMohHEVU/70182Hf8zu4Ykn
 EctYrl7hTCPszeTySIozwf8oOFs/C1wJrpfYx87y/snOOTuFIV65nm9Lr
 mXoxGHJdNovWzsYjcX1NzfujZ8uiTotjEN49ppAO0Hp36krS9Ssbc0/tq 4=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="838005589"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Sep 2019 10:34:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6A48AA21D8; Mon, 30 Sep 2019 10:34:33 +0000 (UTC)
Received: from EX13D28EUC003.ant.amazon.com (10.43.164.43) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:06 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:04 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:03 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:08 +0100
Message-ID: <5bb7b5c4b8a16faf3a68185d7ae042a169085e55.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 16/55] x86/mm: switch to new APIs in
 map_pages_to_xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Hongyan Xia <hongyax@amazon.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClBhZ2UgdGFibGVzIGFsbG9jYXRl
ZCBpbiB0aGF0IGZ1bmN0aW9uIHNob3VsZCBiZSBtYXBwZWQgYW5kIHVubWFwcGVkCm5vdy4KClNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6
IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+CgotLS0KQ2hhbmdlZCBzaW5jZSB2MToK
ICAqIHJlbW92ZSByZWR1bmRhbnQgbGluZXMKLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDM0ICsr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0u
YyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGY3ZmQwZTZiYWQuLjViYjg2OTM1ZjQgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC01MTg1
LDYgKzUxODUsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBmbHVzaF9mbGFncyA9CiAgICAgICAgICAgICAgICAgRkxVU0hfVExCIHwgRkxVU0hfT1JE
RVIoMiAqIFBBR0VUQUJMRV9PUkRFUik7CiAgICAgICAgICAgICBsMl9wZ2VudHJ5X3QgKmwydDsK
KyAgICAgICAgICAgIG1mbl90IGwydF9tZm47CiAKICAgICAgICAgICAgIC8qIFNraXAgdGhpcyBQ
VEUgaWYgdGhlcmUgaXMgbm8gY2hhbmdlLiAqLwogICAgICAgICAgICAgaWYgKCAoKGwzZV9nZXRf
cGZuKG9sM2UpICYgfihMMl9QQUdFVEFCTEVfRU5UUklFUyAqCkBAIC01MjA2LDEzICs1MjA3LDE1
IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgIGdvdG8gZW5kX29mX2xv
b3A7CiAgICAgICAgICAgICB9CiAKLSAgICAgICAgICAgIGwydCA9IGFsbG9jX3hlbl9wYWdldGFi
bGUoKTsKLSAgICAgICAgICAgIGlmICggbDJ0ID09IE5VTEwgKQorICAgICAgICAgICAgbDJ0X21m
biA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7CisgICAgICAgICAgICBpZiAoIG1mbl9lcShs
MnRfbWZuLCBJTlZBTElEX01GTikgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIEFT
U0VSVChyYyA9PSAtRU5PTUVNKTsKICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAg
ICAgIH0KIAorICAgICAgICAgICAgbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwydF9tZm4p
OworCiAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BBR0VUQUJMRV9FTlRSSUVTOyBp
KysgKQogICAgICAgICAgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4ob2wzZSkgKwpAQCAtNTIyNywxNSAr
NTIzMCwxOCBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgIGlmICggKGwzZV9n
ZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCkgJiYKICAgICAgICAgICAgICAgICAgKGwz
ZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFKSApCiAgICAgICAgICAgICB7Ci0gICAgICAg
ICAgICAgICAgbDNlX3dyaXRlX2F0b21pYyhwbDNlLCBsM2VfZnJvbV9tZm4odmlydF90b19tZm4o
bDJ0KSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX1BBR0VfSFlQRVJWSVNPUikpOwotICAgICAgICAgICAgICAgIGwydCA9IE5VTEw7CisgICAg
ICAgICAgICAgICAgbDNlX3dyaXRlX2F0b21pYyhwbDNlLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbDNlX2Zyb21fbWZuKGwydF9tZm4sIF9fUEFHRV9IWVBFUlZJU09SKSk7Cisg
ICAgICAgICAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDJ0KTsKICAgICAgICAgICAg
IH0KICAgICAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAgICAgICAgc3Bpbl91bmxv
Y2soJm1hcF9wZ2Rpcl9sb2NrKTsKICAgICAgICAgICAgIGZsdXNoX2FyZWEodmlydCwgZmx1c2hf
ZmxhZ3MpOwogICAgICAgICAgICAgaWYgKCBsMnQgKQotICAgICAgICAgICAgICAgIGZyZWVfeGVu
X3BhZ2V0YWJsZShsMnQpOworICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIFVOTUFQX1hF
Tl9QQUdFVEFCTEVfTkVXKGwydCk7CisgICAgICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxl
X25ldyhsMnRfbWZuKTsKKyAgICAgICAgICAgIH0KICAgICAgICAgfQogCiAgICAgICAgIHBsMmUg
PSB2aXJ0X3RvX3hlbl9sMmUodmlydCk7CkBAIC01Mjk4LDYgKzUzMDQsNyBAQCBpbnQgbWFwX3Bh
Z2VzX3RvX3hlbigKICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPQog
ICAgICAgICAgICAgICAgICAgICBGTFVTSF9UTEIgfCBGTFVTSF9PUkRFUihQQUdFVEFCTEVfT1JE
RVIpOwogICAgICAgICAgICAgICAgIGwxX3BnZW50cnlfdCAqbDF0OworICAgICAgICAgICAgICAg
IG1mbl90IGwxdF9tZm47CiAKICAgICAgICAgICAgICAgICAvKiBTa2lwIHRoaXMgUFRFIGlmIHRo
ZXJlIGlzIG5vIGNoYW5nZS4gKi8KICAgICAgICAgICAgICAgICBpZiAoICgoKGwyZV9nZXRfcGZu
KCpwbDJlKSAmIH4oTDFfUEFHRVRBQkxFX0VOVFJJRVMgLSAxKSkgKwpAQCAtNTMxNywxMyArNTMy
NCwxNSBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgICAgICAgICAgZ290byBj
aGVja19sMzsKICAgICAgICAgICAgICAgICB9CiAKLSAgICAgICAgICAgICAgICBsMXQgPSBhbGxv
Y194ZW5fcGFnZXRhYmxlKCk7Ci0gICAgICAgICAgICAgICAgaWYgKCBsMXQgPT0gTlVMTCApCisg
ICAgICAgICAgICAgICAgbDF0X21mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7CisgICAg
ICAgICAgICAgICAgaWYgKCBtZm5fZXEobDF0X21mbiwgSU5WQUxJRF9NRk4pICkKICAgICAgICAg
ICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIEFTU0VSVChyYyA9PSAtRU5PTUVNKTsKICAg
ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7CiAgICAgICAgICAgICAgICAgfQogCisgICAgICAg
ICAgICAgICAgbDF0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwxdF9tZm4pOworCiAgICAgICAg
ICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBMMV9QQUdFVEFCTEVfRU5UUklFUzsgaSsrICkKICAg
ICAgICAgICAgICAgICAgICAgbDFlX3dyaXRlKCZsMXRbaV0sCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsMWVfZnJvbV9wZm4obDJlX2dldF9wZm4oKnBsMmUpICsgaSwKQEAgLTUzMzcs
MTUgKzUzNDYsMTggQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICAgICAgaWYg
KCAobDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QUkVTRU5UKSAmJgogICAgICAgICAgICAg
ICAgICAgICAgKGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFKSApCiAgICAgICAgICAg
ICAgICAgewotICAgICAgICAgICAgICAgICAgICBsMmVfd3JpdGVfYXRvbWljKHBsMmUsIGwyZV9m
cm9tX21mbih2aXJ0X3RvX21mbihsMXQpLAorICAgICAgICAgICAgICAgICAgICBsMmVfd3JpdGVf
YXRvbWljKHBsMmUsIGwyZV9mcm9tX21mbihsMXRfbWZuLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUikpOwot
ICAgICAgICAgICAgICAgICAgICBsMXQgPSBOVUxMOworICAgICAgICAgICAgICAgICAgICBVTk1B
UF9YRU5fUEFHRVRBQkxFX05FVyhsMXQpOwogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAg
ICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFw
X3BnZGlyX2xvY2spOwogICAgICAgICAgICAgICAgIGZsdXNoX2FyZWEodmlydCwgZmx1c2hfZmxh
Z3MpOwogICAgICAgICAgICAgICAgIGlmICggbDF0ICkKLSAgICAgICAgICAgICAgICAgICAgZnJl
ZV94ZW5fcGFnZXRhYmxlKGwxdCk7CisgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAg
ICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMXQpOworICAgICAgICAgICAgICAgICAgICBm
cmVlX3hlbl9wYWdldGFibGVfbmV3KGwxdF9tZm4pOworICAgICAgICAgICAgICAgIH0KICAgICAg
ICAgICAgIH0KIAogICAgICAgICAgICAgcGwxZSAgPSBsMmVfdG9fbDFlKCpwbDJlKSArIGwxX3Rh
YmxlX29mZnNldCh2aXJ0KTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
