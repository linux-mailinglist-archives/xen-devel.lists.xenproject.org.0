Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D347BEEC4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:50:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQMs-0003f0-V8; Thu, 26 Sep 2019 09:47:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQMs-0003es-Bk
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:47:22 +0000
X-Inumbo-ID: a308f41a-e042-11e9-bf31-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id a308f41a-e042-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491241; x=1601027241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ylxx4KY9/y4YFgv7nP3EOYtykrPz1aPjA0nz6rqmeOA=;
 b=cIxMP0I9O6KH+tTu30YsBHhPK5WwVO7jyv5CgUsZ1pklnU5tDJRl5YV9
 W1JCCKXu0RhHaHQ6lOzUfi1sFpCAsPQjsWMcpylm8T+eBC6b1k6uaK1Xl
 25uh0hL3TpiCja07XiL136JfSg7rHjGkNaI/Wd14pUh+ICO5oLvU8zddV E=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753354010"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:47:21 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id BD8ACA26EE; Thu, 26 Sep 2019 09:47:19 +0000 (UTC)
Received: from EX13D20UWA001.ant.amazon.com (10.43.160.34) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:03 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D20UWA001.ant.amazon.com (10.43.160.34) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:02 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:01 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:28 +0100
Message-ID: <ba21803e1580948932ef03997a0f76eff9ca517f.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 05/84] x86/mm: introduce l{1,
 2}t local variables to modify_xen_mappings
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
cmlhYmxlcyBhcmUgaGVhdmlseSAoYWIpdXNlZCBpbiB0aGF0IGZ1bmN0aW9uLiAgSXQKaXMgZmlu
ZSBhdCB0aGUgbW9tZW50IGJlY2F1c2UgYWxsIHBhZ2UgdGFibGVzIGFyZSBhbHdheXMgbWFwcGVk
IHNvCnRoZXJlIGlzIG5vIG5lZWQgdG8gdHJhY2sgdGhlIGxpZmUgdGltZSBvZiBlYWNoIHZhcmlh
YmxlLgoKV2Ugd2lsbCBzb29uIGhhdmUgdGhlIHJlcXVpcmVtZW50IHRvIG1hcCBhbmQgdW5tYXAg
cGFnZSB0YWJsZXMuIFdlCm5lZWQgdG8gdHJhY2sgdGhlIGxpZmUgdGltZSBvZiBlYWNoIHZhcmlh
YmxlIHRvIGF2b2lkIGxlYWthZ2UuCgpJbnRyb2R1Y2Ugc29tZSBsezEsMn10IHZhcmlhYmxlcyB3
aXRoIGxpbWl0ZWQgc2NvcGUgc28gdGhhdCB3ZSBjYW4KdHJhY2sgbGlmZSB0aW1lIG9mIHBvaW50
ZXJzIHRvIHhlbiBwYWdlIHRhYmxlcyBtb3JlIGVhc2lseS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdl
LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4v
YXJjaC94ODYvbW0uYyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwpp
bmRleCAyYWU4YTc3MzZmLi4wNjNjYWNmZmI4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0u
YworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtNTQyOCw2ICs1NDI4LDggQEAgaW50IG1vZGlm
eV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVk
IGludCBuZikKIAogICAgICAgICBpZiAoIGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNF
ICkKICAgICAgICAgeworICAgICAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQ7CisKICAgICAgICAg
ICAgIGlmICggbDJfdGFibGVfb2Zmc2V0KHYpID09IDAgJiYKICAgICAgICAgICAgICAgICAgbDFf
dGFibGVfb2Zmc2V0KHYpID09IDAgJiYKICAgICAgICAgICAgICAgICAgKChlIC0gdikgPj0gKDFV
TCA8PCBMM19QQUdFVEFCTEVfU0hJRlQpKSApCkBAIC01NDQzLDExICs1NDQ1LDExIEBAIGludCBt
b2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNp
Z25lZCBpbnQgbmYpCiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIC8qIFBBR0UxR0I6IHNo
YXR0ZXIgdGhlIHN1cGVycGFnZSBhbmQgZmFsbCB0aHJvdWdoLiAqLwotICAgICAgICAgICAgcGwy
ZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKLSAgICAgICAgICAgIGlmICggIXBsMmUgKQorICAg
ICAgICAgICAgbDJ0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpOworICAgICAgICAgICAgaWYgKCAh
bDJ0ICkKICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKICAgICAgICAgICAgIGZvciAo
IGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCi0gICAgICAgICAgICAgICAg
bDJlX3dyaXRlKHBsMmUgKyBpLAorICAgICAgICAgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4oKnBsM2Up
ICsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpIDw8IFBBR0VUQUJM
RV9PUkRFUiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsM2VfZ2V0
X2ZsYWdzKCpwbDNlKSkpOwpAQCAtNTQ1NiwxNCArNTQ1OCwxNCBAQCBpbnQgbW9kaWZ5X3hlbl9t
YXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5m
KQogICAgICAgICAgICAgaWYgKCAobDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9QUkVTRU5U
KSAmJgogICAgICAgICAgICAgICAgICAobDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9QU0Up
ICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBsM2Vfd3JpdGVfYXRvbWljKHBsM2Us
IGwzZV9mcm9tX21mbih2aXJ0X3RvX21mbihwbDJlKSwKKyAgICAgICAgICAgICAgICBsM2Vfd3Jp
dGVfYXRvbWljKHBsM2UsIGwzZV9mcm9tX21mbih2aXJ0X3RvX21mbihsMnQpLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJ
U09SKSk7Ci0gICAgICAgICAgICAgICAgcGwyZSA9IE5VTEw7CisgICAgICAgICAgICAgICAgbDJ0
ID0gTlVMTDsKICAgICAgICAgICAgIH0KICAgICAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAg
ICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKLSAgICAgICAgICAgIGlm
ICggcGwyZSApCi0gICAgICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKHBsMmUpOworICAg
ICAgICAgICAgaWYgKCBsMnQgKQorICAgICAgICAgICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShs
MnQpOwogICAgICAgICB9CiAKICAgICAgICAgLyoKQEAgLTU0OTcsMTIgKzU0OTksMTQgQEAgaW50
IG1vZGlmeV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVu
c2lnbmVkIGludCBuZikKICAgICAgICAgICAgIH0KICAgICAgICAgICAgIGVsc2UKICAgICAgICAg
ICAgIHsKKyAgICAgICAgICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdDsKKwogICAgICAgICAgICAg
ICAgIC8qIFBTRTogc2hhdHRlciB0aGUgc3VwZXJwYWdlIGFuZCB0cnkgYWdhaW4uICovCi0gICAg
ICAgICAgICAgICAgcGwxZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKLSAgICAgICAgICAgICAg
ICBpZiAoICFwbDFlICkKKyAgICAgICAgICAgICAgICBsMXQgPSBhbGxvY194ZW5fcGFnZXRhYmxl
KCk7CisgICAgICAgICAgICAgICAgaWYgKCAhbDF0ICkKICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9NRU07CiAgICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBMMV9QQUdFVEFC
TEVfRU5UUklFUzsgaSsrICkKLSAgICAgICAgICAgICAgICAgICAgbDFlX3dyaXRlKCZwbDFlW2ld
LAorICAgICAgICAgICAgICAgICAgICBsMWVfd3JpdGUoJmwxdFtpXSwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGwxZV9mcm9tX3BmbihsMmVfZ2V0X3BmbigqcGwyZSkgKyBpLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGwyZV9nZXRfZmxhZ3MoKnBs
MmUpICYgfl9QQUdFX1BTRSkpOwogICAgICAgICAgICAgICAgIGlmICggbG9ja2luZyApCkBAIC01
NTEwLDE5ICs1NTE0LDE5IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcg
cywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgICAgICAgICAgICAgaWYg
KCAobDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QUkVTRU5UKSAmJgogICAgICAgICAgICAg
ICAgICAgICAgKGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFKSApCiAgICAgICAgICAg
ICAgICAgewotICAgICAgICAgICAgICAgICAgICBsMmVfd3JpdGVfYXRvbWljKHBsMmUsIGwyZV9m
cm9tX21mbih2aXJ0X3RvX21mbihwbDFlKSwKKyAgICAgICAgICAgICAgICAgICAgbDJlX3dyaXRl
X2F0b21pYyhwbDJlLCBsMmVfZnJvbV9tZm4odmlydF90b19tZm4obDF0KSwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVS
VklTT1IpKTsKLSAgICAgICAgICAgICAgICAgICAgcGwxZSA9IE5VTEw7CisgICAgICAgICAgICAg
ICAgICAgIGwxdCA9IE5VTEw7CiAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgIGlm
ICggbG9ja2luZyApCiAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdkaXJf
bG9jayk7Ci0gICAgICAgICAgICAgICAgaWYgKCBwbDFlICkKLSAgICAgICAgICAgICAgICAgICAg
ZnJlZV94ZW5fcGFnZXRhYmxlKHBsMWUpOworICAgICAgICAgICAgICAgIGlmICggbDF0ICkKKyAg
ICAgICAgICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwxdCk7CiAgICAgICAgICAgICB9
CiAgICAgICAgIH0KICAgICAgICAgZWxzZQogICAgICAgICB7Ci0gICAgICAgICAgICBsMV9wZ2Vu
dHJ5X3QgbmwxZTsKKyAgICAgICAgICAgIGwxX3BnZW50cnlfdCBubDFlLCAqbDF0OwogCiAgICAg
ICAgICAgICAvKgogICAgICAgICAgICAgICogT3JkaW5hcnkgNGtCIG1hcHBpbmc6IFRoZSBMMiBl
bnRyeSBoYXMgYmVlbiB2ZXJpZmllZCB0byBiZQpAQCAtNTU2OSw5ICs1NTczLDkgQEAgaW50IG1v
ZGlmeV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2ln
bmVkIGludCBuZikKICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgIH0KIAot
ICAgICAgICAgICAgcGwxZSA9IGwyZV90b19sMWUoKnBsMmUpOworICAgICAgICAgICAgbDF0ID0g
bDJlX3RvX2wxZSgqcGwyZSk7CiAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwxX1BBR0VU
QUJMRV9FTlRSSUVTOyBpKysgKQotICAgICAgICAgICAgICAgIGlmICggbDFlX2dldF9pbnRwdGUo
cGwxZVtpXSkgIT0gMCApCisgICAgICAgICAgICAgICAgaWYgKCBsMWVfZ2V0X2ludHB0ZShsMXRb
aV0pICE9IDAgKQogICAgICAgICAgICAgICAgICAgICBicmVhazsKICAgICAgICAgICAgIGlmICgg
aSA9PSBMMV9QQUdFVEFCTEVfRU5UUklFUyApCiAgICAgICAgICAgICB7CkBAIC01NTgwLDcgKzU1
ODQsNyBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVk
IGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogICAgICAgICAgICAgICAgIGlmICggbG9ja2luZyAp
CiAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAg
ICAgICAgICAgICAgZmx1c2hfYXJlYShOVUxMLCBGTFVTSF9UTEJfR0xPQkFMKTsgLyogZmx1c2gg
YmVmb3JlIGZyZWUgKi8KLSAgICAgICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUocGwxZSk7
CisgICAgICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwxdCk7CiAgICAgICAgICAgICB9
CiAgICAgICAgICAgICBlbHNlIGlmICggbG9ja2luZyApCiAgICAgICAgICAgICAgICAgc3Bpbl91
bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKQEAgLTU2MDksMjEgKzU2MTMsMjUgQEAgaW50IG1vZGlm
eV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVk
IGludCBuZikKICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICB9CiAKLSAgICAgICAgcGwy
ZSA9IGwzZV90b19sMmUoKnBsM2UpOwotICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BBR0VU
QUJMRV9FTlRSSUVTOyBpKysgKQotICAgICAgICAgICAgaWYgKCBsMmVfZ2V0X2ludHB0ZShwbDJl
W2ldKSAhPSAwICkKLSAgICAgICAgICAgICAgICBicmVhazsKLSAgICAgICAgaWYgKCBpID09IEwy
X1BBR0VUQUJMRV9FTlRSSUVTICkKICAgICAgICAgewotICAgICAgICAgICAgLyogRW1wdHk6IHph
cCB0aGUgTDNFIGFuZCBmcmVlIHRoZSBMMiBwYWdlLiAqLwotICAgICAgICAgICAgbDNlX3dyaXRl
X2F0b21pYyhwbDNlLCBsM2VfZW1wdHkoKSk7Ci0gICAgICAgICAgICBpZiAoIGxvY2tpbmcgKQor
ICAgICAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQ7CisKKyAgICAgICAgICAgIGwydCA9IGwzZV90
b19sMmUoKnBsM2UpOworICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBMMl9QQUdFVEFCTEVf
RU5UUklFUzsgaSsrICkKKyAgICAgICAgICAgICAgICBpZiAoIGwyZV9nZXRfaW50cHRlKGwydFtp
XSkgIT0gMCApCisgICAgICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgaWYgKCBp
ID09IEwyX1BBR0VUQUJMRV9FTlRSSUVTICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAg
ICAvKiBFbXB0eTogemFwIHRoZSBMM0UgYW5kIGZyZWUgdGhlIEwyIHBhZ2UuICovCisgICAgICAg
ICAgICAgICAgbDNlX3dyaXRlX2F0b21pYyhwbDNlLCBsM2VfZW1wdHkoKSk7CisgICAgICAgICAg
ICAgICAgaWYgKCBsb2NraW5nICkKKyAgICAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1h
cF9wZ2Rpcl9sb2NrKTsKKyAgICAgICAgICAgICAgICBmbHVzaF9hcmVhKE5VTEwsIEZMVVNIX1RM
Ql9HTE9CQUwpOyAvKiBmbHVzaCBiZWZvcmUgZnJlZSAqLworICAgICAgICAgICAgICAgIGZyZWVf
eGVuX3BhZ2V0YWJsZShsMnQpOworICAgICAgICAgICAgfQorICAgICAgICAgICAgZWxzZSBpZiAo
IGxvY2tpbmcgKQogICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7
Ci0gICAgICAgICAgICBmbHVzaF9hcmVhKE5VTEwsIEZMVVNIX1RMQl9HTE9CQUwpOyAvKiBmbHVz
aCBiZWZvcmUgZnJlZSAqLwotICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKHBsMmUpOwog
ICAgICAgICB9Ci0gICAgICAgIGVsc2UgaWYgKCBsb2NraW5nICkKLSAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAgfQogCiAgICAgZmx1c2hfYXJlYShOVUxMLCBG
TFVTSF9UTEJfR0xPQkFMKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
