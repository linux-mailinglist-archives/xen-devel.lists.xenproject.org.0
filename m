Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587D14D934
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:43:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix7FH-0004eG-Mz; Thu, 30 Jan 2020 10:40:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ix7FG-0004eB-L7
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:40:22 +0000
X-Inumbo-ID: ea4e664e-434c-11ea-8a31-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea4e664e-434c-11ea-8a31-12813bfff9fa;
 Thu, 30 Jan 2020 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580380823; x=1611916823;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dp7RWUvBZ/MBA5NqXaIQcS3aSl9pVYKmSrAaT0Bi08U=;
 b=mU/78u1bAX9RtykEyXqX65rz3JnbCCP6jC4dovGzdLSPOPmqrb2ZX9pi
 EpCwW/TbskD5BJ3ubXF1YO4TgGIZz2UGrE1R1/MQF+SJl9hxpMa5rXBI5
 GlLXbOwIEMbxRU5meGONd09PnHRLKdLKjvJ5dgzIcLPBFI00IeDvXMO22 I=;
IronPort-SDR: /8R8iicTp8EYHBkNCnpdxd7Eea4pTTssjm+mKZuQQ6UCwPDpGyEhhY8CLvuKCp3X9m5FewArFS
 R/H+28F18onA==
X-IronPort-AV: E=Sophos;i="5.70,381,1574121600"; d="scan'208";a="22000548"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 30 Jan 2020 10:40:21 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5D020A218B; Thu, 30 Jan 2020 10:40:20 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 10:40:20 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 10:40:19 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 10:40:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v7 2/3] mm: make pages allocated with MEMF_no_refcount
 safe to assign
Thread-Index: AQHV1scJ/JWRQq5aIkeCPreZhLsvk6gC//gAgAAFSiA=
Date: Thu, 30 Jan 2020 10:40:18 +0000
Message-ID: <79c9372d1cb84f489fa89f64b4bb20b4@EX13D32EUC003.ant.amazon.com>
References: <20200129171030.1341-1-pdurrant@amazon.com>
 <20200129171030.1341-3-pdurrant@amazon.com>
 <c9728f80-8f68-a31f-993d-12b61c044e55@suse.com>
