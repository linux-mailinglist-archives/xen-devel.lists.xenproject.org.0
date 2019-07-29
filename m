Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47178FE4
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:54:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7wD-0002GP-Oh; Mon, 29 Jul 2019 15:51:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs7wC-0002GK-KH
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:51:48 +0000
X-Inumbo-ID: c3b46008-b218-11e9-a86d-47ff52a531f4
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3b46008-b218-11e9-a86d-47ff52a531f4;
 Mon, 29 Jul 2019 15:51:45 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 15:51:43 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:31:33 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFYgsyCNY7mctMErOE0t3NLV777QHzCRgwtLwRM9SWBa+Jk9WXHNZrV5B4OoeJ82eskjpUAaG7Pn9sBrFIGNadAqCLxKji5cnS8WPKvR+hajtdoWWhNljYHnlOG+fPp18ytYElyiPRqtRJu3E+TrNoU1RT7OrHNsEo7ieWyoFkv3m+mo6mDcqyrZu6pWkpVCrYdMfLKeLIWkEJG1VU4BcCYp0oX6zK6Ye+2UZeG6AQNibBdIe/MiIK0t5Nt/y4rGUOWFePdglSckky8v6EMk5ecpDXjpx4zW/ExUkknN20m2FCwOpyL3YhgWlJGVK+S1WC5w4b/Jtwxt62smQ7NBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYpeD9xDfIS5Ebj/FRqdWldXFfZ4i9dS3x7nW1MZs5g=;
 b=daVUjzoQDQ8kccPR2RKAgoDpyAdz/9vjkQD7IKbhxn6EyEAgcNpuMwEzB8LNX8Kb7odEe95fmKM188Y+1kb/wXP+ifX0OFIegJlpepy90fFsCwuGA5VpCaWGILV9MFYZ6z1bD3LurBUoOCiTa8yDI0YUtRkXw38OugM2lB2saNXkgEnnwRDHjl+ZAZKTJUybUa+7uYOsnEYI/6MPSvDVSy/0WNa8iYFHUbzXkZQox3ZFDSYJwv1NqVhCMM+FBIaZDscn5nn0ijEh3SfsN5x2+IbJOw0JmFPioK8zR/5jzEP2gqG5NZUQZ3xdZQADzNz0nlDH2hEK96mY9yYj8NY2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3156.namprd18.prod.outlook.com (10.255.138.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 15:31:31 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:31:31 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/3] kconfig: include default toolchain values
Thread-Index: AQHVQ7bZ4JfBDdQhHkSeEuJQATAI7abhve2A
Date: Mon, 29 Jul 2019 15:31:31 +0000
Message-ID: <1274ba66-a510-7ee0-23db-ff61de2634f7@suse.com>
References: <20190726133331.91482-1-roger.pau@citrix.com>
 <20190726133331.91482-2-roger.pau@citrix.com>
