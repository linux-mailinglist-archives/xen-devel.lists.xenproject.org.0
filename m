Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01885DEA8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 09:17:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiZSR-0006b2-Vn; Wed, 03 Jul 2019 07:13:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiZSP-0006ax-KW
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 07:13:33 +0000
X-Inumbo-ID: 0e4db6ee-9d62-11e9-aa94-dfcb690fb622
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e4db6ee-9d62-11e9-aa94-dfcb690fb622;
 Wed, 03 Jul 2019 07:13:28 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 07:13:22 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 07:10:57 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 07:10:57 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3106.namprd18.prod.outlook.com (10.255.154.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Wed, 3 Jul 2019 07:10:56 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 07:10:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/2] x86/traps: guard top-of-stack reads
Thread-Index: AQHVMP5ML75pC/aDy0uRvH9WDF8zCKa4euEA
Date: Wed, 3 Jul 2019 07:10:55 +0000
Message-ID: <ee455798-3e26-fb77-96ac-175ed84fbd99@suse.com>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
 <5D074B7F0200007800238B69@prv1-mh.provo.novell.com>
 <83fb27e3-25d8-daee-924f-b2750b63d78a@citrix.com>
In-Reply-To: <83fb27e3-25d8-daee-924f-b2750b63d78a@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0073.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:44::14) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a74416df-9edd-447e-7136-08d6ff85974f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3106; 
x-ms-traffictypediagnostic: BY5PR18MB3106:
x-microsoft-antispam-prvs: <BY5PR18MB3106F2659C80FF2F400F78A4B3FB0@BY5PR18MB3106.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(199004)(189003)(110136005)(6506007)(54906003)(68736007)(52116002)(229853002)(36756003)(26005)(25786009)(76176011)(186003)(102836004)(386003)(4326008)(80792005)(478600001)(316002)(99286004)(31696002)(486006)(53546011)(66066001)(72206003)(2906002)(86362001)(446003)(7736002)(31686004)(305945005)(5660300002)(6246003)(8936002)(8676002)(66476007)(71190400001)(73956011)(64756008)(66556008)(5024004)(14454004)(81166006)(11346002)(66446008)(66946007)(6116002)(81156014)(3846002)(256004)(71200400001)(53936002)(476003)(6486002)(2616005)(6436002)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3106;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k70N1dY0L0xExGuSfmz/25JxfhTI1tlr1LMox/fT//iD9pppHtN77KRMbM3UtDKcftPElvyp86ZC0Lpac1st+mHNPO6bcHTKFvZ1FdD/4bJ8Rg3u89Ga2ZG79WJn0dgePvXsAHHczEm5J+bTBz4sszUvGMZJPaN/L0jhynftuuhSUCfbtYBqFokzZdyRKYXwu2SU3Hj+W+y5nJptSmg/slLhdCXOEAcpwqpXKzX7Fb1nsB5VHBCdCrbL6ckZj9/JJ9vXps25HbD01sSqPG+KCikL5eMgjpz29qsy1wGqEJA5F/f1dekDXnSbAWdQaRZJIfC6FBDRFytSYEgXq8p7he3sONtczMops1mHNrS9M7CWUcazzFKuyrt7dWUfe3gREviF+ivDqoRwIvnL1qlGb7xhm4YSVpPzzOZaYOwev/o=
Content-ID: <D0DDBB759180DA4AB0D8275AFE0B8295@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a74416df-9edd-447e-7136-08d6ff85974f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 07:10:55.7051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3106
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/traps: guard top-of-stack reads
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
Cc: WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxOTo0NywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDYvMjAx
OSAwOToxMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBOb3RoaW5nIChhZmFpY3MpIGd1YXJhbnRl
ZXMgdGhhdCB0aGUgb3JpZ2luYWwgZnJhbWUncyBzdGFjayBwb2ludGVyDQo+IA0KPiBJJ2QgZHJv
cCB0aGUgKGFmYWljcyksIGJlY2F1c2UgdGhlIGFuc3dlciByZWFsbHkgaXMgbm90aGluZy4NCg0K
V2VsbCwgb2theSwgZG9uZS4NCg0KPj4gcG9pbnRzIGF0IHJlYWRhYmxlIG1lbW9yeS4gQXZvaWQg
YSAobGlrZWx5IG5lc3RlZCkgY3Jhc2ggYnkgYXR0YWNoaW5nDQo+PiBleGNlcHRpb24gcmVjb3Zl
cnkgdG8gdGhlIHJlYWQgKG1ha2luZyBpdCBhIHNpbmdsZSByZWFkIGF0IHRoZSBzYW1lDQo+PiB0
aW1lKS4gRG9uJ3QgZXZlbiBpbnZva2UgX3Nob3dfdHJhY2UoKSBpbiBjYXNlIG9mIGEgbm9uLXJl
YWRhYmxlIHRvcA0KPj4gc2xvdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KVGhhbmtzLiBGVFIgLSB0aGVyZSdzIGEgcXVpcmsg
aW4gaGVyZSB0aGF0IEkndmUgbGVmdCBpbiBwbGFjZQ0KZGVsaWJlcmF0ZWx5IChzaG91bGQgcHJv
YmFibHkgaGF2ZSBtZW50aW9uZWQgaXQgaW4gYSBwb3N0LWNvbW1pdC0NCm1lc3NhZ2UgcmVtYXJr
KSB3aGljaCBnZXRzIHJlc29sdmVkIGJ5IHBhdGNoIDIsIGFuZCBoZW5jZSBJJ20NCmxpa2VseSBn
b2luZyB0byB3YWl0IHdpdGggY29tbWl0dGluZyB0aGlzIHN1Y2ggdGhhdCBib3RoIGNhbiBnbyBp
bg0KYXQgdGhlIHNhbWUgdGltZS4gVGhlIGlzc3VlIGlzIHdpdGggdGhlIGlmL2Vsc2UtaWYvZWxz
ZSBjaGFpbiBoZXJlLA0Kd2hpY2ggcGF0Y2ggMiBtYWtlcyBpbnRvIGEgc2VyaWVzIG9mIHBsYWlu
IGlmKCktcy4gSGFuZGxpbmcgdGhpcw0KY29ycmVjdGx5IHJpZ2h0IGhlcmUgd291bGQgaW1vIG1l
YW4gZm9sZGluZyB0b2dldGhlciBib3RoIHBhdGNoZXM7DQphbnl0aGluZyBlbHNlIHdvdWxkIGF0
IGJlc3QgcmVzdWx0IGluIGNsdW1zeSBpbnRlcm1lZGlhdGUgY29kZS4NCkRlc3BpdGUgdGhpcyBx
dWlyayB0aGUgY2hhbmdlIGhlcmUgaXMgYW4gaW1wcm92ZW1lbnQsIGp1c3Qgbm90IGFzDQptdWNo
IG9mIG9uZSBhcyB3b3VsZCBiZSBkZXNpcmFibGUuDQoNCkphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
