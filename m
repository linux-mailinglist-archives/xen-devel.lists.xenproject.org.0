Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA3C03B3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 12:49:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDnm0-0001yv-4e; Fri, 27 Sep 2019 10:46:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwcO=XW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDnly-0001yq-Pl
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:46:50 +0000
X-Inumbo-ID: 1bb1faac-e114-11e9-9675-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 1bb1faac-e114-11e9-9675-12813bfff9fa;
 Fri, 27 Sep 2019 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569581210;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xp8rtEks1NB1WDCWWTxiYaF1nW+PyyZW2uy5aeIWyYU=;
 b=C5YuXp5bSzrFI3qeWviO7wpiJ6iSY8fg+wVocjtOGfsP/8hao4e7M40m
 BCzqmlONJsV9XeukvEh5dXvqGk9m2z/tO4GIG3XAnjhJu9mp6vlwm4A5w
 QTGZQ1t9NDo4HD843P+t/+Pc1KAqeFhPKFrk/w6Zvn4xoOSK5egVa/Zq+ U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: n3NUGMiQZqLKwV1gHuIJy08WBDNKqWiMUZMSsUXYr2KnWsAxM3tQ1eWuCP0P+utMvnLvt/K1vt
 whQK/KN3QjNRdQ4hHjqJoO/qxeVoBKHyZODKUEM/Age2+2u9KfiVW2TmGC+S1XTejtRaXosg1H
 iFjF7y98bZJr2mCwGQvMg262ssojp8wT8junC9dyBxiI0xjv0f68IfHt15Krg/cgIZl5jXtWki
 ceHhsfOeqOxy6xuaJhQIPJSLyvxyJ9lhEvf9uynJRShzXmk1yiJiLA96XeO7MT1lz0bRjZato0
 t5s=
