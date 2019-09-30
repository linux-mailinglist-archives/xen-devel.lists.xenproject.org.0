Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB31C1F24
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1Q-0007vv-FD; Mon, 30 Sep 2019 10:35:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1O-0007uK-Ut
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:14 +0000
X-Inumbo-ID: efd5ff08-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id efd5ff08-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839692; x=1601375692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=gu2E4m0AtO6nGVE9CH0eP7a1+B0fb6VtXGPXw6YGSZQ=;
 b=UdKy0KteZY1KABYAnNw5KDIEjzRdxT9WMakgvMECowII2nbCtfTRdOrK
 PYdM9Rp0UftZ0NwZ9nfzsAJqTGQPZshw3Txwvyh9izKQ2Or5JJZmS4Xcv
 hVwkj0LnV5PsMCwDht/6pBP+gC+Pu51iDqLZkqI6js1q1mrp8AeRaBN8+ 8=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="754242266"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Sep 2019 10:34:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3F7A5282413; Mon, 30 Sep 2019 10:34:52 +0000 (UTC)
Received: from EX13D20UEE003.ant.amazon.com (10.43.62.146) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:25 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D20UEE003.ant.amazon.com (10.43.62.146) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:25 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:24 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:29 +0100
Message-ID: <2cbd893129d3d74c927d8ce17082ed331f655af6.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 37/55] x86/smpboot: switch pl1e to use new
 APIs in clone_mapping
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDE4
ICsrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9h
cmNoL3g4Ni9zbXBib290LmMKaW5kZXggZDMyN2MwNjJiMS4uOTU2ZTFiZGJjYyAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBA
IC02NjYsNyArNjY2LDcgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0
ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7CiAgICAgbDNf
cGdlbnRyeV90ICpwbDNlID0gTlVMTDsKICAgICBsMl9wZ2VudHJ5X3QgKnBsMmUgPSBOVUxMOwot
ICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKKyAgICBsMV9wZ2VudHJ5X3QgKnBsMWUgPSBOVUxMOwog
ICAgIGludCByYzsKIAogICAgIC8qCkBAIC03MTMsNyArNzEzLDggQEAgc3RhdGljIGludCBjbG9u
ZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICAgICAg
fQogICAgICAgICBlbHNlCiAgICAgICAgIHsKLSAgICAgICAgICAgIHBsMWUgPSBsMmVfdG9fbDFl
KCpwbDJlKSArIGwxX3RhYmxlX29mZnNldChsaW5lYXIpOworICAgICAgICAgICAgcGwxZSA9IG1h
cF94ZW5fcGFnZXRhYmxlX25ldyhsMmVfZ2V0X21mbigqcGwyZSkpOworICAgICAgICAgICAgcGwx
ZSArPSBsMV90YWJsZV9vZmZzZXQobGluZWFyKTsKICAgICAgICAgICAgIGZsYWdzID0gbDFlX2dl
dF9mbGFncygqcGwxZSk7CiAgICAgICAgICAgICBpZiAoICEoZmxhZ3MgJiBfUEFHRV9QUkVTRU5U
KSApCiAgICAgICAgICAgICB7CkBAIC03MjQsNiArNzI1LDcgQEAgc3RhdGljIGludCBjbG9uZV9t
YXBwaW5nKGNvbnN0IHZvaWQgKnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICAgICAgfQog
ICAgIH0KIAorICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsMWUpOwogICAgIFVOTUFQX1hF
Tl9QQUdFVEFCTEVfTkVXKHBsMmUpOwogICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsM2Up
OwogCkBAIC03NzIsMTkgKzc3NCwyMiBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBpbmcoY29uc3Qg
dm9pZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQogCiAgICAgaWYgKCAhKGwyZV9nZXRfZmxh
Z3MoKnBsMmUpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgIHsKLSAgICAgICAgcGwxZSA9IGFsbG9j
X3hlbl9wYWdldGFibGUoKTsKLSAgICAgICAgaWYgKCAhcGwxZSApCisgICAgICAgIG1mbl90IGwx
dF9tZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOworCisgICAgICAgIGlmICggbWZuX2Vx
KGwxdF9tZm4sIElOVkFMSURfTUZOKSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHJjID0gLUVO
T01FTTsKICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICB9CisKKyAgICAgICAgcGwxZSA9
IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsMXRfbWZuKTsKICAgICAgICAgY2xlYXJfcGFnZShwbDFl
KTsKLSAgICAgICAgbDJlX3dyaXRlKHBsMmUsIGwyZV9mcm9tX3BhZGRyKF9fcGEocGwxZSksIF9f
UEFHRV9IWVBFUlZJU09SKSk7CisgICAgICAgIGwyZV93cml0ZShwbDJlLCBsMmVfZnJvbV9tZm4o
bDF0X21mbiwgX19QQUdFX0hZUEVSVklTT1IpKTsKICAgICB9CiAgICAgZWxzZQogICAgIHsKICAg
ICAgICAgQVNTRVJUKCEobDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QU0UpKTsKLSAgICAg
ICAgcGwxZSA9IGwyZV90b19sMWUoKnBsMmUpOworICAgICAgICBwbDFlID0gbWFwX3hlbl9wYWdl
dGFibGVfbmV3KGwyZV9nZXRfbWZuKCpwbDJlKSk7CiAgICAgfQogCiAgICAgcGwxZSArPSBsMV90
YWJsZV9vZmZzZXQobGluZWFyKTsKQEAgLTgwMCw2ICs4MDUsNyBAQCBzdGF0aWMgaW50IGNsb25l
X21hcHBpbmcoY29uc3Qgdm9pZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQogCiAgICAgcmMg
PSAwOwogIG91dDoKKyAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhwbDFlKTsKICAgICBVTk1B
UF9YRU5fUEFHRVRBQkxFX05FVyhwbDJlKTsKICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhw
bDNlKTsKICAgICByZXR1cm4gcmM7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
