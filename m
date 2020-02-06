Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34046154366
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:47:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfZz-00029C-2D; Thu, 06 Feb 2020 11:44:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RI0J=32=amazon.co.uk=prvs=29855b991=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izfZx-000293-8e
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 11:44:17 +0000
X-Inumbo-ID: 00e5a834-48d6-11ea-8952-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00e5a834-48d6-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 11:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580989457; x=1612525457;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rnnQ6eIw2tcpthogF2zbjspT08uKnt1zoWzk71JZ2N4=;
 b=SmwPtVEVYOHvoDCsy0RByexDd9uekQ7twZD3OGFxQ9ZKDCXRJqKZoe3w
 5U5PgnYq1CnRXq2FqR1g5PYqIW6vrziab0MDD+dnV5mLkRTXDKlkX3EwX
 BUbvkLfdefTxIpK77dDVaKXNFu/z9vyrpX7nHEK7foawN2tVkRnPjmXFZ M=;
IronPort-SDR: baXLe2MjxoQn10tfv502bZCSqNAwsc2octhn2qy5ZJdTO4qWBDzEqdS7h8igzss0b+zBeG7SPj
 ze2Wks5HQ7mQ==
X-IronPort-AV: E=Sophos;i="5.70,409,1574121600"; d="scan'208";a="23412134"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 06 Feb 2020 11:44:04 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id BB74CA2456; Thu,  6 Feb 2020 11:44:02 +0000 (UTC)
Received: from EX13D37EUA002.ant.amazon.com (10.43.165.200) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 6 Feb 2020 11:44:02 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUA002.ant.amazon.com (10.43.165.200) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 6 Feb 2020 11:44:01 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 6 Feb 2020 11:44:00 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] xen/mm: Avoid assuming the page is inuse in
 assign_pages()
Thread-Index: AQHV3Nm0k5iP3kZyl0WYA/ycra3uAqgN++DggAAIQYCAAAcPUA==
Date: Thu, 6 Feb 2020 11:44:00 +0000
Message-ID: <202acf94cd674228a1d852ccd372a90c@EX13D32EUC003.ant.amazon.com>
References: <20200206103833.15355-1-julien@xen.org>
 <d30a9c1b478c4e3a8b082fa625c8989a@EX13D32EUC003.ant.amazon.com>
 <0fb52abc-1a41-ab91-9c74-6f0913092a02@xen.org>
In-Reply-To: <0fb52abc-1a41-ab91-9c74-6f0913092a02@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] xen/mm: Avoid assuming the page is inuse
 in assign_pages()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Grall, Julien" <jgrall@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiAwNiBGZWJydWFyeSAyMDIwIDExOjE3DQo+IFRvOiBEdXJyYW50
LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gQ2M6IEdyYWxsLCBKdWxpZW4gPGpncmFsbEBhbWF6b24uY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyXSB4ZW4vbW06IEF2b2lkIGFzc3VtaW5nIHRoZSBwYWdlIGlzIGludXNl
IGluDQo+IGFzc2lnbl9wYWdlcygpDQo+IA0KPiBIaSBQYXVsLA0KPiANCj4gT24gMDYvMDIvMjAy
MCAxMDo1MiwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4gU2Vu
dDogMDYgRmVicnVhcnkgMjAyMCAxMDozOQ0KPiA+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+ID4+IENjOiBqdWxpZW5AeGVuLm9yZzsgRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvLnVrPjsgR3JhbGwsDQo+IEp1bGllbg0KPiA+PiA8amdyYWxsQGFtYXpvbi5j
b20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2Ml0geGVuL21tOiBBdm9pZCBhc3N1bWluZyB0aGUg
cGFnZSBpcyBpbnVzZSBpbg0KPiA+PiBhc3NpZ25fcGFnZXMoKQ0KPiA+Pg0KPiA+PiBGcm9tOiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiA+Pg0KPiA+PiBBdCB0aGUgbW9tZW50
LCBhc3NpZ25fcGFnZXMoKSBvbiB0aGUgcGFnZSB0byBiZSBpbnVzZSAoUEdDX3N0YXRlX2ludXNl
KQ0KPiA+PiBhbmQgdGhlIHN0YXRlIHZhbHVlIHRvIGJlIDAuDQo+ID4+DQo+ID4+IEhvd2V2ZXIs
IHRoZSBjb2RlIG1heSByYWNlIHdpdGggdGhlIHBhZ2Ugb2ZmbGluaW5nIGNvZGUgKHNlZQ0KPiA+
PiBvZmZsaW5lX3BhZ2UoKSkuIERlcGVuZGluZyBvbiB0aGUgb3JkZXJpbmcsIHRoZSBwYWdlIG1h
eSBiZSBpbg0KPiBvZmZsaW5pbmcNCj4gPj4gc3RhdGUgKFBHQ19zdGF0ZV9vZmZsaW5pbmcpIGJl
Zm9yZSBpdCBpcyBhc3NpZ25lZCB0byBhIGRvbWFpbi4NCj4gPj4NCj4gPj4gT24gZGVidWcgYnVp
bGQsIHRoaXMgbWF5IHJlc3VsdCB0byBoaXQgdGhlIGFzc2VydCBvciBqdXN0IGNsb2JiZXIgdGhl
DQo+ID4+IHN0YXRlLiBPbiBub24tZGVidWcgYnVpbGQsIHRoZSBzdGF0ZSB3aWxsIGdldCBjbG9i
YmVyZWQuDQo+ID4+DQo+ID4+IEluY2lkZW50YWxseSB0aGUgZmxhZyBQR0NfYnJva2VuIHdpbGwg
Z2V0IGNsb2JiZXJlZCBhcyB3ZWxsLg0KPiA+Pg0KPiA+PiBHcmFiIHRoZSBoZWFwX2xvY2sgdG8g
cHJldmVudCBhIHJhY2Ugd2l0aCBvZmZsaW5lX3BhZ2UoKSBhbmQga2VlcCB0aGUNCj4gPj4gc3Rh
dGUgYW5kIGJyb2tlbiBmbGFnIGFyb3VuZC4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gPg0KPiA+IFRoaXMgc2VlbXMgbGlrZSBh
IHJlYXNvbmFibGUgY2hhbmdlLiBJIGd1ZXNzIGhhdmluZyBhc3NpZ25fcGFnZXMoKSB0YWtlDQo+
IHRoZSBnbG9iYWwgbG9jayBpcyBubyBtb3JlIHByb2JsZW0gdGhhbiBpdHMgZXhpc3RpbmcgY2Fs
bCB0bw0KPiBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpIHdoaWNoIGFsc28gdGFrZXMgdGhlIHNh
bWUgbG9jay4NCj4gDQo+IFRoYXQncyBteSB1bmRlcnN0YW5kaW5nLiBTdW1tYXJpemluZyBvdXIg
ZGlzY3Vzc2lvbiBJUkwgZm9yIHRoZSBvdGhlciwNCj4gaXQgaXMgbm90IGNsZWFyIHdoZXRoZXIg
dGhlIGxvY2sgaXMgZW5vdWdoIGhlcmUuDQo+IA0KPiAgRnJvbSBteSB1bmRlcnN0YW5kaW5nIHRo
ZSBzZXF1ZW5jZQ0KPiANCj4gcGdbaV0uY291bnRfaW5mbyAmPSAuLi47DQo+IHBnW2ldLmNvdW50
X2luZm8gfD0gLi4uOw0KPiANCj4gY291bGQgcmVzdWx0IHRvIG11bHRpcGxlIHJlYWQvd3JpdGUg
ZnJvbSB0aGUgY29tcGlsZXIuIFdlIGNvdWxkIHVzZSBhDQo+IHNpbmdsZSBhc3NpZ25tZW50LCBi
dXQgSSBzdGlsbCBkb24ndCB0aGluayB0aGlzIHByZXZlbnQgdGhlIGNvbXBpbGVyIHRvDQo+IGJl
IHVzZSBtdWx0aXBsZSByZWFkL3dyaXRlLg0KPiANCj4gVGhlIGNvbmNlcm4gd291bGQgYmUgYSBy
YWNlIHdpdGggZ2V0X3BhZ2Vfb3duZXJfYW5kX3JlZmVyZW5jZSgpLiBJZiAxIGlzDQo+IHNldCBi
ZWZvcmUgdGhlIHJlc3Qgb2YgdGhlIGJpdHMsIHRoZW4geW91IG1heSBiZSBhYmxlIHRvIGdldCB0
aGUgcGFnZS4NCj4gDQo+IFNvIEkgbWlnaHQgd2FudCB0byB1c2Ugd3JpdGVfYXRvbWljKCkgYmVs
b3cuIEFueSBvcGluaW9uPw0KPiANCg0KVEJIIEkgd29uZGVyIGlmIHdlIG91Z2h0IHRvIHNheSB0
aGF0IGFueSB1cGRhdGUgdG8gY291bnRfaW5mbyBvdWdodCB0byBiZSBkb25lIGJ5IGEgd3JpdGVf
YXRvbWljICh3aGVyZSBpdCdzIG5vdCBhbHJlYWR5IGRvbmUgYnkgY21weGNoZykuDQoNCiAgUGF1
bA0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
