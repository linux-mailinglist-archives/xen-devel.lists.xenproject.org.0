Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A3B7AAE6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 16:25:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsT0n-0000hB-MG; Tue, 30 Jul 2019 14:21:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsT0m-0000h6-Sc
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 14:21:56 +0000
X-Inumbo-ID: 5de1ef4e-b2d5-11e9-a731-d328e2b9cdd3
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5de1ef4e-b2d5-11e9-a731-d328e2b9cdd3;
 Tue, 30 Jul 2019 14:21:53 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 14:21:48 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 14:10:30 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 14:10:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIyDBabhFMuZLdbMWcA1R04C+I7rIGYThPhfmYkBhVdk+Yp2N8+7jeu8xS7mYxa+9ExxTMan0BCjxkOWp1L2X2XBqBF8JOtuktGpBiw2a0l2vqUXqZmFoWv1AHhowOORGww/T20fESfvJlCmL2K/iS9K/SS2npmOVrBhymc/tFH3D1VMTg8zJkpk9Pdv1P4x+dv1e1P+iJ9HFPhwPEDdGKAnadvQdbqtZATnPgxF9sgjmFgosR2+7YKl/zX9dxxfFGs6bxk55SEUMm+fiQft/f7fIHZAiWcN4mH47mzcxtUQ8d5P6gWDoleenCHp6GxZLH7Jfs//+Mdk3UyRrofx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOkg42hpgNIzlA3hJUWbns3pme4vrbbvXcj/5JLTV98=;
 b=TnJbHewtxxlaWtsmGy7k1HWVW5dVmCoJxfBTVQ04S1Uyt8EAuFnzGoVmZj9jQcZSilBB7rSHLlAoFnyeoTGmUr0V6cn86wxMSiRbFpCeNMwMxDq4B3KwgO6/Yk6COmqOn6hZoKr47fQsCDKsVlDYk+jz+Ai960D6davj1u3jbXTt2tjaxgRkhLZxpKZ4rxO/171YPPNIV171iKX8UjfqKbxPYAGahjBkR/rswxov+tjvmj1uISjlp7vPr/s3HIp8YCwdLML2PGXYyRGBjEIUyBXjLThPA3C1YgFgqKte+Th0VRoiqs4kj2r37w+H0oRH6ShJe7zMqyIEkAt/rllBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Tue, 30 Jul 2019 14:10:29 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 14:10:29 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v4 12/12] AMD/IOMMU: miscellaneous DTE handling
 adjustments
Thread-Index: AQHVQu2XKpCU3Gukp0iLV5jWvAWoa6bjM23FgAAHxwA=
Date: Tue, 30 Jul 2019 14:10:29 +0000
Message-ID: <74b2b0e6-bba5-2ad6-bde7-a29a3515c6eb@suse.com>
References: <b8ae110a-f94a-4ed2-5cf9-c00ff1c0cb81@suse.com>
 <019328c9-2727-6961-b33b-cb6d1387827c@suse.com>
 <974f714e-7866-d2e5-7517-5e28d01ba999@citrix.com>
In-Reply-To: <974f714e-7866-d2e5-7517-5e28d01ba999@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0059.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::21) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a94e9aec-0d68-416c-adbb-08d714f7ad16
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3394; 
x-ms-traffictypediagnostic: BY5PR18MB3394:
x-microsoft-antispam-prvs: <BY5PR18MB33948B4FE19AF68478EB1FA0B3DC0@BY5PR18MB3394.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(199004)(189003)(478600001)(53936002)(476003)(11346002)(2616005)(14454004)(486006)(3846002)(66066001)(102836004)(6246003)(53546011)(6506007)(81166006)(81156014)(26005)(2906002)(256004)(8936002)(386003)(71190400001)(446003)(68736007)(6116002)(4326008)(25786009)(186003)(8676002)(99286004)(54906003)(52116002)(305945005)(316002)(76176011)(86362001)(71200400001)(36756003)(6486002)(14444005)(80792005)(229853002)(66946007)(5660300002)(66556008)(66476007)(64756008)(6436002)(6916009)(7736002)(31696002)(31686004)(6512007)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3394;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e7Gexe3hzVqQ2ELk4/XownBRcSjI4/k9yvlJ5uLVvcdFg3tuthUXPNOVV7ZxcUyNFvz8qaFW2UrBFiCTfO0ZLvuqA4gn6p5UqjT5M3f+IAljMpGk9RRVLQWu/yGYbKcfpUGtBv+LEpBFhk4pBJ1W0mRI4TN2SgMXbx+FPisoOSrMoFuSAgZG4MVMsKJWwjmOc4PcL+empra0wuIvY4hquW8AIoKAqCaM2UE8IQuOxxM3DjGF6wDXaua7FC9NJp6bxZ+q1t1pskaSLzFgDjsc+Gbjz8Rf3Y1a9AF3ZZAFyF+LW9BmYXh4oHavZYG1Ppnlrazpd+0TrYyIGMNQnAJaitchDl1yGHiyM+Kh2UueNN3rUqmupBotiOwWwCoZMdFpjdZOMsVQYL2PQ42aPL1P9I3pLy02tboeUC0IamBATPk=
Content-ID: <C713C1D562D01E45BFE2AA04C32D6700@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a94e9aec-0d68-416c-adbb-08d714f7ad16
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 14:10:29.1425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3394
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v4 12/12] AMD/IOMMU: miscellaneous DTE
 handling adjustments
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

T24gMzAuMDcuMjAxOSAxNTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjUvMDcvMjAx
OSAxNDozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L2h2bS9zdm0vYW1kLWlvbW11LWRlZnMuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vc3ZtL2FtZC1pb21tdS1kZWZzLmgNCj4+IEBAIC0xMDcsNTcgKzEwNyw2MCBAQA0KPj4gICAg
I2RlZmluZSBJT01NVV9ERVZfVEFCTEVfSU5UX0NPTlRST0xfRk9SV0FSREVECTB4MQ0KPj4gICAg
I2RlZmluZSBJT01NVV9ERVZfVEFCTEVfSU5UX0NPTlRST0xfVFJBTlNMQVRFRAkweDINCj4+ICAg
IA0KPj4gKy8qIEZvciBub3cgd2UgYWx3YXlzIGFsbG9jYXRlIG1heGltdW0gcG9zc2libGUgaW50
ZXJydXB0IHJlbWFwcGluZyB0YWJsZXMuICovDQo+IA0KPiAvKiBGb3Igbm93LCB3ZSBhbHdheXMg
YWxsb2NhdGUgdGhlIG1heGltdW0uwqAgMjA0OCByZW1hcCBlbnRyaWVzLiAqLw0KPiANCj4gPw0K
DQpTdXJlLCBkb25lLg0KDQo+PiArI2RlZmluZSBJT01NVV9JTlRSRU1BUF9MRU5HVEgJCQkweEIN
Cj4gDQo+IEFsc28sIExFTkdUSCBpc24ndCBhbiBhcHByb3ByaWF0ZSBuYW1lLsKgIFRoaXMgaXMg
YWN0dWFsbHkgdGhlIG9yZGVyIG9mDQo+IHRoZSBudW1iZXIgb2YgZW50cmllcy7CoCBBcyB5b3Un
cmUgYWxyZWFkeSBjaGFuZ2luZyB0aGUgbmFtZSwgaG93IGFib3V0DQo+IHMvTEVOR1RIL09SREVS
LyBoZXJlPw0KDQpJIGRpZCBjb25zaWRlciB0aGlzIChhbmQgd2lsbCBjaGFuZ2UpLCBidXQgSSBk
aWRuJ3QgY2hhbmdlIGl0IHJpZ2h0DQphd2F5IGJlY2F1c2Ugb2YgdGhlIHJlc3VsdGluZyBpbmNv
bnNpc3RlbmN5IG9uIHRoaXMgbGluZQ0KDQogICAgIGR0ZS0+aW50X3RhYl9sZW4gPSBJT01NVV9J
TlRSRU1BUF9PUkRFUjsNCg0KSSBoYWQgdGFrZW4gImxlbmd0aCIgdG8gbWVhbiAiZW5jb2RlZCBs
ZW5ndGgiIGhlcmUsIG5vdCAiYWN0dWFsIGxlbmd0aCIuDQoNCj4gSWYgc28sIEFja2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpUaGFua3MuDQoNCj4g
W05vdCByZWxhdGVkIHRvIHRoaXMgcGF0Y2guLi5dDQo+IA0KPiBJdCBoYXMgYWx3YXlzIG9jY3Vy
cmVkIHRvIG1lIHRoYXQgd2UgYWxsb2NhdGUgc2lsbHkgcXVhbnRpdGllcyBvZiBtZW1vcnkNCj4g
Zm9yIGludGVycnVwdCByZW1hcHBpbmcgdGFibGVzLsKgIElmIEkndmUgZG9uZSBteSBzdW1zIHJp
Z2h0LCBmb3IgSW50ZWwNCj4gd2UgYWxsb2NhdGUgNjRrIGVudHJpZXMgcGVyIElPTU1VICgyNTZr
IFJBTSksIHdoZXJlYXMgZm9yIEFNRCB3ZQ0KPiBhbGxvY2F0ZSAyMDQ4IGVudHJpZXMgcGVyIFBD
SSBmdW5jdGlvbiAoMzJrIFJBTSwgbm93IHdpdGggdGhlIGxhcmdlcg0KPiBmb3JtYXQpLg0KDQpS
aWdodCwgdGhhdCdzIGFub3RoZXIgdGhpbmcgSSB3YW50ZWQgdG8gbG9vayBpbnRvIGFzIGEgZm9s
bG93LW9uLiBJDQp0b28gZGlkIG5vdGljZSB0aGlzLiBEZXBlbmRpbmcgd2hhdCB5b3UgbWVhbiBi
eSAiUENJIGZ1bmN0aW9uIiBpdA0KbWF5IGFjdHVhbGx5IGJlIHdvcnNlIHRoYW4gd2hhdCB5b3Ug
ZGVzY3JpYmU6IEl0J3Mgbm90IHBlciBQQ0kNCmZ1bmN0aW9uIG9mIHByZXNlbnQgZGV2aWNlcywg
YnV0IHBlciBQQ0kgZnVuY3Rpb24gZW51bWVyYXRlZCBieSB0aGUNCkFDUEkgdGFibGVzLiBPbiBt
eSBib3ggdGhpcyBtZWFucyBldmVyeXRoaW5nIGZyb20gMDA6MDAuMCB0bw0KZmY6MWYuNywgd2hp
Y2ggYW1vdW50cyB0byBhbG1vc3QgMkdiIGlmIEknbSBub3QgbWlzdGFrZW4gKCJhbG1vc3QiDQpi
ZWNhdXNlIG9mIHNvbWUgYWxpYXNpbmcgb2YgZGV2aWNlcywgd2hlcmUgb25seSBvbmUgdGFibGUg
Z2V0cw0KYWxsb2NhdGVkIGZvciBhbGwgdGhlIGFsaWFzZXMpLg0KDQo+IFRoZSBsYXJnZXN0IElu
dGVsIHN5c3RlbSBJJ3ZlIGVuY291bnRlcmVkIChpbnRlcnJ1cHQgd2lzZSkgaXMgYSBmZXcNCj4g
dGhvdXNhbmQgaW50ZXJydXB0cywgc3BsaXQgZmFpcmx5IGV2ZW5seSBhY3Jvc3MgdGhlIHJvb3Qt
Y29tcGxleCBJT01NVXMNCj4gKHRoZSBQQ0ggSU9NTVUgbm90LCBiZWNhdXNlIGl0cyBtb3N0bHkg
bGVnYWN5IElPIGJlaGluZCB0aGVyZSkuDQo+IA0KPiBGb3IgaW5kaXZpZHVhbCBmdW5jdGlvbnMs
IEkgaGF2ZSBuZXZlciBlbmNvdW50ZXJlZCBhIFBDSSBmdW5jdGlvbiB3aXRoDQo+IG1vcmUgdGhh
biBhIGRvemVuIGludGVycnVwdHMgb3Igc28sIHNvIEkgdGhpbmsgaW4gcHJhY3RpY2Ugd2UgY2Fu
IGdldA0KPiBhd2F5IHdpdGggYWxsb2NhdGluZyBhIDRrICgzMiBlbnRyeSkgaW50ZXJydXB0IHJl
bWFwIHRhYmxlIGluIGFsbCBjYXNlcy4NCg0KVGhhdCdzIGNsZWFybHkgYSBwb3NzaWJpbGl0eS4g
KEkgdGhpbmsgeW91IG1lYW50IDI1NiBlbnRyaWVzIHBlciA0aw0KdGhvdWdoLikNCg0KPiBJdCB3
b3VsZCBwcm9iYWJseSBtYWtlIHNlbnNlIHRvIGRlZmF1bHQgdG8gYWxsb2NhdGluZyBsZXNzIHNw
YWNlLCBhbmQNCj4gcHJvdmlkaW5nIGEgY29tbWFuZCBsaW5lIG9wdGlvbiB0byBhbGxvY2F0ZSBt
YXguwqAgQWx0ZXJuYXRpdmVseSwgd2UNCj4gY291bGQgd29yayB0aGlzIG91dCBhcyB3ZSB3YWxr
IHRoZSBQQ0kgdG9wb2xvZ3ksIGFzIGl0IGlzIGVuY29kZWQgaW4NCj4gc3RhbmRhcmRzIGNvbXBs
aWFudCB3YXlzIGluIGNvbmZpZyBzcGFjZS4NCg0KVG8gYmUgaG9uZXN0LCBmaXJzdCBvZiBhbGwg
SSdkIGxpa2UgdG8gYXZvaWQgYWxsb2NhdGluZyB0YWJsZXMgZm9yDQpkZXZpY2VzIHdoaWNoIGRv
bid0IGV2ZW4gZXhpc3QuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
