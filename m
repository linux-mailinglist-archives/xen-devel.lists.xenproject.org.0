Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C15BEEB9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:49:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQMd-0003cX-Gg; Thu, 26 Sep 2019 09:47:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQMb-0003bg-JP
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:47:05 +0000
X-Inumbo-ID: 98f1bd54-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 98f1bd54-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491224; x=1601027224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=IwBygj+RhjB/roSYIAno5ZW1vZEaPnrSx3ay7bN2WgM=;
 b=IazlgGnw7nOwXEWfUhNyLxqwrBlLENHgv6ZMLvVsLvyfGpwHp5ZKzHpn
 Eew8Stb2YZk/EFr+Osdl3NTntwhtLlrUs1aAhRhZ4ur5+gZiP+beOMgSj
 +Zir9iRasy0o+Cg5nZr1+4xRZ/wjVOV4rR6MtqGsCB86JZES28VhbDyh5 U=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753353976"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:47:03 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7092F141773; Thu, 26 Sep 2019 09:47:01 +0000 (UTC)
Received: from EX13D13UWA001.ant.amazon.com (10.43.160.136) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:01 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D13UWA001.ant.amazon.com (10.43.160.136) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:00 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:46:59 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:27 +0100
Message-ID: <57342866b36c4c5184a4e378f1993e985c6c3115.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 04/84] x86/mm: introduce l{1,
 2}t local variables to map_pages_to_xen
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoZSBwbDJlIGFuZCBwbDFlIHZh
cmlhYmxlcyBhcmUgaGVhdmlseSAoYWIpdXNlZCBpbiB0aGF0IGZ1bmN0aW9uLiBJdAppcyBmaW5l
IGF0IHRoZSBtb21lbnQgYmVjYXVzZSBhbGwgcGFnZSB0YWJsZXMgYXJlIGFsd2F5cyBtYXBwZWQg
c28KdGhlcmUgaXMgbm8gbmVlZCB0byB0cmFjayB0aGUgbGlmZSB0aW1lIG9mIGVhY2ggdmFyaWFi
bGUuCgpXZSB3aWxsIHNvb24gaGF2ZSB0aGUgcmVxdWlyZW1lbnQgdG8gbWFwIGFuZCB1bm1hcCBw
YWdlIHRhYmxlcy4gV2UKbmVlZCB0byB0cmFjayB0aGUgbGlmZSB0aW1lIG9mIGVhY2ggdmFyaWFi
bGUgdG8gYXZvaWQgbGVha2FnZS4KCkludHJvZHVjZSBzb21lIGx7MSwyfXQgdmFyaWFibGVzIHdp
dGggbGltaXRlZCBzY29wZSBzbyB0aGF0IHdlIGNhbgp0cmFjayBsaWZlIHRpbWUgb2YgcG9pbnRl
cnMgdG8geGVuIHBhZ2UgdGFibGVzIG1vcmUgZWFzaWx5LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2Uu
CgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9tbS5jIHwgNzUgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmlu
ZGV4IGUyYzhjM2YzYTEuLjJhZThhNzczNmYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC01MDYxLDEwICs1MDYxLDEyIEBAIGludCBtYXBf
cGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICBlbHNlCiAg
ICAgICAgICAgICAgICAgewotICAgICAgICAgICAgICAgICAgICBwbDJlID0gbDNlX3RvX2wyZShv
bDNlKTsKKyAgICAgICAgICAgICAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQ7CisKKyAgICAgICAg
ICAgICAgICAgICAgbDJ0ID0gbDNlX3RvX2wyZShvbDNlKTsKICAgICAgICAgICAgICAgICAgICAg
Zm9yICggaSA9IDA7IGkgPCBMMl9QQUdFVEFCTEVfRU5UUklFUzsgaSsrICkKICAgICAgICAgICAg
ICAgICAgICAgewotICAgICAgICAgICAgICAgICAgICAgICAgb2wyZSA9IHBsMmVbaV07CisgICAg
ICAgICAgICAgICAgICAgICAgICBvbDJlID0gbDJ0W2ldOwogICAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKCAhKGwyZV9nZXRfZmxhZ3Mob2wyZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoIGwyZV9nZXRfZmxhZ3Mob2wyZSkgJiBfUEFHRV9QU0UgKQpAQCAtNTA3MiwyMSArNTA3NCwy
MiBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2UK
ICAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgajsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBsMV9wZ2VudHJ5X3Qg
KmwxdDsKIAotICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBsMWUgPSBsMmVfdG9fbDFlKG9s
MmUpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgIGwxdCA9IGwyZV90b19sMWUob2wyZSk7
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9yICggaiA9IDA7IGogPCBMMV9QQUdFVEFC
TEVfRU5UUklFUzsgaisrICkKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hf
ZmxhZ3MobDFlX2dldF9mbGFncyhwbDFlW2pdKSk7CisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZsdXNoX2ZsYWdzKGwxZV9nZXRfZmxhZ3MobDF0W2pdKSk7CiAgICAgICAgICAgICAg
ICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICAgICAg
Zmx1c2hfYXJlYSh2aXJ0LCBmbHVzaF9mbGFncyk7CiAgICAgICAgICAgICAgICAgICAgIGZvciAo
IGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCiAgICAgICAgICAgICAgICAg
ICAgIHsKLSAgICAgICAgICAgICAgICAgICAgICAgIG9sMmUgPSBwbDJlW2ldOworICAgICAgICAg
ICAgICAgICAgICAgICAgb2wyZSA9IGwydFtpXTsKICAgICAgICAgICAgICAgICAgICAgICAgIGlm
ICggKGwyZV9nZXRfZmxhZ3Mob2wyZSkgJiBfUEFHRV9QUkVTRU5UKSAmJgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAhKGwyZV9nZXRfZmxhZ3Mob2wyZSkgJiBfUEFHRV9QU0UpICkKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUobDJlX3RvX2wxZShv
bDJlKSk7CiAgICAgICAgICAgICAgICAgICAgIH0KLSAgICAgICAgICAgICAgICAgICAgZnJlZV94
ZW5fcGFnZXRhYmxlKHBsMmUpOworICAgICAgICAgICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFi
bGUobDJ0KTsKICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICB9CiAKQEAgLTUxMDIsNiAr
NTEwNSw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAgICB7CiAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPQogICAgICAgICAgICAgICAgIEZMVVNIX1RMQiB8IEZM
VVNIX09SREVSKDIgKiBQQUdFVEFCTEVfT1JERVIpOworICAgICAgICAgICAgbDJfcGdlbnRyeV90
ICpsMnQ7CiAKICAgICAgICAgICAgIC8qIFNraXAgdGhpcyBQVEUgaWYgdGhlcmUgaXMgbm8gY2hh
bmdlLiAqLwogICAgICAgICAgICAgaWYgKCAoKGwzZV9nZXRfcGZuKG9sM2UpICYgfihMMl9QQUdF
VEFCTEVfRU5UUklFUyAqCkBAIC01MTIzLDEyICs1MTI3LDEyIEBAIGludCBtYXBfcGFnZXNfdG9f
eGVuKAogICAgICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICAgICAgfQogCi0gICAgICAg
ICAgICBwbDJlID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwotICAgICAgICAgICAgaWYgKCBwbDJl
ID09IE5VTEwgKQorICAgICAgICAgICAgbDJ0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOworICAg
ICAgICAgICAgaWYgKCBsMnQgPT0gTlVMTCApCiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07CiAKICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7
IGkrKyApCi0gICAgICAgICAgICAgICAgbDJlX3dyaXRlKHBsMmUgKyBpLAorICAgICAgICAgICAg
ICAgIGwyZV93cml0ZShsMnQgKyBpLAogICAgICAgICAgICAgICAgICAgICAgICAgICBsMmVfZnJv
bV9wZm4obDNlX2dldF9wZm4ob2wzZSkgKwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGkgPDwgUEFHRVRBQkxFX09SREVSKSwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGwzZV9nZXRfZmxhZ3Mob2wzZSkpKTsKQEAgLTUxNDEsMTUgKzUxNDUs
MTUgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICBpZiAoIChsM2VfZ2V0X2Zs
YWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNFTlQpICYmCiAgICAgICAgICAgICAgICAgIChsM2VfZ2V0
X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BTRSkgKQogICAgICAgICAgICAgewotICAgICAgICAgICAg
ICAgIGwzZV93cml0ZV9hdG9taWMocGwzZSwgbDNlX2Zyb21fbWZuKHZpcnRfdG9fbWZuKHBsMmUp
LAorICAgICAgICAgICAgICAgIGwzZV93cml0ZV9hdG9taWMocGwzZSwgbDNlX2Zyb21fbWZuKHZp
cnRfdG9fbWZuKGwydCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1IpKTsKLSAgICAgICAgICAgICAgICBwbDJlID0g
TlVMTDsKKyAgICAgICAgICAgICAgICBsMnQgPSBOVUxMOwogICAgICAgICAgICAgfQogICAgICAg
ICAgICAgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFwX3Bn
ZGlyX2xvY2spOwogICAgICAgICAgICAgZmx1c2hfYXJlYSh2aXJ0LCBmbHVzaF9mbGFncyk7Ci0g
ICAgICAgICAgICBpZiAoIHBsMmUgKQotICAgICAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJs
ZShwbDJlKTsKKyAgICAgICAgICAgIGlmICggbDJ0ICkKKyAgICAgICAgICAgICAgICBmcmVlX3hl
bl9wYWdldGFibGUobDJ0KTsKICAgICAgICAgfQogCiAgICAgICAgIHBsMmUgPSB2aXJ0X3RvX3hl
bl9sMmUodmlydCk7CkBAIC01MTc3LDExICs1MTgxLDEzIEBAIGludCBtYXBfcGFnZXNfdG9feGVu
KAogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICAg
ICAgewotICAgICAgICAgICAgICAgICAgICBwbDFlID0gbDJlX3RvX2wxZShvbDJlKTsKKyAgICAg
ICAgICAgICAgICAgICAgbDFfcGdlbnRyeV90ICpsMXQ7CisKKyAgICAgICAgICAgICAgICAgICAg
bDF0ID0gbDJlX3RvX2wxZShvbDJlKTsKICAgICAgICAgICAgICAgICAgICAgZm9yICggaSA9IDA7
IGkgPCBMMV9QQUdFVEFCTEVfRU5UUklFUzsgaSsrICkKLSAgICAgICAgICAgICAgICAgICAgICAg
IGZsdXNoX2ZsYWdzKGwxZV9nZXRfZmxhZ3MocGwxZVtpXSkpOworICAgICAgICAgICAgICAgICAg
ICAgICAgZmx1c2hfZmxhZ3MobDFlX2dldF9mbGFncyhsMXRbaV0pKTsKICAgICAgICAgICAgICAg
ICAgICAgZmx1c2hfYXJlYSh2aXJ0LCBmbHVzaF9mbGFncyk7Ci0gICAgICAgICAgICAgICAgICAg
IGZyZWVfeGVuX3BhZ2V0YWJsZShwbDFlKTsKKyAgICAgICAgICAgICAgICAgICAgZnJlZV94ZW5f
cGFnZXRhYmxlKGwxdCk7CiAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgfQogCkBAIC01
MjAzLDYgKzUyMDksNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPQogICAgICAgICAgICAgICAg
ICAgICBGTFVTSF9UTEIgfCBGTFVTSF9PUkRFUihQQUdFVEFCTEVfT1JERVIpOworICAgICAgICAg
ICAgICAgIGwxX3BnZW50cnlfdCAqbDF0OwogCiAgICAgICAgICAgICAgICAgLyogU2tpcCB0aGlz
IFBURSBpZiB0aGVyZSBpcyBubyBjaGFuZ2UuICovCiAgICAgICAgICAgICAgICAgaWYgKCAoKChs
MmVfZ2V0X3BmbigqcGwyZSkgJiB+KEwxX1BBR0VUQUJMRV9FTlRSSUVTIC0gMSkpICsKQEAgLTUy
MjIsMTIgKzUyMjksMTIgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gY2hlY2tfbDM7CiAgICAgICAgICAgICAgICAgfQogCi0gICAgICAgICAgICAgICAg
cGwxZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKLSAgICAgICAgICAgICAgICBpZiAoIHBsMWUg
PT0gTlVMTCApCisgICAgICAgICAgICAgICAgbDF0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOwor
ICAgICAgICAgICAgICAgIGlmICggbDF0ID09IE5VTEwgKQogICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT01FTTsKIAogICAgICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgTDFfUEFH
RVRBQkxFX0VOVFJJRVM7IGkrKyApCi0gICAgICAgICAgICAgICAgICAgIGwxZV93cml0ZSgmcGwx
ZVtpXSwKKyAgICAgICAgICAgICAgICAgICAgbDFlX3dyaXRlKCZsMXRbaV0sCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsMWVfZnJvbV9wZm4obDJlX2dldF9wZm4oKnBsMmUpICsgaSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsTmZfdG9fbDFmKGwy
ZV9nZXRfZmxhZ3MoKnBsMmUpKSkpOwogCkBAIC01MjM5LDE1ICs1MjQ2LDE1IEBAIGludCBtYXBf
cGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgIGlmICggKGwyZV9nZXRfZmxhZ3MoKnBsMmUp
ICYgX1BBR0VfUFJFU0VOVCkgJiYKICAgICAgICAgICAgICAgICAgICAgIChsMmVfZ2V0X2ZsYWdz
KCpwbDJlKSAmIF9QQUdFX1BTRSkgKQogICAgICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAg
ICAgICAgbDJlX3dyaXRlX2F0b21pYyhwbDJlLCBsMmVfZnJvbV9tZm4odmlydF90b19tZm4ocGwx
ZSksCisgICAgICAgICAgICAgICAgICAgIGwyZV93cml0ZV9hdG9taWMocGwyZSwgbDJlX2Zyb21f
bWZuKHZpcnRfdG9fbWZuKGwxdCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJU09SKSk7Ci0gICAgICAgICAgICAg
ICAgICAgIHBsMWUgPSBOVUxMOworICAgICAgICAgICAgICAgICAgICBsMXQgPSBOVUxMOwogICAg
ICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAg
ICAgICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICAgICAgICAg
IGZsdXNoX2FyZWEodmlydCwgZmx1c2hfZmxhZ3MpOwotICAgICAgICAgICAgICAgIGlmICggcGwx
ZSApCi0gICAgICAgICAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShwbDFlKTsKKyAgICAg
ICAgICAgICAgICBpZiAoIGwxdCApCisgICAgICAgICAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0
YWJsZShsMXQpOwogICAgICAgICAgICAgfQogCiAgICAgICAgICAgICBwbDFlICA9IGwyZV90b19s
MWUoKnBsMmUpICsgbDFfdGFibGVfb2Zmc2V0KHZpcnQpOwpAQCAtNTI3Miw2ICs1Mjc5LDcgQEAg
aW50IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICAgICAgICAgICgoMXUgPDwgUEFHRVRB
QkxFX09SREVSKSAtIDEpKSA9PSAwKSkgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgYmFzZV9tZm47CisgICAgICAgICAgICAgICAgbDFfcGdlbnRyeV90ICps
MXQ7CiAKICAgICAgICAgICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgICAgICAg
ICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKQEAgLTUyOTUsMTEgKzUzMDMsMTEgQEAgaW50
IG1hcF9wYWdlc190b194ZW4oCiAgICAgICAgICAgICAgICAgICAgIGdvdG8gY2hlY2tfbDM7CiAg
ICAgICAgICAgICAgICAgfQogCi0gICAgICAgICAgICAgICAgcGwxZSA9IGwyZV90b19sMWUob2wy
ZSk7Ci0gICAgICAgICAgICAgICAgYmFzZV9tZm4gPSBsMWVfZ2V0X3BmbigqcGwxZSkgJiB+KEwx
X1BBR0VUQUJMRV9FTlRSSUVTIC0gMSk7Ci0gICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkg
PCBMMV9QQUdFVEFCTEVfRU5UUklFUzsgaSsrLCBwbDFlKysgKQotICAgICAgICAgICAgICAgICAg
ICBpZiAoIChsMWVfZ2V0X3BmbigqcGwxZSkgIT0gKGJhc2VfbWZuICsgaSkpIHx8Ci0gICAgICAg
ICAgICAgICAgICAgICAgICAgKGwxZV9nZXRfZmxhZ3MoKnBsMWUpICE9IGZsYWdzKSApCisgICAg
ICAgICAgICAgICAgbDF0ID0gbDJlX3RvX2wxZShvbDJlKTsKKyAgICAgICAgICAgICAgICBiYXNl
X21mbiA9IGwxZV9nZXRfcGZuKGwxdFswXSkgJiB+KEwxX1BBR0VUQUJMRV9FTlRSSUVTIC0gMSk7
CisgICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBMMV9QQUdFVEFCTEVfRU5UUklFUzsg
aSsrICkKKyAgICAgICAgICAgICAgICAgICAgaWYgKCAobDFlX2dldF9wZm4obDF0W2ldKSAhPSAo
YmFzZV9tZm4gKyBpKSkgfHwKKyAgICAgICAgICAgICAgICAgICAgICAgICAobDFlX2dldF9mbGFn
cyhsMXRbaV0pICE9IGZsYWdzKSApCiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKICAg
ICAgICAgICAgICAgICBpZiAoIGkgPT0gTDFfUEFHRVRBQkxFX0VOVFJJRVMgKQogICAgICAgICAg
ICAgICAgIHsKQEAgLTUzMjUsNiArNTMzMyw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAg
ICAgICAgICAgICAgICgoMVVMIDw8IChMM19QQUdFVEFCTEVfU0hJRlQgLSBQQUdFX1NISUZUKSkg
LSAxKSkpICkKICAgICAgICAgewogICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBiYXNlX21mbjsK
KyAgICAgICAgICAgIGwyX3BnZW50cnlfdCAqbDJ0OwogCiAgICAgICAgICAgICBpZiAoIGxvY2tp
bmcgKQogICAgICAgICAgICAgICAgIHNwaW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOwpAQCAtNTM0
MiwxMyArNTM1MSwxMyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgICAgICBj
b250aW51ZTsKICAgICAgICAgICAgIH0KIAotICAgICAgICAgICAgcGwyZSA9IGwzZV90b19sMmUo
b2wzZSk7Ci0gICAgICAgICAgICBiYXNlX21mbiA9IGwyZV9nZXRfcGZuKCpwbDJlKSAmIH4oTDJf
UEFHRVRBQkxFX0VOVFJJRVMgKgorICAgICAgICAgICAgbDJ0ID0gbDNlX3RvX2wyZShvbDNlKTsK
KyAgICAgICAgICAgIGJhc2VfbWZuID0gbDJlX2dldF9wZm4obDJ0WzBdKSAmIH4oTDJfUEFHRVRB
QkxFX0VOVFJJRVMgKgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEwxX1BBR0VUQUJMRV9FTlRSSUVTIC0gMSk7Ci0gICAgICAgICAgICBmb3IgKCBpID0gMDsg
aSA8IEwyX1BBR0VUQUJMRV9FTlRSSUVTOyBpKyssIHBsMmUrKyApCi0gICAgICAgICAgICAgICAg
aWYgKCAobDJlX2dldF9wZm4oKnBsMmUpICE9CisgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8
IEwyX1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQorICAgICAgICAgICAgICAgIGlmICggKGwyZV9n
ZXRfcGZuKGwydFtpXSkgIT0KICAgICAgICAgICAgICAgICAgICAgICAoYmFzZV9tZm4gKyAoaSA8
PCBQQUdFVEFCTEVfT1JERVIpKSkgfHwKLSAgICAgICAgICAgICAgICAgICAgIChsMmVfZ2V0X2Zs
YWdzKCpwbDJlKSAhPSBsMWZfdG9fbE5mKGZsYWdzKSkgKQorICAgICAgICAgICAgICAgICAgICAg
KGwyZV9nZXRfZmxhZ3MobDJ0W2ldKSAhPSBsMWZfdG9fbE5mKGZsYWdzKSkgKQogICAgICAgICAg
ICAgICAgICAgICBicmVhazsKICAgICAgICAgICAgIGlmICggaSA9PSBMMl9QQUdFVEFCTEVfRU5U
UklFUyApCiAgICAgICAgICAgICB7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
