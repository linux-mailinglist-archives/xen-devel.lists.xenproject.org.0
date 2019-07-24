Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFD72C4F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 12:25:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqEQk-0005pR-L6; Wed, 24 Jul 2019 10:23:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqEQi-0005pM-Un
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 10:23:28 +0000
X-Inumbo-ID: 136dbe0d-adfd-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 136dbe0d-adfd-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 10:23:28 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 10:23:23 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 10:22:53 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 10:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAIg3U0ePo2Q+l5Ozj+7HIvXMKKfeywhzIKs80KqiXSO+6yttXWo+M7TH9111ZZCgVrACA25f5ATgks8/ZZgJsaqpxFD63GKZJKgO85PoyYvB8S/8vm+agQMsJ/rDv1XfuJEg/COpgSXLzx66DEuffbaFXRz/QOJt/3xVucHUHOyTDCG1mrG9gmz2dTXdjnMHelzwaNbsiGPcfMPzKifUZAGrV/mWVxJ/kARIMC3i+sTJcRNTfgrOi+be7u9nxOnRps/JneD1lqbpnBTbl7F++ypp4ixLSqu2oHHy36VSHi7llHiNVfb/WkBMq3U6aU/x1J3aVVZOYLanvExcslcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zvw1hEBnghJr12Ze5NGAuUZ6lKkvAwqfm2CNjFGFC0Q=;
 b=m+RIWyZ8E61bRZF3SVPkg8/4LK+ymUN/d6/E/BZ9TXSZGaAK6BSFtLiHpSsd2dEKYBRgM0BAZ8EQ4yX5Vma4K8Q/1kVee+pJXFIwqcWmQEUiwjQ+QWF03+k1WbJcusI/ByNtvF2b6Kuf+4RoqVG3GdyfvmiKkHX+E3Jmwuo1zbJwkohnSz75Sa35/4bdjRDjv5d0YxRMEIGkO5HM/w2Boqm9vMSsn7uxS1aNyN/V4iZbNchwvr9lRv/gyrc1vKxgFZFdfT9PBv8JjrAxqvwGwsrTWbCth/8IEhJO3oNdGz0khuEn7W5bu9QQ7cmcs2AJv0bo1LWfT6+TetcOuxM+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3156.namprd18.prod.outlook.com (10.255.138.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 10:22:52 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 10:22:52 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/pv: Move async_exception_cleanup() into pv/iret.c
Thread-Index: AQHVQZEPVYSOd4hduEm4xew4+ZUIfabZkFYA
Date: Wed, 24 Jul 2019 10:22:52 +0000
Message-ID: <c52559d1-2deb-c821-c482-ddab59a1a78f@suse.com>
References: <20190723195830.4524-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190723195830.4524-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:4:29::23) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1154c18-be21-4028-1427-08d71020e271
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3156; 
x-ms-traffictypediagnostic: BY5PR18MB3156:
x-microsoft-antispam-prvs: <BY5PR18MB3156D8230E3622F875F3CD71B3C60@BY5PR18MB3156.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(31686004)(86362001)(80792005)(5660300002)(25786009)(54906003)(36756003)(316002)(478600001)(8936002)(81166006)(81156014)(68736007)(76176011)(8676002)(14454004)(66066001)(31696002)(52116002)(99286004)(66946007)(66446008)(64756008)(66556008)(66476007)(4744005)(102836004)(53936002)(26005)(2906002)(6436002)(386003)(6506007)(53546011)(7736002)(305945005)(186003)(6246003)(71200400001)(71190400001)(6916009)(6486002)(256004)(6512007)(486006)(2616005)(11346002)(476003)(229853002)(4326008)(6116002)(3846002)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3156;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0XbStGKdV+ZN6k5q59G3iwWV3eDOh5um5hpykpqjrnMHlbt7cLcAjQeECUrd0xNPSjzvqkwHLnvaEBRT4UefJ/+W88beWniJdF3yaNRk658tLkpcsnVv1vGpPFkSU8ZSamJ9sdvowqOK3VZbzzefg4Oa/6jtfR+XNWjnA4bVfsPxl+jyZQupmaT2tlf5R/JuqFTRlYoCf1JfhE9y4N45tqdmwZ98wlKc/OcYtY6IaomNSiumicX3shv8lxBYBQq1Rhd5CmgU/RZJ+GbzjTSkkreKvbEhOf6XkUZa0DlmLGeoT5SGpia+fU5aEpFAumes5o+c8Te660akJG1e5RP1M8XclpuQTQBrZNCnKar7/NZzJCMsuquxoxg4n7dsD93QQKzP0xFqvtIFNWs6XylP1zVHkOI76157rVv+0vJBt/E=
Content-ID: <716CDC97E6AB174885F1E96C985FC93A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c1154c18-be21-4028-1427-08d71020e271
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 10:22:52.2282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3156
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/pv: Move async_exception_cleanup() into
 pv/iret.c
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

T24gMjMuMDcuMjAxOSAyMTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gQWxsIGNhbGxlcnMg
YXJlIGluIHB2L2lyZXQuYy4gIE1vdmUgdGhlIGZ1bmN0aW9uIGFuZCBtYWtlIGl0IHN0YXRpYy4N
Cj4gDQo+IEV2ZW4gYmVmb3JlIHRoZSBwaW5uaW5nIGNsZWFudXAsIHRoZXJlIHdhcyBub3RoaW5n
IHdoaWNoIGlzIHNwZWNpZmljIHRvDQo+IG9wZXJhdGluZyBvbiBjdXJyLCBzbyByZW5hbWUgdGhl
IHZhcmlhYmxlIGJhY2sgdG8gdi4NCg0KSSdtIG5vdCBpbiBmdWxsIGFncmVlbWVudCB3aXRoIHRo
aXM6IFRoZSBpbXBsaWNhdGlvbiBoZXJlIHdhcyAoYW5kIGFmYWljdA0Kc3RpbGwgaXMpIHRoYXQg
dXNlcyBvZiAvIHVwZGF0ZXMgdG8gaW52b2x2ZWQgdkNQVSBmaWVsZHMgYXJlIHJhY2UgZnJlZS4N
CkZlZWwgZnJlZSB0byBhZGQgbXkgYWNrIGlmIHlvdSByZXZlcnQgYmFjayB0byBjdXJyLiBPdGhl
cndpc2UgSSdkIGZpcnN0DQpsaWtlIHRvIGhlYXIgeW91ciBjb250cmFyeSBvcGluaW9uLg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
