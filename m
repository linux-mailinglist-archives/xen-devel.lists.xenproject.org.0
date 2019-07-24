Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E22C72E62
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 14:06:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqFyt-00061r-2i; Wed, 24 Jul 2019 12:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqFys-00061l-CD
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 12:02:50 +0000
X-Inumbo-ID: f2842948-ae0a-11e9-ab1d-cf14aafbde87
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2842948-ae0a-11e9-ab1d-cf14aafbde87;
 Wed, 24 Jul 2019 12:02:48 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 12:02:42 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 12:00:39 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 12:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNp/gbqi4HII/3VresJCaOkfSdMDFemSDv3J6qsYMrEvpqbdGXyVDRQVkYyGnzUkIcGYfb3HzTI5G67AizixXi4aMsLDX6y92JnONJob+phCY7InPzs4VZ4uJC0RC/xHkuh8KvU3X9fgqISVphF0nlS6L7Grcfomv8reTacu35IkJG0FOY9mh6zo7IMNDSm2gB3G9g+bqG9MNuL/3fFZjXnd1UQeb9alLsL4JdBgfZatO3nEWNqDG+aW1e+x7RaLfcItCjvEiFhfWt1UGJqoc9LArCcxe1yA0DelBFXN+hIxIHX+3VZ9fih6wYjMEhWVBiPefsMiMBi1AgB822Zwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3r2i9Qui4qk86pHsiw5gF/yDQVdSlc57Vc2wXFWqwA=;
 b=cNcYiXOTcseiA4fnRoUC5nS5nBv+Qj5ATFMrbdAM+6C6SFdpQrOkJC+gBXUhJNCDk/4j8NAML1H8zR6Z7s8YxxprtlAAXKsO5u84/uyTtCZHTOyZ3OO41K+/gQ+pBfrLFNoz+GWd3hgksrBHh3AULhg8jjF0OSm3O7aV+kDRcYvOoRFv02VvaDhHtcqMRK+CSCPdsx6FS7WwunAbtjcqSZ8VAbGZEZefHlpw37/1KaQ1kYQU7wTkuGrQJmsNgRerIymcTbRCQPsRPHdB4S/DnDxBNdsr0b09hS9G/9F9N/8o2o+xs/LJwHbxWC6IMUHkQKhZA7yj01Nr62IcEx6EeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.15; Wed, 24 Jul 2019 12:00:38 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 12:00:38 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVQGZoAIAkO6cfhESDQvB+1ma7GabWTmUwgAAaH4CAACIW8P///zuAgAAjM0D//+s8gIAAJkZwgAADUt6AAIoGGoAAAwRXgAEppbWAAADYpIAABBtqgAACZwCAAS4YgA==
Date: Wed, 24 Jul 2019 12:00:38 +0000
Message-ID: <34dd9288-d7e7-d0c9-630e-c740fdda0be0@suse.com>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
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
In-Reply-To: <CAMmSBy_Jh_NHTn_VYkNL8FxcnfMkpiq94E+XqNK9wJWm7tH0pw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0015.eurprd06.prod.outlook.com
 (2603:10a6:10:100::28) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12bebd7e-b556-43ea-8db1-08d7102e8ad2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3394; 
