Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC9B6A746
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 13:22:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnLVk-0004Ls-F6; Tue, 16 Jul 2019 11:20:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnLVi-0004Ln-KO
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 11:20:42 +0000
X-Inumbo-ID: bcb39218-a7bb-11e9-a5f5-13e0c7e5b410
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcb39218-a7bb-11e9-a5f5-13e0c7e5b410;
 Tue, 16 Jul 2019 11:20:39 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 11:20:38 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 11:20:20 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 11:20:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQaAgG4E2/B9u1Ad4SpjKTahhyunFbnBIEeFODsRT4SmzWAx839FDE8hXVvQDT3oGXoqa33sdLiXm9OKdUgfftIcij6JjknV9vkzcchLi0eR4+zMT2kB1PsOsUcwB+VeqTPv9/IHMpIT8m+D25vxs7EPl4BYWi3ctWe/kSYTsqh6hkntgQzmsRWIRoXHk+eVU1Ant6t7iGa/0Vxj/FmndBDqhe00W8A4je6jaEZbukMYUJzx1SBsATt/IKJPW/ny5dLJ7FVVEkj0SlzaJhFtPxYo/F6s3S+C4cB8tnFyOyt1nKm+305KpOu7gSeecjypSM5rRD7GeYi1XFJHu/xjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHRHitF2jSx5xx56peBgHOaR3nf4wKK2GZ9g7tBjMMw=;
 b=X1lGSehv8xs4irktH1vl4VjLCgF/nmV4JH/iUzPJZTpukS6YhhjWZ87sS5uSiXxLM44puin6QjKQWIH4kf/DntR9qedbz1H2fEHf1nLxJLcTvN6HZkrGWk/TkatwyrRpcILalAifDcJMsUyuxVe+s2gUPOWI95DfSfSbmGkbMAmaAKYUO1WxaGyWYaDH21sHzeQLEtVcy3nY77aGIk7cQHld1ApE7OhNC5Y+5p2aKZKkqtwhXKBDneAmB/Jsi97dGoJ+asuIonTfkLJiLu96ROJlk/JiMb31adrh7Ota07rbt4iC4P4/+Z2J9Hzy6vl+/MwaWdQpmG6gJpA2tpE3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3388.namprd18.prod.outlook.com (10.255.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 11:20:18 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 11:20:18 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant
 <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 3/4] iommu: introduce iommu_groups
Thread-Index: AQHVO7+5rqBhdjdwYEadjO/an1ZP4qbNCoHvgAAC7oCAAAFPc4AACp+A
Date: Tue, 16 Jul 2019 11:20:18 +0000
Message-ID: <eddcafb8-1244-1ff1-0486-6f9dbde424ce@suse.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-4-paul.durrant@citrix.com>
 <ebd58c3e-d973-3c59-c37b-4cae15165025@citrix.com>
 <2063f979-633e-b214-b3f9-8380e7666950@suse.com>
 <a664569d-f8a5-0603-2c86-2302b7293a5c@citrix.com>
