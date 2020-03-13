Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B24E1846FB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:36:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCjW6-0006VC-74; Fri, 13 Mar 2020 12:34:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AUXq=46=amazon.de=prvs=334f24509=mheyne@srs-us1.protection.inumbo.net>)
 id 1jCjVH-0006SD-W8
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:33:28 +0000
X-Inumbo-ID: d411e7ba-6526-11ea-a6c1-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d411e7ba-6526-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1584102803; x=1615638803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=6O8VBOGvr5WUoEfBKPbnEZdWawUmQ5qWCa/btGpiBco=;
 b=m1kBGk/MxDmT629Qwq9j1BkLftLC6ori0RXixxqfD71z9edkh9Oi3Tls
 Wlp0aC/2VhcoYTzaOkANZYKJ6Ax5ftKgjGl8szLZ5uBOv/zcn+s9HEPT8
 XzvjZaj4Dl/gCJmCgnsZMD0yGkCtJ3jJ32gbpQD9Xpe5NkuqaNwqQkMNR k=;
IronPort-SDR: PBjDWD+72t0Sgt36kfYExy7ggBjstxkcoHY7UpdiScYpdcU/lbCxSeZQMk3GYtrBBmy5uQgrpA
 FxqKMcpNHJlQ==
X-IronPort-AV: E=Sophos;i="5.70,548,1574121600"; d="scan'208";a="31028704"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 13 Mar 2020 12:33:21 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id A1A66A2275; Fri, 13 Mar 2020 12:33:20 +0000 (UTC)
Received: from EX13D08EUC002.ant.amazon.com (10.43.164.124) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 13 Mar 2020 12:33:20 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D08EUC002.ant.amazon.com (10.43.164.124) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Mar 2020 12:33:19 +0000
Received: from dev-dsk-mheyne-60001.pdx1.corp.amazon.com (10.184.85.242) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Mar 2020 12:33:17 +0000
Received: by dev-dsk-mheyne-60001.pdx1.corp.amazon.com (Postfix,
 from userid 5466572)
 id 87454222D6; Fri, 13 Mar 2020 12:33:16 +0000 (UTC)
