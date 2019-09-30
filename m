Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBFC1F18
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:37:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1e-0008JS-O7; Mon, 30 Sep 2019 10:35:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1c-0008Ha-Ri
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:28 +0000
X-Inumbo-ID: f3adf586-e36d-11e9-97fb-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id f3adf586-e36d-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839699; x=1601375699;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=JeCSzuzQJ/zRBnzL/d6gNFIcOFOq1Tdq+RtL5CVDeD8=;
 b=BDgdtcVys7WIy4oK4mblDXQZQDoXkw5Rw3UyuWlVU0izYif83Vfrt2L0
 6BenL/MP6pwbcs0XvRzZiMOFgeTLA1heqnGyyUi0jxSDy5tv4l/xgYn2S
 m6g7TntwqwAICTOLYSh0m4XcW/kp269uSuNljPYAa0fx55ARBu1Ma+e6X Q=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="788414738"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 30 Sep 2019 10:34:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 79BEDC18BF; Mon, 30 Sep 2019 10:34:57 +0000 (UTC)
Received: from EX13D23UEE001.ant.amazon.com (10.43.62.101) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:35 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D23UEE001.ant.amazon.com (10.43.62.101) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:35 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:34 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:40 +0100
Message-ID: <c23c8616de775da204a45f0660d26782ee96061d.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 48/55] x86_64/mm: map and unmap page tables
 in subarch_memory_op
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
MTUgKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4v
YXJjaC94ODYveDg2XzY0L21tLmMKaW5kZXggN2EwMmZjZWUxOC4uYTFjNjlkN2YwZSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQv
bW0uYwpAQCAtMTAxNiw4ICsxMDE2LDggQEAgdm9pZCBfX2luaXQgc3ViYXJjaF9pbml0X21lbW9y
eSh2b2lkKQogbG9uZyBzdWJhcmNoX21lbW9yeV9vcCh1bnNpZ25lZCBsb25nIGNtZCwgWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCiB7CiAgICAgc3RydWN0IHhlbl9tYWNocGh5c19t
Zm5fbGlzdCB4bW1sOwotICAgIGwzX3BnZW50cnlfdCBsM2U7Ci0gICAgbDJfcGdlbnRyeV90IGwy
ZTsKKyAgICBsM19wZ2VudHJ5X3QgbDNlLCAqbDN0OworICAgIGwyX3BnZW50cnlfdCBsMmUsICps
MnQ7CiAgICAgdW5zaWduZWQgbG9uZyB2LCBsaW1pdDsKICAgICB4ZW5fcGZuX3QgbWZuLCBsYXN0
X21mbjsKICAgICB1bnNpZ25lZCBpbnQgaTsKQEAgLTEwMzYsMTMgKzEwMzYsMTggQEAgbG9uZyBz
dWJhcmNoX21lbW9yeV9vcCh1bnNpZ25lZCBsb25nIGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh2b2lkKSBhcmcpCiAgICAgICAgICAgICAgICh2IDwgKHVuc2lnbmVkIGxvbmcpKG1hY2hpbmVf
dG9fcGh5c19tYXBwaW5nICsgbWF4X3BhZ2UpKTsKICAgICAgICAgICAgICAgaSsrLCB2ICs9IDFV
TCA8PCBMMl9QQUdFVEFCTEVfU0hJRlQgKQogICAgICAgICB7Ci0gICAgICAgICAgICBsM2UgPSBs
NGVfdG9fbDNlKGlkbGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KHYpXSlbCi0gICAgICAgICAg
ICAgICAgbDNfdGFibGVfb2Zmc2V0KHYpXTsKKyAgICAgICAgICAgIGwzdCA9IG1hcF94ZW5fcGFn
ZXRhYmxlX25ldygKKyAgICAgICAgICAgICAgICBsNGVfZ2V0X21mbihpZGxlX3BnX3RhYmxlW2w0
X3RhYmxlX29mZnNldCh2KV0pKTsKKyAgICAgICAgICAgIGwzZSA9IGwzdFtsM190YWJsZV9vZmZz
ZXQodildOworICAgICAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDN0KTsKKwogICAg
ICAgICAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAg
ICAgICAgICAgICAgICBtZm4gPSBsYXN0X21mbjsKICAgICAgICAgICAgIGVsc2UgaWYgKCAhKGwz
ZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdFX1BTRSkgKQogICAgICAgICAgICAgewotICAgICAgICAg
ICAgICAgIGwyZSA9IGwzZV90b19sMmUobDNlKVtsMl90YWJsZV9vZmZzZXQodildOworICAgICAg
ICAgICAgICAgIGwydCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsM2VfZ2V0X21mbihsM2UpKTsK
KyAgICAgICAgICAgICAgICBsMmUgPSBsMnRbbDJfdGFibGVfb2Zmc2V0KHYpXTsKKyAgICAgICAg
ICAgICAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMnQpOwogICAgICAgICAgICAgICAgIGlm
ICggbDJlX2dldF9mbGFncyhsMmUpICYgX1BBR0VfUFJFU0VOVCApCiAgICAgICAgICAgICAgICAg
ICAgIG1mbiA9IGwyZV9nZXRfcGZuKGwyZSk7CiAgICAgICAgICAgICAgICAgZWxzZQotLSAKMi4x
Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
