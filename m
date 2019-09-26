Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208CABEEF9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQP5-0006bj-Fc; Thu, 26 Sep 2019 09:49:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQP1-0006W3-Rh
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:35 +0000
X-Inumbo-ID: db477203-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id db477203-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491337; x=1601027337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=f3D8sT4nLjfsYF+QuArXbr8SObtyun4SFrgHXutwP0A=;
 b=fghuVl+rtwyFFW84VkmtvF5pM52okdWq3XcbA0+B58Qw04i+tvQ97iFe
 XSC63MjVHYXXjEZdGRB50TzIQCPMfEro6Goy6RzXRl8T9QNNq8ojeq9FZ
 HDj0TVMaFTVHTbXLlBbmXeJmmWjAUUDUcTB0y4PtteOofxLvGPv582NPQ A=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750615"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:56 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8A07DA2991; Thu, 26 Sep 2019 09:48:56 +0000 (UTC)
Received: from EX13D10UWA004.ant.amazon.com (10.43.160.64) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:27 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D10UWA004.ant.amazon.com (10.43.160.64) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:26 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:25 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:14 +0100
Message-ID: <144c16e0cb37d5fde3eb48b2eaad1bbd7022108f.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 51/84] x86/pv: properly map and unmap page
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
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
