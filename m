Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E607BEEC3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:50:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNl-0004HW-CA; Thu, 26 Sep 2019 09:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNj-0004Fe-8c
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:15 +0000
X-Inumbo-ID: c28b26aa-e042-11e9-b588-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id c28b26aa-e042-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491294; x=1601027294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4lutyPBW4XA50f+CKZlHwiI8jX/ew/mq524Sw3Qgbi4=;
 b=JauuXSAR5+FSiwqYlIlKu2o8Npib/XRmIFbbP/BZhmNJtDgZmgL0bCkW
 wEkRclOiyLfYfaLsnOe48Sj62y9S4kRSeFslzYMGWaX+ybZB04xRfpWA2
 JglUyuUmoUFduOVERf/yTsbHoUmnsxXSDyhCiG0x1fliDUvB4NsHRXOk0 w=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750478"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9E1AFA1DD9; Thu, 26 Sep 2019 09:48:12 +0000 (UTC)
Received: from EX13D19UWA001.ant.amazon.com (10.43.160.169) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:42 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D19UWA001.ant.amazon.com (10.43.160.169) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:42 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:40 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:49 +0100
Message-ID: <99a473287b586b084d092170f885a6bda8ebaa6b.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 26/84] x86_64/mm: introduce pl2e in
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
OSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jCmluZGV4IDliMzliMmZmY2IuLmQwMWI4ZjdjMTcgMTAwNjQ0Ci0tLSBhL3hl
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
