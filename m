Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A95A6AD07
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 18:44:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQWH-0003mm-Mg; Tue, 16 Jul 2019 16:41:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnQWG-0003mS-5y
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 16:41:36 +0000
X-Inumbo-ID: 910b248c-a7e8-11e9-82e0-7b1ba7739469
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 910b248c-a7e8-11e9-82e0-7b1ba7739469;
 Tue, 16 Jul 2019 16:41:32 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 16:41:31 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 16:41:22 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 16:41:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHZSy1yAQJjvA/jk5KNUA6JG53/Cr7GZeOsHma0SmB7f+0OXng2zibegBov4v6yJovzJqjKDOmJwjg67IUMNKeFyks/jgO5mckysGMmwwAyYWWcTO8f7Fd24PMsMUNODBy/dh77vLS7XCJgcKQZSat8ZHhiDAJL9ZMcJ7uW6PYOM6RQycmBAWJ99LV741jbNk/p5rZUc79HZC0CLDxL5rE3VYOgVy5ny14DnlPLqzLK+Xp91+9MjgL8CF6Ve1w3FVPixJBLartmQfwYR7/gkbpy6HoFGkFmc0vv4m0/Ug4UhYEzy04AdgrQx8l4XkpOpkzgvaC2AnyMjqS0Qv7x8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25LfTAvWWkVzqyIJWFpIqZQiv1F85Eut+yxHMyurJnk=;
 b=Wx+7XCv7GwbkMKPRGRAFhEFHK+89Y/OYNuJNZGSt/UvCAC6tL861LuDnpStt/TjJa0veU+MvGYh4MbF16DUeY1Y4I/t2lZ0AEM2tN0wZCg7jDooOxG2Vik8soYkypAxy5I4g2ypj7h9pv0jcBAnmpTTx2QK0oSWEptnrwAsmfBOFL4ONcGVR5SvG/afp+FHoA8nwGewHabvXzPOhJ2kJ90IcodJnjlXPdevrZKi7uxIyrL3btDHdKf8YOGX0FTj5XL2MOxeqSJsoLpE/LOGdO1WvhvTYcvX4wHDmOcjHbCT8Qq+HdOsYCm1nFLdfksm+ToNp7QLpLiP66AI8BBAZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3164.namprd18.prod.outlook.com (10.255.172.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:41:21 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:41:21 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 14/14] AMD/IOMMU: process softirqs while dumping IRTs
