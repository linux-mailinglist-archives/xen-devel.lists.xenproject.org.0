Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6204F1714FB
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 11:30:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7GOl-0003gB-6C; Thu, 27 Feb 2020 10:28:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dmp=4P=amazon.com=prvs=3193da5bc=hongyxia@srs-us1.protection.inumbo.net>)
 id 1j7GOj-0003g6-EA
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 10:28:05 +0000
X-Inumbo-ID: d6c5be5a-594b-11ea-9c17-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6c5be5a-594b-11ea-9c17-bc764e2007e4;
 Thu, 27 Feb 2020 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582799286; x=1614335286;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=bozTLwurkM4j//NT4sbJrL0L1X5s2qdTkBGBFJ75zqc=;
 b=TXQh0hauM9A2qXwTvb8WbssIdaICcm1bL5LHEqkQ+2KjBUBUH1K4lock
 cNP46HEciHoFkxB44b5sYzDv5ZniDZ6B25JDR1+WIbiMEBf4yFA58yfS0
 WqGzNGO5TUPk6FUwBgqdofzwcFb4CkBFzwXVDZ8YudhwaANzLIp1nb6hF w=;
IronPort-SDR: xfbajrZ8pqhO85/jCyQjnN/8tu9U5T1bSxU/0XcJ1WA3DdX89XpflhS4lqQMRL0z260+0fyk9o
 I48zduIiP2ZQ==
