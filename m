Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C86E6B2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:42:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoT70-0003WB-VQ; Fri, 19 Jul 2019 13:39:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoT6z-0003W4-4D
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:39:49 +0000
X-Inumbo-ID: a836e058-aa2a-11e9-b915-afc881e283cd
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a836e058-aa2a-11e9-b915-afc881e283cd;
 Fri, 19 Jul 2019 13:39:46 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 13:39:39 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 13:38:55 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 13:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aojNXiXlQIzcTZhKaA/nMi1xR2wegxW6J8olz8/rlpIAsLmZC6kt7jO/ND8dcJ6crolAdMIOyS4nfcnvUJD0xM/sN5hGBSasXGOsyLgye7iWN+mJk9oWbwUCK1n8f3BwiOqXYfTk61mdaUSrbdtQ2R3CIaKxp67RHvebyNlGf6EIaw8tAvo4XYw4Kbp74ruAj+JnCLKIVys6wXTSFcIUYpxvGV7Hn+UGUPDzM63xrzTtdvJQ6qr2XHxj7955DyRKmVbMNJtPD5biAu3Ym/XmFWKYtGZL7Qrlub7FcHNUa7+Bx9WyZXkiG79xUNV/qvWK27FkyVj8fgCnkkI7qxWS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUzzPW2U2E4Ejxe5VpVDzWCDFvw8NiQloTcx8U1aMoE=;
 b=VOProNnfS5t7/1L3KKRUFr2gpaojMzycD6iw9J9saJxlp/Lqf4Ru4w0xX834t3dOcmek7R1vaKyqc/bkZ284HQINh35MRqNbLMDoPRiHSJkz/Z2hZWQhgWEP8ug1kTwHpYVkrW6A9bbQrVcSjnBSirI6GqkU4QGPZE4BISVEAd4Au1wQH3tup2dgt7pLVptl1js+d3VtJbwfjB2DZ5qN/fBE6eOAKQTkuk6BZ0LsiP8coAQui5JUsRIGyZwdAIwEu42ObXiqYJgZl2AU7u4hiYMTWjtBuZltp/1tQpiTUjDom4qklVX0GiCYDQT9e77VqDJ21tLzztZwVyGRFqkTxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2619.namprd18.prod.outlook.com (20.179.106.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 13:38:54 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 13:38:54 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Thread-Topic: [PATCH v7] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMY4Gmux1Y/IiSU2ZKtKyOfOCuKbQbceAgAGLzgCAAC22AP//4gTfgAACLQA=
Date: Fri, 19 Jul 2019 13:38:54 +0000
Message-ID: <08ed1d56-b24b-66bd-34da-d0c329a2eecf@suse.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <8817949d-a99c-ae0f-93b1-13c0bebacae6@bitdefender.com>
In-Reply-To: <8817949d-a99c-ae0f-93b1-13c0bebacae6@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0063.eurprd03.prod.outlook.com
 (2603:10a6:5:2a::40) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4fb00a6-9966-49e2-90eb-08d70c4e710e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2619; 
x-ms-traffictypediagnostic: DM6PR18MB2619:
x-microsoft-antispam-prvs: <DM6PR18MB26195FFA8DD01903B4828D74B3CB0@DM6PR18MB2619.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(189003)(199004)(51444003)(4326008)(36756003)(25786009)(66476007)(305945005)(476003)(66556008)(14454004)(66446008)(64756008)(486006)(6436002)(7736002)(5660300002)(186003)(26005)(6246003)(316002)(256004)(52116002)(66066001)(54906003)(53936002)(99286004)(68736007)(7416002)(6512007)(6486002)(71190400001)(14444005)(446003)(6916009)(102836004)(86362001)(76176011)(229853002)(71200400001)(53546011)(31696002)(6116002)(8676002)(80792005)(2906002)(386003)(6506007)(3846002)(2616005)(8936002)(81156014)(81166006)(478600001)(66946007)(31686004)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2619;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YqUkPOUO11DjXfFRJlUXafX9NDoqoUgO0ywvtuV8bjM182IL7EJBuMNMplT8l8I0o2Zu8Y/ZkifBKWtmntwRG1zR991WZ3I9PLDZ1uwr0FotJGA2jwJsx2KS/e/GPmpcOEErFkY2KzfYwVdfKayQcJKvUfGWODGvVYtNsnxPjzPoV0/BbJ2jFwffGMru1ph10KuwGPWX6OrcFr8qy3MfPKPYBIrBd2x1ZH3InBjg5sZD8nxXjjLgO18YOt3IWyHmHAeoZQSmYPT/q/Cc7eRYckEZbTfZJxCtHuP35hS6Sv0m3V7yFH1cdEtfBcbyy7d6N8pxR4ZchN5w6T1bmpNfLnlvUKcMO9ORrIERi+rNKkmWIwHsD67T8QHO4Y35aqNyVt/ylKzwixBR226iOQRj8jOlVh+guuYLoSqTqaZP8sA=
Content-ID: <522422E90F3F3E499AB1601E06DC1546@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fb00a6-9966-49e2-90eb-08d70c4e710e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 13:38:54.1406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2619
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
Cc: PetreOvidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNTozMCwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOg0KPiBPbiA3LzE5LzE5
IDQ6MTggUE0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTkuMDcuMjAxOSAxNDozNCwgQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4gT24gMTguMDcuMjAxOSAxNTo1OCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDAzLjA3LjIwMTkgMTI6NTYsIEFsZXhhbmRydSBTdGVm
YW4gSVNBSUxBIHdyb3RlOg0KPj4+Pj4gQS9EIGJpdCB3cml0ZXMgKG9uIHBhZ2Ugd2Fsa3MpIGNh
biBiZSBjb25zaWRlcmVkIGJlbmlnbiBieSBhbiBpbnRyb3NwZWN0aW9uDQo+Pj4+PiBhZ2VudCwg
c28gcmVjZWl2aW5nIHZtX2V2ZW50cyBmb3IgdGhlbSBpcyBhIHBlc3NpbWl6YXRpb24uIFdlIHRy
eSBoZXJlIHRvDQo+Pj4+PiBvcHRpbWl6ZSBieSBmaXRlcmluZyB0aGVzZSBldmVudHMgb3V0Lg0K
Pj4+Pg0KPj4+PiBCdXQgeW91IGFkZCB0aGUgc2VuZGluZyBvZiBtb3JlIGV2ZW50cyAtIGhvdyBk
b2VzICJmaWx0ZXIgb3V0IiBtYXRjaA0KPj4+PiB0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uPw0K
Pj4+DQo+Pj4gVGhlIGV2ZW50cyBhcmUgc2VuZCBvbmx5IGlmIHRoZXJlIGlzIGEgbWVtIGFjY2Vz
cyB2aW9sYXRpb24gdGhlcmVmb3JlIHdlDQo+Pj4gYXJlIGZpbHRlcmluZyBhbmQgb25seSBzZW5k
aW5nIHRoZSBldmVudHMgdGhhdCBhcmUgaW50ZXJlc3RpbmcgdG8NCj4+PiBpbnRyb3NwZWN0aW9u
Lg0KPj4NCj4+IFdoZXJlIGlzIGl0IHRoYXQgeW91IHByZXZlbnQgYW55IGV2ZW50IGZyb20gYmVp
bmcgc2VudD8gQXMgc2FpZCwNCj4+IHJlYWRpbmcgdGhlIHBhdGNoIEkgb25seSBzZWUgbmV3IHNl
bmRpbmcgc2l0ZXMgdG8gZ2V0IGFkZGVkLg0KPiANCj4gSWYgd2UgZG9uJ3QgZW11bGF0ZSwgd2Ug
d291bGQgcmVjZWl2ZSB0aGUgcGFnZS13YWxrLWdlbmVyYXRlZCBldmVudHMNCj4gX2FuZF8gdGhl
IHRvdWNoaW5nLXRoZS1wYWdlLXRoZS1pbnN0cnVjdGlvbi1pcy10b3VjaGluZyBldmVudHMuDQoN
ClNpbmNlIHRoZSBwYXRjaCBoZXJlIGFsdGVycyBlbXVsYXRpb24gcGF0aHMgb25seSwgaG93IGRv
IHlvdSBrbm93DQp3aGV0aGVyIHRvIGVtdWxhdGU/IEluIG9yZGVyIHRvIG5vdCByZWNlaXZlIHVu
ZHVlIGV2ZW50cyBpdCB3b3VsZA0Kc2VlbSB0byBtZSB0aGF0IHlvdSdkIGZpcnN0IGhhdmUgdG8g
aW50ZXJjZXB0IHRoZSBndWVzdCBvbiBpbnNucw0Kb2YgaW50ZXJlc3QgLi4uIE92ZXJhbGwgSSB0
aGluayB0aGF0IHRoZSBwYXRjaCBkZXNjcmlwdGlvbiwgd2hpbGUNCml0IGhhcyBpbXByb3ZlZCwg
aXMgc3RpbGwgbGFja2luZyBzdWZmaWNpZW50IGluZm9ybWF0aW9uIGZvciBhDQpwZXJzb24gbGlr
ZSBtZSAobm90IGtub3dpbmcgbXVjaCBhYm91dCB5b3VyIG1vbml0b3IgdG9vbHMpIHRvIGJlDQph
YmxlIHRvIHNlbnNpYmx5IHJldmlldyB0aGlzICh3aGljaCBpbmNsdWRlcyB1bmRlcnN0YW5kaW5n
IHRoZQ0KcHJlY2lzZSBzY2VuYXJpbyB5b3Ugd2FudCB0byBpbXByb3ZlKS4NCg0KSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
