Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDC37A3A7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:07:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsO3c-0004gq-Tc; Tue, 30 Jul 2019 09:04:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsO3b-0004gi-2n
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:04:31 +0000
X-Inumbo-ID: 07cad6ba-b2a9-11e9-b62b-a3b88d44b815
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07cad6ba-b2a9-11e9-b62b-a3b88d44b815;
 Tue, 30 Jul 2019 09:04:26 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 09:04:25 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:58:35 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhHBrJSsgaeS/RvtXmEyg4uERNX9TOyAf2AJFCkhIv8PP90PvBNqJ+O2JbkJmyqySMbCt0YVywBpYT665gSctCWgJUK8HcGlB+sH2zdCSiDgrkRd+4079ljJWOV6He2sPPXYIb5y9W2Xv4S5nJyenPZ6gqrOjdz+4Lx9sgIuVCTmWxb3J9RRtZ1J/xuroylIrxe+LnI9oZBII21HaammH8ioOJhOpdbUqFmW+vJlzGoFwJ4FOLslDu8m0nEWzoYlMgyXjBIcbH5CCJ1/fR8oU/9mMCQTkKM5fu3slMeTzHvIG7NiIqbyCxNvd1aZT8TZePTqirBQ21nsdejNvD6LrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6/Qf7WyR+/noLWcF2jFGedo9zbYggVclj9jRPJvjkY=;
 b=CJQ+GVvMzAS9ut1Y9ZiiGX2naSXvf2hYk+tVxlmZvy/2JOQvWXCuHEiUTc603s2q8wXcGEtKoFwuo2in0Fi4I64GpWyzDFCDQMk4V3DZbDzoKkfD4QtohnPYYHPih/UhuNeZZuN4k1J65A3B40KFt6OpVyuwAo9EivVFGwRM2u18BcTinlk1Ouohz6uA8RBrLnGtJvElbn2+rKFxywfeUbOfVvFUKJ3z91SdKv5Zhy0041WNE3fFneJtkRsQt45qCyxuWeX12x4ND47o3Ufx03SLFkqZhuaaCB4TaUI2SsGEJ7B2fC2Qbt7whd4RtVCbVYJnaEPkWRWnf+PG7Wfi5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3428.namprd18.prod.outlook.com (10.255.139.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Tue, 30 Jul 2019 08:58:34 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:58:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 06/10] xen/nodemask: Introduce a NODEMASK_PR() wrapper
 for printing
Thread-Index: AQHVRgbpwCHNZFsIO0SvCXunCREMG6bi3doA
Date: Tue, 30 Jul 2019 08:58:34 +0000
Message-ID: <9f70bf76-e8e7-acff-57c7-e01c39a34dab@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-7-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-7-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:2f::36)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e57a3e04-d858-4e9b-6124-08d714cc1a02
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3428; 
x-ms-traffictypediagnostic: BY5PR18MB3428:
x-microsoft-antispam-prvs: <BY5PR18MB3428025E4405B928AB45E5FFB3DC0@BY5PR18MB3428.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(51444003)(189003)(199004)(66066001)(4326008)(81166006)(81156014)(8676002)(8936002)(6246003)(25786009)(316002)(229853002)(31686004)(6436002)(68736007)(446003)(86362001)(53936002)(2616005)(6486002)(476003)(11346002)(66946007)(2906002)(64756008)(66446008)(66476007)(486006)(66556008)(5660300002)(6512007)(71190400001)(71200400001)(54906003)(14444005)(4744005)(256004)(186003)(26005)(31696002)(36756003)(478600001)(80792005)(102836004)(14454004)(6916009)(3846002)(99286004)(53546011)(76176011)(7736002)(305945005)(6506007)(52116002)(386003)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3428;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FU8AXQAwaCWVw4bS1DTOmhPvsaobfoH16lK7/5wa3reJSAir4IKYcdJW2ZCGju/IIPkIaSmYSqESZubGDxc6J1N2xWp7U8XDZpx/f3drTu/O8EJrsQGnKBvw3wc9DJ6KxBp2QcSLnFkBPbceIvpl0RR/wksLCu28U/O8xID+OAVY4W0XecVtabmJxaivWLh3QHBMx4r8w0qKLrxLnmad7VqJoxourSTr74qIPT4f6PmsrGCilW7BKgzpzyzeMCVaKI5OWPLvnqtheHtNrstywGLY2s/w9SsFab7j17/fOw+L4wVvwAD/0uXFdL2vRll2ENOcqLiZ+d6sXq6DnXtjrraqfCw9y+ylf4ZSfvHRpTwLyRlO6YnE0jZ+CUF6+a7HSv6xmrJcdp2R4D/nKuW25naogoPz8abrFM9OQtp6JSY=
Content-ID: <301607FC4C142F4F898E3B57B9E94849@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e57a3e04-d858-4e9b-6124-08d714cc1a02
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:58:34.0131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3428
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 06/10] xen/nodemask: Introduce a
 NODEMASK_PR() wrapper for printing
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gUmV3b3JrIG5vZGVz
X2FkZHIoKSBpbnRvIG5vZGVtYXNrX2JpdHMoKSBhbmQgY2hhbmdlIHRoZSBpbmRpcmVjdGlvbiB0
byBtYXRjaA0KPiBpdHMgY3B1bWFza19iaXRzKCkgY291bnRlcnBhcnQsIGFuZCB1cGRhdGUgdGhl
IGNhbGxlci4NCj4gDQo+IFVzZSBOT0RFTUFTS19QUigpIHRvIGZpeCB1cCBvbmUgb3BlbmNvZGVk
IGFjY2VzcyBpbnRvIG5vZGVtYXNrLmJpdHMgaW4NCj4gZHVtcF9kb21haW5zKCkuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
DQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KYWxiZWl0IEkg
dGhpbmsgdGhhdCAuLi4NCg0KPiBAQCAtNTgsNiArNTgsMTUgQEANCj4gICAjaW5jbHVkZSA8eGVu
L251bWEuaD4NCj4gICANCj4gICB0eXBlZGVmIHN0cnVjdCB7IERFQ0xBUkVfQklUTUFQKGJpdHMs
IE1BWF9OVU1OT0RFUyk7IH0gbm9kZW1hc2tfdDsNCj4gKw0KPiArLyoNCj4gKyAqIHByaW50ZiBh
cmd1bWVudHMgZm9yIGEgbm9kZW1hc2suICBTaG9ydGhhbmQgZm9yIHVzaW5nICclKnBiW2xdJyB3
aGVuDQo+ICsgKiBwcmludGluZyBhIG5vZGVtYXNrLg0KPiArICovDQo+ICsjZGVmaW5lIE5PREVN
QVNLX1BSKHNyYykgTUFYX05VTU5PREVTLCBub2RlbWFza19iaXRzKHNyYykNCj4gKw0KPiArI2Rl
ZmluZSBub2RlbWFza19iaXRzKHNyYykgKChzcmMpLT5iaXRzKQ0KDQouLi4gaXQgd291bGQgYmUg
bmljZSBpZiBub2RlbWFza19iaXRzKCkgd2FzIGRlZmluZWQgYmVmb3JlIGl0cyBmaXJzdA0KdXNl
LCBubyBtYXR0ZXIgdGhhdCBzdWNoIG9yZGVyaW5nIGlzIGlycmVsZXZhbnQgZm9yIG1hY3Jvcy4N
Cg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
