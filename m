Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFF537A707
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 14:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125757.236715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgRml-0005xl-Ng; Tue, 11 May 2021 12:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125757.236715; Tue, 11 May 2021 12:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgRml-0005vv-KI; Tue, 11 May 2021 12:46:51 +0000
Received: by outflank-mailman (input) for mailman id 125757;
 Tue, 11 May 2021 12:46:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xBg=KG=amazon.co.uk=prvs=758e73cee=pdurrant@srs-us1.protection.inumbo.net>)
 id 1lgRmk-0005vp-Gd
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 12:46:50 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 971a21c8-0e00-4345-8fce-efb28f18d447;
 Tue, 11 May 2021 12:46:49 +0000 (UTC)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 11 May 2021 12:46:41 +0000
Received: from EX13D32EUC003.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 146DAA1865; Tue, 11 May 2021 12:46:40 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 11 May 2021 12:46:38 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.015;
 Tue, 11 May 2021 12:46:38 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 971a21c8-0e00-4345-8fce-efb28f18d447
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1620737210; x=1652273210;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=9mYQdexU/j0t5uVV5OxSrAwNJQ/AzFnPxwg3Sa0K8j8=;
  b=SyxpRNur4pfBWr1E93VXSdiYOr/d1El7iIepzUnfl9fzwSmtMygfQxSb
   BKcN47kR7s+/DtwBgbxrBhVSuvjFzHWzCIPoYWOwZr4+PWZS3pbynM+hi
   IaR3SQ5vjYCShWPcj1QTaHQJ31lLr9JPwx8JlIbIfJX/vWOVN0Wouz45x
   4=;
X-IronPort-AV: E=Sophos;i="5.82,290,1613433600"; 
   d="scan'208";a="134361449"
Subject: RE: [PATCH] xen-netback: Check for hotplug-status existence before watching
Thread-Topic: [PATCH] xen-netback: Check for hotplug-status existence before watching
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Michael Brown <mbrown@fensystems.co.uk>, "paul@xen.org" <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "wei.liu@kernel.org"
	<wei.liu@kernel.org>
Thread-Index: AQHXMHlgrSEnNO4f/0CXVVR3ElA0XKrdNJQAgAAEMoCAAAGvAIAAA+GAgAAKCwCAAL1BsIAAPacAgAABMQCAACDP4A==
Date: Tue, 11 May 2021 12:46:38 +0000
Message-ID: <9edd6873034f474baafd70b1df693001@EX13D32EUC003.ant.amazon.com>
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk> <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
 <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
 <YJmMvTkp2Y1hlLLm@mail-itl>
 <df9e9a32b0294aee814eeb58d2d71edd@EX13D32EUC003.ant.amazon.com>
 <YJpfORXIgEaWlQ7E@mail-itl> <YJpgNvOmDL9SuRye@mail-itl>
