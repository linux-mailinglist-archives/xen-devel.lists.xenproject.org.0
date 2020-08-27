Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E190E254336
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:12:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBEsV-0003Rh-UC; Thu, 27 Aug 2020 10:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBEsU-0003Qq-Fc
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:11:30 +0000
X-Inumbo-ID: bf4dc467-5025-4055-9cab-cf5fafdd2bf0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf4dc467-5025-4055-9cab-cf5fafdd2bf0;
 Thu, 27 Aug 2020 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598523087;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/gIlGYDUmmbDzzvjQ9dBEsi5zrEmyTvKsC5szadHVlc=;
 b=aYfT252wHXYi6CltIuShmcmW/kyhMjR/csOXm4MU909Kqg1RBN9u+qSD
 u/U1MVRUdpxoVtXB7fFbaA6ArqrIsmshMF7z2BvVByzYwWHhc+CsJ0sLr
 LhcpiqdeerEsTf2W4Z5YEMpzFne+vrayRGKz04Z3l9NiK8+iCj66cB/em E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2B00jWYnRM2lSSQnfAbfp8kxhLt7BzY7saadot8rzJf5RO5iWShXxLyP3wlbxxKnH6fHyKCVRw
 ALk3xuyPGs74dLE0RYV8FXYNRc/sCY3Pq9ULvlSfcCN1+S8LNmv/fIkwm58zBuKvydKvnqtLgC
 WP05yWqIfvlZh7OUYs2RsR1BFbcqzDrK2lBu5WAiQ6cu2xI2RzY3/eimMSqc6zLvaJQ50sd8Qj
 ouf3d4y8KKsxqruVnGR/SkztHdN+4XdPBHUqxTUh7GRgcnJt7dh9X3l3X5zvyKPZaZMvJlORng
 ryU=
X-SBRS: 2.7
X-MesageID: 25745917
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,359,1592884800"; d="scan'208";a="25745917"
From: Edwin Torok <edvin.torok@citrix.com>
To: "wl@xen.org" <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>, "dave@recoil.org" <dave@recoil.org>, 
 Christian Lindig <christian.lindig@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Thread-Topic: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Thread-Index: AQHWcof9A1jzs+tlWE2C9n9b/FTKaqk8JPMAgAE2tICAACCugIAANogAgA3zJYCAAAg6AA==
Date: Thu, 27 Aug 2020 10:11:22 +0000
Message-ID: <27df4a82de4dcb15bfa78c43b185be16819d13c3.camel@citrix.com>
References: <cover.1597439193.git.edvin.torok@citrix.com>
 <1597668966374.91968@citrix.com>
 <cbb2742191e9c1303fdfd95feef4d829ecf33a0d.camel@citrix.com>
 <1597742707142.74318@citrix.com>
 <cd17508f-b170-3e3c-d8d3-26e827f7492a@citrix.com>
 <20200827094155.mrsghjnmjc72ab6q@liuwe-devbox-debian-v2>
