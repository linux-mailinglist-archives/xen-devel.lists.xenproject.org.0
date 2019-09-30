Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C8C1F44
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:39:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2d-0001lj-Cm; Mon, 30 Sep 2019 10:36:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2a-0001iC-VS
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:28 +0000
X-Inumbo-ID: 1c628834-e36e-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 1c628834-e36e-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839767; x=1601375767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=njdESk/6JcRZulToFGIspsgQKCCPqIrWPc225saYE8A=;
 b=LtgBtLKCQvCFGxCMlmj1vaO2lvyaylM7zN/v1uEQi5eTKq0I1Zol5FFP
 vCoWpeRPNZC6kfeP4iRZlw50kYlyIqm3Af65BjEGg+zEk42vezLP3M1FH
 SIg1tzg94uQ32Kr6z4OJtQDpfrkA7VVCJkMRGJ3oT1ODMKDA5r8OC8hDG g=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="838005677"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Sep 2019 10:35:07 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9DEB7A27FA; Mon, 30 Sep 2019 10:34:53 +0000 (UTC)
Received: from EX13D05UEE004.ant.amazon.com (10.43.62.189) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:28 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D05UEE004.ant.amazon.com (10.43.62.189) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:28 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:27 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:33 +0100
Message-ID: <5cebde845cbd886a723a0207e4412c90c2943151.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 41/55] x86_64/mm: map and unmap page tables
 in m2p_mapped
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
MjIgKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5j
IGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IGM0MTcxNWNkNTYuLjVjNWI5MWI3ODUg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYv
eDg2XzY0L21tLmMKQEAgLTEzMCwyOCArMTMwLDM2IEBAIHN0YXRpYyBpbnQgbTJwX21hcHBlZCh1
bnNpZ25lZCBsb25nIHNwZm4pCiB7CiAgICAgdW5zaWduZWQgbG9uZyB2YTsKICAgICBsM19wZ2Vu
dHJ5X3QgKmwzX3JvX21wdDsKLSAgICBsMl9wZ2VudHJ5X3QgKmwyX3JvX21wdDsKKyAgICBsMl9w
Z2VudHJ5X3QgKmwyX3JvX21wdCA9IE5VTEw7CisgICAgaW50IHJjID0gTTJQX05PX01BUFBFRDsK
IAogICAgIHZhID0gUk9fTVBUX1ZJUlRfU1RBUlQgKyBzcGZuICogc2l6ZW9mKCptYWNoaW5lX3Rv
X3BoeXNfbWFwcGluZyk7Ci0gICAgbDNfcm9fbXB0ID0gbDRlX3RvX2wzZShpZGxlX3BnX3RhYmxl
W2w0X3RhYmxlX29mZnNldCh2YSldKTsKKyAgICBsM19yb19tcHQgPSBtYXBfeGVuX3BhZ2V0YWJs
ZV9uZXcoCisgICAgICAgIGw0ZV9nZXRfbWZuKGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0
KHZhKV0pKTsKIAogICAgIHN3aXRjaCAoIGwzZV9nZXRfZmxhZ3MobDNfcm9fbXB0W2wzX3RhYmxl
X29mZnNldCh2YSldKSAmCiAgICAgICAgICAgICAgKF9QQUdFX1BSRVNFTlQgfF9QQUdFX1BTRSkp
CiAgICAgewogICAgICAgICBjYXNlIF9QQUdFX1BTRXxfUEFHRV9QUkVTRU5UOgotICAgICAgICAg
ICAgcmV0dXJuIE0yUF8xR19NQVBQRUQ7CisgICAgICAgICAgICByYyA9IE0yUF8xR19NQVBQRUQ7
CisgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgLyogQ2hlY2sgZm9yIG5leHQgbGV2ZWwg
Ki8KICAgICAgICAgY2FzZSBfUEFHRV9QUkVTRU5UOgogICAgICAgICAgICAgYnJlYWs7CiAgICAg
ICAgIGRlZmF1bHQ6Ci0gICAgICAgICAgICByZXR1cm4gTTJQX05PX01BUFBFRDsKKyAgICAgICAg
ICAgIHJjID0gTTJQX05PX01BUFBFRDsKKyAgICAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KLSAg
ICBsMl9yb19tcHQgPSBsM2VfdG9fbDJlKGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSk7
CisgICAgbDJfcm9fbXB0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KAorICAgICAgICBsM2VfZ2V0
X21mbihsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KHZhKV0pKTsKIAogICAgIGlmIChsMmVfZ2V0
X2ZsYWdzKGwyX3JvX21wdFtsMl90YWJsZV9vZmZzZXQodmEpXSkgJiBfUEFHRV9QUkVTRU5UKQot
ICAgICAgICByZXR1cm4gTTJQXzJNX01BUFBFRDsKKyAgICAgICAgcmMgPSBNMlBfMk1fTUFQUEVE
OwogCi0gICAgcmV0dXJuIE0yUF9OT19NQVBQRUQ7Cisgb3V0OgorICAgIFVOTUFQX1hFTl9QQUdF
VEFCTEVfTkVXKGwyX3JvX21wdCk7CisgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDNfcm9f
bXB0KTsKKyAgICByZXR1cm4gcmM7CiB9CiAKIHN0YXRpYyBpbnQgc2hhcmVfaG90YWRkX20ycF90
YWJsZShzdHJ1Y3QgbWVtX2hvdGFkZF9pbmZvICppbmZvKQotLSAKMi4xNy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
