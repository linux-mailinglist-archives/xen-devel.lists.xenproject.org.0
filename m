Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56BB7E75
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 17:46:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAyao-0000aj-FB; Thu, 19 Sep 2019 15:43:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAyam-0000ae-Ap
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 15:43:36 +0000
X-Inumbo-ID: 3d6413ae-daf4-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d6413ae-daf4-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568907815;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/YfDxqlm6rzUXpbdemj7CstCvjrF05WK71J3ORtpcBI=;
 b=Omyharkl/d+ds1L2Aqh0kPd6IlyU5NEH74Or3Cp6BSaxd6+6XHPYlGtM
 BBmRphz3Yj1xTXmBIP8JOYTR9438RdM23IwJHsoLS14eoI/vtxUEGj8GI
 mbtPx4EakMrB4YVZ1/w6ERGRa3FpOZzGhC1xtYimIIqSTAW1pms+NQGtV c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Qe9FScqqiGwcBgWPeHX9nIHwIDBW9KQdkHxx0MJwRGJ4d1Kt3yNvlnt2v+wuTtGQ7kxIsTChDN
 zPYoeiP2jJ9DbJsrvyKDlMPm9ua9lipTZINb3A7GWK+hP5PbS8LcSDS8quZuk0SnqhUGECPuVP
 8E3oEWGaoKrpIEoPZDDvbaa/8qjK/Y9nzUhyQumAEqMMu8tKU+MMkYHs7+J+z12lfSQ6HnzbCo
 kvV8LvJMdk7bd+b+ZT0wsyaCzcZf/qegI4euCZZhd2SWtnst7uBwgk6QpUkTA8Htb1lWJq/dQa
 jwE=
X-SBRS: 2.7
X-MesageID: 5857735
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5857735"
Date: Thu, 19 Sep 2019 16:43:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190919154331.GU1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-18-anthony.perard@citrix.com>
 <23937.4819.930846.392609@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23937.4819.930846.392609@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDY6MDc6MzFQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDE3LzM1XSBsaWJ4bDogQWRkIGxp
YnhsX19ldl9xbXAgdG8gbGlieGxfX2FvX2RldmljZSIpOgo+ID4gYGFvZGV2LT5xbXAnIGlzIGlu
aXRpYWxpc2VkIGluIGxpYnhsX19wcmVwYXJlX2FvX2RldmljZSgpLCBidXQgc2luY2UKPiA+IHRo
ZXJlIGlzbid0IGEgc2luZ2xlIGV4aXQgcGF0aCBmb3IgYSBgbGlieGxfX2FvX2RldmljZScsIHVz
ZXJzIG9mIHRoaXMKPiA+IG5ldyBgcW1wJyBmaWVsZCB3aWxsIGhhdmUgdG8gZGlzcG9zZWQgb2Yg
aXQuCj4gCj4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
Pgo+IAo+IEl0IG1pZ2h0IGJlIG5pY2UgdG8gYWRkIGEgY29tbWVudCBhYm91dCB0aGUgZmllbGQo
cykgb2YKPiBsaWJ4bF9fYW9fZGV2aWNlIHdoaWNoIGNhbGxlcnMgb2YgbGlieGxfX3ByZXBhcmVf
YW9fZGV2aWNlIGFyZQo+IGV4cGVjdGVkIHRvIGNsZWFuIHVwIHRoZW1zZWx2ZXMuCgpTb21ldGhp
bmcgbGlrZSB0aGF0PwoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgg
Yi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCi0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMjU4MSw2ICsy
NTgxLDEwIEBAIHR5cGVkZWYgdm9pZCBsaWJ4bF9fZGV2aWNlX2NhbGxiYWNrKGxpYnhsX19lZ2Mq
LCBsaWJ4bF9fYW9fZGV2aWNlKik7CiAgKiBPbmNlIF9wcmVwYXJlIGhhcyBiZWVuIGNhbGxlZCBv
biBhIGxpYnhsX19hb19kZXZpY2UsIGl0IGlzIHNhZmUgdG8ganVzdAogICogZGlzY2FyZCB0aGlz
IHN0cnVjdCwgdGhlcmUncyBubyBuZWVkIHRvIGNhbGwgYW55IGRlc3Ryb3kgZnVuY3Rpb24uCiAg
KiBfcHJlcGFyZSBjYW4gYWxzbyBiZSBjYWxsZWQgbXVsdGlwbGUgdGltZXMgd2l0aCB0aGUgc2Ft
ZSBsaWJ4bF9fYW9fZGV2aWNlLgorICoKKyAqIEJ1dCBpZiBhbnkgb2YgdGhlIGZpZWxkcyBgYmFj
a2VuZF9kcycsIGB0aW1lb3V0JywgYHhzd2FpdCcsIGBxbXAnIGlzCisgKiB1c2VkIGJ5IGEgY2Fs
bGVyIG9mIF9wcmVwYXJlLCB0aGUgY2FsbGVyIHdpbGwgaGF2ZSB0byBhcnJhbmdlIHRvIGNsZWFu
CisgKiBvciBkaXNwb3NlIG9mIHRoZW0uCiAgKi8KIF9oaWRkZW4gdm9pZCBsaWJ4bF9fcHJlcGFy
ZV9hb19kZXZpY2UobGlieGxfX2FvICphbywgbGlieGxfX2FvX2RldmljZSAqYW9kZXYpOwogCgot
LSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
