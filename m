Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA3690F4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1tA-00047q-EF; Mon, 15 Jul 2019 14:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hn1t9-00047d-7K
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:23:35 +0000
X-Inumbo-ID: 1e075604-a70c-11e9-91f7-776026945b9c
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e075604-a70c-11e9-91f7-776026945b9c;
 Mon, 15 Jul 2019 14:23:31 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 14:23:28 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 14:23:23 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 14:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rc6Z7zOd/Zsssehdnz2hWomsnTMDcGBlxQVDvSlr3WlupPPHdyy1E8UwiXT+lfcqrifhnk/Bd4e0y6zNp/PamMrcplCqpuiznq+RGJMd2HZ8174HLwITx9qtoz7VpIHz6nqJpO+wq8qOwmqWBbVEKmi8D87HV/0ODQLcDH43xGAMcOvP1vzvks+35+vMCfAwWsdO4giwMr4g3KqwBh67fqzAgdLD2qbGukRMQ8wqK9sakRH9qarKZ+8ss42zzlSSKsO0V40qekf2IRpzTVPa8rQCmp67dR3xEzYFJWTB6X0KdrsRapxOeG8gVp9Mhcj2zeeC1WeicCFmE3K8RL9JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QvwRce6J5iC4L5zPIlO1iswScoVfL8CXB7V62JvVvQ=;
 b=IoIExeVA0yN8tsCuRglOwEIN7pWE5Ck127wS8gXKFyDWl438oMtRS27c3mvlbNWWBzRmc63wkGalfCKwiKMcZUowmD1RMFJgPsF/h5ca45P3RHZXtZuOdNZ6UZlC03AwAiKaogL27AA1QgS02VThJLOJrrTzx7YDivhjFLx+wW7mC8yLkhyFtAgrM0hxRd84OP38cIT9fQgwHtdCo2W1HsLW/ruZo8mKi/g1/2mEDMpUd/DGz8uYSUD+STR7Ur/qUHDh+s7jRXS2WhgUsp6TnjtlBTV21AtmDEPxK7bzuSzJeY1Qf4dfdjtGgaSaxI1XLXgDq1PYT4zz6OglI0wfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2506.namprd18.prod.outlook.com (20.179.105.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 14:23:22 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 14:23:22 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [Xen-devel] Design session report: Xen on Distros
Thread-Index: AQHVOxdKPvpxo6u4BUiqE8VCaQqJKabLu4AA
Date: Mon, 15 Jul 2019 14:23:22 +0000
Message-ID: <86244630-aeb9-07a3-95f9-53d998b768ea@suse.com>
References: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
In-Reply-To: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:2f::25)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3feee44c-6f85-42ac-6596-08d7092ffda7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2506; 
x-ms-traffictypediagnostic: DM6PR18MB2506:
x-microsoft-antispam-prvs: <DM6PR18MB250625F326EC144B79191E08B3CF0@DM6PR18MB2506.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(26005)(80792005)(3846002)(6116002)(229853002)(6916009)(66066001)(31696002)(66476007)(64756008)(6512007)(68736007)(86362001)(36756003)(186003)(71190400001)(71200400001)(53936002)(66556008)(66446008)(5660300002)(25786009)(66946007)(446003)(6486002)(6436002)(2906002)(31686004)(76176011)(14454004)(478600001)(4744005)(14444005)(8936002)(6246003)(256004)(486006)(6506007)(53546011)(99286004)(561944003)(102836004)(11346002)(2616005)(7736002)(386003)(305945005)(476003)(4326008)(52116002)(81156014)(8676002)(316002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2506;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: she+fvGCPHBtLa4tlO0KN8anhoVEWwFxrRoMgjVMfw6ChY8tb7qIGAkrtv9EKPzcf6BwLMRwx79lL48WNPxmDY4LOjcTQfj0fxv5bWtBJO1EsW2vjnPaY0+J6omPvuuzUU3RfUdCvmNedOiln6pudOv8iU8dYyoGo0IVo0pWE0VfSkosxdrXtuIyjY29xUHthpS5dBc0NwLc0IQO77gH31u+b2/jWu/W/2fbZrjMLy3+9TUeQbPLylMk9TrP7lG7xl2yTB2j+kCySMvwb+JHx7vNPm84yPboUB4J6gsWVTJoJn3fyWhpgiMZR3+4Xgqjd8uqxSpESINBXCVsGIpvqH554ABHssUsBEazfzs8fZdETCRRo4+KNdaG8vnFnYk9oRcclA58uxjAwjGBSOF+z6l5DMsHNGm4Z2ZbsiOFLKc=
Content-ID: <8D637DBE69486A47BE7699B628BA6E47@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3feee44c-6f85-42ac-6596-08d7092ffda7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 14:23:22.2831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2506
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] Design session report: Xen on Distros
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxNjoxMSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gVGhlcmUgd2FzIGEg
bG9uZyBkaXNjdXNzaW9uIGFib3V0IHNlY3VyaXR5IHBhdGNoZXMsIHdpdGggdGhlIGdlbmVyYWwN
Cj4gcHJvcG9zYWwgYmVpbmcgdGhhdCB3ZSBzaG91bGQgY3V0IGEgcG9pbnQgcmVsZWFzZSBmb3Ig
ZXZlcnkgc2VjdXJpdHkgaXNzdWUuDQoNCkludGVyZXN0aW5nLiBMb29rcyBsaWtlIGluIHBvbGl0
aWNzIHRoYXQgdW50aWwgYSBkZWNpc2lvbiBmaXRzIHBlb3BsZQ0KdGhleSBrZWVwIHJlLXJhaXNp
bmcgdGhlIHBvaW50LiBJaXJjIG9uIGEgcHJpb3IgbWVldGluZyAoQnVkYXBlc3Q/KQ0Kd2UgaGFk
IHNldHRsZWQgb24gY29udGludWluZyB3aXRoIHRoZSBjdXJyZW50IHNjaGVtZS4gV2VyZSB0aGVy
ZSBhbnkNCm5ldyBhcmd1bWVudHMgdG93YXJkcyB0aGlzIGFsdGVybmF0aXZlIG1vZGVsPw0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
