Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF710CAA3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:49:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaL3q-0008S0-P8; Thu, 28 Nov 2019 14:46:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o1Zf=ZU=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iaL3p-0008Rv-Ec
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:46:25 +0000
X-Inumbo-ID: d9428e2e-11ed-11ea-a3d3-12813bfff9fa
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.112]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9428e2e-11ed-11ea-a3d3-12813bfff9fa;
 Thu, 28 Nov 2019 14:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVQWJQbZlkScaKh3U7YBYNnkarbzLpMhKiOy4grBpIqPz/MlqKXu91RNBbFx1ldaP6syi0YroBrYCY1ekpPt0KHM77cqHQxEwlX0UzFx03fQZFcrzu6SxdOp2cpVPwkXpq/DJY7cjKk3f0tGhoOv1hT8B2RgehoQoDvSZyqUaE3PcneXpu1nz/qMgGnoHzJYVM7hEJl5oFFRF4HBOswrg/Olr3RiOfrqr+7GytjhXjB0wBZccMzKT8I5BY/3m+xX5O9stNt61Kc64pU8Z9pw7WyBVhClbuEiLpYGsaaeBYlZ5P93+PvuTODmMfcROhJfLThiAhBDysxI1bqKAzQCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc6/HlTC/ulzvBda8/ZYJDeOH5h4q3j1zLNviOxHHRY=;
 b=DBv3cqUXtT8tDDixrm/glER1TlSp1g1/rt0L7wVvghG2NCAwZ1WouoCaVSTwTL0nBP9NwmlOeSvx1nOr8Dnb6Z9o2fTrSDz/Ds17N3V7Y5Vi42HPbRmVRR+PmHynl5jxDgLyidiEffKBfwmxS3E+m7eUql6xZfBqPwazdaGQvUGIuXLNZdGsTWW7jn9dJMNrvxo6RxrH7dQVuCuDxuPfa4TGiUqYlaHqg01QYLWUIJy3YsF/M/m8pZJZyxwc8WNFpPA5r570Suf3nTbkjpqEy4Sj6lrit85uYz8ez1/XRCAByTx3foBW14H5H0EA6j7GoMeHpFk/xDS/on5+ivRONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc6/HlTC/ulzvBda8/ZYJDeOH5h4q3j1zLNviOxHHRY=;
 b=dbolEWLxGdOS6j3L771FzhvPb3ROSiKMOMjNMRAQAvPBebEylYj4khvAyFB/NCpdxegwi21Cb3zmNTAHWH7XSYU2tugxWqAauNU6yhi5fisLttu19PylQnE9GBJ8T82fpr73VTxO986qtPAAu/lz8/6VjI3ls7ZvD5wAJJ7PVAs=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5411.eurprd02.prod.outlook.com (10.255.30.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 28 Nov 2019 14:46:23 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 14:46:22 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH for-next] x86/svm: Correct vm_event API for descriptor
 accesses