x-ms-traffictypediagnostic: BY5PR18MB3394:
x-microsoft-antispam-prvs: <BY5PR18MB33949FDCFDDB16F3213F425CB3C60@BY5PR18MB3394.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(189003)(199004)(2906002)(102836004)(99286004)(71200400001)(6246003)(86362001)(71190400001)(14454004)(8936002)(26005)(107886003)(6486002)(52116002)(31696002)(6916009)(68736007)(386003)(76176011)(66476007)(66556008)(64756008)(66946007)(66446008)(6506007)(6436002)(7736002)(81156014)(81166006)(305945005)(54906003)(80792005)(8676002)(4744005)(6512007)(53546011)(486006)(229853002)(316002)(31686004)(25786009)(186003)(476003)(2616005)(36756003)(53936002)(4326008)(11346002)(5660300002)(446003)(478600001)(5024004)(14444005)(256004)(3846002)(66066001)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3394;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FPOCMblSC5EroZDZcI+VReFUoeKickC0ibe+WYA4QQIP0jsiVrT+O331xBD9qx3IlqOzVRJ1oukhdR8CpcVAxgO7BB8iYzQY+zyophC31rSRdpZqbnXiLkV4kX5hbCwyS4fr07g29q0Wd3WsgtGE/TaU+Ny+yuBbQ53A1nGiOc9xh1rCmEDNQ2oI7ehdUKQ6neu1Eoj7zU5TXbhiR/65fRR6lt20WUdIeljlOYigBf5n4B9qMV3kKGQ54y/bFLnAMEzOX8IXueWGmxghDBKCMQRXr1Hpmg/+Sq0XbofQsdsPPfrkEzfcW6JogWRC/RSOhTyyTjdK0UI9YS1iQ7tvR3C/u5+rHHMsGHPc8s0yOu4vaCKnliBOc+ruyOfy8yIlEdqB9jzYiBB7EvyHCWMLGWGdxe9OG3fdV4VGpmHA2ac=
Content-ID: <D42675339E2E364F9113B8C14EE00F5A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bebd7e-b556-43ea-8db1-08d7102e8ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 12:00:38.1848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3394
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

T24gMjMuMDcuMjAxOSAxOTo1OCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToNCj4gTm8gd29ycmll
cy4gVGFrZSBhIGxvb2sgYXQgdGhlIGhlYWQgb2YgdGhlIGxvZyBhdHRhY2hlZC4NCg0KT25lIG1v
cmUgdGhpbmcgZm9yIHlvdSB0byB0d2VhayB0byBtYWtlIHRoZSBsb2cgZXZlbiBtb3JlIHVzZWZ1
bDoNCkFzIHBlcg0KDQooWEVOKSBYZW4gdmVyc2lvbiA0LjEyLjAgKEApIChnY2MgKEFscGluZSA2
LjQuMCkgNi40LjApIGRlYnVnPW4gIFR1ZSBKdWwgMjMgMTc6MTU6NDggVVRDIDIwMTkNCg0KdGhp
cyBpcyBhIG5vbi1kZWJ1ZyBidWlsZC4gSWYgeW91IHVzZWQgYSBkZWJ1ZyBvbmUsIHRoZXJlIG91
Z2h0IHRvDQpiZSBhbm90aGVyIGNvbmZpcm1pbmcgbWVzc2FnZSBuZXh0IHRvDQoNCihYRU4pIFtW
VC1EXWZvdW5kIEFDUElfRE1BUl9STVJSOg0KKFhFTikgW1ZULURdICBSTVJSIGFkZHJlc3MgcmFu
Z2UgOGQ4MDAwMDAuLjhmZmZmZmZmIG5vdCBpbiByZXNlcnZlZCBtZW1vcnk7IG5lZWQgImlvbW11
X2luY2x1c2l2ZV9tYXBwaW5nPTEiPw0KKFhFTikgW1ZULURdIGVuZHBvaW50OiAwMDAwOjAwOjAy
LjANCg0KcGx1cyBvdGhlcnMgaW4gY2FzZSBvZiBlcnJvcnMgYmV5b25kIHRoZSBtZW1vcnkgbWFw
IHJlbGF0ZWQgb25lDQood2hpY2gsIGFzIHdhcyBwb2ludGVkIG91dCBhbHJlYWR5LCBpcyBhIHdh
cm5pbmcgb25seSkuIEluIGNhc2UNCnlvdSdyZSBpbnRlcmVzdGVkLCBzZWUgcmVnaXN0ZXJfb25l
X3JtcnIoKSBpbiBwYXJ0aWN1bGFyLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
