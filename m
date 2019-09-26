Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA0BEEFA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPZ-0007jQ-92; Thu, 26 Sep 2019 09:50:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPV-0007bg-Uu
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:06 +0000
X-Inumbo-ID: e155b872-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id e155b872-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491348; x=1601027348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/Z9WKLMpqFRozBiJpqcif/gsXhYneDnuhvjAsJE3mek=;
 b=BBpmuyU5UGdyjJ84ldmSigYNQrCeCSCRH+HWfusYDR7QdIvdAM3PyF3q
 KJVV/k3OqlWSptXOCru3VQiAMgsUscaCwhGzBEWa2bWfQhcx4eMRSrg0D
 e5xafaJDNY3ipYOVEXgr8S6Q5LZCLTbZYgZ5iLOsyS+Q627NdA7t0ovGO E=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836988784"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:48:12 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 91941A0380; Thu, 26 Sep 2019 09:48:00 +0000 (UTC)
Received: from EX13D18UWA002.ant.amazon.com (10.43.160.199) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:35 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D18UWA002.ant.amazon.com (10.43.160.199) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:34 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:33 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:45 +0100
Message-ID: <c48109fbff06c95cb4e3126cfae74020498e4e01.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 22/84] x86_64/mm: introduce pl2e in
 paging_init
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkludHJvZHVjZSBwbDJlIHNvIHRo
YXQgd2UgY2FuIHVzZSBsMl9yb19tcHQgdG8gcG9pbnQgdG8gdGhlIHBhZ2UgdGFibGUKaXRzZWxm
LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyB8IDE4ICsrKysrKysr
KystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jCmluZGV4IDc5NWE0Njc0NjIuLmFjNWUzNjZlNWIgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKQEAg
LTQ5Nyw3ICs0OTcsNyBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQogICAgIHVuc2ln
bmVkIGxvbmcgaSwgbXB0X3NpemUsIHZhOwogICAgIHVuc2lnbmVkIGludCBuLCBtZW1mbGFnczsK
ICAgICBsM19wZ2VudHJ5X3QgKmwzX3JvX21wdDsKLSAgICBsMl9wZ2VudHJ5X3QgKmwyX3JvX21w
dCA9IE5VTEw7CisgICAgbDJfcGdlbnRyeV90ICpwbDJlID0gTlVMTCwgKmwyX3JvX21wdDsKICAg
ICBzdHJ1Y3QgcGFnZV9pbmZvICpsMV9wZzsKIAogICAgIC8qCkBAIC01NDcsNyArNTQ3LDcgQEAg
dm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKICAgICAgICAgICAgIChMMl9QQUdFVEFCTEVf
U0hJRlQgLSAzICsgUEFHRV9TSElGVCkpKTsKIAogICAgICAgICBpZiAoIGNwdV9oYXNfcGFnZTFn
YiAmJgotICAgICAgICAgICAgICEoKHVuc2lnbmVkIGxvbmcpbDJfcm9fbXB0ICYgflBBR0VfTUFT
SykgJiYKKyAgICAgICAgICAgICAhKCh1bnNpZ25lZCBsb25nKXBsMmUgJiB+UEFHRV9NQVNLKSAm
JgogICAgICAgICAgICAgIChtcHRfc2l6ZSA+PiBMM19QQUdFVEFCTEVfU0hJRlQpID4gKGkgPj4g
UEFHRVRBQkxFX09SREVSKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHVuc2lnbmVkIGludCBr
LCBob2xlczsKQEAgLTYwNyw3ICs2MDcsNyBAQCB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lk
KQogICAgICAgICAgICAgbWVtc2V0KCh2b2lkICopKFJEV1JfTVBUX1ZJUlRfU1RBUlQgKyAoaSA8
PCBMMl9QQUdFVEFCTEVfU0hJRlQpKSwKICAgICAgICAgICAgICAgICAgICAweEZGLCAxVUwgPDwg
TDJfUEFHRVRBQkxFX1NISUZUKTsKICAgICAgICAgfQotICAgICAgICBpZiAoICEoKHVuc2lnbmVk
IGxvbmcpbDJfcm9fbXB0ICYgflBBR0VfTUFTSykgKQorICAgICAgICBpZiAoICEoKHVuc2lnbmVk
IGxvbmcpcGwyZSAmIH5QQUdFX01BU0spICkKICAgICAgICAgewogICAgICAgICAgICAgaWYgKCAo
bDJfcm9fbXB0ID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgpKSA9PSBOVUxMICkKICAgICAgICAgICAg
ICAgICBnb3RvIG5vbWVtOwpAQCAtNjE1LDEzICs2MTUsMTQgQEAgdm9pZCBfX2luaXQgcGFnaW5n
X2luaXQodm9pZCkKICAgICAgICAgICAgIGwzZV93cml0ZSgmbDNfcm9fbXB0W2wzX3RhYmxlX29m
ZnNldCh2YSldLAogICAgICAgICAgICAgICAgICAgICAgIGwzZV9mcm9tX3BhZGRyKF9fcGEobDJf
cm9fbXB0KSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQ
RVJWSVNPUl9STyB8IF9QQUdFX1VTRVIpKTsKKyAgICAgICAgICAgIHBsMmUgPSBsMl9yb19tcHQ7
CiAgICAgICAgICAgICBBU1NFUlQoIWwyX3RhYmxlX29mZnNldCh2YSkpOwogICAgICAgICB9CiAg
ICAgICAgIC8qIE5CLiBDYW5ub3QgYmUgR0xPQkFMOiBndWVzdCB1c2VyIG1vZGUgc2hvdWxkIG5v
dCBzZWUgaXQuICovCiAgICAgICAgIGlmICggbDFfcGcgKQotICAgICAgICAgICAgbDJlX3dyaXRl
KGwyX3JvX21wdCwgbDJlX2Zyb21fcGFnZSgKKyAgICAgICAgICAgIGwyZV93cml0ZShwbDJlLCBs
MmVfZnJvbV9wYWdlKAogICAgICAgICAgICAgICAgIGwxX3BnLCAvKl9QQUdFX0dMT0JBTHwqL19Q
QUdFX1BTRXxfUEFHRV9VU0VSfF9QQUdFX1BSRVNFTlQpKTsKLSAgICAgICAgbDJfcm9fbXB0Kys7
CisgICAgICAgIHBsMmUrKzsKICAgICB9CiAjdW5kZWYgQ05UCiAjdW5kZWYgTUZOCkBAIC02Mzcs
NyArNjM4LDggQEAgdm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkKICAgICBjbGVhcl9wYWdl
KGwyX3JvX21wdCk7CiAgICAgbDNlX3dyaXRlKCZsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KEhJ
Uk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUKV0sCiAgICAgICAgICAgICAgIGwzZV9mcm9tX3BhZGRy
KF9fcGEobDJfcm9fbXB0KSwgX19QQUdFX0hZUEVSVklTT1JfUk8pKTsKLSAgICBsMl9yb19tcHQg
Kz0gbDJfdGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUKTsKKyAgICBwbDJl
ID0gbDJfcm9fbXB0OworICAgIHBsMmUgKz0gbDJfdGFibGVfb2Zmc2V0KEhJUk9fQ09NUEFUX01Q
VF9WSVJUX1NUQVJUKTsKICAgICAvKiBBbGxvY2F0ZSBhbmQgbWFwIHRoZSBjb21wYXRpYmlsaXR5
IG1vZGUgbWFjaGluZS10by1waHlzIHRhYmxlLiAqLwogICAgIG1wdF9zaXplID0gKG1wdF9zaXpl
ID4+IDEpICsgKDFVTCA8PCAoTDJfUEFHRVRBQkxFX1NISUZUIC0gMSkpOwogICAgIGlmICggbXB0
X3NpemUgPiBSRFdSX0NPTVBBVF9NUFRfVklSVF9FTkQgLSBSRFdSX0NPTVBBVF9NUFRfVklSVF9T
VEFSVCApCkBAIC02NTAsNyArNjUyLDcgQEAgdm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkK
ICAgICAgICAgICAgICBzaXplb2YoKmNvbXBhdF9tYWNoaW5lX3RvX3BoeXNfbWFwcGluZykpCiAg
ICAgQlVJTERfQlVHX09OKChzaXplb2YoKmZyYW1lX3RhYmxlKSAmIH5zaXplb2YoKmZyYW1lX3Rh
YmxlKSkgJSBcCiAgICAgICAgICAgICAgICAgIHNpemVvZigqY29tcGF0X21hY2hpbmVfdG9fcGh5
c19tYXBwaW5nKSk7Ci0gICAgZm9yICggaSA9IDA7IGkgPCAobXB0X3NpemUgPj4gTDJfUEFHRVRB
QkxFX1NISUZUKTsgaSsrLCBsMl9yb19tcHQrKyApCisgICAgZm9yICggaSA9IDA7IGkgPCAobXB0
X3NpemUgPj4gTDJfUEFHRVRBQkxFX1NISUZUKTsgaSsrLCBwbDJlKysgKQogICAgIHsKICAgICAg
ICAgbWVtZmxhZ3MgPSBNRU1GX25vZGUocGh5c190b19uaWQoaSA8PAogICAgICAgICAgICAgKEwy
X1BBR0VUQUJMRV9TSElGVCAtIDIgKyBQQUdFX1NISUZUKSkpOwpAQCAtNjcyLDcgKzY3NCw3IEBA
IHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpCiAgICAgICAgICAgICAgICAgICAgICAgICAo
aSA8PCBMMl9QQUdFVEFCTEVfU0hJRlQpKSwKICAgICAgICAgICAgICAgIDB4RkYsIDFVTCA8PCBM
Ml9QQUdFVEFCTEVfU0hJRlQpOwogICAgICAgICAvKiBOQi4gQ2Fubm90IGJlIEdMT0JBTCBhcyB0
aGUgcHRlcyBnZXQgY29waWVkIGludG8gcGVyLVZNIHNwYWNlLiAqLwotICAgICAgICBsMmVfd3Jp
dGUobDJfcm9fbXB0LCBsMmVfZnJvbV9wYWdlKGwxX3BnLCBfUEFHRV9QU0V8X1BBR0VfUFJFU0VO
VCkpOworICAgICAgICBsMmVfd3JpdGUocGwyZSwgbDJlX2Zyb21fcGFnZShsMV9wZywgX1BBR0Vf
UFNFfF9QQUdFX1BSRVNFTlQpKTsKICAgICB9CiAjdW5kZWYgQ05UCiAjdW5kZWYgTUZOCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
