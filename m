Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1EBEED6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNm-0004JT-Nr; Thu, 26 Sep 2019 09:48:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNl-0004IE-Ku
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:17 +0000
X-Inumbo-ID: c3e9b570-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id c3e9b570-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491297; x=1601027297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=KJ14P5Bqi4tyVqx7vQ0u6JsMrbSbQzectx0LeeuTkRc=;
 b=dfGZsKlNCN8VC9qv4pVFguSg3cv+ipnPwWtpRkF2pgM2AZTRfa95uZss
 k3S2RBReUS5WRdFFNfWCt2RGmJTjxt3tXrZrvmWXsCi2imdCMUkH96NIg
 bUI5hvNY/PbaiLchMjzX5vcfd/H9xV++nZrXNgAcTxrCtwYBG/cJcTRHS E=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788184"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:16 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id E4DC2A194F; Thu, 26 Sep 2019 09:48:14 +0000 (UTC)
Received: from EX13D31UWA002.ant.amazon.com (10.43.160.82) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:46 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D31UWA002.ant.amazon.com (10.43.160.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:45 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:44 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:51 +0100
Message-ID: <8d8a44d0526bcc08d290c14bfd127be6860ce2e4.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 28/84] x86_64/mm: drop lXe_to_lYe
 invocations from setup_m2p_table
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
MTYgKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVu
L2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IGUwNWEzYTQ0NWEuLjkxNjNmMDhkZTkgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0
L21tLmMKQEAgLTQwMCwxMSArNDAwLDEzIEBAIHN0YXRpYyBpbnQgc2V0dXBfbTJwX3RhYmxlKHN0
cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAgICAgbDJfcGdlbnRyeV90ICpwbDJlID0gTlVM
TCwgKmwyX3JvX21wdCA9IE5VTEw7CiAgICAgbDNfcGdlbnRyeV90ICpsM19yb19tcHQgPSBOVUxM
OwogICAgIGludCByZXQgPSAwOwotICAgIG1mbl90IGwyX3JvX21wdF9tZm47CisgICAgbWZuX3Qg
bDJfcm9fbXB0X21mbiwgbDNfcm9fbXB0X21mbjsKIAogICAgIEFTU0VSVChsNGVfZ2V0X2ZsYWdz
KGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KFJPX01QVF9WSVJUX1NUQVJUKV0pCiAgICAg
ICAgICAgICAmIF9QQUdFX1BSRVNFTlQpOwotICAgIGwzX3JvX21wdCA9IGw0ZV90b19sM2UoaWRs
ZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoUk9fTVBUX1ZJUlRfU1RBUlQpXSk7CisgICAgbDNf
cm9fbXB0X21mbiA9IGw0ZV9nZXRfbWZuKGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJPX01QVF9WSVJUX1NUQVJU
KV0pOworICAgIGwzX3JvX21wdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsM19yb19tcHRfbWZu
KTsKIAogICAgIHNtYXAgPSAoaW5mby0+c3BmbiAmICh+KCgxVUwgPDwgKEwyX1BBR0VUQUJMRV9T
SElGVCAtIDMpKSAtMSkpKTsKICAgICBlbWFwID0gKChpbmZvLT5lcGZuICsgKCgxVUwgPDwgKEwy
X1BBR0VUQUJMRV9TSElGVCAtIDMpKSAtIDEgKSkgJgpAQCAtNDU5LDggKzQ2MSwxMyBAQCBzdGF0
aWMgaW50IHNldHVwX20ycF90YWJsZShzdHJ1Y3QgbWVtX2hvdGFkZF9pbmZvICppbmZvKQogICAg
ICAgICAgICAgICAgICAgX1BBR0VfUFNFKSk7CiAgICAgICAgICAgICBpZiAoIGwzZV9nZXRfZmxh
Z3MobDNfcm9fbXB0W2wzX3RhYmxlX29mZnNldCh2YSldKSAmCiAgICAgICAgICAgICAgIF9QQUdF
X1BSRVNFTlQgKQotICAgICAgICAgICAgICAgIHBsMmUgPSBsM2VfdG9fbDJlKGwzX3JvX21wdFts
M190YWJsZV9vZmZzZXQodmEpXSkgKwotICAgICAgICAgICAgICAgICAgbDJfdGFibGVfb2Zmc2V0
KHZhKTsKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxF
X05FVyhsMl9yb19tcHQpOworICAgICAgICAgICAgICAgIGwyX3JvX21wdF9tZm4gPSBsM2VfZ2V0
X21mbihsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KHZhKV0pOworICAgICAgICAgICAgICAgIGwy
X3JvX21wdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsMl9yb19tcHRfbWZuKTsKKyAgICAgICAg
ICAgICAgICBBU1NFUlQobDJfcm9fbXB0KTsKKyAgICAgICAgICAgICAgICBwbDJlID0gbDJfcm9f
bXB0ICsgbDJfdGFibGVfb2Zmc2V0KHZhKTsKKyAgICAgICAgICAgIH0KICAgICAgICAgICAgIGVs
c2UKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05F
VyhsMl9yb19tcHQpOwpAQCAtNDkyLDYgKzQ5OSw3IEBAIHN0YXRpYyBpbnQgc2V0dXBfbTJwX3Rh
YmxlKHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAgICAgcmV0ID0gc2V0dXBfY29tcGF0
X20ycF90YWJsZShpbmZvKTsKIGVycm9yOgogICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwy
X3JvX21wdCk7CisgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDNfcm9fbXB0KTsKICAgICBy
ZXR1cm4gcmV0OwogfQogCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
