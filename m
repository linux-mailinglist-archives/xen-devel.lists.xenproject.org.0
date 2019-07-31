Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF48E7BC4B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:54:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hskKc-0006ao-AJ; Wed, 31 Jul 2019 08:51:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hskKa-0006ab-Gy
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:51:32 +0000
X-Inumbo-ID: 6240d625-b370-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6240d625-b370-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 08:51:30 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 08:51:24 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 08:34:19 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 08:34:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEX9LDBpDq+ADRFm2X8ZLIfQaX2v+3qiD5UTGBi1fMShoyztD6mRAayJuTrbRo6kLl5ou+eRjhzzDsEd0ls1h0P3fCURB1NpKx8JxWkeUXLjeO/S9OFD4mGTt1hBuRSbxvR7ThY19AncEkPqxDafRQ8fVZoFjqSQdQ9cpFEgv5DVcKgZdZeE94G+FHJRN78yEYguou9Fxpbh5v86NSyw+y8vW+9RVC0d0bitcRQoPDk+SbjymLjMikafjIAbrgCQarz5lZrldFYiEMJD/ECPXIxsS8V9kqBKHOvLxdV4RMwUyglL51mOddQnA9KQOAG9fYmfj5YJBST8ZTdqr0iEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLvuiN5JTlIPk8wKRs8xgItEVVFvzgzz1LTaeqQkYkY=;
 b=ejoyrVlbpMXkKZX0zUAUY7qK9lTpMvARTAfX5+j3xo4AMHmUVuOdjIGKOchyDRQddnBZdWXbidCvY6uK5CKqR6egcc12qz8eE0HV/QuCz1pfJr5FHDY0OEZEoFgJ1SKz+8ZquWACWE0WWf0ldSNYgIsHYzp13Ed2S8xYqZBA6KKi+UrhVF1goYqgjp2+PNEXxGmPVXLRsuefqzDSe71g5K3ueVhIOt7w1PCqkonrtDzuwBpAlGmAZhHuCxyCaD+ezkZ0FcR/ZGIazoZwSBmM3OF8qNfpWqeU8Ua866+28vSX2/Pkg4jkfp1OrA27KB2j6medbFRuB7mLRUr4hWodTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2633.namprd18.prod.outlook.com (20.179.106.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 08:34:19 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 08:34:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVQGZoAIAkO6cfhESDQvB+1ma7GabWTmUwgAAaH4CAACIW8P///zuAgAAjM0D//+s8gIAAJkZwgAADUt6AAIoGGoAAAwRXgAEppbWAAADYpIAABBtqgAACZwCAAAP3BYAAA38agAQHi4CABvFPpYAA9HeA
Date: Wed, 31 Jul 2019 08:34:18 +0000
Message-ID: <52afea81-33d3-7120-af72-2987bb634f08@suse.com>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
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
 <4646f3e8-6291-7d98-2550-8ab207ac675e@suse.com>
 <CAMmSBy9LTN8LjLGyfTO9g80OdP4ew0ZHj1GGFfAkt5oAKEHPKA@mail.gmail.com>
In-Reply-To: <CAMmSBy9LTN8LjLGyfTO9g80OdP4ew0ZHj1GGFfAkt5oAKEHPKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0159.eurprd07.prod.outlook.com
 (2603:10a6:6:43::13) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee548b8a-1f5d-45a2-8971-08d71591e12e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2633; 
x-ms-traffictypediagnostic: DM6PR18MB2633:
x-microsoft-antispam-prvs: <DM6PR18MB2633EC97765D953BAAED6A38B3DF0@DM6PR18MB2633.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(189003)(199004)(71200400001)(66446008)(64756008)(66556008)(102836004)(14454004)(26005)(66946007)(66066001)(99286004)(86362001)(8936002)(76176011)(186003)(71190400001)(52116002)(6246003)(25786009)(107886003)(4326008)(3846002)(5660300002)(6506007)(386003)(53546011)(66476007)(478600001)(53936002)(8676002)(6116002)(81166006)(256004)(81156014)(7736002)(476003)(6436002)(486006)(68736007)(11346002)(80792005)(6512007)(4744005)(446003)(36756003)(6486002)(305945005)(2616005)(316002)(31696002)(54906003)(2906002)(229853002)(31686004)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2633;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3jVUkS4jpUy3eNswOet2vzN5iraaAidSBQdHy8WZfOpuYwusJDKlvx7vqvE9xDKXPk87xBt5yaZUw2YXWCHXgBWutKgIfrnQFlvG4YK4+FVO5IiT4wY4yCBsRl/2DoL9i5obIG86pHfayjhKQg2jmfhxlg+c1ydkCV6Ia9WEc+DrF8SCA4vk1tCHHVXWkuiJMN3aq9iiO+G4zxJj/Lqy18XFp6gIuzMM3MJ8gSbxXjiLo/kcjepQU6Yw7XTyySKZBFRMmxShQuE9Pk5VlP3FMFZRPgZbbKrQ2UnbmOJSj8pEDED/7UpWDdxsAHksGBQUNMPS/Trg5c+pm42/38p8Ap8CFZ3v54Grgk5Rq3+J6wsi71Bkyjaem4StqXM5J4aneKfu20vrQvTbR6icPNM9iXhmK0x/qgFFeL1lKPjLWv8=
Content-ID: <C939A6A2E39B474AB2D150FF67D16926@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ee548b8a-1f5d-45a2-8971-08d71591e12e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 08:34:18.9978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2633
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

T24gMzAuMDcuMjAxOSAxOTo1NiwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToNCj4gT24gRnJpLCBK
dWwgMjYsIDIwMTkgYXQgMTowNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOg0KPj4NCj4+IE9uIDIzLjA3LjIwMTkgMjA6MjUsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6
DQo+Pj4gSW50ZXJlc3RpbmdseSBlbm91Z2gsIGFkZGluZyBpb21tdV9pbmNsdXNpdmVfbWFwcGlu
Zz0xIEFORCBpb21tdT1kZWJ1Zw0KPj4+IGJvb3RlZCB0aGUgc3lzdGVtIGp1c3QgZmluZS4NCj4+
DQo+PiBCdHcgKEkndmUgbm90aWNlZCB0aGlzIG9ubHkgbm93KSAtIGFyZSB5b3Ugc2F5aW5nIHdp
dGhvdXQgImlvbW11PWRlYnVnIg0KPj4gdGhlIGJveCBkb2VzIF9ub3RfIGJvb3QgZmluZSwgZGVz
cGl0ZSB0aGUgb3RoZXIgb3B0aW9uPw0KPiANCj4gWWVzLiBCdXQgaXQgbWFkZSBzZW5zZSB0byBt
ZSBzaW5jZSBpb21tdT1kZWJ1ZyAoYXMgcGVyIHlvdXINCj4gZXhwbGFuYXRpb24pIG92ZXJ3aGVs
bXMgdGhlIENQVSBhbmQgSSBndWVzcyBhZGRpbmcNCj4gaW9tbXVfaW5jbHVzaXZlX21hcHBpbmc9
MSBhdm9pZHMgdGhlIGNvZGUgcGF0aCB0aGF0IGRvZXMgaXQ/DQoNCkknbSBhZnJhaWQgSSBkb24n
dCBmb2xsb3c6IE15IHF1ZXN0aW9uIHdhcyB3aGV0aGVyDQoiaW9tbXVfaW5jbHVzaXZlX21hcHBp
bmc9MSIgYWxvbmUgd291bGQgbm90IGFsbG93IHRoZSBib3ggdG8gYm9vdC4NCldpdGhvdXQgImlv
bW11PWRlYnVnIiB0aGVyZSdzIG5vIGV4Y2Vzc2l2ZSBsb2dnaW5nIGFmYWljdCwgbm8NCm1hdHRl
ciB3aGF0IG90aGVyIElPTU1VIG9wdGlvbnMgeW91IHVzZS4NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