In-Reply-To: <YJpgNvOmDL9SuRye@mail-itl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.209]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+IFNlbnQ6IDExIE1h
eSAyMDIxIDExOjQ1DQo+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+
DQo+IENjOiBNaWNoYWVsIEJyb3duIDxtYnJvd25AZmVuc3lzdGVtcy5jby51az47IHBhdWxAeGVu
Lm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBuZXRkZXZAdmdlci5rZXJu
ZWwub3JnOyB3ZWkubGl1QGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BB
VENIXSB4ZW4tbmV0YmFjazogQ2hlY2sgZm9yIGhvdHBsdWctc3RhdHVzIGV4aXN0ZW5jZSBiZWZv
cmUgd2F0Y2hpbmcNCj4gDQo+IE9uIFR1ZSwgTWF5IDExLCAyMDIxIGF0IDEyOjQwOjU0UE0gKzAy
MDAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4gPiBPbiBUdWUsIE1heSAx
MSwgMjAyMSBhdCAwNzowNjo1NUFNICswMDAwLCBEdXJyYW50LCBQYXVsIHdyb3RlOg0KPiA+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBNYXJlayBNYXJjenlr
b3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+ID4gPiA+
IFNlbnQ6IDEwIE1heSAyMDIxIDIwOjQzDQo+ID4gPiA+IFRvOiBNaWNoYWVsIEJyb3duIDxtYnJv
d25AZmVuc3lzdGVtcy5jby51az47IHBhdWxAeGVuLm9yZw0KPiA+ID4gPiBDYzogcGF1bEB4ZW4u
b3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IG5ldGRldkB2Z2VyLmtlcm5lbC5v
cmc7IHdlaS5saXVAa2VybmVsLm9yZzsNCj4gRHVycmFudCwNCj4gPiA+ID4gUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvLnVrPg0KPiA+ID4gPiBTdWJqZWN0OiBSRTogW0VYVEVSTkFMXSBbUEFUQ0hd
IHhlbi1uZXRiYWNrOiBDaGVjayBmb3IgaG90cGx1Zy1zdGF0dXMgZXhpc3RlbmNlIGJlZm9yZSB3
YXRjaGluZw0KPiA+ID4gPg0KPiA+ID4gPiBPbiBNb24sIE1heSAxMCwgMjAyMSBhdCAwODowNjo1
NVBNICswMTAwLCBNaWNoYWVsIEJyb3duIHdyb3RlOg0KPiA+ID4gPiA+IElmIHlvdSBoYXZlIGEg
c3VnZ2VzdGVkIHBhdGNoLCBJJ20gaGFwcHkgdG8gdGVzdCB0aGF0IGl0IGRvZXNuJ3QgcmVpbnRy
b2R1Y2UNCj4gPiA+ID4gPiB0aGUgcmVncmVzc2lvbiBidWcgdGhhdCB3YXMgZml4ZWQgYnkgdGhp
cyBjb21taXQuDQo+ID4gPiA+DQo+ID4gPiA+IEFjdHVhbGx5LCBJJ3ZlIGp1c3QgdGVzdGVkIHdp
dGggYSBzaW1wbGUgcmVsb2FkaW5nIHhlbi1uZXRmcm9udCBtb2R1bGUuIEl0DQo+ID4gPiA+IHNl
ZW1zIGluIHRoaXMgY2FzZSwgdGhlIGhvdHBsdWcgc2NyaXB0IGlzIG5vdCByZS1leGVjdXRlZC4g
SW4gZmFjdCwgSQ0KPiA+ID4gPiB0aGluayBpdCBzaG91bGQgbm90IGJlIHJlLWV4ZWN1dGVkIGF0
IGFsbCwgc2luY2UgdGhlIHZpZiBpbnRlcmZhY2UNCj4gPiA+ID4gcmVtYWlucyBpbiBwbGFjZSAo
aXQganVzdCBnZXRzIE5PLUNBUlJJRVIgZmxhZykuDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgYnJp
bmdzIGEgcXVlc3Rpb24sIHdoeSByZW1vdmluZyBob3RwbHVnLXN0YXR1cyBpbiB0aGUgZmlyc3Qg
cGxhY2U/DQo+ID4gPiA+IFRoZSBpbnRlcmZhY2UgcmVtYWlucyBjb3JyZWN0bHkgY29uZmlndXJl
ZCBieSB0aGUgaG90cGx1ZyBzY3JpcHQgYWZ0ZXINCj4gPiA+ID4gYWxsLiBGcm9tIHRoZSBjb21t
aXQgbWVzc2FnZToNCj4gPiA+ID4NCj4gPiA+ID4gICAgIHhlbi1uZXRiYWNrOiByZW1vdmUgJ2hv
dHBsdWctc3RhdHVzJyBvbmNlIGl0IGhhcyBzZXJ2ZWQgaXRzIHB1cnBvc2UNCj4gPiA+ID4NCj4g
PiA+ID4gICAgIFJlbW92aW5nIHRoZSAnaG90cGx1Zy1zdGF0dXMnIG5vZGUgaW4gbmV0YmFja19y
ZW1vdmUoKSBpcyB3cm9uZzsgdGhlIHNjcmlwdA0KPiA+ID4gPiAgICAgbWF5IG5vdCBoYXZlIGNv
bXBsZXRlZC4gT25seSByZW1vdmUgdGhlIG5vZGUgb25jZSB0aGUgd2F0Y2ggaGFzIGZpcmVkIGFu
ZA0KPiA+ID4gPiAgICAgaGFzIGJlZW4gdW5yZWdpc3RlcmVkLg0KPiA+ID4gPg0KPiA+ID4gPiBJ
IHRoaW5rIHRoZSBpbnRlbnRpb24gd2FzIHRvIHJlbW92ZSAnaG90cGx1Zy1zdGF0dXMnIG5vZGUg
X2xhdGVyXyBpbg0KPiA+ID4gPiBjYXNlIG9mIHF1aWNrbHkgYWRkaW5nIGFuZCByZW1vdmluZyB0
aGUgaW50ZXJmYWNlLiBJcyB0aGF0IHJpZ2h0LCBQYXVsPw0KPiA+ID4NCj4gPiA+IFRoZSByZW1v
dmFsIHdhcyBkb25lIHRvIGFsbG93IHVuYmluZC9iaW5kIHRvIGZ1bmN0aW9uIGNvcnJlY3RseS4g
SUlSQyBiZWZvcmUgdGhlIG9yaWdpbmFsIHBhdGNoDQo+IGRvaW5nIGEgYmluZCB3b3VsZCBzdGFs
bCBmb3JldmVyIHdhaXRpbmcgZm9yIHRoZSBob3RwbHVnIHN0YXR1cyB0byBjaGFuZ2UsIHdoaWNo
IHdvdWxkIG5ldmVyIGhhcHBlbi4NCj4gPg0KPiA+IEhtbSwgaW4gdGhhdCBjYXNlIG1heWJlIGRv
bid0IHJlbW92ZSBpdCBhdCBhbGwgaW4gdGhlIGJhY2tlbmQsIGFuZCBsZXQNCj4gPiBpdCBiZSBj
bGVhbmVkIHVwIGJ5IHRoZSB0b29sc3RhY2ssIHdoZW4gaXQgcmVtb3ZlcyBvdGhlciBiYWNrZW5k
LXJlbGF0ZWQNCj4gPiBub2Rlcz8NCj4gDQo+IE5vLCB1bmJpbmQvYmluZCBfZG9lc18gcmVxdWly
ZSBob3RwbHVnIHNjcmlwdCB0byBiZSBjYWxsZWQgYWdhaW4uDQo+IA0KDQpZZXMsIHNvcnJ5IEkg
d2FzIG1pc3JlbWVtYmVyaW5nLiBNeSBtZW1vcnkgaXMgaGF6eSBidXQgdGhlcmUgd2FzIGRlZmlu
aXRlbHkgYSBwcm9ibGVtIGF0IHRoZSB0aW1lIHdpdGggbGVhdmluZyB0aGUgbm9kZSBpbiBwbGFj
ZS4NCg0KPiBXaGVuIGV4YWN0bHkgdmlmIGludGVyZmFjZSBhcHBlYXJzIGluIHRoZSBzeXN0ZW0g
KHN0YXJ0cyB0byBiZSBhdmFpbGFibGUNCj4gZm9yIHRoZSBob3RwbHVnIHNjcmlwdCk/IE1heWJl
IHJlbW92ZSAnaG90cGx1Zy1zdGF0dXMnIGp1c3QgYmVmb3JlIHRoYXQNCj4gcG9pbnQ/DQo+IA0K
DQpJIHJlYWxseSBjYW4ndCByZW1lbWJlciBhbnkgZGV0YWlsLiBQZXJoYXBzIHRyeSByZXZlcnRp
bmcgYm90aCBwYXRjaGVzIHRoZW4gYW5kIGNoZWNrIHRoYXQgdGhlIHVuYmluZC9ybW1vZC9tb2Rw
cm9iZS9iaW5kIHNlcXVlbmNlIHN0aWxsIHdvcmtzIChhbmQgdGhlIGJhY2tlbmQgYWN0dWFsbHkg
bWFrZXMgaXQgaW50byBjb25uZWN0ZWQgc3RhdGUpLg0KDQogIFBhdWwNCg0K

