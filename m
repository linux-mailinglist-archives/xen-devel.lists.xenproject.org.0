Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CAB7A399
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:02:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNxx-0003q6-KK; Tue, 30 Jul 2019 08:58:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsNxw-0003q1-EH
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:58:40 +0000
X-Inumbo-ID: 38c3859c-b2a8-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38c3859c-b2a8-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:58:39 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 08:58:38 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:52:27 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYDFIvzCZCqCArXscgcFMD6C8M/IhpvIS53dCui8MQdSmqF8x5lt696MyBLTHe6PQXlTkGMB7SjtFq3xrwZEncPi9ODTx/1wbX0Yi/cLTXiSGMatIwXUsZixTuS/UPLZJAgkvz/+iwEzJdneoMBC8u3RdKrUBwrvddtIRzRDh2ANfkz7mYvE/3xfUdI36BbaV9rq6X+2wEOiLOLDAMZ+pF/huKZs5uBtcwgKUlsj0wNd4qptXy/tReiaRiP3XdoBUxa/mS6BpEiLccTeuP8+znsoOmg0knjmnNba41S+6STeUmXGq6nLyI3M08Poh46xCyyZENuGZv3Rp2w6ilFn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgvXewOVxRurH+Y4OmvFa7WoiUY+/z/0YvpUCcRiErA=;
 b=VwQ46RTZjnxnjwH3IQ1QdfVqOt16DLMmD81PgY/Ls6sLUC4nn4WS2XX6UqGPgeh0vE4qFMAsOpaB5O8on8EqyyWxd4jypi7SUSb6S0YtA7JsxP9vETp4kwlMfc7xFAOGptahZYA7TU/28fxzUXMmgFXS4/HXwTL8bfE4S97JNun5ATJC957nSg5ZUuE3p9QYJTMyHGJ/iJUJiZDxqZLiRNSMU9NiZWpWkqi8s9hyxoRTsGmayZv4CnilRjS/PyD1TVvd+MCg9P2Jvrd09J287Kkf55JSXstT/IB7UBLfbvaqRx5ZJ2XfStAKDN/tPFkq5VmGtEnjyLLD/JWCHUXp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3428.namprd18.prod.outlook.com (10.255.139.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Tue, 30 Jul 2019 08:52:26 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:52:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 04/10] xen/mask: Convert {cpu,node}mask_test() to be
 static inline
Thread-Index: AQHVRgbpDOdFjryO+EmqrqZxqjugP6bi3CEA
Date: Tue, 30 Jul 2019 08:52:25 +0000
Message-ID: <802b09e7-adf9-85ee-e298-3b239e900016@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-5-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-5-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:10:110::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f01533d-7719-4828-a289-08d714cb3e85
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3428; 
x-ms-traffictypediagnostic: BY5PR18MB3428:
x-microsoft-antispam-prvs: <BY5PR18MB34280E3614C6C6A4AAB527E3B3DC0@BY5PR18MB3428.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(189003)(199004)(66066001)(4326008)(81166006)(81156014)(8676002)(8936002)(6246003)(25786009)(316002)(229853002)(31686004)(6436002)(68736007)(446003)(86362001)(53936002)(2616005)(6486002)(476003)(11346002)(66946007)(2906002)(64756008)(66446008)(66476007)(486006)(66556008)(5660300002)(6512007)(71190400001)(71200400001)(54906003)(4744005)(256004)(186003)(26005)(31696002)(36756003)(478600001)(80792005)(102836004)(14454004)(6916009)(3846002)(99286004)(53546011)(76176011)(7736002)(305945005)(6506007)(52116002)(386003)(6116002)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3428;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oVrnbQKT7cM9iwupXHmAReVC0tfx5ZVIVTogRlUmHlcpmzNdYvS6KUKG0N1nr50qDnSQIvrwFqR1ECaQAowqXIo4N5q5eyfZ5XxQt+cPqrS4EC37Q+FP/3BW5BZ9ONR+Yn3EqbsL+dxv0VwwkoBz4qT2YhvlQ7Eyo0i2QR9BexHKnki0qbz4SLJBLakgR+qxHIurRu415EaI4SyZ2JGmh7H8wZ5cxSnqpdl+3MA3913cx+1RvLBv/dcS/feOJC4i2AKgtoptbJPXLYKpO2Z61f2Tj10nuVxIYhmNzrDHWkmp0YPdwjFg9ALAyddax4/AzOlVqiod3FTD+slcnpVWU/tSk4N8bM8HH26SCIC9THaHu5oeThHNMJA+nJef3vriJvVbnLUoTiMyypOfkJqQR8jzataiSG0+MQgvveCZxpY=
Content-ID: <AEAA55F18A086A4793A11A4F99B6E532@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f01533d-7719-4828-a289-08d714cb3e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:52:25.9704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3428
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 04/10] xen/mask: Convert {cpu,
 node}mask_test() to be static inline
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhlIGJ1Z2d5IHZl
cnNpb24gb2YgR0NDIGlzbid0IHN1cHBvcnRlZCBieSBYZW4sIHNvIHJlaW1wbGVtZW50IHRoZSBo
ZWxwZXJzDQo+IHdpdGggdHlwZSBjaGVja2luZywgdXNpbmcgWGVuJ3MgbGF0ZXN0IHR5cGUgZXhw
ZWN0YXRpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCndpdGggb25lIHJlbWFyazoNCg0KPiBAQCAtMTE3LDkgKzEwOCwxMCBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgY3B1bWFza19jbGVhcihjcHVtYXNrX3QgKmRzdHApDQo+ICAgCWJpdG1hcF96
ZXJvKGRzdHAtPmJpdHMsIG5yX2NwdW1hc2tfYml0cyk7DQo+ICAgfQ0KPiAgIA0KPiAtLyogTm8g
c3RhdGljIGlubGluZSB0eXBlIGNoZWNraW5nIC0gc2VlIFN1YnRsZXR5ICgxKSBhYm92ZS4gKi8N
Cj4gLSNkZWZpbmUgY3B1bWFza190ZXN0X2NwdShjcHUsIGNwdW1hc2spIFwNCj4gLQl0ZXN0X2Jp
dChjcHVtYXNrX2NoZWNrKGNwdSksIChjcHVtYXNrKS0+Yml0cykNCj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCBjcHVtYXNrX3Rlc3RfY3B1KHVuc2lnbmVkIGludCBjcHUsIGNvbnN0IGNwdW1hc2tfdCAq
ZHN0KQ0KDQpJbiBwYXJ0aWN1bGFyIGluIGNvbWJpbmF0aW9uIHdpdGggY29uc3QgSSBkb24ndCB0
aGluayAiZHN0IiBpcyBhDQpwYXJ0aWN1bGFybHkgZ29vZCBuYW1lLiAic3JjIiwgIm1zayIsIG9y
ICJtYXNrIiB3b3VsZCBhbGwgc2VlbQ0KYmV0dGVyIHRvIG1lLg0KDQpKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
