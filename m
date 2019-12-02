Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109B610E702
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 09:45:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibhHB-0006q8-VZ; Mon, 02 Dec 2019 08:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JZHi=ZY=amazon.de=prvs=2320d7a82=wipawel@srs-us1.protection.inumbo.net>)
 id 1ibhHA-0006q3-MZ
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 08:41:48 +0000
X-Inumbo-ID: 9377f3b2-14df-11ea-83b8-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9377f3b2-14df-11ea-83b8-bc764e2007e4;
 Mon, 02 Dec 2019 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1575276109; x=1606812109;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=e0wJyZ5KndixZNIGq4ke1dCJxyBK4YpdyeMF2r0W9LU=;
 b=faxwffaPdGbH6I7m8eHzlRY6EXmE7iTf3WWr+SUQPu2ytLyb+IFvd0kQ
 eS4gveumFEG2RyJFOe1Tf9Lmurh56HOduAXXn/UVPcj8XKnmTlpAIFIvC
 DH8Ps+Tul5TlOxMRBl4J2M8er967C2Q9AdpUKcmOirWF3cLSyq80TPorT 8=;
IronPort-SDR: ndZNZ5/nS7KLxRgb1wvarkwAzDEuzZQ4qJWIRc9N+ZMrirM38kBEVlq6brd8o3swpVoMVwWMmN
 BaDmjeJyskhQ==
X-IronPort-AV: E=Sophos;i="5.69,268,1571702400"; 
   d="scan'208";a="2553293"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 02 Dec 2019 08:41:37 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9FBAFA21DF; Mon,  2 Dec 2019 08:41:34 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 08:41:33 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 2 Dec 2019 08:26:27 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 2 Dec 2019 08:26:27 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: livepatch-build-tools regression
Thread-Index: AQHVni9ReRquixYoHEOXl3oCOkZoJaeRI0wAgAAGFwCAAAVUAIAAA80AgAGMj4CAATPFAIAJ1PUAgAANBQCAARbnAIAARNKAgAAJaQCABl9/gA==
Date: Mon, 2 Dec 2019 08:26:27 +0000
Message-ID: <3D2DFAA5-30DF-4B9D-957F-3BB09C43BA1D@amazon.com>
References: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
 <DD847497-6517-4668-9AD6-66F11B91288A@amazon.com>
 <b686f6b2-96e4-6f41-7844-bb0ab184cc71@citrix.com>
 <D092B667-0662-4B8E-958E-02B14530C363@amazon.com>
 <d65106c4-e35d-bd69-0539-a7fb525ae776@citrix.com>
 <1A2AE077-662E-40C0-820D-13EC3B88D1F3@amazon.com>
 <69cbfa61-fae3-ee6a-b482-31cca7f05d60@citrix.com>
 <60D2D242-4806-402F-99BC-F0CE572E5925@amazon.com>
 <CF690FB1-DF59-44B3-AB3F-B2101617826E@amazon.com>
 <5efd649a-4f70-0955-a789-a7cf8ea7c377@citrix.com>
 <B621C71F-0798-4CAC-8201-484D17A93888@amazon.com>
 <26495d21-1b4b-1712-e09d-9d4abc2c7a48@citrix.com>
In-Reply-To: <26495d21-1b4b-1712-e09d-9d4abc2c7a48@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.12]
Content-ID: <4927B58C0CFA3640A14E33C1CD0C1165@amazon.com>
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
 Cooper <andrew.cooper3@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "Manthey, Norbert" <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Doebel,
 Bjoern" <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMjcuIE5vdiAyMDE5LCBhdCAxNjo1NiwgU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5
YXNsaUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI3LzExLzIwMTkgMTU6MjIsIFdpZWN6
b3JraWV3aWN6LCBQYXdlbCB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMjcuIE5vdiAyMDE5LCBh
dCAxMjoxNiwgU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90ZToN
Cj4+PiANCj4+PiBPbiAyNi8xMS8yMDE5IDE4OjM3LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3Jv
dGU6DQo+Pj4+IEl0IGxvb2tzIGxpa2UgZ2NjIHBsYXlzIHRoZSB1c3VhbCBkaXJ0eSB0cmlja3Mg
d2l0aCBsb2NhbCB2YXJpYWJsZXMgcmVuYW1pbmc6DQo+Pj4+IA0KPj4+PiAtIHhlbi1zeW1zDQo+
Pj4+IDc1Mjk6IGZmZmY4MmQwODA1ZmVkNTAgICAgIDggT0JKRUNUICBMT0NBTCAgREVGQVVMVCA0
MjMwIGxhc3RwYWdlLjIyODU3DQo+Pj4+IC0gbGl2ZXBhdGNoDQo+Pj4+IDI4OTogMDAwMDAwMDAw
MDAwMDAwMCAgICAgOCBPQkpFQ1QgIEdMT0JBTCBERUZBVUxUICBVTkQgaHZtLmMjbGFzdHBhZ2Uu
MjI4NTYNCj4+Pj4gDQo+Pj4+IFRoZW4sIHN5bWJvbHMgcmVzb2x1dGlvbiBieSBuYW1lIGZhaWxz
Li4NCj4+Pj4gDQo+Pj4+IENhbiB5b3UgcGxlYXNlIHRyeSB0byBidWlsZCB0aGUgbGl2ZXBhdGNo
IG1vZHVsZSB3aXRoIGFkZGl0aW9uYWwgb3B0aW9uICfigJRwcmVsaW5rJyBhbmQgZ2l2ZSBpdCBh
IHRyeSA/DQo+Pj4gDQo+Pj4gTXkgTFAgbG9hZGluZyBlcnJvciBpczoNCj4+PiANCj4+PiAgKFhF
TikgbGl2ZXBhdGNoOiBscDogVW5rbm93biBzeW1ib2w6IC5MQzcNCj4+PiANCj4+PiBXaGVuIEkg
cGFzcyAtLXByZWxpbmsgdG8gbGl2ZXBhdGNoLWJ1aWxkLCBpdCBjb21wbGFpbnMgaW4gYSBzaW1p
bGFyIHdheToNCj4+PiANCj4+PiAgbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzL3ByZWxpbms6IEVSUk9S
OiBvdXRwdXQubzogbGl2ZXBhdGNoX3Jlc29sdmVfc3ltYm9sczogODA6IGxvb2t1cF9sb2NhbF9z
eW1ib2wgLkxDNyAocDJtLmMpDQo+Pj4gDQo+PiANCj4+IENvdWxkIHlvdSBnaXZlIHRoaXMgdGVz
dGluZyBwYXRjaCBhIHRyeT8NCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9iamVj
dC5jIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMNCj4+IGluZGV4IDhkNjM5NDAuLjEwODA3ZDIgMTAw
NjQ0DQo+PiAtLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYw0KPj4gKysrIGIvY3JlYXRlLWRpZmYt
b2JqZWN0LmMNCj4+IEBAIC04MzksOCArODM5LDEwIEBAIHN0YXRpYyB2b2lkIGtwYXRjaF9jb21w
YXJlX3N5bWJvbHMoc3RydWN0IGxpc3RfaGVhZCAqc3ltbGlzdCkNCj4+ICAgICAgIGxpc3RfZm9y
X2VhY2hfZW50cnkoc3ltLCBzeW1saXN0LCBsaXN0KSB7DQo+PiAgICAgICAgICAgICAgIGlmIChz
eW0tPnR3aW4pDQo+PiAgICAgICAgICAgICAgICAgICAgICAga3BhdGNoX2NvbXBhcmVfY29ycmVs
YXRlZF9zeW1ib2woc3ltKTsNCj4+IC0gICAgICAgICAgICAgICBlbHNlDQo+PiArICAgICAgICAg
ICAgICAgZWxzZSB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgc3ltLT5zdGF0dXMgPSBORVc7
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICBzeW0tPmluY2x1ZGUgPSAxOw0KPj4gKyAgICAg
ICAgICAgICAgIH0NCj4+IA0KPj4gICAgICAgICAgICAgICBsb2dfZGVidWcoInN5bWJvbCAlcyBp
cyAlc1xuIiwgc3ltLT5uYW1lLCBzdGF0dXNfc3RyKHN5bS0+c3RhdHVzKSk7DQo+PiAgICAgICB9
DQo+PiANCj4gDQo+IExvb2tzIGxpa2UgdGhpcyBjaGFuZ2UgZml4ZWQgdGhlIGlzc3VlIGZvciBt
ZSENCj4gT25lIHRoaW5nIHRvIG5vdGljZSBpcyB0aGF0IHRoZSBzaXplIG9mIGEgc3RyaXBwZWQg
TFAgYmluYXJ5IGluY3JlYXNlZA0KPiBmcm9tIDQ1SyB0byA2MEsuDQo+IA0KDQpZZXMsIHRoaXMg
d2FzIG5vdCBzdXBwb3NlZCB0byBiZSBhIHByb3BlciBmaXguIEkgd2FzIG1lcmVseSB0cnlpbmcg
dG8gZXN0YWJsaXNoIGlmIHdlIHdlcmUgbG9va2luZyBhdCB0aGUgc2FtZSBpc3N1ZS4NCkkgZGlk
IGZpeCBpdCBub3cgdGhlIHByb3BlciB3YXksIHRob3VnaC4gSSBzaGFsbCBzZW5kIHRoZSBwYXRj
aGVzIHNvb24uDQoNCj4gLS0NCj4gVGhhbmtzLA0KPiBTZXJnZXkNCg0KQmVzdCBSZWdhcmRzLA0K
UGF3ZWwgV2llY3pvcmtpZXdpY3oNCg0KDQoNCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIg
R2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1
bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10
c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpV
c3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
