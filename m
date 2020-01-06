Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5D31311AE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 12:58:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioQyg-0005Rj-Hn; Mon, 06 Jan 2020 11:55:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rIFB=23=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ioQye-0005Rc-SO
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 11:55:20 +0000
X-Inumbo-ID: 64261ff0-307b-11ea-a914-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.103]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64261ff0-307b-11ea-a914-bc764e2007e4;
 Mon, 06 Jan 2020 11:55:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+mwle0VcUMGMSIvBvgUcRMU3b4jXYHR9t1UlKGj68vdCmUSTut1famICs3TTLUI+Q5vqioV2mLtCPp3EJxFMwKMBOcuPx7j5k3tKOIq4x5L4bGJRsdOto/KnCDNSd5r9GEx4rZHatOoCg/FOXamjxsj4ICp9c1+J9iYDzTPeyHAN/T57m6KIybjCnM4Ax2n0IlbbK3zij4FIIJAJ9b106e5g86r/xtlLB1uHY8ijY83GA5xsY5WiXe4yC7R2/1ioMJsxbj0I3jidIm2C+dW5Onm0E4eHHlMgfe9O718dtYSjb2z8NLuogMdIDQ34v5TNdCtYbm7/kTvbM5Tpx5k7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/Rcfdpjw8TG/MQvUkn5TYEnQ7kMbuqAxT/UHsAP+Y4=;
 b=MaI5NOi5kaQ64vox4zwwIpYaHJQILgyMihDF0t7SsgyoPC8sVyWff0lGMZ9ayZWE0mHl91XqAoyuxxzg7pl32UTUfF0dyM9XqiEOqk4qrYb9I4ICnnI3XEIflogv53VWibR5lf/lC1sYsJ/b3KPDO/ClP7oCUmihK7jXBtBj5oxjULaQGbWrSFHZ3xiPJNu0l19fCjZrtmgUYuBLnLKXZkV4p2WVosAUWEZybS6MTXW7leJhY/1o2CrJ4Mcf+6wWYWeY/NrGD+qiM6h7Tf43D6SF4cUMaStLxR6KWtOdHUlB9b2s8Dt1S0Q520FdXVcM2u0ajOzME3pqUjM0xteQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/Rcfdpjw8TG/MQvUkn5TYEnQ7kMbuqAxT/UHsAP+Y4=;
 b=d6gNImq9+KRV+6LD1p2qPEgHVDJGPh8g954jntwqhpJAS+AHX69p8Zwl01URVtbKz6TKkZ/PFA79ftPd2uw/kewkgkazr4OrStipcnSjl6V+OdKZEenZohBeL/52uWmaU9JFdl3Va7dHwe9EE16MY6l7I4ihNbjeb9ThEWB9uyA=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3174.eurprd02.prod.outlook.com (10.170.220.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Mon, 6 Jan 2020 11:55:10 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 11:55:10 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 AM0PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:208:55::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15 via Frontend Transport; Mon, 6 Jan 2020 11:55:08 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V6 3/4] x86/mm: Pull out the p2m specifics from
 p2m_init_altp2m_ept
Thread-Index: AQHVuZnpQDt7SsmM9ECzADswn1jViafI7WQAgAAjkgCAAAIEgIAUihmA
Date: Mon, 6 Jan 2020 11:55:09 +0000
Message-ID: <578c32be-a45a-d58e-7f88-03db2ff109a8@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-3-aisaila@bitdefender.com>
 <d9a3c8a4-f089-adf8-2129-41e7422b514c@citrix.com>
 <ef48f9b8-0eb9-160d-9524-c312445257e4@bitdefender.com>
 <8c85333c-e655-4a4a-daa1-ee4b9d3913f7@citrix.com>
In-Reply-To: <8c85333c-e655-4a4a-daa1-ee4b9d3913f7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0032.eurprd05.prod.outlook.com
 (2603:10a6:208:55::45) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 307366ac-e146-483c-4137-08d7929f477e
