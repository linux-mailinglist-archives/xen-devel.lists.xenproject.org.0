Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AEEB7A0C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 15:04:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAw4O-0003EZ-RI; Thu, 19 Sep 2019 13:02:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAw4N-0003EU-NI
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 13:01:59 +0000
X-Inumbo-ID: a9c2456e-dadd-11e9-965c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9c2456e-dadd-11e9-965c-12813bfff9fa;
 Thu, 19 Sep 2019 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568898119;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=4mKD7rV9hl6Br8fGAVJiqdLXwctnTNogFR0u6ZUhmos=;
 b=RfcRLcKMZbxqKj8FY4BI4Cg48tHm6gQp5OGenZaKCgQUegetTwzsmkk9
 CRVk3WueIG3/HNYgz6HD920jSqo6jUPy+KgRLX3RM6SXAs9vrdcy98sUo
 V4qykRhBq0pYGJIKvdYLbowyXWYIYNuIJIKvXQ0iGtj2cJ+Rem/1Y6M8S c=;
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
IronPort-SDR: YljyiM8tzqbQUDzy5zqCRNvhZDfqXcsGPSWawKUeie+1rKyixL7gj+SInwHk0nUiCDhspaJyFC
 wOgokM7JR1aqVJhBHubqILwX5+vbjOoB3ORn4eS9krb9bbrzSXzagsAzxExxMFAuhZZTv7/xse
 zUSMMZRTd6zLbKuoANCC+/okVprSBR1Vlogdmb90NAaQ293R1owwP6NqaUT/FimAkqNdBqjACv
 H1l3ulxUgCd7h/hmNUkZ+MhZ58AP8TJ1s+uv1lSl9b1h11EYP08BGsuki8VhAcm9yegCp3OA+b
 83A=
X-SBRS: 2.7
X-MesageID: 5787343
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5787343"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.31810.583549.881923@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 14:01:54 +0100
To: Wei Liu <wl@xen.org>
In-Reply-To: <CAK9nU=pDH4K3fxDN8-qb_wMhYy9H6yb9SvzDdkDDn2+kWHFzMw@mail.gmail.com>
References: <20190919111722.iajioonuzqfharaf@debian>
 <CAK9nU=oUVsbJN28BmJ=aHR5UEBNv4CAxLO8xTUqY+__czX40CA@mail.gmail.com>
 <23939.26199.62169.927294@mariner.uk.xensource.com>
 <CAK9nU=pDH4K3fxDN8-qb_wMhYy9H6yb9SvzDdkDDn2+kWHFzMw@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13] configure: fix print syntax for
 python 3
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjEzXSBjb25maWd1cmU6IGZpeCBwcmlu
dCBzeW50YXggZm9yIHB5dGhvbiAzIik6Cj4gT24gVGh1LCAxOSBTZXAgMjAxOSBhdCAxMjoyOCwg
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gTXkgcHJldmlv
dXMgcmVwbHkgYm91bmNlZCBkdWUgdG8gaGVhZGVyIG1hbmdsaW5nIGluIHlvdXIgZmlyc3QgbWFp
bC4KPiA+IExldCBtZSB0cnkgYWdhaW46Cj4gPgo+ID4gVGhpcyBpcyBnb29kIGluIHByaW5jaXBs
ZSBidXQ6Cj4gPgo+ID4gQ2FuIHlvdSBwcm92aWRlIGFzIGEgZ2l0IGJyYW5jaCA/ICBUaGVuIEkg
d2lsbCBnZXQgdGhlIHVubWFuZ2xlZAo+ID4gdmVyc2lvbiBhbmQgYmUgYWJsZSB0byB0cnkgaXQg
b3V0Lgo+IAo+IFNlZSBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxlL2xp
dXcveGVuLmdpdDthPWNvbW1pdGRpZmY7aD04NjRjN2ZiNzE1MDM5OTA2NzYyYzk2MzhmMDRkZGZk
OTdjMWFlNTRiCgpUaGFua3MsCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+CgphbmQgcHVzaGVkLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
