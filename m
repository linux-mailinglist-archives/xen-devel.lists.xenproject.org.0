Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C1143A26
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 10:59:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itqGV-0002xZ-I2; Tue, 21 Jan 2020 09:56:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pnp3=3K=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1itqGU-0002xU-1w
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 09:56:06 +0000
X-Inumbo-ID: 3845b0c0-3c34-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3845b0c0-3c34-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 09:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579600557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eC3rdLCJ1dNUyghL4Firg/oTUL40U9JNBNfQvejKPNU=;
 b=I8t5a9s66YUTv2RSMepCOJLrLTZmJOwsKy2myfdXM+HGa/WK32PbhmW+
 +G8Xo8siYLnW0oADkUtr8l/7mgPfkTS+W1maI82ifz6q7BsFy7SB5rftb
 0kqEEkmB9rRvsVj24IRzfjKV4z+hvrumugGvafAGOSjkIMba6OKF5hmEC M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: F/YJ82/IRNbqLkwri8H5DaS2a4n8KVAThJbUhtOJY2kwCg4BiUnxveke1B8+gdD5qHmqVPgOgj
 zlQK6ht2iiqbJyFPrQrGOGdqga1ntiHLO/kSDAx9c4we+SCJahqw64E3+1nxBDbC2PQnZyTDGE
 mtumIcYn357ZCfegb5CDjYeuwBs9yPH/LLuPy5KsSw68AooOVB8IoAMsuhkV7B2jVnd/xyd79X
 QlkOat52a2TrZofENcYre+eOZNL3FXsuMVpR0PuisKePlh7nqUY+cZ3YIvXs9lmOz/s21KX1FJ
 J5A=
X-SBRS: 2.7
X-MesageID: 11789581
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,345,1574139600"; d="scan'208";a="11789581"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Thread-Topic: [Xen-devel] [PATCH v3 5/8] golang/xenlight: Default loglevel to
 DEBUG until we get everything working
Thread-Index: AQHVzU7ZRIoOloQjE0axTALd7TBR5qf0KuYAgACrqQA=
Date: Tue, 21 Jan 2020 09:55:54 +0000
Message-ID: <C58CCF43-A9B8-4B2A-A90C-59B74603D8EA@citrix.com>
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
 <20200117155734.1067550-5-george.dunlap@citrix.com>
 <CAEBZRSeChqy9QTDccEu_caRG2CkryPKHBsXbQ+tmQ3RgP2LNVw@mail.gmail.com>
In-Reply-To: <CAEBZRSeChqy9QTDccEu_caRG2CkryPKHBsXbQ+tmQ3RgP2LNVw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.40.2.2.4)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <FBFC6DF1776C7A49BD6BFC20536EB58C@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 5/8] golang/xenlight: Default loglevel to
 DEBUG until we get everything working
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSmFuIDIwLCAyMDIwLCBhdCAxMTo0MSBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJv
b2tuQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPj4gVGhlIG90aGVyIG9wdGlvbiB3b3VsZCBiZSB0
byBleHBvc2UgdGhlIFhUTCBsb2dnaW5nIGxldmVscyBhbmQgbGV0IHRoZQ0KPj4gY2FsbGVyIHNl
dCB0aGVtIHNvbWVob3cuDQo+IEkgdGhpbmsgdGhpcyBpcyBmaW5lIGZvciBub3cuDQo+IA0KPiBG
b3IgdGhlIGZ1dHVyZSwgSSBsaWtlIHVzaW5nIHRoZSAiZnVuY3Rpb25hbCBvcHRpb24iIHBhdHRl
cm4gZm9yIHRoaXMNCj4gc29ydCBvZiB0aGluZy4gVGhhdCB3YXksIGlmIGEgdXNlciB3YW50ZWQg
dG8gc2V0IGEgbm9uLWRlZmF1bHQgbG9nDQo+IGxldmVsLCB0aGV5IGNvdWxkIGRvOg0KPiANCj4g
Y3R4LCBlcnIgOj0geGVubGlnaHQuTmV3Q29udGV4dCh4ZW5saWdodC5XaXRoTG9nTGV2ZWwobHZs
KSkNCj4gDQo+IGJ1dCBpZiB0aGV5IGRvIG5vdCBuZWVkIHRvIHNwZWNpZnkgYW55IG9wdGlvbnMs
IGl0J3Mgc3RpbGwganVzdDoNCj4gDQo+IGN0eCwgZXJyIDo9IHhlbmxpZ2h0Lk5ld0NvbnRleHQo
KQ0KDQpZb3Uga25vdywgSSBzb21laG93IHJlbWVtYmVyZWQgdGhlIOKAnHVzZSBhIGZ1bmN0aW9u
IHRvIHNldCBvcHRpb25z4oCdIHBhdHRlcm4gKGFuZCBoYXZlIGEgIG1vY2stdXAgZm9yIHRoYXQg
aW4gdGhlIOKAnE5ld1R5cGUoKeKAnSBwYXRjaCBsYXRlciksIGJ1dCBkaWRu4oCZdCBub3RpY2Ug
dGhhdCBzdWNoIGZ1bmN0aW9uIHdlcmUgdmFyaWFkaWMuICBUaGF04oCZcyBhIGxvdCBuaWNlci4N
Cg0KQnV0IHJlYWxseSwgd2UgbmVlZCBhIHdheSB0byBhY3R1YWxseSBjcmVhdGUgYSBsb2dnZXIg
cHJvcGVybHkuICBBcHBhcmVudGx5IG9uZSB0aGluZyBsaWJ2aXJ0IGRvZXMgaXMgdG8gY3JlYXRl
IGEgbG9nZ2VyIHRvIGEgZmlsZSBmb3IgZWFjaCBndWVzdC4gIFRoYXTigJlzIHNvbWV0aGluZyBv
dXIgcGFja2FnZSB1c2VycyAgbWlnaHQgd2FudCB0byBkbyBhdCBzb21lIHBvaW50Lg0KDQogLUdl
b3JnZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
