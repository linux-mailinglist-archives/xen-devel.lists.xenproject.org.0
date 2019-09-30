Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71256C1F34
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2o-00026D-53; Mon, 30 Sep 2019 10:36:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2l-000214-1d
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:39 +0000
X-Inumbo-ID: 1e1bb4de-e36e-11e9-97fb-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 1e1bb4de-e36e-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839770; x=1601375770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=f3D8sT4nLjfsYF+QuArXbr8SObtyun4SFrgHXutwP0A=;
 b=FEOCfsThBDdxK7Wym0andzGz1dmg+GdRONIn3NavwUHcmdRx6Hoq6CHd
 J/kM6R1s3KXXhn/Fy+4vtxykCCOVrhHtxR7lxhiPyoPIT58dE81T0AVOt
 sJuMseItxreCJClsUjV1PQt2wE0XBWJx4ypmHsWyssfTjBB21zIY5E7/i c=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="838005692"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Sep 2019 10:35:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6C0DEA00F1; Mon, 30 Sep 2019 10:34:58 +0000 (UTC)
Received: from EX13D12UEE001.ant.amazon.com (10.43.62.147) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:37 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D12UEE001.ant.amazon.com (10.43.62.147) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:37 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:36 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:42 +0100
Message-ID: <ef4b680d23c2667b57a79fe91482af7a5eba8410.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 50/55] x86/pv: properly map and unmap page
 tables in mark_pv_pt_pages_rdonly
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
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQu
YyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKaW5k
ZXggMWJkNTNlOWMwOC4uZDdkNDI1NjhmYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L2Rv
bTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCkBAIC01MCwxNyAr
NTAsMTcgQEAgc3RhdGljIF9faW5pdCB2b2lkIG1hcmtfcHZfcHRfcGFnZXNfcmRvbmx5KHN0cnVj
dCBkb21haW4gKmQsCiAgICAgdW5zaWduZWQgbG9uZyBjb3VudDsKICAgICBzdHJ1Y3QgcGFnZV9p
bmZvICpwYWdlOwogICAgIGw0X3BnZW50cnlfdCAqcGw0ZTsKLSAgICBsM19wZ2VudHJ5X3QgKnBs
M2U7Ci0gICAgbDJfcGdlbnRyeV90ICpwbDJlOwotICAgIGwxX3BnZW50cnlfdCAqcGwxZTsKKyAg
ICBsM19wZ2VudHJ5X3QgKnBsM2UsICpsM3Q7CisgICAgbDJfcGdlbnRyeV90ICpwbDJlLCAqbDJ0
OworICAgIGwxX3BnZW50cnlfdCAqcGwxZSwgKmwxdDsKIAogICAgIHBsNGUgPSBsNHN0YXJ0ICsg
bDRfdGFibGVfb2Zmc2V0KHZwdF9zdGFydCk7Ci0gICAgcGwzZSA9IGw0ZV90b19sM2UoKnBsNGUp
OwotICAgIHBsM2UgKz0gbDNfdGFibGVfb2Zmc2V0KHZwdF9zdGFydCk7Ci0gICAgcGwyZSA9IGwz
ZV90b19sMmUoKnBsM2UpOwotICAgIHBsMmUgKz0gbDJfdGFibGVfb2Zmc2V0KHZwdF9zdGFydCk7
Ci0gICAgcGwxZSA9IGwyZV90b19sMWUoKnBsMmUpOwotICAgIHBsMWUgKz0gbDFfdGFibGVfb2Zm
c2V0KHZwdF9zdGFydCk7CisgICAgbDN0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGw0ZV9nZXRf
bWZuKCpwbDRlKSk7CisgICAgcGwzZSA9IGwzdCArIGwzX3RhYmxlX29mZnNldCh2cHRfc3RhcnQp
OworICAgIGwydCA9IG1hcF94ZW5fcGFnZXRhYmxlX25ldyhsM2VfZ2V0X21mbigqcGwzZSkpOwor
ICAgIHBsMmUgPSBsMnQgKyBsMl90YWJsZV9vZmZzZXQodnB0X3N0YXJ0KTsKKyAgICBsMXQgPSBt
YXBfeGVuX3BhZ2V0YWJsZV9uZXcobDJlX2dldF9tZm4oKnBsMmUpKTsKKyAgICBwbDFlID0gbDF0
ICsgbDFfdGFibGVfb2Zmc2V0KHZwdF9zdGFydCk7CiAgICAgZm9yICggY291bnQgPSAwOyBjb3Vu
dCA8IG5yX3B0X3BhZ2VzOyBjb3VudCsrICkKICAgICB7CiAgICAgICAgIGwxZV9yZW1vdmVfZmxh
Z3MoKnBsMWUsIF9QQUdFX1JXKTsKQEAgLTg1LDEyICs4NSwyMyBAQCBzdGF0aWMgX19pbml0IHZv
aWQgbWFya19wdl9wdF9wYWdlc19yZG9ubHkoc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICAg
IGlmICggISgodW5zaWduZWQgbG9uZykrK3BsMmUgJiAoUEFHRV9TSVpFIC0gMSkpICkKICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICBpZiAoICEoKHVuc2lnbmVkIGxvbmcpKytwbDNlICYg
KFBBR0VfU0laRSAtIDEpKSApCi0gICAgICAgICAgICAgICAgICAgIHBsM2UgPSBsNGVfdG9fbDNl
KCorK3BsNGUpOwotICAgICAgICAgICAgICAgIHBsMmUgPSBsM2VfdG9fbDJlKCpwbDNlKTsKKyAg
ICAgICAgICAgICAgICB7CisgICAgICAgICAgICAgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVf
TkVXKGwzdCk7CisgICAgICAgICAgICAgICAgICAgIGwzdCA9IG1hcF94ZW5fcGFnZXRhYmxlX25l
dyhsNGVfZ2V0X21mbigqKytwbDRlKSk7CisgICAgICAgICAgICAgICAgICAgIHBsM2UgPSBsM3Q7
CisgICAgICAgICAgICAgICAgfQorICAgICAgICAgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVf
TkVXKGwydCk7CisgICAgICAgICAgICAgICAgbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwz
ZV9nZXRfbWZuKCpwbDNlKSk7CisgICAgICAgICAgICAgICAgcGwyZSA9IGwydDsKICAgICAgICAg
ICAgIH0KLSAgICAgICAgICAgIHBsMWUgPSBsMmVfdG9fbDFlKCpwbDJlKTsKKyAgICAgICAgICAg
IFVOTUFQX1hFTl9QQUdFVEFCTEVfTkVXKGwxdCk7CisgICAgICAgICAgICBsMXQgPSBtYXBfeGVu
X3BhZ2V0YWJsZV9uZXcobDJlX2dldF9tZm4oKnBsMmUpKTsKKyAgICAgICAgICAgIHBsMWUgPSBs
MXQ7CiAgICAgICAgIH0KICAgICB9CisgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDF0KTsK
KyAgICBVTk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMnQpOworICAgIFVOTUFQX1hFTl9QQUdFVEFC
TEVfTkVXKGwzdCk7CiB9CiAKIHN0YXRpYyBfX2luaXQgdm9pZCBzZXR1cF9wdl9waHlzbWFwKHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgcGd0YmxfcGZuLAotLSAKMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
