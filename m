Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC77606A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 10:09:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqvFF-0003I1-7A; Fri, 26 Jul 2019 08:06:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqvFD-0003Hw-AD
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 08:06:27 +0000
X-Inumbo-ID: 3ea8fb38-af7c-11e9-9139-2fa2229b57a7
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ea8fb38-af7c-11e9-9139-2fa2229b57a7;
 Fri, 26 Jul 2019 08:06:22 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 08:06:19 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 07:58:10 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 07:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxhOdpPxNP9SPS9KBg0/GknUVfpfaYW8TY0plzc7uhMKuXJuhqA9AlSqXPqy6DlPj8YBcsKiV3wvBelmLsWE6cLRQyluqgx14a/nghPY9DqOhT0SnHtzXGXOFUZvszzBd1h/MbL5/AfU1/Uw8VlJ1nkg6+76EB5AGkvsNyJm9Kvf3+kVn5MtkDWaqttE77nJTebeaMbyVsnzQqXvKFzUn3QK8XoWKO3MiVT8JMquDDvleCfJh3HCNU16lLVZweeAiUORhSEKfX9V+UUuJoGK0oSlP47c3IEYjZCaWipyVKP5WFd23YUSfjFTDAh5/b0piNSSlGS+LLP7GT2NCPC8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1j82sIR2NPDjtE7wfSDGU1lKXpOLZd28sVT9N2fL4o=;
 b=QE39C517BRC/lh4XsV76/Dz1PnBxLd/hOfeeNZ+/qtrddAEiwaia99YfTxuXQwCofnxozC6sLw19l9ErdtjStmerze3c9cshbpSLZjOKjMhEl8Zelur0fKClTCekrgRsLTNGDHk1XNSY7cakJgHlocGbggdZ4QMMaUmzrJ7pZS94UzTOUmqyRwRYz1Sw7ZcACJZ5nIV00m3H3sLz142iRbv/W06eaMCOLz1y+MMsjK8PIrgX/7yRAGZCEIPXrs84sPzE/iKZWj6Lb0Mfi9icv8sfn2b8HvhoKrid+pJFx6+ZP94na/PjJjY7BA7BIYCKTSdEfv0zyFFmR0LO11QWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3329.namprd18.prod.outlook.com (10.255.138.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 26 Jul 2019 07:58:09 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 07:58:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVQGZoAIAkO6cfhESDQvB+1ma7GabWTmUwgAAaH4CAACIW8P///zuAgAAjM0D//+s8gIAAJkZwgAADUt6AAIoGGoAAAwRXgAEppbWAAADYpIAABBtqgAACZwCAAAP3BYAAA38agAQHi4A=
Date: Fri, 26 Jul 2019 07:58:09 +0000
Message-ID: <4646f3e8-6291-7d98-2550-8ab207ac675e@suse.com>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <f2d4b51f-b2b1-abad-8040-ad5de26f5b5b@citrix.com>
 <CAMmSBy909uERFmH9=pMqpZkr=Bb7-TVMZiFRarvzV57+=QcK8w@mail.gmail.com>
 <bf7515bb-3c4c-59e1-557a-d3f0106c5609@citrix.com>
 <CAMmSBy_Jh_NHTn_VYkNL8FxcnfMkpiq94E+XqNK9wJWm7tH0pw@mail.gmail.com>
 <81416abc-e5f5-76de-a34a-87412e125e64@citrix.com>
 <CAMmSBy8kJbt8wdJ2u+nO+FXphtNrdikOeKtMJ6tu45hDv8OeQQ@mail.gmail.com>
In-Reply-To: <CAMmSBy8kJbt8wdJ2u+nO+FXphtNrdikOeKtMJ6tu45hDv8OeQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0802CA0027.eurprd08.prod.outlook.com
 (2603:10a6:4:a3::13) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92a4de38-ef88-4300-744e-08d7119effeb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3329; 
x-ms-traffictypediagnostic: BY5PR18MB3329:
x-microsoft-antispam-prvs: <BY5PR18MB33294AB31584FC08B60E4BF2B3C00@BY5PR18MB3329.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(199004)(189003)(6246003)(6512007)(53936002)(558084003)(26005)(6916009)(71190400001)(36756003)(71200400001)(316002)(66066001)(6436002)(186003)(76176011)(52116002)(66946007)(66556008)(54906003)(5660300002)(6486002)(229853002)(11346002)(446003)(2616005)(476003)(99286004)(486006)(256004)(478600001)(66446008)(3846002)(6116002)(80792005)(53546011)(6506007)(386003)(102836004)(305945005)(68736007)(31686004)(7736002)(86362001)(8676002)(8936002)(81156014)(25786009)(4326008)(64756008)(31696002)(66476007)(2906002)(81166006)(107886003)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3329;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4FtCFVi1YTQW3lAk5S8qFu2wL7621rcP0Ze+QXu8r86NOG96DZikDWG3NIi9KdaPEAzrADBxxsgL0n3L4cZPabitf639ARGE5ZakvFe4nHkl2qI3MbLITDd/jtQKMCaKgTUDDVGLvIyvSj0mkvUso4/z/vhwZ1QlLdUcDeBh7DqgVebII3FbtrdlH0G71MKT4P9JcYPkbkiUtJDkpSKJD0lltNWBQm1GRS0I70y5LgMtgKsCOwkn8fGqfJQDxUtVgV0DZ1SkazQpgakaJRxDy1Aelqp/gkYYlC2uZIf5yIU1zgXH3S1Jnba8JL/QqedPuEhmXyKnY3Ej/W3Me/+oKgsZ5bNUHOMM71iyVYQYN+FknW7VtQkukYJ/GWMusuVJKYUC6YxollRhB7tejujq4ge7xyb739I8WcMgjvUqybU=
Content-ID: <D783950FEB81C544A0A7B05DF5E0EA61@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a4de38-ef88-4300-744e-08d7119effeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 07:58:09.5178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3329
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Juergen Gross <JGross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAyMDoyNSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToNCj4gSW50ZXJlc3Rp
bmdseSBlbm91Z2gsIGFkZGluZyBpb21tdV9pbmNsdXNpdmVfbWFwcGluZz0xIEFORCBpb21tdT1k
ZWJ1Zw0KPiBib290ZWQgdGhlIHN5c3RlbSBqdXN0IGZpbmUuDQoNCkJ0dyAoSSd2ZSBub3RpY2Vk
IHRoaXMgb25seSBub3cpIC0gYXJlIHlvdSBzYXlpbmcgd2l0aG91dCAiaW9tbXU9ZGVidWciDQp0
aGUgYm94IGRvZXMgX25vdF8gYm9vdCBmaW5lLCBkZXNwaXRlIHRoZSBvdGhlciBvcHRpb24/DQoN
Ckphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
