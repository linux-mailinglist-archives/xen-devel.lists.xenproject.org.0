Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D178FF6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:58:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs807-0002S2-R7; Mon, 29 Jul 2019 15:55:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs806-0002Ro-25
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:55:50 +0000
X-Inumbo-ID: 5490a045-b219-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5490a045-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:55:48 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 15:55:46 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:35:38 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvPcBz6VGH3jv6n9+ldiotyRFegCl6yff5LN+B9EIkugtii8LNOswR6YjdqveMSWzVjAVmbcDDSkC/A0VK8KefD05waKsLHB1FXqA4InBANAwvOLSX3JxMoBpjnby4x53sIsIcg6vtO6YNucFGtNkiWdAzgC+9lQhuGTZxUYtmdEerZyrfTxwW1OSsacpg39hmPWA7xC5oEGQdOp0nvUDOY9MwmxVjH2iTdi9Jh8/Yjx6ANwpzUeQXiaLhIHEwclY2NI+YQ+ozx8OTN2Xs/3JG6VA2YZUc3L4exLPD8Q8G8uWQkg3qjXUC/LK6fPtsriGovN0TMucSi9cX6CTCs9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M+rgRFCGKg8h1Zmb2VnvD6B7ep5g1ycz2uC/A4wQtA=;
 b=mHe9isnImhapekUv98HGIz/WEfkldIWrNlnkhc0q7AM8LBbncQeSUFibkftbD/iSI0OXFBUwWzvMJKK/iZjG3TNqq7+WqJFicpENsV9ZiApFsNFC/IDH4iuBeBCT3pLlN+cMaSrJBreuTv94RoJo4zfWsOiwID8Oidv8FaV0XyhNvhKrKTZsa8MNM8ayDv9HoJX6xlNh/gIjG0lchPQi9P4nQqPB+iJ3gR6uS1GSpGhxXWUKlnwdboWkbsYEgqAHGS66TkhrMC55p3R0GhmWsZlUF9p75LxpF9lM8f5CtOJQyO+8B1xYQo3AmAOmfo+688/SN2vnqft6tb0IB6/jvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3137.namprd18.prod.outlook.com (10.255.136.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 15:35:36 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:35:36 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 2/3] build: allow picking the env values for compiler
 variables
Thread-Index: AQHVQ7bRDE0fGAhFDE++tH3QzKoz3abhvxKA
Date: Mon, 29 Jul 2019 15:35:36 +0000
Message-ID: <f46656a6-22f7-bece-30c2-9be66ab36ef4@suse.com>
References: <20190726133331.91482-1-roger.pau@citrix.com>
 <20190726133331.91482-3-roger.pau@citrix.com>
In-Reply-To: <20190726133331.91482-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0402CA0013.eurprd04.prod.outlook.com
 (2603:10a6:4:91::23) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d4ac692-0d74-4708-72e1-08d7143a66c6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3137; 
x-ms-traffictypediagnostic: BY5PR18MB3137:
x-microsoft-antispam-prvs: <BY5PR18MB31377C03E21DFF7893026279B3DD0@BY5PR18MB3137.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(199004)(189003)(7416002)(80792005)(186003)(52116002)(6486002)(6436002)(476003)(2616005)(7736002)(11346002)(5660300002)(2906002)(66066001)(31696002)(4326008)(446003)(68736007)(81156014)(81166006)(14454004)(53936002)(229853002)(6916009)(36756003)(99286004)(26005)(486006)(305945005)(8676002)(54906003)(6246003)(25786009)(102836004)(8936002)(478600001)(76176011)(4744005)(71200400001)(31686004)(71190400001)(66446008)(64756008)(66946007)(53546011)(256004)(6512007)(316002)(86362001)(66476007)(6506007)(6116002)(66556008)(386003)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3137;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +fTD+IWdERGsXHko/e1Zf46YDHQPKDK4XcPm7xonz1KpQT85uSBc0LVbmuMOta0nxLLGMIjIR2CYg7QFbgbkO1zu/UCKylnReYHgt6Prhoo4u01QxL/PKkJ+zmPRlX6JMt2yLhGcyqWS12YoaNyqJlmKHkK/ypzDc92GHNzSjYkBQORO8XRO+/fh8DVVUr+FfWZcFIqIt5A0cH5+e2buMDn9yjWsMJkhInj7d3JoV8M/0moEi8tzPDhmasyAgdKD8GCiF7kcR1CfJZIuYjY5T4U62x10N+wffPbskgDV8Pyk5oallOjOcPaIbClcGBAR4hbc7E0i/Xt8UQmbTMPnzJSBgmaRjGFaw85OCrzIYDCqbc0uogG+2fY8a6Ej/1Q+4qPFVNjOlpE8bztDqFGEYus9oEPltE7sMqk/7nwrB28=
Content-ID: <DC63CAADC6E8ED48899DDE0839494983@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4ac692-0d74-4708-72e1-08d7143a66c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:35:36.2533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3137
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/3] build: allow picking the env values for
 compiler variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAxNTozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBEb24ndCBmb3Jj
