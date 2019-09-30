Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4279C1F2E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2Y-0001bM-1x; Mon, 30 Sep 2019 10:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2V-0001Yi-Uz
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:23 +0000
X-Inumbo-ID: 1ad7e4be-e36e-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 1ad7e4be-e36e-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839765; x=1601375765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=a1XU9H6o8lt4sM4ZU4RRo0qnivYGLSX0kQ7zNY2lmOA=;
 b=vEiXlH3iMeYxdYrDwFYu4MFz2q7gZXLvtm2ujsOq1XmdoR9Ossrb8sza
 rZgKq0oF/GLI8zGnKa1J6E6hDN9zNX3fcIMoBuVWD3RGUW40yJm+Tw+US
 8tBmEezpSEYtaNykMLZQ2p1hSPWE/kOAdbmeoVhXXfg9da4wZNsO5e3yv M=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="838005667"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Sep 2019 10:35:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7A51C14178B; Mon, 30 Sep 2019 10:34:51 +0000 (UTC)
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:24 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:23 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:23 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:28 +0100
Message-ID: <9f89de789707ef89c2b6d6abdbb8c52e7803b4c9.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 36/55] x86/smpboot: switch pl2e to use new
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
cmNoL3g4Ni9zbXBib290LmMKaW5kZXggZGIzOWY1Y2JiMi4uZDMyN2MwNjJiMSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBA
IC02NjUsNyArNjY1LDcgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0
ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICB1bnNpZ25lZCBsb25nIGxpbmVhciA9ICh1bnNp
Z25lZCBsb25nKXB0ciwgcGZuOwogICAgIHVuc2lnbmVkIGludCBmbGFnczsKICAgICBsM19wZ2Vu
dHJ5X3QgKnBsM2UgPSBOVUxMOwotICAgIGwyX3BnZW50cnlfdCAqcGwyZTsKKyAgICBsMl9wZ2Vu
dHJ5X3QgKnBsMmUgPSBOVUxMOwogICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKICAgICBpbnQgcmM7
CiAKQEAgLTcwMSw3ICs3MDEsOCBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBpbmcoY29uc3Qgdm9p
ZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQogICAgIH0KICAgICBlbHNlCiAgICAgewotICAg
ICAgICBwbDJlID0gbDNlX3RvX2wyZSgqcGwzZSkgKyBsMl90YWJsZV9vZmZzZXQobGluZWFyKTsK
KyAgICAgICAgcGwyZSA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsM2VfZ2V0X21mbigqcGwzZSkp
OworICAgICAgICBwbDJlICs9IGwyX3RhYmxlX29mZnNldChsaW5lYXIpOwogICAgICAgICBmbGFn
cyA9IGwyZV9nZXRfZmxhZ3MoKnBsMmUpOwogICAgICAgICBBU1NFUlQoZmxhZ3MgJiBfUEFHRV9Q
UkVTRU5UKTsKICAgICAgICAgaWYgKCBmbGFncyAmIF9QQUdFX1BTRSApCkBAIC03MjMsNiArNzI0
LDcgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0ciwgcm9vdF9wZ2Vu
dHJ5X3QgKnJwdCkKICAgICAgICAgfQogICAgIH0KIAorICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVf
TkVXKHBsMmUpOwogICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKHBsM2UpOwogCiAgICAgaWYg
KCAhKHJvb3RfZ2V0X2ZsYWdzKHJwdFtyb290X3RhYmxlX29mZnNldChsaW5lYXIpXSkgJiBfUEFH
RV9QUkVTRU5UKSApCkBAIC03NDgsMTkgKzc1MCwyMiBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBp
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
ZSArPSBsMl90YWJsZV9vZmZzZXQobGluZWFyKTsKQEAgLTc5NSw2ICs4MDAsNyBAQCBzdGF0aWMg
aW50IGNsb25lX21hcHBpbmcoY29uc3Qgdm9pZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQog
CiAgICAgcmMgPSAwOwogIG91dDoKKyAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhwbDJlKTsK
ICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhwbDNlKTsKICAgICByZXR1cm4gcmM7CiB9Ci0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
