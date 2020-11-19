Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1A2B9847
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31175.61451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfn38-0004pg-H1; Thu, 19 Nov 2020 16:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31175.61451; Thu, 19 Nov 2020 16:44:46 +0000
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
	id 1kfn38-0004pH-De; Thu, 19 Nov 2020 16:44:46 +0000
Received: by outflank-mailman (input) for mailman id 31175;
 Thu, 19 Nov 2020 16:44:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkQB=EZ=amazon.co.uk=prvs=585d586a4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1kfn35-0004pB-Av
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:44:44 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 774accde-8ff4-48eb-a315-3b1bc2a4ba3e;
 Thu, 19 Nov 2020 16:44:42 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 19 Nov 2020 16:44:14 +0000
Received: from EX13D32EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id 723A3A1815; Thu, 19 Nov 2020 16:44:13 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Nov 2020 16:44:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Thu, 19 Nov 2020 16:44:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UkQB=EZ=amazon.co.uk=prvs=585d586a4=pdurrant@srs-us1.protection.inumbo.net>)
	id 1kfn35-0004pB-Av
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:44:44 +0000
X-Inumbo-ID: 774accde-8ff4-48eb-a315-3b1bc2a4ba3e
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 774accde-8ff4-48eb-a315-3b1bc2a4ba3e;
	Thu, 19 Nov 2020 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazon201209; t=1605804283; x=1637340283;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=VLTt7k+mJi2k1vph95d3zjqOxoHe5LTCd/Mlm0vsea8=;
  b=Hh0Yiltc6qDr/YD8GE+c5r0xyNeKgxsschdUlyZru1Ow4z8LxUF/t9sG
   JI8IxvQBYqIUOhJ4Mys7xLP+BkTNRn+k77iGpygC3qyVGeg8cREzVUVdg
   9TcOvjR5nEH8mUL4jm6G0RXROZqMpoaRMv6RXuyqotU8HhGodrkpzpXEH
   g=;
X-IronPort-AV: E=Sophos;i="5.78,353,1599523200"; 
   d="scan'208";a="97060094"
Subject: RE: [PATCH 03/10] viridian: introduce a per-cpu hypercall_vpmask and
 accessor functions...
Thread-Topic: [PATCH 03/10] viridian: introduce a per-cpu hypercall_vpmask and accessor
 functions...
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 19 Nov 2020 16:44:14 +0000
Received: from EX13D32EUC002.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS id 723A3A1815;
	Thu, 19 Nov 2020 16:44:13 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Nov 2020 16:44:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Thu, 19 Nov 2020 16:44:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>
CC: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
	=?utf-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQIKCyTUSJ7jm2WJ2nMqsy5EhijKogKUvRrlAaY1NKepRytzUIAADEcAgAAAkQA=
Date: Thu, 19 Nov 2020 16:44:12 +0000
Message-ID: <b70dad84ef9e400caa023da53494dc0a@EX13D32EUC003.ant.amazon.com>
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-4-paul@xen.org>
 <01c7747e-70d0-e32b-45a6-afc1688c1741@suse.com>
 <00c901d6be8d$6d7a5c10$486f1430$@xen.org>
 <0ec90042-cb19-320e-1676-409b68b73a51@suse.com>
In-Reply-To: <0ec90042-cb19-320e-1676-409b68b73a51@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.145]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE5IE5vdmVtYmVyIDIwMjAgMTY6NDENCj4gVG86IHBhdWxA
eGVuLm9yZw0KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgJ1dl
aSBMaXUnIDx3bEB4ZW4ub3JnPjsgJ0FuZHJldyBDb29wZXInDQo+IDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsgJ1JvZ2VyIFBhdSBNb25uw6knIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSRTogW0VYVEVSTkFMXSBb
UEFUQ0ggMDMvMTBdIHZpcmlkaWFuOiBpbnRyb2R1Y2UgYSBwZXItY3B1IGh5cGVyY2FsbF92cG1h
c2sgYW5kIGFjY2Vzc29yDQo+IGZ1bmN0aW9ucy4uLg0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFp
bCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3Blbg0KPiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRo
ZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24g
MTkuMTEuMjAyMCAxNzowMiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+PiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20NCj4gPj4gU2VudDogMTIgTm92ZW1iZXIgMjAyMCAwODo0
Ng0KPiA+Pg0KPiA+PiBPbiAxMS4xMS4yMDIwIDIxOjA3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMNCj4gPj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYw0KPiA+Pj4gQEAgLTUwNywx
NSArNTA3LDQxIEBAIHZvaWQgdmlyaWRpYW5fZG9tYWluX2RlaW5pdChzdHJ1Y3QgZG9tYWluICpk
KQ0KPiA+Pj4gICAgICBYRlJFRShkLT5hcmNoLmh2bS52aXJpZGlhbik7DQo+ID4+PiAgfQ0KPiA+
Pj4NCj4gPj4+ICtzdHJ1Y3QgaHlwZXJjYWxsX3ZwbWFzayB7DQo+ID4+PiArICAgIERFQ0xBUkVf
QklUTUFQKG1hc2ssIEhWTV9NQVhfVkNQVVMpOw0KPiA+Pj4gK307DQo+ID4+PiArDQo+ID4+PiAr
c3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBoeXBlcmNhbGxfdnBtYXNrLCBoeXBlcmNhbGxf
dnBtYXNrKTsNCj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgdm9pZCB2cG1hc2tfZW1wdHkoc3RydWN0
IGh5cGVyY2FsbF92cG1hc2sgKnZwbWFzaykNCj4gPj4NCj4gPj4gY29uc3Q/DQo+ID4NCj4gPiBZ
ZXMsIEkgc3VwcG9zZSB0aGF0J3Mgb29rIGZvciBhbGwgdGhlc2Ugc2luY2UgdGhlIG91dGVyIHN0
cnVjdCBpcw0KPiA+IG5vdCBjaGFuZ2luZy4uLiBJdCdzIGEgYml0IG1pc2xlYWRpbmcgdGhvdWdo
Lg0KPiANCj4gSSdkIGJlIGN1cmlvdXMgdG8gbGVhcm4gYWJvdXQgdGhhdCAibWlzbGVhZGluZyIg
YXNwZWN0Lg0KPiANCg0KQmVjYXVzZSB0aGUgZnVuY3Rpb24gaXMgbW9kaWZ5aW5nICh6ZXJvLWlu
ZykgdGhlIGJpdG1hcC4uLiBzbyBpbXBseWluZyB0aGUgbWFzayBpcyBjb25zdCBpcyBtZWFzbGVh
ZGluZy4NCg0KICBQYXVsDQoNCj4gSmFuDQo=

