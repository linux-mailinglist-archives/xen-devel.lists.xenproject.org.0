Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6EBEEDF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQON-0005E1-8a; Thu, 26 Sep 2019 09:48:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOL-0005BO-2w
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:53 +0000
X-Inumbo-ID: d9309ee4-e042-11e9-8628-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id d9309ee4-e042-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491332; x=1601027332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RcEhJ5JylrFM/vWvy+r87bDbpUfrF7kIJMA2aE7t3nw=;
 b=VjadGMPhxOx9t5WD/2pZnOB/991tYib/AXea9fgsFVtj1NUkbzoeUtUs
 ZGgePn7VQF8fiClbttpHQM5wkI4GDTROqywz/5w2YaQU743yU/LVS1LCy
 Wjcz03YOqHqnbFr/33uTPIyvsRqDP0Qm/d4DcH0/2+QOezQsmBe6ddPOW o=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535189"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:48:52 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8D0D2A1DAE; Thu, 26 Sep 2019 09:48:50 +0000 (UTC)
Received: from EX13D31UWA002.ant.amazon.com (10.43.160.82) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:12 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D31UWA002.ant.amazon.com (10.43.160.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:11 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:10 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:06 +0100
Message-ID: <c8fa577e6420c6a82d18aad7ac9b5bc324be25ee.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 43/84] x86_64/mm: map and unmap page tables
 in share_hotadd_m2p_table
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MzEgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4
Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IDM2ZGZhYzExYTMuLjNi
MmIxMzZiNDkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4v
YXJjaC94ODYveDg2XzY0L21tLmMKQEAgLTE2Niw4ICsxNjYsOCBAQCBzdGF0aWMgaW50IHNoYXJl
X2hvdGFkZF9tMnBfdGFibGUoc3RydWN0IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKIHsKICAgICB1
bnNpZ25lZCBsb25nIGksIG4sIHY7CiAgICAgbWZuX3QgbTJwX3N0YXJ0X21mbiA9IElOVkFMSURf
TUZOOwotICAgIGwzX3BnZW50cnlfdCBsM2U7Ci0gICAgbDJfcGdlbnRyeV90IGwyZTsKKyAgICBs
M19wZ2VudHJ5X3QgbDNlLCAqbDN0OworICAgIGwyX3BnZW50cnlfdCBsMmUsICpsMnQ7CiAKICAg
ICAvKiBNMlAgdGFibGUgaXMgbWFwcGFibGUgcmVhZC1vbmx5IGJ5IHByaXZpbGVnZWQgZG9tYWlu
cy4gKi8KICAgICBmb3IgKCB2ICA9IFJEV1JfTVBUX1ZJUlRfU1RBUlQ7CkBAIC0xNzUsMTQgKzE3
NSwyMiBAQCBzdGF0aWMgaW50IHNoYXJlX2hvdGFkZF9tMnBfdGFibGUoc3RydWN0IG1lbV9ob3Rh
ZGRfaW5mbyAqaW5mbykKICAgICAgICAgICB2ICs9IG4gPDwgUEFHRV9TSElGVCApCiAgICAgewog
ICAgICAgICBuID0gTDJfUEFHRVRBQkxFX0VOVFJJRVMgKiBMMV9QQUdFVEFCTEVfRU5UUklFUzsK
LSAgICAgICAgbDNlID0gbDRlX3RvX2wzZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldCh2
KV0pWwotICAgICAgICAgICAgbDNfdGFibGVfb2Zmc2V0KHYpXTsKKworICAgICAgICBsM3QgPSBt
YXBfeGVuX3BhZ2V0YWJsZV9uZXcoCisgICAgICAgICAgICBsNGVfZ2V0X21mbihpZGxlX3BnX3Rh
YmxlW2w0X3RhYmxlX29mZnNldCh2KV0pKTsKKyAgICAgICAgbDNlID0gbDN0W2wzX3RhYmxlX29m
ZnNldCh2KV07CisgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwzdCk7CisKICAgICAg
ICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAg
ICAgIGNvbnRpbnVlOwogICAgICAgICBpZiAoICEobDNlX2dldF9mbGFncyhsM2UpICYgX1BBR0Vf
UFNFKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIG4gPSBMMV9QQUdFVEFCTEVfRU5UUklFUzsK
LSAgICAgICAgICAgIGwyZSA9IGwzZV90b19sMmUobDNlKVtsMl90YWJsZV9vZmZzZXQodildOwor
CisgICAgICAgICAgICBsMnQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDNlX2dldF9tZm4obDNl
KSk7CisgICAgICAgICAgICBsMmUgPSBsMnRbbDJfdGFibGVfb2Zmc2V0KHYpXTsKKyAgICAgICAg
ICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwydCk7CisKICAgICAgICAgICAgIGlmICggIShs
MmVfZ2V0X2ZsYWdzKGwyZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAgICAgICAgICAgY29u
dGludWU7CiAgICAgICAgICAgICBtMnBfc3RhcnRfbWZuID0gbDJlX2dldF9tZm4obDJlKTsKQEAg
LTIwMywxMSArMjExLDE4IEBAIHN0YXRpYyBpbnQgc2hhcmVfaG90YWRkX20ycF90YWJsZShzdHJ1
Y3QgbWVtX2hvdGFkZF9pbmZvICppbmZvKQogICAgICAgICAgIHYgIT0gUkRXUl9DT01QQVRfTVBU
X1ZJUlRfRU5EOwogICAgICAgICAgIHYgKz0gMSA8PCBMMl9QQUdFVEFCTEVfU0hJRlQgKQogICAg
IHsKLSAgICAgICAgbDNlID0gbDRlX3RvX2wzZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNl
dCh2KV0pWwotICAgICAgICAgICAgbDNfdGFibGVfb2Zmc2V0KHYpXTsKKyAgICAgICAgbDN0ID0g
bWFwX3hlbl9wYWdldGFibGVfbmV3KAorICAgICAgICAgICAgbDRlX2dldF9tZm4oaWRsZV9wZ190
YWJsZVtsNF90YWJsZV9vZmZzZXQodildKSk7CisgICAgICAgIGwzZSA9IGwzdFtsM190YWJsZV9v
ZmZzZXQodildOworICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsM3QpOworCiAgICAg
ICAgIGlmICggIShsM2VfZ2V0X2ZsYWdzKGwzZSkgJiBfUEFHRV9QUkVTRU5UKSApCiAgICAgICAg
ICAgICBjb250aW51ZTsKLSAgICAgICAgbDJlID0gbDNlX3RvX2wyZShsM2UpW2wyX3RhYmxlX29m
ZnNldCh2KV07CisKKyAgICAgICAgbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwzZV9nZXRf
bWZuKGwzZSkpOworICAgICAgICBsMmUgPSBsMnRbbDJfdGFibGVfb2Zmc2V0KHYpXTsKKyAgICAg
ICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDJ0KTsKKwogICAgICAgICBpZiAoICEobDJlX2dl
dF9mbGFncyhsMmUpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgICAgICAgICAgY29udGludWU7CiAg
ICAgICAgIG0ycF9zdGFydF9tZm4gPSBsMmVfZ2V0X21mbihsMmUpOwotLSAKMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
