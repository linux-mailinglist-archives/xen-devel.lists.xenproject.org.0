Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017836CD29
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 13:13:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho4Ip-0006Jb-HW; Thu, 18 Jul 2019 11:10:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho4Io-0006JW-Bb
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 11:10:22 +0000
X-Inumbo-ID: 9ff0a9d0-a94c-11e9-aa19-b750f7cff364
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ff0a9d0-a94c-11e9-aa19-b750f7cff364;
 Thu, 18 Jul 2019 11:10:18 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 11:10:14 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 11:10:09 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 11:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAhQnRxv2wEPP87qewjEUGlVtHRapFjz3y4Su84Q40VbR6CCK3Hb7iDF2k6ePzjIZO9agKkviKtH6bBMQ5b+EWPMrRENyvXrgN1U9jCpTdO734/jQEUUNRqDkOUMBUMBo3VjapJw1Dw3whZL0EGs/BGUkMwtBjkI/qllY44rmHikVNwIWc+yIvzJC24Anqjbo4JG5XMU1ugj7B/58u5WHUJcPPBxFlviInYczuWSfrBwMGablQSxhQeDjtV98VD0Q/l7TDubHyTLqbqvFcwWq853OWYmKlMtpj9+4bJigG0uP1HB01J5dWuyPHwbcYyAW0wemPMm71FEHnhoR0GoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb+e7RSBVWcx6Vz5BSy7DrPAIb0NOXjtJ3G2hVso6d4=;
 b=NPfiw1Lr9tP4y/olV1UJS+1BMmRUGWofovPKEHOQaS53sOh99CdKtopP2kDvHs7yKHjYViocAVUGZ+VoyPbC+8kwyav0VRrqqOJBt84kg5wjTHO86EQNRykuydkazgJyWfGd3R66vUJx28H46YXLvTWAa9tUSVRC4Fyyt/VeFz8G1uBtu85f7LaA6sdItDfdUTPMO0QdaVvm9n+TnWCjlp1k6GVcu1TfcGjj7jbzrpVsTTuOc2sxQPnNmfTKerAlNa5z6B3ONxHzXQFTRi86IHTDr1u/DcohJcf2Lg4ocws9xe4NCIngPQug40Xuqzx1qkgfMQnYzn5dCbcaN1Z0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2857.namprd18.prod.outlook.com (20.179.52.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 11:10:08 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 11:10:08 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] schedule: mask out XEN_RUNSTATE_UPDATE from
 state entry time
Thread-Index: AQHVPU7dWxB3gAbicEW8M/sijNABxqbQOA+A
Date: Thu, 18 Jul 2019 11:10:08 +0000
Message-ID: <abf62099-b848-b7ec-b665-52a2dce755b7@suse.com>
References: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0802CA0047.eurprd08.prod.outlook.com
 (2603:10a6:4:a3::33) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e54bd08-dfdc-454a-df8e-08d70b707eaf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2857; 
x-ms-traffictypediagnostic: DM6PR18MB2857:
x-microsoft-antispam-prvs: <DM6PR18MB2857E426E8BDD7D5F8F462E7B3C80@DM6PR18MB2857.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(189003)(52314003)(199004)(107886003)(6246003)(53936002)(305945005)(3846002)(6116002)(7736002)(8676002)(6512007)(14444005)(99286004)(498600001)(66446008)(68736007)(6486002)(6436002)(52116002)(36756003)(4744005)(53546011)(6506007)(8936002)(2906002)(86362001)(386003)(486006)(31686004)(66556008)(31696002)(2616005)(476003)(81156014)(66476007)(66946007)(64756008)(71200400001)(26005)(71190400001)(446003)(102836004)(66066001)(76176011)(81166006)(256004)(25786009)(6916009)(186003)(14454004)(5660300002)(80792005)(4326008)(11346002)(54906003)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2857;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gdGnfxPRqEWpLKr80sDA9rkoksmNuqzjK4xShBo0YgGKt3t/V4aJckoVCY+v2JNxbQ8LGewXt5eZctT59m2//zH8xI+GbTGLZDVBgfdLFfXpfJt+ilUdUfcHbFzC5b+eAnTsW/T9q/y4V8YzoL+xopmCGFSaed7Vvarqjx2Q6ZanuIpvYUP+tA6vR7LDC+s3l7NiZ2Uxk3ogz7UGLV6DxV4gAdj1l0X5yjNNsp20yxlWBxZHqjrNHt7mSHXuXs+XfDZfj8T4riEgUh0Q6+r4RF4QSncX+CGiJf8YYs5BLG6DjLMpBr7eZwPU+p3NMRsLqfo5bAGY/llk0GDPRh1OmgRKJ2lPD/Uujngi4njSG6rauw6pOAZRN0Z8go1SxxUpJ/JSSz+LSokEo+bwYhgXRHBjJC45F+JI30Gxwoqzhp0=
Content-ID: <A7E22B255D78D045B7C14B62F95387D1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e54bd08-dfdc-454a-df8e-08d70b707eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 11:10:08.7191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2857
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] schedule: mask out XEN_RUNSTATE_UPDATE from
 state entry time
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrii
 Anisov <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxMTo1NCwgQW5kcmlpIEFuaXNvdiB3cm90ZToNCj4gVXNpbmcgWEVOX1JV
TlNUQVRFX1VQREFURSBtYXNrIGR1cmluZyB0aGUgcHJvY2VzcyBvZiBjb3B5aW5nIHJ1bnN0YXRl
DQo+IHZhbHVlcyB0byBndWVzdCBjYXVzZXMgcnVuc3RhdGUgZW50cnkgdGltZSB0byBiZSBldmVu
dHVhbGx5IGNvbnNpZGVyZWQNCj4gbmVnYXRpdmUgb24gYSBjYWxjdWxhdGlvbiBvZiB0aGUgdGlt
ZSBkZWx0YS4gU28gdGhlIFhFTl9SVU5TVEFURV9VUERBVEUNCj4gc2hvdWxkIGJlIG1hc2tlZCBv
dXQgZHVyaW5nIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgdGltZSBzcGVudCBpbiB0aGUNCj4gcGFy
dGljdWxhciBydW5zdGF0ZS4NCg0KQSBjb25jcmV0ZSBzY2VuYXJpbyB3aGVyZSB1cGRhdGVfcnVu
c3RhdGVfYXJlYSgpIGFuZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgpDQpjYW4gYWN0dWFsbHkgcmFj
ZSB3b3VsZCBiZSB2ZXJ5IHdvcnRod2hpbGUgdG8gcG9pbnQgb3V0IGhlcmUuIEluIHBhcnRpY3Vs
YXINCm9uIEFybSBJJ20gbm90ICh5ZXQ/KSBzZWVpbmcgaG93IHRoaXMgY291bGQgaGFwcGVuLg0K
DQpDb25zaWRlcmluZyB0aGUgdmFsdWUgb2YgWEVOX1JVTlNUQVRFX1VQREFURSBpdCBtdXN0IGJl
IGEgcmF0aGVyIHJhcmUgcmFjZQ0KYW55d2F5LCBJIHdvdWxkIGd1ZXNzLg0KDQpKYW4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
