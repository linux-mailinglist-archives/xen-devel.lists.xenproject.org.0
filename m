Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9F7C1F03
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0Y-0006wI-BE; Mon, 30 Sep 2019 10:34:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0W-0006vD-Lq
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:20 +0000
X-Inumbo-ID: dc96e920-e36d-11e9-97fb-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id dc96e920-e36d-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839660; x=1601375660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=IWvv3JFE8UC9wDGna0qJ6XB0bPktobco6eb0qHMgbxc=;
 b=IrQVl+DTgEJdw5ChYs097OsLACS7H6qlhPjSHpC+ZX7+elNXoUPb37fp
 LGg1dvzhdtCv7g9gHVaQI+tqQ/oU1BidlG1y5sz2ewWaqNM5XcDyjah5x
 w20nVcbnvyYB41G3GJHTQ/8AMVKFiVgIlF16tXV4NC2Hj5oGDfuZdC/G+ s=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="788414639"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 30 Sep 2019 10:34:20 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id C059FA2161; Mon, 30 Sep 2019 10:34:18 +0000 (UTC)
Received: from EX13D20UEE002.ant.amazon.com (10.43.62.204) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:02 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D20UEE002.ant.amazon.com (10.43.62.204) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:59 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:33:58 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:03 +0100
Message-ID: <596e44b9d83551de8982ac9a20a47d4bbce32844.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 11/55] x86/mm: change pl1e to l1t in
 virt_to_xen_l1e
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgbmVlZCB0byBoYXZl
IGEgdmFyaWFibGUgbmFtZWQgcGwxZSB3aGVuIHdlIHJld3JpdGUKdmlydF90b194ZW5fbDFlLiBD
aGFuZ2UgcGwxZSB0byBsMXQgdG8gcmVmbGVjdCBiZXR0ZXIgaXRzIHB1cnBvc2UuClRoaXMgd2ls
bCBtYWtlIHJldmlld2luZyBsYXRlciBwYXRjaCBlYXNpZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L21tLmMgfCAxNCArKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0u
YyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGVhNjkzMWUwNTIuLjdhNTIyZDkwZmUgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00OTcy
LDIyICs0OTcyLDIyIEBAIGwxX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVkIGxv
bmcgdikKICAgICBpZiAoICEobDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QUkVTRU5UKSAp
CiAgICAgewogICAgICAgICBib29sIGxvY2tpbmcgPSBzeXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVf
Ym9vdDsKLSAgICAgICAgbDFfcGdlbnRyeV90ICpwbDFlID0gYWxsb2NfeGVuX3BhZ2V0YWJsZSgp
OworICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKIAot
ICAgICAgICBpZiAoICFwbDFlICkKKyAgICAgICAgaWYgKCAhbDF0ICkKICAgICAgICAgICAgIHJl
dHVybiBOVUxMOwogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9sb2Nr
KCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAm
IF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAgICAgICAgICAgY2xlYXJfcGFnZShwbDFl
KTsKLSAgICAgICAgICAgIGwyZV93cml0ZShwbDJlLCBsMmVfZnJvbV9wYWRkcihfX3BhKHBsMWUp
LCBfX1BBR0VfSFlQRVJWSVNPUikpOwotICAgICAgICAgICAgcGwxZSA9IE5VTEw7CisgICAgICAg
ICAgICBjbGVhcl9wYWdlKGwxdCk7CisgICAgICAgICAgICBsMmVfd3JpdGUocGwyZSwgbDJlX2Zy
b21fcGFkZHIoX19wYShsMXQpLCBfX1BBR0VfSFlQRVJWSVNPUikpOworICAgICAgICAgICAgbDF0
ID0gTlVMTDsKICAgICAgICAgfQogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAg
c3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKLSAgICAgICAgaWYgKCBwbDFlICkKLSAgICAg
ICAgICAgIGZyZWVfeGVuX3BhZ2V0YWJsZShwbDFlKTsKKyAgICAgICAgaWYgKCBsMXQgKQorICAg
ICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKGwxdCk7CiAgICAgfQogCiAgICAgQlVHX09OKGwy
ZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFNFKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
