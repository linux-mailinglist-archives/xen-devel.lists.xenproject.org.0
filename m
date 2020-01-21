Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9818143D95
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 14:03:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itt9X-0003c9-MY; Tue, 21 Jan 2020 13:01:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8osE=3K=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1itt9W-0003c1-6o
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 13:01:06 +0000
X-Inumbo-ID: 151befe6-3c4e-11ea-b833-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::71d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 151befe6-3c4e-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 13:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+8OrBg7m2CnHnvlJ2HSeS2R1o/RS5RE17G1o1xyWYj1uNBVY+uqDIpYJ5ZtpcIEQKaXxftDmk53hoSCbwekqISK+27mroKipqCooHc0NXyHWhMAKFvQgURcLJXKY4G/yT/D82wi5inhdQN5YoH7l96vS8zkdZHMTdl9bJzBlAOrv3DDmCP27eUCI7SwzcSbdWNCqXrcyuo9nKr/iHITwnajpeFPLMRHWJQ42/t0keyju7HumioNhHphFucAEBWg+MidBnVLblIhhtBxmZRhlZjZDDc50F/ykjRaY+KDO3rWqm5UCK/6iQ/GDXI1kM8wU9ch64xIUuy7E7ibWjKp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqXiGQmH5FIE0QvKuhH6WJFVceFbPBaYt43kuxwJUXw=;
 b=dEfTNKXo2Sthsrsp4xTABl+BQVRMGVpyFmS+GlUJYas4u5PJiqTABoWyPw+smW9h613R0ZXKUy9WB2mlDESe2qAHbYSMId1EIxsa1Yoq5QKlcivF2FOT9F1ZIFld2HMsu8VZZlJ40RDcUDvSZhzRaHYKf9GbfV36JD93egRIDDPE5GExmkIalKB5N/v1GMw73VeQ87UJE3JYS3/HRaN7P3JzQPAl4uXyouhXIlBWoIk9CxziqVj9nZO7mrBqkTZKRlUSnXYHj/kWzaMe69s06mRQcCcX/7VUJrXlFQsW1L9hCfOxHI63crx+Ptmb9/7JKIZjQl9VjMIDTi1Bw+BaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqXiGQmH5FIE0QvKuhH6WJFVceFbPBaYt43kuxwJUXw=;
 b=X8c+CmKLxXAIyPGAtVLk4MmYEeFzXxjBvtEPyaK5E+2pnEgLrO/ne4DERKsbTnK/4MRGhTT0vnt7Izju3tO7QozrllVfMv6+ZNwI0lgWb/KU2AR9MHopnM5x+YvK7AQwRCxIPl8MohOTeq5hTmCHRmIVZg9abxaertmYRtoIKUw=
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com (20.178.89.79) by
 AM6PR02MB5591.eurprd02.prod.outlook.com (10.255.120.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Tue, 21 Jan 2020 13:01:03 +0000
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::85d4:50b7:c862:bc77]) by AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::85d4:50b7:c862:bc77%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 13:01:03 +0000
Received: from pepi-Latitude-E5570 (91.199.104.6) by
 AM4PR0701CA0022.eurprd07.prod.outlook.com (2603:10a6:200:42::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.15 via Frontend
 Transport; Tue, 21 Jan 2020 13:01:02 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH V8 3/4] x86/mm: Pull vendor-independent
 altp2m code out of p2m-ept.c and into p2m.c
Thread-Index: AQHVzTrIi+RlciJFGEql2CfOwPSUIqf1GzOA
Date: Tue, 21 Jan 2020 13:01:03 +0000
Message-ID: <ca569b8e650b6f6eb65ada293729c3071025f576.camel@bitdefender.com>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
 <20200117133059.14602-3-aisaila@bitdefender.com>
In-Reply-To: <20200117133059.14602-3-aisaila@bitdefender.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0701CA0022.eurprd07.prod.outlook.com
 (2603:10a6:200:42::32) To AM6PR02MB5287.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93d87426-ddfa-4106-8fd0-08d79e71f827
x-ms-traffictypediagnostic: AM6PR02MB5591:|AM6PR02MB5591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR02MB5591C71EDD79E50DA64C8558D60D0@AM6PR02MB5591.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(376002)(39850400004)(396003)(189003)(199004)(110136005)(54906003)(5660300002)(71200400001)(316002)(6486002)(186003)(2906002)(16526019)(66476007)(66446008)(66556008)(52116002)(8936002)(26005)(6496006)(558084003)(64756008)(4326008)(36756003)(81166006)(66946007)(86362001)(81156014)(478600001)(2616005)(956004)(8676002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5591;
 H:AM6PR02MB5287.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MDvI7ZTccsvJ+eKT6U9GoNlrUlIkS8e000uFo9q7DnJxzGkaLtrpcYgbsr04cgPiSzqSCKQEA2jLTB197kYT4adZI2Nr1zIq8O7W0uEoPwL6xNxW/GCcOrihQoiN86UnCgcKWOORp/iMdCygGzJbKZyAH9vRPKatBjYNR9pLimJZhtv8BDMn6GwA/ji5NwcYRNuQtQjPtYjKeuYjCJOFwbigZzDPPQD315FknXz/2p7HyGaTGDJ2q0e1QQCjhz5wQN+KSSOoPVJROl3n5dysrWmJ6IAoMBMOENj2/w44i2zKZg/PuE3UkLls+CF3D+Vl0vGE4e8i9FaCz7/FAlIZCr+TvFIVpVmV8AjCOoH8dXz+ZzfdR6VzeaR4h/Br80uvDsGB9xE2Ms5Sv2kf9JywI+gJPHvvX4CR21jVIHIm0rslZn2rTFmxrbuEJpvxN9FYy+j8yzkXbdT87T4Y2IQkX5+wjouJknsd7HcXRwF+oDY=
Content-ID: <53588F2BCFF7234095C02C3ED5BD30E9@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d87426-ddfa-4106-8fd0-08d79e71f827
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 13:01:03.0178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WPBl0sOU7uVWxbyZvo18LCfN0GxwueFU8kIK+OmeksxDlJR3OdL91fkTj4fSeqCxLXx6Vbfz37Xz9l+3M4cWachiNhI9SlZSq+8qJ7aWUfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5591
Subject: Re: [Xen-devel] [PATCH V8 3/4] x86/mm: Pull vendor-independent
 altp2m code out of p2m-ept.c and into p2m.c
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTAxLTE3IGF0IDEzOjMxICswMDAwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QSB3cm90ZToNCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiANCj4gUmVxdWVzdGVkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
dSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANClJldmlld2VkLWJ5OiBQZXRyZSBQaXJjYWxh
YnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
