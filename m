Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE110A42A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 19:46:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZfnO-0001vM-6p; Tue, 26 Nov 2019 18:42:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZfnN-0001vH-40
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 18:42:41 +0000
X-Inumbo-ID: 85f3e492-107c-11ea-83b8-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85f3e492-107c-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574793761; x=1606329761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=TDobQZBvURBLjs2ZTDQ1CeNhercmymvq9cm+TJMmGIE=;
 b=lgjvwWoWfH3JdZRpPmtvE9SE3EhssU7t9vZv5WS+KO+++bzi1X+AddoY
 OsOPcLlGG6cOMS/U+C2tuJRtgwhw3bVcBx2zlnXCayhX3gdmKAeV5BCn1
 raap0duKNNBfWzgwQe2wemRzRaluvvkyznaPQ4MXoI6cb0prIBPHNzluf Y=;
IronPort-SDR: ABG90HuXRMMlLkXHGkBSFB+RGiOX/t8HDnqP+McMKFuPPO8/izvfvc/arUZgsJRRIDCOGOHBDo
 xQwzZ5R72clg==
X-IronPort-AV: E=Sophos;i="5.69,246,1571702400"; 
   d="scan'208";a="1623917"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 26 Nov 2019 18:37:50 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0FBD3A1D6B; Tue, 26 Nov 2019 18:37:49 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 18:37:48 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 18:37:47 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 26 Nov 2019 18:37:47 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: livepatch-build-tools regression
Thread-Index: AQHVni9ReRquixYoHEOXl3oCOkZoJaeRI0wAgAAGFwCAAAVUAIAAA80AgAGMj4CAATPFAIAJ1PUAgAANBQA=
Date: Tue, 26 Nov 2019 18:37:47 +0000
Message-ID: <CF690FB1-DF59-44B3-AB3F-B2101617826E@amazon.com>
References: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
 <DD847497-6517-4668-9AD6-66F11B91288A@amazon.com>
 <b686f6b2-96e4-6f41-7844-bb0ab184cc71@citrix.com>
 <D092B667-0662-4B8E-958E-02B14530C363@amazon.com>
 <d65106c4-e35d-bd69-0539-a7fb525ae776@citrix.com>
 <1A2AE077-662E-40C0-820D-13EC3B88D1F3@amazon.com>
 <69cbfa61-fae3-ee6a-b482-31cca7f05d60@citrix.com>
 <60D2D242-4806-402F-99BC-F0CE572E5925@amazon.com>
In-Reply-To: <60D2D242-4806-402F-99BC-F0CE572E5925@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.67]
Content-ID: <1C58C021D5F469409982F227FEAFB7B1@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] livepatch-build-tools regression
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Paraschiv, Andra-Irina" <andraprs@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "Pohlack, 
 Martin" <mpohlack@amazon.de>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Manthey, Norbert" <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Doebel,
 Bjoern" <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgbG9va3MgbGlrZSBnY2MgcGxheXMgdGhlIHVzdWFsIGRpcnR5IHRyaWNrcyB3aXRoIGxvY2Fs
