Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6AABEEF5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPz-0000bb-Ru; Thu, 26 Sep 2019 09:50:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPx-0000YU-Ls
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:33 +0000
X-Inumbo-ID: 0c89a4b6-e043-11e9-b588-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 0c89a4b6-e043-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491418; x=1601027418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=h8UJCEQDp86ZrC/JZ2cINLB5PckAhlkYWAg3GFXzyuA=;
 b=aLxpylX5bw6w+FNLTz7QwOxMqwZe8oYr3xtL/029Z/7qMooNZJMII7WG
 ehKxC8+DvKs+DC5PDvOf4Kg+y+Z3P7zeqIoQIWvIM2esqloITMGppMaDe
 re72KNPLru1mqlk0ggDWkVfVPg6henfQUeHFPPjwoLxzSD3vh4BLB233w 4=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753354483"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 09:50:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 47922A1F9D; Thu, 26 Sep 2019 09:50:17 +0000 (UTC)
Received: from EX13D28EUB004.ant.amazon.com (10.43.166.176) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:50 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB004.ant.amazon.com (10.43.166.176) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:49 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:46 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:39 +0100
Message-ID: <50268efd2bd6bdf4e1508218e7f1ec9b8776ea72.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 76/84] x86/setup: also clear the permission
 bits in the dummy 1:1 mapping.
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NldHVwLmMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAu
YwppbmRleCAzZGMyZmFkOTg3Li45MDE1ZTNiNzIzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
c2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtMTM2OCw3ICsxMzY4LDcgQEAg
dm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAg
ICAgICAgICAgIGlmICggbWFwX2UgPCBlbmQgKQogICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpX192YShtYXBfZSksIElOVkFMSURf
TUZOLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEZOX0RPV04oZW5kIC0gbWFw
X2UpLCBQQUdFX0hZUEVSVklTT1IpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UEZOX0RPV04oZW5kIC0gbWFwX2UpLCBfUEFHRV9OT05FKTsKICAgICAgICAgICAgICAgICBpbml0
X2Jvb3RfcGFnZXMobWFwX2UsIGVuZCk7CiAgICAgICAgICAgICAgICAgbWFwX2UgPSBlbmQ7CiAg
ICAgICAgICAgICB9CkBAIC0xMzgzLDcgKzEzODMsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBf
X3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgICAgICBpZiAoIHMgPCBtYXBfcyAp
CiAgICAgICAgIHsKICAgICAgICAgICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcp
X192YShzKSwgSU5WQUxJRF9NRk4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBGTl9E
T1dOKG1hcF9zIC0gcyksIFBBR0VfSFlQRVJWSVNPUik7CisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBGTl9ET1dOKG1hcF9zIC0gcyksIF9QQUdFX05PTkUpOwogICAgICAgICAgICAgaW5p
dF9ib290X3BhZ2VzKHMsIG1hcF9zKTsKICAgICAgICAgfQogICAgIH0KLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
