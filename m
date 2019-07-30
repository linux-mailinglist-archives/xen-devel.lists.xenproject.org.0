Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7A7A303
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:19:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNIo-0000a8-9B; Tue, 30 Jul 2019 08:16:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsNIn-0000a1-0K
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:16:09 +0000
X-Inumbo-ID: 41a501e6-b2a2-11e9-8fb3-af9fe4f5325b
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41a501e6-b2a2-11e9-8fb3-af9fe4f5325b;
 Tue, 30 Jul 2019 08:16:06 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 30 Jul 2019 08:15:59 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 30 Jul 2019 08:11:43 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 30 Jul 2019 08:11:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbaXp8w+M6yATjFGHvYyy3i9aw4Hg9N4snmiTD/xiyZvateCiEUl1knJzAC8APPKOuO7ndgajJCSggqVji2npUVPFpcQ59/aV1WgjOdtUkX+f9VIRWU+uLI+AR8bBeIaiCbkrOh6WpmTh7+EUTnHPmATzuz2szROJeOVHC9CkOpokhBbM0tq3ajSHYK5oONqnBNRJGeETaWUiSuvtlog4h9wWW/HX8+5Z1mTdiht0STOPENT4GV1XoCnbI/kGngPHlq1ZCcOCUJzQoYllGsxcwICtiyRCOIugqOlsnNOk1X+ox7LZbHnW4EO/nn7LrUy1g86J+8URI5pncAN48hgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9KRxJLvPGWOyGzPfBaWltewQRRl1hATwyrSZp5J/oY=;
 b=RZsCh4eYJxs0E91HzYNvrAmfF0g7JdO5iXcENa3wtXFZcyLiLaHjt1hhtRpdlz+1excwhcbfZdU8gsMu3AsAy84nYFtgzI9jhMYL7Su58pACXtQ1yhpDS0a+hUf38TnAKXEoVsdjr3VSqAIett0zd7umvr4EN/tiNVSA+qANRwVpgk9okx4B8K2SoW2F/geVGVEeTg5O2BjTkDRLuAnQU+doMA3shg6uRa7gTaytn4awOK4j90qjxLa4TPX204jAlybTPC28ZnweeoqpIkdgXPnyPlbFJYhIUg9k4/TgQL+IsQ7JfaPtLjbNEOac9+oaB7ARboec/ICfRXpezQDoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3251.namprd18.prod.outlook.com (10.255.136.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Tue, 30 Jul 2019 08:11:42 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 08:11:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
Thread-Index: AQHVQ/aLJfmONJuXtEOXa2NkIvPAfabhkz+AgAAGfoKAAAiSgIAARZsggADs94A=
Date: Tue, 30 Jul 2019 08:11:41 +0000
Message-ID: <bb4b13d2-7345-832a-5e16-0cf4334e8760@suse.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-5-andrew.cooper3@citrix.com>
 <9c5c9972-801a-e01a-171e-bcabde79eb6f@suse.com>
 <bb203e66-6edd-4edd-4f96-1fe95c1f9ccd@citrix.com>
 <f585f767-f6a0-e9ce-bbab-2183dde59e97@suse.com>
 <59379d7b-6add-4f34-c82e-1d8124871d9e@citrix.com>
In-Reply-To: <59379d7b-6add-4f34-c82e-1d8124871d9e@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR05CA0032.eurprd05.prod.outlook.com
 (2603:10a6:6:14::45) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5fa0d03-8269-4db2-e2fc-08d714c58dd3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3251; 
x-ms-traffictypediagnostic: BY5PR18MB3251:
x-microsoft-antispam-prvs: <BY5PR18MB3251C194E20FA5BAA420A285B3DC0@BY5PR18MB3251.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(199004)(189003)(305945005)(7736002)(53936002)(68736007)(6512007)(186003)(14454004)(66556008)(8676002)(446003)(6116002)(316002)(4326008)(2616005)(476003)(64756008)(86362001)(66066001)(66446008)(81156014)(66476007)(81166006)(3846002)(26005)(8936002)(66946007)(54906003)(11346002)(102836004)(31686004)(478600001)(80792005)(31696002)(6916009)(71190400001)(2906002)(36756003)(386003)(76176011)(25786009)(6436002)(5660300002)(486006)(53546011)(6506007)(71200400001)(6246003)(256004)(6486002)(99286004)(52116002)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3251;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aKbdLCgwPPM1dLqrP8aJHgUIHawPBhKGNe423fugPUTGLYQj65wKfXkggibzof/gxOiHM/BcYY2VnCVpIwKnz9CAQvjK5ynKUIscukoOeBxD2Cne6RQBcPMQY5FPO9QkMJACJVFXQdhUFBXi3LHeH8PqQwpsMWHMaQs5g2++gyGWTxl9iubg8caD50ZfDIHRtigOB9V/mFgCDiCVvpZnXx8WC9titO3igxhHc5D+HGpNTCL5nyI/qZI3+HM/A0+Qzs1fK0oKGT0e4lA/D/c9gVG8CNUsESrEswuTUgQYwdp6F6AfKFLmM7tYnk6d7fs0O6PVhGmZmssqTaAO2vs/KtlqeDDO8h6DPIJ0Wj+mBfZ9SQ+2kHak6REuBeLAhOcN6H/DycXozvi54KK72hJ9mPJVnWQtir3Gr58vxG33kHs=
Content-ID: <AA3C72076217F64284C0921AC7A23E32@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fa0d03-8269-4db2-e2fc-08d714c58dd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 08:11:41.8520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3251
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
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
Cc: Juergen Gross <JGross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAyMDowMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjkvMDcvMjAx
OSAxNDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyOS4wNy4yMDE5IDE1OjIzLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDI5LzA3LzIwMTkgMTQ6MDAsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBPbiAyNi4wNy4yMDE5IDIzOjA4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BlcmNwdS5oDQo+Pj4+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcGVyY3B1LmgNCj4+Pj4+IEBAIC0zLDYgKzMsMTIgQEANCj4+Pj4+ICAgICANCj4+Pj4+
ICAgICAjaW5jbHVkZSA8YXNtL3BlcmNwdS5oPg0KPj4+Pj4gICAgIA0KPj4+Pj4gKyNkZWZpbmUg
REVDTEFSRV9QRVJfQ1BVKHR5cGUsIG5hbWUpIFwNCj4+Pj4+ICsgICAgZXh0ZXJuIF9fdHlwZW9m
X18odHlwZSkgcGVyX2NwdV9fICMjIG5hbWUNCj4+Pj4+ICsNCj4+Pj4+ICsjZGVmaW5lIF9fREVG
SU5FX1BFUl9DUFUoYXR0ciwgdHlwZSwgbmFtZSkgXA0KPj4+Pj4gKyAgICBhdHRyIF9fdHlwZW9m
X18odHlwZSkgcGVyX2NwdV8gIyMgbmFtZQ0KPj4+Pj4gKw0KPj4+Pj4gICAgIC8qDQo+Pj4+PiAg
ICAgICogU2VwYXJhdGUgb3V0IHRoZSB0eXBlLCBzbyAoaW50WzNdLCBmb28pIHdvcmtzLg0KPj4+
Pj4gICAgICAqDQo+Pj4+IEJ5IG1vdmluZyB0aGluZ3MgaGVyZSB5b3UgcmVuZGVyIHN0YWxlIHRo
ZSByZW1haW5kZXIgb2YgdGhlDQo+Pj4+IGNvbW1lbnQgaW4gY29udGV4dCBhYm92ZTogTm8gcGVy
LWFyY2ggc3ltYm9sIG5hbWUgcHJlZml4IGlzIGdvaW5nDQo+Pj4+IHRvIGJlIHBvc3NpYmxlIGFu
eW1vcmUuIEknbSBub3QgYWdhaW5zdCBpdCwgYnV0IHRoaXMgY29tbWVudA0KPj4+PiB3b3VsZCB0
aGVuIHdhbnQgYWRqdXN0aW5nLiBXaGF0J3Mgbm90IGltbWVkaWF0ZWx5IGNsZWFyIHRvIG1lIGlz
DQo+Pj4+IHdoZXRoZXIgdGhlIHR3by1zdGFnZSBjb25jYXRlbmF0aW9uIG9mIGFuIHVuZGVyc2Nv
cmUgZWFjaCBpcyB0aGVuDQo+Pj4+IHN0aWxsIG5lY2Vzc2FyeS4NCj4+PiBZZXMgaXQgaXMgc3Rp
bGwgbmVjZXNzYXJ5LsKgIFNlZSB0aGUgVFNTIHRocmVhZCBmb3Igd2h5Lg0KPj4gTm8sIHRoYXQg
dGhyZWFkIGRvZXNuJ3QgZXhwbGFpbiBpdC4gRnJvbSBhbiBpbml0aWFsIGxvb2sgSSB0aGluaw0K
Pj4gdHdvLXN0YWdlIGV4cGFuc2lvbiBpcyBzdGlsbCBuZWNlc3NhcnkNCj4gDQo+IEl0IGlzIGFi
b3V0IHByZXZlbnRpbmcgJ25hbWUnIGJlaW5nIGV4cGFuZGVkLCBkdWUgdG8gdGhlIG1lc3Mgd2l0
aA0KPiBjcHVtYXNrX3NjcmF0Y2gsIHdoaWNoIHJlcXVpcmVzIGEgIyMgYXQgbGVhc3QgYXQgdGhl
IHRvcCBsZXZlbC4NCj4gDQo+IEkgcGVyc29uYWxseSB0aGluayB0aGF0IGZpeGluZyBjcHVtYXNr
X3NjcmF0Y2ggaXMgdGhlIHJpZ2h0IHdheSB0byBnbywNCj4gYnV0IEkgc3BlY2lmaWNhbGx5IGRp
ZG4ndCB0b3VjaCB0aGF0IHNvIGFzIHRvIGF2b2lkIHdyZWFraW5nIGhhdm9jIHdpdGgNCj4gSnVl
cmdlbidzIGNvcmUtc2NoZWR1bGluZyBzZXJpZXMuDQo+IA0KPj4gLCBidXQgaXQgY291bGQgdGhl
biBiZQ0KPj4gXyAjIyBuYW1lIG9uIHRoZSBmaXJzdCBhbmQgcGVyX2NwdSAjIyBuYW1lIG9uIHRo
ZSBzZWNvbmQgKGkuZS4NCj4+IG5vIGRvdWJsZSB1bmRlcnNjb3JlIGluIHRoZSBtaWRkbGUgYW55
bW9yZSkuDQo+IA0KPiBIbW0sIHByb2JhYmx5LCBidXQuLi4NCj4gDQo+PiBPZiBjb3Vyc2UgdGhl
cmUgbWF5DQo+PiBiZSByZWFzb25zIHdoeSB3ZSBhY3R1YWxseSBfd2FudF8gYSBkb3VibGUgdW5k
ZXJzY29yZSB0aGVyZS4NCj4gDQo+IC4uLiBJIGRvbid0IGhhdmUgdGhlIGVmZm9ydCBvciBlbmVy
Z3kgLSBidXQgbW9zdCBpbXBvcnRhbnRseSwgdGltZSAtIHRvDQo+IHJld3JpdGUgWGVuIGZyb20g
c2NyYXRjaC4NCj4gDQo+IElmIHRoZXJlIGlzIGEgY29uY3JldGUgcmVhc29uIHdoeSBkcm9wcGlu
ZyB0aGUgZG91YmxlIHVuZGVyc2NvcmUgaXMNCj4gZ29vZC9uZWNlc3Nhcnkvb3RoZXIsIHRoZW4g
aXQgc2hvdWxkIGJlIHByZXNlbnQgYXMgaXRzIG93biBwYXRjaCwgbm90DQo+IGNyb3diYXJyZWQg
aW50byBhbiB1bnJlbGF0ZWQgY2xlYW51cCBwYXRjaC4NCj4gDQo+IFVudGlsIHRoZW4sIHRoZSBp
bmVydGlhIG9mICJiZWNhdXNlIGl0cyBhbHJlYWR5IGxpa2UgdGhpcyIgd2lucy4NCg0KQW5kIHRo
aXMgaXMgYWxsIGZpbmUsIGFzIGxvbmcgYXMgdGhlIGNvbW1lbnQgaW4gcXVlc3Rpb24gY29udGlu
dWVzDQp0byByZWZsZWN0IHJlYWxpdHkgYWZ0ZXIgdGhpcyBjaGFuZ2UuDQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