x-ms-traffictypediagnostic: DB6PR02MB3174:|DB6PR02MB3174:|DB6PR02MB3174:
x-microsoft-antispam-prvs: <DB6PR02MB31741D9739CDB3359F15A25CAB3C0@DB6PR02MB3174.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(136003)(366004)(39860400002)(346002)(189003)(199004)(8936002)(81166006)(71200400001)(2906002)(54906003)(53546011)(316002)(31696002)(110136005)(52116002)(26005)(81156014)(16576012)(5660300002)(4744005)(186003)(8676002)(86362001)(16526019)(66476007)(2616005)(956004)(31686004)(66556008)(4326008)(66946007)(64756008)(6486002)(478600001)(36756003)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3174;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pjh9GhQoasLRDQ6rnSmTXdr3FWy3E2dBjyQxHAklc2xBx2KT/I0y206DJxIcGiAV782KPSvCk7j3IL7tflIx9BFsW+vaGjJgBsAtugGFBaOAvWsECQS+fJKwEe9vIXgeKSx1B0Dk8a7YDTnvyl/JVvfMb3n5J1g/HNFZhAPlfzFHPXD3LjrSgw3gtbGIf//5UOgmC+Hl4cKUhOBpWkn0leHqpvcpZnkLhRZHzuMYH4WlM97ahieJD302N/mDyJfpsaDXO4BETRUKlf0omNK0GF/p8pNMqc9kl7rLtCuOt2J7BrD9EM4ByBUEzhVkzstKK7z+Nsapk/15RIsYi+7bT+t1FkC30RWP04kiDmNsYClS5FlfAeUehosHKoGJROagU80tzJ6J36AJqq7lSQGEG/+WUiheTyn0qfcWeN2+nHhVWm+UEuuCho7lgbBg/hiX
Content-ID: <111DFD482561884889A4F8C9B2444A67@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307366ac-e146-483c-4137-08d7929f477e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 11:55:09.8623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6SW4WXgfsdrZ0Y/Ns3/bUwZFeFyIlU9yocUNN0rdb+JiEIGJY6nFOLWUkRdZIqHNwSRSbLJz2yFWMl+/k3HT9wZhy+DzpvlPpm7OXUDQvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3174
Subject: Re: [Xen-devel] [PATCH V6 3/4] x86/mm: Pull out the p2m specifics
 from p2m_init_altp2m_ept
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTIuMjAxOSAxMjoxNSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gMTIvMjQvMTkg
MTA6MDggQU0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAy
NC4xMi4yMDE5IDEwOjAxLCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4+IE9uIDEyLzIzLzE5IDI6
MDQgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+DQo+Pj4gV2h5Pw0KPj4+
DQo+Pg0KPj4gVGhpcyB3YXMgYSByZXF1ZXN0IGZyb20gSmFuLg0KPiANCj4gWWVzLCBJIHNhdyB0
aGUgUmVxdWVzdGVkLWJ5LiAgSXQgc3RpbGwgbmVlZHMgYW4gZXhwbGFuYXRpb24uDQo+IA0KDQpU
aGlzIGlzIHdoYXQgSmFuIHNhaWQgaW4gVjI6DQoNCiJBbGwgb2YgdGhpcyBpcyBub3QgRVBULXNw
ZWNpZmljLiBCZWZvcmUgYWRkaW5nIG1vcmUgaW5mcmFzdHJ1Y3R1cmUgdG8NCmNvdmVyIGZvciB0
aGlzIChoZXJlOiBhbm90aGVyIGZ1bmN0aW9uIHBhcmFtZXRlciksIGhvdyBhYm91dCBtb3ZpbmcN
CnRoZXNlIHBhcnRzIGludG8gdmVuZG9yLWluZGVwZW5kZW50IGNvZGU/Ig0KDQpJZiB0aGVyZSBp
cyBhIG5lZWQgZm9yIGZ1cnRoZXIgZXhwbGFuYXRpb24gbWF5YmUgSmFuIGNhbiBoZWxwIGhlcmUu
DQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
