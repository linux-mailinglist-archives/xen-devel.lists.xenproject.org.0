Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDEBC25C1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 19:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEzOc-0003Yf-Oq; Mon, 30 Sep 2019 17:23:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QDh0=XZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iEzOa-0003Y0-Jz
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 17:23:36 +0000
X-Inumbo-ID: 057e4e31-e3a7-11e9-96dc-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 057e4e31-e3a7-11e9-96dc-12813bfff9fa;
 Mon, 30 Sep 2019 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569864211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zLHf0N5g07gf3v+LADDfsr271XMgxzViM0IfNRfvjDs=;
 b=ErJDP6vBnzKYDuUY/CpX5Whzc0Dxqv42pVgWJ76l20+sUbBwbYGKqyOo
 3TJDeNDGDCy0NFAZ6D4LF48L3tCYv4qP4EvUXrBq3ujZ4m0joEsDnKBSX
 APd6OBR480PXwonjWTrtl4uJjyDdcim83hLh59amceNMoIJtdQVvNmLo7 U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UjmQutIHUIjmQwW5w9CRnxjoLpeU63CPlvP4O++07Rup9hE8ufxnympU/oKGiBpIbh6d+/HNpD
 xC9OAic37pRmnBetXqKm5yOPYNAbCDTeSyFV2NDo4Bn6jKhLmHljU1BRe0yUy7FOXg0QVl5i/g
 yUncOB+4K33QwXrIIxfBtBmHNCMEs4ZAeNS28xIQB1VCNYjCxzSRke/z0bslsXWVqdB3VtlfMh
 y3+13SXEBPeQYLoQtcbfumIH3WizcJRhyNzDOKfR+ZVFbkGyDxyXTjrtfnGA8IFhZUwEULk34L
 gEY=
X-SBRS: 2.7
X-MesageID: 6617645
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,568,1559534400"; 
   d="scan'208";a="6617645"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 18:23:26 +0100
Message-ID: <20190930172327.784520-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930172327.784520-1-anthony.perard@citrix.com>
References: <20190930172327.784520-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] libxl_pci: Don't ignore PCI PT error at
 guest creation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4ZXM6IDExZGI1NmY5YTYyOTEKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfcGNpLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfcGNpLmMgYi90b29scy9saWJ4bC9saWJ4bF9wY2kuYwppbmRleCA0NzI1ODE3N2Jj
NzEuLjNiMzFjZmQ0MTdiZSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKKysr
IGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKQEAgLTE2OTQsNiArMTY5NCw4IEBAIHN0YXRpYyB2
b2lkIGFkZF9wY2lkZXZzX2RvbmUobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fbXVsdGlkZXYgKm11
bHRpZGV2LAogICAgIGxpYnhsX2RvbWlkIGRvbWlkID0gYXBkcy0+ZG9taWQ7CiAgICAgbGlieGxf
X2FvX2RldmljZSAqYW9kZXYgPSBhcGRzLT5vdXRlcl9hb2RldjsKIAorICAgIGlmIChyYykgZ290
byBvdXQ7CisKICAgICBpZiAoZF9jb25maWctPm51bV9wY2lkZXZzID4gMCkgewogICAgICAgICBy
YyA9IGxpYnhsX19jcmVhdGVfcGNpX2JhY2tlbmQoZ2MsIGRvbWlkLCBkX2NvbmZpZy0+cGNpZGV2
cywKICAgICAgICAgICAgIGRfY29uZmlnLT5udW1fcGNpZGV2cyk7Ci0tIApBbnRob255IFBFUkFS
RAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
