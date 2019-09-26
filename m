Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE68BEEC9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNS-0003tL-8u; Thu, 26 Sep 2019 09:47:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNP-0003qn-Ow
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:47:55 +0000
X-Inumbo-ID: b5ac42df-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id b5ac42df-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491273; x=1601027273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=NzzwvERroAI+I7zkH8dvAghyc38Cq8FDW8eCIR3M3OY=;
 b=Jj/r/P3awWb7BtysKBUP7791LweCd85ru4U4DTxcoTjgg3KScVWUppND
 5CjFj9dMM3UwSJ01fTA5PfMFL7sbxAdKa+lGymMSrdhQrGuzd4/a8uv39
 L6bq+bCk7SUS1cI7IX8YZXaC//tMdAzJ8CkMeYASIYpWQ6u9RO7ANFZWc Q=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788121"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:47:53 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 04F0824111A; Thu, 26 Sep 2019 09:47:52 +0000 (UTC)
Received: from EX13D31UWA002.ant.amazon.com (10.43.160.82) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:25 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D31UWA002.ant.amazon.com (10.43.160.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:25 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:23 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:40 +0100
Message-ID: <754cbac796a3e4326e2ad6b103d85dbbc3f51ae2.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 17/84] xxx fixup: avoid shadowing mfn
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCi0tLQogeGVuL2FyY2gveDg2L21t
LmMgfCAyNSArKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21t
LmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRleCAwNjE2NjY2MjIxLi4yNjdlNGNlZWY1IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtNTE4
NSw3ICs1MTg1LDcgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgZmx1c2hfZmxhZ3MgPQogICAgICAgICAgICAgICAgIEZMVVNIX1RMQiB8IEZMVVNIX09S
REVSKDIgKiBQQUdFVEFCTEVfT1JERVIpOwogICAgICAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQ7
Ci0gICAgICAgICAgICBtZm5fdCBtZm47CisgICAgICAgICAgICBtZm5fdCBsMnRfbWZuOwogCiAg
ICAgICAgICAgICAvKiBTa2lwIHRoaXMgUFRFIGlmIHRoZXJlIGlzIG5vIGNoYW5nZS4gKi8KICAg
ICAgICAgICAgIGlmICggKChsM2VfZ2V0X3BmbihvbDNlKSAmIH4oTDJfUEFHRVRBQkxFX0VOVFJJ
RVMgKgpAQCAtNTIwNywxNCArNTIwNywxNCBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAg
ICAgICAgICAgICBnb3RvIGVuZF9vZl9sb29wOwogICAgICAgICAgICAgfQogCi0gICAgICAgICAg
ICBtZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOwotICAgICAgICAgICAgaWYgKCBtZm5f
ZXEobWZuLCBJTlZBTElEX01GTikgKQorICAgICAgICAgICAgbDJ0X21mbiA9IGFsbG9jX3hlbl9w
YWdldGFibGVfbmV3KCk7CisgICAgICAgICAgICBpZiAoIG1mbl9lcShsMnRfbWZuLCBJTlZBTElE
X01GTikgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIEFTU0VSVChyYyA9PSAtRU5P
TUVNKTsKICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgIH0KIAotICAgICAg
ICAgICAgbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbik7CisgICAgICAgICAgICBsMnQg
PSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDJ0X21mbik7CiAKICAgICAgICAgICAgIGZvciAoIGkg
PSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCiAgICAgICAgICAgICAgICAgbDJl
X3dyaXRlKGwydCArIGksCkBAIC01MjMwLDcgKzUyMzAsOCBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hl
bigKICAgICAgICAgICAgIGlmICggKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VO
VCkgJiYKICAgICAgICAgICAgICAgICAgKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNF
KSApCiAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgbDNlX3dyaXRlX2F0b21pYyhwbDNl
LCBsM2VfZnJvbV9tZm4obWZuLCBfX1BBR0VfSFlQRVJWSVNPUikpOworICAgICAgICAgICAgICAg
IGwzZV93cml0ZV9hdG9taWMocGwzZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGwzZV9mcm9tX21mbihsMnRfbWZuLCBfX1BBR0VfSFlQRVJWSVNPUikpOwogICAgICAgICAgICAg
ICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwydCk7CiAgICAgICAgICAgICAgICAgbDJ0ID0g
TlVMTDsKICAgICAgICAgICAgIH0KQEAgLTUyNDAsNyArNTI0MSw3IEBAIGludCBtYXBfcGFnZXNf
dG9feGVuKAogICAgICAgICAgICAgaWYgKCBsMnQgKQogICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwydCk7Ci0gICAgICAgICAgICAgICAgZnJl
ZV94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOworICAgICAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0
YWJsZV9uZXcobDJ0X21mbik7CiAgICAgICAgICAgICB9CiAgICAgICAgIH0KIApAQCAtNTMwNCw3
ICs1MzA1LDcgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGZsdXNoX2ZsYWdzID0KICAgICAgICAgICAgICAgICAgICAgRkxVU0hfVExCIHwgRkxV
U0hfT1JERVIoUEFHRVRBQkxFX09SREVSKTsKICAgICAgICAgICAgICAgICBsMV9wZ2VudHJ5X3Qg
KmwxdDsKLSAgICAgICAgICAgICAgICBtZm5fdCBtZm47CisgICAgICAgICAgICAgICAgbWZuX3Qg
bDF0X21mbjsKIAogICAgICAgICAgICAgICAgIC8qIFNraXAgdGhpcyBQVEUgaWYgdGhlcmUgaXMg
bm8gY2hhbmdlLiAqLwogICAgICAgICAgICAgICAgIGlmICggKCgobDJlX2dldF9wZm4oKnBsMmUp
ICYgfihMMV9QQUdFVEFCTEVfRU5UUklFUyAtIDEpKSArCkBAIC01MzI0LDE0ICs1MzI1LDE0IEBA
IGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgICAgICBnb3RvIGNoZWNrX2wz
OwogICAgICAgICAgICAgICAgIH0KIAotICAgICAgICAgICAgICAgIG1mbiA9IGFsbG9jX3hlbl9w
YWdldGFibGVfbmV3KCk7Ci0gICAgICAgICAgICAgICAgaWYgKCBtZm5fZXEobWZuLCBJTlZBTElE
X01GTikgKQorICAgICAgICAgICAgICAgIGwxdF9tZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25l
dygpOworICAgICAgICAgICAgICAgIGlmICggbWZuX2VxKGwxdF9tZm4sIElOVkFMSURfTUZOKSAp
CiAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICBBU1NFUlQocmMgPT0gLUVO
T01FTSk7CiAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICAgICAgICAgIH0K
IAotICAgICAgICAgICAgICAgIGwxdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOworICAg
ICAgICAgICAgICAgIGwxdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsMXRfbWZuKTsKIAogICAg
ICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgTDFfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyAp
CiAgICAgICAgICAgICAgICAgICAgIGwxZV93cml0ZSgmbDF0W2ldLApAQCAtNTM0Niw3ICs1MzQ3
LDcgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICAgICAgaWYgKCAobDJlX2dl
dF9mbGFncygqcGwyZSkgJiBfUEFHRV9QUkVTRU5UKSAmJgogICAgICAgICAgICAgICAgICAgICAg
KGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFKSApCiAgICAgICAgICAgICAgICAgewot
ICAgICAgICAgICAgICAgICAgICBsMmVfd3JpdGVfYXRvbWljKHBsMmUsIGwyZV9mcm9tX21mbiht
Zm4sCisgICAgICAgICAgICAgICAgICAgIGwyZV93cml0ZV9hdG9taWMocGwyZSwgbDJlX2Zyb21f
bWZuKGwxdF9tZm4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJU09SKSk7CiAgICAgICAgICAgICAgICAgICAgIFVO
TUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwxdCk7CiAgICAgICAgICAgICAgICAgICAgIGwxdCA9IE5V
TEw7CkBAIC01MzU3LDcgKzUzNTgsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAg
ICAgICAgICBpZiAoIGwxdCApCiAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAg
ICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMXQpOwotICAgICAgICAgICAgICAgICAgICBmcmVl
X3hlbl9wYWdldGFibGVfbmV3KG1mbik7CisgICAgICAgICAgICAgICAgICAgIGZyZWVfeGVuX3Bh
Z2V0YWJsZV9uZXcobDF0X21mbik7CiAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgfQog
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
