Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FFBEF00
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPt-0000GC-0e; Thu, 26 Sep 2019 09:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPp-00006R-Sr
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:25 +0000
X-Inumbo-ID: f84ce850-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id f84ce850-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491384; x=1601027384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kyWBa7Itj+eCyTqGw+czzYikdfFYsEt5DZcfNy6zJ2Q=;
 b=AWEzgS8IDoTb4R98eM780ttDPfhcj38VkuHVtzKBPYo92B2F2zHotgLx
 aOEsok0lsrgVXhL22eB1XXMG03GvNZWbFMEfyP6qDNoGFQFDG//ptI13W
 WO5ZIvXidC01yg5x0J0XiIjfJgrvbJ3FBa0f/DJTh/DRwbmrSzqNgWgIw s=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753354397"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:49:44 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 537BFA236A; Thu, 26 Sep 2019 09:49:43 +0000 (UTC)
Received: from EX13D28EUB001.ant.amazon.com (10.43.166.50) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:26 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB001.ant.amazon.com (10.43.166.50) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:25 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:22 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:33 +0100
Message-ID: <42c22c45411e5953097478899c1f9c1b147f39f7.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 70/84] x86/smpboot: use xenheap pages for
 rpts in smpboot.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClRoaXMgaXMgYmVjYXVzZSBh
IGxvdCBvZiBjb2RlIGFzc3VtZXMgdGhhdCB0aGUgcnB0IGlzIGluIHRoZSBkaXJlY3QgbWFwCnJl
Z2lvbiB3aGljaCBpcyBhbHdheXMgbWFwcGVkLiBTd2l0Y2hpbmcgdG8gZG9taGVhcCBpcyBub24t
dHJpdmlhbCwgc28KdXNlIHhlbmhlYXAgZm9yIG5vdywgd2hpY2ggbWVhbnMgYSBiaXQgbGVzcyBz
ZWN1cml0eS4KClNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDE5ICsrKysrKysrKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCmluZGV4
IDUzZjkxNzNmMzcuLjcwMzRjNjk5ZDYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290
LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwpAQCAtODMyLDE0ICs4MzIsMjAgQEAgc3Rh
dGljIGludCBzZXR1cF9jcHVfcm9vdF9wZ3QodW5zaWduZWQgaW50IGNwdSkKICAgICAgICAgZ290
byBvdXQ7CiAgICAgfQogCi0gICAgcnB0X21mbiA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKLSAg
ICBpZiAoIG1mbl9lcShycHRfbWZuLCBJTlZBTElEX01GTikgKQorICAgIC8qCisgICAgICogVW5m
b3J0dW5hdGVseSwgc29tZSBjb2RlIChlc3BlY2lhbGx5IGluIGFzc2VtYmx5KSBhc3N1bWVzIHRo
ZSBycHQgaXMgaW4KKyAgICAgKiB0aGUgRElSRUNUTUFQIHJlZ2lvbiBhbmQgaXMgYWx3YXlzIG1h
cHBlZC4gTWFraW5nIGFsbCBvZiB0aGVtIGFkYXB0IHRvCisgICAgICogdGhlIG5ldyBwYWdlIHRh
YmxlIEFQSXMgaXMgbm9uLXRyaXZpYWwuIEZvciBub3csIG1ha2UgaXQgYWx3YXlzIG1hcHBlZAor
ICAgICAqIG9uIHRoZSB4ZW5oZWFwLgorICAgICAqLworICAgIHJwdCA9IGFsbG9jX3hlbmhlYXBf
cGFnZSgpOworICAgIGlmICggIXJwdCApCiAgICAgewogICAgICAgICByYyA9IC1FTk9NRU07CiAg
ICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAotICAgIHJwdCA9IG1hcF94ZW5fcGFnZXRhYmxlKHJw
dF9tZm4pOworICAgIHJwdF9tZm4gPSBfbWZuKHZpcnRfdG9fbWZuKHJwdCkpOwogICAgIGNsZWFy
X3BhZ2UocnB0KTsKICAgICBwZXJfY3B1KHJvb3RfcGd0X21mbiwgY3B1KSA9IHJwdF9tZm47CiAK
QEAgLTg4NCw3ICs4OTAsNiBAQCBzdGF0aWMgaW50IHNldHVwX2NwdV9yb290X3BndCh1bnNpZ25l
ZCBpbnQgY3B1KQogICAgICAgICByYyA9IGNsb25lX21hcHBpbmcoKHZvaWQgKilwZXJfY3B1KHN0
dWJzLmFkZHIsIGNwdSksIHJwdCk7CiAKICBvdXQ6Ci0gICAgVU5NQVBfWEVOX1BBR0VUQUJMRShy
cHQpOwogICAgIHJldHVybiByYzsKIH0KIApAQCAtOTAwLDcgKzkwNSw3IEBAIHN0YXRpYyB2b2lk
IGNsZWFudXBfY3B1X3Jvb3RfcGd0KHVuc2lnbmVkIGludCBjcHUpCiAKICAgICBwZXJfY3B1KHJv
b3RfcGd0X21mbiwgY3B1KSA9IElOVkFMSURfTUZOOwogCi0gICAgcnB0ID0gbWFwX3hlbl9wYWdl
dGFibGUocnB0X21mbik7CisgICAgcnB0ID0gbWZuX3RvX3ZpcnQobWZuX3gocnB0X21mbikpOwog
CiAgICAgZm9yICggciA9IHJvb3RfdGFibGVfb2Zmc2V0KERJUkVDVE1BUF9WSVJUX1NUQVJUKTsK
ICAgICAgICAgICByIDwgcm9vdF90YWJsZV9vZmZzZXQoSFlQRVJWSVNPUl9WSVJUX0VORCk7ICsr
ciApCkBAIC05NDUsOCArOTUwLDggQEAgc3RhdGljIHZvaWQgY2xlYW51cF9jcHVfcm9vdF9wZ3Qo
dW5zaWduZWQgaW50IGNwdSkKICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwzdF9tZm4pOwog
ICAgIH0KIAotICAgIFVOTUFQX1hFTl9QQUdFVEFCTEUocnB0KTsKLSAgICBmcmVlX3hlbl9wYWdl
dGFibGUocnB0X21mbik7CisgICAgLyogVW5saWtlIG90aGVyIGxldmVscywgdGhlIHJvb3QgbGV2
ZWwgaXMgYSB4ZW5oZWFwIHBhZ2UuICovCisgICAgZnJlZV94ZW5oZWFwX3BhZ2UocnB0KTsKIAog
ICAgIC8qIEFsc28gemFwIHRoZSBzdHViIG1hcHBpbmcgZm9yIHRoaXMgQ1BVLiAqLwogICAgIGlm
ICggc3R1Yl9saW5lYXIgKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