X-IronPort-AV: E=Sophos;i="5.70,491,1574121600"; d="scan'208";a="19927560"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 27 Feb 2020 10:27:52 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6D9E0A2BD3; Thu, 27 Feb 2020 10:27:50 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 27 Feb 2020 10:27:50 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 27 Feb 2020 10:27:47 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 27 Feb 2020 10:27:44 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 27 Feb 2020 10:27:39 +0000
Message-ID: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] x86/mm: switch to new APIs in
 arch_init_memory
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBmdW5jdGlvbiB3aWxsIG1h
cCBhbmQgdW5tYXAgcGFnZXMgb24gZGVtYW5kLgoKU2luY2Ugd2Ugbm93IG1hcCBhbmQgdW5tYXAg
WGVuIFBURSBwYWdlcywgd2Ugd291bGQgbGlrZSB0byB0cmFjayB0aGUKbGlmZXRpbWUgb2YgbWFw
cGluZ3Mgc28gdGhhdCAxKSB3ZSBkbyBub3QgZGVyZWZlcmVuY2UgbWVtb3J5IHRocm91Z2ggYQp2
YXJpYWJsZSBhZnRlciBpdCBpcyB1bm1hcHBlZCwgMikgd2UgZG8gbm90IHVubWFwIG1vcmUgdGhh
biBvbmNlLgpUaGVyZWZvcmUsIHdlIGludHJvZHVjZSB0aGUgVU5NQVBfRE9NQUlOX1BBR0UgbWFj
cm8gdG8gbnVsbGlmeSB0aGUKdmFyaWFibGUgYWZ0ZXIgdW5tYXBwaW5nLCBhbmQgaWdub3JlIE5V
TEwuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpTaWduZWQt
b2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNvbT4KCi0tLQpDaGFuZ2VkIGlu
IHYyOgotIGxldCBVTk1BUF9ET01BSU5fUEFHRSBpdHNlbGYgY2hlY2sgd2hldGhlciB0aGUgaW5w
dXQgaXMgTlVMTCB0byBhdm9pZAogIGFkZGluZyB0aGUgY2hlY2sgaW4gdW5tYXBfZG9tYWluX3Bh
Z2UuCi0gcmV3b3JkIHRoZSBjb21taXQgbWVzc2FnZS4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAg
ICAgICAgICAgICB8IDE0ICsrKysrKysrLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3Bh
Z2UuaCB8ICA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4
Ni9tbS5jCmluZGV4IDcwYjg3YzQ4MzAuLjlmY2RjZGU1YjcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC0zNTYsMTkgKzM1NiwyMSBAQCB2
b2lkIF9faW5pdCBhcmNoX2luaXRfbWVtb3J5KHZvaWQpCiAgICAgICAgICAgICBBU1NFUlQocm9v
dF9wZ3RfcHZfeGVuX3Nsb3RzIDwgUk9PVF9QQUdFVEFCTEVfUFZfWEVOX1NMT1RTKTsKICAgICAg
ICAgICAgIGlmICggbDRfdGFibGVfb2Zmc2V0KHNwbGl0X3ZhKSA9PSBsNF90YWJsZV9vZmZzZXQo
c3BsaXRfdmEgLSAxKSApCiAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgbDNfcGdlbnRy
eV90ICpsM3RhYiA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKKyAgICAgICAgICAgICAgICBtZm5f
dCBsM21mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7CiAKLSAgICAgICAgICAgICAgICBp
ZiAoIGwzdGFiICkKKyAgICAgICAgICAgICAgICBpZiAoICFtZm5fZXEobDNtZm4sIElOVkFMSURf
TUZOKSApCiAgICAgICAgICAgICAgICAgewotICAgICAgICAgICAgICAgICAgICBjb25zdCBsM19w
Z2VudHJ5X3QgKmwzaWRsZSA9Ci0gICAgICAgICAgICAgICAgICAgICAgICBsNGVfdG9fbDNlKGlk
bGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KHNwbGl0X3ZhKV0pOworICAgICAgICAgICAgICAg
ICAgICBsM19wZ2VudHJ5X3QgKmwzaWRsZSA9IG1hcF9sM3RfZnJvbV9sNGUoCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoc3BsaXRfdmEp
XSk7CisgICAgICAgICAgICAgICAgICAgIGwzX3BnZW50cnlfdCAqbDN0YWIgPSBtYXBfZG9tYWlu
X3BhZ2UobDNtZm4pOwogCiAgICAgICAgICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbDNf
dGFibGVfb2Zmc2V0KHNwbGl0X3ZhKTsgKytpICkKICAgICAgICAgICAgICAgICAgICAgICAgIGwz
dGFiW2ldID0gbDNpZGxlW2ldOwogICAgICAgICAgICAgICAgICAgICBmb3IgKCA7IGkgPCBMM19Q
QUdFVEFCTEVfRU5UUklFUzsgKytpICkKICAgICAgICAgICAgICAgICAgICAgICAgIGwzdGFiW2ld
ID0gbDNlX2VtcHR5KCk7Ci0gICAgICAgICAgICAgICAgICAgIHNwbGl0X2w0ZSA9IGw0ZV9mcm9t
X21mbih2aXJ0X3RvX21mbihsM3RhYiksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUl9SVyk7CisgICAgICAgICAgICAgICAgICAg
IHNwbGl0X2w0ZSA9IGw0ZV9mcm9tX21mbihsM21mbiwgX19QQUdFX0hZUEVSVklTT1JfUlcpOwor
ICAgICAgICAgICAgICAgICAgICBVTk1BUF9ET01BSU5fUEFHRShsM2lkbGUpOworICAgICAgICAg
ICAgICAgICAgICBVTk1BUF9ET01BSU5fUEFHRShsM3RhYik7CiAgICAgICAgICAgICAgICAgfQog
ICAgICAgICAgICAgICAgIGVsc2UKICAgICAgICAgICAgICAgICAgICAgKytyb290X3BndF9wdl94
ZW5fc2xvdHM7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluX3BhZ2UuaCBiL3hl
bi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oCmluZGV4IDMyNjY5YTMzMzkuLmJmYzNiZjZhZWIg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oCisrKyBiL3hlbi9pbmNs
dWRlL3hlbi9kb21haW5fcGFnZS5oCkBAIC03Miw0ICs3MiwxMSBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKGNvbnN0IHZvaWQgKnZhKSB7fTsKIAogI2VuZGlm
IC8qICFDT05GSUdfRE9NQUlOX1BBR0UgKi8KIAorI2RlZmluZSBVTk1BUF9ET01BSU5fUEFHRShw
KSBkbyB7ICAgXAorICAgIGlmICggcCApIHsgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAg
ICB1bm1hcF9kb21haW5fcGFnZShwKTsgICAgICAgXAorICAgICAgICAocCkgPSBOVUxMOyAgICAg
ICAgICAgICAgICAgXAorICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorfSB3
aGlsZSAoIGZhbHNlICkKKwogI2VuZGlmIC8qIF9fWEVOX0RPTUFJTl9QQUdFX0hfXyAqLwotLSAK
Mi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
