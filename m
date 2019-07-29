Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E679088
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:14:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs8Ga-0007mm-69; Mon, 29 Jul 2019 16:12:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs8GY-0007mf-IY
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:12:50 +0000
X-Inumbo-ID: b59fcd08-b21b-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b59fcd08-b21b-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 16:12:49 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 16:12:46 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:51:49 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:51:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMF/eOj8jwwjEddVZY4N2QeJPnfVaUqOA0IzFxo8sJf1QEE8XKRNFA3lD7Db72oOTr2SGYSvW38Fx/6Jr7ULTCIBnAUSWuIV+/RygzjK4u7eYTK3imBGtrKmd8F44rsq3z7GuJraoVOTdycs09020Lurm59LjEBW8z5WYMOpsMITjTJKAil2kKH8l2WdR/8KubextXTrxHX1U2Huffpf32JPL5AZNW0uO+EjpPVOeqS9mp0BSgC6d6HZjunEeXDzpcyQhz+xGbnd17Z8kIAns4FVRIuRQIki3r2scTQOTNVszcXSTtCfntrTG1KqN1KSrsQM3ALWDkAWE9oGexQ9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcFKypvLJuUd7xX85loscjXc3UmKEvAAai+n/wj5haE=;
 b=CaOavcBR7NhrL149mhq1G6wh6O9Ts8jluV2riVMPWBdGD84kCatWxzCF5Jystts7xky+HCkYKu7syB11BgN51pallzJagQUxhT0fF/D8uEvfOayxm4+cST1etKTVGFaKBxi+HbBo3NqaiceHbTHJSSZzUooYBFZOR2y0pifA0UPG5uelC/GOonLCjbo2DRfn9Xq553SxKKcEXNfr2Cj5lzPtyFDgwka+CkxjUTuvzDOJu+eqAMYfKgXX/sDpzBGqfm2i3xOEekvXDtuWaup3oxoTU2/XxAtIOvO5Z8m4AK65C6KAjeRF2bi+XfuwvXzvmj6WdjNLW6b7h+XyBlqXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3412.namprd18.prod.outlook.com (10.255.136.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 15:51:48 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:51:48 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v3 03/10] xen/nodemask: Drop
 any_online_node() and first_unset_node()
Thread-Index: AQHVRgcPgWKDGfw42EGG9cNdP5TlVqbhvviA
Date: Mon, 29 Jul 2019 15:51:48 +0000
Message-ID: <17360368-288b-fd09-7adc-a0b4c6c3978a@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-4-andrew.cooper3@citrix.com>
In-Reply-To: <20190729121204.13559-4-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:44::19) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d53f6aa-25b8-4511-6009-08d7143caa3e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3412; 
x-ms-traffictypediagnostic: BY5PR18MB3412:
x-microsoft-antispam-prvs: <BY5PR18MB3412A83D70F11B23EAB7EABCB3DD0@BY5PR18MB3412.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(199004)(189003)(54906003)(4326008)(66446008)(64756008)(66556008)(66476007)(66946007)(36756003)(6436002)(6246003)(6486002)(6512007)(53936002)(229853002)(80792005)(316002)(25786009)(305945005)(5660300002)(31686004)(256004)(71190400001)(71200400001)(2906002)(31696002)(478600001)(26005)(386003)(6506007)(53546011)(76176011)(8936002)(66066001)(81156014)(81166006)(102836004)(8676002)(14454004)(86362001)(7736002)(11346002)(6116002)(2616005)(99286004)(52116002)(446003)(3846002)(476003)(486006)(6916009)(68736007)(4744005)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3412;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xz1RvAhrjDaJgnN+5HZed0AAq0UMmosEM+GQKqqJFQ5P2J4Bcn5FNmu4ZqgMur9M6w8mN6CEIyIxxSIZFJiun++qO6LMN6V1eGTRx9kwa9jpQcIjnmjJMX99IBNe0aHq2XHOGa4RMitdjQchrhKSttICa+LZRAQXHbg/f+k5XXl+yyN5yLzcFxHcatXXtvmoQL9FNrIqUNu4XpSC51ZhxEVa8LBf6mtiIMwuGQFFhtjBnSBv8md7jIHx57mBw3FeydmH2Hmg8W/MsepqacHKjeGPe1gYna3Rv7SWUwUEXh9ZcSw1x0jLGe4XN8I6BMtf9M16opvXl0EBxXwNbQw9vRVkRryvvt7n2MWGScfXekXJ5HoZF6TWgSQTfT6q/36Wn8SwdPfRAQwblhEi9MwADKH9wCy5r9l0uNoWdc2rn14=
Content-ID: <5CF3A76E2EF8DA428EE33E9AEA1397E9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d53f6aa-25b8-4511-6009-08d7143caa3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:51:48.4361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3412
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 03/10] xen/nodemask: Drop
 any_online_node() and first_unset_node()
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
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhlc2UgaGF2ZSBu
ZXZlciBiZWVuIHVzZWQgaW4gWGVuLCBhbmQgaXQgaXMgdW5saWtlbHkgdGhhdCB0aGV5IHdvdWxk
IGJlDQo+IHVzZWZ1bCBpbiB0aGUgZnV0dXJlLg0KPiANCj4gYW55X29ubGluZV9jcHUoKSB3YXMg
ZHJvcHBlZCBieSBjL3MgMjJiZGNlMWMwNDggImVsaW1pbmF0ZSBmaXJzdF9jcHUoKSBldGMiDQo+
IGJ1dCB0aGUgQVBJIGNvbW1lbnQgd2FzIGxlZnQgaW4gcGxhY2UuICBEcm9wIHRoYXQgdG9vLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4NCg0KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
