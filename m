Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F00BEEF1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOy-0006OM-VL; Thu, 26 Sep 2019 09:49:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOw-0006Ln-Pl
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:30 +0000
X-Inumbo-ID: da9f1e5f-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id da9f1e5f-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491336; x=1601027336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=dsrNjN6yPWr+vJW/UTJ4O8vlGArBVD6ggCYMslFwKW8=;
 b=V7ktIUtZYSzOgjVZhGYV4bqUnP1h2SvID6uHWHgXFTfreM3Y7ijh8JU8
 au4KlgckyOlG9gTd6+g+cgab+VcXiDBTE/GqB7uRn7jLKttXDPaKTVwXK
 0FRdBfyVyX+4Z7cLdV2QRbj/Pou98U4gm3o7kniRNZjbU3i3Wn8vaeikZ A=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788331"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:56 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8D188A2684; Thu, 26 Sep 2019 09:48:54 +0000 (UTC)
Received: from EX13D20UWA001.ant.amazon.com (10.43.160.34) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:23 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D20UWA001.ant.amazon.com (10.43.160.34) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:23 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:22 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:12 +0100
Message-ID: <ca227d391e3d490f8d7cef578972726635a0cf08.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 49/84] x86_64/mm: map and unmap page tables
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MTUgKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgYi94ZW4v
YXJjaC94ODYveDg2XzY0L21tLmMKaW5kZXggNzQ4M2Y4ZjIzZC4uNmYzN2JjNGMxNSAxMDA2NDQK
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
