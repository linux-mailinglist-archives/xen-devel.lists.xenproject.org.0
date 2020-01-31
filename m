Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF57F14EC4F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 13:14:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixV9M-0005Dk-I3; Fri, 31 Jan 2020 12:11:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixV9L-0005Df-7t
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 12:11:51 +0000
X-Inumbo-ID: dc7ebe66-4422-11ea-8396-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc7ebe66-4422-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 12:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580472711; x=1612008711;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nYcEmFie8dnGA1y9RBEtxlYiRA+m+ckMxgVtV70KT2A=;
 b=pHwLBn7JAS5of28SNSBCAZ3Z3k5TOIRkgRnjkGKrY3gVlUsoNUAO4m/l
 qzju2zFOcK9c7hhJhEkptq6yf9y7Z2Gcc0jgSRwNdd8UuaqQyAxINeG0Y
 jy10a33hZ/BLyVgu0A6gwFplWznXRfhnuCATGx6vVI1h3NbdlLYDbkO/t A=;
IronPort-SDR: oxY8InpjHcwbgVrnpMsnd63zbOwSU+9Vu4x2OS/ZDXw1us58ZWiKluu57ZLcZGZa973Rmf9SAy
 bfMQRdTXYKCQ==
X-IronPort-AV: E=Sophos;i="5.70,385,1574121600"; d="scan'208";a="15617192"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 31 Jan 2020 12:11:48 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9A4C2A23F5; Fri, 31 Jan 2020 12:11:45 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 12:11:45 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 12:11:44 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 31 Jan 2020 12:11:44 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
Thread-Index: AQHV0TKAfSuQBKGYT06LZ4VCzz55Pqf2xNQAgA3bA5CAAAqegIAAAHtQgAAQtoCAAACIAA==
Date: Fri, 31 Jan 2020 12:11:43 +0000
Message-ID: <8e39c518bdb14459bb81bce3facb4d23@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
 <20200122145248.GB57924@desktop-tdan49n.eng.citrite.net>
 <61e9f341fc1b48beaa6266bb90ff2701@EX13D32EUC003.ant.amazon.com>
 <20200131110603.GS4679@Air-de-Roger>
 <53287f7ea7984575b91ab388cfe0bee8@EX13D32EUC003.ant.amazon.com>
 <338fb252-42b9-5491-786b-d8b19fe7829b@citrix.com>