IHZhcmlhYmxlcyByZW5hbWluZzoNCg0KLSB4ZW4tc3ltcw0KICA3NTI5OiBmZmZmODJkMDgwNWZl
ZDUwICAgICA4IE9CSkVDVCAgTE9DQUwgIERFRkFVTFQgNDIzMCBsYXN0cGFnZS4yMjg1Nw0KLSBs
aXZlcGF0Y2gNCiAgIDI4OTogMDAwMDAwMDAwMDAwMDAwMCAgICAgOCBPQkpFQ1QgIEdMT0JBTCBE
RUZBVUxUICBVTkQgaHZtLmMjbGFzdHBhZ2UuMjI4NTYNCg0KVGhlbiwgc3ltYm9scyByZXNvbHV0
aW9uIGJ5IG5hbWUgZmFpbHMuLg0KDQpDYW4geW91IHBsZWFzZSB0cnkgdG8gYnVpbGQgdGhlIGxp
dmVwYXRjaCBtb2R1bGUgd2l0aCBhZGRpdGlvbmFsIG9wdGlvbiAn4oCUcHJlbGluaycgYW5kIGdp
dmUgaXQgYSB0cnkgPw0KDQo+IE9uIDI2LiBOb3YgMjAxOSwgYXQgMTg6NTEsIFdpZWN6b3JraWV3
aWN6LCBQYXdlbCA8d2lwYXdlbEBhbWF6b24uZGU+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24g
MjAuIE5vdiAyMDE5LCBhdCAxMjo0MiwgU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRy
aXguY29tPiB3cm90ZToNCj4+IA0KPj4gT24gMTkvMTEvMjAxOSAxNzoyMSwgV2llY3pvcmtpZXdp
Y3osIFBhd2VsIHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+PiBPbiAxOC4gTm92IDIwMTksIGF0IDE4
OjQxLCBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+
PiANCj4+Pj4gT24gMTgvMTEvMjAxOSAxNzoyOCwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3Rl
Og0KPj4+Pj4gDQo+Pj4+PiBDb3VsZCB5b3UgYnVpbGQgdGhlIGxwIHdpdGggZGVidWcgKC1kKSBh
bmQgcHJvdmlkZSBtZSB3aXRoIHRoZSBjcmVhdGUtZGlmZi1vYmplY3QubG9nIGZpbGU/DQo+Pj4+
PiANCj4+Pj4gDQo+Pj4+IEkndmUgYXR0YWNoZWQgdGhlIGxvZy4gQnR3LCBJIHRoaW5rIEkgcHJv
dmlkZWQgYWxsIHRoZSBuZWNlc3NhcnkgaW5mb3JtYXRpb24NCj4+Pj4gZm9yIG90aGVycyB0byBy
ZXBlYXQgbXkgZXhwZXJpbWVudC4NCj4+Pj4gDQo+Pj4gDQo+Pj4gU29ycnkgZm9yIGFub3RoZXIg
cmVxdWVzdCwgYnV0IEkgZG8gbm90IHNlZW0gdG8gYmUgYWJsZSB0byByZXByb2R1Y2UgdGhpcyBs
b2NhbGx5Lg0KPj4+IENvdWxkIHlvdSBzZW5kIG1lIHRoZSBsaXZlcGF0Y2ggbW9kdWxlIGJpbmFy
eSB0aGF0IGZhaWxzIHRvIHVwbG9hZD8NCj4+IA0KPj4gVGhhdCdzIGludGVyZXN0aW5nLiBJJ3Zl
IGF0dGFjaGVkIHRoZSBiaW5hcnkgdGhhdCBteSBzeXN0ZW0gcHJvZHVjZXMuDQo+PiBXaGF0IHZl
cnNpb24gb2YgZ2NjIGRvIHlvdSB1c2U/DQo+IA0KPiBUaGUgdmVyc2lvbiB1c2VkIHdhczogZ2Nj
IChHQ0MpIDcuMi4xIDIwMTcwOTE1DQo+IA0KPiBCdXQgSSBoYXZlIGZpbmFsbHkgbWFuYWdlZCB0
byByZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGg6DQo+IDEuIGdjYyAoVWJ1bnR1IDYuNS4wLTJ1YnVu
dHUxfjE4LjA0KSA2LjUuMCAyMDE4MTAyNg0KPiAyLiBnY2MtNyAoVWJ1bnR1IDcuNC4wLTF1YnVu
dHUxfjE4LjA0LjEpIDcuNC4wDQo+IA0KPiBJIHRoaW5rIGl0IGlzIG5vdCByZWxhdGVkIHRvIHRo
ZSBjb21taXQ6DQo+IGNvbW1pdCA4NTRhN2NhNjBlMzUgImNyZWF0ZS1kaWZmLW9iamVjdDogRG8g
bm90IGluY2x1ZGUgYWxsIC5yb2RhdGEgc2VjdGlvbnMiDQo+IA0KPiBJIG1hbmFnZWQgdG8gcmVw
cm9kdWNlIGl0IGFsc28gd2l0aCBlYXJsaWVyIHZlcnNpb24gY29tbWl0Og0KPiAiMGMxMDQ1NyBS
ZW1vdmUgc2VjdGlvbiBhbGlnbm1lbnQgcmVxdWlyZW1lbnQiDQo+IA0KPiBCdXQgdGhpcyB0aW1l
IGEgZGlmZmVyZW50IHN5bWJvbCBjYXVzZXMgdGhlIGZhaWx1cmU6DQo+IA0KPiAoWEVOKSBsaXZl
cGF0Y2g6IDAwMDEtbGl2ZS1wYXRjaDogVW5rbm93biBzeW1ib2w6IGh2bS5jI2xhc3RwYWdlLjIy
ODU2DQo+IA0KPj4gDQo+PiAtLQ0KPj4gVGhhbmtzLA0KPj4gU2VyZ2V5DQo+PiA8MDAwMS1saXZl
LXBhdGNoLXN0cmlwcGVkLmxpdmVwYXRjaD4NCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gUGF3ZWwg
V2llY3pvcmtpZXdpY3oNCg0KQmVzdCBSZWdhcmRzLA0KUGF3ZWwgV2llY3pvcmtpZXdpY3oNCg0K
DQoNCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIu
IDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIs
IFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcg
dW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
