Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD719C8BA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 20:22:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK4T3-0001rV-A4; Thu, 02 Apr 2020 18:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c8Ny=5S=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jK4T1-0001rN-F1
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 18:21:27 +0000
X-Inumbo-ID: c347b250-750e-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c347b250-750e-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585851686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RtEitIk98VtKmS0olg/hamwlT2FfwvLItu5dTeyNIEM=;
 b=J2mU8o3PY/3qwaOFbnSyk7PrbkYG5pHxVI8bkhdQey1dz6bvTfM06vYf
 yycT7NB8Djdd4+EtXG/yuI0WC+AjawX9qpUZZsfSyFzSLQvh/7Lw2zoSK
 crcQcaz+nH37DGjipCKRfqoERtGQgfbtAkMQqGj0DoTs8Q+8YUzo530j6 o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qAz8DOZtXF27NGIFv0GvcBb/aF6lhHntsM0cllxTNU6kuVoe2iUS5V3BOaBSZUOEa8N5oD/4tl
 wLgAhzjHEvtV/x+mc/OCqLVKt5YHqJbzhACdL1jKwCQJ9sBD542tWZEtRWhfWRLvmLPV8HoQaY
 IQ/6+RB2uy5d/kZhTJo+fariU7ybDJ7MApnXIGzrx93m09X+unmAybzktDlDnQRiIH6M3WHLJr
 KWlm48ONk4GAzrBhnbLzsyZoZjc6s6VW4TntPwNi7uPGwwZk9T4XNnFXYt+aNM+ER847CeCxOy
 aGw=
X-SBRS: 2.7
X-MesageID: 15100624
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,336,1580792400"; d="scan'208";a="15100624"
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 1/2] xen: credit2: avoid vCPUs to ever reach lower
 credits than idle
Thread-Topic: [PATCH v2 1/2] xen: credit2: avoid vCPUs to ever reach lower
 credits than idle
Thread-Index: AQHV/YMCTAYYiKTeNUaPDRpZJQiNcqhmGmuA
Date: Thu, 2 Apr 2020 18:21:11 +0000
Message-ID: <2645C51C-5994-4FCC-9042-BBC86FA5A22A@citrix.com>
References: <158457508246.11355.6457403441669388939.stgit@Palanthas>
 <158457671301.11355.1086453211878144633.stgit@Palanthas>
In-Reply-To: <158457671301.11355.1086453211878144633.stgit@Palanthas>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8AEB96BF84DD647A531C446BAAFFA4E@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>, Jan
 Beulich <jbeulich@suse.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWFyIDE5LCAyMDIwLCBhdCAxMjoxMSBBTSwgRGFyaW8gRmFnZ2lvbGkgPGRmYWdn
