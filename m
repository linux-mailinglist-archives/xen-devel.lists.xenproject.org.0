Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905265F653
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 12:08:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiydQ-0003fm-31; Thu, 04 Jul 2019 10:06:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiydN-0003fe-Sl
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 10:06:33 +0000
X-Inumbo-ID: 644d72d5-9e43-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 644d72d5-9e43-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 10:06:31 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 10:02:52 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 10:04:24 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 10:04:24 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3154.namprd18.prod.outlook.com (10.255.137.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 4 Jul 2019 10:04:22 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 10:04:22 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v3 14/15] x86/IRQ: eliminate some on-stack cpumask_t
 instances
Thread-Index: AQHVMc9vhgFqGq6Ig0elP5o60DtrLKa6PBAA
Date: Thu, 4 Jul 2019 10:04:21 +0000
Message-ID: <6c799757-72b8-e5c8-6e2d-db818951bade@suse.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE928602000078002300BD@prv1-mh.provo.novell.com>
 <20190520142204.unxnuzmmtyqbridb@Air-de-Roger>
 <9b46b04e-dd6f-079f-c924-e8d918517766@citrix.com>
In-Reply-To: <9b46b04e-dd6f-079f-c924-e8d918517766@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0902CA0018.eurprd09.prod.outlook.com
 (2603:10a6:6:2::31) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c00c8791-21da-4c6a-4b66-08d70066fc46
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3154; 
x-ms-traffictypediagnostic: BY5PR18MB3154:
x-microsoft-antispam-prvs: <BY5PR18MB31545A2B7D77A41015BDC0C8B3FA0@BY5PR18MB3154.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(189003)(199004)(36756003)(25786009)(31696002)(386003)(6506007)(14454004)(6246003)(3846002)(86362001)(6116002)(6486002)(53546011)(68736007)(4744005)(80792005)(2906002)(66066001)(186003)(305945005)(7736002)(229853002)(102836004)(73956011)(71190400001)(71200400001)(446003)(478600001)(486006)(72206003)(66446008)(64756008)(81166006)(66946007)(8676002)(81156014)(8936002)(6436002)(2616005)(5660300002)(110136005)(66556008)(54906003)(316002)(53936002)(26005)(76176011)(99286004)(4326008)(11346002)(52116002)(66476007)(476003)(256004)(31686004)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3154;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hBWhHlp69tVtl2ENwdJVagVJK6BtGxh1V7DXhd+jBWVEqYj8GGljsdbNXSboHREHvPk43jtv7ntICzJYO3V3a1LvWGsk+cGcEpR6tYS6SdAW9uWLsqeTv1lG3GRUBEB9Ks5y1uvbeu+E+nHXpqi7eothnjqEgFP7kfgR+Vp9H85xkgcCe1rw7aI1dLGQMdkzTUQCMknJKvZgDmHv2FfiCFjetunFH14PGBp+jhIKGivkb/65GtjUak1B3NMqKMv3TaXNZa6wcMOnANCd/5wnTEtRErAe3Yz8pNO8QqxMgIbzCQeQngqCnZk2wILMT6aIH4istM3rT8H69rbNlzadYAkElgi1vkrEAeL9RdqnDPTVeqp8FsaW9dQn9jqLy/pwIcfXquPA65QkAvUa3Ns/wXZFiW0Gr2NQbwxxj803ANs=
Content-ID: <996676580BC99D40B797E56954FCBE22@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c00c8791-21da-4c6a-4b66-08d70066fc46
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 10:04:21.8452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3154
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 14/15] x86/IRQ: eliminate some on-stack
 cpumask_t instances
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAyMDo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjAvMDUvMjAx
OSAxNToyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIEZyaSwgTWF5IDE3LCAyMDE5
IGF0IDA0OjUyOjU0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IFVzZSBzY3JhdGNo
X2NwdW1hc2sgd2hlcmUgcG9zc2libGUsIHRvIGF2b2lkIGNyZWF0aW5nIHRoZXNlIHBvc3NpYmx5
DQo+Pj4gbGFyZ2Ugc3RhY2sgb2JqZWN0cy4gV2UgY2FuJ3QgdXNlIGl0IGluIF9hc3NpZ25faXJx
X3ZlY3RvcigpIGFuZA0KPj4+IHNldF9kZXNjX2FmZmluaXR5KCksIGFzIHRoZXNlIGdldCBjYWxs
ZWQgaW4gSVJRIGNvbnRleHQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20NCj4gDQo+IE1pc3NpbmcgYSB0cmFpbGluZyA+DQoNCkkgaGFkIGFk
ZGVkIHRoYXQgb25lIGFscmVhZHkuDQoNCj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClRoYW5rcyBhZ2Fpbi4NCg0KSmFuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
