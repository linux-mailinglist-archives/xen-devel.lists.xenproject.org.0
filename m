Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553177FCF2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:03:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZ2y-0000VO-Bl; Fri, 02 Aug 2019 15:00:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htZ2x-0000VJ-7m
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:00:43 +0000
X-Inumbo-ID: 4b592fe6-b536-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4b592fe6-b536-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:00:41 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 15:00:37 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 14:57:02 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 14:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3GbJ3asDA6J0inhJJ9FJdpp852wV9a8kDwc+gy+N7jScglYLkPqGfDwrHHBt4Jgjnk0LURNnqcyJCmg36AxYsm71uMVQPyacoS6hcdXpLEbgL/2+Dbiplurhyl+A3+SLSW/TuyZhK9bHB+2+pyUfrgp/vuGi3jomo2YNE9uJJjXQfl+x3zaFNN5QtyeGMtPmHTpnhPXqRo9197y/m1jGD9cy+sT4CMgR1WdYASrfuNnfmn7IcJJVLa9Q2HHM9MjEzBgWzJA31I+PBmTBwD7X1cWEWJTGEZsZJpv3X7p1/AiIEQ6KTFT0ac0nxl3rMn1k2lgzvI39HF+BztfiBzwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuE8t0zmbDSjdTr704CVBxO+BuSyVvSGe5IvYIoP/7k=;
 b=TGimJ31Eo+1BZKn8SECitT+ioYk8J91UnxPtixMFkkZPW7MfZvkwZmHxfrRnWtr64e4pkLNI7E6RR0WlxIzt2VJihG7t8aU+8dbKYjpZ/SXlU502LxizjDupQBNHjppIb9/QNeUKLK3GyI7ADkq+Rl4ZB/jjwo2GAd0kX+6uVBplf/HWwQ13ClOvfPbi8B3grUUJQ65WVdvyunSDtTZjdLuM1XMxEE9W4L9c/g3G5k6+uRIrIZKVUnJQyczSyUYTzc1G9ukB/Ynj2CrGK0c1Tnc83p3xYj2PcOivra4bSqOp3sGbjZN+zn9jU+TSACPNZWdsNntCouv0bMvbJSdswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2843.namprd18.prod.outlook.com (20.179.51.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Fri, 2 Aug 2019 14:57:01 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 14:57:01 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 07/16] microcode: clean up microcode_resume_cpu
Thread-Index: AQHVSFKcFx0IeORqOUSu3TqbDZ/odKbn9GsA
Date: Fri, 2 Aug 2019 14:57:01 +0000
Message-ID: <f45b0acb-022a-d56b-1838-3a850f918780@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-8-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-8-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0184.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::28) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 306d807f-7654-4ba1-62b1-08d71759ac7e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2843; 
x-ms-traffictypediagnostic: DM6PR18MB2843:
x-microsoft-antispam-prvs: <DM6PR18MB284390F1AC746305BC01A6F3B3D90@DM6PR18MB2843.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(199004)(189003)(2906002)(25786009)(6246003)(31696002)(86362001)(186003)(31686004)(6116002)(68736007)(6486002)(52116002)(229853002)(76176011)(53936002)(6506007)(99286004)(53546011)(102836004)(386003)(36756003)(66066001)(4326008)(6512007)(6436002)(4744005)(3846002)(26005)(6916009)(71190400001)(486006)(66946007)(66476007)(64756008)(5660300002)(66556008)(66446008)(71200400001)(478600001)(7736002)(14444005)(14454004)(256004)(476003)(446003)(11346002)(8936002)(54906003)(81166006)(8676002)(316002)(80792005)(305945005)(2616005)(81156014)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2843;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hrk5wGce64eLqGSzM85rQYqOZFR9SZeHWOqeCXnI4vxXtaxWuC4mI+YKwkJE+L3cI4Ai4ZLcMf8u97X6mXkYYjXIMCb9fGCxXQl47V5FxAA7MHj1tkH3wiG5u/a8KHghV7D6tEOnLpUqBBr1+vmkMpLaEDfKHKwCmuIHvdZRkmRzS258RaIeVC4lwb/gUyPKcXc6EAexRRQXi1Z+5lpvalin4GJR2Wl3DYqO9Dl4+qWER6XTAunphSM06W/M2KpKy8Gbh5e+oGYX06PGh4JHKOkV0hgEDSR5IXCWvL3llctLV7RJZ8LJBOq/0oqRbAVKVUJInot2hAyGCgvoO/0NdA93KtFW4QXNRTsDRNB9C7vs44wOhgvLkWzbt734IsSqr4crMdmxtM9TosKGntYz5N+XgDsqF7OE0FSY+Dt+bgs=
Content-ID: <3F1DC3D65C010044AFE8C36D1A15356A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 306d807f-7654-4ba1-62b1-08d71759ac7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 14:57:01.2295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2843
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 07/16] microcode: clean up
 microcode_resume_cpu
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IFByZXZpb3VzbHksIGEgcGVy
LWNwdSB1Y29kZSBjYWNoZSBpcyBtYWludGFpbmVkLiBUaGVuIGVhY2ggQ1BVIGhhZCBvbmUNCj4g
cGVyLWNwdSB1cGRhdGUgY2FjaGUgYW5kIHRoZXJlIG1pZ2h0IGJlIG11bHRpcGxlIHZlcnNpb25z
IG9mIG1pY3JvY29kZS4NCj4gVGh1cyBtaWNyb2NvZGVfcmVzdW1lX2NwdSB0cmllZCBiZXN0IHRv
IHVwZGF0ZSBtaWNyb2NvZGUgYnkgbG9hZGluZw0KPiBldmVyeSB1cGRhdGUgY2FjaGUgdW50aWwg
YSBzdWNjZXNzZnVsIGxvYWQuDQo+IA0KPiBCdXQgbm93IHRoZSBjYWNoZSBzdHJ1Y3QgaXMgc2lt
cGxpZmllZCBhIGxvdCBhbmQgb25seSBhIHNpbmdsZSB1Y29kZSBpcw0KPiBjYWNoZWQuIGEgc2lu
Z2xlIGludm9jYXRpb24gb2YgLT5hcHBseV9taWNyb2NvZGUoKSB3b3VsZCBsb2FkIHRoZSBjYWNo
ZQ0KPiBhbmQgbWFrZSBtaWNyb2NvZGUgdXBkYXRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENo
YW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
