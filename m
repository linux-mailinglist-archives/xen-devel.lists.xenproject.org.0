Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B17BEEFC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPK-00076l-G0; Thu, 26 Sep 2019 09:49:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPH-000733-Ud
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:51 +0000
X-Inumbo-ID: fc110368-e042-11e9-97fb-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id fc110368-e042-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491391; x=1601027391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=BGeUL/mcPd5wEv8IOXu2uKjLO1fDkSD+qYwjUV4qteY=;
 b=HqJAy0lrGaegXSfls0093bWeJpmcath64yRBreeMaLbkuuekiuw5Do8a
 kz+LXDjbc9zoiIJsRc/vKfP/8i/C6qakYC1iLyEyBEfWzwJ9qCvBssYGr
 qDtG2aXulInpvK3kJTAZlePrBDl8ddRvld6HU2A8aSuqerVPu26UHNx6N A=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750777"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:49:51 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id AF268A236F; Thu, 26 Sep 2019 09:49:47 +0000 (UTC)
Received: from EX13D28EUC002.ant.amazon.com (10.43.164.254) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:31 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUC002.ant.amazon.com (10.43.164.254) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:30 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:26 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:34 +0100
Message-ID: <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyax@amazon.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NldHVwLmMg
ICAgfCA0ICsrLS0KIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jIHwgMiArLQogMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCBlOTY0YzAzMmY2Li4z
ZGMyZmFkOTg3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJj
aC94ODYvc2V0dXAuYwpAQCAtMTM2Nyw3ICsxMzY3LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4g
X19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKIAogICAgICAgICAgICAgaWYgKCBtYXBf
ZSA8IGVuZCApCiAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgbWFwX3BhZ2VzX3RvX3hl
bigodW5zaWduZWQgbG9uZylfX3ZhKG1hcF9lKSwgbWFkZHJfdG9fbWZuKG1hcF9lKSwKKyAgICAg
ICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKV9fdmEobWFwX2UpLCBJ
TlZBTElEX01GTiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBGTl9ET1dOKGVu
ZCAtIG1hcF9lKSwgUEFHRV9IWVBFUlZJU09SKTsKICAgICAgICAgICAgICAgICBpbml0X2Jvb3Rf
cGFnZXMobWFwX2UsIGVuZCk7CiAgICAgICAgICAgICAgICAgbWFwX2UgPSBlbmQ7CkBAIC0xMzgy
LDcgKzEzODIsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBs
b25nIG1iaV9wKQogICAgICAgICB9CiAgICAgICAgIGlmICggcyA8IG1hcF9zICkKICAgICAgICAg
ewotICAgICAgICAgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQgbG9uZylfX3ZhKHMpLCBt
YWRkcl90b19tZm4ocyksCisgICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBs
b25nKV9fdmEocyksIElOVkFMSURfTUZOLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQ
Rk5fRE9XTihtYXBfcyAtIHMpLCBQQUdFX0hZUEVSVklTT1IpOwogICAgICAgICAgICAgaW5pdF9i
b290X3BhZ2VzKHMsIG1hcF9zKTsKICAgICAgICAgfQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwppbmRleCBhMDBkYjRjMGQ5Li5k
ZWVlYWMwNjVjIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYworKysgYi94ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYwpAQCAtMjE1Nyw3ICsyMTU3LDcgQEAgdm9pZCAqYWxsb2NfeGVu
aGVhcF9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIsIHVuc2lnbmVkIGludCBtZW1mbGFncykKICAg
ICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKXJldCwgcGFnZV90b19tZm4ocGcpLAog
ICAgICAgICAgICAgICAgICAgICAgMVVMIDw8IG9yZGVyLCBQQUdFX0hZUEVSVklTT1IpOwogCi0g
ICAgcmV0dXJuIHBhZ2VfdG9fdmlydChwZyk7CisgICAgcmV0dXJuIHJldDsKIH0KIAogCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
