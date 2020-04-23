Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D081B5AC2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 13:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRaM8-00014Z-7w; Thu, 23 Apr 2020 11:49:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmme=6H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRaM6-00014U-Kv
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 11:49:22 +0000
X-Inumbo-ID: 78a3ee4e-8558-11ea-9e09-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78a3ee4e-8558-11ea-9e09-bc764e2007e4;
 Thu, 23 Apr 2020 11:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587642562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6PXnz8JMGFRArsksmkMy/uzvvMXtfiA47fnUrbGBi2g=;
 b=dLw2BFI67IbuIAZnkpZtZNL5OkZZaJodssy/tV7hTFFTbr8T+1xAsQMm
 3TpN0xosGBPxGK7eG7RiuZQnKRCyaKgl1Km97Gf++hUjaEwkEsnfailsA
 cWqDgC+HLVumasNsFcuWXE41/LX7ohQfbr3LmRTyQOluP+lTsUrAFCrgo 4=;
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
IronPort-SDR: V754dtk/vuSB5qabf0l6nUbMmcL+D5/ZKAOs2PpKxmnEZrLCajwVuv6XZTO1RcApLkkVZPZ3lS
 cBR5JFB8dBtSUjpzFqbfg4IEXEz88lFeWNry6mm9tpAELbRd8k6u3zTJd3WSe6n0zEIEijIvTo
 QlPD1/qNFLlOILIZSvD7B9rRRqIapZref5ZHsU2ye8++XHePxqjNWX6Wk8ZKEWfdsBDp+TAkJn
 M9e7mPIGlza0BKM4cCXn7m8h0i+ivk0rCQBXl/ykEly4uJUbQOMG9VAwMTGiwCfQNZJ77UATX+
 OrU=
X-SBRS: 2.7
X-MesageID: 16804577
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16804577"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: Golang Xen packages and the golang packaging  system
Thread-Topic: Golang Xen packages and the golang packaging  system
Thread-Index: AQHWGL+431OGV0A6ZUWxyQX/eS/9b6iGcJeAgAAA0oCAAAYAAA==
Date: Thu, 23 Apr 2020 11:49:18 +0000
Message-ID: <4085F05B-ABEC-446A-8BB1-06DEE57D71A5@citrix.com>
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
 <24225.31493.220592.722565@mariner.uk.xensource.com>
 <24225.31669.536258.56822@mariner.uk.xensource.com>
In-Reply-To: <24225.31669.536258.56822@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6C4BEF0DFFC0442B309DEDA5EA2651F@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nick Rosbrook <rosbrookn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDIzLCAyMDIwLCBhdCAxMjoyNyBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IEdv
bGFuZyBYZW4gcGFja2FnZXMgYW5kIHRoZSBnb2xhbmcgcGFja2FnaW5nICBzeXN0ZW0iKToNCj4+
IFRoaXMgaXMgcXVpdGUgdW5wbGVhc2FudC4gIEluIHBhcnRpY3VsYXIsIGl0IG1ha2VzIGEgZ2l0
IHRyZWUgb3V0IG9mDQo+PiBvdXRwdXQgZmlsZXMuICBXaGF0IHdpbGwgd2UgZG8gd2hlbiBzb21l
b25lIHNlbmRzIHVzIHBhdGNoZXMgdG8gdGhlDQo+PiBiaW5kaW5ncyA/DQo+IA0KPiBBbHNvLCBh
bnlvbmUgd2hvIHJlZGlzdHJpYnV0ZXMgeW91ciBwcm9wb3NlZCBnb2xhbmcgcGFja2FnZSBpcw0K
PiB2aW9sYXRpbmcgb3VyIGxpY2VuY2UgdW5sZXNzIHRoZXkgc2hpcCBhIGNvcHkgb2YgeGVuLmdp
dFsxXSB0b28sIHNpbmNlDQo+IHRoZSBnb2xhbmcgcGFja2FnZSBpcyBub3Qgc291cmNlIGNvZGUu
DQo+IA0KPiBbMV0gVGVjaG5pY2FsbHksIGEgY29weSBvZiB0aGUgcmVsZXZhbnQgcGFydHMgd2ls
bCBkby4NCg0KVGhlIOKAnHJlbGV2YW50IHBhcnRz4oCdIHdvdWxkIHByaW1hcmlseSBiZSBnZW5n
b3R5cGVzLnB5LCByaWdodD8gIE9oLCBhbmQgSSBndWVzcyBsaWJ4bF90ZXN0LmlkbCBhbmQgZnJp
ZW5kcy4gIGxpYnhsX3Rlc3QuaWRsIGlzbuKAmXQgaW5jbHVkZWQgaW4gdGhlIGRpc3RyaWJ1dGlv
biBlaXRoZXIuDQoNCknigJltIG5vdCBhbiBleHBlcnQgaW4gdGhlIGdvbGFuZyBidWlsZCBzeXN0
ZW0sIGJ1dCB0aGV5IGdlbmVyYWxseSBzZWVtIHRvIGJlIHRyeWluZyB0byBrZWVwIHRoZSBmdW5j
dGlvbmFsaXR5IHNpbXBsZSAod2hpY2ggb2YgY291cnNlLCBtZWFucyBpZiB5b3Ugd2FudCB0byBk
byBhbnl0aGluZyBub24tYmFzaWMsIGl04oCZcyBpbmNyZWRpYmx5IGNvbXBsaWNhdGVkIG9yIGNv
bXBsZXRlbHkgaW1wb3NzaWJsZSkuDQoNClRoZXJl4oCZcyBhIGNvbW1hbmQsIGBnbyBnZW5lcmF0
ZWAsIHdoaWNoIHdlIGNvdWxkIHVzZSB0byBydW4gZ2VuZ290eXBlcy5weSB0byBnZW5lcmF0ZSB0
aGUgYXBwcm9wcmlhdGUgZmlsZXMuICBCdXQgSeKAmW0gbm90IHN1cmUgaG93IHRvIHVzZSB0aGF0
IGluIGEgcHJhY3RpY2FsIHdheSBmb3IgdGhpcyBzb3J0IG9mIHBhY2thZ2U6IGl0IG1pZ2h0IGVu
ZCB1cCB0aGF0IHBlb3BsZSB3YW50aW5nIHRvIHVzZSB0aGUgcGFja2FnZSB3b3VsZCBuZWVkIHRv
IG1hbnVhbGx5IGNsb25lIGl0LCB0aGVuIG1hbnVhbGx5IHJ1biBgZ28gZ2VuZXJhdGVgIGJlZm9y
ZSBtYW51YWxseSBidWlsZGluZyB0aGUgcGFja2FnZS4NCg0KQ2hlY2tpbmcgaW4gdGhlIGdlbmVy
YXRlZCBmaWxlcyBtZWFucyB0aGF0IHNvbWVvbmUgY2FuIHNpbXBseSBhZGQgYGdvbGFuZy54ZW5w
cm9qZWN0Lm9yZy94ZW5saWdodGAgYXMgYSBkZXBlbmRlbmN5IChwZXJoYXBzIHdpdGggYSBzcGVj
aWZpYyB2ZXJzaW9uIHRhZywgbGlrZSB2NC4xNCksIGFuZCBldmVyeXRoaW5nIEp1c3QgV29ya3Mu
DQoNCk5pY2sgbWF5IGhhdmUgc29tZSBpZGVhcyBvbiBob3cgdG8gdXNlIHRoZSBnb2xhbmcgYnVp
bGQgc3lzdGVtIG1vcmUgZWZmZWN0aXZlbHkuDQoNCiAtR2Vvcmdl