Thread-Index: AQHVpeE7MQoSVCksIUqIPDZofDbFxaegqXCA
Date: Thu, 28 Nov 2019 14:46:22 +0000
Message-ID: <3d91678a-cee9-c71b-10c9-e62668021dfd@bitdefender.com>
References: <20191128114414.21716-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191128114414.21716-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0141.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::46) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70bb950a-f5ca-4405-89e1-08d77411bcad
x-ms-traffictypediagnostic: AM0PR02MB5411:|AM0PR02MB5411:|AM0PR02MB5411:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB541110C49D80550DFDD80D3AAB470@AM0PR02MB5411.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(346002)(366004)(136003)(39860400002)(199004)(189003)(14444005)(256004)(102836004)(81166006)(6486002)(386003)(6506007)(81156014)(31686004)(53546011)(71200400001)(71190400001)(52116002)(14454004)(229853002)(305945005)(8936002)(478600001)(446003)(6436002)(99286004)(11346002)(6116002)(3846002)(25786009)(76176011)(66946007)(66446008)(66556008)(66476007)(64756008)(186003)(2906002)(5660300002)(31696002)(2616005)(7736002)(4326008)(6246003)(86362001)(36756003)(54906003)(316002)(6512007)(8676002)(4744005)(66066001)(107886003)(26005)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5411;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AU+cmZ/eWdSR7GGCflDLlM1E2F68LruOXZFewAaV/+yGDjuUN3KTNjq5dOmKdwFcjThL0BBJhLUdwdKHgDoWvOYFhodkCnpONJa/rsZWohudqk4vcKFH0e+0nisce3Z3K+x3ksBBzBGK8iSs562Gml80CUsIzjkrQ0ENMcuUhZodnP4pTL+ZjxbTiBq6wN0AdPfzGwk5xHq+4YzuQamY9Ai4K9RQzPlmg3f48ZF0MFScy+jx57B3DK5JS1mT9apVxUo0uumbBALlfbUryftLO0wiD7gCCfFt8CAi+cuut4pLEGxAnJK9jwE84WlXECPuKRKLyt8Q9RPao1LANtSTVaRnFOAwvwGB2RPKM2hTcaVe5nf1BHqPUAAbAQ1ac3PyOW1CmzByCmCAt9v3x5aYUWYlOkK6aUC+jAw+QRZIC95udVcfkeHGAIsBFdCaGJLl
Content-ID: <97AAB9CBA069DD4FBD7EFC5D9A3C88AF@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bb950a-f5ca-4405-89e1-08d77411bcad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 14:46:22.8128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YnHwLM2XqhrS1vk2rAp7PGerliU0LnLSR5bTG/+cyIOk+laRpINKOOnR43luHViPI6OhvMjijw4VIR2G8ISQl5AguwOYyIPKqZGCVa8+apo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5411
Subject: Re: [Xen-devel] [PATCH for-next] x86/svm: Correct vm_event API for
 descriptor accesses
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Adrian Pop <apop@bitdefender.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI4LjExLjIwMTkgMTM6NDQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IGMvcyBkMGE2
OTlhMzg5ZjEgIng4Ni9tb25pdG9yOiBhZGQgc3VwcG9ydCBmb3IgZGVzY3JpcHRvciBhY2Nlc3Mg
ZXZlbnRzIg0KPiBpbnRyb2R1Y2VkIGxvZ2ljIGxvb2tpbmcgZm9yIHdoYXQgYXBwZWFyZWQgdG8g
YmUgZXhpdGluZm8gKG5vdCB0aGF0IHRoaXMNCj4gZXhpc3RzIGluIFNWTSAtIGV4aXRpbmZvMSBv
ciAyIGRvKSwgYnV0IGFjdHVhbGx5IHBhc3NlZCB0aGUgZXhpdCBJRFQgdmVjdG9yaW5nDQo+IGlu
Zm9ybWF0aW9uLiAgVGhlcmUgaXMgbmV2ZXIgYW55IElEVCB2ZWN0b3JpbmcgaW52b2x2ZWQgaW4g
dGhlc2UgaW50ZXJjZXB0cyBzbw0KPiB0aGUgdmFsdWUgcGFzc2VkIGlzIGFsd2F5cyB6ZXJvLg0K
PiANCj4gSW4gZmFjdCwgU1ZNIGRvZXNuJ3QgcHJvdmlkZSBhbnkgaW5mb3JtYXRpb24sIGV2ZW4g
aW4gZXhpdGluZm8xIGFuZCAyLiAgTm90ZQ0KPiB0aGUgZXJyb3IgaW4gdGhlIHB1YmxpYyBBUEkg
YW5kIHN0YXRlIHRoYXQgdGhpcyBmaWVsZCBpcyBhbHdheXMgMCwgYW5kIGRyb3ANCj4gdGhlIFNW
TSBsb2dpYyBpbiBodm1fbW9uaXRvcl9kZXNjcmlwdG9yX2FjY2VzcygpLg0KPiANCj4gSW4gdGhl
IFNWTSB2bWV4aXQgaGFuZGxlciBpdHNlbGYsIG9wdGltaXNlIHRoZSBzd2l0Y2ggc3RhdGVtZW50
IGJ5IG9ic2VydmluZw0KPiB0aGF0IHRoZXJlIGlzIGEgbGluZWFyIHRyYW5zZm9ybWF0aW9uIGJl
dHdlZW4gdGhlIFNWTSBleGl0X3JlYXNvbiBhbmQNCj4gVk1fRVZFTlRfREVTQ18qIHZhbHVlcy4g
IChCbG9hdC1vLW1ldGVyIHJlcG9ydHMgNjAyOCA9PiA1ODc3IGZvciBhIHNhdmluZyBvZg0KPiAx
NTEgYnl0ZXMpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPg0KDQpJIGFncmVlIHdpdGggVGFtYXMsIGdvb2QgdGhpbmcgdG8g
aGF2ZSB0aGF0IGZpZWxkIHJlbW92ZWQuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
