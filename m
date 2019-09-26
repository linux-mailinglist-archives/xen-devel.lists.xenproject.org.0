Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA2BEEED
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPh-00083k-H7; Thu, 26 Sep 2019 09:50:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPd-0007wx-KN
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:13 +0000
X-Inumbo-ID: 052d25d0-e043-11e9-bf31-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 052d25d0-e043-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491407; x=1601027407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=uPaFBKCI+WAJGgUixMIOEyzRi5v+2ZaD+PavNIUChg4=;
 b=rNgJ0hCYOHxdQE9TXa4Ii+8F7GvXu4UzD5mUoE/gtSx/WdfcCYec0aZt
 lbRDWb4LHYXsEAw/XWFlExve4+LKx3JiPKlQFk2PSdRUIGjuByEpO+wPT
 4fqnKwBU8sUujxi8GNvhCpl3Bk23ayShNkpbBbMVTkWUUi13JH2g96PAh 8=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836988992"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:49:07 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id D8A4FA1C46; Thu, 26 Sep 2019 09:48:53 +0000 (UTC)
Received: from EX13D04UWA001.ant.amazon.com (10.43.160.47) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:21 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D04UWA001.ant.amazon.com (10.43.160.47) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:21 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:20 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:11 +0100
Message-ID: <931bc9eed0fa7f6fa9ca81f4c7c8c436d18b6819.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 48/84] x86_64/mm: map and unmap page tables
 in subarch_init_memory
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
MzEgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4
Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IGJiZGYxZWU0N2MuLjc0
ODNmOGYyM2QgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4v
YXJjaC94ODYveDg2XzY0L21tLmMKQEAgLTkzMCw4ICs5MzAsOCBAQCBzdGF0aWMgaW50IGV4dGVu
ZF9mcmFtZV90YWJsZShzdHJ1Y3QgbWVtX2hvdGFkZF9pbmZvICppbmZvKQogdm9pZCBfX2luaXQg
c3ViYXJjaF9pbml0X21lbW9yeSh2b2lkKQogewogICAgIHVuc2lnbmVkIGxvbmcgaSwgbiwgdiwg
bTJwX3N0YXJ0X21mbjsKLSAgICBsM19wZ2VudHJ5X3QgbDNlOwotICAgIGwyX3BnZW50cnlfdCBs
MmU7CisgICAgbDNfcGdlbnRyeV90IGwzZSwgKmwzdDsKKyAgICBsMl9wZ2VudHJ5X3QgbDJlLCAq
bDJ0OwogCiAgICAgQlVJTERfQlVHX09OKFJEV1JfTVBUX1ZJUlRfU1RBUlQgJiAoKDFVTCA8PCBM
M19QQUdFVEFCTEVfU0hJRlQpIC0gMSkpOwogICAgIEJVSUxEX0JVR19PTihSRFdSX01QVF9WSVJU
X0VORCAgICYgKCgxVUwgPDwgTDNfUEFHRVRBQkxFX1NISUZUKSAtIDEpKTsKQEAgLTk0MSwxNCAr
OTQxLDIyIEBAIHZvaWQgX19pbml0IHN1YmFyY2hfaW5pdF9tZW1vcnkodm9pZCkKICAgICAgICAg
ICB2ICs9IG4gPDwgUEFHRV9TSElGVCApCiAgICAgewogICAgICAgICBuID0gTDJfUEFHRVRBQkxF
X0VOVFJJRVMgKiBMMV9QQUdFVEFCTEVfRU5UUklFUzsKLSAgICAgICAgbDNlID0gbDRlX3RvX2wz
ZShpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldCh2KV0pWwotICAgICAgICAgICAgbDNfdGFi
bGVfb2Zmc2V0KHYpXTsKKworICAgICAgICBsM3QgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcoCisg
ICAgICAgICAgICBsNGVfZ2V0X21mbihpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldCh2KV0p
KTsKKyAgICAgICAgbDNlID0gbDN0W2wzX3RhYmxlX29mZnNldCh2KV07CisgICAgICAgIFVOTUFQ
X1hFTl9QQUdFVEFCTEVfTkVXKGwzdCk7CisKICAgICAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3Mo
bDNlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICBp
ZiAoICEobDNlX2dldF9mbGFncyhsM2UpICYgX1BBR0VfUFNFKSApCiAgICAgICAgIHsKICAgICAg
ICAgICAgIG4gPSBMMV9QQUdFVEFCTEVfRU5UUklFUzsKLSAgICAgICAgICAgIGwyZSA9IGwzZV90
b19sMmUobDNlKVtsMl90YWJsZV9vZmZzZXQodildOworCisgICAgICAgICAgICBsMnQgPSBtYXBf
eGVuX3BhZ2V0YWJsZV9uZXcobDNlX2dldF9tZm4obDNlKSk7CisgICAgICAgICAgICBsMmUgPSBs
MnRbbDJfdGFibGVfb2Zmc2V0KHYpXTsKKyAgICAgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVf
TkVXKGwydCk7CisKICAgICAgICAgICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKGwyZSkgJiBfUEFH
RV9QUkVTRU5UKSApCiAgICAgICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgICAgICBtMnBf
c3RhcnRfbWZuID0gbDJlX2dldF9wZm4obDJlKTsKQEAgLTk2NywxMSArOTc1LDE4IEBAIHZvaWQg
X19pbml0IHN1YmFyY2hfaW5pdF9tZW1vcnkodm9pZCkKICAgICAgICAgICB2ICE9IFJEV1JfQ09N
UEFUX01QVF9WSVJUX0VORDsKICAgICAgICAgICB2ICs9IDEgPDwgTDJfUEFHRVRBQkxFX1NISUZU
ICkKICAgICB7Ci0gICAgICAgIGwzZSA9IGw0ZV90b19sM2UoaWRsZV9wZ190YWJsZVtsNF90YWJs
ZV9vZmZzZXQodildKVsKLSAgICAgICAgICAgIGwzX3RhYmxlX29mZnNldCh2KV07CisgICAgICAg
IGwzdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldygKKyAgICAgICAgICAgIGw0ZV9nZXRfbWZuKGlk
bGVfcGdfdGFibGVbbDRfdGFibGVfb2Zmc2V0KHYpXSkpOworICAgICAgICBsM2UgPSBsM3RbbDNf
dGFibGVfb2Zmc2V0KHYpXTsKKyAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDN0KTsK
KwogICAgICAgICBpZiAoICEobDNlX2dldF9mbGFncyhsM2UpICYgX1BBR0VfUFJFU0VOVCkgKQog
ICAgICAgICAgICAgY29udGludWU7Ci0gICAgICAgIGwyZSA9IGwzZV90b19sMmUobDNlKVtsMl90
YWJsZV9vZmZzZXQodildOworCisgICAgICAgIGwydCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhs
M2VfZ2V0X21mbihsM2UpKTsKKyAgICAgICAgbDJlID0gbDJ0W2wyX3RhYmxlX29mZnNldCh2KV07
CisgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwydCk7CisKICAgICAgICAgaWYgKCAh
KGwyZV9nZXRfZmxhZ3MobDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgICAgIGNvbnRp
bnVlOwogICAgICAgICBtMnBfc3RhcnRfbWZuID0gbDJlX2dldF9wZm4obDJlKTsKLS0gCjIuMTcu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
