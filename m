Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA323BEF0D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQr-0002RG-Bx; Thu, 26 Sep 2019 09:51:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQQp-0002PE-O7
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:51:27 +0000
X-Inumbo-ID: 34eaf996-e043-11e9-bf31-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 34eaf996-e043-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491487; x=1601027487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/5cplFV3IuulIGMdnfMNZOlzQqBhLt/T+9k7NrC7Kbc=;
 b=HUU4o5hFZCWFlux2zkb1RCv4xPCUSmRY/2fIpdN8QKYVKDEwc+4MH45/
 Dd4KGktNe/gUx4Do8IL2ExCg4aIF5Goc38BYVFn+NFzvM7VRIjekiMAXL
 5PysJy0+Zq0tyCCkuTdaFYVDHG5USEipLYJ9Yl8WtbX+yQaUYXJfmCMl0 s=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637550"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:49:52 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id DCD59A2A41; Thu, 26 Sep 2019 09:49:36 +0000 (UTC)
Received: from EX13D23UWA003.ant.amazon.com (10.43.160.194) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:09 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D23UWA003.ant.amazon.com (10.43.160.194) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:08 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:07 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:29 +0100
Message-ID: <1dac8f90c57bdb8e62a4fbf0b419b31d2202b48f.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 66/84] x86/pv: domheap pages should be
 mapped while relocating initrd
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClhlbiBzaG91bGRuJ3QgdXNlIGRv
bWhlYXAgcGFnZSBhcyBpZiB0aGV5IHdlcmUgeGVuaGVhcCBwYWdlcy4gTWFwIGFuZAp1bm1hcCBw
YWdlcyBhY2NvcmRpbmdseS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyB8IDE4ICsrKysrKysrKysr
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4
Ni9wdi9kb20wX2J1aWxkLmMKaW5kZXggMDJkN2YxYzI3Yy4uMTViM2NhMjE5MSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9t
MF9idWlsZC5jCkBAIC01MjMsMTggKzUyMywzMiBAQCBpbnQgX19pbml0IGRvbTBfY29uc3RydWN0
X3B2KHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgIGlmICggZC0+YXJjaC5waHlzYWRkcl9iaXRz
aXplICYmCiAgICAgICAgICAgICAgKChtZm4gKyBjb3VudCAtIDEpID4+IChkLT5hcmNoLnBoeXNh
ZGRyX2JpdHNpemUgLSBQQUdFX1NISUZUKSkgKQogICAgICAgICB7CisgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgbnJfcGFnZXM7CisgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGVuID0gaW5pdHJk
X2xlbjsKKyAgICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOworCiAgICAgICAgICAgICBv
cmRlciA9IGdldF9vcmRlcl9mcm9tX3BhZ2VzKGNvdW50KTsKICAgICAgICAgICAgIHBhZ2UgPSBh
bGxvY19kb21oZWFwX3BhZ2VzKGQsIG9yZGVyLCBNRU1GX25vX3NjcnViKTsKICAgICAgICAgICAg
IGlmICggIXBhZ2UgKQogICAgICAgICAgICAgICAgIHBhbmljKCJOb3QgZW5vdWdoIFJBTSBmb3Ig
ZG9tYWluIDAgaW5pdHJkXG4iKTsKKworICAgICAgICAgICAgbnJfcGFnZXMgPSAxVUwgPDwgb3Jk
ZXI7CiAgICAgICAgICAgICBmb3IgKCBjb3VudCA9IC1jb3VudDsgb3JkZXItLTsgKQogICAgICAg
ICAgICAgICAgIGlmICggY291bnQgJiAoMVVMIDw8IG9yZGVyKSApCiAgICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgICBmcmVlX2RvbWhlYXBfcGFnZXMocGFnZSwgb3JkZXIpOwog
ICAgICAgICAgICAgICAgICAgICBwYWdlICs9IDFVTCA8PCBvcmRlcjsKKyAgICAgICAgICAgICAg
ICAgICAgbnJfcGFnZXMgLT0gMVVMIDw8IG9yZGVyOwogICAgICAgICAgICAgICAgIH0KLSAgICAg
ICAgICAgIG1lbWNweShwYWdlX3RvX3ZpcnQocGFnZSksIG1mbl90b192aXJ0KGluaXRyZC0+bW9k
X3N0YXJ0KSwKLSAgICAgICAgICAgICAgICAgICBpbml0cmRfbGVuKTsKKworICAgICAgICAgICAg
Zm9yICggcGcgPSBwYWdlLCBpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyssIGxlbiAtPSBQQUdFX1NJ
WkUsIHBnKysgKQorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIHZvaWQgKnAgPSBfX21h
cF9kb21haW5fcGFnZShwZyk7CisgICAgICAgICAgICAgICAgbWVtY3B5KHAsIG1mbl90b192aXJ0
KGluaXRyZC0+bW9kX3N0YXJ0KSArIGkgKiBQQUdFX1NJWkUsCisgICAgICAgICAgICAgICAgICAg
ICAgIGxlbiA+IFBBR0VfU0laRSA/IFBBR0VfU0laRSA6IGxlbik7CisgICAgICAgICAgICAgICAg
dW5tYXBfZG9tYWluX3BhZ2UocCk7CisgICAgICAgICAgICB9CisKICAgICAgICAgICAgIG1wdF9h
bGxvYyA9IChwYWRkcl90KWluaXRyZC0+bW9kX3N0YXJ0IDw8IFBBR0VfU0hJRlQ7CiAgICAgICAg
ICAgICBpbml0X2RvbWhlYXBfcGFnZXMobXB0X2FsbG9jLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG1wdF9hbGxvYyArIFBBR0VfQUxJR04oaW5pdHJkX2xlbikpOwotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
