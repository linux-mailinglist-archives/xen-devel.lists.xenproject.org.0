Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A1C60853
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:51:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjPW4-00046n-P4; Fri, 05 Jul 2019 14:48:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjPW3-00046i-Uk
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:48:47 +0000
X-Inumbo-ID: f897e544-9f33-11e9-8bbd-072dc040dcbf
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f897e544-9f33-11e9-8bbd-072dc040dcbf;
 Fri, 05 Jul 2019 14:48:43 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 14:48:15 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 14:47:41 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 14:47:41 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3426.namprd18.prod.outlook.com (10.255.136.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 14:47:40 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 14:47:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/ctxt-switch: Document and improve GDT handling
Thread-Index: AQHVMzl9f7XpHmXEn0SQQWgMTo0c+6a8GMcdgAAB8QA=
Date: Fri, 5 Jul 2019 14:47:40 +0000
Message-ID: <93766142-f051-90f4-8631-1b420a614d6a@suse.com>
References: <20190704175732.5943-1-andrew.cooper3@citrix.com>
 <b6372724-920c-5798-8615-55c1e992b97b@suse.com>
 <f0200191-c5d2-62a4-ef43-bee1ee8920de@citrix.com>
 <01ed83cc-72ed-4800-3639-b74f9dfec9d6@suse.com>
 <7265137f-4b31-ab2d-539d-9a5bf182bab2@citrix.com>
In-Reply-To: <7265137f-4b31-ab2d-539d-9a5bf182bab2@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR1001CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:b7::26) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8323e44-1c45-4044-4274-08d70157ba73
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3426; 
x-ms-traffictypediagnostic: BY5PR18MB3426:
x-microsoft-antispam-prvs: <BY5PR18MB34266679EA4094C7096E9FE3B3F50@BY5PR18MB3426.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(189003)(199004)(53546011)(31696002)(386003)(6506007)(76176011)(102836004)(316002)(54906003)(99286004)(53936002)(52116002)(6246003)(31686004)(71190400001)(71200400001)(4744005)(66066001)(5660300002)(36756003)(2906002)(26005)(64756008)(66476007)(66946007)(66556008)(66446008)(73956011)(256004)(14454004)(186003)(3846002)(6116002)(229853002)(6512007)(72206003)(4326008)(81156014)(6486002)(446003)(8936002)(81166006)(305945005)(11346002)(6916009)(80792005)(2616005)(476003)(7736002)(86362001)(6436002)(486006)(478600001)(68736007)(8676002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3426;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mIICtQcuFKJbZvU4creO7tb3ZVlGELM+jOD/FcNOXEo3Gk2pwYBO/4OPqrvcIXwk0POWMUfWu/GAGnsARxth7OZBrufCSpn21vvkEet55Ct1zTv5xr9goSpdJOlylAueNGk1Zszhub1Xgq/pG2sV3tr2t6cm9dLYS38Pdw6GfvNMtOze9rxOjIHjt1bsq/ftjW5ToR7mPiGSitBcp4smwGizdF1fF79vgzH+tLUBOYdoh1OhLfpTn9KOaDrVCQxB/lLMuGhWtKhyfFl59sygGU7ExYlyQMlYx5RVeKqsXDIJaAFZvh4zhWbyq7/wgajDVRHWETvp0aN5gr4j/HfCujZsqE6sW2bPBwEs5RiTpHDQcHf4ga+jLM1x7NxdJVRWPSDsL+ao4UWwdBMVpeXeKhdpLyiejbq10dM7dbpJc3c=
Content-ID: <5EC2327E9F9F5C498D93B7E63AE20061@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8323e44-1c45-4044-4274-08d70157ba73
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 14:47:40.0301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3426
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/ctxt-switch: Document and improve GDT
 handling
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

T24gMDUuMDcuMjAxOSAxNjo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gRm9yIG5vdywgSSdt
IHRlbXB0ZWQgdG8gZ28gd2l0aCBhbiBhbnN3ZXIgb2YgIml0IGRvZXNuJ3QgbmVlZCB0byBiZSB0
aGUNCj4gY29tcGF0IEdEVCIuDQoNCldoaWNoIGlzIGZpbmUgd2l0aCBtZS4NCg0KPsKgIFRoaXMg
aXMgYSByYWJiaXQgaG9sZSBJIHJlYWxseSBkb24ndCBoYXZlIHRpbWUgdG8gZm9sbG93IGF0bS4N
Cg0KRnVsbHkgdW5kZXJzdG9vZC4gRnJvbSB0aGUgdmVyeSBiZWdpbm5pbmcgSSB3YXMgb25seSBh
ZnRlciBzb21lIGNvbW1pdA0KbWVzc2FnZSBhZGp1c3RtZW50cyBoZXJlIChhbmQgdGhlIG9uZSB0
cml2aWFsIGNvbW1lbnQgY29ycmVjdGlvbikuIEl0J3MNCnVwIHRvIHlvdSB3aGV0aGVyIHRvIGZv
bGQgaW4gdGhlIHIvbyBtYXBwaW5nIG9mIHRoZSBYZW4gR0RUIHBhZ2UsIHNpbmNlDQp5b3UgdG91
Y2ggdGhhdCBjb2RlIGFueXdheS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