X-SBRS: 2.7
X-MesageID: 6168853
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6168853"
Date: Fri, 27 Sep 2019 12:46:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190927104638.ow5mcikjvhybx5zo@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-10-roger.pau@citrix.com>
 <8b2ae16a846a4e88bf264a8d5a768a37@AMSPEX02CL03.citrite.net>
 <20190926150718.omalmgpxuxsezbov@Air-de-Roger>
 <75f89532a65446cb92a72b31aed96d5e@AMSPEX02CL03.citrite.net>
 <20190927084542.yggl5mxomuntieel@Air-de-Roger>
 <54a96879442b4db798a8140f12f32d2c@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54a96879442b4db798a8140f12f32d2c@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 09/11] vpci: register as an internal
 ioreq server
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMTE6MDE6MzlBTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAyNyBTZXB0ZW1iZXIgMjAxOSAw
OTo0Ngo+ID4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBD
YzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBJYW4gSmFja3NvbiA8SWFuLkphY2tz
b25AY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcKPiA+IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
Y2l0cml4LmNvbT47IEphbiBCZXVsaWNoCj4gPiA8amJldWxpY2hAc3VzZS5jb20+OyBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPiA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPgo+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAwOS8xMV0gdnBjaTogcmVnaXN0ZXIgYXMgYW4gaW50ZXJuYWwgaW9yZXEgc2Vy
dmVyCj4gPiAKPiA+IE9uIEZyaSwgU2VwIDI3LCAyMDE5IGF0IDEwOjI5OjIxQU0gKzAyMDAsIFBh
dWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4g
PiA+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4g
U2VudDogMjYgU2VwdGVtYmVyIDIwMTkgMTY6MDcKPiA+ID4gPiBUbzogUGF1bCBEdXJyYW50IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiA+ID4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Owo+ID4gQW5kcmV3Cj4gPiA+ID4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0Bj
aXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSmFu
IEJldWxpY2gKPiA+ID4gPiA8amJldWxpY2hAc3VzZS5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPiA+ID4gPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz4KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyIDA5LzExXSB2cGNpOiByZWdpc3RlciBhcyBhbiBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXIK
PiA+ID4gPgo+ID4gPiA+IE9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDAzOjQ5OjQxUE0gKzAyMDAs
IFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+ID4gPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KPiA+ID4gPiA+ID4gU2VudDogMDMgU2VwdGVtYmVyIDIwMTkgMTc6MTQKPiA+ID4gPiA+ID4g
VG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gPiA+ID4gPiBDYzogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3Nv
bkBjaXRyaXguY29tPjsgV2VpIExpdQo+ID4gPiA+ID4gPiA8d2xAeGVuLm9yZz47IEFuZHJldyBD
b29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwCj4gPiA8R2Vv
cmdlLkR1bmxhcEBjaXRyaXguY29tPjsKPiA+ID4gPiBKYW4KPiA+ID4gPiA+ID4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4gPiA+ID4gPiA+IDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltIChYZW4u
b3JnKQo+ID4gPiA+IDx0aW1AeGVuLm9yZz47Cj4gPiA+ID4gPiA+IFBhdWwgRHVycmFudCA8UGF1
bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MiAwOS8x
MV0gdnBjaTogcmVnaXN0ZXIgYXMgYW4gaW50ZXJuYWwgaW9yZXEgc2VydmVyCj4gPiA+ID4gPiA+
IEBAIC00NzgsNiArNDgwLDY3IEBAIHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVu
c2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplLAo+ID4gPiA+ID4gPiAgICAgIHNwaW5f
dW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsKPiA+ID4gPiA+ID4gIH0KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gKyNpZmRlZiBfX1hFTl9fCj4gPiA+ID4gPiA+ICtzdGF0aWMgaW50IGlvcmVxX2hh
bmRsZXIoc3RydWN0IHZjcHUgKnYsIGlvcmVxX3QgKnJlcSwgdm9pZCAqZGF0YSkKPiA+ID4gPiA+
ID4gK3sKPiA+ID4gPiA+ID4gKyAgICBwY2lfc2JkZl90IHNiZGY7Cj4gPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ID4gKyAgICBpZiAoIHJlcS0+dHlwZSA9PSBJT1JFUV9UWVBFX0lOVkFMSURBVEUgKQo+
ID4gPiA+ID4gPiArICAgICAgICAvKgo+ID4gPiA+ID4gPiArICAgICAgICAgKiBJZ25vcmUgaW52
YWxpZGF0ZSByZXF1ZXN0cywgdGhvc2UgY2FuIGJlIHJlY2VpdmVkIGV2ZW4gd2l0aG91dAo+ID4g
PiA+ID4gPiArICAgICAgICAgKiBoYXZpbmcgYW55IG1lbW9yeSByYW5nZXMgcmVnaXN0ZXJlZCwg
c2VlIHNlbmRfaW52YWxpZGF0ZV9yZXEuCj4gPiA+ID4gPiA+ICsgICAgICAgICAqLwo+ID4gPiA+
ID4gPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwo+ID4gPiA+ID4KPiA+ID4gPiA+IElu
IGdlbmVyYWwsIEkgd29uZGVyIHdoZXRoZXIgaW50ZXJuYWwgc2VydmVycyB3aWxsIGV2ZXIgbmVl
ZCB0byBkZWFsIHdpdGggaW52YWxpZGF0ZT8gVGhlIGNvZGUKPiA+IG9ubHkKPiA+ID4gPiBleGlz
dHMgdG8gZ2V0IFFFTVUgdG8gZHJvcCBpdHMgbWFwIGNhY2hlIGFmdGVyIGEgZGVjcmVhc2VfcmVz
ZXJ2YXRpb24gc28gdGhhdCB0aGUgcGFnZSByZWZzIGdldAo+ID4gPiA+IGRyb3BwZWQuCj4gPiA+
ID4KPiA+ID4gPiBJIHRoaW5rIHRoZSBiZXN0IHNvbHV0aW9uIGhlcmUgaXMgdG8gcmVuYW1lIGh2
bV9icm9hZGNhc3RfaW9yZXEgdG8KPiA+ID4gPiBodm1fYnJvYWRjYXN0X2lvcmVxX2V4dGVybmFs
IGFuZCBzd2l0Y2ggaXQncyBjYWxsZXJzLiBCb3RoCj4gPiA+ID4gc2VuZF90aW1lb2Zmc2V0X3Jl
cSBhbmQgc2VuZF9pbnZhbGlkYXRlX3JlcSBzZWVtIG9ubHkgcmVsZXZhbnQgdG8KPiA+ID4gPiBl
eHRlcm5hbCBpb3JlcSBzZXJ2ZXJzLgo+ID4gPgo+ID4gPiBzZW5kX3RpbWVvZmZzZXRfcmVxKCkg
aXMgcmVsaWMgd2hpY2ggb3VnaHQgdG8gYmUgcmVwbGFjZWQgd2l0aCBhbm90aGVyIG1lY2hhbmlz
bSBJTU8uLi4KPiA+ID4KPiA+ID4gV2hlbiBhbiBIVk0gZ3Vlc3Qgd3JpdGVzIGl0cyBSVEMsIGEg
bmV3ICd0aW1lb2Zmc2V0JyB2YWx1ZSAob2Zmc2V0IG9mIFJUQyBmcm9tIGhvc3QgdGltZSkgaXMK
PiA+IGNhbGN1bGF0ZWQgKGFsc28gYXBwbGllZCB0byB0aGUgUFYgd2FsbGNsb2NrKSBhbmQgYWR2
ZXJ0aXNlZCB2aWEgdGhpcyBpb3JlcS4gSW4gWGVuU2VydmVyLCB0aGlzIGlzCj4gPiBwaWNrZWQg
dXAgYnkgUUVNVSwgZm9yd2FyZGVkIHZpYSBRTVAgdG8gWEFQSSBhbmQgdGhlbiB3cml0dGVuIGlu
dG8gdGhlIFZNIG1ldGEtZGF0YSAod2hpY2ggdGhhbiBjYXVzZXMKPiA+IGl0IHRvIGJlIHdyaXR0
ZW4gaW50byB4ZW5zdG9yZSB0b28pLiBBbGwgdGhpcyBpcyBzbyB0aGF0IHRoYXQgZ3Vlc3QncyBS
VEMgY2FuIGJlIHNldCBjb3JyZWN0bHkgd2hlbiBpdAo+ID4gaXMgcmVib290ZWQuLi4gVGhlcmUg
aGFzIHRvIGJlIGEgYmV0dGVyIHdheSAoZS5nLiBleHRyYWN0aW5nIFJUQyB2aWEgaHZtIGNvbnRl
eHQgYW5kIHNhdmluZyBpdCBiZWZvcmUKPiA+IGNsZWFuaW5nIHVwIHRoZSBkb21haW4pLgo+ID4g
Pgo+ID4gPiBzZW5kX2ludmFsaWRhdGVfcmVxKCkgaXMgcmVsZXZhbnQgZm9yIGFueSBlbXVsYXRv
ciBtYWludGFpbmluZyBhIGNhY2hlIG9mIGd1ZXN0LT5ob3N0IG1lbW9yeQo+ID4gbWFwcGluZ3Mg
d2hpY2gsIEkgZ3Vlc3MsIGNvdWxkIGluY2x1ZGUgaW50ZXJuYWwgZW11bGF0b3JzIGV2ZW4gaWYg
dGhpcyBpcyBub3QgdGhlIGNhc2UgYXQgdGhlIG1vbWVudC4KPiA+IAo+ID4gTWF5YmUsIGJ1dCBJ
IHdvdWxkIGV4cGVjdCBhbiBpbnRlcm5hbCBlbXVsYXRvciB0byBnZXQgYSByZWZlcmVuY2Ugb24K
PiA+IHRoZSBnZm4gaWYgaXQgZG9lcyBuZWVkIHRvIGtlZXAgaXQgaW4gc29tZSBraW5kIG9mIGNh
Y2hlLCBvciBlbHNlIEkKPiA+IGRvbid0IHRoaW5rIGNvZGUgaW4gdGhlIGh5cGVydmlzb3Igc2hv
dWxkIGJlIGtlZXBpbmcgc3VjaCByZWZlcmVuY2VzLgo+IAo+IE9oIGluZGVlZCwgYnV0IHRoYXQn
cyBub3QgdGhlIGlzc3VlLiBUaGUgaXNzdWUgaXMgd2hlbiB0byBkcm9wIHRob3NlIHJlZnMuLi4g
SWYgdGhlIGd1ZXN0IGRvZXMgYSBkZWNyZWFzZV9yZXNlcnZhdGlvbiBvbiBhIGdmbiBjYWNoZWQg
YnkgdGhlIGVtdWxhdG9yIHRoZW4gdGhlIGVtdWxhdG9yIG5lZWRzIHRvIGRyb3AgaXRzIHJlZiB0
byBhbGxvdyB0aGUgcGFnZSB0byBiZSBmcmVlZC4KClRoZW4gSSB0aGluayB0aGlzIGFsc28gY291
bGQgYmUgdXNlZCBieSBpbnRlcm5hbCBzZXJ2ZXJzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
