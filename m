Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E574BCD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:41:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqb9L-000242-1E; Thu, 25 Jul 2019 10:39:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqb9J-00023w-IJ
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:39:01 +0000
X-Inumbo-ID: 69572a16-aec8-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69572a16-aec8-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:39:00 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:38:58 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 10:37:38 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 10:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/i26tYtIFL4QLUQzrVIku2O7XG4xNGQT2YXe9b3riOKXbfpsZ/MkbJxez+N4ASryfSbEP3D26K2cGbBLs/wG+guxXoaE4GWkfxZATYnVOXgKBhVxMHk9ALCdE3Z1BDE1Q/jY54jtxAB0/vAQJqy2emIzfHq/xoI/XcycgM+fBAqbQTOHTUs3vvRXh8202XZIbrjv9dTY2fW3bnvzwVRF3cmw+NcTivp+aiVX6QUNwoBjmHLOD6/KZ3yP1WEncMrN3v6scGmNzbbnHRrfU+/77OYkPP2X125mHYvwlordWUC1jaZJaDehwHp4tCvH8cxZwlhalZWJgUvj/jbVKFHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQekNGd4MtbRqzrWRrooM0G7PGkZ04YIRF6Bpd5Sq0c=;
 b=g1Mh5Y1pVHvGm14o2zeSp5cE1IkIZKNCVx1KLQUXjsChY/+uNbAVcriWCJqDNnD7AZvbmgsV+oQhMdC30IRUrH+pE1S0FJfQQGuWTwcIDKabY/xaayIP4MG7LUuJW1hwDLpLPmI0WHTXmwejDVrYbxiz4vBWu7ValVJeaeEE8bCBKlvMXjwqk6mB3W/dySiLEMkLTKD8NjHF/28f5Feaqfxixr8VsZP2W+whRKJzETD2yaN9+N7W9XOOKB1Cq+vqxYih38pMWJ+fA9LdjVGPHR29raB3hSOAECPZqpMLOWyVi3k0y5KQe9WhytQldQQTNbekjCNrmshUfvKwo/Bq2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2985.namprd18.prod.outlook.com (20.179.48.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 10:37:37 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 10:37:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 3/3] x86/dmi: Constify quirks data
Thread-Index: AQHVQkdJ4D6dRHL0Jkazew/ijLBoYqbbJWCA
Date: Thu, 25 Jul 2019 10:37:37 +0000
Message-ID: <ebc911a1-dd18-9e22-6b7d-24401ead513d@suse.com>
References: <20190724174256.5295-1-andrew.cooper3@citrix.com>
 <20190724174256.5295-4-andrew.cooper3@citrix.com>
In-Reply-To: <20190724174256.5295-4-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0404.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b6c0ba9-3611-47e5-15eb-08d710ec1c8c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2985; 
x-ms-traffictypediagnostic: DM6PR18MB2985:
x-microsoft-antispam-prvs: <DM6PR18MB29853D4563ACAEDE2487582CB3C10@DM6PR18MB2985.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:556;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(11346002)(2616005)(476003)(102836004)(446003)(386003)(6246003)(31696002)(316002)(486006)(6916009)(6486002)(229853002)(53546011)(6506007)(186003)(99286004)(66946007)(76176011)(26005)(52116002)(5660300002)(14444005)(4744005)(256004)(25786009)(305945005)(64756008)(66556008)(66476007)(53936002)(4326008)(71200400001)(86362001)(66446008)(71190400001)(478600001)(3846002)(8936002)(31686004)(6116002)(6436002)(6512007)(14454004)(8676002)(81166006)(81156014)(68736007)(2906002)(66066001)(7736002)(36756003)(54906003)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2985;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OLsWO4NaJHuWqRzvggOybGjKhhnInUa0JH5+vkzEbR8W0zLtjf1xN7rWeqTZZcpy6qd0TitluuH7lfJTL2u9GMKzw28rKkefAxJ3gyJX4p5aEePPTQ7j4mk5kcwnBX+LqUdC94rmX5lh2lQbMbKDlfwZ53dHh7tSzmGio/S/2fBWcqkqso5HkyQ9SPB/Tjpjw87dJtPubNM0ATC3g2L0p/T7AttHf/yXKCYyehjqB3ENDJ3OQ8npqBwcRNthpfwun8yowHwl73r6YaffYay/3OGPnCl8B71MOn/+hDyG7JwDpimfZ6ynY4rq5QrIxUOU46P5sn/NZZeH9RpdRksRtbx62A4yE76JlDLzWGu8964+52GHgtnNru6VMqsGGUifUX7kcG9wB0gpNdeRE/Je1A34oNiTSoxlN//b7Hk2r/k=
Content-ID: <1AFB5F1D9EC92A4B9F45B01E6872C29A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6c0ba9-3611-47e5-15eb-08d710ec1c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 10:37:37.4872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2985
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/3] x86/dmi: Constify quirks data
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAxOTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gQWxsIERNSSBxdWly
a3MgdGFibGVzIGFyZSBtdXRhYmxlLCBidXQgYXJlIG9ubHkgZXZlciByZWFkLg0KPiANCj4gVXBk
YXRlIGRtaV9jaGVja19zeXN0ZW0oKSBhbmQgZG1pX3N5c3RlbV9pZC5jYWxsYmFjayB0byBwYXNz
IGEgY29uc3QgcG9pbnRlciwNCj4gYW5kIG1vdmUgYWxsIHF1aXJrcyB0YWJsZXMgaW50byBfX2lu
aXRjb25zdC4NCg0KSSB0aGluayB5b3UgbmVlZCB0byB1c2UgX19pbml0Y29uc3RyZWwgdGhyb3Vn
aG91dC4NCg0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCldpdGggdGhhdCBhZGp1
c3RtZW50DQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
