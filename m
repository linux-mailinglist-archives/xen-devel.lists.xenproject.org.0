Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F0811CF7F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 15:15:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifPC3-0000Rp-9t; Thu, 12 Dec 2019 14:11:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uBeP=2C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ifPC1-0000R3-T5
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 14:11:49 +0000
X-Inumbo-ID: 55f2021e-1ce9-11ea-8d67-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55f2021e-1ce9-11ea-8d67-12813bfff9fa;
 Thu, 12 Dec 2019 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576159908;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ZZwo6KjlMg1ZQRbEkZjEYzJmO57h0GJyRPPitVXAYwM=;
 b=HJcUQWTQmAFXWA6vjWT2dyQSzV7dZZX0F4kUKG2QI0k6gIBULh6yQONX
 qwC2rm+3+UVT4FzhJo0sPvKtvDRvAJOPtKnjL/L3VyNn4yy6q/qOAEWQu
 Ncz0hNO9+oyl+2oI2+XweXUVpTtGfkAVzUAty4Gfg2NTRH9zSv0UqZoRq 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jWg65tW0rTjGDVIXSRySrV1wwEUi54Ipo3F3TgoFxZEhVOs8X4DLDh3Wg0HaZCQIhDeOWsDoUL
 7KAw1RoeFc5UEFy+y9WMCXWLxmIdkcH/UjOMCbAalCWCqOBzepJ7UZPapOXlBoZ2HUG+t1s67n
 UKTX9hlYxEaacQ9gn8op8vBZHFLK8ysqfu10T3xhnXkdzD8QTCMBdyh1xBk7MRvzkU/VTpsZPR
 QUa9OvSN2MC/z/Rs14TOjjqO+Ad4sbCNqwozXV8wSyDKWfx8mV160kzNWHYCovKxN/kHtlpGo/
 t2Y=
X-SBRS: 2.7
X-MesageID: 10152226
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; d="scan'208";a="10152226"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24050.19092.298544.991905@mariner.uk.xensource.com>
Date: Thu, 12 Dec 2019 14:11:32 +0000
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <20191211165659.29939-1-jgross@suse.com>
References: <20191211165659.29939-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13] build: fix tools/configure in case
 only python3 exists
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

VGhhbmtzIGZvciB0aWR5aW5nIHRoaXMgdXAuCgpKdWVyZ2VuIEdyb3NzIHdyaXRlcyAoIltQQVRD
SC1mb3ItNC4xM10gYnVpbGQ6IGZpeCB0b29scy9jb25maWd1cmUgaW4gY2FzZSBvbmx5IHB5dGhv
bjMgZXhpc3RzIik6Cj4gLUFTX0lGKFt0ZXN0IC16ICIkUFlUSE9OIl0sIFtQWVRIT049InB5dGhv
biJdKQo+IC1BU19JRihbZWNobyAiJFBZVEhPTiIgfCBncmVwIC1xICJeLyJdLCBbXSwgW1BZVEhP
Tj1gdHlwZSAtcCAiJFBZVEhPTiJgXSkKPiArQVNfSUYoW3Rlc3QgLXogIiRQWVRIT04iXSwgW0FD
X0NIRUNLX1BST0dTKFtQWVRIT05dLCBbcHl0aG9uIHB5dGhvbjMgcHl0aG9uMl0sIGVycildKQo+
ICtBU19JRihbdGVzdCAiJFBZVEhPTiIgPSAiZXJyIl0sIFtBQ19NU0dfRVJST1IoW05vIHB5dGhv
biBpbnRlcnByZXRlciBmb3VuZF0pXSkKCkkgdGhpbmsgdGhpcyB1c2Ugb2YgYGVycicgaXMgYSBi
aXQgb2RkLiAgQWNjb3JkaW5nIHRvIHRoZSBGTSB5b3UgY291bGQKc2F5IHNpbXBseToKCiAgK0FT
X0lGKFt0ZXN0IC16ICIkUFlUSE9OIl0sIFtBQ19DSEVDS19QUk9HUyhbUFlUSE9OXSwgW3B5dGhv
biBweXRob24zIHB5dGhvbjJdKV0pCiAgK0FTX0lGKFt0ZXN0IC16ICIkUFlUSE9OIl0sIFtBQ19N
U0dfRVJST1IoW05vIHB5dGhvbiBpbnRlcnByZXRlciBmb3VuZF0pXSkKCkJ1dCB0aGlzIGlzIGEg
c3R5bGUgbml0IEkgdGhpbmsgc2luY2Ugbm8tb25lIHdpbGwgY2FsbCB0aGVpciBweXRob24KaW50
ZXJwcmV0ZXIgYGVycicgOi0pLiAgQW5kIHlvdSB3aWxsIGhhdmUgdGVzdGVkIHlvdXIgdmVyc2lv
biBhbmQgYXQKdGhpcyBzdGFnZSBvZiA0LjEzIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIGZl
d2VyIGl0ZXJhdGlvbnMgb2YgdGhpcwpwYXRjaCwgc28gSSB0aGluayBpdCBzaG91bGQgZ28gaW4g
YXMgaXQgaXMuCgo+ICtBU19JRihbZWNobyAiJFBZVEhPTiIgfCBncmVwIC1xICJeLyJdLCBbXSwg
W0FDX1BBVEhfUFJPRyhbUFlUSE9OXSwgWyRQWVRIT05dKV0pCgpUaGFua3MuCgpSZXZpZXdlZC1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpJYW4uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
