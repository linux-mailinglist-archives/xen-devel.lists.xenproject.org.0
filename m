Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9992C3A67
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 08:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37392.69731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khpgt-0006AK-CZ; Wed, 25 Nov 2020 07:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37392.69731; Wed, 25 Nov 2020 07:58:15 +0000
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
	id 1khpgt-00069v-9L; Wed, 25 Nov 2020 07:58:15 +0000
Received: by outflank-mailman (input) for mailman id 37392;
 Wed, 25 Nov 2020 07:58:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xP3f=E7=amazon.co.uk=prvs=591f578ad=pdurrant@srs-us1.protection.inumbo.net>)
 id 1khpgr-00069q-Ol
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 07:58:13 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4b79f69-380a-443b-8306-a1f7c55417a1;
 Wed, 25 Nov 2020 07:58:10 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 25 Nov 2020 07:58:04 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1E2C6A1F62; Wed, 25 Nov 2020 07:58:03 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 25 Nov 2020 07:58:01 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 25 Nov 2020 07:58:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xP3f=E7=amazon.co.uk=prvs=591f578ad=pdurrant@srs-us1.protection.inumbo.net>)
	id 1khpgr-00069q-Ol
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 07:58:13 +0000
X-Inumbo-ID: a4b79f69-380a-443b-8306-a1f7c55417a1
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a4b79f69-380a-443b-8306-a1f7c55417a1;
	Wed, 25 Nov 2020 07:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1606291091; x=1637827091;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=pSVy8q3CeysJY4r8/vbWRC+tCrOCTRUOZ6JeinKUUKk=;
  b=EhOFRl3dbbHoU5Y6HDEhljydNo6vxOPLpE14+A5kcfpQqMG/M2/AR7lS
   f8XXPlPgTxTpsgdbhU8fEWgO79fqeY62k0dtLuk1ZeCn5KZaV0kpHLGNV
   pd8Zx0GP2+veCBwtN86+KRtRvgeRWJzfdb9C5l9SpOwhLe6fIqFtIRae+
   E=;
X-IronPort-AV: E=Sophos;i="5.78,368,1599523200"; 
   d="scan'208";a="68638787"
Subject: RE: [PATCH v3 01/13] viridian: don't blindly write to 32-bit registers is
 'mode' is invalid
Thread-Topic: [PATCH v3 01/13] viridian: don't blindly write to 32-bit registers is 'mode'
 is invalid
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 25 Nov 2020 07:58:04 +0000
Received: from EX13D32EUC002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS id 1E2C6A1F62;
	Wed, 25 Nov 2020 07:58:03 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 25 Nov 2020 07:58:01 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 25 Nov 2020 07:58:01 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQHWwv/mBCagLEwxTECmvm/ahimeeKnYe0Gw
Date: Wed, 25 Nov 2020 07:58:01 +0000
Message-ID: <0ccd665ede7f4118bf719d29dea40b02@EX13D32EUC003.ant.amazon.com>
References: <20201124190744.11343-1-paul@xen.org>
 <20201124190744.11343-2-paul@xen.org>
 <ed2dbafa-b1fc-7ce3-9814-9034b0393921@suse.com>
In-Reply-To: <ed2dbafa-b1fc-7ce3-9814-9034b0393921@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.102]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI1IE5vdmVtYmVyIDIwMjAgMDc6NTINCj4gVG86IFBhdWwg
RHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvLnVrPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSRTogW0VY
VEVSTkFMXSBbUEFUQ0ggdjMgMDEvMTNdIHZpcmlkaWFuOiBkb24ndCBibGluZGx5IHdyaXRlIHRv
IDMyLWJpdCByZWdpc3RlcnMgaXMgJ21vZGUnDQo+IGlzIGludmFsaWQNCj4gDQo+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4g
Y29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiAN
Cj4gDQo+IE9uIDI0LjExLjIwMjAgMjA6MDcsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBGcm9t
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4NCj4gPiBJZiBodm1fZ3Vl
c3RfeDg2X21vZGUoKSByZXR1cm5zIHNvbWV0aGluZyBvdGhlciB0aGFuIDggb3IgNCB0aGVuDQo+
ID4gdmlyaWRpYW5faHlwZXJjYWxsKCkgd2lsbCByZXR1cm4gaW1tZWRpYXRlbHkgYnV0LCBvbiB0
aGUgd2F5IG91dCwgd2lsbCB3cml0ZQ0KPiA+IGJhY2sgc3RhdHVzIGFzIGlmICdtb2RlJyB3YXMg
NC4gVGhpcyBwYXRjaCBzaW1wbHkgbWFrZXMgaXQgbGVhdmUgdGhlIHJlZ2lzdGVycw0KPiA+IGFs
b25lLg0KPiA+DQo+ID4gTk9URTogVGhlIGZvcm1hdHRpbmcgb2YgdGhlICdvdXQnIGxhYmVsIGFu
ZCB0aGUgc3dpdGNoIHN0YXRlbWVudCBhcmUgYWxzbw0KPiA+ICAgICAgIGFkanVzdGVkIGFzIHBl
ciBDT0RJTkdfU1RZTEUuDQo+IA0KPiBQYXJ0bHkgb25seSBhcyBmYXIgYXMgdGhlIGxhdHRlciBn
b2VzOg0KPiANCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMN
Cj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMNCj4gPiBAQCAt
NjkyLDEzICs2OTIsMTQgQEAgaW50IHZpcmlkaWFuX2h5cGVyY2FsbChzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykNCj4gPiAgICAgICAgICBicmVhazsNCj4gPiAgICAgIH0NCj4gPg0KPiA+IC1v
dXQ6DQo+ID4gKyBvdXQ6DQo+ID4gICAgICBvdXRwdXQucmVzdWx0ID0gc3RhdHVzOw0KPiA+ICAg
ICAgc3dpdGNoIChtb2RlKSB7DQo+IA0KPiBUaGlzIHdvdWxkIHdhbnQgdG8gYmUNCj4gDQo+ICAg
ICBzd2l0Y2ggKCBtb2RlICkNCj4gICAgIHsNCj4gDQoNCk9oLCB5ZXMuDQoNCj4gSSBndWVzcyB0
aGlzIGNvdWxkIGVhc2lseSBiZSB0YWtlbiBjYXJlIG9mIHdoaWxlIGNvbW1pdHRpbmcuDQoNClRo
YW5rcywNCg0KICBQYXVsDQoNCj4gDQo+IEphbg0K

