Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67142BABC9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 15:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32258.63286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Lw-0001NQ-RV; Fri, 20 Nov 2020 14:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32258.63286; Fri, 20 Nov 2020 14:25:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg7Lw-0001N5-Np; Fri, 20 Nov 2020 14:25:32 +0000
Received: by outflank-mailman (input) for mailman id 32258;
 Fri, 20 Nov 2020 14:25:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WHVp=E2=amazon.co.uk=prvs=5864bad74=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kg7Lv-0001My-FK
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:25:31 +0000
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c00be2c-ca04-4a8a-af52-75e5c2ab1898;
 Fri, 20 Nov 2020 14:25:30 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 20 Nov 2020 14:25:12 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id A58B02824CF; Fri, 20 Nov 2020 14:25:10 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Nov 2020 14:25:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 20 Nov 2020 14:25:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WHVp=E2=amazon.co.uk=prvs=5864bad74=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kg7Lv-0001My-FK
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 14:25:31 +0000
X-Inumbo-ID: 0c00be2c-ca04-4a8a-af52-75e5c2ab1898
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0c00be2c-ca04-4a8a-af52-75e5c2ab1898;
	Fri, 20 Nov 2020 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1605882330; x=1637418330;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=31z40IrFiOkeTaig0H3MJc307/RGe0tvascgzgZUi5Q=;
  b=VbjmDegtZzz86Mg3f9BgHnHZwlnS/+j9F657WetcVfy9ilPUosaeNeUk
   XyKADGGn3Ovtgk/eBLkSl6cNLVFo0XV+zXmQLq6cO7O9DFKrv57fER9FK
   St+ydBryL1pFcgvmALC2rHDf0zj1YiuD809o5BHn0G1gcUjCy2xEIrdzS
   s=;
X-IronPort-AV: E=Sophos;i="5.78,356,1599523200"; 
   d="scan'208";a="89153437"
Subject: RE: [PATCH v2 01/12] viridian: don't blindly write to 32-bit registers is
 'mode' is invalid
Thread-Topic: [PATCH v2 01/12] viridian: don't blindly write to 32-bit registers is 'mode'
 is invalid
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 20 Nov 2020 14:25:12 +0000
Received: from EX13D32EUC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS id A58B02824CF;
	Fri, 20 Nov 2020 14:25:10 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Nov 2020 14:25:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 20 Nov 2020 14:25:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQHWv0hWzbOqyITZRUa/qwL6gjpVQKnRErYQ
Date: Fri, 20 Nov 2020 14:25:09 +0000
Message-ID: <fcd68337f9fd496d9a87c5b84468330a@EX13D32EUC003.ant.amazon.com>
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-2-paul@xen.org>
 <0367ae3b-88a4-1a8d-b174-794b3fe61760@suse.com>
In-Reply-To: <0367ae3b-88a4-1a8d-b174-794b3fe61760@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.242]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIwIE5vdmVtYmVyIDIwMjAgMTQ6MjANCj4gVG86IFBhdWwg
RHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvLnVrPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSRTogW0VY
VEVSTkFMXSBbUEFUQ0ggdjIgMDEvMTJdIHZpcmlkaWFuOiBkb24ndCBibGluZGx5IHdyaXRlIHRv
IDMyLWJpdCByZWdpc3RlcnMgaXMgJ21vZGUnDQo+IGlzIGludmFsaWQNCj4gDQo+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4g
Y29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiAN
Cj4gDQo+IE9uIDIwLjExLjIwMjAgMTA6NDgsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBGcm9t
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4NCj4gPiBJZiBodm1fZ3Vl
c3RfeDg2X21vZGUoKSByZXR1cm5zIHNvbWV0aGluZyBvdGhlciB0aGFuIDggb3IgNCB0aGVuDQo+
ID4gdmlyaWRpYW5faHlwZXJjYWxsKCkgd2lsbCByZXR1cm4gaW1tZWRpYXRlbHkgYnV0LCBvbiB0
aGUgd2F5IG91dCwgd2lsbCB3cml0ZQ0KPiA+IGJhY2sgc3RhdHVzIGFzIGlmICdtb2RlJyB3YXMg
NC4gVGhpcyBwYXRjaCBzaW1wbHkgbWFrZXMgaXQgbGVhdmUgdGhlIHJlZ2lzdGVycw0KPiA+IGFs
b25lLg0KPiANCj4gSU9XIDE2LWJpdCBwcm90ZWN0ZWQgbW9kZSBhbmQgcmVhbCBtb2RlIGFyZW4n
dCBhbGxvd2VkIHRvIG1ha2UNCj4gaHlwZXJjYWxscyAoc3VwcG9ydGVkIGFsc28gYmUgdGhlIGVh
cmxpZXIgc3dpdGNoKCkgaW4gdGhlDQo+IGZ1bmN0aW9uKT8NCg0KSSBkb24ndCB0aGluayBydW5u
aW5nIGVubGlnaHRlbmVkIHZlcnNpb25zIG9mIE9TLzIgMS4zIGlzIHJlYWxseSBhIHVzZSBjYXNl
IDotKQ0KDQo+IEJ1dCB0aGVuLCB0byBhY2hpZXZlIHdoYXQgeW91IHdhbnQsIHdvdWxkbid0IGl0
IGJlDQo+IG1vcmUgZGlyZWN0IHRvIHNpbXBseSAicmV0dXJuIEhWTV9IQ0FMTF9jb21wbGV0ZWQ7
IiBzdHJhaWdodA0KPiBmcm9tIHRoYXQgZWFybGllciBzd2l0Y2goKSdzIGRlZmF1bHQgY2FzZT8g
QXQgd2hpY2ggcG9pbnQgdGhlDQo+IHN3aXRjaCgpIHlvdSBtb2RpZnkgY291bGQgYmVjb21lIGlm
L2Vsc2U/IEFueXdheSAtIHlvdSdyZSB0aGUNCj4gbWFpbnRhaW5lciwgSSdtIGp1c3Qgd29uZGVy
aW5nIC4uLg0KPiANCg0KSXQgY291bGQgYmUgZG9uZSB0aGF0IHdheSBidXQgSSBwcmVmZXIgdGhl
IGV4aXQgcGF0aCB2aWEgZ290by4NCg0KICBQYXVsDQoNCj4gSmFuDQo=

