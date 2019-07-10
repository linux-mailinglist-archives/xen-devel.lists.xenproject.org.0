Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313426460B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 14:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlBPd-0007dw-EK; Wed, 10 Jul 2019 12:09:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hlBPc-0007dr-Jw
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 12:09:28 +0000
X-Inumbo-ID: 813bc627-a30b-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 813bc627-a30b-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 12:09:27 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 10 Jul 2019 12:05:30 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 10 Jul 2019 11:59:30 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 11:59:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkhv/UbQ2+ZKjcaBxf2aTJ1SO66fp8926shkbZPTDlm7wRFyp1BpztvbA9y9pO8YWJc5rmoImRATGIu6HwwaTJ/ipX3fFanB7rK7iUAdOaDd8GrmCZOxOqF2q0BObt91Lw2khCH1EKpH9N/vc090dMeKsvAIoBHkZa+HJ/QmFF6R69sWU11e03h1TUprXJy05t6S7yFs+LTPPOybhPfALPRb/BdFGex+JXavipjlv1Omn/nAqVhoJd4lBA2g8znOXNZfhRiAuwJwaYHjT8NKDiU44+457fYUshVvER/B7L3+j76tek44uykBrhmsB4o0GxL5w4bx7s0e9RU87c/V8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CVM5TRaMtwUCg2wR7qoi2d47a8fDbbxpZG3B7flG18=;
 b=jkukKBtjUP0mZMt4j0P/Qp3wjSQSUkiWEAzVfLtkkeor0drY3hZGRZ/kmCIQjGxI5Ghv325FH7D1pkiNu4yDi0T+f1YhbF+d8QA29ifUXvTeuqZ3M3W5uduvIxo3ov7kWGnohcI2iEfwws9ZYcdWG3WgnM8kIgRYmZvKMtqUR+SyEpwB7JI0iKsvG4dIdKTA6Odszfsf5jKsuzk0u7Yn8oG3wmNi4nv7zAzmpX4V3vO5umVAzazSNgykkRcNrGLCGXLfDSlq2ikfI2AyBufgqSOP8bxG51z0qBFFAyeEZ9wmgx9Qyqt0F7VFuetLXe0jQfFDsdZtdpxO98LMv+ooNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2971.namprd18.prod.outlook.com (20.179.52.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 10 Jul 2019 11:59:29 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 11:59:29 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [PATCH L1TF MDS GT v1 2/3] common/grant_table: harden bound
 accesses
Thread-Index: AQHVNYznzzKh5NhX7k+L3inK3UdaXabDTtWAgABAngeAADNMAA==
Date: Wed, 10 Jul 2019 11:59:29 +0000
Message-ID: <ed9f9a1e-8e7a-8769-1b9f-64d0bf6dac00@suse.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-3-git-send-email-nmanthey@amazon.de>
 <5CE6AB600200007800231BF1@prv1-mh.provo.novell.com>
 <a7c5bda7-0759-5b15-1174-8d9e95ef06c5@amazon.de>
 <5CE7D1410200007800231F86@prv1-mh.provo.novell.com>
 <d1205382-17ff-40ac-d66d-2e6edf59364a@amazon.de>
 <627756a7-7a20-b1ae-31f2-bd7affe0e14d@suse.com>
 <7bbf3298-94d6-0b6a-9809-46f655478167@amazon.de>
In-Reply-To: <7bbf3298-94d6-0b6a-9809-46f655478167@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR02CA0079.namprd02.prod.outlook.com
 (2603:10b6:405:60::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc58fe1e-033c-472a-c40c-08d7052e1055
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2971; 
x-ms-traffictypediagnostic: DM6PR18MB2971:
x-microsoft-antispam-prvs: <DM6PR18MB2971C1D75A865E3C3EAA65ADB3F00@DM6PR18MB2971.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(26005)(2906002)(478600001)(8936002)(446003)(2616005)(14444005)(256004)(8676002)(81156014)(11346002)(316002)(36756003)(6246003)(6116002)(31686004)(99286004)(7416002)(7736002)(486006)(476003)(54906003)(305945005)(186003)(81166006)(3846002)(76176011)(229853002)(4326008)(6486002)(66066001)(14454004)(66946007)(52116002)(66556008)(64756008)(66476007)(66446008)(25786009)(71190400001)(31696002)(102836004)(68736007)(80792005)(6512007)(86362001)(6436002)(386003)(71200400001)(6506007)(5660300002)(6916009)(53546011)(53936002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2971;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uIqiHTl8PKZDlchCDgAr9MCF2GRzWs8j1oDiq/fPQAguGBIXu+sBYNfGIkZVDYVJXERFhqFcdp9lqNKZ6GMxLgTCdZYVGsfnzRhFMFbGJE/VtSNTWVVEHD093bvbhMV7YEE/WSXTm3OsBPsQ5zMSRJWzCUWb+tqcGAHOHiGxZytggwTlpweOm05sekM+XY2rC3C7wprY1CBBls9FVwD+kNVZoYbIMcr7qbrd+Mip6Bvq13KVGm72H4y1sgRweweyTQuQUVzUUms7FaNwtV9Oti8waDG4bVQ7Oqh03jjCdVp/rHnjmj/9FYrNbfXCxiIzuq12D/BaFKPlw6hZ+L0a2ZLUAfp+uPgSRYOeyc1ZtU4zYE4OezCJaurCQ1WpZW7D6Q8eHXaENwEhweEBDbofxxHwuk3i4BLtv2v/quYkJEQ=
Content-ID: <9B409F5C9711B04297695209B8B852E7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dc58fe1e-033c-472a-c40c-08d7052e1055
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 11:59:29.8214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2971
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 2/3] common/grant_table:
 harden bound accesses
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, "wipawel@amazon.de" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDcuMjAxOSAxMDo1NCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBPbiA3LzEwLzE5
IDA1OjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA4LjA3LjIwMTkgMTQ6NTgsIE5vcmJl
cnQgTWFudGhleSB3cm90ZToNCj4+PiBPbiA1LzI0LzE5IDEzOjEwLCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4+Pj4gT24gMjQuMDUuMTkgYXQgMTE6NTQsIDxubWFudGhleUBhbWF6b24uZGU+IHdy
b3RlOg0KPj4+Pj4gT24gNS8yMy8xOSAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+
Pj4gT24gMjEuMDUuMTkgYXQgMDk6NDUsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOg0KPj4+
Pj4+PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCj4+Pj4+Pj4gKysrIGIveGVuL2Nv
bW1vbi9ncmFudF90YWJsZS5jDQo+Pj4+Pj4+IEBAIC05ODgsOSArOTg4LDEwIEBAIG1hcF9ncmFu
dF9yZWYoDQo+Pj4+Pj4+ICAgICAgICAgICAgUElOX0ZBSUwodW5sb2NrX291dCwgR05UU1RfYmFk
X2dudHJlZiwgIkJhZCByZWYgJSN4IGZvciBkJWRcbiIsDQo+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgb3AtPnJlZiwgcmd0LT5kb21haW4tPmRvbWFpbl9pZCk7DQo+Pj4+Pj4+ICAgIA0KPj4+
Pj4+PiAtICAgIGFjdCA9IGFjdGl2ZV9lbnRyeV9hY3F1aXJlKHJndCwgb3AtPnJlZik7DQo+Pj4+
Pj4+ICsgICAgLyogVGhpcyBjYWxsIGFsc28gZW5zdXJlcyB0aGUgYWJvdmUgY2hlY2sgY2Fubm90
IGJlIHBhc3NlZCBzcGVjdWxhdGl2ZWx5ICovDQo+Pj4+Pj4+ICAgICAgICBzaGFoID0gc2hhcmVk
X2VudHJ5X2hlYWRlcihyZ3QsIG9wLT5yZWYpOw0KPj4+Pj4+PiAgICAgICAgc3RhdHVzID0gcmd0
LT5ndF92ZXJzaW9uID09IDEgPyAmc2hhaC0+ZmxhZ3MgOiAmc3RhdHVzX2VudHJ5KHJndCwgb3At
PnJlZik7DQo+Pj4+Pj4+ICsgICAgYWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUocmd0LCBvcC0+
cmVmKTsNCj4+Pj4+PiBJIGtub3cgd2UndmUgYmVlbiB0aGVyZSBiZWZvcmUsIGJ1dCB3aGF0IGd1
YXJhbnRlZXMgdGhhdCB0aGUNCj4+Pj4+PiBjb21waWxlciB3b24ndCByZWxvYWQgb3AtPnJlZiBm
cm9tIG1lbW9yeSBmb3IgZWl0aGVyIG9mIHRoZQ0KPj4+Pj4+IGxhdHRlciB0d28gYWNjZXNzZXM/
IEluIGZhY3QgYWZhaWN0IGl0IGFsd2F5cyB3aWxsLCBkdWUgdG8gdGhlDQo+Pj4+Pj4gbWVtb3J5
IGNsb2JiZXIgaW4gYWx0ZXJuYXRpdmUoKS4NCj4+Pj4+IFRoZSBjb21waWxlciBjYW4gcmVsb2Fk
IG9wLT5yZWYgZnJvbSBtZW1vcnksIHRoYXQgaXMgZmluZSBoZXJlLCBhcyB0aGUNCj4+Pj4+IGJv
dW5kIGNoZWNrIGhhcHBlbnMgYWJvdmUsIGFuZCB0aGUgc2hhcmVkX2VudHJ5IGNhbGwgY29tZXMg
d2l0aCBhbg0KPj4+Pj4gbGZlbmNlKCkgYnkgbm93LCBzbyB0aGF0IHdlIHdpbGwgbm90IGNvbnRp
bnVlIGV4ZWN1dGluZyBzcGVjdWxhdGl2ZWx5DQo+Pj4+PiB3aXRoIG9wLT5yZWYgYmVpbmcgb3V0
LW9mLWJvdW5kcywgaW5kZXBlbmRlbnRseSBvZiB3aGV0aGVyIGl0J3MgZnJvbQ0KPj4+Pj4gbWVt
b3J5IG9yIHJlZ2lzdGVycy4NCj4+Pj4gSSBkb24ndCBidXkgdGhpcyBhcmd1bWVudGF0aW9uOiBJ
biBwYXJ0aWN1bGFyIGlmIHRoZSBjYWNoZSBsaW5lIGdvdA0KPj4+PiBmbHVzaGVkIGZvciB3aGF0
ZXZlciByZWFzb24sIHRoZSBsb2FkIG1heSB0YWtlIGFsbW9zdCBhcmJpdHJhcmlseQ0KPj4+PiBs
b25nLCBvcGVuaW5nIHVwIGEgbGFyZ2Ugc3BlY3VsYXRpb24gd2luZG93IGFnYWluIHVzaW5nIHRo
ZQ0KPj4+PiBkZXN0aW5hdGlvbiByZWdpc3RlciBvZiB0aGUgbG9hZCAod2hhdGV2ZXIgLSBub3Qg
Ym91bmRzIGNoZWNrZWQgLQ0KPj4+PiB2YWx1ZSB0aGF0IGVuZHMgdXAgaG9sZGluZykuDQo+Pj4g
SSBhZ3JlZSwgdGhlIGdpdmVuIHByb3RlY3Rpb24gZG9lcyBub3QgZm9yY2UgdGhlIENQVSB0byBw
aWNrIHVwIHRoZQ0KPj4+IGZpeGVkIHZhbHVlLiBBcyB5b3UgYWxyZWFkeSBub3RpY2VkLCB0aGUg
cHJlc2VudGVkIGZpeCBtaWdodCBub3Qgd29yayBpbg0KPj4+IGFsbCBjYXNlcywgYnV0IGlzIGFt
b25nIHRoZSBzdWl0YWJsZSBzb2x1dGlvbnMgd2UgaGF2ZSB0b2RheSB0byBwcmV2ZW50DQo+Pj4g
c2ltcGxlIHVzZXIgY29udHJvbGxlZCBvdXQtb2YtYm91bmQgYWNjZXNzZXMgZHVyaW5nIHNwZWN1
bGF0aW9uLiBSZWx5aW5nDQo+Pj4gb24gdGhlIHN0YWxlIHZhbHVlIG9mIHRoZSByZWdpc3RlciB0
aGF0IG1pZ2h0IGJlIHVzZWQgZHVyaW5nIHNwZWN1bGF0aW9uDQo+Pj4gbWFrZXMgYSBwb3RlbnRp
YWwgb3V0LW9mLWJvdW5kIGFjY2VzcyBtdWNoIG1vcmUgZGlmZmljdWx0LiBIZW5jZSwgdGhlDQo+
Pj4gcHJvcG9zZWQgc29sdXRpb24gbG9va3MgZ29vZCBlbm91Z2ggdG8gbWUuDQo+PiBCdXQgdXNp
bmcgYSBsb2NhbCB2YXJpYWJsZSBmdXJ0aGVyIHJlZHVjZXMgdGhlIHJpc2sgYWZhaWN0OiBFaXRo
ZXINCj4+IHRoZSBjb21waWxlciBwdXRzIGl0IGludG8gYSByZWdpc3RlciwgaW4gd2hpY2ggY2Fz
ZSB3ZSdyZSBlbnRpcmVseQ0KPj4gZmluZS4gT3IgaXQgcHV0cyBpdCBvbiB0aGUgc3RhY2ssIHdo
aWNoIEkgYXNzdW1lIGlzIG1vcmUgbGlrZWx5IHRvDQo+PiBzdGF5IGluIGNhY2hlIHRoYW4gYSBy
ZWZlcmVuY2UgdG8gc29tZSBvdGhlciBkYXRhIHN0cnVjdHVyZSAoaWlyYw0KPj4gYWxzbyBvbiB0
aGUgc3RhY2ssIGJ1dCBub3QgaW4gdGhlIGN1cnJlbnQgZnJhbWUpLg0KPiBJZiB5b3Ugd2FudCBt
ZSB0byBpbnRyb2R1Y2UgYSBsb2NhbCB2YXJpYWJsZSwgSSBjYW4gZG8gdGhhdC4gSSByZW1lbWJl
cg0KPiB3ZSBoYWQgZGlzY3Vzc2lvbnMgYXJvdW5kIHRoYXQgYXMgd2VsbC4NCg0KSSB0aGluayB0
aGlzIHdvdWxkIGJlIChhdCBsZWFzdCBzbGlnaHRseSkgYmV0dGVyLCB5ZXMuDQoNCkphbg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
