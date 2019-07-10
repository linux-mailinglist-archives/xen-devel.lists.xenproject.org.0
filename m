Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AB463F7F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 05:06:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl2sv-0003ek-2V; Wed, 10 Jul 2019 03:03:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hl2st-0003ef-Ab
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 03:03:07 +0000
X-Inumbo-ID: 3aaa7918-a2bf-11e9-823d-0f703a36c58e
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3aaa7918-a2bf-11e9-823d-0f703a36c58e;
 Wed, 10 Jul 2019 03:03:02 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 10 Jul 2019 02:59:18 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 10 Jul 2019 02:57:19 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 02:57:19 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3404.namprd18.prod.outlook.com (10.255.174.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 02:57:17 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 02:57:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v2] x86/ctxt-switch: Document and improve GDT handling
Thread-Index: AQHVNna/SHvk0zhBNk6J4R3eSueEw6bDKXCA
Date: Wed, 10 Jul 2019 02:57:17 +0000
Message-ID: <1becc06d-115e-e8d4-26ab-a1a3e5003f1e@suse.com>
References: <20190709165157.18983-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190709165157.18983-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:610:4c::19) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2ec53e8-8b40-4beb-8f48-08d704e2519d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3404; 
x-ms-traffictypediagnostic: DM6PR18MB3404:
x-microsoft-antispam-prvs: <DM6PR18MB3404C124AD21D8790923676BB3F00@DM6PR18MB3404.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(36756003)(31696002)(446003)(256004)(2616005)(14444005)(186003)(2906002)(14454004)(476003)(86362001)(80792005)(5660300002)(81166006)(66066001)(486006)(81156014)(11346002)(71190400001)(6246003)(7736002)(66946007)(66476007)(305945005)(8676002)(64756008)(66556008)(68736007)(66446008)(6486002)(8936002)(6512007)(54906003)(6436002)(229853002)(6916009)(25786009)(31686004)(99286004)(102836004)(53936002)(316002)(6116002)(52116002)(3846002)(478600001)(386003)(4326008)(6506007)(53546011)(76176011)(71200400001)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3404;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JUw0Xrac0RJPV3OiBUPCfOtdVnkjbbICcKWIwhma5GFqUmChf2eSaSRBadjFWFgHP/rENNHleAgJL/0vc0p6/JLlr84OqigOyK1YlMEdw9y8ETW2qHoy22G6rsLVj4KlbHuckh1EHATpKk8pvWvPauirJcqQT24cTBOleCc16B4K/Bdal0QmCfCLBdXQ426nJ0bZCRoLwOe/trZCMwxeFyMtr7INDDagVDuA6lbDn5tcELlX+JPFQt8bZpVzh0LYxan8TDwk7xH0Ft3BATivMP3RNT97iN2sgeaouFfe8SAjTNKEXs3DqCCpPg8QUR2GnT/D+4Ztw/7eOmB1IRnb44fC2U+OFgW6XeYg0EsNuHT17sFJc28qCZpf8MhXrq58K1Y6CMt+0nMI71OJEsbMYBzwqdC4JVoqvEGIFw/nTHY=
Content-ID: <B2C2C61DBC94BC48BFD12F8EFD59E933@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ec53e8-8b40-4beb-8f48-08d704e2519d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 02:57:17.5714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3404
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] x86/ctxt-switch: Document and improve
 GDT handling
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
Cc: Juergen Gross <JGross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDcuMjAxOSAxODo1MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gd3JpdGVfZnVsbF9n
ZHRfcHRlcygpIGxvb2tzIHN1c3BpY2lvdXMgLSBpdCBpcyBub3QgZ2VuZXJhbGx5IHNhZmUgdG8N
Cj4gaXRlcmF0ZSBvdmVyIChtZm4gKyBpKS4NCg0KSSdtIHN0aWxsIG5vdCBoYXBweSBhYm91dCB0
aGlzIChtaXNsZWFkaW5nKSBzdGF0ZW1lbnQ6IFRoZSBzYWZldHkgb2YNCnRoaXMgZGVwZW5kcywg
YXMgc2FpZCwgb24gaG93IHRoZSBhbGxvY2F0aW9uIGdldHMgZG9uZS4gQW5kIHRoZSB3YXkNCnRo
YXQgaXMgZG9uZSBhdCB0aGUgbW9tZW50LCB0aGUgYWRkaXRpb24gaXMgc2FmZS4gSSByZWFsaXpl
IHRoYXQNCiJnZW5lcmFsbHkiIG1heSBiZSBtZWFudCB0byBjb3ZlciB0aGF0IGNhc2UsIGJ1dCBw
ZXJzb25hbGx5IEkgZmluZA0KdGhpcyBub3QgY2xlYXIgZW5vdWdoLg0KDQo+ICBIb3dldmVyLCB0
aGUgbG9vcCBpcyBlbnRpcmVseSB1bm5lY2Vzc2FyeSwgYXMNCj4gTlJfUkVTRVJWRURfR0RUX1BB
R0VTIGlzIDEuICBEcm9wcGluZyBpdCBtYWtlcyB0aGUgY29kZSBzdWJzdGFudGlhbGx5DQo+IG1v
cmUgY2xlYXIsIGFuZCB3aXRoIGl0IGRyb3BwZWQsIHdyaXRlX2Z1bGxfZ2R0X3B0ZXMoKSBiZWNv
bWVzIG1vcmUNCj4gb2J2aW91c2x5IGEgcG9vciBuYW1lLCBzbyByZW5hbWUgaXQgdG8gdXBkYXRl
X3hlbl9zbG90X2luX2Z1bGxfZ2R0KCkuDQo+IA0KPiBGdXJ0aGVybW9yZSwgY2FsbGluZyB2aXJ0
X3RvX21mbigpIGluIHRoZSBjb250ZXh0IHN3aXRjaCBwYXRoIGlzIGEgbG90DQo+IG9mIHdhc3Rl
ZCBjeWNsZXMgZm9yIGEgcmVzdWx0IHdoaWNoIGlzIGNvbnN0YW50IGFmdGVyIGJvb3QuDQo+IA0K
PiBCZWdpbiBieSBkb2N1bWVudGluZyBob3cgWGVuIGhhbmRsZXMgdGhlIEdEVHMgYWNyb3NzIGNv
bnRleHQgc3dpdGNoLg0KPiANCj4gIEZyb20gdGhpcywgd2Ugb2JzZXJ2ZSB0aGF0IGxvYWRfZnVs
bF9nZHQoKSBpcyBjb21wbGV0ZWx5IGluZGVwZW5kZW50IG9mDQo+IHRoZSBjdXJyZW50IENQVSwg
YW5kIGxvYWRfZGVmYXVsdF9nZHQoKSBvbmx5IG5lZWRzIHRoZSBjdXJyZW50IENQVSdzDQo+IHJl
Z3VsYXIgR0RULiAgKFRoaXMgaXMgYSBjaGFuZ2UgaW4gYmVoYXZpb3VyLCBhcyBwcmV2aW91c2x5
IGl0IG1heSBoYXZlDQo+IHVzZWQgdGhlIGNvbXBhdCBHRFQsIGJ1dCBlaXRoZXIgd2lsbCBkby4p
DQo+IA0KPiBBZGQgdHdvIGV4dHJhIHBlci1jcHUgdmFyaWFibGVzIHdoaWNoIGNhY2hlIHRoZSBM
MWUgZm9yIHRoZSByZWd1bGFyIGFuZCBjb21wYXQNCj4gR0RULCBjYWxjdWxhdGVkIGluIGNwdV9z
bXBib290X2FsbG9jKCkvdHJhcF9pbml0KCkgYXMgYXBwcm9wcmlhdGUsIHNvDQo+IHVwZGF0ZV94
ZW5fc2xvdF9pbl9mdWxsX2dkdCgpIGRvZXNuJ3QgbmVlZCB0byB3YXN0ZSB0aW1lIHBlcmZvcm1p
bmcgdGhlIHNhbWUNCj4gY2FsY3VsYXRpb24gb24gZXZlcnkgY29udGV4dCBzd2l0Y2guDQo+IA0K
PiBPbmUgcGVyZm9ybWFuY2Ugc2NlbmFyaW8gb2YgSnVlcmdlbidzICh0aW1lIHRvIGJ1aWxkIHRo
ZSBoeXBlcnZpc29yIG9uDQo+IGFuIDggQ1BVIHN5c3RlbSwgd2l0aCB0d28gc2luZ2xlLXZDUFUg
TWluaU9TIFZNcyBjb25zdGFudGx5IGludGVycnVwdGluZw0KPiBkb20wIHdpdGggZXZlbnRzKSBz
aG93cyB0aGUgZm9sbG93aW5nLCBhdmVyYWdlIG92ZXIgNSBtZWFzdXJlbWVudHM6DQo+IA0KPiAg
ICAgICAgICAgICAgZWxhcHNlZCAgdXNlciAgIHN5c3RlbQ0KPiAgICBVbnBhdGNoZWQgIDY2LjUx
ICAyMzIuOTMgIDEwOS4yMQ0KPiAgICBQYXRjaGVkICAgIDU3LjAwICAyMjUuNDcgIDEwNS40Nw0K
PiANCj4gd2hpY2ggaXMgYSBzdWJzdGFudGlhbCBpbXByb3ZlbWVudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFRlc3Rl
ZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiBSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQpQcmVmZXJhYmx5IHdpdGggdGhlIGZpcnN0
IHNlbnRlbmNlIGFib3ZlIGNoYW5nZWQvYW1lbmRlZDoNClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
