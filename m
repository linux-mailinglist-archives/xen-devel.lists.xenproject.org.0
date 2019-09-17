Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6174DB5358
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:49:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGcB-00075J-WF; Tue, 17 Sep 2019 16:46:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGcA-000750-6T
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:46:06 +0000
X-Inumbo-ID: a35cdc6c-d96a-11e9-961b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a35cdc6c-d96a-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738765;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Sn8S5QRvd753xZW1GcFaMqAPboD/WFALWF9sdKZ45gw=;
 b=PxbM56cLZ4KiSWTy+04BW8mW1oOCh6y+aFwO6Kam81NT4FLDjEteAjwS
 JalvsiMNoaFx/R5wjlxZ11KKocuiXbewbutswkHjj58bH508fxZY6XsgK
 ambIKzrLZi7yxS3iOEMvJ5ThQZ4XpiB6STKN5Ek5YiPJM9YDLlkNCFgRD 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CDLNEef2DQQ/u4dVqbrvMgUoJ27dn/g87v3lI34RT90854m0N3oECMz1jBsaiQcyobXFad3ySq
 ORJbB0yImBiBCWh1VM4tFXXwwbuBCyfyDOsc11bam2X51mIhhl4yIxtMHwpOFaoWrvGqkTo6gu
 yoop0aMiGnkPOUbEYe9/FwS6hQ6+HlxN8iCJTFKDVklFEEW2X3TKfGOXxBu/ldVVO+I2oMqG8e
 DYF0G9uUigD4qq71lSeUIMz/gUIXhxB0Vxse7t0mZ5WGHonqxN+DBQVmACqwDszBELCyRO0sK0
 5CA=
X-SBRS: 2.7
X-MesageID: 5741333
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5741333"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3529.318315.92416@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:46:01 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-15-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-15-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 14/15] libxl_usb: usbctrl,
 make use of generic device handling functions
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDE0LzE1XSBsaWJ4bF91c2I6IHVzYmN0cmws
IG1ha2UgdXNlIG9mIGdlbmVyaWMgZGV2aWNlIGhhbmRsaW5nIGZ1bmN0aW9ucyIpOgo+IFR3byBm
dW5jdGlvbnMgaW4gZ2VuZXJhdGUgYGxpYnhsX2RldmljZV91c2JjdHJsJyBjYW4gYmUgcmVwbGFj
ZWQgYnkKPiBnZW5lcmljIG1hY3JvOgo+IC0gbGlieGxfZGV2aWNlX3VzYmN0cmxfbGlzdCAtPiBM
SUJYTF9ERUZJTkVfREVWSUNFX0xJU1QKPiAtIGxpYnhsX2RldmlkX3RvX2RldmljZV91c2JjdHJs
IC0+IExJQlhMX0RFRklORV9ERVZJRF9UT19ERVZJQ0UKPiAKPiBUaGlzIHBhdGNoIG9ubHkgbmVl
ZHMgdG8gZGVmaW5lIGBsaWJ4bF9fdXNiY3RybF9kZXZ0eXBlLmZyb21feGVuc3RvcmUnCj4gdG8g
bWFrZXMgdXNlIG9mIHRoZW0uCj4gCj4gU21hbGwgY2hhbmdlLCBsaWJ4bF9kZXZpZF90b19kZXZp
Y2VfdXNiY3RybCBkb2Vzbid0IGxpc3QgYWxsIHVzYmN0cmwKPiBhbnltb3JlIGJlZm9yZSBmaW5k
aW5nIHRoZSByaWdodCBvbmUuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
