Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A26BEEEB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQP1-0006US-OT; Thu, 26 Sep 2019 09:49:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOz-0006QQ-4m
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:33 +0000
X-Inumbo-ID: ee4d4188-e042-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id ee4d4188-e042-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491369; x=1601027369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=VLg8J96hE0TekqiR90JQhSSRAIe4sbPYqHBK92uWVGE=;
 b=BuS/LxPQM/Z+rX/a0r3/vAfioBjG07Y/QvlngMOhnXx6K5SSnd5sZkAy
 4gXXtsrLLJT6N6EIuw21GVfBa59H7FgLatz0GhE3dvhlpqz/2zrjVV4Tb
 J/CMy9CfOYIUQLmb2mDZGFiPqVoL7DZFszrJQ+5NQlQwkpMfkjmp/vb7h I=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836988826"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1d-98acfc19.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:48:24 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-98acfc19.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9A94AA31AD; Thu, 26 Sep 2019 09:48:13 +0000 (UTC)
Received: from EX13D10UWA001.ant.amazon.com (10.43.160.216) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:44 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D10UWA001.ant.amazon.com (10.43.160.216) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:44 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:42 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:50 +0100
Message-ID: <5c25bb98b74ccd09a48b421c636dc1d383c20150.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 27/84] x86_64/mm: switch to new APIs in
 setup_m2p_table
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MTQgKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2Fy
Y2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IGQwMWI4ZjdjMTcuLmUwNWEzYTQ0NWEgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21t
LmMKQEAgLTM5Nyw5ICszOTcsMTAgQEAgc3RhdGljIGludCBzZXR1cF9tMnBfdGFibGUoc3RydWN0
IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKIHsKICAgICB1bnNpZ25lZCBsb25nIGksIHZhLCBzbWFw
LCBlbWFwOwogICAgIHVuc2lnbmVkIGludCBuOwotICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9IE5V
TEwsICpsMl9yb19tcHQ7CisgICAgbDJfcGdlbnRyeV90ICpwbDJlID0gTlVMTCwgKmwyX3JvX21w
dCA9IE5VTEw7CiAgICAgbDNfcGdlbnRyeV90ICpsM19yb19tcHQgPSBOVUxMOwogICAgIGludCBy
ZXQgPSAwOworICAgIG1mbl90IGwyX3JvX21wdF9tZm47CiAKICAgICBBU1NFUlQobDRlX2dldF9m
bGFncyhpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChST19NUFRfVklSVF9TVEFSVCldKQog
ICAgICAgICAgICAgJiBfUEFHRV9QUkVTRU5UKTsKQEAgLTQ2MiwxNyArNDYzLDE5IEBAIHN0YXRp
YyBpbnQgc2V0dXBfbTJwX3RhYmxlKHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAgICAg
ICAgICAgICAgICAgICBsMl90YWJsZV9vZmZzZXQodmEpOwogICAgICAgICAgICAgZWxzZQogICAg
ICAgICAgICAgewotICAgICAgICAgICAgICAgIGwyX3JvX21wdCA9IGFsbG9jX3hlbl9wYWdldGFi
bGUoKTsKLSAgICAgICAgICAgICAgICBpZiAoICFsMl9yb19tcHQgKQorICAgICAgICAgICAgICAg
IFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwyX3JvX21wdCk7CisgICAgICAgICAgICAgICAgbDJf
cm9fbXB0X21mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7CisgICAgICAgICAgICAgICAg
aWYgKCBtZm5fZXEobDJfcm9fbXB0X21mbiwgSU5WQUxJRF9NRk4pICkKICAgICAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07CiAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZXJyb3I7CiAgICAgICAgICAgICAgICAgfQogCisgICAgICAgICAgICAgICAgbDJf
cm9fbXB0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwyX3JvX21wdF9tZm4pOwogICAgICAgICAg
ICAgICAgIGNsZWFyX3BhZ2UobDJfcm9fbXB0KTsKICAgICAgICAgICAgICAgICBsM2Vfd3JpdGUo
JmwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgbDNlX2Zyb21fcGFkZHIoX19wYShsMl9yb19tcHQpLAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUl9STyB8IF9QQUdFX1VTRVIpKTsK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgbDNlX2Zyb21fbWZuKGwyX3JvX21wdF9tZm4sCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUl9S
TyB8IF9QQUdFX1VTRVIpKTsKICAgICAgICAgICAgICAgICBwbDJlID0gbDJfcm9fbXB0OwogICAg
ICAgICAgICAgICAgIHBsMmUgKz0gbDJfdGFibGVfb2Zmc2V0KHZhKTsKICAgICAgICAgICAgIH0K
QEAgLTQ4OCw2ICs0OTEsNyBAQCBzdGF0aWMgaW50IHNldHVwX20ycF90YWJsZShzdHJ1Y3QgbWVt
X2hvdGFkZF9pbmZvICppbmZvKQogCiAgICAgcmV0ID0gc2V0dXBfY29tcGF0X20ycF90YWJsZShp
bmZvKTsKIGVycm9yOgorICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwyX3JvX21wdCk7CiAg
ICAgcmV0dXJuIHJldDsKIH0KIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
