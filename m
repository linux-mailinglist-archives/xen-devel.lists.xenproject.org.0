Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8740BEEFE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQU-0001gQ-Gy; Thu, 26 Sep 2019 09:51:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQQO-0001Vk-5l
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:51:00 +0000
X-Inumbo-ID: 23a6c3cc-e043-11e9-97fb-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id 23a6c3cc-e043-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491457; x=1601027457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JbDOP4ipVKzLlTXBw9nd78xyznvahBG8mPjM9/COwUA=;
 b=Gb4eppG2zeC0o1d3WOHz54wimZdF/H2XbcSnaEZbPgriUndE2fced5Mm
 8BIBwbAe6M0OBquEFB6OeZyoLov5wr4X2pzrdiYGqEAYJljxAcWJdubUH
 lBGpvZdtzlJffBMtAa5LeXMwgAf6CIeTuKKwKCZVVhFcsPry9QTRlleFf g=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535548"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:50:57 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 07D24A1E66; Thu, 26 Sep 2019 09:50:55 +0000 (UTC)
Received: from EX13D28EUC001.ant.amazon.com (10.43.164.4) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:21 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUC001.ant.amazon.com (10.43.164.4) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:19 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:50:17 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:47 +0100
Message-ID: <19981ca60bdd61b305946e51fa4ec4e66e2a9408.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 84/84] x86/pv: fix a couple of direct map
 assumptions in dom0 building.
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
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L2RvbTBf
YnVpbGQuYyAgICB8IDcgKysrKy0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCB8
IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgYi94ZW4vYXJjaC94ODYv
cHYvZG9tMF9idWlsZC5jCmluZGV4IDIwMmVkY2FhMTcuLjk4ZGNjMThkMjEgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L3B2L2RvbTBf
YnVpbGQuYwpAQCAtNjI2LDkgKzYyNiwxMCBAQCBpbnQgX19pbml0IGRvbTBfY29uc3RydWN0X3B2
KHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgIGw0c3RhcnQgPSBsNHRhYiA9IG1hcF94ZW5fcGFn
ZXRhYmxlKG1hZGRyX3RvX21mbihtcHRfYWxsb2MpKTsKICAgICAgICAgbXB0X2FsbG9jICs9IFBB
R0VfU0laRTsKICAgICAgICAgY2xlYXJfcGFnZShsNHRhYik7Ci0gICAgICAgIGluaXRfeGVuX2w0
X3Nsb3RzKGw0dGFiLCBfbWZuKHZpcnRfdG9fbWZuKGw0c3RhcnQpKSwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgZCwgSU5WQUxJRF9NRk4sIHRydWUpOwotICAgICAgICB2LT5hcmNoLmd1ZXN0
X3RhYmxlID0gcGFnZXRhYmxlX2Zyb21fcGFkZHIoX19wYShsNHN0YXJ0KSk7CisgICAgICAgIGlu
aXRfeGVuX2w0X3Nsb3RzKGw0dGFiLCBfbWZuKHZpcnRfdG9fbWZuX3dhbGsobDRzdGFydCkpLCBk
LAorICAgICAgICAgICAgICAgIElOVkFMSURfTUZOLCB0cnVlKTsKKyAgICAgICAgdi0+YXJjaC5n
dWVzdF90YWJsZSA9CisgICAgICAgICAgICAgICAgcGFnZXRhYmxlX2Zyb21fbWZuKF9tZm4odmly
dF90b19tZm5fd2FsayhsNHN0YXJ0KSkpOwogICAgIH0KICAgICBlbHNlCiAgICAgewpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvcHJvY2Vzc29yLmgKaW5kZXggZjU3MTE5MWNkYi4uN2U4ZDAxMGQwNyAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L3Byb2Nlc3Nvci5oCkBAIC00NjUsOCArNDY1LDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGRpc2Fi
bGVfZWFjaF9pc3QoaWR0X2VudHJ5X3QgKmlkdCkKIGV4dGVybiBpZHRfZW50cnlfdCBpZHRfdGFi
bGVbXTsKIGV4dGVybiBpZHRfZW50cnlfdCAqaWR0X3RhYmxlc1tdOwogCi1ERUNMQVJFX1BFUl9D
UFUoc3RydWN0IHRzc19zdHJ1Y3QsIGluaXRfdHNzKTsKLQogZXh0ZXJuIHZvaWQgd3JpdGVfcHRi
YXNlKHN0cnVjdCB2Y3B1ICp2KTsKIAogLyogUkVQIE5PUCAoUEFVU0UpIGlzIGEgZ29vZCB0aGlu
ZyB0byBpbnNlcnQgaW50byBidXN5LXdhaXQgbG9vcHMuICovCi0tIAoyLjE3LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
