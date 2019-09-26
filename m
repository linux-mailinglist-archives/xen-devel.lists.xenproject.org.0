Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAFBEED0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNz-0004bw-CR; Thu, 26 Sep 2019 09:48:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNx-0004Zp-PX
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:29 +0000
X-Inumbo-ID: c7c17eda-e042-11e9-b588-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id c7c17eda-e042-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491303; x=1601027303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=WpXJh4cxTqcmeqRGheLyKYvfYSmoTSzMIwmkSSiwZqI=;
 b=LIQ7c9qvbvciFsYufoBDgS64GQnYHBqjqp9yAj5rOwrf9NKlErtgk+9o
 zCg7TtezTA5jzbJEmutjLVVvlvDHinD3Of6blAQhwrcAupwUBb/mtGwB5
 JkZ7DW9NLVejLXrQ2pdqBjuzZ5MxGabtCQjrKKRdxtNCsKnxOJbi6iDit I=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753354161"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:48:23 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0FC04A04EB; Thu, 26 Sep 2019 09:48:22 +0000 (UTC)
Received: from EX13D29UWA003.ant.amazon.com (10.43.160.253) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:01 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D29UWA003.ant.amazon.com (10.43.160.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:00 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:59 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:00 +0100
Message-ID: <3a5608ac405a3a3c6b0241199ddf5434d422a14b.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 37/84] x86/smpboot: switch pl2e to use new
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
cmNoL3g4Ni9zbXBib290LmMKaW5kZXggZjk3MGIxYmQ2OS4uZDM2NTFmYjk5YSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBA
IC02NjcsNyArNjY3LDcgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0
ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICB1bnNpZ25lZCBsb25nIGxpbmVhciA9ICh1bnNp
Z25lZCBsb25nKXB0ciwgcGZuOwogICAgIHVuc2lnbmVkIGludCBmbGFnczsKICAgICBsM19wZ2Vu
dHJ5X3QgKnBsM2UgPSBOVUxMOwotICAgIGwyX3BnZW50cnlfdCAqcGwyZTsKKyAgICBsMl9wZ2Vu
dHJ5X3QgKnBsMmUgPSBOVUxMOwogICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKICAgICBpbnQgcmM7
CiAKQEAgLTcwMyw3ICs3MDMsOCBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBpbmcoY29uc3Qgdm9p
ZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQogICAgIH0KICAgICBlbHNlCiAgICAgewotICAg
ICAgICBwbDJlID0gbDNlX3RvX2wyZSgqcGwzZSkgKyBsMl90YWJsZV9vZmZzZXQobGluZWFyKTsK
KyAgICAgICAgcGwyZSA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsM2VfZ2V0X21mbigqcGwzZSkp
OworICAgICAgICBwbDJlICs9IGwyX3RhYmxlX29mZnNldChsaW5lYXIpOwogICAgICAgICBmbGFn
cyA9IGwyZV9nZXRfZmxhZ3MoKnBsMmUpOwogICAgICAgICBBU1NFUlQoZmxhZ3MgJiBfUEFHRV9Q
UkVTRU5UKTsKICAgICAgICAgaWYgKCBmbGFncyAmIF9QQUdFX1BTRSApCkBAIC03MjUsNiArNzI2
LDcgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0ciwgcm9vdF9wZ2Vu
dHJ5X3QgKnJwdCkKICAgICAgICAgfQogICAgIH0KIAorICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVf
TkVXKHBsMmUpOwogICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsM2UpOwogCiAgICAgaWYg
KCAhKHJvb3RfZ2V0X2ZsYWdzKHJwdFtyb290X3RhYmxlX29mZnNldChsaW5lYXIpXSkgJiBfUEFH
RV9QUkVTRU5UKSApCkBAIC03NTAsMTkgKzc1MiwyMiBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBp
bmcoY29uc3Qgdm9pZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQogCiAgICAgaWYgKCAhKGwz
ZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgIHsKLSAgICAgICAgcGwy
ZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKLSAgICAgICAgaWYgKCAhcGwyZSApCisgICAgICAg
IG1mbl90IGwydF9tZm4gPSBhbGxvY194ZW5fcGFnZXRhYmxlX25ldygpOworCisgICAgICAgIGlm
ICggbWZuX2VxKGwydF9tZm4sIElOVkFMSURfTUZOKSApCiAgICAgICAgIHsKICAgICAgICAgICAg
IHJjID0gLUVOT01FTTsKICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICB9CisKKyAgICAg
ICAgcGwyZSA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsMnRfbWZuKTsKICAgICAgICAgY2xlYXJf
cGFnZShwbDJlKTsKLSAgICAgICAgbDNlX3dyaXRlKHBsM2UsIGwzZV9mcm9tX3BhZGRyKF9fcGEo
cGwyZSksIF9fUEFHRV9IWVBFUlZJU09SKSk7CisgICAgICAgIGwzZV93cml0ZShwbDNlLCBsM2Vf
ZnJvbV9tZm4obDJ0X21mbiwgX19QQUdFX0hZUEVSVklTT1IpKTsKICAgICB9CiAgICAgZWxzZQog
ICAgIHsKICAgICAgICAgQVNTRVJUKCEobDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9QU0Up
KTsKLSAgICAgICAgcGwyZSA9IGwzZV90b19sMmUoKnBsM2UpOworICAgICAgICBwbDJlID0gbWFw
X3hlbl9wYWdldGFibGVfbmV3KGwzZV9nZXRfbWZuKCpwbDNlKSk7CiAgICAgfQogCiAgICAgcGwy
ZSArPSBsMl90YWJsZV9vZmZzZXQobGluZWFyKTsKQEAgLTc5Nyw2ICs4MDIsNyBAQCBzdGF0aWMg
aW50IGNsb25lX21hcHBpbmcoY29uc3Qgdm9pZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQog
CiAgICAgcmMgPSAwOwogIG91dDoKKyAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhwbDJlKTsK
ICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhwbDNlKTsKICAgICByZXR1cm4gcmM7CiB9Ci0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
