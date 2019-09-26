Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8BEBEECA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQO4-0004k9-I0; Thu, 26 Sep 2019 09:48:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQO2-0004i7-P3
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:34 +0000
X-Inumbo-ID: cb99bbc6-e042-11e9-b588-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id cb99bbc6-e042-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491309; x=1601027309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XhYOIXufiZD9zZ7TLNj+y8Go4KtY9z8YI6yVoMYhfI8=;
 b=R6nypKWmFX3Uj4P+IpMNlDjN3Ap2HmwOUw1cKOYCiHbVAvZq62Vmh8nL
 6PiGhgOnT1dcaOMhV8dzH8p8Jw2cCdSBAoq8Fe89cdMjdvZPvKmBPUtf7
 3n3zh13WjFYhmg8KE5hjl3ruJ5N4h52G+7hx7fQcsQt6KwUw1UONVrOvR 8=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535127"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:48:29 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id CF372A25D2; Thu, 26 Sep 2019 09:48:27 +0000 (UTC)
Received: from EX13D27UWA002.ant.amazon.com (10.43.160.30) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:03 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D27UWA002.ant.amazon.com (10.43.160.30) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:02 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:01 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:01 +0100
Message-ID: <a62327841858aad489ec5a4323326bdd9e599a2b.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 38/84] x86/smpboot: switch pl1e to use new
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDE4
ICsrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9h
cmNoL3g4Ni9zbXBib290LmMKaW5kZXggZDM2NTFmYjk5YS4uZGFmNzM0ZDA5NSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBA
IC02NjgsNyArNjY4LDcgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0
ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7CiAgICAgbDNf
cGdlbnRyeV90ICpwbDNlID0gTlVMTDsKICAgICBsMl9wZ2VudHJ5X3QgKnBsMmUgPSBOVUxMOwot
ICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKKyAgICBsMV9wZ2VudHJ5X3QgKnBsMWUgPSBOVUxMOwog
ICAgIGludCByYzsKIAogICAgIC8qCkBAIC03MTUsNyArNzE1LDggQEAgc3RhdGljIGludCBjbG9u
ZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICAgICAg
fQogICAgICAgICBlbHNlCiAgICAgICAgIHsKLSAgICAgICAgICAgIHBsMWUgPSBsMmVfdG9fbDFl
KCpwbDJlKSArIGwxX3RhYmxlX29mZnNldChsaW5lYXIpOworICAgICAgICAgICAgcGwxZSA9IG1h
cF94ZW5fcGFnZXRhYmxlX25ldyhsMmVfZ2V0X21mbigqcGwyZSkpOworICAgICAgICAgICAgcGwx
ZSArPSBsMV90YWJsZV9vZmZzZXQobGluZWFyKTsKICAgICAgICAgICAgIGZsYWdzID0gbDFlX2dl
dF9mbGFncygqcGwxZSk7CiAgICAgICAgICAgICBpZiAoICEoZmxhZ3MgJiBfUEFHRV9QUkVTRU5U
KSApCiAgICAgICAgICAgICB7CkBAIC03MjYsNiArNzI3LDcgQEAgc3RhdGljIGludCBjbG9uZV9t
YXBwaW5nKGNvbnN0IHZvaWQgKnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICAgICAgfQog
ICAgIH0KIAorICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsMWUpOwogICAgIFVOTUFQX1hF
Tl9QQUdFVEFCTEVfTkVXKHBsMmUpOwogICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsM2Up
OwogCkBAIC03NzQsMTkgKzc3NiwyMiBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBpbmcoY29uc3Qg
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
YWJsZV9vZmZzZXQobGluZWFyKTsKQEAgLTgwMiw2ICs4MDcsNyBAQCBzdGF0aWMgaW50IGNsb25l
X21hcHBpbmcoY29uc3Qgdm9pZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQogCiAgICAgcmMg
PSAwOwogIG91dDoKKyAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhwbDFlKTsKICAgICBVTk1B
UF9YRU5fUEFHRVRBQkxFX05FVyhwbDJlKTsKICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhw
bDNlKTsKICAgICByZXR1cm4gcmM7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