In-Reply-To: <c9728f80-8f68-a31f-993d-12b61c044e55@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v7 2/3] mm: make pages allocated with
 MEMF_no_refcount safe to assign
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEphbnVhcnkgMjAyMCAxMDoyMA0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsNCj4gSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0Bl
cGFtLmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY3IDIvM10gbW06IG1ha2UgcGFnZXMgYWxsb2NhdGVkIHdpdGggTUVN
Rl9ub19yZWZjb3VudA0KPiBzYWZlIHRvIGFzc2lnbg0KPiANCj4gT24gMjkuMDEuMjAyMCAxODox
MCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IE5PVEU6IHN0ZWFsX3BhZ2UoKSBpcyBhbHNvIG1v
ZGlmaWVkIHRvIGRlY3JlbWVudCBleHRyYV9wYWdlcyBpbiB0aGUgY2FzZQ0KPiBvZg0KPiA+ICAg
ICAgIGEgUEdDX2V4dHJhIHBhZ2UgYmVpbmcgc3RvbGVuIGZyb20gYSBkb21haW4uDQo+IA0KPiBJ
IGRvbid0IHRoaW5rIHN0ZWFsaW5nIG9mIHN1Y2ggcGFnZXMgc2hvdWxkIGJlIGFsbG93ZWQuIElm
IGFueXRoaW5nLA0KPiB0aGUgcmVwbGFjZW1lbnQgcGFnZSB0aGVuIGFnYWluIHNob3VsZCBiZSBh
biAiZXh0cmEiIG9uZSwgd2hpY2ggSQ0KPiBndWVzcyB3b3VsZCBiZSBxdWl0ZSB1Z2x5IHRvIGFy
cmFuZ2UgZm9yLiBCdXQgc3VjaCAiZXh0cmEiIHBhZ2VzDQo+IGFyZW4ndCBzdXBwb3NlZCB0byBi
ZSBwcm9wZXJseSBleHBvc2VkIChhbmQgaGVuY2UgcGxheWVkIHdpdGgpIHRvDQo+IHRoZSBkb21h
aW4gaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiANCj4gPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4gQEAgLTIyNTYsNiAr
MjI1Niw3IEBAIGludCBhc3NpZ25fcGFnZXMoDQo+ID4gIHsNCj4gPiAgICAgIGludCByYyA9IDA7
DQo+ID4gICAgICB1bnNpZ25lZCBsb25nIGk7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgZXh0cmFf
cGFnZXMgPSAwOw0KPiA+DQo+ID4gICAgICBzcGluX2xvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7
DQo+ID4NCj4gPiBAQCAtMjI2NywxMyArMjI2OCwxOSBAQCBpbnQgYXNzaWduX3BhZ2VzKA0KPiA+
ICAgICAgICAgIGdvdG8gb3V0Ow0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gKyAgICBmb3IgKCBpID0g
MDsgaSA8ICgxIDw8IG9yZGVyKTsgaSsrICkNCj4gPiArICAgICAgICBpZiAoIHBnW2ldLmNvdW50
X2luZm8gJiBQR0NfZXh0cmEgKQ0KPiA+ICsgICAgICAgICAgICBleHRyYV9wYWdlcysrOw0KPiAN
Cj4gUGVyaGFwcyBhc3N1bWUgKGFuZCBtYXliZSBBU1NFUlQoKSkgdGhhdCBhbGwgcGFnZXMgaW4g
dGhlIGJhdGNoDQo+IGFyZSB0aGUgc2FtZSBpbiB0aGlzIHJlZ2FyZD8gVGhlbiB5b3UgY291bGQg
Li4uDQo+IA0KPiA+ICAgICAgaWYgKCAhKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3VudCkgKQ0K
PiA+ICAgICAgew0KPiA+IC0gICAgICAgIGlmICggdW5saWtlbHkoKGQtPnRvdF9wYWdlcyArICgx
IDw8IG9yZGVyKSkgPiBkLT5tYXhfcGFnZXMpICkNCj4gPiArICAgICAgICB1bnNpZ25lZCBpbnQg
bWF4X3BhZ2VzID0gZC0+bWF4X3BhZ2VzIC0gZC0+ZXh0cmFfcGFnZXMgLQ0KPiBleHRyYV9wYWdl
czsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCB1bmxpa2VseSgoZC0+dG90X3BhZ2VzICsgKDEg
PDwgb3JkZXIpKSA+IG1heF9wYWdlcykgKQ0KPiA+ICAgICAgICAgIHsNCj4gPiAgICAgICAgICAg
ICAgZ3ByaW50ayhYRU5MT0dfSU5GTywgIk92ZXItYWxsb2NhdGlvbiBmb3IgZG9tYWluICV1OiAi
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgIiV1ID4gJXVcbiIsIGQtPmRvbWFpbl9pZCwNCj4g
PiAtICAgICAgICAgICAgICAgICAgICBkLT50b3RfcGFnZXMgKyAoMSA8PCBvcmRlciksIGQtPm1h
eF9wYWdlcyk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgZC0+dG90X3BhZ2VzICsgKDEgPDwg
b3JkZXIpLCBtYXhfcGFnZXMpOw0KPiA+ICAgICAgICAgICAgICByYyA9IC1FMkJJRzsNCj4gPiAg
ICAgICAgICAgICAgZ290byBvdXQ7DQo+ID4gICAgICAgICAgfQ0KPiA+IEBAIC0yMjgyLDEzICsy
Mjg5LDE3IEBAIGludCBhc3NpZ25fcGFnZXMoDQo+ID4gICAgICAgICAgICAgIGdldF9rbm93bmFs
aXZlX2RvbWFpbihkKTsNCj4gPiAgICAgIH0NCj4gPg0KPiA+ICsgICAgZC0+ZXh0cmFfcGFnZXMg
Kz0gZXh0cmFfcGFnZXM7DQo+IA0KPiAuLi4gYXJyYW5nZSB0aGluZ3MgbGlrZSB0aGlzLCBJIHRo
aW5rOg0KPiANCj4gICAgIGlmICggcGdbaV0uY291bnRfaW5mbyAmIFBHQ19leHRyYSApDQo+ICAg
ICAgICAgZC0+ZXh0cmFfcGFnZXMgKz0gMVUgPDwgb3JkZXI7DQo+ICAgICBlbHNlIGlmICggISht
ZW1mbGFncyAmIE1FTUZfbm9fcmVmY291bnQpICkNCj4gICAgIHsNCj4gICAgICAgICB1bnNpZ25l
ZCBpbnQgbWF4X3BhZ2VzID0gZC0+bWF4X3BhZ2VzIC0gZC0+ZXh0cmFfcGFnZXM7DQo+ICAgICAg
ICAgLi4uDQo+IA0KPiBUaGlzIHdvdWxkLCBhZmFpY3QsIHRoZW4gYWxzbyBlbGltaW5hdGUgdGhl
IG5lZWQgdG8gbWFzayBvZmYNCj4gTUVNRl9ub19yZWZjb3VudCBpbiBhbGxvY19kb21oZWFwX3Bh
Z2VzKCksIC4uLg0KPiANCj4gDQo+ID4gICAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IG9yZGVy
KTsgaSsrICkNCj4gPiAgICAgIHsNCj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGNvdW50X2lu
Zm8gPSBwZ1tpXS5jb3VudF9pbmZvOw0KPiA+ICsNCj4gPiAgICAgICAgICBBU1NFUlQocGFnZV9n
ZXRfb3duZXIoJnBnW2ldKSA9PSBOVUxMKTsNCj4gPiAtICAgICAgICBBU1NFUlQoIXBnW2ldLmNv
dW50X2luZm8pOw0KPiA+ICsgICAgICAgIEFTU0VSVCghKGNvdW50X2luZm8gJiB+UEdDX2V4dHJh
KSk7DQo+IA0KPiAuLi4gcmVzdWx0aW5nIGluIG15IHByaW9yIGNvbW1lbnQgb24gdGhpcyBvbmUg
c3RpbGwgYXBwbHlpbmcuDQo+IA0KPiBCZXNpZGVzIHRoZSBjaGFuZ2VzIHlvdSd2ZSBtYWRlLCB3
aGF0IGFib3V0IHRoZSBjb2RlIGhhbmRsaW5nDQo+IFhFTk1FTV9zZXRfcG9kX3RhcmdldD8gV2hh
dCBhYm91dCBwMm0tcG9kLmM/IEFuZA0KPiBwdl9zaGltX3NldHVwX2RvbSgpPyBJJ20gYWxzbyBu
b3QgZnVsbHkgc3VyZSB3aGV0aGVyDQo+IGdldGRvbWFpbmluZm8oKSBzaG91bGRuJ3Qgc3VidHJh
Y3QgZXh0cmFfcGFnZXMsIGJ1dCBJIHRoaW5rDQo+IHRoaXMgaXMgdGhlIG9ubHkgd2F5IHRvIGF2
b2lkIGhhdmluZyBhbiBleHRlcm5hbGx5IHZpc2libGUNCj4gZWZmZWN0LiBUaGVyZSBtYXkgYmUg
bW9yZS4gUGVyaGFwcyBpdCdzIGJlc3QgdG8gaW50cm9kdWNlIGENCj4gZG9tYWluX3RvdF9wYWdl
cygpIGlubGluZSBmdW5jdGlvbiByZXR1cm5pbmcgdGhlIGRpZmZlcmVuY2UsDQo+IGFuZCB1cyBp
dCBhbG1vc3QgZXZlcnl3aGVyZSB3aGVyZSAtPnRvdF9wYWdlcyBpcyB1c2VkIHJpZ2h0DQo+IG5v
dy4NCg0KVGhpcyBpcyBnZXR0aW5nIHZlcnkgdmVyeSBjb21wbGljYXRlZCBub3csIHdoaWNoIG1h
a2VzIG1lIHRoaW5rIHRoYXQgbXkgb3JpZ2luYWwgYXBwcm9hY2ggdXNpbmcgYSAnbm9ybWFsJyBw
YWdlIGFuZCBzZXR0aW5nIGFuIGluaXRpYWwgbWF4X3BhZ2VzIGluIGRvbWFpbl9jcmVhdGUoKSB3
YXMgYSBiZXR0ZXIgYXBwcm9hY2guDQoNCiAgUGF1bA0KDQoNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
