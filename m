Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0626E39A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:40:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoPKi-0007fB-HW; Fri, 19 Jul 2019 09:37:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoPKh-0007f6-JU
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:37:43 +0000
X-Inumbo-ID: da1b44f3-aa08-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id da1b44f3-aa08-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 09:37:41 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 09:37:39 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 09:37:15 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 09:37:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmQx02dzO13qS3fNavCKyXDKc7WmutGWRemAhlsQPauVyZ+NYKe8sXG5kCPrErpWw/MhiKOGCZC+oHHEDvDxyspwCqVXrds66348lVhrkkWCQ4F6K9WdtWvckLhQU+NWs5Tw4pXQGfBLQ9i0vMn3gcN2DLqOeVxGlCtKHwJHodpJPOZhSh/tl2wXBhGaUq6YE82htqx1EjRDdpMYxmkBRIPBMNRFojF+FdW8rxfaw6Wsy6oZIA0xFWKCwkLvLXbU+smZWH7xhXh3qoiGLFVcH1NpV0EidbRJ5jUEyO/mbOqUbUEKt2GbXfGXPD/7ANje1Un4c95zyYXCW41ldJ/2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH1PLlHCFefDkA6WJHWkhSf5/WW2gouqizP2I3zC7cg=;
 b=HCasVwBT//4T8d9zqRSM+TOBT0DCB2DTswXubKydYM1Se/47hvDKsdjG6q8ZBalr/1pmgWWlgwnZjHbxhjVvbUeHvYoSk3t5sOpnnT1/v1qj6glCmbxDDzJQZ96WknBfLeVFVsla4RiAtFT6izFwVbOul2EO2kRQZjTXDcA4lSnS0kktNpY+KI9Gk6HXIPLK9GKMKeQrCjmLDAbNT9S8Q4OFhgx/QlLqiQL6kjc/cYRbPXWnMrat4z6yCDoQ5mLGSs5dUj8O24gcQSQ7XMahiXNUFqzSoEY/egjxO863sLlPghYtNendgoXOlBq+j5htNgPy2Pv5SiiNaEOXtub0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2394.namprd18.prod.outlook.com (20.179.71.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 09:37:14 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:37:14 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] vunmap: let vunmap align virtual address by itself
Thread-Index: AQHVPhWLg4cyYnQWKUW8aYX9saIQug==
Date: Fri, 19 Jul 2019 09:37:14 +0000
Message-ID: <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0348.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::24) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0424bdd0-65ca-4186-3ebb-08d70c2cae55
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2394; 
x-ms-traffictypediagnostic: DM6PR18MB2394:
x-microsoft-antispam-prvs: <DM6PR18MB2394AC42D93F43370401A73AB3CB0@DM6PR18MB2394.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(6246003)(26005)(66066001)(31686004)(102836004)(66446008)(229853002)(54906003)(53936002)(110136005)(186003)(64756008)(66556008)(6116002)(3846002)(52116002)(99286004)(81156014)(25786009)(7736002)(8936002)(7416002)(5660300002)(80792005)(68736007)(36756003)(305945005)(81166006)(478600001)(71200400001)(14454004)(71190400001)(76176011)(66946007)(486006)(4326008)(316002)(386003)(4744005)(53546011)(6506007)(476003)(31696002)(2616005)(14444005)(256004)(6486002)(446003)(86362001)(6436002)(2906002)(6512007)(66476007)(11346002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2394;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uME4JzRXG3/e6QFvXVUrQrxfaHPFcMg5DlYZZkax0fWDZjqUJ5uSrJeThGd1JUMF6HPCVtLpwhFuVcO6nSFp0V1voHzjzTBDZqKBodUyPF23+Dm+vCgk/w8eO+sgco8rhK75uMBTK/tzP1VdKKdLPJyETBXLr3ufV6GVp/+xYeLylM7zfZ9YAyP3zhjuNQVYmfXauqKqMDXO3SJ9tIJuMEf8/JQYFrmvlkPh6MGNT0jhWKVu4Wg8ddBTP2vXc/y+OVY49mNt4pfDOLvFy5TZvRQNn4ceL2oi52A0bOpXG4EnSeFl47/Vv+MjpOsZ2ryqM05WWEMaifkRpUNwykxESuif3+5zHZbOYvj4X09okhDs8Yb+6jZCWPNfhJH5tIg2mIRuJAfR7umbNGSnyeJ6UEwEAJgx0YXAjSIK7Qokxsg=
Content-ID: <3FDC0E881E80134FAEF3DDD68D6B1966@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0424bdd0-65ca-4186-3ebb-08d70c2cae55
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:37:14.0900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2394
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxOToxMSwgQW5kcmlpIEFuaXNvdiB3cm90ZToNCj4gTGV0IHZ1bm1hcCBh
bGlnbiBwYXNzZWQgdmlydHVhbCBhZGRyZXNzIGJ5IFBBR0VfU0laRS4NCg0KRGVzcGl0ZSBzZWVp
bmcgQW5kcmV3J3MgUi1iIHlvdSd2ZSBhbHJlYWR5IGdvdCBJJ2QgbGlrZSB0byBwb2ludCBvdXQN
CnRoYXQgdGhpcyBpbmNyZWFzZXMgdGhlIHJpc2sgb2Ygc29tZSBjb2RlIHBhc3NpbmcgdGhlIHdy
b25nIHBvaW50ZXINCmludG8gaGVyZS4geyx1bn1tYXBfZG9tYWluX3BhZ2UoKSBhY3Qgb24gc2lu
Z2xlIHBhZ2VzIG9ubHksIHNvIHRoZXJlJ3MNCm5vIGFtYmlndWl0eS4gV2hlbiB0YWxraW5nIGFi
b3V0IG11bHRpLXBhZ2UgcmVnaW9ucyB0aG91Z2gsIG5vdCB1bmRvaW5nDQphcml0aG1ldGljIHBy
ZXZpb3VzbHkgZG9uZSBtYXkgbWVhbiBhY3R1YWxseSBwb2ludGluZyBhdCBvdGhlciB0aGFuIHRo
ZQ0KZmlyc3QgcGFnZSBvZiB0aGUgbWFwcGluZy4NCg0KPiBUaGlzIGFsc28gbWFrZXMgaXQgY29u
c2lzdGVudCB3aXRoIGhvdyB7LHVufW1hcF9kb21haW5fcGFnZSgpDQo+IGN1cnJlbnRseSB3b3Jr
cy4NCj4gDQo+IFdpdGggdGhlIG1haW4gY2hhbmdlLCBhbHNvOg0KPiAgIC0gc3RyaXAgYWxsIGV4
aXN0aW5nIHZ1bm1hcCgpIGNhbGxzIGZyb20gcHJpb3IgbWFza2luZw0KDQpfSWZfIHdlIGFyZSB0
byBnbyB0aGlzIHJvdXRlLCB0aGVuIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpDQpjYWxsZXJz
IHNob3VsZCBhbHNvIGJlIGFkanVzdGVkLiBUaGVyZSwgYXMgZm9yIHVubWFwX2RvbWFpbl9wYWdl
KCksDQpJIGFncmVlIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gYmUgbW9yZSB0b2xlcmFudC4NCg0K
SmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
