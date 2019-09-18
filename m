Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E04B675C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 17:46:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAc7o-0006Vn-J3; Wed, 18 Sep 2019 15:44:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4j=XN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAc7m-0006VE-CM
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 15:44:10 +0000
X-Inumbo-ID: 276c7452-da2b-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 276c7452-da2b-11e9-b76c-bc764e2007e4;
 Wed, 18 Sep 2019 15:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568821450;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=eTjpxVgAYjq2OFp7dicisn4CJ1lN6UN+fbOcR/MLPpg=;
 b=brYN+/OvGpgnu3Z2+PcAsPddPlHvBszUeowhkk7RPoiByajzuSe3JqZ3
 XS500rCAxM54l3tgz8PXms9/p3InGI7pSt3EHob7zb+dtdAhRIQcyOYlF
 crot8wFOjCNfND4+P/SS6VqWdXoaybGrh66YaTZpwZQzM/yViMS/OIO3o M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z5RZjV2SGHvlkocJtRRgn8k1BUVg48kRuNcAYudCKCrhfb3fWR5FxCU7edgURzeixVDAoDSj59
 kLkW29ZVPDo/dDqR3Iv/eIBXV8bXHBZ/f0viuCSvaf+n0i7hWncIfkDB7eG4rTM+fcK8xYKYoh
 B+arQ9ahAghpOQYDaEBeQr5jqJnIIJ8ZBhtmmdIv/HBGIOFemT/5fN7NjRI8jq8/Pi6Q+FQ/PC
 2Hb9O7mGtupHBbPZ+s9Px2iCrlDEuKjWhsdY/P3FFd6TyExFjLrQo7mkQVxzoaMloms9iRGnwf
 jYA=
X-SBRS: 2.7
X-MesageID: 5737209
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="5737209"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23938.20678.204575.907050@mariner.uk.xensource.com>
Date: Wed, 18 Sep 2019 16:44:06 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190918140508.GL1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-2-anthony.perard@citrix.com>
 <23937.3773.593680.268445@mariner.uk.xensource.com>
 <20190918140508.GL1308@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 01/35] libxl: Make libxl_domain_unpause async
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAwMS8zNV0gbGlieGw6IE1ha2UgbGli
eGxfZG9tYWluX3VucGF1c2UgYXN5bmMiKToKPiBJIHRob3VnaHQgdGhhdCBIQVZFXyogd2Fzbid0
IG5lZWRlZCB3aGVuIHRoZSBBUEkgdmVyc2lvbiBpcyBidW1wZWQuIEJ1dAo+IG5vdyBJIGd1ZXNz
IHRoYXQgdGhlIEhBVkVfKiBtYWNybyBhcmUgdGhlIG9ubHkgd2F5IGZvciBhbiBhcHBsaWNhdGlv
bgo+IHRvIGJ1aWxkIGFnYWluc3Qgb2xkIHZlcnNpb24gb2YgbGlieGwgc2luY2UgdGhlIHZlcnNp
b24gbnVtYmVyIGlzbid0Cj4gZXhwb3NlZC4KClRoZSBhcHBsaWNhdGlvbiBjYW4gI2RlZmluZSB0
aGUgdmVyc2lvbiBudW1iZXIgb2YgdGhlIEFQSSBpdCB3YW50cy4KClRoZSBIQVZFIGlzIGZvciBh
biBhcHBsaWNhdGlvbiB0aGF0ICpkb2Vzbid0KiBkbyB0aGF0IGFuZCB3YW50cwppbnN0ZWFkIHRv
IGFkYXB0IGNvbnRpbnVhbGx5IHRvIG91ciBBUEkgY2hhbmdlcy4KCj4gVGhlIHF1ZXN0aW9uIGlz
LCBob3cgbWFueSBtYWNybyBzaG91bGQgdGhlcmUgYmU/IEFzIG1hbnkgbWFjcm8gYXMgdGhlcmUK
PiBhcmUgZnVuY3Rpb24gY2hhbmdlZD8gT3IganVzdCBvbmU/CgpPbmUgd2lsbCBkby4KCj4gSWYg
b25seSBvbmUsIEkgZG9uJ3Qga25vdyBob3cgdG8gY2FsbCBpdCwgbWF5YmUgb24gb2Ygb3IgcmVs
YXRlZDoKPiAgICAgTElCWExfSEFWRV9RTVBfRk5fQVNZTkMKPiAgICAgTElCWExfSEFWRV9GTl9V
U0lOR19RTVBfQVNZTkMKPiB3aXRoIHRoZSBzYW1lIGNvbW1lbnQgbGlzdGluZyBhbGwgYWZmZWN0
ZWQgZnVuY3Rpb25zLgoKRWl0aGVyIG9mIHRob3NlIGlzIGZpbmUuICBJIHdpbGwgbGVhdmUgaXQg
dG8geW91ciBqdWRnZW1lbnQuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