aW9saUBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGVyZSBoYXZlIGJlZW4gcmVwb3J0IG9mIHN0
YWxscyBvZiBndWVzdCB2Q1BVcywgd2hlbiBDcmVkaXQyIHdhcyB1c2VkLg0KPiBJdCBzZWVtZWQg
bGlrZSB0aGVzZSB2Q1BVcyB3ZXJlIG5vdCBnZXR0aW5nIHNjaGVkdWxlZCBmb3IgdmVyeSBsb25n
DQo+IHRpbWUsIGV2ZW4gdW5kZXIgbGlnaHQgbG9hZCBjb25kaXRpb25zIChlLmcuLCBkdXJpbmcg
ZG9tMCBib290KS4NCj4gDQo+IEludmVzdGlnYXRpb25zIGxlZCB0byB0aGUgZGlzY292ZXJ5IHRo
YXQgLS1hbHRob3VnaCByYXJlbHktLSBpdCBjYW4NCj4gaGFwcGVuIHRoYXQgYSB2Q1BVIG1hbmFn
ZXMgdG8gcnVuIGZvciB2ZXJ5IGxvbmcgdGltZXNsaWNlcy4gSW4gQ3JlZGl0MiwNCj4gdGhpcyBt
ZWFucyB0aGF0LCB3aGVuIHJ1bnRpbWUgYWNjb3VudGluZyBoYXBwZW5zLCB0aGUgdkNQVSB3aWxs
IGxvc2UgYQ0KPiBsYXJnZSBxdWFudGl0eSBvZiBjcmVkaXRzLiBUaGlzIGluIHR1cm4gbWF5IGxl
YWQgdG8gdGhlIHZDUFUgaGF2aW5nIGxlc3MNCj4gY3JlZGl0cyB0aGFuIHRoZSBpZGxlIHZDUFVz
ICgtMl4zMCkuIEF0IHRoaXMgcG9pbnQsIHRoZSBzY2hlZHVsZXIgd2lsbA0KPiBwaWNrIHRoZSBp
ZGxlIHZDUFUsIGluc3RlYWQgb2YgdGhlIHJlYWR5IHRvIHJ1biB2Q1BVLCBmb3IgYSBmZXcNCj4g
ImVwb2NocyIsIHdoaWNoIG9mdGVuIHRpbWVzIGlzIGVub3VnaCBmb3IgdGhlIGd1ZXN0IGtlcm5l
bCB0byB0aGluayB0aGUNCj4gdkNQVSBpcyBub3QgcmVzcG9uZGluZyBhbmQgY3Jhc2hpbmcuDQo+
IA0KPiBBbiBleGFtcGxlIG9mIHRoaXMgc2l0dWF0aW9uIGlzIHNob3duIGhlcmUuIEluIGZhY3Qs
IHdlIGNhbiBzZWUgZDB2MQ0KPiBzaXR0aW5nIGluIHRoZSBydW5xdWV1ZSB3aGlsZSBhbGwgdGhl
IENQVXMgYXJlIGlkbGUsIGFzIGl0IGhhcw0KPiAtMTI1NDIzODI3MCBjcmVkaXRzLCB3aGljaCBp
cyBzbWFsbGVyIHRoYW4gLTJeMzAgPSDiiJIxMDczNzQxODI0Og0KPiANCj4gICAgKFhFTikgUnVu
cXVldWUgMDoNCj4gICAgKFhFTikgICBuY3B1cyAgICAgICAgICAgICAgPSAyOA0KPiAgICAoWEVO
KSAgIGNwdXMgICAgICAgICAgICAgICA9IDAtMjcNCj4gICAgKFhFTikgICBtYXhfd2VpZ2h0ICAg
ICAgICAgPSAyNTYNCj4gICAgKFhFTikgICBwaWNrX2JpYXMgICAgICAgICAgPSAyMg0KPiAgICAo
WEVOKSAgIGluc3Rsb2FkICAgICAgICAgICA9IDENCj4gICAgKFhFTikgICBhdmVsb2FkICAgICAg
ICAgICAgPSAyOTMzOTEgKH4xMTElKQ0KPiAgICAoWEVOKSAgIGlkbGVyczogMDAsMDAwMDAwMDAs
MDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMGZmZmZmZmYNCj4gICAgKFhFTikg
ICB0aWNrbGVkOiAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAw
MCwwMDAwMDAwMA0KPiAgICAoWEVOKSAgIGZ1bGx5IGlkbGUgY29yZXM6IDAwLDAwMDAwMDAwLDAw
MDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDBmZmZmZmZmDQo+ICAgIFsuLi5dDQo+
ICAgIChYRU4pIFJ1bnF1ZXVlIDA6DQo+ICAgIChYRU4pIENQVVswMF0gcnVucT0wLCBzaWJsaW5n
PTAwLC4uLiwgY29yZT0wMCwuLi4NCj4gICAgKFhFTikgQ1BVWzAxXSBydW5xPTAsIHNpYmxpbmc9
MDAsLi4uLCBjb3JlPTAwLC4uLg0KPiAgICBbLi4uXQ0KPiAgICAoWEVOKSBDUFVbMjZdIHJ1bnE9
MCwgc2libGluZz0wMCwuLi4sIGNvcmU9MDAsLi4uDQo+ICAgIChYRU4pIENQVVsyN10gcnVucT0w
LCBzaWJsaW5nPTAwLC4uLiwgY29yZT0wMCwuLi4NCj4gICAgKFhFTikgUlVOUToNCj4gICAgKFhF
TikgICAgIDA6IFswLjFdIGZsYWdzPTAgY3B1PTUgY3JlZGl0PS0xMjU0MjM4MjcwIFt3PTI1Nl0g
bG9hZD0yNjIxNDQgKH4xMDAlKQ0KPiANCj4gV2UgY2VydGFpbmx5IGRvbid0IHdhbnQsIHVuZGVy
IGFueSBjaXJjdW1zdGFuY2UsIHRoaXMgdG8gaGFwcGVuLg0KPiBMZXQncywgdGhlcmVmb3JlLCBk
ZWZpbmUgYSBtaW5pbXVtIGFtb3VudCBvZiBjcmVkaXRzIGEgdkNQVSBjYW4gaGF2ZS4NCj4gRHVy
aW5nIGFjY291bnRpbmcsIHdlIG1ha2Ugc3VyZSB0aGF0LCBmb3IgaG93ZXZlciBsb25nIHRoZSB2
Q1BVIGhhcw0KPiBydW4sIGl0IHdpbGwgbmV2ZXIgZ2V0IHRvIGhhdmUgbGVzcyB0aGFuIHN1Y2gg
bWluaW11bSBhbW91bnQgb2YNCj4gY3JlZGl0cy4gVGhlbiwgd2Ugc2V0IHRoZSBjcmVkaXRzIG9m
IHRoZSBpZGxlIHZDUFUgdG8gYW4gZXZlbg0KPiBzbWFsbGVyIHZhbHVlLg0KPiANCj4gTk9URTog
aW52ZXN0aWdhdGlvbnMgaGF2ZSBiZWVuIGRvbmUgYWJvdXQgX2hvd18gaXQgaXMgcG9zc2libGUg
Zm9yIGENCj4gdkNQVSB0byBleGVjdXRlIGZvciBzbyBtdWNoIHRpbWUgdGhhdCBpdHMgY3JlZGl0
cyBiZWNvbWVzIHNvIGxvdy4gV2hpbGUNCj4gc3RpbGwgbm90IGNvbXBsZXRlbHkgY2xlYXIsIHRo
ZXJlIGFyZSBldmlkZW5jZSB0aGF0Og0KPiAtIGl0IG9ubHkgaGFwcGVucyB2ZXJ5IHJhcmVseSwN
Cj4gLSBpdCBhcHBlYXJzIHRvIGJlIGJvdGggbWFjaGluZSBhbmQgd29ya2xvYWQgc3BlY2lmaWMs
DQo+IC0gaXQgZG9lcyBub3QgbG9vayB0byBiZSBhIENyZWRpdDIgKGUuZy4sIGFzIGl0IGhhcHBl
bnMgd2hlbg0KPiAgcnVubmluZyB3aXRoIENyZWRpdDEgYXMgd2VsbCkgaXNzdWUsIG9yIGEgc2No
ZWR1bGVyIGlzc3VlLg0KPiANCj4gVGhpcyBwYXRjaCBtYWtlcyBDcmVkaXQyIG1vcmUgcm9idXN0
IHRvIGV2ZW50cyBsaWtlIHRoaXMsIHdoYXRldmVyDQo+IHRoZSBjYXVzZSBpcywgYW5kIHNob3Vs
ZCBoZW5jZSBiZSBiYWNrcG9ydGVkIChhcyBmYXIgYXMgcG9zc2libGUpLg0KPiANCj4gUmVwb3J0
ZWQtYnk6IEdsZW4gPGdsZW5iYXJuZXlAZ21haWwuY29tPg0KPiBSZXBvcnRlZC1ieTogVG9tYXMg
TW96ZXMgPGh5ZHJhcG9saWNAZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdn
aW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0KDQo=

