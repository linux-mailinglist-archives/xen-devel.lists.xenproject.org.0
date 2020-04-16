Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C91ABFF6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 13:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP2x5-00083m-Bx; Thu, 16 Apr 2020 11:45:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xq2g=6A=amazon.de=prvs=368a07d89=wipawel@srs-us1.protection.inumbo.net>)
 id 1jP2x3-00083h-SC
 for xen-devel@lists.xen.org; Thu, 16 Apr 2020 11:45:01 +0000
X-Inumbo-ID: b45ce5b6-7fd7-11ea-b4f4-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b45ce5b6-7fd7-11ea-b4f4-bc764e2007e4;
 Thu, 16 Apr 2020 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1587037502; x=1618573502;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:mime-version:content-transfer-encoding:subject;
 bh=MsCDHqnsOetk3Dzm8XZOfBpxwNjbELnvC6olGu/VtZ8=;
 b=CvbvGHuyXJg+RvqQgC38LTL29Rxg1lAlVZT6seJl3q6MZXFqFyw1oPMA
 0ZVN/QDnne2vHeOoVew1eW+a+yZhVBYs9sA6llp8ZleuxK4hwa3rLMwBJ
 dO9I+AdlSoIlLeCYChuWHgvj0lMWUtwRFM1LdgysElqdzoFeFx8v8FXFP Y=;
IronPort-SDR: V2pBEwcyKocyPXA+BIVc668LO1sKPDzf7UQl+plxQh1IKSFBM5efyVPCNwi9mh+3mD6v8YUHOf
 hTCjkJw4zCuA==
X-IronPort-AV: E=Sophos;i="5.72,390,1580774400"; d="scan'208";a="37412680"
Subject: Re: [XTF 3/4] Enabled serial writing for hvm guests
Thread-Topic: [XTF 3/4] Enabled serial writing for hvm guests
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 16 Apr 2020 11:44:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4A43A241B3F; Thu, 16 Apr 2020 11:44:57 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 11:44:56 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 16 Apr 2020 11:44:55 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1497.006;
 Thu, 16 Apr 2020 11:44:55 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Index: AQHWE9NGGLvUKlPnBky0fF8RmnZleKh7jQGAgAAUPYA=
Date: Thu, 16 Apr 2020 11:44:55 +0000
Message-ID: <987F9723-8B54-4908-8AED-F265C0F7E1AC@amazon.com>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-4-wipawel@amazon.de>
 <501cc157-b260-bca0-2920-f4e3a8a07c1b@citrix.com>
In-Reply-To: <501cc157-b260-bca0-2920-f4e3a8a07c1b@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.198]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E9FD017AB6D9844ACAF970D8DAF4A62@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Semel <phentex@amazon.de>, Julien Grall <julien@xen.org>,
 "paul@xen.org" <paul@xen.org>, "semelpaul@gmail.com" <semelpaul@gmail.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "Manthey, Norbert" <nmanthey@amazon.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDE2LiBBcHIgMjAyMCwgYXQgMTI6MzIsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5h
dGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXIgYW5k
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMTYvMDQvMjAyMCAx
MDo0MSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6DQo+PiBGcm9tOiBQYXVsIFNlbWVsIDxw
aGVudGV4QGFtYXpvbi5kZT4NCj4+IA0KPj4gc2V0dXAuYzogUFYgY29uc29sZSB3cml0aW5nIGlz
IG5vdCB3b3JraW5nIGluIFhlbiA0LjIgZm9yIGh2bQ0KPj4gZ3Vlc3RzLA0KPiANCj4gV2hhdCBp
cyBub3Qgd29ya2luZyBhYm91dCBpdD8NCj4gDQoNCkhvbmVzdGx5IEkgYW0gbGl0dGxlIHNob3J0
IG9uIGRldGFpbHMgaGVyZSwgSSB3b3VsZCBoYXZlIHRvIGFzayBQYXVsIG9yIHJlZnJlc2ggbXkg
bWVtb3J5Lg0KDQo+PiBzbyB3ZSBtYWtlIHh0ZiB3cml0ZSB0byBDT00xIHNlcmlhbCBwb3J0IHRv
IGdldCBpdHMgb3V0cHV0DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgU2VtZWwgPHBoZW50
ZXhAYW1hem9uLmRlPg0KPj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdp
cGF3ZWxAYW1hem9uLmRlPg0KPj4gLS0tDQo+PiBhcmNoL3g4Ni9zZXR1cC5jIHwgMTQgKysrKysr
KysrKysrKysNCj4+IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9zZXR1cC5jIGIvYXJjaC94ODYvc2V0dXAuYw0KPj4gaW5kZXgg
M2M4NGU5Ni4uZjZmYTRkZiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gveDg2L3NldHVwLmMNCj4+ICsr
KyBiL2FyY2gveDg2L3NldHVwLmMNCj4+IEBAIC0yMzgsNiArMjM4LDEzIEBAIHN0YXRpYyB2b2lk
IHFlbXVfY29uc29sZV93cml0ZShjb25zdCBjaGFyICpidWYsIHNpemVfdCBsZW4pDQo+PiAgICAg
ICAgICAgICAgICAgIDogImQiICgweDEyKSk7DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgdm9pZCBj
b20xX3dyaXRlKGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGxlbikNCj4+ICt7DQo+PiArICAgIGFz
bSB2b2xhdGlsZSgicmVwOyBvdXRzYiINCj4+ICsgICAgICAgICAgICAgICAgIDogIitTIiAoYnVm
KSwgIitjIiAobGVuKQ0KPj4gKyAgICAgICAgICAgICAgICAgOiAiZCIgKDB4M2Y4KSk7DQo+IA0K
PiBEZXNwaXRlIGJlaW5nIDB4M2Y4LCB0aGlzIHJlYWxseSBpc24ndCB1YXJ0LWNvbXBhdGlibGUg
Q09NMS4gIEkgcHJlc3VtZQ0KPiBpdCBvbmx5IHdvcmtzIGJlY2F1c2UgUWVtdSBkb2Vzbid0IGhh
dmUgYW55IHJlYWwgVEhSIGRlbGF5cyBpbiBpdHMNCj4gZW11bGF0aW9uLg0KPiANCg0KVGhhdCBj
YW4gYmUuIE5ldmVydGhlbGVzcywgaXQgd29ya3MgZm9yIG1lW3RtXS4NCg0KPj4gK30NCj4+ICsN
Cj4+IHN0YXRpYyB2b2lkIHhlbl9jb25zb2xlX3dyaXRlKGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90
IGxlbikNCj4+IHsNCj4+ICAgICBoeXBlcmNhbGxfY29uc29sZV93cml0ZShidWYsIGxlbik7DQo+
PiBAQCAtMjQ2LDcgKzI1MywxNCBAQCBzdGF0aWMgdm9pZCB4ZW5fY29uc29sZV93cml0ZShjb25z
dCBjaGFyICpidWYsIHNpemVfdCBsZW4pDQo+PiB2b2lkIGFyY2hfc2V0dXAodm9pZCkNCj4+IHsN
Cj4+ICAgICBpZiAoIElTX0RFRklORUQoQ09ORklHX0hWTSkgJiYgIXB2aF9zdGFydF9pbmZvICkN
Cj4+ICsgICAgew0KPj4gICAgICAgICByZWdpc3Rlcl9jb25zb2xlX2NhbGxiYWNrKHFlbXVfY29u
c29sZV93cml0ZSk7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCBJU19ERUZJTkVEKENP
TkZJR19IVk0pICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcmVnaXN0ZXJfY29uc29sZV9jYWxs
YmFjayhjb20xX3dyaXRlKTsNCj4gDQo+IFRoaXMgd2lyZXMgdXAgMHgzZjggZXZlbiBmb3IgUFZI
IGd1ZXN0cywgd2hpY2ggSSdtIGd1ZXNzaW5nIGlzbid0DQo+IGludGVudGlvbmFsPyAgVGhpcyBz
aG91bGQgYmUgcGFydCBvZiB0aGUgcHJldmlvdXMgaWYoKSwgYnV0IGRvZXMgYmVnIHRoZQ0KPiBx
dWVzdGlvbiB3aGF0IGlzIHdyb25nIHdpdGggdGhlIGV4aXN0aW5nIHFlbXUgY29uc29sZT8NCj4g
DQoNCkl0IHR1cm5zIG91dCB0aGF0IGJvdGggUFZIIGFuZCBIVk0gZ3Vlc3RzIGFyZSBQVkggQUJJ
IGNvbXBhdGlibGUsDQpidXQgUFZIIGRvZXMgbm90IG5lZWQgcWVtdSBjb25zb2xlLiBBcyBwZXI6
DQoNCjAxZTE2Y2ViIGFyY2gveDg2L2h2bS9oZWFkLlMgICAgICAoQW5kcmV3IENvb3BlciAgICAg
ICAgMjAxOC0wMS0yNiAxNjozOToxNSArMDAwMCAzNikgLyogQWxsIEhWTSBYVEYgZ3Vlc3RzIGFy
ZSBjb21wYXRpYmxlIHdpdGggdGhlIFBWSCBBQkkuICovDQoNCkluIG9yZGVyIHRvIGdldCBzZXJp
YWwgY29uc29sZSB2aWEgcWVtdSB3b3JraW5nLCBJIGFsd2F5cyByZWdpc3RlciBjb20xDQpoYW5k
bGVyIGZvciBib3RoIEhWTSBhbmQgUFZILiBSZWdpc3RlciBxZW11IGNvbnNvbGUgb25seSBmb3Ig
SFZNIGd1ZXN0cy4NCg0KPiB+QW5kcmV3DQoNCkkgdXNlIHRoZSBjb20xIHRvIG1ha2UgcWVtdSB3
cml0ZSBjb25zb2xlIG91dHB1dCB0byBhIGZpbGUgdmlhOiBzZXJpYWw94oCcZmlsZTovdG1wL+KA
puKAnQ0KDQpCZXN0IFJlZ2FyZHMsDQpQYXdlbCBXaWVjem9ya2lld2ljeg0Kd2lwYXdlbEBhbWF6
b24uY29tDQoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vu
c3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFl
Z2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVu
YnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4
NzkKCgo=