ZSB0aGUgdXNhZ2Ugb2YgdGhlIGhhcmRjb2RlZCBjb21waWxlciB2YWx1ZXMgaWYgdGhvc2UgYXJl
DQo+IGFscmVhZHkgc2V0IG9uIHRoZSBlbnZpcm9ubWVudC4gVGhpcyBhbGxvd3MgdGhlIFhlbiBi
dWlsZCBzeXN0ZW0gdG8NCj4gY29ycmVjdGx5IHBpY2sgQ0MvQ1hYIHZhbHVlcyBwcmVzZW50IG9u
IHRoZSBlbnZpcm9ubWVudCwgYW5kIGZpeGVzIHRoZQ0KPiB1c2FnZSBvZiB0aG9zZSBieSB0aGUg
R2l0bGFiIENJIHRlc3Qgc3lzdGVtLg0KPiANCj4gTm90ZSB0aGF0IHdpdGhvdXQgdGhpcyBmaXgg
dGhlIFhlbiBidWlsZCBzeXN0ZW0gd2lsbCBjb21wbGV0ZWx5IGlnbm9yZQ0KPiBhbnkgQ0Mgb3Ig
Q1hYIHZhbHVlcyBzZXQgb24gdGhlIGVudmlyb25tZW50LCBhbmQgdGhlIG9ubHkgd2F5IHRvIHBh
c3MNCj4gYSBkaWZmZXJlbnQgQ0Mgb3IgQ1hYIGlzIHRvIG92ZXJ3cml0ZSBpdCBvbiB0aGUgbWFr
ZSBjb21tYW5kIGxpbmUuDQoNCk5vdyB0aGUgcXVlc3Rpb24gaXM6IERvIHdlIHBvc3NpYmx5IHdh
bnQgaXQgdG8gYmUgdGhhdCB3YXk/IEkndmUgYWx3YXlzDQpiZWVuIG9mIHRoZSBvcGluaW9uIHRo
YXQgaW5oZXJpdGluZyBzb21ldGhpbmcgdGhhdCBoYXBwZW5zIHRvIGJlIChsZWZ0PykNCnNldCBp
biB0aGUgZW52aXJvbm1lbnQgaXMgbm90IGEgZ29vZCBpZGVhLiBIZW5jZSBJJ3ZlIGJlZW4gd2Vs
Y29taW5nIGFsbA0KY2hhbmdlcyB0aGF0IHJlbW92ZWQgZGVwZW5kZW5jaWVzIG9uIHNldHRpbmdz
IHBvc3NpYmx5IGNvbWluZyBmcm9tIHRoZQ0KZW52aXJvbm1lbnQuIChFeGNlcHRpb25zIG9mIGNv
dXJzZSBhcmUgWEVOXyogZW52aXJvbm1lbnQgdmFyaWFibGVzIHdlDQpzcGVjaWZpY2FsbHkgZXZh
bHVhdGUuKQ0KDQpBcyBhIHJlc3VsdCBJJ20gaW5jbGluZWQgdG8gbmFrIHRoaXMgcGF0Y2gsIGJ1
dCBJJ20gb3BlbiB0byBhcmd1bWVudHMuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
