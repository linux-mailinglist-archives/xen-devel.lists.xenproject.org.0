Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612DD16AD40
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 18:24:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6HR0-0001Tv-NH; Mon, 24 Feb 2020 17:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zoxf=4M=amazon.co.uk=prvs=316f3025c=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6HQz-0001Tq-VF
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:22:22 +0000
X-Inumbo-ID: 37192676-572a-11ea-9225-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37192676-572a-11ea-9225-12813bfff9fa;
 Mon, 24 Feb 2020 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582564942; x=1614100942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LrdQiAjtIUIILWn1uKhyjtv47mmd0jU9UXiOJlyyLMA=;
 b=kMmSR/CqdmhgIAuLMlxceh37/8LhyiLantSg24PFuD6rjpsr5p/4OZGz
 QbsfaKFBR8yYA3lIAoip2932uO9eWuHbpM/CgzfPKHcnibRl7nqKVGFhu
 sqd1uwhuiS4csKUG6rgXhCkHED+m8blVrQlTCnvLnjrr5Bb8BNdAmMMXh 4=;
IronPort-SDR: 8CozwL2TJM5TWNq63oqv6LYbPWZyIJsY1wBtYH1lE9bu7GbVFX8TpazKrOZ00RnhZZh6y2KWkE
 H8R00L4NdlxQ==
X-IronPort-AV: E=Sophos;i="5.70,480,1574121600"; d="scan'208";a="18348607"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 24 Feb 2020 17:22:08 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-1968f9fa.us-west-2.amazon.com (Postfix) with ESMTPS
 id 998DEA297B; Mon, 24 Feb 2020 17:22:03 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 24 Feb 2020 17:22:02 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 24 Feb 2020 17:22:01 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 24 Feb 2020 17:22:01 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Ian Jackson
 <ian.jackson@citrix.com>
Thread-Topic: [PATCH v7 0/6] xl/libxl: domid allocation/preservation changes
Thread-Index: AQHV6Kj8cIQs0OK9UUyKbbfvg2lzPagqg/iAgAAKiXCAAA0A0A==
Date: Mon, 24 Feb 2020 17:22:01 +0000
Message-ID: <3acd774a777948c6965f9ef94505aadc@EX13D32EUC003.ant.amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
 <24147.61855.619335.745427@mariner.uk.xensource.com>
 <dd6cfb5f1770450abf7362ff1872f2b8@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <dd6cfb5f1770450abf7362ff1872f2b8@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.246]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v7 0/6] xl/libxl: domid
 allocation/preservation changes
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gRHVycmFudCwg
UGF1bA0KPiBTZW50OiAyNCBGZWJydWFyeSAyMDIwIDE2OjMzDQo+IFRvOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AY2l0cml4LmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+OyBXZWkg
TGl1IDx3bEB4ZW4ub3JnPjsgSmFzb24gQW5kcnl1aw0KPiA8amFuZHJ5dWtAZ21haWwuY29tPjsg
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEtvbnJhZA0KPiBSemVz
enV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPEdl
b3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47
IEFudGhvbnkNCj4gUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0gg
djcgMC82XSB4bC9saWJ4bDogZG9taWQNCj4gYWxsb2NhdGlvbi9wcmVzZXJ2YXRpb24gY2hhbmdl
cw0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPg0KPiA+IFNlbnQ6IDI0IEZlYnJ1YXJ5IDIwMjAg
MTU6NTQNCj4gPiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiA+
IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXINCj4gPiA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPjsNCj4gPiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5j
b20+OyBKYW4gQmV1bGljaA0KPiA8amJldWxpY2hAc3VzZS5jb20+Ow0KPiA+IEphc29uIEFuZHJ5
dWsgPGphbmRyeXVrQGdtYWlsLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Ow0K
PiBLb25yYWQNCj4gPiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0
ZWZhbm8gU3RhYmVsbGluaQ0KPiA+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdSA8
d2xAeGVuLm9yZz4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDAvNl0geGwvbGlieGw6IGRv
bWlkIGFsbG9jYXRpb24vcHJlc2VydmF0aW9uDQo+ID4gY2hhbmdlcw0KPiA+DQo+ID4gUGF1bCBE
dXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NyAwLzZdIHhsL2xpYnhsOiBkb21pZA0KPiA+IGFsbG9j
YXRpb24vcHJlc2VydmF0aW9uIGNoYW5nZXMiKToNCj4gPiA+IFBhdWwgRHVycmFudCAoNik6DQo+
ID4gPiAgIGxpYnhsOiBhZGQgaW5mcmFzdHJ1Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5ICdyZWNl
bnQnIGRvbWlkcw0KPiA+ID4gICBsaWJ4bDogbW9kaWZ5IGxpYnhsX19sb2d2KCkgdG8gb25seSBs
b2cgdmFsaWQgZG9taWQgdmFsdWVzDQo+ID4gPiAgIHB1YmxpYy94ZW4uaDogYWRkIGEgZGVmaW5p
dGlvbiBmb3IgYSAndmFsaWQgZG9taWQnIG1hc2sNCj4gPiA+ICAgbGlieGw6IGFsbG93IGNyZWF0
aW9uIG9mIGRvbWFpbnMgd2l0aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQNCj4gPiA+ICAg
eGwuY29uZjogaW50cm9kdWNlICdkb21pZF9wb2xpY3knDQo+ID4gPiAgIHhsOiBhbGxvdyBkb21p
ZCB0byBiZSBwcmVzZXJ2ZWQgb24gc2F2ZS9yZXN0b3JlIG9yIG1pZ3JhdGUNCj4gPg0KPiA+IFRo
YW5rcyBmb3IgdGhpcy4gIEkgdGhpbmsgdGhpcyBoYXMgZW5vdWdoIGFja3MgdG8gZ28gaW4gbm93
LiAgV291bGQNCj4gPiB5b3UgY2FyZSB0byBmb2xkIHRoZSBhY2tzL3Jldmlld3MgYW5kIHBhc3Mg
bWUgYSBnaXQgYnJhbmNoID8gIElmIGl0J3MNCj4gPiBlYXN5IGZvciB5b3UsIHRoYXQgd291bGQg
YmUgbW9yZSBjb252ZW5pZW50IGFuZCByZWxpYWJsZSB0aGFuIHJlbHlpbmcNCj4gPiBvbiBnaXQt
YW0uICBGZWVsIGZyZWUgdG8gbmVnb3RpYXRlIGFib3V0IGRldGFpbHMgb24gaXJjLi4uDQo+ID4N
Cj4gDQo+IFN1cmUsIEknbGwgcG9pbnQgeW91IGF0IGEgYnJhbmNoLCBob3BlZnVsbHkgd2l0aGlu
IHRoZSBuZXh0IGhvdXIgb3Igc28uDQo+IA0KDQpTZWUgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPXBlb3BsZS9wYXVsZHUveGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9k
b21pZDEyDQoNCkNoZWVycywNCg0KICBQYXVsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
