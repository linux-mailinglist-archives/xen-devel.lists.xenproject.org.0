Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631B6E680
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:34:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSzd-0002z4-2t; Fri, 19 Jul 2019 13:32:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoSzb-0002ye-Kc
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:32:11 +0000
X-Inumbo-ID: 9b3b46f5-aa29-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b3b46f5-aa29-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:32:09 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 13:32:07 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 13:31:28 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 13:31:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CayO2Hkmfc+GkWOgJPRc93DRTu+aWx4FwFRuPyvd06UWCTHF9tfj3s55oCGUjxA3RduqCZpP8ThlVNhysMJ2wwaE0JFkTW3w1UX2fUbeey84He6jMybR2g/5Q9As5CcoFLT4KE1dxgp9vIGJfmsXey8pC6aM+WRGcwM/RiISKtenJsZnJvadUhSREoHBpq0VuMmgjEwf9WsJmeaOV+D0wBytAVSk7SqK+aIgh5zpASsDpUVMrUQa8eT6/ad3cs0OVmpUFPjJujloDfLLEkgfdh4ladwhA3bzyvfa5ig2t0iJiGuRlVkYMgyHRwiLVjAkPZER/CJLgdGCQas5l3XCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tukEsuw5FfYiD1bGRe8KEclXbMcyDkSYh7D3NUWw7hI=;
 b=JC6d7Cg8BoWTFjek6jeSeEFjibODn/mJCBJcEoCNVvMA731BDgtsTewIh5s+z/sW+zzI3EgyhttD3k4x6KVQim8c/XILUDqYKSoLd/S83xApJvAlRyQH21nACgFoor1atAvs5x9MVynnTp5zHLdovtTGRxbZ0aIpe3Vr2w1CSIhyEXxA0o+j/a+HhLJ//XS2hsmBJdeyhXs9cN76FiqVh7eLZgZ9W33uyq3aAOXwE8bKCRI5Z/1OjwS5pbCT/2if9N8QSb2jNukau1ZSQbU7emrFOUJ9R23n8dMhQDC8PD2YxYINFg42f848/pHiwhkvBIn8q60K/tQd/nBrT7aGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3419.namprd18.prod.outlook.com (10.255.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 13:31:27 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 13:31:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] include/public/memory.h: remove the
 XENMEM_rsrc_acq_caller_owned flag
Thread-Index: AQHVPi0inxDFAcFhvkCxNR0VcWNDuKbR4nYzgAANs4A=
Date: Fri, 19 Jul 2019 13:31:26 +0000
Message-ID: <3204c2f3-e6fc-20dc-f3d3-432a8d148419@suse.com>
References: <20190719122545.3486-1-paul.durrant@citrix.com>
 <bb3a29a3-5e76-8914-a88b-759220f22e5a@citrix.com>
In-Reply-To: <bb3a29a3-5e76-8914-a88b-759220f22e5a@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0020.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3559fd5-bbfc-4290-bf81-08d70c4d668c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3419; 
x-ms-traffictypediagnostic: DM6PR18MB3419:
x-microsoft-antispam-prvs: <DM6PR18MB34192C3E689A7638A268DF13B3CB0@DM6PR18MB3419.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(386003)(76176011)(446003)(2616005)(6506007)(11346002)(476003)(186003)(53546011)(52116002)(26005)(102836004)(316002)(36756003)(256004)(25786009)(86362001)(99286004)(5660300002)(31696002)(54906003)(6116002)(3846002)(478600001)(14454004)(64756008)(71190400001)(71200400001)(66556008)(66476007)(66446008)(66946007)(6512007)(6486002)(80792005)(6246003)(2906002)(305945005)(7736002)(81166006)(8936002)(81156014)(66066001)(7416002)(68736007)(229853002)(486006)(4326008)(31686004)(53936002)(8676002)(6436002)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3419;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0BRV/61wxCUdSYJfgm1DTahFKUVwn4zT6pKvotyFcSVck18tyNV9cqUKnGFJR7gTbUgK/LB8ntSf0Z3z1LUtpLVH7RGlW4dWwLYADbPSFHlp8TCQQKUonQ8Vqgf2vA7lc7yyVPlx41oDpudUT2ebmCZA4rBQUQORJZA8FmM1o4Kfx9KKDK6f/eYzRUbL+wquLv9G9WNlhWouKNpa9gI6uQHaSfC0dlmadr6Z8vjDCuDdN6ZFtJn51B+Y6GiOu/JltBGA2TbVCKT7qIL1m89MUVGsDFlik4xbURUPRRCRTBnvWhSWMvFhC6eBA2Gas5a6NusmfmuQwL19azSZoiCnRFk+BbZdvEA4lLAEECpxhHNuwf0RKkW+J/hEO1g2+qSp34UHxSL5gy7hR5ncNeSnv+y8h6YnKh8sInPh5nkOXZ0=
Content-ID: <34C5C8745B759A4D82B6B98CB8A00BF1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e3559fd5-bbfc-4290-bf81-08d70c4d668c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 13:31:27.0028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3419
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] include/public/memory.h: remove the
 XENMEM_rsrc_acq_caller_owned flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNDo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTkvMDcvMjAx
OSAxMzoyNSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gV2hlbiBjb21taXQgM2Y4ZjEyMjggIng4
Ni9tbTogYWRkIEhZUEVSVklTT1JfbWVtb3J5X29wIHRvIGFjcXVpcmUgZ3Vlc3QNCj4+IHJlc291
cmNlcyIgaW50cm9kdWNlZCB0aGUgY29uY2VwdCBvZiBkaXJlY3RseSBtYXBwaW5nIHNvbWUgZ3Vl
c3QgcmVzb3VyY2VzLA0KPj4gaXQgd2FzIGVudmlzYWdlZCB0aGF0IHRoZSBtZW1vcnkgZm9yIHNv
bWUgcmVzb3VyY2VzIGFzc29jaWF0ZWQgd2l0aCBhIGd1ZXN0DQo+PiBtYXkgbm90IGFjdHVhbGx5
IGJlIGFzc2lnbmVkIHRvIHRoYXQgZ3Vlc3QsIHNwZWNpZmljYWxseSB0aGUgSU9SRVEgc2VydmVy
DQo+PiByZXNvdXJjZSBpbnRyb2R1Y2VzIGluIGNvbW1pdCA2ZTM4NzQ2MSAieDg2L2h2bS9pb3Jl
cTogYWRkIGEgbmV3IG1hcHBhYmxlDQo+PiByZXNvdXJjZSB0eXBlLi4uIi4gU3VjaCByZXNvdXJj
ZXMgd2VyZSBkdWJiZWQgImNhbGxlciBvd25lZCIgYW5kIHJlc3VsdGVkDQo+PiBpbiB0aGUgb3du
ZWQgcmVzb3VyY2VzIiBhbmQgYWNxdWlyaW5nIHRoZW0gcmVzdWx0ZWQgaW4gdGhlDQo+PiBYRU5N
RU1fcnNyY19hY3FfY2FsbGVyX293bmVkIGZsYWcgYmVpbmcgcGFzc2VkIGJhY2sgdG8gdGhlIGNh
bGxlciBvZiB0aGUNCj4+IG1lbW9yeSBvcC4NCj4+DQo+PiBVbmZvcnR1bmF0ZWx5IHRoZSBpbXBs
ZW1lbnRhdGlvbiBsZWQgdG8gWFNBLTI3Niwgd2hpY2ggd2FzIG1pdGlnYXRlZA0KPj4gYnkgY29t
bWl0IGY2YjZhZTc4ICJ4ODYvaHZtL2lvcmVxOiBmaXggcGFnZSByZWZlcmVuY2luZyIgYW5kIHRo
ZW4gYSByZWxhdGVkDQo+PiBtZW1vcnkgYWNjb3VudGluZyBwcm9ibGVtIHdhcyB3b3JrZWQgYXJv
dW5kIGJ5IGNvbW1pdCBlODYyZTZjZQ0KPj4gIng4Ni9odm0vaW9yZXE6IHVzZSByZWYtY291bnRl
ZCB0YXJnZXQtYXNzaWduZWQgc2hhcmVkIHBhZ2VzIi4gVGhpcyBsYXR0ZXINCj4+IGNvbW1pdCBy
ZW1vdmVkIHRoZSBvbmx5IGluc3RhbmNlIG9mIGEgImNhbGxlciBvd25lZCIgcmVzb3VyY2UsIGJ1
dCB0aGUNCj4+IGZsYWcgd2FzIGxlZnQgaW4gaGVhZGVyIGFuZCBjaGVja2VkIGluIG9uZSBwbGFj
ZSBpbiB0aGUgY29yZSBjb2RlLg0KPj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoYXQgbm93IHJlZHVu
ZGFudCBjaGVjayBhbmQgcmVtb3ZlcyB0aGUgZGVmaW5pdGlvbiBvZg0KPj4gWEVOTUVNX3JzcmNf
YWNxX2NhbGxlcl9vd25lZCBmcm9tIHRoZSBwdWJsaWMgaGVhZGVyLiBBbHNvLCBzaW5jZSB0aGlz
IHdhcw0KPj4gdGhlIG9ubHkgZmxhZyBkZWZpbmVkIGZvciB0aGUgWEVOTUVNX2FjcXVpcmVfcmVz
b3VyY2UgbWVtb3J5IG9wLCBpdCByZW1vdmVzDQo+PiB0aGUgJ2ZsYWdzJyBmaWVsZCBvZiBzdHJ1
Y3QgeGVuX21lbV9hY3F1aXJlX3Jlc291cmNlIGFuZCByZXBsYWNlcyBpdCB3aXRoDQo+PiBhbiBl
cXVpdmFsZW50bHkgc2l6ZWQgJ3BhZCcgZmllbGQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gDQo+IFRoaXMgaXMgYSBtb2Rp
ZmljYXRpb24gdG8gYSBwdWJsaWMgaGVhZGVyLCBidXQgaW4gdGhpcyBzcGVjaWZpYyBjYXNlLCBJ
DQo+IHRoaW5rIGl0IGlzIHRoZSBjb3JyZWN0IHRoaW5nIHRvIGRvLg0KDQpUaGlzIGlzIGluIGEg
bGFyZ2UgIiNpZiBkZWZpbmVkKF9fWEVOX18pIHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXykiIHNl
Y3Rpb24sDQphbmQgd2UgY29uc2lkZXIgcHVibGljIGludGVyZmFjZSBwYXJ0cyBpbiBzdWNoIHNl
Y3Rpb25zIHZvbGF0aWxlIGFueXdheS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