In-Reply-To: <20200827094155.mrsghjnmjc72ab6q@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABEBB832852EFE43B659ACEDC40D188E@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDIwLTA4LTI3IGF0IDA5OjQxICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBPbiBU
dWUsIEF1ZyAxOCwgMjAyMCBhdCAwMTo0MDoxOFBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPiA+IE9uIDE4LzA4LzIwMjAgMTA6MjUsIENocmlzdGlhbiBMaW5kaWcgd3JvdGU6DQo+ID4g
PiBJIHNlZSBsaXR0bGUgcmVhc29uIHRvIHN1cHBvcnQgb2xkIE9DYW1sIHJlbGVhc2VzIGFuZCBy
ZXF1aXJpbmcNCj4gPiA+IE9DYW1sIDQuMDYgd291bGQgYmUgZmluZSB3aXRoIG1lIGJ1dCBJIGFz
c3VtZSB0aGF0IHRoZSBwcm9qZWN0DQo+ID4gPiBtaWdodCBoYXZlIGl0cyBvd24gaWRlYXMgYWJv
dXQgdGhpcy4NCj4gPiA+IA0KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiA+ID4gRnJvbTogRWR3aW4gVG9yb2sNCj4gPiA+IFNlbnQ6IDE4IEF1Z3VzdCAy
MDIwIDA4OjI4DQo+ID4gPiBUbzogQ2hyaXN0aWFuIExpbmRpZzsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnDQo+ID4gPiBDYzogSWFuIEphY2tzb247IGRhdmVAcmVjb2lsLm9yZzsgd2xA
eGVuLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwLzZdIHRvb2xzL29jYW1sL3hl
bnN0b3JlZDogc2ltcGxpZnkgY29kZQ0KPiA+ID4gDQo+ID4gPiBPbiBNb24sIDIwMjAtMDgtMTcg
YXQgMTQ6NTYgKzAyMDAsIENocmlzdGlhbiBMaW5kaWcgd3JvdGU6DQo+ID4gPiA+IFRoaXMgYWxs
IGxvb2tzIGdvb2QgLSBJIGxlZnQgYSBzbWFsbCBjb21tZW50IG9uIG9uZSBvZiB0aGUNCj4gPiA+
ID4gcGF0Y2hlcw0KPiA+ID4gPiBhbmQgSSBhZ3JlZSB0aGF0IHRoaXMgbmVlZHMgdGVzdGluZy4g
SSBhbHNvIHdvbmRlciBhYm91dA0KPiA+ID4gPiBjb21wYXRpYmlsaXR5IHdpdGggZWFybGllciBP
Q2FtbCByZWxlYXNlcyB0aGF0IHdlIHN1cHBvcnQgYnV0IEkNCj4gPiA+ID4gc2VlDQo+ID4gPiA+
IG5vIHJlYWwgb2JzdGFjbGVzLg0KPiA+ID4gPiANCj4gPiA+IEkndmUgZGV2ZWxvcGVkIHRoZSBz
ZXJpZXMgdXNpbmcgT0NhbWwgNC4wOC4xLiBJIHRoaW5rIHRoZSBuZXdlc3QNCj4gPiA+IGZlYXR1
cmUgSSB1c2VkIHdhcyBNYXAudXBkYXRlIChPQ2FtbCA0LjA2LCBuZWFybHkgMyB5ZWFycyBhZ28p
Lg0KPiA+ID4gTG9va2luZyB0aHJvdWdoIGh0dHBzOi8vcmVwb2xvZ3kub3JnL3Byb2plY3Qvb2Nh
bWwvdmVyc2lvbnMgSSdtDQo+ID4gPiBub3QNCj4gPiA+IHN1cmUgaWYgd2UgY2FuIHJlcXVpcmUg
bW9yZSB0aGFuIDQuMDUgdGhvdWdoLg0KPiA+ID4gVGhlIFJFQURNRSBpbiBYZW4gZG9lc24ndCBz
cGVjaWZ5IGEgbWluaW11bSB2ZXJzaW9uLCBidXQNCj4gPiA+IGNvbmZpZ3VyZQ0KPiA+ID4gY2hl
Y2tzIGZvciA+PTQuMDIuDQo+ID4gPiANCj4gPiA+IEkgY2FuIHRyeSB0byBiYWNrcG9ydCBteSBz
ZXJpZXMgdG8gT0NhbWwgNC4wNSAodG8gdXNlDQo+ID4gPiBNYXAuZmluZF9vcHQNCj4gPiA+IGlu
c3RlYWQgb2YgTWFwLnVwZGF0ZSkgYW5kIHVwZGF0ZSB0aGUgY29uZmlndXJlIGNoZWNrIHRvIHJl
cXVpcmUNCj4gPiA+IDQuMDUuDQo+ID4gPiBJdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBiYWNrcG9y
dCBldmVuIGZ1cnRoZXIgdG8gNC4wMiBieQ0KPiA+ID4gaW50cm9kdWNpbmcNCj4gPiA+IGFkZGl0
aW9uYWwgaW5lZmZpY2llbmNpZXMgKE1hcC5tZW0gKyBNYXAuZmluZCB3b3VsZCB0cmF2ZXJzZSB0
aGUNCj4gPiA+IG1hcA0KPiA+ID4gdHdpY2UsIGFuZCBNYXAuZmluZCBvbiBpdHMgb3duIHdvdWxk
IHJhaXNlIGFuIGV4Y2VwdGlvbiBvbiBOb3QNCj4gPiA+IGZvdW5kLA0KPiA+ID4gd2hpY2ggaXMg
bW9yZSBjb3N0bHkgdGhhbiByZXR1cm5pbmcgTm9uZSBpbiBNYXAuZmluZF9vcHQpLCBJJ2QNCj4g
PiA+IGF2b2lkDQo+ID4gPiBkb2luZyB0aGF0Lg0KPiA+ID4gDQo+ID4gPiBYZW4ncyBDSSBmcm9t
IGF1dG9tYXRpb24gbWlnaHQgbmVlZCBzb21lIHVwZGF0ZXMgdG8gdXNlIGxhdGVzdA0KPiA+ID4g
c3RhYmxlDQo+ID4gPiB2ZXJzaW9uczoNCj4gPiA+ICogRmVkb3JhIDI5IGlzIEVPTCwgc2hvdWxk
IHVzZSBhdCBsZWFzdCBGZWRvcmEgMzENCj4gPiA+ICogRGViaWFuIEplc3NpZSBpcyBFT0wuIFN0
cmV0Y2ggaXMgcHJlc2VudCwgYnV0IEJ1c3RlciBpcyBtaXNzaW5nDQo+ID4gDQo+ID4gV2UncmUg
d29ya2luZyBvbiB0aGUgQ0kgbG9vcC4NCj4gPiANCj4gPiBBcyBtYWludGFpbmVyLCBpdCBpcyB1
bHRpbWF0ZWx5IENocmlzdGlhbidzIGNob2ljZSB0byBhcyB0byBpZi93aGVuDQo+ID4gdG8NCj4g
PiBidW1wIHRoZSBtaW5pbXVtIHZlcnNpb25zLg0KPiA+IA0KPiA+IA0KPiA+IEFzIGEgZ2VuZXJh
bCBydWxlLCB3ZSBkb24ndCB3YW50IHRvIGJlIHN1ZmZpY2llbnRseSBibGVlZGluZyBlZGdlDQo+
ID4gdG8NCj4gPiBydWxlIG91dCBpbi11c2UgZGlzdHJvcy4gIEkgaGF2ZSBubyBpZGVhIGlmIDQu
MDYgaXMgb2sgdGhlcmUsIG9yDQo+ID4gd2hldGhlcg0KPiA+IGl0IGlzIHRvbyBuZXcuICBUaGVu
IGFnYWluLCB0aGUgT2NhbWwgY29tcG9uZW50cyBhcmUgc3RyaWN0bHkNCj4gPiBvcHRpb25hbA0K
PiA+IHNvIGl0IGlzIHBlcmhhcHMgbGVzcyBpbXBvcnRhbnQuDQo+ID4gDQo+ID4gV2hhdGV2ZXIg
aGFwcGVucyBXUlQgdmVyc2lvbiwgdGhlIGNvbmZpZ3VyZSBjaGFuZ2Ugc2hvdWxkIG9jY3VyDQo+
ID4gYmVmb3JlDQo+ID4gY2hhbmdlcyBpbiB0aGUgY29kZSB3aGljaCB3b3VsZCBmYWlsIG9uIG9s
ZGVyIHZlcnNpb25zLg0KPiANCj4gWWVzIEkgd291bGQgbGlrZSB0byBzZWUgdGhlIGJ1bXAgaGFw
cGVuIGJlZm9yZSBhcHBseWluZyBhIHZlcnNpb24gb2YNCj4gdGhpcyBzZXJpZXMgdG9vLg0KDQpJ
IGhhdmUgYSBicmFuY2ggdGhhdCByZW1vdmVzIHRoZSByZXF1aXJlbWVudCBvbiA0LjA2IGZyb20g
dGhlIHNlcmllcywNCmFuZCB0aGVuIGhhdmUgYSBzZXBhcmF0ZSBvbmUgdGhhdCBidW1wcyB0byA0
LjA2IGFuZCByZW1vdmVzIHRoZQ0KcmVkdW5kYW50IGFuZCBpbmVmZmljaWVudCB3b3JrYXJvdW5k
Lg0KSW4gdGhlIGVuZCBJIG9ubHkgaGFkIHRvIGJhY2twb3J0IDIgZnVuY3Rpb25zOiBNYXAuZmlu
ZF9vcHQgYW5kDQpNYXAudXBkYXRlLg0KDQpXaWxsIHNlbmQgb3V0IHRoZSB1cGRhdGVkIHNlcmll
cyBmb3IgcmV2aWV3IG9uY2UgSSd2ZSBkb25lIHNvbWUgbW9yZQ0KdGVzdGluZyBvbiBpdC4NCg0K
QmVzdCByZWdhcmRzLA0KLS1FZHdpbg0KDQo+IA0KPiBXZWkuDQo+IA0KPiA+IH5BbmRyZXcNCg==

