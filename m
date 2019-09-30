Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF1C1F10
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1K-0007mU-Eu; Mon, 30 Sep 2019 10:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1I-0007kY-RR
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:08 +0000
X-Inumbo-ID: f0f7263c-e36d-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id f0f7263c-e36d-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839694; x=1601375694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=6nzAStnWYrYC7d4QMPwj7AvyNQB9HFAtnT/it/dtaYg=;
 b=ClhHi/w1LjmqDI7Uo2RA648PS/b1j6WTmndwdw8BI7YNatcJoqbSwSK+
 U3nAyFWfYESNHLmypSTxokVwYFJeGPlGTsIfg6Tg5Gj3RQJZ53z3RwGkj
 Zyu9H8mopo+rcKw45pOdu3+erF9o0S7MYQFVPvZhusA3Vu8rPYB54p/MH c=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630119"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:46 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1A5CFA20C7; Mon, 30 Sep 2019 10:34:46 +0000 (UTC)
Received: from EX13D06UEE001.ant.amazon.com (10.43.62.79) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:17 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D06UEE001.ant.amazon.com (10.43.62.79) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:16 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:15 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:19 +0100
Message-ID: <9797dfe61ac60fa7239f1757e758ed14ae6bc739.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 27/55] x86_64/mm: drop lXe_to_lYe invocations
 from setup_m2p_table
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
MTYgKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVu
L2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IGQ0NTJlZDM5NjYuLmM0MTcxNWNkNTYgMTAwNjQ0
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
