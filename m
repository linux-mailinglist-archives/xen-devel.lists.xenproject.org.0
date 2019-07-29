Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA3B78EB3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:06:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7Az-0005Ut-KP; Mon, 29 Jul 2019 15:03:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs7Ay-0005Ul-7B
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:03:00 +0000
X-Inumbo-ID: f1d0bb64-b211-11e9-85fd-b38179a9e178
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1d0bb64-b211-11e9-85fd-b38179a9e178;
 Mon, 29 Jul 2019 15:02:57 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 15:02:55 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 14:45:07 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 14:45:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCLc9TiunWBImqtec4WcJTOc0iSNKK+uHUCA06QMjE2jRSuSeOO8eAUyecjYaipDE5XKQxhVWCN1WpBTD8WxH+2hVlbk1h0+bG48srDkRyzTAdyi2Y56+WXciQEJQXNZCTXgm0P+CenRq9rEjhFeZAa844EGzi76lOTQ9WuCLchxvoafEZHx74B02zWeIOi/HNI4nKdwXMGcfuXZ9MSgjbVCbQSc8tSQVw8AwmMAGcHLx8rlYIIsO9WD32LiKg8OvshQh5sFySvAptTgLfTYShWcaYP1LO+ECjrGU8vqsFITeWUVkhn/T/6XxKL1yDGnFzWVN965afxIFa0H86RyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhuS0pKno1/JuM4nQOPPd8+YA/zi4/sW+2Z/yJhjzcI=;
 b=NJOGY9exN2DmnKzjhTqw9KLwqrHkXNxlNJkZy9tLLqEV0XMlCuyXy6yFqL/Sk+AWGjx5MI1z63IAON/o1DvaMTTqdOdxACJNLgZ+qVAW65av5xFDAW+m4KDXvpbL4CJrIE062RuQpyC5dw0uNNAQsRMb5ikPuhRgiF9o2qR4AkPslB506tKwNt81NEtLrsIO933/rBtQOrcgdI5VlrTP9TjNB4pfNMva3CIfLgxUbFqCew5ULt/y5InP9nzdFdvhFLyduxvD3U0eCNm7DPcAHWKKprWDaQIFrJT/WRmqnyBmvTgMmoK6LKk3d0h0/1EbtPeH/5KBGp5Nxgc+zr+JgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3393.namprd18.prod.outlook.com (10.255.136.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 14:45:05 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 14:45:05 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Lukasz Hawrylko <lukasz.hawrylko@intel.com>
Thread-Topic: [PATCH] Adding Intel TXT maintainter
Thread-Index: AQHVRht2CgttkeCEaEaB9qhqmBNIMabhrCsA
Date: Mon, 29 Jul 2019 14:45:05 +0000
Message-ID: <05253a48-a077-ff8d-120b-7bf1356b94cc@suse.com>
References: <20190729143910.2389-1-lukasz.hawrylko@intel.com>
In-Reply-To: <20190729143910.2389-1-lukasz.hawrylko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:4:29::12) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96133e97-7a96-46fb-a625-08d71433587b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3393; 
x-ms-traffictypediagnostic: BY5PR18MB3393:
x-microsoft-antispam-prvs: <BY5PR18MB3393A1FE265C0D4F9286004AB3DD0@BY5PR18MB3393.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(189003)(199004)(486006)(66476007)(476003)(4744005)(5660300002)(31686004)(66066001)(81156014)(81166006)(66446008)(64756008)(66556008)(8676002)(8936002)(31696002)(86362001)(68736007)(66946007)(99286004)(71200400001)(71190400001)(26005)(6916009)(478600001)(256004)(14454004)(7416002)(316002)(6116002)(7736002)(3846002)(305945005)(76176011)(53546011)(102836004)(186003)(36756003)(2906002)(4326008)(54906003)(6436002)(229853002)(25786009)(6512007)(6246003)(53936002)(2616005)(11346002)(446003)(6506007)(80792005)(6486002)(386003)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3393;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V0Xys5o1nirXEpEdMbiSuxcV9rBvpiplUXkolPsyve1oT1GS5hOqpDz4QleSKz1CGBDqbH40AcbEaycncUaKpuT+nmN+b0sp9ZRZ2CtOaYlFcTkwlmkPsqu8sUQ1kKkx1BDPlkhwUos1wXWrxHdgnaSnsEQHwtkK9uds8Ho6p4/kEMZRcA3s0hd2HiviXbHteLNJEfoUaBrdmT69o7xryR1MwpyM/getrqIZ23krZTXnoEoJjCf85aAwoawAH2kCf+orisPItGbVs7G6zE8WfADJVc7JJk0OJ2ZTG7pazWP2DVgAPl5bLlIj/+q/uGphBEzF9rn7Tl8PdFkks116wmEBIPeEVRtt4VQCGK5jLLF2399i862elOORrtf0Nmr0Qv9zD5kCP8SOREDUibZFqrAmj+GUolkhCXkw7RFFx8U=
Content-ID: <CF048A929C57894E8DCE5E32BC2E5AE1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 96133e97-7a96-46fb-a625-08d71433587b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 14:45:05.8009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3393
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] Adding Intel TXT maintainter
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNjozOSwgTHVrYXN6IEhhd3J5bGtvIHdyb3RlOg0KPiBTdXBwb3J0IGZv
ciBJbnRlbCBUWFQgaGFzIG9ycGhhbmVkIHN0YXR1cyByaWdodCBub3cgYmVjYXVzZQ0KPiBubyBh
Y3RpdmUgbWFpbnRhaW50ZXIgaXMgbGlzdGVkLiBBZGRpbmcgbXlzZWxmIGFzIGFjdGl2ZSBtYWlu
dGFpbnRlciwNCj4gc28gaXQgY291bGQgYmUgcmV2ZXJ0ZWQgdG8gc3VwcG9ydGVkIHN0YXRlLg0K
DQpXaGljaCB5b3Ugc2hvdWxkIHRoZW4gZG8gLi4uDQoNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4g
KysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTI0MCw2ICsyNDAsNyBAQCBTOglNYWludGFpbmVkDQo+
ICAgRjoJdG9vbHMvZ29sYW5nDQo+ICAgDQo+ICAgSU5URUwoUikgVFJVU1RFRCBFWEVDVVRJT04g
VEVDSE5PTE9HWSAoVFhUKQ0KPiArTToJTHVrYXN6IEhhd3J5bGtvIDxsdWthc3ouaGF3cnlsa29A
aW50ZWwuY29tPg0KPiAgIFM6CU9ycGhhbmVkDQoNCi4uLiByaWdodCBoZXJlLiBUaGUgcXVlc3Rp
b24gaXMgd2hhdCBuZXcgc3RhdGUgeW91IHdhbnQgdG8gcHV0DQppdCBpbnRvLiBCdXQgaXQgd2Fz
IHN1Z2dlc3RlZCBhbnl3YXkgdGhhdCB5b3UgYWRkIHlvdXJzZWxmIGFzDQpyZXZpZXdlciBmaXJz
dCwgYXQgd2hpY2ggcG9pbnQgdGhlIG5ldyBzdGF0ZSB3b3VsZCBwcm9iYWJseSBiZQ0KIk9kZCBG
aXhlcyIuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