Thread-Index: AQHVO/VM0Z1oh+Srj0iEZDBBy+eI4w==
Date: Tue, 16 Jul 2019 16:41:21 +0000
Message-ID: <10fb0354-9018-a714-44b7-efda1b579aa1@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
In-Reply-To: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:5::32)
 To DM6PR18MB3401.namprd18.prod.outlook.com (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a8e0cbe-69ca-45d9-6b74-08d70a0c6ec0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3164; 
x-ms-traffictypediagnostic: DM6PR18MB3164:
x-microsoft-antispam-prvs: <DM6PR18MB3164773E302F3317BFC23A89B3CE0@DM6PR18MB3164.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(199004)(189003)(31696002)(14444005)(256004)(6512007)(36756003)(86362001)(53936002)(8676002)(6436002)(486006)(6486002)(66556008)(66946007)(66476007)(64756008)(5640700003)(66446008)(6506007)(66066001)(2906002)(446003)(6916009)(31686004)(2616005)(476003)(81156014)(386003)(11346002)(81166006)(3846002)(2351001)(71190400001)(80792005)(2501003)(186003)(4326008)(26005)(8936002)(52116002)(305945005)(25786009)(68736007)(54906003)(14454004)(316002)(478600001)(7736002)(102836004)(99286004)(76176011)(71200400001)(5660300002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3164;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: crbihP2NfrS+IkWAEOtBYS6axADSH9DYqNZEqJrpEPBLgN3z7tseOq96qHawaoagWHzl6iHiv1KGITouVeY3FJ5Zc23XaEN+2KsfhrOTM172PfaNDzouIlyYTdULuYxmUIEDRfXXmcY3Lw0ccaD+eIYYW0oSKNK0Qquw/9ezsB19lpX/HSs+8NnKG9yeQpShx0EA89FwuZtyZ2VOGjcb2OWNt0mPDUDWm4b3bhSchyxbOFfLhfQx3lHcKVUEwJ6dhOZ51+GmlDnhIKwy40FKXa3NJhtS2KCmUAWzATC7hsBr35Er7UZm555tQ6V8AYKFhs/9anhIqWeY2ZoSDszDY/Zf9wMXCjbOBmGB+wUaWpoDPt0HnfBCqdfFxPx5bZYxCNUK8csWPvSzXqPRtptMgBN4XviWH7c16wKpu8eEXRY=
Content-ID: <F15677496F47CF439500A568D66347C8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8e0cbe-69ca-45d9-6b74-08d70a0c6ec0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:41:21.1323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3164
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 14/14] AMD/IOMMU: process softirqs while
 dumping IRTs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB0aGVyZSBhcmUgc3VmZmljaWVudGx5IG1hbnkgZGV2aWNlcyBsaXN0ZWQgaW4gdGhlIEFD
UEkgdGFibGVzIChubw0KbWF0dGVyIGlmIHRoZXkgYWN0dWFsbHkgZXhpc3QpLCBvdXRwdXQgbWF5
IHRha2Ugd2F5IGxvbmdlciB0aGFuIHRoZQ0Kd2F0Y2hkb2cgd291bGQgbGlrZS4NCg0KU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KLS0tDQp2MzogTmV3Lg0K
LS0tDQpUQkQ6IFNlZWluZyB0aGUgdm9sdW1lIG9mIG91dHB1dCBJIHdvbmRlciB3aGV0aGVyIHdl
IHNob3VsZCBmdXJ0aGVyDQogICAgICBzdXBwcmVzcyBsb2dnaW5nIGhlYWRlcnMgb2YgZGV2aWNl
cyB3aGljaCBoYXZlIG5vIGFjdGl2ZSBlbnRyeQ0KICAgICAgKGkuZS4gZW1pdCB0aGUgaGVhZGVy
IG9ubHkgdXBvbiBmaW5kaW5nIHRoZSBmaXJzdCBJUlRFIHdvcnRoDQogICAgICBsb2dnaW5nKS4g
QW5kIHdoaWxlIG1pbm9yIGZvciB0aGUgdG90YWwgdm9sdW1lIG9mIG91dHB1dCBJJ20NCiAgICAg
IGFsc28gdW5jb252aW5jZWQgbG9nZ2luZyBib3RoIGEgInBlciBkZXZpY2UiIGhlYWRlciBsaW5l
IGFuZCBhDQogICAgICAic2hhcmVkIiBvbmUgbWFrZXMgc2Vuc2UsIHdoZW4gb25seSBvbmUgb2Yg
dGhlIHR3byBjYW4gYWN0dWFsbHkNCiAgICAgIGJlIGZvbGxvd2VkIGJ5IGFjdHVhbCBjb250ZW50
cy4NCg0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYw0KKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYw0KQEAgLTIyLDYgKzIy
LDcgQEANCiAgI2luY2x1ZGUgPGFzbS9odm0vc3ZtL2FtZC1pb21tdS1wcm90by5oPg0KICAjaW5j
bHVkZSA8YXNtL2lvX2FwaWMuaD4NCiAgI2luY2x1ZGUgPHhlbi9rZXloYW5kbGVyLmg+DQorI2lu
Y2x1ZGUgPHhlbi9zb2Z0aXJxLmg+DQogIA0KICBzdHJ1Y3QgaXJ0ZV9iYXNpYyB7DQogICAgICBi
b29sIHJlbWFwX2VuOjE7DQpAQCAtOTE3LDYgKzkxOCw4IEBAIHN0YXRpYyBpbnQgZHVtcF9pbnRy
ZW1hcF9tYXBwaW5nKGNvbnN0IHMNCiAgICAgIGR1bXBfaW50cmVtYXBfdGFibGUoaW9tbXUsIGl2
cnNfbWFwcGluZy0+aW50cmVtYXBfdGFibGUpOw0KICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmKGl2cnNfbWFwcGluZy0+aW50cmVtYXBfbG9jayksIGZsYWdzKTsNCiAgDQorICAgIHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcygpOw0KKw0KICAgICAgcmV0dXJuIDA7DQogIH0NCiAgDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
