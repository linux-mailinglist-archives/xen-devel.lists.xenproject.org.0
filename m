Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779C1A110B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 18:16:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLqtq-0002D4-NP; Tue, 07 Apr 2020 16:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LBKk=5X=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jLqtp-0002Cz-SE
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 16:16:29 +0000
X-Inumbo-ID: 22bc2916-78eb-11ea-b4f4-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22bc2916-78eb-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586276189;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qsdtDSUBfo1nVHXLINQJJ5a/TXMpEYae9DK1jrNyKXI=;
 b=WbQAM+fWF0cUULy/5rDFz1H2vdGKNp74Gjkx7HtOLLT2ukPlsAKXabjt
 ueUbUmPPdp+jP6uTZtH1h0Mi3WbOxCxUBfeasDF7dyKhuqcy5oWswDX1i
 akIsF5QDejvOSu1Oelkdf6T9SjkvrHwFHc9nEiq8cPJKsi7Uqfii3ZLlw o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CffjwMus1Vp0KI+QEGbbXyQ24IlQK3g927kNMSANe+TcJ6P5uGd0rbMjGpKOfaPKOfQtCXmnO2
 FKjFQ3wAsqi3MMx7Pou206QYvaxf6V9e5Fx4mc5vpSl7SGS0vtGp8hEI4DtohzjEYjHUYDTdg0
 y0iyaejuseEFcaBoPznq5CXZLgXFBSSrgIQpkedWtozua2NpQtPH0XQVIibiW9V0FbxLv9qYS/
 iEPHj7zoXbFEVfTskzHX5zThV//insLRAlDIOex6uaiDqB+8fSwPxlFvtih02DNYu74mu8Auyh
 i/I=
X-SBRS: 2.7
X-MesageID: 15539618
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,355,1580792400"; d="scan'208";a="15539618"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Topic: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
Thread-Index: AQHWCRLu2U2EJ1WUk0i1KTanKYKpWqhmDBwAgAGf9wCAAAzcgIAEjVGAgAANpgCAAWgwAA==
Date: Tue, 7 Apr 2020 16:16:24 +0000
Message-ID: <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
 <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
 <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
