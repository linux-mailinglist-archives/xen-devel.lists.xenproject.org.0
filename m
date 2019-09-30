Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450ECC1F1B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0y-0007IZ-BD; Mon, 30 Sep 2019 10:34:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0w-0007HR-Se
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:46 +0000
X-Inumbo-ID: ec37fe32-e36d-11e9-96cd-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id ec37fe32-e36d-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839686; x=1601375686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Ip5SaJrZGdwG5/dssfQ+/hlVPjGGAQ5ZKNoKItEsnHE=;
 b=cikTGFjjzHjNL2vxUe2c62/eP5QuIPi8PpuGHBcNQHvX65P6sLmQhK8H
 EOfK/ao5nkZtiMehhF7WFAWoZeYWF3EJOvpynYd3rEBNF3gfrpuB1H4Li
 PS3vd1/fvE4QWpNQi3MVHWbE+UJdLhnNuVBVg/EMSxH/++VrjMJYm8TRd 0=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="754242231"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Sep 2019 10:34:46 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id EC7FBA065D; Mon, 30 Sep 2019 10:34:44 +0000 (UTC)
Received: from EX13D18UEE004.ant.amazon.com (10.43.62.129) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:16 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D18UEE004.ant.amazon.com (10.43.62.129) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:15 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:15 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:18 +0100
Message-ID: <f2ca427a5e4cb963ffa8152bd82cc3abc589c1d1.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 26/55] x86_64/mm: switch to new APIs in
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MTQgKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2Fy
Y2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IGYzMWJkNGZmZGUuLmQ0NTJlZDM5NjYgMTAwNjQ0Ci0t
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
