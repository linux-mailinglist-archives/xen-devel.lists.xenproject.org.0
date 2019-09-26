Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467BDBEEF7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPu-0000NP-TG; Thu, 26 Sep 2019 09:50:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPs-0000HY-K2
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:28 +0000
X-Inumbo-ID: 0ad4a922-e043-11e9-bf31-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 0ad4a922-e043-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491416; x=1601027416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Ay+KC3Ona01czWU1vcgcrNwN1I58Svev1gy8xA0gHpM=;
 b=mX0FNO1uIxplkp5Mvielk3X0xVrBfa5TSl/vBxYqKQzWAmGSPfZWK7ex
 mkPOVr3chswuuN/JdXRqXmzSfayIAzEp/KflE+6lABfoSvoHTQgzpV2Zi
 Uuk/mZ+YTcqpQ+UM+RwYJ3jP1pxDexAvSLvZKsLpBC4NWoznoRXF++6XI I=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836989061"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:49:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9982BA25C7; Thu, 26 Sep 2019 09:49:15 +0000 (UTC)
Received: from EX13D28EUB002.ant.amazon.com (10.43.166.97) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:59 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB002.ant.amazon.com (10.43.166.97) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:58 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:55 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:26 +0100
Message-ID: <340534a15e206136a9573e0af57fd74565dbaeff.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 63/84] x86/domain_page: mapcache is no
 longer tied to pv.
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
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2RvbWFpbl9w
YWdlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMgYi94ZW4vYXJj
aC94ODYvZG9tYWluX3BhZ2UuYwppbmRleCAzNDhlYTllYmYzLi40YTM5OTVjY2VmIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWlu
X3BhZ2UuYwpAQCAtODQsNyArODQsNyBAQCB2b2lkICptYXBfZG9tYWluX3BhZ2UobWZuX3QgbWZu
KQogI2VuZGlmCiAKICAgICB2ID0gbWFwY2FjaGVfY3VycmVudF92Y3B1KCk7Ci0gICAgaWYgKCAh
diB8fCAhaXNfcHZfdmNwdSh2KSApCisgICAgaWYgKCAhdiApCiAgICAgewogICAgICAgICB2b2lk
ICpyZXQ7CiAgICAgICAgIHBtYXBfbG9jaygpOwpAQCAtMjA4LDcgKzIwOCw3IEBAIHZvaWQgdW5t
YXBfZG9tYWluX3BhZ2UoY29uc3Qgdm9pZCAqcHRyKQogICAgIEFTU0VSVCh2YSA+PSBNQVBDQUNI
RV9WSVJUX1NUQVJUICYmIHZhIDwgTUFQQ0FDSEVfVklSVF9FTkQpOwogCiAgICAgdiA9IG1hcGNh
Y2hlX2N1cnJlbnRfdmNwdSgpOwotICAgIEFTU0VSVCh2ICYmIGlzX3B2X3ZjcHUodikpOworICAg
IEFTU0VSVCh2KTsKIAogICAgIGRjYWNoZSA9ICZ2LT5kb21haW4tPmFyY2gubWFwY2FjaGU7CiAg
ICAgQVNTRVJUKGRjYWNoZS0+aW51c2UpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
