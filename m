Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E4234436
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 12:45:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1SXm-0000aL-Nb; Fri, 31 Jul 2020 10:45:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GLoN=BK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k1SXl-0000aG-1D
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 10:45:41 +0000
X-Inumbo-ID: f8e07cf2-d31a-11ea-ab99-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8e07cf2-d31a-11ea-ab99-12813bfff9fa;
 Fri, 31 Jul 2020 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596192338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MAlUoJmK5jHLvdE12umdPb4+vbrcyWtC53izDasoRTc=;
 b=aUFyK06MQkl4wmd7HYdd2RsBeXrSSnmcYys3xOhpVCiqQycNV33f0MJH
 KEMuP5gbczNbVU4qiT1sSdNNbJl9yi1aK+LuTQw4xHEe2fHBtqQeuGowb
 RuNaxcUKe9xHiBBbL1e4TKcawgJ7m1HhV5Tsa0UvwlawxGtnA3tntO5EL c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8xbihE64pm+UhQNHOCjB1DgdZc7BiInihMh6xsurBN2xDsPlWjeXJsZMWtx0GUq+NxWZ5aXcAr
 9kG4Bh39hGheKFh+PvPDo5YE1wLi9w50pmnuYQ3N47MY4HNqPbYSwdMWYzYa4jv/WAQYh0xHlS
 rzaCzhmjBqv4yYO8cAwozLnT6BDP7fvxRjRPwLRQ8tVI/etC5SgOeARheiLbBRXc1A5MGpaRDs
 3BLymNRd33ZhOaZ3pKT8wOLW5XFPVxPZSOGDah2qumV7Dpbj3gy0QxRkNbz3JPAKWJp1CELqOo
 1vo=
X-SBRS: 3.7
X-MesageID: 23939540
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23939540"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 14/14] duration_estimator: Move duration query
 loop into database
Thread-Topic: [OSSTEST PATCH 14/14] duration_estimator: Move duration query
 loop into database
Thread-Index: AQHWX5IXwUKXL54pjkKddmBXrxrv3qkbmlIAgAXSzgCAAAGlgA==
Date: Fri, 31 Jul 2020 10:45:35 +0000
Message-ID: <729C1D34-B3A6-49D0-9F6E-88B4934242F9@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-15-ian.jackson@eu.citrix.com>
 <7A4B6786-4456-44E4-A85D-9CC83B522FBB@citrix.com>
 <24355.62702.194666.338534@mariner.uk.xensource.com>
In-Reply-To: <24355.62702.194666.338534@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <2719371797AE6945B24720DF5B1C3399@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDMxLCAyMDIwLCBhdCAxMTozOSBBTSwgSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gR2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTog
W09TU1RFU1QgUEFUQ0ggMTQvMTRdIGR1cmF0aW9uX2VzdGltYXRvcjogTW92ZSBkdXJhdGlvbiBx
dWVyeSBsb29wIGludG8gZGF0YWJhc2UiKToNCj4+PiBPbiBKdWwgMjEsIDIwMjAsIGF0IDc6NDIg
UE0sIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPiB3cm90ZToNCj4gLi4u
DQo+Pj4gRXhhbXBsZSBxdWVyaWVzIGJlZm9yZSAoZnJvbSB0aGUgZGVidWdnaW5nIG91dHB1dCk6
DQo+Pj4gDQo+Pj4gUXVlcnkgQSBwYXJ0IEk6DQo+Pj4gDQo+Pj4gICAgICAgICAgIFNFTEVDVCBm
LmZsaWdodCBBUyBmbGlnaHQsDQo+Pj4gICAgICAgICAgICAgICAgICBqLmpvYiBBUyBqb2IsDQo+
Pj4gICAgICAgICAgICAgICAgICBmLnN0YXJ0ZWQgQVMgc3RhcnRlZCwNCj4+PiAgICAgICAgICAg
ICAgICAgIGouc3RhdHVzIEFTIHN0YXR1cw0KPj4+ICAgICAgICAgICAgICAgICAgICBGUk9NIGZs
aWdodHMgZg0KPj4+ICAgICAgICAgICAgICAgICAgICBKT0lOIGpvYnMgaiBVU0lORyAoZmxpZ2h0
KQ0KPj4+ICAgICAgICAgICAgICAgICAgICBKT0lOIHJ1bnZhcnMgcg0KPj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIE9OICBmLmZsaWdodD1yLmZsaWdodA0KPj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQU5EICByLm5hbWU9Pw0KPj4+ICAgICAgICAgICAgICAgICAgIFdIRVJFICBq
LmpvYj1yLmpvYg0KPj4gDQo+PiBEaWQgdGhlc2UgbGFzdCB0d28gZ2V0IG1peGVkIHVwPyAgTXkg
bGltaXRlZCBleHBlcmllbmNlIHcvIEpPSU4gT04NCj4+IGFuZCBXSEVSRSB3b3VsZCBsZWFkIG1l
IHRvIGV4cGVjdCB3ZeKAmXJlIGpvaW5pbmcgb24NCj4+IGBmLmZsaWdodD1yLmZsaWdodCBhbmQg
ci5qb2IgPSBqLmpvYmAsIGFuZCBoYXZpbmcgYHIubmFtZSA9ID9gIGFzDQo+PiBwYXJ0IG9mIHRo
ZSBXSEVSRSBjbGF1c2UuICBJIHNlZSBpdOKAmXMgdGhlIHNhbWUgaW4gdGhlIGNvbWJpbmVkIHF1
ZXJ5DQo+PiBhcyB3ZWxsLg0KPiANCj4gV2VsbCBzcG90dGVkLiAgSG93ZXZlciwgYWN0dWFsbHks
IHRoaXMgbWFrZXMgbm8gZGlmZmVyZW5jZTogd2l0aCBhbg0KPiBpbm5lciBqb2luLCBPTiBjbGF1
c2VzIGFyZSB0aGUgc2FtZSBhcyBXSEVSRSBjbGF1c2VzLiAgSXQgZG9lcyBzZWVtDQo+IHN0eWxp
c3RpY2FsbHkgcG9vciB0aG91Z2gsIHNvIEkgd2lsbCBhZGQgYSBjb21taXQgdG8gY2hhbmdlIGl0
Lg0KDQpZZWFoLCBpbiBteSB0aW55IGFtb3VudCBvZiBleHBlcmllbmNlIHdpdGggU1FMaXRlLCBw
dXR0aW5nIHRoaXMgc29ydCBvZiByZXN0cmljdGlvbiBpbiBXSEVSRSByYXRoZXIgdGhhbiBPTiBk
aWRu4oCZdCBzZWVtIHRvIG1ha2UgYSBwcmFjdGljYWwgZGlmZmVyZW5jZTsgbm8gZG91YnQgdGhl
IHF1ZXJ5IHBsYW5uZXIgaXMgc21hcnQgZW5vdWdoIHRvIERUUlQuICBCdXQgc3dpdGNoaW5nIHRo
ZW0gc2hvdWxkIG1ha2UgaXQgc2xpZ2h0bHkgZWFzaWVyIGZvciBodW1hbnMgdG8gcGFyc2UsIHNv
IGlzIHByb2JhYmx5IHdvcnRoIGRvaW5nIHdoaWxlIHlvdeKAmXJlIGhlcmUsIGlmIHlvdSBoYXZl
IGEgZmV3IHNwYXJlIGN5Y2xlcy4NCg0KVGhhbmtzLA0KIC1HZW9yZ2UNCg0K

