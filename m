Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5996BEEEA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQP6-0006e3-Ee; Thu, 26 Sep 2019 09:49:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQP4-0006aw-4F
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:38 +0000
X-Inumbo-ID: f18dd65a-e042-11e9-b588-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id f18dd65a-e042-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491373; x=1601027373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=WA7fvNw77v8vAj8/L23G6+zYdl9FPU4M3xrqGinNO78=;
 b=qh2b7jYXk90YDovH2i8bYyn7z89UTQRFeaeFgclZqwHJTExLGlvg90xi
 ZhzloTIgBwDVNp37XLJfxJMYKd99bMb1WUE5jRF9m1+N0Xe8zAwqmAgtp
 DQTSadQBT+0yzjj/Yg/b9qPGeW7x1mpdeSUD4Dho4Hik8mbpWySRmhFTY k=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788427"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:49:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 476ABA32D9; Thu, 26 Sep 2019 09:49:33 +0000 (UTC)
Received: from EX13D28EUC004.ant.amazon.com (10.43.164.80) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:13 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUC004.ant.amazon.com (10.43.164.80) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:11 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:09 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:30 +0100
Message-ID: <10c0b97f3f378af07012628afc685905af43148f.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 67/84] x86/domain_page: remove direct map
 code and initialise idle mapcache.
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClRoZXNlIGFyZSBmb3VuZCBp
biB0aGUgTkRFQlVHIGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhA
YW1hem9uLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2UuYyB8IDEwIC0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvZG9tYWluX3BhZ2UuYyBiL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCmluZGV4IGY0
ZjUzYTJhMzMuLmY2MDY2NzdhZTYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFn
ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCkBAIC03OCwxMSArNzgsNiBAQCB2
b2lkICptYXBfZG9tYWluX3BhZ2UobWZuX3QgbWZuKQogICAgIHN0cnVjdCBtYXBjYWNoZV92Y3B1
ICp2Y2FjaGU7CiAgICAgc3RydWN0IHZjcHVfbWFwaGFzaF9lbnRyeSAqaGFzaGVudDsKIAotI2lm
ZGVmIE5ERUJVRwotICAgIGlmICggbWZuX3gobWZuKSA8PSBQRk5fRE9XTihfX3BhKEhZUEVSVklT
T1JfVklSVF9FTkQgLSAxKSkgKQotICAgICAgICByZXR1cm4gbWZuX3RvX3ZpcnQobWZuX3gobWZu
KSk7Ci0jZW5kaWYKLQogICAgIHYgPSBtYXBjYWNoZV9jdXJyZW50X3ZjcHUoKTsKICAgICBpZiAo
ICF2ICkKICAgICB7CkBAIC0yNTcsMTEgKzI1Miw2IEBAIGludCBtYXBjYWNoZV9kb21haW5faW5p
dChzdHJ1Y3QgZG9tYWluICpkKQogICAgIHN0cnVjdCBtYXBjYWNoZV9kb21haW4gKmRjYWNoZSA9
ICZkLT5hcmNoLm1hcGNhY2hlOwogICAgIHVuc2lnbmVkIGludCBiaXRtYXBfcGFnZXM7CiAKLSNp
ZmRlZiBOREVCVUcKLSAgICBpZiAoICFtZW1faG90cGx1ZyAmJiBtYXhfcGFnZSA8PSBQRk5fRE9X
TihfX3BhKEhZUEVSVklTT1JfVklSVF9FTkQgLSAxKSkgKQotICAgICAgICByZXR1cm4gMDsKLSNl
bmRpZgotCiAgICAgQlVJTERfQlVHX09OKE1BUENBQ0hFX1ZJUlRfRU5EICsgUEFHRV9TSVpFICog
KDMgKwogICAgICAgICAgICAgICAgICAyICogUEZOX1VQKEJJVFNfVE9fTE9OR1MoTUFQQ0FDSEVf
RU5UUklFUykgKiBzaXplb2YobG9uZykpKSA+CiAgICAgICAgICAgICAgICAgIE1BUENBQ0hFX1ZJ
UlRfU1RBUlQgKyAoUEVSRE9NQUlOX1NMT1RfTUJZVEVTIDw8IDIwKSk7Ci0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
