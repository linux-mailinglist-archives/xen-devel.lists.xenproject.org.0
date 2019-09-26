Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D2DBEEFB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQO-0001Rn-5b; Thu, 26 Sep 2019 09:51:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQQJ-0001Ka-6l
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:55 +0000
X-Inumbo-ID: 21d1bdcc-e043-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id 21d1bdcc-e043-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491454; x=1601027454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EWA3h2guB9NBCcDuy07jNu66y3K3A4xPKuQuLcY6GoU=;
 b=Ua3MS6urZubWVLuZ4eHMMSV5RNLAxVW7lnBU3N3Ya89EcIXg0eT99Zxp
 7g9Bslv81/3sCzk0OHiL6J5DKOjLTXEBt7LY96bebP5nBcLDeAZ/GepV9
 z+qdjH21Bjg0OvJ4qWTljkrLkEJtG9qLLMK7Aoo/XFXvh74dKjYmoJL6A 4=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788627"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:50:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id CEFD3A1E17; Thu, 26 Sep 2019 09:50:52 +0000 (UTC)
Received: from EX13D28EUB004.ant.amazon.com (10.43.166.176) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:13 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB004.ant.amazon.com (10.43.166.176) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:12 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:50:09 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:45 +0100
Message-ID: <f4c05d048bbad24972874e978f4266abb32cdc3c.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 82/84] x86: deduplicate code a bit and fix
 an unmapping bug.
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
YWdlLmMgICB8IDI4ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9w
di9kb20wX2J1aWxkLmMgfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluX3BhZ2Uu
YyBiL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCmluZGV4IGY2MDY2NzdhZTYuLjc4MmRkMDY1
MGMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9kb21haW5fcGFnZS5jCkBAIC03NywyOSArNzcsMTYgQEAgdm9pZCAqbWFwX2RvbWFpbl9w
YWdlKG1mbl90IG1mbikKICAgICBzdHJ1Y3QgbWFwY2FjaGVfZG9tYWluICpkY2FjaGU7CiAgICAg
c3RydWN0IG1hcGNhY2hlX3ZjcHUgKnZjYWNoZTsKICAgICBzdHJ1Y3QgdmNwdV9tYXBoYXNoX2Vu
dHJ5ICpoYXNoZW50OworICAgIHZvaWQgKnJldDsKIAogICAgIHYgPSBtYXBjYWNoZV9jdXJyZW50
X3ZjcHUoKTsKICAgICBpZiAoICF2ICkKLSAgICB7Ci0gICAgICAgIHZvaWQgKnJldDsKLSAgICAg
ICAgcG1hcF9sb2NrKCk7Ci0gICAgICAgIHJldCA9IHBtYXBfbWFwKG1mbik7Ci0gICAgICAgIHBt
YXBfdW5sb2NrKCk7Ci0gICAgICAgIGZsdXNoX3RsYl9vbmVfbG9jYWwocmV0KTsKLSAgICAgICAg
cmV0dXJuIHJldDsKLSAgICB9CisgICAgICAgIGdvdG8gcG1hcDsKIAogICAgIGRjYWNoZSA9ICZ2
LT5kb21haW4tPmFyY2gubWFwY2FjaGU7CiAgICAgdmNhY2hlID0gJnYtPmFyY2gubWFwY2FjaGU7
CiAgICAgaWYgKCAhZGNhY2hlLT5pbnVzZSApCi0gICAgewotICAgICAgICB2b2lkICpyZXQ7Ci0g
ICAgICAgIHBtYXBfbG9jaygpOwotICAgICAgICByZXQgPSBwbWFwX21hcChtZm4pOwotICAgICAg
ICBwbWFwX3VubG9jaygpOwotICAgICAgICBmbHVzaF90bGJfb25lX2xvY2FsKHJldCk7Ci0gICAg
ICAgIHJldHVybiByZXQ7Ci0gICAgfQorICAgICAgICBnb3RvIHBtYXA7CiAKICAgICBwZXJmY19p
bmNyKG1hcF9kb21haW5fcGFnZV9jb3VudCk7CiAKQEAgLTE3OSw5ICsxNjYsMTYgQEAgdm9pZCAq
bWFwX2RvbWFpbl9wYWdlKG1mbl90IG1mbikKIAogICAgIGwxZV93cml0ZSgmTUFQQ0FDSEVfTDFF
TlQoaWR4KSwgbDFlX2Zyb21fbWZuKG1mbiwgX19QQUdFX0hZUEVSVklTT1JfUlcpKTsKIAotIG91
dDoKK291dDoKICAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7CiAgICAgcmV0dXJuICh2b2lk
ICopTUFQQ0FDSEVfVklSVF9TVEFSVCArIHBmbl90b19wYWRkcihpZHgpOworCitwbWFwOgorICAg
IHBtYXBfbG9jaygpOworICAgIHJldCA9IHBtYXBfbWFwKG1mbik7CisgICAgcG1hcF91bmxvY2so
KTsKKyAgICBmbHVzaF90bGJfb25lX2xvY2FsKHJldCk7CisgICAgcmV0dXJuIHJldDsKIH0KIAog
dm9pZCB1bm1hcF9kb21haW5fcGFnZShjb25zdCB2b2lkICpwdHIpCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvcHYvZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwpp
bmRleCAxNTU1YTYxYjg0Li4yMDJlZGNhYTE3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYv
ZG9tMF9idWlsZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKQEAgLTIzNiw3
ICsyMzYsNyBAQCBzdGF0aWMgX19pbml0IHZvaWQgc2V0dXBfcHZfcGh5c21hcChzdHJ1Y3QgZG9t
YWluICpkLCB1bnNpZ25lZCBsb25nIHBndGJsX3BmbiwKICAgICBpZiAoIHBsM2UgKQogICAgICAg
ICB1bm1hcF9kb21haW5fcGFnZShwbDNlKTsKIAotICAgIC8vdW5tYXBfZG9tYWluX3BhZ2UobDRz
dGFydCk7CisgICAgdW5tYXBfZG9tYWluX3BhZ2UobDRzdGFydCk7CiB9CiAKIHN0YXRpYyBzdHJ1
Y3QgcGFnZV9pbmZvICogX19pbml0IGFsbG9jX2NodW5rKHN0cnVjdCBkb21haW4gKmQsCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
