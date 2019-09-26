Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2D5BEEE3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOQ-0005J8-2M; Thu, 26 Sep 2019 09:48:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQON-0005Fd-P8
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:55 +0000
X-Inumbo-ID: d7a31700-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id d7a31700-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491330; x=1601027330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kEqJEZp9xHiKHGinEbupzGCKej+WQIrDevTGdejpDDc=;
 b=bAcBM3f7HJ3H9Zos8Lcm41LZSKMj0UH/r0yhvcLYkpX1EDmOl6Y3gpBw
 RIhXDKAUeCExr92ny0KyJOiRRdoNr5QuMRGhGSlomYauncqFkcfGqhR0o
 DzQWiLRsmLkzPPta4IqC52NbRFFii36j9HzUnQjtiEcgMrVl28au2rGCQ w=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750579"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:49 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id EBB38A2102; Thu, 26 Sep 2019 09:48:47 +0000 (UTC)
Received: from EX13d09UWA004.ant.amazon.com (10.43.160.158) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:10 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13d09UWA004.ant.amazon.com (10.43.160.158) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:10 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:08 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:05 +0100
Message-ID: <aa1e8975a5ce0d08a2de2af4900b34f88892ae7c.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 42/84] x86_64/mm: map and unmap page tables
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MjIgKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5j
IGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IDkxNjNmMDhkZTkuLjM2ZGZhYzExYTMg
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
