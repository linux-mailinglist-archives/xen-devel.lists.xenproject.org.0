Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52190302CC
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 21:30:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWQiX-0003Wg-6t; Thu, 30 May 2019 19:28:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NY6U=T6=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hWQiV-0003WW-DA
 for xen-devel@lists.xen.org; Thu, 30 May 2019 19:27:59 +0000
X-Inumbo-ID: 07af3ba0-8311-11e9-8980-bc764e045a96
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (unknown
 [40.107.80.78]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07af3ba0-8311-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 19:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=039cDCelVSkhrIdATXwi4/Z4VpUstakZJKBeNwfH+eA=;
 b=0vycy70TyLJH/XobbCDV+C/wZqjWfPg0OOunIa4oYCOA/avKtFFevc52JIbHgLFyNgk9+aPagdqtBV0niMRYi3eXmMwuMZLHQ/f1V9XBgDJdY08RAxJVAV9/xwf5S97Cu2AjgxlGmsG2MGyP/sZsYrbsb9MtKSCuwlxfHJu/ONA=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3369.namprd12.prod.outlook.com (20.178.198.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Thu, 30 May 2019 19:27:56 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1922.021; Thu, 30 May 2019
 19:27:56 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Thread-Topic: [Xen-devel] [PATCH v2 0/3] mwait support for AMD processors
Thread-Index: AQHU5XeM504EUMjU30KXwgaAbNMDuaZjRlqAgCEqRQA=
Date: Thu, 30 May 2019 19:27:56 +0000
Message-ID: <20190530192753.GA16199@amd.com>
References: <20190328150426.7295-1-brian.woods@amd.com>
 <20190509220003.GA17484@amd.com>
In-Reply-To: <20190509220003.GA17484@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:805:de::22) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2eae795-dba5-4f72-faf7-08d6e534eb1a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3369; 
x-ms-traffictypediagnostic: DM6PR12MB3369:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3369C3D3C6B95AA9012EAFDDE5180@DM6PR12MB3369.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(366004)(136003)(39860400002)(189003)(199004)(6116002)(68736007)(3846002)(229853002)(7736002)(305945005)(2906002)(5660300002)(25786009)(54906003)(76176011)(5640700003)(6506007)(386003)(4326008)(2351001)(52116002)(2616005)(33656002)(6916009)(102836004)(6512007)(6306002)(66066001)(6486002)(99286004)(316002)(6436002)(1076003)(186003)(476003)(966005)(8676002)(8936002)(256004)(73956011)(53936002)(26005)(66476007)(66556008)(86362001)(66946007)(71200400001)(66446008)(64756008)(36756003)(446003)(71190400001)(11346002)(81166006)(81156014)(6246003)(2501003)(486006)(14454004)(478600001)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3369;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MNpymbq2khRmGJz1is7Lb8LDbx4HweCwX2QIsH8fCIAjgCgEJyD0Klmr/1Najtnot7p18XQZo3j1zZ8eKLG0TtvdLEORosKakmBQXJMO/MmCf7/us0vZ5SGvEvNiDuK19rq2Js2SM2i4jyHLqNLo6B5c/Kp4ZG/uboDLDOKfrnRpJ3IczqXFWQM4NdB3vWYQjhtEC7Rsu8iLoeL7OGkz8OZugOEQU2r7sEf8VOI+fzX6kHGEe2gFjcqqbDu/LekbjeNU0CeTNaKicGQvHUBoTS/bfqfYixzH3RfSauLjsMfhlnLfv68QVVD/NjADUtgPrFTlLhYVv26frKSl8T2xbsui+K0uzzV4PNtK6hnnhU/aBc2iQu0hRi+z3P3pppzKf7qGUPqG7h/U1R0toOPIgbRsFk73UP7QXo2NoZMv7NU=
Content-ID: <5A9F120C7D021C4EB3C7E6BB8C4C60CF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2eae795-dba5-4f72-faf7-08d6e534eb1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 19:27:56.8016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3369
Subject: Re: [Xen-devel] [PATCH v2 0/3] mwait support for AMD processors
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 "Woods, Brian" <Brian.Woods@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDU6MDA6MDdQTSAtMDUwMCwgQnJpYW4gV29vZHMgd3Jv
dGU6Cj4gT24gVGh1LCBNYXIgMjgsIDIwMTkgYXQgMDM6MDQ6MzJQTSArMDAwMCwgQnJpYW4gV29v
ZHMgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGQgc3VwcG9ydCBhbmQgZW5hYmxlbWVu
dCBmb3IgbXdhaXQgb24gQU1EIE5hcGxlcwo+ID4gYW5kIFJvbWUgcHJvY2Vzc29ycy4gIE5ld2Vy
IEFNRCBwcm9jZXNzb3JzIHN1cHBvcnQgbXdhaXQsIGJ1dCBvbmx5IGZvcgo+ID4gYzEsIGFuZCBm
b3IgYzIgaGFsdCBpcyB1c2VkLiAgVGhlIG13YWl0LWlkbGUgZHJpdmVyIGlzIG1vZGlmaWVkIHRv
IGJlCj4gPiBhYmxlIHRvIHVzZSBib3RoIG13YWl0IGFuZCBoYWx0IGZvciBpZGxpbmcuCj4gPiAK
PiA+IEJyaWFuIFdvb2RzICgzKToKPiA+ICAgbXdhaXQtaWRsZTogYWRkIHN1cHBvcnQgZm9yIHVz
aW5nIGhhbHQKPiA+ICAgbXdhaXQtaWRsZTogYWRkIHN1cHBvcnQgZm9yIEFNRCBwcm9jZXNzb3Jz
Cj4gPiAgIG13YWl0LWlkbGU6IGFkZCBlbmFibGVtZW50IGZvciBBTUQgTmFwbGVzIGFuZCBSb21l
Cj4gPiAKPiA+ICB4ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jICB8ICAyICstCj4gPiAgeGVu
L2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tCj4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVpZGxlLmggfCAg
MSArCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+ID4gCj4gPiAtLSAKPiA+IDIuMTEuMAo+ID4gCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKPiAKPiBQaW5nIGZvciBBbmR5
Lgo+IAo+IC0tIAo+IEJyaWFuIFdvb2RzCgpQaW5nIGluIGdlbmVyYWwuLi4KCi0tIApCcmlhbiBX
b29kcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
