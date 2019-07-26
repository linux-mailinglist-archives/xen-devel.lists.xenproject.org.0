Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6576BED
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:45:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1RQ-0005wH-SH; Fri, 26 Jul 2019 14:43:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hr1RP-0005vq-By
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:43:27 +0000
X-Inumbo-ID: b409a422-afb3-11e9-9f62-039a925d62fa
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b409a422-afb3-11e9-9f62-039a925d62fa;
 Fri, 26 Jul 2019 14:43:24 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 14:43:21 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 14:38:35 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 14:38:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCD0rZGuJyrqO35YdTqpozgvFU+9LcBZ3PUI8vqC9Z+xWUHLF3A0DSqei9/RFu0QvgFg0wK/0TtC9ENLdUWLcBLStuwfPn2aHGeHj8JQQHC7FoHqoatJAyVHIjExWjYmyPJa3Rr+/TNzDk/k+DlZuyarwK/W6FdKwvuJHQqcHF3d7qF6vdup3bDjmZ58v1RWGbYBsJIhCQ/TdL811NrqVZIAI4C6rAXqfFaf318wp1cBRoHjATzzJYUhy+iRdx4t7EdAK1EWx+v9IOOZGuBDTTSC1+QuXP4oa4zLBCQJEY1KqQevCR5vHuGTNsTUJBjByQWvvhqdaX/IL18IJfenfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ/Yk1GSlZmw3cnw6jyc8+xAMvhQsen0pcvwE57TYPU=;
 b=S847JxmbVuHpm52S7ce7q+SW25rkSFVej2GIfyd8GenQA/m6GqZwUNtNoxnobh67owTiK6lWs5hWxwP7mzu8xt6vq1seIDr4SxyeXMw+GyY2kjkluenTC4lbfwUOHwrCiX4WkVHQotdFAIVx/GG+oro0cnJwlQkdukaJ9ebR7QmGDJAwttW2UR0V9nY5LTdlwDomhpkb8wCih1Kx7WKjPkhjK3gNNcIlE/lbhes65REG5s343DdF5aJXrRCazoLhuo9VatBj+aqEjZMYGj4B+mTywWIBhKPLrhzYkVazTFT6O3PPouwlViv120Y159789jc3Esm8yZfV29SEGnpVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3092.namprd18.prod.outlook.com (10.255.154.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 14:38:34 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 14:38:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/2] xen/link: Introduce .bss.percpu.page_aligned
Thread-Index: AQHVQ7mbx1nPtP170EKn0DeicB+T7Kbc89sCgAACKTaAAAIcAA==
Date: Fri, 26 Jul 2019 14:38:34 +0000
Message-ID: <e61faffa-4f8c-320e-55f3-7ec0d3702410@suse.com>
References: <20190726135240.21745-1-andrew.cooper3@citrix.com>
 <20190726135240.21745-2-andrew.cooper3@citrix.com>
 <20190726142250.d7kxm6g46r56okzx@Air-de-Roger>
 <214fa6eb-bcdc-faf1-42be-ceea3954854a@citrix.com>