In-Reply-To: <338fb252-42b9-5491-786b-d8b19fe7829b@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAzMSBKYW51YXJ5IDIwMjAgMTI6MDgNCj4g
VG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IFJvZ2VyIFBhdSBNb25u
w6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDYzogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdlaQ0KPiBMaXUgPHds
QHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjQgMS83XSBsaWJ4
bDogYWRkIGRlZmluaXRpb24gb2YNCj4gSU5WQUxJRF9ET01JRCB0byB0aGUgQVBJDQo+IA0KPiBP
biAzMS8wMS8yMDIwIDExOjEwLCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4gPj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDExOjA2DQo+ID4+IFRvOiBE
dXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+ID4+IENjOiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhlbi0NCj4gPj4gZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsN
Cj4gV2VpDQo+ID4+IExpdSA8d2xAeGVuLm9yZz4NCj4gPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2
ZWxdIFtQQVRDSCB2NCAxLzddIGxpYnhsOiBhZGQgZGVmaW5pdGlvbiBvZg0KPiA+PiBJTlZBTElE
X0RPTUlEIHRvIHRoZSBBUEkNCj4gPj4NCj4gPj4gT24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMTA6
MzE6NDlBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNA
bGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+Pj4+IFJvZ2VyIFBhdSBNb25u
w6kNCj4gPj4+PiBTZW50OiAyMiBKYW51YXJ5IDIwMjAgMTQ6NTMNCj4gPj4+PiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiA+Pj4+IENjOiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhlbi0NCj4gPj4+PiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ow0K
PiA+PiBXZWkNCj4gPj4+PiBMaXUgPHdsQHhlbi5vcmc+DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtY
ZW4tZGV2ZWxdIFtQQVRDSCB2NCAxLzddIGxpYnhsOiBhZGQgZGVmaW5pdGlvbiBvZg0KPiA+Pj4+
IElOVkFMSURfRE9NSUQgdG8gdGhlIEFQSQ0KPiA+Pj4+DQo+ID4+Pj4gT24gV2VkLCBKYW4gMjIs
IDIwMjAgYXQgMDI6NDQ6NDBQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+Pj4+PiBD
dXJyZW50bHkgYm90aCB4bCBhbmQgbGlieGwgaGF2ZSBpbnRlcm5hbCBkZWZpbml0aW9ucyBvZg0K
PiA+PiBJTlZBTElEX0RPTUlEDQo+ID4+Pj4+IHdoaWNoIGhhcHBlbiB0byBiZSBpZGVudGljYWwu
IEhvd2V2ZXIsIGZvciB0aGUgcHVycG9zZXMgb2YNCj4gPj4gZGVzY3JpYmluZw0KPiA+Pj4+IHRo
ZQ0KPiA+Pj4+PiBiZWhhdmlvdXIgb2YgbGlieGxfZG9tYWluX2NyZWF0ZV9uZXcvcmVzdG9yZSgp
IGl0IGlzIHVzZWZ1bCB0byBoYXZlDQo+ID4+IGENCj4gPj4+Pj4gc3BlY2lmaWVkIGludmFsaWQg
dmFsdWUgZm9yIGEgZG9tYWluIGlkLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBUaGlzIHBhdGNoIHRoZXJl
Zm9yZSBtb3ZlcyB0aGUgbGlieGwgZGVmaW5pdGlvbiBmcm9tDQo+ID4+IGxpYnhsX2ludGVybmFs
LmggdG8NCj4gPj4+Pj4gbGlieGwuaCBhbmQgcmVtb3ZlcyB0aGUgaW50ZXJuYWwgZGVmaW5pdGlv
biBmcm9tIHhsX3V0aWxzLmguIFRoZQ0KPiA+Pj4+IGhhcmRjb2RlZA0KPiA+Pj4+PiAnLTEnIHBh
c3NlZCBiYWNrIHZpYSBkb21jcmVhdGVfY29tcGxldGUoKSBpcyB0aGVuIHVwZGF0ZWQgdG8NCj4g
Pj4+PiBJTlZBTElEX0RPTUlEDQo+ID4+Pj4+IGFuZCBjb21tZW50IGFib3ZlIGxpYnhsX2RvbWFp
bl9jcmVhdGVfbmV3L3Jlc3RvcmUoKSBpcyBhY2NvcmRpbmdseQ0KPiA+Pj4+PiBtb2RpZmllZC4N
Cj4gPj4+PiBVcmcsIGl0J3Mga2luZCBvZiB1Z2x5IHRvIGFkZCBhbm90aGVyIGRlZmluaXRpb24g
b2YgaW52YWxpZCBkb21pZA0KPiB3aGVuDQo+ID4+Pj4gdGhlcmUncyBhbHJlYWR5IERPTUlEX0lO
VkFMSUQgaW4gdGhlIHB1YmxpYyBoZWFkZXJzLiBJIGd1ZXNzIHRoZXJlJ3MNCj4gYQ0KPiA+Pj4+
IHJlYXNvbiBJJ20gbWlzc2luZyBmb3Igbm90IHVzaW5nIERPTUlEX0lOVkFMSUQgaW5zdGVhZCBv
ZiBpbnRyb2R1Y2luZw0KPiA+Pj4+IGEgbmV3IHZhbHVlPw0KPiA+Pj4+DQo+ID4+PiBUQkggSSBk
b24ndCBrbm93LiBBcyBmYXIgYXMgeGwvbGlieGwgZ29lcywgZG9taWRzIGFyZSB1aW50MzJfdHMg
c28NCj4gbWF5YmUNCj4gPj4gRE9NSURfSU5WQUxJRCB3YXMgZm9yIHNvbWUgcmVhc29uIG5vdCBj
b25zaWRlcmVkIGFwcHJvcHJpYXRlPw0KPiANCj4gUmVhZCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hl
cmUgSSBkaWQgdGhlIGJsYW5rZXQgY2hhbmdlIHRvIHVzZSB1aW50MzJfdC4NCj4gDQo+IGMvcyA1
YjQyYzgyZjU1DQo+IA0KPiBEb2VzIHRoaXMgcmVhbGx5IG5lZWQgdG8gZW50ZXIgdGhlIEFQST8N
Cj4gDQoNCkkgbmVlZCBhICdtYWdpYycgdmFsdWUgZm9yIFJBTkRPTV9ET01JRCBzbyBpdCBzZWVt
ZWQgcmVhc29uYWJsZSB0byBtYWtlIHRoaXMgcGFydCBvZiB0aGUgeGwvbGlieGwgQVBJIHRvby4g
SSBkb24ndCB0aGluayBsaWJ4YyBpcyBpbiBzY29wZSBoZXJlLg0KDQogIFBhdWwNCg0KPiB+QW5k
cmV3DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
