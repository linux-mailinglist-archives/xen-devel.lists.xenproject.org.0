Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E386E88E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 18:19:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoVYz-0001z7-Os; Fri, 19 Jul 2019 16:16:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoVYx-0001z1-TP
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 16:16:51 +0000
X-Inumbo-ID: 9b3d9cc8-aa40-11e9-b506-5776596ee1ac
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b3d9cc8-aa40-11e9-b506-5776596ee1ac;
 Fri, 19 Jul 2019 16:16:49 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 16:16:46 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 16:16:07 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 16:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vtt1qtyJmDA/kAXfu793IjnP61vZidHH+yHipb+P26HVofUe9ptvoEPJhkCI3CGpi5liWk52gJPQ5JvbnKYegEbBkP2MVBZE9tooRhEHNwqBMKgtLf0Ikmqv1N8LFE5su/D9ha8wdKA3bbGalLKxVkPdb8Bj+PJAXlNMiQl/ANriR36Il+DLoeKVcUeUJne/9B80wOnTOXX6tG/M4w2xBbqXpH7NDT6FtAhgjBg8WMQcT4f50GRHGHnxkOdIiNteEczvmcIip30nagvjKyhdbJWdyPuf9b0LqgX6j0qPWqw+6bWVYzyfVlAXZNV4Et4KMif88S51XGtQ5xs5paXQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgMeDhCJhKji8V92nOa8YpnKZcKBP+08d8HqdS2aCDw=;
 b=UPq63fF1+zYib3Juzo+NLqXUfWfsAUyUgP59giHvI2r2M2oVMVAGu48LsAvVx8BD6y1+H5sMpIFwdnJg1Kq0xn1DwMskh9q2FsEkRlx8f61eKY0WScydQxLmH5FYFfb8kP7a51xeib5SS0n+Dq3URKC48Dwxvtlq2/HAnzzZkpJKkvAU1l/RVpnnDHPVZuRfKWl4ecfp2gMzFA2Gc5Kc9oGVgT2nTVowkQwDMSrZ1GqPFf8BeRczyriAXGcg1uyjL6eyB6+zShBwfpOQZIARo2n1s+jFwRn8avcUAoBQ7mLXobEfxawFiwImHwTJ6RTc2cfmq83d3O3zOV+509WV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3324.namprd18.prod.outlook.com (10.255.174.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 16:16:06 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 16:16:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 04/14] AMD/IOMMU: use bit field for IRTE
Thread-Index: AQHVO/ShZ1XycBFTpEyE5AJFB9blPabSHS6jgAAFboA=
Date: Fri, 19 Jul 2019 16:16:06 +0000
Message-ID: <f1042832-2853-a9f9-1e1a-70af1481da83@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <7eb213ad-94f1-6092-c670-3296aedf3f0e@suse.com>
 <cf6262df-917a-d253-c856-65e785e80939@citrix.com>