In-Reply-To: <a664569d-f8a5-0603-2c86-2302b7293a5c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0016.eurprd05.prod.outlook.com
 (2603:10a6:6:14::29) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c20647f5-829d-4c73-9ce3-08d709df9569
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3388; 
x-ms-traffictypediagnostic: DM6PR18MB3388:
x-microsoft-antispam-prvs: <DM6PR18MB3388507427EF8792FFD46793B3CE0@DM6PR18MB3388.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(26005)(102836004)(386003)(25786009)(53546011)(99286004)(476003)(446003)(31686004)(11346002)(14454004)(6506007)(76176011)(66556008)(2616005)(8676002)(186003)(4326008)(6436002)(6486002)(66476007)(64756008)(53936002)(54906003)(66946007)(66446008)(52116002)(6512007)(6246003)(316002)(2906002)(3846002)(6116002)(486006)(81166006)(229853002)(71200400001)(71190400001)(110136005)(81156014)(66066001)(68736007)(7416002)(36756003)(8936002)(2501003)(256004)(14444005)(305945005)(5660300002)(80792005)(478600001)(31696002)(7736002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3388;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QIlyf+aAX+OfKemUPIBbnGfjaR9XTj1NT0+aPlZ4aYtulJJqi1qN9DwFEd4yvPY7pnSeqr6GXwC4BirBfcxcpTKLxrDotpL0ywX0rAIrqfQicg7Wywy2LFMwWv9+I6qf3TztfqJ8D3IEwT3QA2JxgQLNUyLmAD1aYaWIf0t/AYu/AQ84zRnDuvLUOmwiEfc8KPNBMekRHOarEzvpZlSnagdYFt7KCYbbDWfhB/l+2S3vYnre5bfAT2gwd1f5hwCyeFh/f6XjVqgb1gVcSNl3t8s5TO4zDiOlswqbVaQvnp56Kl6KC0okbSneccG1s7Ws/0KavxJ9Fe4TFmhYoBFaB54Ixvou1/mvUuRe0sgJMuKPCzlJcaQey38OP8qH/B6gF1WOLr2LqSjH+bsk5+Y5DFk7gSeXQfx33X9ddMK4rIc=
Content-ID: <4D2D934298790E4F8B605B5479250186@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c20647f5-829d-4c73-9ce3-08d709df9569
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 11:20:18.7626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3388
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 3/4] iommu: introduce iommu_groups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDcuMjAxOSAxMjo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTYvMDcvMjAx
OSAxMTozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNi4wNy4yMDE5IDEyOjI2LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDE2LzA3LzIwMTkgMTE6MTYsIFBhdWwgRHVycmFudCB3
cm90ZToNCj4+Pj4gK2ludCBpb21tdV9ncm91cF9hc3NpZ24oc3RydWN0IHBjaV9kZXYgKnBkZXYs
IHZvaWQgKmFyZykNCj4+Pj4gK3sNCj4+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpv
cHMgPSBpb21tdV9nZXRfb3BzKCk7DQo+Pj4+ICsgICAgaW50IGlkOw0KPj4+PiArICAgIHN0cnVj
dCBpb21tdV9ncm91cCAqZ3JwOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCAhb3BzLT5nZXRfZGV2
aWNlX2dyb3VwX2lkICkNCj4+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+ICsNCj4+Pj4gKyAg
ICBpZCA9IG9wcy0+Z2V0X2RldmljZV9ncm91cF9pZChwZGV2LT5zZWcsIHBkZXYtPmJ1cywgcGRl
di0+ZGV2Zm4pOw0KPj4+PiArICAgIGlmICggaWQgPCAwICkNCj4+Pj4gKyAgICAgICAgcmV0dXJu
IC1FTk9EQVRBOw0KPj4+PiArDQo+Pj4+ICsgICAgZ3JwID0gZ2V0X2lvbW11X2dyb3VwKGlkKTsN
Cj4+Pj4gKyAgICBpZiAoICFncnAgKQ0KPj4+PiArICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+
Pj4gKw0KPj4+PiArICAgIGlmICggaW9tbXVfdmVyYm9zZSApDQo+Pj4+ICsgICAgICAgIHByaW50
ayhYRU5MT0dfSU5GTyAiQXNzaWduICUwNHg6JTAyeDolMDJ4LiV1IC0+IElPTU1VIGdyb3VwICV4
XG4iLA0KPj4+IE5vIHVuYWRvcm5lZCBoZXggbnVtYmVycyBwbGVhc2UuwqAgVGhpcyBpcyBhIHJl
Y2lwZSBmb3IgY29uZnVzaW9uIGR1cmluZw0KPj4+IGRlYnVnZ2luZy4NCj4+Pg0KPj4+IEVpdGhl
ciAlI3gsIG9yICV1LCBhbmQgbmVlZHMgdG8gYmUgZml4ZWQgb24gY29tbWl0IGlmIHdlIGdvIHdp
dGggdGhhdCByb3V0ZS4NCj4+IEkgYXNzdW1lIChob3BlKSB0aGF0IHlvdSBtZWFuIHRoaXMgZm9y
IHRoZSByaWdodCBtb3N0IG51bWJlciBvbmx5OyBpdCdzIG5vdA0KPj4gZW50aXJlbHkgdW5hbWJp
Z3VvdXMgZnJvbSB5b3VyIHJlcGx5Lg0KPiANCj4gT29wcyB5ZXMgLSBJIG9ubHkgbWVhbnQgdGhl
IElPTU1VIGdyb3VwIGZvcm1hdHRlci4NCj4gDQo+IFRoZSBQQ0kgY29vcmRpbmF0ZXMgc2hvdWxk
IGdldCBzdWJzdW1lZCBieSAlcHAgaW4gZmFpcmx5IHNob3J0IG9yZGVyLg0KDQolb3AgSSAoc3Rp
bGwpIGhvcGUgOy0pDQoNCkphbg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
