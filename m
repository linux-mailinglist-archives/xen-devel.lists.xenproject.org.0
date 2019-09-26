Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C18BEEBE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:50:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNT-0003vC-Je; Thu, 26 Sep 2019 09:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNS-0003uK-EI
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:47:58 +0000
X-Inumbo-ID: b7f1abba-e042-11e9-8628-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id b7f1abba-e042-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491276; x=1601027276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=lQwIe7eKispWsJ7EczXrD1I5UIckpRGulgQiuOZp20I=;
 b=J7l9g6S+FotjpNsKzCBdZfO3IntN56LzDX6VE/xFNtKkuA8qkGUCk/Tv
 Ortyw36acrKOlldCH4kF9Nh2RGdbKPvGIC4KHN8BZbevpNHpHh5F3bUPr
 PeTL+O8hjgivEwwymnwWjOlyY/zFNOVOszoUSaNkRaJxOm1RspZnMifC2 Q=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535039"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:47:55 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 33545240B39; Thu, 26 Sep 2019 09:47:55 +0000 (UTC)
Received: from EX13D04UWA004.ant.amazon.com (10.43.160.234) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:29 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D04UWA004.ant.amazon.com (10.43.160.234) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:28 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:27 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:42 +0100
Message-ID: <6ace3d28ba0345b6de6ce53a14288dfacee31e2f.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 19/84] x86/mm: switch to new APIs in
 modify_xen_mappings
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClBhZ2UgdGFibGVzIGFsbG9jYXRl
ZCBpbiB0aGF0IGZ1bmN0aW9uIHNob3VsZCBiZSBtYXBwZWQgYW5kIHVubWFwcGVkCm5vdy4KClNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gv
eDg2L21tLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDIzMzNlOTMxNTEuLmQyYjg3
M2E5NTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9t
bS5jCkBAIC01NTY0LDYgKzU1NjQsNyBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25l
ZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogICAgICAgICBpZiAo
IGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFICkKICAgICAgICAgewogICAgICAgICAg
ICAgbDJfcGdlbnRyeV90ICpsMnQ7CisgICAgICAgICAgICBtZm5fdCBtZm47CiAKICAgICAgICAg
ICAgIGlmICggbDJfdGFibGVfb2Zmc2V0KHYpID09IDAgJiYKICAgICAgICAgICAgICAgICAgbDFf
dGFibGVfb2Zmc2V0KHYpID09IDAgJiYKQEAgLTU1ODAsMTMgKzU1ODEsMTUgQEAgaW50IG1vZGlm
eV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVk
IGludCBuZikKICAgICAgICAgICAgIH0KIAogICAgICAgICAgICAgLyogUEFHRTFHQjogc2hhdHRl
ciB0aGUgc3VwZXJwYWdlIGFuZCBmYWxsIHRocm91Z2guICovCi0gICAgICAgICAgICBsMnQgPSBh
bGxvY194ZW5fcGFnZXRhYmxlKCk7Ci0gICAgICAgICAgICBpZiAoICFsMnQgKQorICAgICAgICAg
ICAgbWZuID0gYWxsb2NfeGVuX3BhZ2V0YWJsZV9uZXcoKTsKKyAgICAgICAgICAgIGlmICggbWZu
X2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBB
U1NFUlQocmMgPT0gLUVOT01FTSk7CiAgICAgICAgICAgICAgICAgZ290byBvdXQ7CiAgICAgICAg
ICAgICB9CiAKKyAgICAgICAgICAgIGwydCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOwor
CiAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BBR0VUQUJMRV9FTlRSSUVTOyBpKysg
KQogICAgICAgICAgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4oKnBsM2UpICsKQEAgLTU1OTcsMTQgKzU2
MDAsMTcgQEAgaW50IG1vZGlmeV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25l
ZCBsb25nIGUsIHVuc2lnbmVkIGludCBuZikKICAgICAgICAgICAgIGlmICggKGwzZV9nZXRfZmxh
Z3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCkgJiYKICAgICAgICAgICAgICAgICAgKGwzZV9nZXRf
ZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFKSApCiAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAg
ICAgbDNlX3dyaXRlX2F0b21pYyhwbDNlLCBsM2VfZnJvbV9tZm4odmlydF90b19tZm4obDJ0KSwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX1BB
R0VfSFlQRVJWSVNPUikpOworICAgICAgICAgICAgICAgIGwzZV93cml0ZV9hdG9taWMocGwzZSwg
bDNlX2Zyb21fbWZuKG1mbiwgX19QQUdFX0hZUEVSVklTT1IpKTsKKyAgICAgICAgICAgICAgICBV
Tk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMnQpOwogICAgICAgICAgICAgICAgIGwydCA9IE5VTEw7
CiAgICAgICAgICAgICB9CiAgICAgICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAg
ICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgICAgICBpZiAoIGwydCAp
Ci0gICAgICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwydCk7CisgICAgICAgICAgICB7
CisgICAgICAgICAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDJ0KTsKKyAgICAgICAg
ICAgICAgICBmcmVlX3hlbl9wYWdldGFibGVfbmV3KG1mbik7CisgICAgICAgICAgICB9CiAgICAg
ICAgIH0KIAogICAgICAgICAvKgpAQCAtNTYzOSwxNSArNTY0NSwxOCBAQCBpbnQgbW9kaWZ5X3hl
bl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50
IG5mKQogICAgICAgICAgICAgZWxzZQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIGwx
X3BnZW50cnlfdCAqbDF0OworICAgICAgICAgICAgICAgIG1mbl90IG1mbjsKIAogICAgICAgICAg
ICAgICAgIC8qIFBTRTogc2hhdHRlciB0aGUgc3VwZXJwYWdlIGFuZCB0cnkgYWdhaW4uICovCi0g
ICAgICAgICAgICAgICAgbDF0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwotICAgICAgICAgICAg
ICAgIGlmICggIWwxdCApCisgICAgICAgICAgICAgICAgbWZuID0gYWxsb2NfeGVuX3BhZ2V0YWJs
ZV9uZXcoKTsKKyAgICAgICAgICAgICAgICBpZiAoIG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSAp
CiAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICBBU1NFUlQocmMgPT0gLUVO
T01FTSk7CiAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICAgICAgICAgIH0K
IAorICAgICAgICAgICAgICAgIGwxdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOworCiAg
ICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBMMV9QQUdFVEFCTEVfRU5UUklFUzsgaSsr
ICkKICAgICAgICAgICAgICAgICAgICAgbDFlX3dyaXRlKCZsMXRbaV0sCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsMWVfZnJvbV9wZm4obDJlX2dldF9wZm4oKnBsMmUpICsgaSwKQEAg
LTU2NTcsMTQgKzU2NjYsMTggQEAgaW50IG1vZGlmeV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9u
ZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBuZikKICAgICAgICAgICAgICAgICBp
ZiAoIChsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BSRVNFTlQpICYmCiAgICAgICAgICAg
ICAgICAgICAgICAobDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QU0UpICkKICAgICAgICAg
ICAgICAgICB7Ci0gICAgICAgICAgICAgICAgICAgIGwyZV93cml0ZV9hdG9taWMocGwyZSwgbDJl
X2Zyb21fbWZuKHZpcnRfdG9fbWZuKGwxdCksCisgICAgICAgICAgICAgICAgICAgIGwyZV93cml0
ZV9hdG9taWMocGwyZSwgbDJlX2Zyb21fbWZuKG1mbiwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1IpKTsKKyAg
ICAgICAgICAgICAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDF0KTsKICAgICAgICAg
ICAgICAgICAgICAgbDF0ID0gTlVMTDsKICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAg
ICAgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9w
Z2Rpcl9sb2NrKTsKICAgICAgICAgICAgICAgICBpZiAoIGwxdCApCi0gICAgICAgICAgICAgICAg
ICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShsMXQpOworICAgICAgICAgICAgICAgIHsKKyAgICAgICAg
ICAgICAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDF0KTsKKyAgICAgICAgICAgICAg
ICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOworICAgICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgIH0KICAgICAgICAgfQogICAgICAgICBlbHNlCi0tIAoyLjE3LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
