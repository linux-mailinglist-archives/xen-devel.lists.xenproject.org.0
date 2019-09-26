Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C522BEF02
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQ4-0000kR-GL; Thu, 26 Sep 2019 09:50:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPz-0000dJ-UW
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:35 +0000
X-Inumbo-ID: 02dd51f6-e043-11e9-964c-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 02dd51f6-e043-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491403; x=1601027403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=D3xhAXkkAyvkgXZaKgSRCepjVtWQLUGgeMXG4FaK6oI=;
 b=fLTRkgCNwvdUjR/kP+LeZOF2PftRFieGzX1lhwqYacDAJnvDH5DMSd47
 m8fxeZ2MgXVkqnb7TvxU3mQVOYEc3EFKKAL4JpePRgtxUCC2IjonaDUiN
 PU3t5K7DgiJ4fIXuSCDyfqMA6mrYtQ/7k07lkUuB9y+kDG+dE8VBohsb+ 0=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637337"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:48:40 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3ED53A016A; Thu, 26 Sep 2019 09:48:20 +0000 (UTC)
Received: from EX13d09UWA001.ant.amazon.com (10.43.160.247) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:57 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13d09UWA001.ant.amazon.com (10.43.160.247) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:56 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:55 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:58 +0100
Message-ID: <f845df9d313e52b68b6222c892530b5efc93bece.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 35/84] x86/smpboot: clone_mapping should
 have one exit path
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGNsZWFuIHVwIHBhZ2UgdGFibGUgbWFwcGluZ3MgaW4gdGhlIGV4aXQgcGF0aC4KCk5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KLS0tCiB4ZW4vYXJjaC94ODYvc21wYm9vdC5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94
ODYvc21wYm9vdC5jCmluZGV4IGIwODYwNjM0ODYuLjhiZWUwYzQxZTMgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9zbXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwpAQCAtNjY5
LDYgKzY2OSw3IEBAIHN0YXRpYyBpbnQgY2xvbmVfbWFwcGluZyhjb25zdCB2b2lkICpwdHIsIHJv
b3RfcGdlbnRyeV90ICpycHQpCiAgICAgbDNfcGdlbnRyeV90ICpwbDNlOwogICAgIGwyX3BnZW50
cnlfdCAqcGwyZTsKICAgICBsMV9wZ2VudHJ5X3QgKnBsMWU7CisgICAgaW50IHJjOwogCiAgICAg
LyoKICAgICAgKiBTYW5pdHkgY2hlY2sgJ2xpbmVhcicuICBXZSBvbmx5IGFsbG93IGNsb25pbmcg
ZnJvbSB0aGUgWGVuIHZpcnR1YWwKQEAgLTY3NiwxMSArNjc3LDE3IEBAIHN0YXRpYyBpbnQgY2xv
bmVfbWFwcGluZyhjb25zdCB2b2lkICpwdHIsIHJvb3RfcGdlbnRyeV90ICpycHQpCiAgICAgICov
CiAgICAgaWYgKCByb290X3RhYmxlX29mZnNldChsaW5lYXIpID4gUk9PVF9QQUdFVEFCTEVfTEFT
VF9YRU5fU0xPVCB8fAogICAgICAgICAgcm9vdF90YWJsZV9vZmZzZXQobGluZWFyKSA8IFJPT1Rf
UEFHRVRBQkxFX0ZJUlNUX1hFTl9TTE9UICkKLSAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAg
eworICAgICAgICByYyA9IC1FSU5WQUw7CisgICAgICAgIGdvdG8gb3V0OworICAgIH0KIAogICAg
IGlmICggbGluZWFyIDwgWEVOX1ZJUlRfU1RBUlQgfHwKICAgICAgICAgIChsaW5lYXIgPj0gWEVO
X1ZJUlRfRU5EICYmIGxpbmVhciA8IERJUkVDVE1BUF9WSVJUX1NUQVJUKSApCi0gICAgICAgIHJl
dHVybiAtRUlOVkFMOworICAgIHsKKyAgICAgICAgcmMgPSAtRUlOVkFMOworICAgICAgICBnb3Rv
IG91dDsKKyAgICB9CiAKICAgICBwbDNlID0gbDRlX3RvX2wzZShpZGxlX3BnX3RhYmxlW3Jvb3Rf
dGFibGVfb2Zmc2V0KGxpbmVhcildKSArCiAgICAgICAgIGwzX3RhYmxlX29mZnNldChsaW5lYXIp
OwpAQCAtNzA5LDcgKzcxNiwxMCBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBpbmcoY29uc3Qgdm9p
ZCAqcHRyLCByb290X3BnZW50cnlfdCAqcnB0KQogICAgICAgICAgICAgcGwxZSA9IGwyZV90b19s
MWUoKnBsMmUpICsgbDFfdGFibGVfb2Zmc2V0KGxpbmVhcik7CiAgICAgICAgICAgICBmbGFncyA9
IGwxZV9nZXRfZmxhZ3MoKnBsMWUpOwogICAgICAgICAgICAgaWYgKCAhKGZsYWdzICYgX1BBR0Vf
UFJFU0VOVCkgKQotICAgICAgICAgICAgICAgIHJldHVybiAwOworICAgICAgICAgICAgeworICAg
ICAgICAgICAgICAgIHJjID0gMDsKKyAgICAgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAg
ICAgIH0KICAgICAgICAgICAgIHBmbiA9IGwxZV9nZXRfcGZuKCpwbDFlKTsKICAgICAgICAgfQog
ICAgIH0KQEAgLTcxOCw3ICs3MjgsMTAgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0
IHZvaWQgKnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICB7CiAgICAgICAgIHBsM2UgPSBh
bGxvY194ZW5fcGFnZXRhYmxlKCk7CiAgICAgICAgIGlmICggIXBsM2UgKQotICAgICAgICAgICAg
cmV0dXJuIC1FTk9NRU07CisgICAgICAgIHsKKyAgICAgICAgICAgIHJjID0gLUVOT01FTTsKKyAg
ICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICB9CiAgICAgICAgIGNsZWFyX3BhZ2UocGwzZSk7
CiAgICAgICAgIGw0ZV93cml0ZSgmcnB0W3Jvb3RfdGFibGVfb2Zmc2V0KGxpbmVhcildLAogICAg
ICAgICAgICAgICAgICAgbDRlX2Zyb21fcGFkZHIoX19wYShwbDNlKSwgX19QQUdFX0hZUEVSVklT
T1IpKTsKQEAgLTczMiw3ICs3NDUsMTAgQEAgc3RhdGljIGludCBjbG9uZV9tYXBwaW5nKGNvbnN0
IHZvaWQgKnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICB7CiAgICAgICAgIHBsMmUgPSBh
bGxvY194ZW5fcGFnZXRhYmxlKCk7CiAgICAgICAgIGlmICggIXBsMmUgKQotICAgICAgICAgICAg
cmV0dXJuIC1FTk9NRU07CisgICAgICAgIHsKKyAgICAgICAgICAgIHJjID0gLUVOT01FTTsKKyAg
ICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICB9CiAgICAgICAgIGNsZWFyX3BhZ2UocGwyZSk7
CiAgICAgICAgIGwzZV93cml0ZShwbDNlLCBsM2VfZnJvbV9wYWRkcihfX3BhKHBsMmUpLCBfX1BB
R0VfSFlQRVJWSVNPUikpOwogICAgIH0KQEAgLTc0OCw3ICs3NjQsMTAgQEAgc3RhdGljIGludCBj
bG9uZV9tYXBwaW5nKGNvbnN0IHZvaWQgKnB0ciwgcm9vdF9wZ2VudHJ5X3QgKnJwdCkKICAgICB7
CiAgICAgICAgIHBsMWUgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAgICAgICAgIGlmICggIXBs
MWUgKQotICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgICAgIHsKKyAgICAgICAgICAg
IHJjID0gLUVOT01FTTsKKyAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICB9CiAgICAgICAg
IGNsZWFyX3BhZ2UocGwxZSk7CiAgICAgICAgIGwyZV93cml0ZShwbDJlLCBsMmVfZnJvbV9wYWRk
cihfX3BhKHBsMWUpLCBfX1BBR0VfSFlQRVJWSVNPUikpOwogICAgIH0KQEAgLTc2OSw3ICs3ODgs
OSBAQCBzdGF0aWMgaW50IGNsb25lX21hcHBpbmcoY29uc3Qgdm9pZCAqcHRyLCByb290X3BnZW50
cnlfdCAqcnB0KQogICAgIGVsc2UKICAgICAgICAgbDFlX3dyaXRlKHBsMWUsIGwxZV9mcm9tX3Bm
bihwZm4sIGZsYWdzKSk7CiAKLSAgICByZXR1cm4gMDsKKyAgICByYyA9IDA7Cisgb3V0OgorICAg
IHJldHVybiByYzsKIH0KIAogREVGSU5FX1BFUl9DUFUocm9vdF9wZ2VudHJ5X3QgKiwgcm9vdF9w
Z3QpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