In-Reply-To: <20190726133331.91482-2-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::26)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 722f5db7-5cf1-4ed5-3bf7-08d71439d4af
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3156; 
x-ms-traffictypediagnostic: BY5PR18MB3156:
x-microsoft-antispam-prvs: <BY5PR18MB315623F70F8A1005B19510FAB3DD0@BY5PR18MB3156.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(189003)(199004)(6246003)(31696002)(36756003)(8936002)(14454004)(8676002)(52116002)(99286004)(6436002)(4326008)(81156014)(81166006)(186003)(76176011)(316002)(54906003)(25786009)(3846002)(6916009)(6116002)(6486002)(102836004)(229853002)(26005)(7736002)(6512007)(66476007)(486006)(305945005)(7416002)(478600001)(386003)(2906002)(53546011)(66946007)(66446008)(64756008)(66556008)(66066001)(446003)(86362001)(2616005)(68736007)(476003)(80792005)(5660300002)(31686004)(11346002)(256004)(71200400001)(6506007)(71190400001)(53936002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3156;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0YwzJMl5XsN0gXRLYWdZ9LrbNfTG/Ka35dLRoQC7WB/2ueqQ9Ok8N4/91iD/eucuC4vTfZ4Wq7x4N/eyq7THGYY/ijA+4RG6JWU0n1AoZibV8t5Tbc4+b4LcVza00aPe3VCyXuTrxwdojcWUjSb/eEFTPefoQqU0FgUaP84IWyDmHuAQPwvcBZ63mlHe+aXqkC1vvDRdwtgkFTO5DdcH5pKQ2fCSl06GpSl19ASDULiJ2D10GLeo7S3TRLZqEYP59sJYbi0Pqftlb4nylXPPz3mc7DW7hurZ85e3w8MOIIe4T9U/TawR6zybeAZCEcXG3JO32TcmxecwbV1qdT0BxJTZRaUuNQrhCtDMi+i5GEFrAzB0oH7Er1hXrVSkZLa99y3cXshm+t7jv3DqfMPHTClwqY5+0VmbvmOP4R/fIrg=
Content-ID: <7CA5A99D4A94B14E89F7DFC60E985549@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 722f5db7-5cf1-4ed5-3bf7-08d71439d4af
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:31:31.1928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3156
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/3] kconfig: include default toolchain
 values
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 TimDeegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAxNTozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBJbmNsdWRlIGNv
bmZpZy8kKE9TKS5tayB3aGljaCBjb250YWlucyB0aGUgZGVmYXVsdCB2YWx1ZXMgZm9yIHRoZQ0K
PiB0b29sY2hhaW4gdmFyaWFibGVzLiBUaGlzIHJlbW92ZXMgdGhlIG5lZWQgdG8gcGFzcyBIT1NU
e0NDL0NYWH0gYXMNCj4gcGFyYW1ldGVycyBmcm9tIHRoZSBoaWdoIGxldmVsIG1ha2UgdGFyZ2V0
IG9yIHRvIGRlZmF1bHQgdGhlbSB0bw0KPiBnY2MvZysrIGlmIHVuc2V0Lg0KDQogRnJvbSB0aGlz
IGRlc2NyaXB0aW9uIEkgdGhvdWdodCByZXZpZXdpbmcgd291bGQgYmUgc3RyYWlnaHRmb3J3YXJk
Lg0KSG93ZXZlciwgLi4uDQoNCj4gLS0tIGEveGVuL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2Nv
bmZpZw0KPiArKysgYi94ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnDQo+IEBAIC0z
NSwxNSArMzUsMTQgQEAgS0JVSUxEX0RFRkNPTkZJRyA6PSAkKEFSQ0gpX2RlZmNvbmZpZw0KPiAg
ICMgcHJvdmlkZSBvdXIgc2hlbGwNCj4gICBDT05GSUdfU0hFTEwgOj0gJChTSEVMTCkNCj4gICAN
Cj4gLSMgcHJvdmlkZSB0aGUgaG9zdCBjb21waWxlcg0KPiAtSE9TVENDID89IGdjYw0KPiAtSE9T
VENYWCA/PSBnKysNCj4gLQ0KPiAgICMgZm9yY2UgdGFyZ2V0DQo+ICAgUEhPTlkgKz0gRk9SQ0UN
Cj4gICANCj4gICBGT1JDRToNCj4gICANCj4gKyMgU2V0cyB0b29sY2hhaW4gYmluYXJpZXMgdG8g
dXNlDQo+ICtpbmNsdWRlICQoWEVOX1JPT1QpL2NvbmZpZy8kKHNoZWxsIHVuYW1lIC1zKS5taw0K
PiArDQo+ICAgIyBpbmNsdWRlIHRoZSBvcmlnaW5hbCBNYWtlZmlsZSBhbmQgTWFrZWZpbGUuaG9z
dCBmcm9tIExpbnV4DQo+ICAgaW5jbHVkZSAkKHNyYykvTWFrZWZpbGUNCj4gICBpbmNsdWRlICQo
c3JjKS9NYWtlZmlsZS5ob3N0DQoNCi4uLiBuZWl0aGVyIHRoZSBtYWtlIGZpbGUgaGVyZSBub3Ig
dGhlIHR3byBvbmVzIGluY2x1ZGVkIChpbg0KY29udGV4dCBhYm92ZSkgaW5jbHVkZSBhbnkgb3Ro
ZXIgZmlsZSAoYWZhaWNzKSB0aGF0IHdvdWxkIGxlYWQgdG8NCkhPU1RDQyBiZWluZyBkZWZpbmVk
LiBBbmQgbm90aGluZyB1bmRlciAkKFhFTl9ST09UKS9jb25maWcvIGxvb2tzDQp0byBkZWZpbmUg
aXQgZWl0aGVyLiBJIGd1ZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZywgYXMgSSdtIHN1cmUNCnRo
aXMgaXMgd29ya2luZyBmb3IgeW91Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
