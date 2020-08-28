Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB492560FD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 21:05:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBjgd-0006P0-HU; Fri, 28 Aug 2020 19:05:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNC1=CG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kBjgc-0006Ov-HB
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 19:05:18 +0000
X-Inumbo-ID: 00a54189-13c1-4335-9cf0-098298357220
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00a54189-13c1-4335-9cf0-098298357220;
 Fri, 28 Aug 2020 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598641512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3yXmty4NFq7o9Xb3HhKpjcU7r6FirXZHRF1eRd+XLtw=;
 b=BpRyaqhPqKbsmtdr3wPvb8UIluiGILI9ts07YJLn177MnmQ7Ea8ZevB+
 YZwkNPjJM/2hW72ODAqmFvoYR+v2ehvxD0FfaniPEB2ddSeFPqNi9vA9V
 Qn/2oppwbYpC2/hkVvPZcSks9sAb9N1wK71AW9Y0VnRTj90GdyREsW/hE Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: hKz7THyVsGtfpctcbzHoW4bEiXvN01EP8TgZmJQuwXZjSE6TqJaps4s/QJ7b6gYYRg0MpV3LxL
 GMDrwpdbsukIZ7IrdUUNhiriC/QCarpBa3SLb/A2IhvHVdZekGeksH235ffTRtNIgTVLpqA0Yq
 O/ReFlPr97VnV3WC+sOVK4hDHypCl2dse8JvsRpxGGOVEeaYvCzSP4xqiA/COVK3XuSvNmcDdd
 NPbB7a3Gg2A9kcb9KTWcptc1baSK+MWzRxwb1LTwKRFHGIwJ2yj1Mordb8ALULNXraEThpc0wD
 qTE=
X-SBRS: 2.7
X-MesageID: 25556772
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,364,1592884800"; d="scan'208";a="25556772"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpOh3x1joJCE+VVRY7s1uiQnQA6wG0ZLW8sGLn6kveogG5kP+f2Wsd6fJA3NGimd4SNVvC9rBJ4xjiTk2nyE1BDw+pcSr6HUYEBmJieWYNFiIpo3snarzSoL764dFhbmHhKTjOb5nfRmxiIqVMkFGYFS2uxtKmLdo5cNwT8g5IAIues2O7iyQVcrnnjAXEsyhssXg+jQmE+GLZjn2ilrudQ+hLuTza7XrzSbEJejT2RxlLx2rQe/ttW5WRxAKYPbVFkrBI7SyULKbb6ZGIH73GLDEnDlX/ZzuFN1WTxPiLEXk4bGY43XrMP/2G3gMjGjhz8wu2d2UQs0vCGh03/BOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yXmty4NFq7o9Xb3HhKpjcU7r6FirXZHRF1eRd+XLtw=;
 b=JZJI4XQZ/IPz1pHbCtt2CWjWICzRbR1vLlw6hXaW3mNp1yvHFPeN6UkYmsIVpFRDwpA6mZff9qk8C9DqozEDTx9T0Hcie96tkc4gykFNSS1I7DCPdpKSx7oqyA1ZsBq4eYlTFOYw87CWZPW7UFO7T9+q3hlUsC1ryV+XDnU5I4rym5gROQucr8haK+zLJ2+ACV/UOR2DyRVknYTEjLiRtvpdscupDz8kcIKXAsRPRprDSRFxIk8fn23O4gFOgbwUL/aKpI1XMJgPeWV/P8k2PzppDPyQXFzkz+aft8P4nyn28waoUtAxGb/jT/QiXpYcXshObMSCWYiYbdHKDauQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yXmty4NFq7o9Xb3HhKpjcU7r6FirXZHRF1eRd+XLtw=;
 b=OPar3eOgrSWTyLt/VRyFsIzSZ7QbSZ9Z2eLRxFTJinfmiuDUTGebuIX9nerRPXrJevk/LSoXpANWf0uG8S5u/mpPLPPGEFvbLoJNLKZqPbwxDh6Pmslc4NZMSYbukWOZClCcTSDai0fv95r0vQD+50VUgT+yaDGb+edxoKOofl8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Ian Jackson
 <Ian.Jackson@citrix.com>, "rosbrookn@ainfosec.com" <rosbrookn@ainfosec.com>