In-Reply-To: <214fa6eb-bcdc-faf1-42be-ceea3954854a@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::24) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9ae95d2-16ce-4195-57e7-08d711d6f010
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3092; 
x-ms-traffictypediagnostic: BY5PR18MB3092:
x-microsoft-antispam-prvs: <BY5PR18MB3092416967AB4A2CDD88F949B3C00@BY5PR18MB3092.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(189003)(199004)(229853002)(54906003)(110136005)(14454004)(4326008)(305945005)(99286004)(486006)(6512007)(14444005)(66066001)(2616005)(256004)(53936002)(476003)(7736002)(52116002)(31696002)(81156014)(5660300002)(446003)(11346002)(6486002)(86362001)(6436002)(316002)(71190400001)(6506007)(8676002)(68736007)(31686004)(66446008)(66946007)(2906002)(25786009)(76176011)(36756003)(102836004)(386003)(186003)(6116002)(8936002)(26005)(6246003)(71200400001)(478600001)(66476007)(64756008)(66556008)(3846002)(81166006)(53546011)(80792005)(142923001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3092;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DNtKvepDesn93EWWy8ojGvFfkzwyObvPSouTelYp664zXLoufHeUc4ZkXP0j38TUPMw0rRcF0Dw1hEdE4dPEgFaErkAFmE8VQ6cNaFgeN3kqD8MM2kPxciEojPTWYFbgUnPX0lbKOgEIC8odBX9clxUDx6kY7eyrmCxenPXlqhoUfm8d76z4E1Kq5fN80TsYl/QF1P9ey6MOsZlqtmGK2yYfptSmGTBE1lRtw45GTwcTypbl6aoLP3rc1m4wX9DmgGHrHMFrWo2pijRzBJccXcaApWSNBS+U4P7LZvFbvcr/zdQ0250ml0UGnfK+trOaGdpeYA1HOTw/4cDjmjl/v8cPVB5ArNS9zN+QUP83JwAx1hjpgwrxvjzPAujy/a05AUfTMZ+I9CK2fE8cIs+Fpqgt/vhxGCJQVfYQJ+D32gY=
Content-ID: <303CCD88D3ADE44191C9A39D1D66C879@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ae95d2-16ce-4195-57e7-08d711d6f010
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 14:38:34.6389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3092
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAxNjozMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjYvMDcvMjAx
OSAxNToyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIEZyaSwgSnVsIDI2LCAyMDE5
IGF0IDAyOjUyOjM5UE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gRnV0dXJlIGNo
YW5nZXMgYXJlIGdvaW5nIHRvIG5lZWQgdG8gcGFnZSBhbGlnbiBzb21lIHBlcmNwdSBkYXRhLg0K
Pj4+DQo+Pj4gVGhpcyBtZWFucyB0aGF0IHRoZSBwZXJjcHUgYXJlYSBuZWVkcyBzdWlhYmx5IGFs
aWduaW5nIGluIHRoZSBCU1Mgc28gQ1BVMCBoYXMNCj4+PiBjb3JyZWN0bHkgYWxpZ25lZCBkYXRh
LiAgU2h1ZmZsZSB0aGUgZXhhY3QgbGluayBvcmRlciBvZiBpdGVtcyB3aXRoaW4gdGhlIEJTUw0K
Pj4+IHRvIGdpdmUgLmJzcy5wZXJjcHUucGFnZV9hbGlnbmVkIGFwcHJvcHJpYXRlIGFsaWdubWVu
dC4NCj4+Pg0KPj4+IEFkZGl0aW9uYWxseSwgaW50cm9kdWNlIERFRklORV9QRVJfQ1BVX1BBR0Vf
QUxJR05FRCgpDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+Pj4gQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+IENDOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4gQ0M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+DQo+Pj4gQ0M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT4NCj4+PiAtLS0NCj4+PiAgIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMg
ICB8IDUgKysrLS0NCj4+PiAgIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICB8IDUgKysrLS0NCj4+
PiAgIHhlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaCB8IDIgKysNCj4+PiAgIDMgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TDQo+Pj4gaW5k
ZXggMTJjMTA3ZjQ1ZC4uMDdjYmRmMjU0MyAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
eGVuLmxkcy5TDQo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUw0KPj4+IEBAIC0yMDEs
MTQgKzIwMSwxNSBAQCBTRUNUSU9OUw0KPj4+ICAgICAgICAgICooLmJzcy5zdGFja19hbGlnbmVk
KQ0KPj4+ICAgICAgICAgIC4gPSBBTElHTihQQUdFX1NJWkUpOw0KPj4+ICAgICAgICAgICooLmJz
cy5wYWdlX2FsaWduZWQpDQo+Pj4gLSAgICAgICAqKC5ic3MpDQo+Pj4gLSAgICAgICAuID0gQUxJ
R04oU01QX0NBQ0hFX0JZVEVTKTsNCj4+IERvbid0IHlvdSBhbHNvIG5lZWQgYToNCj4+DQo+PiAu
ID0gQUxJR04oUEFHRV9TSVpFKTsNCj4+DQo+PiBoZXJlPw0KPiANCj4gTm8sIChJIGRvbid0IHRo
aW5rIHNvKS4NCj4gDQo+PiBPciBpcyB0aGUgc2l6ZSBvZiAuYnNzLnBhZ2VfYWxpZ25lZCBhbHNv
IGFsaWduZWQgdG8gcGFnZSBzaXplPw0KPiANCj4gRXZlcnkgb2JqZWN0IGluc2lkZSAuYnNzLnBh
Z2VfYWxpZ25lZCBzaG91bGQgaGF2ZSBzdWl0YWJsZSAoaS5lLg0KPiBtdWx0aXBsZSBvZikgc2l6
ZSBhbmQgYWxpZ25tZW50LsKgIFdpdGhvdXQgdGhpcywgdGhpbmdzIHdpbGwgYnJlYWsuDQoNCkkn
bSBub3Qgc3VyZSB3ZSBzaG91bGQgaGF2ZSBzdWNoIGEgcmVxdWlyZW1lbnQ6IE9iamVjdHMgaW4N
Ci4qLnBhZ2VfYWxpZ25lZCBzZWN0aW9ucyBzaG91bGQgdGhlbXNlbHZlcyBoYXZlIFBBR0VfU0la
RSBhbGlnbm1lbnQNCihpLmUuIHRoZXJlIHNob3VsZG4ndCBiZSBhIG5lZWQgdG8gQUxJR04oKSBf
YWhlYWRfIG9mIHRoZSBzZWN0aW9uDQpkaXJlY3RpdmUgaW4gdGhlIHNjcmlwdCAodGhhdCBpcywg
dGhlIG9uZSBpbiBjb250ZXh0IGFib3ZlIHNob3VsZA0KYWN0dWFsbHkgYmUgcmVkdW5kYW50KS4g
QnV0IEknbSBub3Qgc3VyZSBhYm91dCBkZW1hbmRpbmcgdGhlaXINCnNpemUgdG8gYmUgYSBtdWx0
aXBsZSBvZiBQQUdFX1NJWkUgLSB3aGlsZSBDIHdpbGwgZ3VhcmFudGVlIHRoaXMNCihhbmQgd2Fz
dGUgc3BhY2UgaW4gY2VydGFpbiBjYXNlcyksIGFzc2VtYmx5IGNvbnN0cnVjdHMgY291bGQgc3Rp
bGwNCmJlIHdyaXR0ZW4gc3VjaCB0aGF0IHRoZSB0cmFpbGluZyB1bnVzZWQgc3BhY2UgY2FuIGJl
IHJlLXVzZWQuIE90b2gNCkkgYWdyZWUgd2l0aCB5b3VyIHZpcnR1YWwgc3RhdGVtZW50IG9mIHRo
aXMgYmVpbmcgYSBsaXR0bGUgZnJhZ2lsZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