In-Reply-To: <cf6262df-917a-d253-c856-65e785e80939@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:4:3e::14) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 503d72a3-3edb-4166-28fd-08d70c646709
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3324; 
x-ms-traffictypediagnostic: DM6PR18MB3324:
x-microsoft-antispam-prvs: <DM6PR18MB3324998E6FB42C0115672A49B3CB0@DM6PR18MB3324.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(199004)(189003)(14444005)(68736007)(446003)(81156014)(3846002)(81166006)(256004)(6116002)(86362001)(476003)(8676002)(11346002)(6916009)(2616005)(66066001)(229853002)(6246003)(186003)(99286004)(102836004)(54906003)(31696002)(4326008)(486006)(52116002)(6506007)(316002)(36756003)(305945005)(7736002)(386003)(76176011)(6486002)(478600001)(53936002)(2906002)(26005)(64756008)(6512007)(66446008)(25786009)(66556008)(66946007)(66476007)(53546011)(71200400001)(71190400001)(31686004)(5660300002)(6436002)(8936002)(80792005)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3324;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UKh2diMjrT2B00EmbRQnhc29eWFD+bKqcgoUFbQaLD/fq3tPTRepNjEt4qmRIAz7VfaIRaSlw+G4L58ZwXTzk6mqdjF7s5WCdpB/RBNFaSG0irA8lgL4yQibt1qqzxXnVIzU59VMurRFKaVGZIflvmE1xOY41Bi3mVHjV9E/1Q/ArZw8WMSj9wKugw5d0Y6DXs2X9nv/AkzQ9EvCBxn3MZM0olcMezEuMWHQliJwZys0bHd6EvYpXVPA01T6k04PRmdGsQROTR9MABNxD4El/PnJTkjyLKNkwqvLK2H66Q9AQYWwh8JyjKcyJjObRhhFGR9j2darvJOSC0xfaH57kgYxSMFRocwmCZ+eJodeO9ZLOqzlvS/4JU3AL/qjbwP9rjgP53cUFnkstTUmiDDfp6oHuJz75QkZTpLFrCsK4ms=
Content-ID: <C24E6A34F8E13344A84164CDE18A09F3@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 503d72a3-3edb-4166-28fd-08d70c646709
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 16:16:06.3149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3324
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 04/14] AMD/IOMMU: use bit field for IRTE
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNzo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTYvMDcvMjAx
OSAxNzozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBBdCB0aGUgc2FtZSB0aW1lIHJlc3RyaWN0
IGl0cyBzY29wZSB0byBqdXN0IHRoZSBzaW5nbGUgc291cmNlIGZpbGUNCj4+IGFjdHVhbGx5IHVz
aW5nIGl0LCBhbmQgYWJzdHJhY3QgYWNjZXNzZXMgYnkgaW50cm9kdWNpbmcgYSB1bmlvbiBvZg0K
Pj4gcG9pbnRlcnMuIChBIHVuaW9uIG9mIHRoZSBhY3R1YWwgdGFibGUgZW50cmllcyBpcyBub3Qg
dXNlZCB0byBtYWtlIGl0DQo+PiBpbXBvc3NpYmxlIHRvIFt3cm9uZ2x5LCBvbmNlIHRoZSAxMjgt
Yml0IGZvcm0gZ2V0cyBhZGRlZF0gcGVyZm9ybQ0KPj4gcG9pbnRlciBhcml0aG1ldGljIC8gYXJy
YXkgYWNjZXNzZXMgb24gZGVyaXZlZCB0eXBlcy4pDQo+Pg0KPj4gQWxzbyBtb3ZlIGF3YXkgZnJv
bSB1cGRhdGluZyB0aGUgZW50cmllcyBwaWVjZW1lYWw6IENvbnN0cnVjdCBhIGZ1bGwgbmV3DQo+
PiBlbnRyeSwgYW5kIHdyaXRlIGl0IG91dC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiBJJ20gc3RpbGwgbm90IGVudGlyZWx5IGNv
bnZpbmNlZCBieSBleHRyYSB1bmlvbiBhbmQgY29udGFpbmVyb2YoKSwgYnV0DQo+IHRoZSByZXN1
bHQgbG9va3MgY29ycmVjdC4NCg0KQW5kIEknbSBzdGlsbCBvcGVuIHRvIGdvaW5nIHRoZSBvdGhl
ciB3YXksIGlmIHlvdSdyZSBjb252aW5jZWQgdGhhdA0KaW4gdXBkYXRlX2ludHJlbWFwX2VudHJ5
KCkgdGhpcw0KDQogICAgIHN0cnVjdCBpcnRlX2Jhc2ljIGJhc2ljID0gew0KICAgICAgICAgLmZs
ZHMgPSB7DQogICAgICAgICAgICAgLnJlbWFwX2VuID0gdHJ1ZSwNCiAgICAgICAgICAgICAuaW50
X3R5cGUgPSBpbnRfdHlwZSwNCiAgICAgICAgICAgICAuZG0gPSBkZXN0X21vZGUsDQogICAgICAg
ICAgICAgLmRlc3QgPSBkZXN0LA0KICAgICAgICAgICAgIC52ZWN0b3IgPSB2ZWN0b3IsDQogICAg
ICAgICB9DQogICAgIH07DQoNCihhbmQgc2ltaWxhcmx5IHRoZW4gZm9yIHRoZSAxMjgtYml0IGZv
cm0sIGFuZCBvZiBjb3Vyc2UgLmZsZHMNCmluc2VydGVkIGF0IG90aGVyIHVzZSBzaXRlcykgaXMg
b3ZlcmFsbCBiZXR0ZXIgdGhhbiB0aGUgY3VycmVudA0KdmFyaWFudC4NCg0KPiBBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KVGhhbmtzLCBKYW4N
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
