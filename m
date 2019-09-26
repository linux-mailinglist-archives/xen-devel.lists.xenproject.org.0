Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E06BEEDD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOO-0005Ff-HK; Thu, 26 Sep 2019 09:48:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOM-0005D5-6h
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:54 +0000
X-Inumbo-ID: d9e130ce-e042-11e9-8628-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id d9e130ce-e042-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491333; x=1601027333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=1aordIdIJbykTsdjQxOL5oa92i7bkfOlz+OB+WQS6D8=;
 b=K7q9PWZExsV8Wk5W2u9d0H/fSuvhRVMkHR8EuiLrurYnUx2Os1xXhX82
 yp5dksK4X0SAKJ12QMBj/67e6mBDeTxpxFhkQRM+jmyb1Jb5YjdRECqrV
 N4LnHc3+1k+AlfuvKgeLRhwXUdZljD63UlDtKeUhmRFaDkkOtb4cJB6iR 8=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535196"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:48:53 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id 48ED2A23EF; Thu, 26 Sep 2019 09:48:52 +0000 (UTC)
Received: from EX13D28EUB001.ant.amazon.com (10.43.166.50) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:51 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB001.ant.amazon.com (10.43.166.50) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:50 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:47 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:23 +0100
Message-ID: <4b8e2d635bedc8a51281cac0eb93b6761c1eec5c.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 60/84] x86/domain_page: use PMAP when
 d/vcache is not ready.
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KCkFsc28gZml4IGEgcGxhY2Ug
d2hlcmUgdW5tYXBfZG9tYWluX3BhZ2Ugc2hvdWxkIG9ubHkgYmUgY29uZGl0aW9uYWxseQp1c2Vk
LgoKU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KLS0tCiB4
ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKy0t
LQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgfCAgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MjYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvZG9tYWluX3BhZ2UuYyBiL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCmluZGV4IDllYTc0
YjQ1NmMuLmJlY2U5ZDhjZDAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCkBAIC0xNyw2ICsxNyw4IEBACiAjaW5j
bHVkZSA8YXNtL2ZsdXNodGxiLmg+CiAjaW5jbHVkZSA8YXNtL2hhcmRpcnEuaD4KICNpbmNsdWRl
IDxhc20vc2V0dXAuaD4KKyNpbmNsdWRlIDxhc20vcG1hcC5oPgorI2luY2x1ZGUgPGFzbS9maXht
YXAuaD4KIAogc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIG92ZXJyaWRlKTsK
IApAQCAtODMsMTIgKzg1LDI2IEBAIHZvaWQgKm1hcF9kb21haW5fcGFnZShtZm5fdCBtZm4pCiAK
ICAgICB2ID0gbWFwY2FjaGVfY3VycmVudF92Y3B1KCk7CiAgICAgaWYgKCAhdiB8fCAhaXNfcHZf
dmNwdSh2KSApCi0gICAgICAgIHJldHVybiBtZm5fdG9fdmlydChtZm5feChtZm4pKTsKKyAgICB7
CisgICAgICAgIHZvaWQgKnJldDsKKyAgICAgICAgcG1hcF9sb2NrKCk7CisgICAgICAgIHJldCA9
IHBtYXBfbWFwKG1mbik7CisgICAgICAgIHBtYXBfdW5sb2NrKCk7CisgICAgICAgIGZsdXNoX3Rs
Yl9vbmVfbG9jYWwocmV0KTsKKyAgICAgICAgcmV0dXJuIHJldDsKKyAgICB9CiAKICAgICBkY2Fj
aGUgPSAmdi0+ZG9tYWluLT5hcmNoLnB2Lm1hcGNhY2hlOwogICAgIHZjYWNoZSA9ICZ2LT5hcmNo
LnB2Lm1hcGNhY2hlOwogICAgIGlmICggIWRjYWNoZS0+aW51c2UgKQotICAgICAgICByZXR1cm4g
bWZuX3RvX3ZpcnQobWZuX3gobWZuKSk7CisgICAgeworICAgICAgICB2b2lkICpyZXQ7CisgICAg
ICAgIHBtYXBfbG9jaygpOworICAgICAgICByZXQgPSBwbWFwX21hcChtZm4pOworICAgICAgICBw
bWFwX3VubG9jaygpOworICAgICAgICBmbHVzaF90bGJfb25lX2xvY2FsKHJldCk7CisgICAgICAg
IHJldHVybiByZXQ7CisgICAgfQogCiAgICAgcGVyZmNfaW5jcihtYXBfZG9tYWluX3BhZ2VfY291
bnQpOwogCkBAIC0xODEsOCArMTk3LDEzIEBAIHZvaWQgdW5tYXBfZG9tYWluX3BhZ2UoY29uc3Qg
dm9pZCAqcHRyKQogICAgIHVuc2lnbmVkIGxvbmcgdmEgPSAodW5zaWduZWQgbG9uZylwdHIsIG1m
biwgZmxhZ3M7CiAgICAgc3RydWN0IHZjcHVfbWFwaGFzaF9lbnRyeSAqaGFzaGVudDsKIAotICAg
IGlmICggdmEgPj0gRElSRUNUTUFQX1ZJUlRfU1RBUlQgKQorICAgIGlmICggdmEgPj0gRklYQURE
Ul9TVEFSVCAmJiB2YSA8IEZJWEFERFJfVE9QICkKKyAgICB7CisgICAgICAgIHBtYXBfbG9jaygp
OworICAgICAgICBwbWFwX3VubWFwKCh2b2lkICopcHRyKTsKKyAgICAgICAgcG1hcF91bmxvY2so
KTsKICAgICAgICAgcmV0dXJuOworICAgIH0KIAogICAgIEFTU0VSVCh2YSA+PSBNQVBDQUNIRV9W
SVJUX1NUQVJUICYmIHZhIDwgTUFQQ0FDSEVfVklSVF9FTkQpOwogCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDE0NWM1YWI0N2MuLjk2MTkx
ODJmNTIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9t
bS5jCkBAIC01OTQ5LDcgKzU5NDksOCBAQCBpbnQgY3JlYXRlX3BlcmRvbWFpbl9tYXBwaW5nKHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgdmEsCiAgICAgICAgIGlmICggcmMgfHwgIW5y
IHx8ICFsMV90YWJsZV9vZmZzZXQodmEpICkKICAgICAgICAgewogICAgICAgICAgICAgLyogTm90
ZSB0aGF0IHRoaXMgaXMgYSBuby1vcCBmb3IgdGhlIGFsbG9jX3hlbmhlYXBfcGFnZSgpIGNhc2Uu
ICovCi0gICAgICAgICAgICB1bm1hcF9kb21haW5fcGFnZShsMXRhYik7CisgICAgICAgICAgICBp
ZiggKHVuc2lnbmVkIGxvbmcpbDF0YWIgPCBESVJFQ1RNQVBfVklSVF9TVEFSVCApCisgICAgICAg
ICAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UobDF0YWIpOwogICAgICAgICAgICAgbDF0YWIgPSBO
VUxMOwogICAgICAgICB9CiAgICAgfQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