In-Reply-To: <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <42700E388FCCE541A2D8B3204744D34C@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDYsIDIwMjAsIGF0IDc6NDcgUE0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gT24gMDYvMDQvMjAyMCAxODo1OCwgR2VvcmdlIER1bmxhcCB3
cm90ZToNCj4+PiBPbiBBcHIgMywgMjAyMCwgYXQgOToyNyBQTSwgSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGwub3NzQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gRnJpLCAzIEFwciAy
MDIwIGF0IDIwOjQxLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
IHdyb3RlOg0KPj4+PiANCj4+Pj4gT24gVGh1LCAyIEFwciAyMDIwLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6DQo+Pj4+PiBBcyB3ZSBkaXNjdXNzZWQgb24gVHVlc2RheSwgdGhlIGNvc3QgZm9yIG90aGVy
IHZDUFVzIGlzIG9ubHkgZ29pbmcgdG8gYmUgYQ0KPj4+Pj4gdHJhcCB0byB0aGUgaHlwZXJ2aXNv
ciBhbmQgdGhlbiBiYWNrIGFnYWluLiBUaGUgY29zdCBpcyBsaWtlbHkgc21hbGxlciB0aGFuDQo+
Pj4+PiByZWNlaXZpbmcgYW5kIGZvcndhcmRpbmcgYW4gaW50ZXJydXB0Lg0KPj4+Pj4gDQo+Pj4+
PiBZb3UgYWN0dWFsbHkgYWdyZWVkIG9uIHRoaXMgYW5hbHlzaXMuIFNvIGNhbiB5b3UgZW5saWdo
dGVuIG1lIGFzIHRvIHdoeQ0KPj4+Pj4gcmVjZWl2aW5nIGFuIGludGVycnVwdCBpcyBhIG5vdCBw
cm9ibGVtIGZvciBsYXRlbmN5IGJ1dCB0aGlzIGlzPw0KPj4+PiANCj4+Pj4gTXkgYW5zd2VyIHdh
cyB0aGF0IHRoZSBkaWZmZXJlbmNlIGlzIHRoYXQgYW4gb3BlcmF0aW5nIHN5c3RlbSBjYW4NCj4+
Pj4gZGlzYWJsZSBpbnRlcnJ1cHRzLCBidXQgaXQgY2Fubm90IGRpc2FibGUgcmVjZWl2aW5nIHRo
aXMgc3BlY2lhbCBJUEkuDQo+Pj4gDQo+Pj4gQW4gT1MgY2FuICpvbmx5KiBkaXNhYmxlIGl0cyBv
d24gaW50ZXJydXB0cywgeWV0IGludGVycnVwdHMgd2lsbCBzdGlsbA0KPj4+IGJlIHJlY2VpdmVk
IGJ5IFhlbiBldmVuIGlmIHRoZSBpbnRlcnJ1cHRzIGFyZSBtYXNrZWQgYXQgdGhlIHByb2Nlc3Nv
cg0KPj4+IChlLmcgbG9jYWxfaXJxX2Rpc2FibGUoKSkuDQo+Pj4gDQo+Pj4gWW91IHdvdWxkIG5l
ZWQgdG8gZGlzYWJsZSBpbnRlcnJ1cHRzIG9uZSBieSBvbmUgYXMgdGhlIEdJQyBsZXZlbCAodXNl
DQo+Pj4gSUNFTkFCTEVSKSBpbiBvcmRlciB0byBub3QgcmVjZWl2ZSBhbnkgaW50ZXJydXB0cy4g
WWV0LCBYZW4gbWF5IHN0aWxsDQo+Pj4gcmVjZWl2ZSBpbnRlcnJ1cHRzIGZvciBvcGVyYXRpb25h
bCBwdXJwb3NlcyAoZS5nIHNlcmlhbCwgY29uc29sZSwNCj4+PiBtYWludGFpbmFuY2UgSVJRLi4u
KS4gU28gdHJhcCB3aWxsIGhhcHBlbi4NCj4+IEkgdGhpbmsgU3RlZmFub+KAmXMgYXNzZXJ0aW9u
IGlzIHRoYXQgdGhlIHVzZXJzIGhlIGhhcyBpbiBtaW5kIHdpbGwgYmUgY29uZmlndXJpbmcgdGhl
IHN5c3RlbSBzdWNoIHRoYXQgUlQgd29ya2xvYWRzIGdldCBhIG1pbmltdW0gbnVtYmVyIG9mIGh5
cGVydmlzb3ItcmVsYXRlZCBpbnRlcnJ1cHRzIHBvc3NpYmxlLiAgT24gYSA0LWNvcmUgc3lzdGVt
LCB5b3UgY291bGQgIGhhdmUgbm9uLVJUIHdvcmtsb2FkcyBydW5uaW5nIG9uIGNvcmVzIDAtMSwg
YW5kIFJUIHdvcmtsb2FkcyBydW5uaW5nIHdpdGggdGhlIE5VTEwgc2NoZWR1bGVyIG9uIGNvcmVz
IDItMy4gIEluIHN1Y2ggYSBzeXN0ZW0sIHlvdeKAmWQgb2J2aW91c2x5IGFycmFuZ2UgdGhhdCBz
ZXJpYWwgYW5kIG1haW50ZW5hbmNlIElSUXMgYXJlIGRlbGl2ZXJlZCB0byBjb3JlcyAwLTEuDQo+
IFdlbGwgbWFpbnRlbmFuY2UgSVJRcyBhcmUgcGVyIHBDUFUgc28geW91IGNhbid0IHJvdXRlIHRv
IGFub3RoZXIgb25lLi4uDQo+IA0KPiBCdXQsIEkgdGhpbmsgeW91IG1pc3NlZCBteSBwb2ludCB0
aGF0IGxvY2FsX2lycV9kaXNhYmxlKCkgZnJvbSB0aGUgZ3Vlc3Qgd2lsbCBub3QgcHJldmVudCB0
aGUgaHlwZXJ2aXNvciB0byByZWNlaXZlIGludGVycnVwdHMgKmV2ZW4qIHRoZSBvbmUgcm91dGVk
IHRvIHRoZSB2Q1BVIGl0c2VsZi4gVGhleSB3aWxsIGp1c3Qgbm90IGJlIGRlbGl2ZXJlZCB0byB0
aGUgZ3Vlc3QgY29udGV4dCB1bnRpbCBsb2NhbF9pcnFfZW5hYmxlKCkgaXMgY2FsbGVkLg0KDQpN
eSB1bmRlcnN0YW5kaW5nLCBmcm9tIFN0ZWZhbm8gd2FzIHRoYXQgd2hhdCBoaXMgY3VzdG9tZXJz
IGFyZSBjb25jZXJuZWQgYWJvdXQgaXMgdGhlIHRpbWUgYmV0d2VlbiB0aGUgdGltZSBhIHBoeXNp
Y2FsIElSUSBpcyBkZWxpdmVyZWQgdG8gdGhlIGd1ZXN0IGFuZCB0aGUgdGltZSB0aGUgZ3Vlc3Qg
T1MgY2FuIHJlc3BvbmQgYXBwcm9wcmlhdGVseS4gIFRoZSBrZXkgdGhpbmcgaGVyZSBpc27igJl0
IG5lY2Vzc2FyaWx5IHNwZWVkLCBidXQgcHJlZGljdGFiaWxpdHkg4oCUIHN5c3RlbSBkZXNpZ25l
cnMgbmVlZCB0byBrbm93IHRoYXQsIHdpdGggYSBoaWdoIHByb2JhYmlsaXR5LCB0aGVpciBpbnRl
cnJ1cHQgcm91dGluZXMgd2lsbCBjb21wbGV0ZSB3aXRoaW4gWCBhbW91bnQgb2YgY3ljbGVzLg0K
DQpGdXJ0aGVyIGludGVycnVwdHMgZGVsaXZlcmVkIHRvIGEgZ3Vlc3QgYXJlIG5vdCBhIHByb2Js
ZW0gaW4gdGhpcyBzY2VuYXJpbywgaWYgdGhlIGd1ZXN0IGNhbiBkaXNhYmxlIHRoZW0gdW50aWwg
dGhlIGNyaXRpY2FsIElSUSBoYXMgYmVlbiBoYW5kbGVkLg0KDQpYZW4tcmVsYXRlZCBJUElzLCBo
b3dldmVyLCBjb3VsZCBwb3RlbnRpYWxseSBjYXVzZSBhIHByb2JsZW0gaWYgbm90IG1pdGlnYXRl
ZC4gIENvbnNpZGVyIGEgZ3Vlc3Qgd2hlcmUgdmNwdSAxIGxvb3BzIG92ZXIgdGhlIHJlZ2lzdGVy
LCB3aGlsZSB2Y3B1IDIgaXMgaGFuZGxpbmcgYSBsYXRlbmN5LWNyaXRpY2FsIElSUS4gIEEgbmFp
dmUgaW1wbGVtZW50YXRpb24gbWlnaHQgc2VuZCBhbiBJUEkgZXZlcnkgdGltZSB2Y3B1IDEgZG9l
cyBhIHJlYWQsIHNwYW1taW5nIHZjcHUgMiB3aXRoIGRvemVucyBvZiBJUElzLiAgVGhlbiBhbiBJ
UlEgcm91dGluZSB3aGljaCByZWxpYWJseSBmaW5pc2hlcyB3ZWxsIHdpdGhpbiB0aGUgcmVxdWly
ZWQgdGltZSBub3JtYWxseSBzdWRkZW5seSBvdmVycnVucyBhbmQgY2F1c2VzIGFuIGlzc3VlLg0K
DQpJIGRvbuKAmXQga25vdyB3aGF0IG1haW50ZW5hbmNlIElSUXMgYXJlLCBidXQgaWYgdGhleSBv
bmx5IGhhcHBlbiBpbnRlcm1pdHRlbnRseSwgaXTigJlzIHBvc3NpYmxlIHRoYXQgeW914oCZZCBu
ZXZlciBnZXQgbW9yZSB0aGFuIGEgc2luZ2xlIG9uZSBpbiBhIGxhdGVuY3ktY3JpdGljYWwgSVJR
IHJvdXRpbmU7IGFuZCBhcyBzdWNoLCB0aGUgdmFyaWF0aWJpbGl0eSBpbiBleGVjdXRpb24gdGlt
ZSAoaml0dGVyKSB3b3VsZG7igJl0IGJlIGFuIGlzc3VlIGluIHByYWN0aWNlLiAgQnV0IGV2ZXJ5
IHRpbWUgeW91IGFkZCBhIG5ldyB1bmJsb2NrYWJsZSBJUEksIHlvdSBpbmNyZWFzZSB0aGlzIGpp
dHRlcjsgcGFydGljdWxhcmx5IGlmIHRoaXMgdW5ibG9ja2FibGUgSVBJIG1pZ2h0IGJlIHJlcGVh
dGVkIGFuIGFyYml0cmFyeSBudW1iZXIgb2YgdGltZXMuDQoNCihTdGVmYW5vLCBsZXQgbWUga25v
dyBpZiBJ4oCZdmUgbWlzdW5kZXJzdG9vZCBzb21ldGhpbmcuKQ0KDQpTbyBzdGVwcGluZyBiYWNr
IGEgbW9tZW50LCBoZXJl4oCZcyBhbGwgdGhlIHBvc3NpYmxlIGlkZWFzIHRoYXQgSSB0aGluayBo
YXZlIGJlZW4gZGlzY3Vzc2VkIChvciBhcmUgdGhlcmUgaW1wbGljaXRseSkgc28gZmFyLg0KDQox
LiBbRGVmYXVsdF0gRG8gbm90aGluZzsgZ3Vlc3RzIHVzaW5nIHRoaXMgcmVnaXN0ZXIgY29udGlu
dWUgY3Jhc2hpbmcNCg0KMi4gTWFrZSB0aGUgST9BQ1RJVkVSIHJlZ2lzdGVycyBSWldJLg0KDQoz
LiBNYWtlIEk/QUNUSVZFUiByZXR1cm4gdGhlIG1vc3QgcmVjZW50IGtub3duIHZhbHVlOyBpLmUu
IEtWTeKAmXMgY3VycmVudCBiZWhhdmlvciAoYXMgZmFyIGFzIHdlIHVuZGVyc3RhbmQgaXQpDQoN
CjQuIFVzZSBhIHNpbXBsZSBJUEkgd2l0aCBkb19ub29wIHRvIHVwZGF0ZSBJP0FDVElWRVINCg0K
NGEuICBVc2UgYW4gSVBJLCBidXQgY29tZSB1cCB3aXRoIGNsZXZlciB0cmlja3MgdG8gYXZvaWQg
aW50ZXJydXB0aW5nIGd1ZXN0cyBoYW5kbGluZyBJUlFzLg0KDQo1LiBUcmFwIHRvIFhlbiBvbiBn
dWVzdCBFT0ksIHNvIHRoYXQgd2Uga25vdyB3aGVuIHRoZSANCg0KNi4gU29tZSBjbGV2ZXIgcGFy
YXZpcnR1YWxpemVkIG9wdGlvbg0KDQpPYnZpb3VzbHkgbm9ib2R5IHdhbnRzICMxLCBhbmQgIzMg
aXMgY2xlYXJseSBub3QgcmVhbGx5IGFuIG9wdGlvbiBub3cgZWl0aGVyLg0KDQojMiBpcyBub3Qg
Z3JlYXQsIGJ1dCBpdOKAmXMgc2ltcGxlIGFuZCBxdWljayB0byBpbXBsZW1lbnQgZm9yIG5vdy4g
IEp1bGllbiwgSeKAmW0gbm90IHN1cmUgeW91ciBwb3NpdGlvbiBvbiB0aGlzIG9uZTogWW91IHJl
amVjdGVkIHRoZSBpZGVhIGJhY2sgaW4gdjEgb2YgdGhpcyBwYXRjaCBzZXJpZXMsIGJ1dCBzZWVt
ZWQgdG8gcmVmZXIgdG8gaXQgYWdhaW4gZWFybGllciBpbiB0aGlzIHRocmVhZC4NCg0KIzQgaXMg
cmVsYXRpdmVseSBxdWljayB0byBpbXBsZW1lbnQgYSDigJxkdW1i4oCdIHZlcnNpb24sIGJ1dCBz
dWNoIGEg4oCcZHVtYuKAnSB2ZXJzaW9uIGhhcyBhIGhpZ2ggcmlzayBvZiBjYXVzaW5nIHVuYWNj
ZXB0YWJsZSBqaXR0ZXIgKG9yIGF0IGxlYXN0LCBzbyBTdGVmYW5vIGJlbGlldmVzKS4NCg0KIzRh
IG9yICM2IGFyZSBmdXJ0aGVyIHBvdGVudGlhbCBsaW5lcyB0byBleHBsb3JlLCBidXQgd291bGQg
cmVxdWlyZSBhIGxvdCBvZiBhZGRpdGlvbmFsIGRlc2lnbiB0byBnZXQgd29ya2luZyByaWdodC4N
Cg0KSSB0aGluayBpZiBJIHVuZGVyc3RhbmQgU3RlZmFub+KAmXMgUG9WLCB0aGVuICM1IHdvdWxk
IGFjdHVhbGx5IGJlIGFjY2VwdGFibGUg4oCUIHRoZSBvdmVyYWxsIGFtb3VudCBvZiB0aW1lIHNw
ZW50IGluIHRoZSBoeXBlcnZpc29yIHdvdWxkIHByb2JhYmx5IGJlIGdyZWF0ZXIsIGJ1dCBpdCB3
b3VsZCBiZSBib3VuZGVkIGFuZCBwcmVkaWN0YWJsZTogb25jZSBzb21lb25lIGdvdCB0aGVpciBJ
UlEgaGFuZGxlciB3b3JraW5nIHJlbGlhYmx5LCBpdCB3b3VsZCBsaWtlbHkgY29udGludWUgdG8g
d29yay4NCg0KSXQgc291bmRzIGxpa2UgIzUgbWlnaHQgYmUgcHJldHR5IHF1aWNrIHRvIGltcGxl
bWVudDsgYW5kIHRoZW4gYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlIGlmIHNvbWVvbmUgd2Fu
dHMgdG8gaW1wcm92ZSBwZXJmb3JtYW5jZSwgdGhleSBjYW4gd29yayBvbiA0YSBvciA2Lg0KDQpB
bnkgdGhvdWdodHM/ICBBbnl0aGluZyBJ4oCZbSBtaXNzaW5nPw0KDQogLUdlb3JnZQ==

