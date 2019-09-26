Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C77BEEF8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQH-0001AD-3j; Thu, 26 Sep 2019 09:50:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQQ9-0000ze-W6
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:46 +0000
X-Inumbo-ID: 1a310348-e043-11e9-964c-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id 1a310348-e043-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491441; x=1601027441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+D3aSBpu/9jGRBhfqGVbSAXhO++vMOcqH3ZAlDGs2+w=;
 b=Obc0RyPSQiQCt90QNpGKb4SiiHDxtsGCHs/MiiKZxIHlT/wYqvOgwQWc
 L37aFnrcZbldDwMh9SFALjwSPDRxJgRRzE6D/auectgdcftJRO900yStT
 SVzzr+rsEa13P869bYlBf0gqFANgLv98sYPV7dpZ+nmERvsE8cVc12dNo Y=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535493"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:50:41 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2B4CDA05FE; Thu, 26 Sep 2019 09:50:40 +0000 (UTC)
Received: from EX13D28EUC003.ant.amazon.com (10.43.164.43) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:06 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUC003.ant.amazon.com (10.43.164.43) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:04 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:50:02 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:43 +0100
Message-ID: <969374c5a1c62eabb329694092d551b04d77b8be.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 80/84] x86/setup: Install dummy 1:1 mappings
 for all mem passed to allocators.
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClRoaXMgbWVhbnMgd2Ugbm8g
bG9uZ2VyIGhhdmUgYW4gYWx3YXlzLW1hcHBlZCBkaXJlY3QgbWFwIG5vdy4KClNpZ25lZC1vZmYt
Ynk6IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3Nl
dHVwLmMgfCAxNCArKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94
ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCA5MDE1ZTNiNzIzLi5lNmEzZjFlMGExIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAt
MjQwLDcgKzI0MCw5IEBAIHZvaWQgX19pbml0IGRpc2NhcmRfaW5pdGlhbF9pbWFnZXModm9pZCkK
ICAgICAgICAgdWludDY0X3Qgc3RhcnQgPSAodWludDY0X3QpaW5pdGlhbF9pbWFnZXNbaV0ubW9k
X3N0YXJ0IDw8IFBBR0VfU0hJRlQ7CiAKICAgICAgICAgaW5pdF9kb21oZWFwX3BhZ2VzKHN0YXJ0
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnQgKyBQQUdFX0FMSUdOKGluaXRpYWxf
aW1hZ2VzW2ldLm1vZF9lbmQpKTsKKyAgICAgICAgICAgICAgICBzdGFydCArIFBBR0VfQUxJR04o
aW5pdGlhbF9pbWFnZXNbaV0ubW9kX2VuZCkpOworICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1
bnNpZ25lZCBsb25nKV9fdmEoc3RhcnQpLCBJTlZBTElEX01GTiwKKyAgICAgICAgICAgICAgICBQ
Rk5fRE9XTihQQUdFX0FMSUdOKGluaXRpYWxfaW1hZ2VzW2ldLm1vZF9lbmQpKSwgX1BBR0VfTk9O
RSk7CiAgICAgfQogCiAgICAgbnJfaW5pdGlhbF9pbWFnZXMgPSAwOwpAQCAtMTM0Niw2ICsxMzQ4
LDggQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlf
cCkKIAogICAgICAgICAvKiBQYXNzIG1hcHBlZCBtZW1vcnkgdG8gYWxsb2NhdG9yIC9iZWZvcmUv
IGNyZWF0aW5nIG5ldyBtYXBwaW5ncy4gKi8KICAgICAgICAgaW5pdF9ib290X3BhZ2VzKHMsIG1p
bihtYXBfcywgZSkpOworICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKV9f
dmEocyksIElOVkFMSURfTUZOLAorICAgICAgICAgICAgICAgICAgICAgICAgIFBGTl9ET1dOKG1p
bihtYXBfcywgZSkgLSBzKSwgX1BBR0VfTk9ORSk7CiAgICAgICAgIHMgPSBtYXBfczsKICAgICAg
ICAgaWYgKCBzIDwgbWFwX2UgKQogICAgICAgICB7CkBAIC0xMzU0LDYgKzEzNTgsOCBAQCB2b2lk
IF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgICAg
ICAgICAgbWFwX3MgPSAocyArIG1hc2spICYgfm1hc2s7CiAgICAgICAgICAgICBtYXBfZSAmPSB+
bWFzazsKICAgICAgICAgICAgIGluaXRfYm9vdF9wYWdlcyhtYXBfcywgbWFwX2UpOworICAgICAg
ICAgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQgbG9uZylfX3ZhKG1hcF9zKSwgSU5WQUxJ
RF9NRk4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBGTl9ET1dOKG1hcF9lIC0gbWFw
X3MpLCBfUEFHRV9OT05FKTsKICAgICAgICAgfQogCiAgICAgICAgIGlmICggbWFwX3MgPiBtYXBf
ZSApCkBAIC0xMzY3LDkgKzEzNzMsOSBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hl
bih1bnNpZ25lZCBsb25nIG1iaV9wKQogCiAgICAgICAgICAgICBpZiAoIG1hcF9lIDwgZW5kICkK
ICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBpbml0X2Jvb3RfcGFnZXMobWFwX2UsIGVu
ZCk7CiAgICAgICAgICAgICAgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQgbG9uZylfX3Zh
KG1hcF9lKSwgSU5WQUxJRF9NRk4sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQ
Rk5fRE9XTihlbmQgLSBtYXBfZSksIF9QQUdFX05PTkUpOwotICAgICAgICAgICAgICAgIGluaXRf
Ym9vdF9wYWdlcyhtYXBfZSwgZW5kKTsKICAgICAgICAgICAgICAgICBtYXBfZSA9IGVuZDsKICAg
ICAgICAgICAgIH0KICAgICAgICAgfQpAQCAtMTM4Miw5ICsxMzg4LDkgQEAgdm9pZCBfX2luaXQg
bm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAgICAgfQogICAg
ICAgICBpZiAoIHMgPCBtYXBfcyApCiAgICAgICAgIHsKKyAgICAgICAgICAgIGluaXRfYm9vdF9w
YWdlcyhzLCBtYXBfcyk7CiAgICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBs
b25nKV9fdmEocyksIElOVkFMSURfTUZOLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQ
Rk5fRE9XTihtYXBfcyAtIHMpLCBfUEFHRV9OT05FKTsKLSAgICAgICAgICAgIGluaXRfYm9vdF9w
YWdlcyhzLCBtYXBfcyk7CiAgICAgICAgIH0KICAgICB9CiAKQEAgLTE1MDYsNiArMTUxMiw4IEBA
IHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAg
ICAgICAgICAgICBpZiAoIFBGTl9ET1dOKHMpIDw9IGxpbWl0ICkKICAgICAgICAgICAgICAgICBz
ID0gcGZuX3RvX3BhZGRyKGxpbWl0ICsgMSk7CiAgICAgICAgICAgICBpbml0X2RvbWhlYXBfcGFn
ZXMocywgZSk7CisgICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKV9f
dmEocyksIElOVkFMSURfTUZOLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQRk5fRE9X
TihlIC0gcyksIF9QQUdFX05PTkUpOwogICAgICAgICB9CiAgICAgfQogICAgIGVsc2UKLS0gCjIu
MTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