Subject: Re: Golang design session follow-up
Thread-Topic: Golang design session follow-up
Thread-Index: AQHWXvbkqZX3isiLZUWTcowoxjQWaKlN6fcAgAA0ZIA=
Date: Fri, 28 Aug 2020 19:05:08 +0000
Message-ID: <317B0F11-2FD0-4B74-B148-C726037DFB7A@citrix.com>
References: <20200721003548.GA9581@six>
 <639307EB-23A4-4D76-8BDB-7F2FA4F149D1@citrix.com>
In-Reply-To: <639307EB-23A4-4D76-8BDB-7F2FA4F149D1@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1491f9a0-c11b-4ef8-95bd-08d84b854809
x-ms-traffictypediagnostic: SJ0PR03MB5469:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB5469EFD12A3E6482205C168699520@SJ0PR03MB5469.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: agZyFZZd2l+Ea2ntkiC4XHCtRdiuaWKJahsPDfQ2G1RyBmtPtezYCierSIn3kBopeKpqPDUgzkNSp7mXCCMWHopV1q8LMrmsL1vEkYtLZj2EdrmT0xVGzj8xlR9aaT/iM3cDDE3nXteKfDm7SaRShYYg1Z6gcuisjNf/tM7KvsOLWbxQ6I/4hGWK3QLKQA4yQ4bdJuw2XscObBw9usB8y1cWmzFI32gysuP8DUYZe5T9kx5QS+6ijtk+MarZO0ncGHD1TCrLAmU6o8G4i1X/axULOBGLz+Gqf5ITY1c8bWM1fqFmlP3nS3DfjP1D2v1YdgRV4bFasiAGDBqvSNr83BEMeDXD/XCX/yB+GvixeI1eLsofiz/P075UB6ApBVjBuT1quHT4lKBEUcd7PGG01g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(33656002)(966005)(316002)(8676002)(86362001)(8936002)(66446008)(64756008)(66476007)(66556008)(66946007)(2906002)(186003)(53546011)(36756003)(478600001)(6486002)(26005)(54906003)(2616005)(6512007)(71200400001)(6506007)(83380400001)(91956017)(5660300002)(6916009)(76116006)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mSFH50hqMw4POrXv7Ggj2SsBHljYwkbqJN/UVz+nZjVnrJssfUtnKVzFDAT+ajVR1WREoNfHhAKLUDiWWfwZNtNF3IepLkPgszX+xyoQ2mc/Q6fc+H3hoz1oQXq6IQ/7mHE2rRjiINLDA89Vp9Gx+x2JxLJc+c8wq0/IJTZkd4H/AN6/5PLVtAe7dEkri/kwRGJ76oohzJ6BYWT1DQWzBAZvVFoWqL5vGHlUP9AOVHhJ/YlqpPW9o8gQ0lN2iuTKjYFsIWCbENuI+8NWbs0suPgT3meifd0HWL09nHQVIIbogiWxJvPJfRq7c5c0lAhvfkaSe5UK27OqkBXCvFA7LxEaNotCEbNF1sT4Y+tRLdm1KH+IREfhP7VbGsnDwigWkEvj8No9CJUZm/ZtMMzqIQTl07FUFvqlcSuGk2opdHEW0IbPEhnp7ck5qkTCMMp5gjeqYZjrck0X4XBsPdLJ91c6mbOWaO8kC0yJzPFxcKkHi/Pck9aLGD8MBSQKmxqF6RKKSFZ3bfyx8MhTraQ5a6IBf7DQWja+YXW4yG1+Z3Lur5rdJxwMSM7Fcl4tYIWwfGmOnIWSVAChv0zkaChpt+XMORpKHwK7oe//dsbe5h0YY65Xhqtqfq5ZfSmqakTegjvBbRM8IQyptCpL0w9PeQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <8528D81F985EED4D8A6026445CD928B1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1491f9a0-c11b-4ef8-95bd-08d84b854809
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 19:05:08.2367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4+8of308sCnmfoC4Jl3CubirOpODn7ju+4wc3mIKenx6avwBl8NksTN/CJcYbB3EnMHsPR5wvLpxZARJTW2ocIY3ZWk0EpZBtiTOEFvrSqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5469
X-OriginatorOrg: citrix.com
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDI4LCAyMDIwLCBhdCA0OjU3IFBNLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gSnVsIDIxLCAyMDIw
LCBhdCAxOjM1IEFNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AZ21haWwuY29tPiB3cm90ZToN
Cj4+IA0KPj4gIyBMb25nLXRlcm0gaG9tZSBvZiB0aGUgcGFja2FnZQ0KPj4gDQo+PiAgIElhbjog
QXV0b2dlbmVyYXRlZCBzdHVmZiBpcyBiZWNvbWluZyBtb3JlIGFubm95aW5nLg0KPj4gDQo+PiAg
IERlbGV0ZSBhbGwgdGhlIGxpYnhsIGF1dG8tZ2VuZXJhdGVkIHN0dWZmIGZyb20gc3RhZ2luZyAm
IG1hc3RlciwgYW5kIGhhdmUgIm91dHB1dCBicmFuY2giLg0KPj4gDQo+PiAgIFRoZSByZWFzb24g
d2UgaGF2ZSB0aGVzZSBpbi10cmVlIGlzIHRoYXQgb3RoZXJ3aXNlIHlvdSBjYW4ndCBidWlsZCAq
ZnJvbSBnaXQqIGlmIHlvdSBkb24ndCANCj4+ICAgaGF2ZSBuZXcgZW5vdWdoIHZlcnNpb25zIG9m
IHRoZSByaWdodCB0b29scy4NCj4+IA0KPj4gICBEaXN0cmlidXRpb246IE1ha2UgYSByZXBvIG9u
IHhlbmJpdHMhDQo+IA0KPiBTbyB0aGlua2luZyBhYm91dCB0aGlzOiANCj4gDQo+IFRoZSBmaXJz
dCBwbGFuIEkgaGFkIHdhcyB0byBoYXZlIGEgc2NyaXB0IGluIHRvb2xzL2dvbGFuZy94ZW5saWdo
dCAoYW5kL29yIHRoZSBNYWtlZmlsZSksIHdoaWNoIHdvdWxkIGJlIGhhbmRlZCBhIGRpcmVjdG9y
eSwgYW5kIHdvdWxkIHRoZW46DQo+IA0KPiAxLiBTeW5jIHN0YXRpYyBmaWxlcyBmcm9tIHRvb2xz
L2dvbGFuZy94ZW5saWdodCBpbnRvIHRoYXQgZGlyZWN0b3J5DQo+IA0KPiAyLiBSdW4gZ2VuZ290
eXBlcy5weSwgaGF2aW5nIHRoZSByZXN1bHRpbmcgZ2VuZXJhdGVkIGZpbGVzIHB1dCBpbnRvIHRo
YXQgZGlyZWN0b3J5DQo+IA0KPiAzLiBSdW4gYGdpdCBkaWZmYCBpbiB0aGUgdGFyZ2V0IGRpcmVj
dG9yeTsgaWYgdGhlcmUgYXJlIGFueSBjaGFuZ2VzLCB0aGVuIGF1dG9tYXRpY2FsbHkgcnVuIGBn
aXQgY29tbWl0YCB0byBjaGVjayBpbiB0aGUgY2hhbmdlcy4NCj4gDQo+IFRoYXQgd2F5IHlvdSBj
b3VsZCBqdXN0IHNldCB1cCBhIGNyb24gam9iIHRvIHN5bmMgdGhpbmdzIG92ZXIgb24gYSByZWd1
bGFyIGJhc2lzLg0KPiANCj4gVGhpbmtpbmcgYWJvdXQgR1BMIGNvbnNpZGVyYXRpb25zLCBob3dl
dmVyLCB5b3XigJlkIGFsc28gd2FudCB0byBpbmNsdWRlIGxpYnhsX3R5cGVzLmlkbCBhbmQgaWRs
LnB5LiAgQW5kIHRoZW4gb2YgY291cnNlLCB5b3Ugc2hvdWxkIGFsc28gaW5jbHVkZSBhIHdheSB0
byBidWlsZCB0aGUgZ2VuZXJhdGVkIGNvZGUgZnJvbSB0aG9zZSB0d28uDQo+IA0KPiBBdCB3aGlj
aCBwb2ludOKApiB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIGp1c3QgbW92ZSB0aGUgcGFja2FnZSBv
dXQgdG8gaXRzIHNlcGFyYXRlIHJlcG8gZW50aXJlbHk/ICBJLmUuLCBoYXZlIGFjdHVhbCBkZXZl
bG9wbWVudCBoYXBwZW4gaW4gdGhlIHJlcG8gd2hpY2ggZW5kcyB1cCBiZWluZyBjbG9uZWQgaW4g
dGhlIGVuZD8NCj4gDQo+IE9idmlvdXNseSB0aGVyZSBhcmUgbmljZSB0aGluZ3MgYWJvdXQgaGF2
aW5nIHRoZSBjb2RlIGluIHRoZSBzYW1lIHJlcG87IGJ1dCB0aGVyZeKAmXMgYWxzbyBzb21ldGhp
bmcgc2F0aXNmeWluZyBhYm91dCBiZWluZyBhIGZ1bGwgZG93bnN0cmVhbS4NCj4gDQo+IEkgd2Fz
IGFjdHVhbGx5IHRoaW5raW5nIGl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gcHV0IHRoZSByZXBvIGF0
IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9nby14ZW5saWdodCAsIHRvIHRyeSBvdXQg
dGhhdCBhcyBhIGRldmVsb3BtZW50IG1vZGVsLg0KDQpJ4oCZdmUgcHV0IGEgc29ydCBvZiBkcmFm
dCBtb2R1bGUgdXAgYXQgaHR0cHM6Ly9naXRsYWIuY29tL21hcnR5cm9zL2dvLXhlbiA7IHlvdSBj
YW4gdGVzdCBpdCBieSBhZGRpbmcgdGhlICJnaXRsYWIuY29tL3hlbi1wcm9qZWN0L2dvLXhlbi94
ZW5saWdodOKAnSBwYWNrYWdlLCBidXQgYWRkaW5nIHRoZSBmb2xsb3dpbmcgbGluZSB0byB0aGUg
Z28ubW9kIG9mIHRoZSB0ZXN0IHByb2dyYW06DQoNCnJlcGxhY2UgZ2l0bGFiLmNvbS94ZW4tcHJv
amVjdC9nby14ZW4gPT4gZ2l0bGFiLmNvbS9tYXJ0eXJvcy9nby14ZW4gbWFzdGVyDQoNClRoaXMg
YnVpbGRzIGJ1dCBmb3IgbWUgdW5mb3J0dW5hdGVseSBjcmFzaGVzIGR1cmluZyBkb21haW4gY3Jl
YXRpb24gd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOg0KDQpsaWJ4bDogZXJyb3I6IGxpYnhsX2Ny
ZWF0ZS5jOjkwOmxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0OiBVbmFibGUgdG8g
Y29weSBkZXByZWNhdGVkIGZpZWxkcw0KbGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzoxMTgy
OmxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQ6IFVuYWJsZSB0byBzZXQgZG9tYWluIGJ1
aWxkIGluZm8gZGVmYXVsdHMNCg0KSeKAmWxsIGhhdmUgdG8gZGlnIGEgYml0IG1vcmUgaW50byBp
dCBuZXh0IHdlZWsuDQoNCiAtR2VvcmdlDQoNCg==

