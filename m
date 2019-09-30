Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A71C1F0D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1F-0007fO-H4; Mon, 30 Sep 2019 10:35:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1D-0007df-R1
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:03 +0000
X-Inumbo-ID: ec2fc6f4-e36d-11e9-97fb-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id ec2fc6f4-e36d-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839686; x=1601375686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SQh+B8Qj4A93IoC6Ds2kYPPws3P2iKoUgq/Hi2iZ6RM=;
 b=FjDl5ReAZI80sVJ7r3sLlLn3BrZMQJvHXtXJtAQ0de5U4CiJa1l+8nZl
 CF6aru5FF1U4Ot4toybK+0v+yrtdAw3yhe9V0Ke4gzMHh6Nu/ItWTVcE2
 tivdv4LnRqBmdYCJZRmrRFnLOCq8eYXY2cA7QCXaMkVTUR/QYVuv/iJo3 U=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630114"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 48C05A2267; Mon, 30 Sep 2019 10:34:44 +0000 (UTC)
Received: from EX13D11UEE001.ant.amazon.com (10.43.62.132) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:15 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D11UEE001.ant.amazon.com (10.43.62.132) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:14 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:14 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:17 +0100
Message-ID: <7686120b7f9e3abdefabd930cf1b89818792cab1.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 25/55] x86_64/mm: introduce pl2e in
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
OSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jCmluZGV4IDEwMzkzMjcyMGIuLmYzMWJkNGZmZGUgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKQEAg
LTM5Nyw3ICszOTcsNyBAQCBzdGF0aWMgaW50IHNldHVwX20ycF90YWJsZShzdHJ1Y3QgbWVtX2hv
dGFkZF9pbmZvICppbmZvKQogewogICAgIHVuc2lnbmVkIGxvbmcgaSwgdmEsIHNtYXAsIGVtYXA7
CiAgICAgdW5zaWduZWQgaW50IG47Ci0gICAgbDJfcGdlbnRyeV90ICpsMl9yb19tcHQgPSBOVUxM
OworICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9IE5VTEwsICpsMl9yb19tcHQ7CiAgICAgbDNfcGdl
bnRyeV90ICpsM19yb19tcHQgPSBOVUxMOwogICAgIGludCByZXQgPSAwOwogCkBAIC00NTgsNyAr
NDU4LDcgQEAgc3RhdGljIGludCBzZXR1cF9tMnBfdGFibGUoc3RydWN0IG1lbV9ob3RhZGRfaW5m
byAqaW5mbykKICAgICAgICAgICAgICAgICAgIF9QQUdFX1BTRSkpOwogICAgICAgICAgICAgaWYg
KCBsM2VfZ2V0X2ZsYWdzKGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSkgJgogICAgICAg
ICAgICAgICBfUEFHRV9QUkVTRU5UICkKLSAgICAgICAgICAgICAgICBsMl9yb19tcHQgPSBsM2Vf
dG9fbDJlKGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSkgKworICAgICAgICAgICAgICAg
IHBsMmUgPSBsM2VfdG9fbDJlKGwzX3JvX21wdFtsM190YWJsZV9vZmZzZXQodmEpXSkgKwogICAg
ICAgICAgICAgICAgICAgbDJfdGFibGVfb2Zmc2V0KHZhKTsKICAgICAgICAgICAgIGVsc2UKICAg
ICAgICAgICAgIHsKQEAgLTQ3MywxMSArNDczLDEyIEBAIHN0YXRpYyBpbnQgc2V0dXBfbTJwX3Rh
YmxlKHN0cnVjdCBtZW1faG90YWRkX2luZm8gKmluZm8pCiAgICAgICAgICAgICAgICAgbDNlX3dy
aXRlKCZsM19yb19tcHRbbDNfdGFibGVfb2Zmc2V0KHZhKV0sCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGwzZV9mcm9tX3BhZGRyKF9fcGEobDJfcm9fbXB0KSwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1JfUk8gfCBfUEFHRV9VU0VS
KSk7Ci0gICAgICAgICAgICAgICAgbDJfcm9fbXB0ICs9IGwyX3RhYmxlX29mZnNldCh2YSk7Cisg
ICAgICAgICAgICAgICAgcGwyZSA9IGwyX3JvX21wdDsKKyAgICAgICAgICAgICAgICBwbDJlICs9
IGwyX3RhYmxlX29mZnNldCh2YSk7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIC8qIE5C
LiBDYW5ub3QgYmUgR0xPQkFMOiBndWVzdCB1c2VyIG1vZGUgc2hvdWxkIG5vdCBzZWUgaXQuICov
Ci0gICAgICAgICAgICBsMmVfd3JpdGUobDJfcm9fbXB0LCBsMmVfZnJvbV9tZm4obWZuLAorICAg
ICAgICAgICAgbDJlX3dyaXRlKHBsMmUsIGwyZV9mcm9tX21mbihtZm4sCiAgICAgICAgICAgICAg
ICAgICAgLypfUEFHRV9HTE9CQUx8Ki9fUEFHRV9QU0V8X1BBR0VfVVNFUnxfUEFHRV9QUkVTRU5U
KSk7CiAgICAgICAgIH0KICAgICAgICAgaSArPSAoIDFVTCA8PCAoTDJfUEFHRVRBQkxFX1NISUZU
IC0gMykpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
