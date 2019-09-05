Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2255CA9FCE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 12:37:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5p5l-0003kp-Pe; Thu, 05 Sep 2019 10:34:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I3J7=XA=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1i5p5k-0003kX-Uo
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 10:34:16 +0000
X-Inumbo-ID: b581acca-cfc8-11e9-abc5-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b581acca-cfc8-11e9-abc5-12813bfff9fa;
 Thu, 05 Sep 2019 10:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567679655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Jb+AjAFSkaCAufr0/k98juFxi4jr/hS52zK1lwnX6h4=;
 b=QhTROCdJzAf7bIGbJy3QzYl90EIfFRxSKLE5mNpsEmWad9iQxDIIhReI
 NHJhC2ty2fkcKnw0JAd7efNoHTmP5eQC7NIgzF6VYr5rSjxocliz7u1Z8
 +jCkLI5+4gOrc12Ouwpae963PzGj1XZ5aLG+dm1mSpB7VvUtI2YXlYyRe s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: x/mpVa6uffjB3ld2Bvsy2WeEwIOXHCXFDH1bh+bNLsH0om5KezU4K3gnKGDMvZxqX9j+8G/nhA
 i78KRznrzcQCqhmfMmmhBcNfGI4yrnVCQsqwT+byn7WpXTHIkEBcneJUZRgYotsna+Y2emC4ls
 bsRiWSBAH7ladmQaFXOe/MNzr/RRyXwdkVMjD2794fzfx/bdfCacfi7uLlvRHAugeLzuSNLKPl
 UV2nQm0hymkJS5HyjLzbwCU4uiiPTw2k+MHNLcF6C4jwN6EceToqlIM3+mpbrDM574+C1z2FX/
 NAs=
X-SBRS: 2.7
X-MesageID: 5397573
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5397573"
From: George Dunlap <George.Dunlap@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH] x86/libxl: choose a sane default for HAP
Thread-Index: AQHVY80a0L56xLl600iAAkesctUF8qcctkSAgAACS4CAAAk4gA==
Date: Thu, 5 Sep 2019 10:34:11 +0000
Message-ID: <C7E10C34-ABBE-4F86-8D5E-E112FDB52072@citrix.com>
References: <20190905093416.2955-1-roger.pau@citrix.com>
 <a7464a0e-c730-d506-d8f6-76804953e2a1@suse.com>
 <20190905100111.tjayxo44f2enaz7t@Air-de-Roger>
In-Reply-To: <20190905100111.tjayxo44f2enaz7t@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <A295A0DE4025D541A3290ED7560B70CF@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gU2VwIDUsIDIwMTksIGF0IDExOjAxIEFNLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgU2VwIDA1LCAyMDE5IGF0IDEx
OjUyOjU5QU0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDUuMDkuMjAxOSAxMToz
NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+IEN1cnJlbnQgbGlieGwgY29kZSB3aWxsIGFs
d2F5cyBlbmFibGUgSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVApLA0KPj4+IGV4cGVjdGlu
ZyB0aGF0IHRoZSBoeXBlcnZpc29yIHdpbGwgZmFsbGJhY2sgdG8gc2hhZG93IGlmIEhBUCBpcyBu
b3QNCj4+PiBhdmFpbGFibGUuIFdpdGggdGhlIGNoYW5nZXMgdG8gdGhlIGRvbWFpbiBidWlsZGVy
IHRoYXQncyBub3QgdGhlIGNhc2UNCj4+PiBhbnkgbG9uZ2VyLCBhbmQgdGhlIGh5cGVydmlzb3Ig
d2lsbCByYWlzZSBhbiBlcnJvciBpZiBIQVAgaXMgbm90DQo+Pj4gYXZhaWxhYmxlIGluc3RlYWQg
b2Ygc2lsZW50bHkgZmFsbGluZyBiYWNrIHRvIHNoYWRvdy4NCj4+IA0KPj4gV291bGQgaXQgcmVh
bGx5IGJlIG11Y2ggbW9yZSBpbnZvbHZlZCB0aGFuIHRoZSBjaGFuZ2UgaGVyZSB0byByZXN0b3Jl
DQo+PiBzaWxlbnQgZGVmYXVsdGluZyB0byBzaGFkb3c/DQo+IA0KPiBCdXQgdGhhdCB3b3VsZCBt
ZWFuIHRoYXQgYSB1c2VyIGhhdmluZyBzZWxlY3RlZCBoYXA9MSBvbiB0aGUgY29uZmlnDQo+IGZp
bGUgd291bGQgZ2V0IHNpbGVudGx5IGRlZmF1bHRlZCB0byBzaGFkb3csIHdoaWNoIGlzIHdyb25n
IElNTy4NCg0KQXQgdGhlIGxpYnhsIGxheWVyLCBhcmVu4oCZdCB0aGUgb3B0aW9ucyB0cmlzdGF0
ZT8gIEkuZS4sIHRoaXMgd291bGQgYmUg4oCcaGFw4oCdLCDigJxzaGFkb3figJ0sIG9yIOKAnG5v
dCBzcGVjaWZpZWTigJ0/DQoNClRoZSB1c2VyIG5lZWRzIHRvIGJlIGFibGUgdG8gc3BlY2lmeSDi
gJxhbHdheXMgdXNlIHNoYWRvd+KAnSwg4oCcYWx3YXlzIHVzZSBIQVDigJ0sIG9yIOKAnHVzZSBI
QVAgaWYgYXZhaWxhYmxlLCBvdGhlcndpc2UgdXNlIHNoYWRvd+KAnS4gIEF0IHRoZSBtb21lbnQs
IGxlYXZpbmcgaXQgZW1wdHkgc2hvdWxkIGJlIOKAnHVzZSBIQVAgaWYgYXZhaWxhYmxlLCBvdGhl
cndpc2UgdXNlIHNoYWRvd+KAnTsgc28g4oCcaGFwID0gMeKAnSBzaG91bGQgZmFpbCBpZiBIQVAg
aXMgbm90IGF2YWlsYWJsZS4NCg0KIC1HZW9yZ2UNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