From: Maximilian Heyne <mheyne@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Mar 2020 12:33:16 +0000
Message-ID: <20200313123316.122003-4-mheyne@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200313123316.122003-1-mheyne@amazon.de>
References: <20200313123316.122003-1-mheyne@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Fri, 13 Mar 2020 12:34:16 +0000
Subject: [Xen-devel] [PATCH 3/3] xen: cleanup IOREQ server on exit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIHRoZSBiYWNrcG9ydGVkIE5vdGlmaWVyIGludGVyZmFjZSB0byByZWdpc3RlciBhbiBhdGV4
aXQgaGFuZGxlciB0bwpjbGVhbnVwIHRoZSBJT1JFUSBzZXJ2ZXIuIFRoaXMgaXMgcmVxdWlyZWQg
c2luY2UgWGVuIGNvbW1pdCBhNWExODBmOQooIng4Ni9kb21haW46IGRvbid0IGRlc3Ryb3kgSU9S
RVEgc2VydmVycyBvbiBzb2Z0IHJlc2V0IikgaXMgaW50cm9kdWNlZAp3aGljaCByZXF1aXJlcyBR
ZW11IHRvIGV4cGxpY2l0bHkgY2xvc2UgdGhlIElPUkVRIHNlcnZlci4KClRoaXMgaXMgY2FuIGJl
IHNlZW4gYXMgYSBiYWNrcG9ydCBvZiBiYTdmZGQ2NCAoInhlbjogY2xlYW51cCBJT1JFUQpzZXJ2
ZXIgb24gZXhpdCIpLgoKU2lnbmVkLW9mZi1ieTogTWF4aW1pbGlhbiBIZXluZSA8bWhleW5lQGFt
YXpvbi5kZT4KLS0tCiBody94ZW5fbWFjaGluZV9mdi5jIHwgMTEgKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaHcveGVuX21hY2hpbmVf
ZnYuYyBiL2h3L3hlbl9tYWNoaW5lX2Z2LmMKaW5kZXggZjA5ODlmYWQ0Li42NmViNGExZWIgMTAw
NjQ0Ci0tLSBhL2h3L3hlbl9tYWNoaW5lX2Z2LmMKKysrIGIvaHcveGVuX21hY2hpbmVfZnYuYwpA
QCAtMzEsNiArMzEsNyBAQAogI2luY2x1ZGUgInFlbXUtYWlvLmgiCiAjaW5jbHVkZSAieGVuX2Jh
Y2tlbmQuaCIKICNpbmNsdWRlICJwY2kuaCIKKyNpbmNsdWRlICJzeXNlbXUuaCIKIAogI2luY2x1
ZGUgPHhlbi9odm0vcGFyYW1zLmg+CiAjaW5jbHVkZSA8c3lzL21tYW4uaD4KQEAgLTY3LDYgKzY4
LDggQEAgVEFJTFFfSEVBRChtYXBfY2FjaGVfaGVhZCwgbWFwX2NhY2hlX3JldikgbG9ja2VkX2Vu
dHJpZXMgPSBUQUlMUV9IRUFEX0lOSVRJQUxJWkUKIHN0YXRpYyB1bnNpZ25lZCBsb25nIGxhc3Rf
YWRkcmVzc19wYWdlID0gfjBVTDsKIHN0YXRpYyB1aW50OF90ICAgICAgKmxhc3RfYWRkcmVzc192
YWRkcjsKIAorc3RhdGljIE5vdGlmaWVyIGV4aXRfbm90aWZpZXI7CisKIHN0YXRpYyBpbnQgcWVt
dV9tYXBfY2FjaGVfaW5pdCh2b2lkKQogewogICAgIHVuc2lnbmVkIGxvbmcgc2l6ZTsKQEAgLTI4
Myw2ICsyODYsMTEgQEAgdm9pZCB4ZW5fZGlzYWJsZV9pbyh2b2lkKQogICAgIHhjX2h2bV9zZXRf
aW9yZXFfc2VydmVyX3N0YXRlKHhjX2hhbmRsZSwgZG9taWQsIGlvc2VydmlkLCAwKTsKIH0KIAor
c3RhdGljIHZvaWQgeGVuX2V4aXRfbm90aWZpZXIoTm90aWZpZXIgKm4pCit7CisgICAgeGNfaHZt
X2Rlc3Ryb3lfaW9yZXFfc2VydmVyKHhjX2hhbmRsZSwgZG9taWQsIGlvc2VydmlkKTsKK30KKwog
c3RhdGljIHZvaWQgeGVuX2luaXRfZnYocmFtX2FkZHJfdCByYW1fc2l6ZSwgaW50IHZnYV9yYW1f
c2l6ZSwKIAkJCWNvbnN0IGNoYXIgKmJvb3RfZGV2aWNlLAogCQkJY29uc3QgY2hhciAqa2VybmVs
X2ZpbGVuYW1lLGNvbnN0IGNoYXIgKmtlcm5lbF9jbWRsaW5lLApAQCAtMzE3LDYgKzMyNSw5IEBA
IHN0YXRpYyB2b2lkIHhlbl9pbml0X2Z2KHJhbV9hZGRyX3QgcmFtX3NpemUsIGludCB2Z2FfcmFt
X3NpemUsCiAgICAgICAgIGV4aXQoLTEpOwogICAgIH0KIAorICAgIGV4aXRfbm90aWZpZXIubm90
aWZ5ID0geGVuX2V4aXRfbm90aWZpZXI7CisgICAgcWVtdV9hZGRfZXhpdF9ub3RpZmllcigmZXhp
dF9ub3RpZmllcik7CisKICAgICBpZiAoeGNfaHZtX2dldF9pb3JlcV9zZXJ2ZXJfaW5mbyh4Y19o
YW5kbGUsIGRvbWlkLCBpb3NlcnZpZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmaW9yZXFfcGZuLCAmYnVmaW9yZXFfcGZuLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZidWZpb3JlcV9ldnRjaG4pKSB7Ci0tIAoyLjE2LjYKCgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNz
CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkx
NzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
