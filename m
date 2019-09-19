Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48ECB7EF3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 18:20:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAz82-00044P-FJ; Thu, 19 Sep 2019 16:17:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAz80-000448-BS
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 16:17:56 +0000
X-Inumbo-ID: 09726474-daf9-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09726474-daf9-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568909875;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=S0BZHq8CAGZcAg/rx95G5fiviJHRdHnNJ0xKgcTRRVI=;
 b=cjXQRm/x3gRrE08PpQ79mpCOKtecFGLWkqanj5VrLFLTOaZUq/W2wAuU
 6JM8OMWQLf7kcQLdhz+MrtN1gc3t2QED+CXgkYCT5mBUfVRzNMbrdK3eP
 iAnZKwMJGbfRceW/Ap/qCjTlIzbFBa+/qrljXXWKxK5OBF4G8gJcJlxEF w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bCP8wF2fQrNGuO4URtgxu8rvQK82ZByPF3olyp+vClEakjnNRudu391Aio4E+aUHvhIVTbLi0g
 3m08mZD/zdjIV5Sfhe4/m+m75NmKPIKWwBde029PFfDrk4mLCjmCTr/uSv3Mj5S8W4mYaNL+Du
 ewQAfCn/DjBBzbM+DevKd1dCdxs7Tq7acEt8qZBrxlh3O+lI34j3b5rp1kAtzaljggzv9MDWYA
 CvrO5vZUakOYsf6O7Dg6MDsHvbPGQqx4IMCbsUm9QvWTOkn9AsjVXJvKxjDJSrHFzkcVpphuQL
 ipI=
X-SBRS: 2.7
X-MesageID: 6118699
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6118699"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.43568.270105.463164@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 17:17:52 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190919154331.GU1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-18-anthony.perard@citrix.com>
 <23937.4819.930846.392609@mariner.uk.xensource.com>
 <20190919154331.GU1308@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 17/35] libxl: Add libxl__ev_qmp to
 libxl__ao_device
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAxNy8zNV0gbGlieGw6IEFkZCBsaWJ4
bF9fZXZfcW1wIHRvIGxpYnhsX19hb19kZXZpY2UiKToKPiBPbiBUdWUsIFNlcCAxNywgMjAxOSBh
dCAwNjowNzozMVBNICswMTAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEl0IG1pZ2h0IGJlIG5p
Y2UgdG8gYWRkIGEgY29tbWVudCBhYm91dCB0aGUgZmllbGQocykgb2YKPiA+IGxpYnhsX19hb19k
ZXZpY2Ugd2hpY2ggY2FsbGVycyBvZiBsaWJ4bF9fcHJlcGFyZV9hb19kZXZpY2UgYXJlCj4gPiBl
eHBlY3RlZCB0byBjbGVhbiB1cCB0aGVtc2VsdmVzLgo+IAo+IFNvbWV0aGluZyBsaWtlIHRoYXQ/
Cj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oCj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
aAo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKPiBAQCAtMjU4MSw2ICsyNTgx
LDEwIEBAIHR5cGVkZWYgdm9pZCBsaWJ4bF9fZGV2aWNlX2NhbGxiYWNrKGxpYnhsX19lZ2MqLCBs
aWJ4bF9fYW9fZGV2aWNlKik7Cj4gICAqIE9uY2UgX3ByZXBhcmUgaGFzIGJlZW4gY2FsbGVkIG9u
IGEgbGlieGxfX2FvX2RldmljZSwgaXQgaXMgc2FmZSB0byBqdXN0Cj4gICAqIGRpc2NhcmQgdGhp
cyBzdHJ1Y3QsIHRoZXJlJ3Mgbm8gbmVlZCB0byBjYWxsIGFueSBkZXN0cm95IGZ1bmN0aW9uLgo+
ICAgKiBfcHJlcGFyZSBjYW4gYWxzbyBiZSBjYWxsZWQgbXVsdGlwbGUgdGltZXMgd2l0aCB0aGUg
c2FtZSBsaWJ4bF9fYW9fZGV2aWNlLgo+ICsgKgo+ICsgKiBCdXQgaWYgYW55IG9mIHRoZSBmaWVs
ZHMgYGJhY2tlbmRfZHMnLCBgdGltZW91dCcsIGB4c3dhaXQnLCBgcW1wJyBpcwo+ICsgKiB1c2Vk
IGJ5IGEgY2FsbGVyIG9mIF9wcmVwYXJlLCB0aGUgY2FsbGVyIHdpbGwgaGF2ZSB0byBhcnJhbmdl
IHRvIGNsZWFuCj4gKyAqIG9yIGRpc3Bvc2Ugb2YgdGhlbS4KCkxHVE0KClRoYW5rcywKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
