Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993EE72E75
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 14:09:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqG1W-0006BP-IB; Wed, 24 Jul 2019 12:05:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqG1V-0006BJ-91
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 12:05:33 +0000
X-Inumbo-ID: 529bb166-ae0b-11e9-97c8-37b2e2becd8f
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 529bb166-ae0b-11e9-97c8-37b2e2becd8f;
 Wed, 24 Jul 2019 12:05:30 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 12:05:16 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 12:04:23 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 12:04:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/79IpehBdg/V81kNtW4rFnaUU5P+whCpQ83b+usBP7KGTm2qmNjPSlrAAFwBCZZ6/oaUrofLcIbxcBnJihArYuBj1+k4/T0dArEAMsExCYzLMxCRSrnshkREM/EW5k0Abc04tjwk0h5Npk8/DWXyPF8A2QIjNejzAlw9xjPKI6Rjxb5OFbz9bLGWq9irGjs2k1eV+vQWxCdW/YkAQWLej2DyFbghlU/dcnzL4jGJ8VGeQfrPiPtLHE+N0Bypd0aX8lmKeQgjU92apMP1asaWQwXA7bIwNXfzilr56lhKLJc5Ei0nbjDgzKzouA23YyvthN2Y4iknjUTUf8dgrMoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc0qu5JomCUJpVmqYVuP+4UmiS3evKQ8DC9IrdIjpag=;
 b=Bl2kKqiT2hBLzVKxhAUUH3o5OYJvQFbQcPjSLnV66Nt+dmfQhh6p/s7RtvonMz7QyfZzxoTUq2t6gKlyRS++UXD6Or8ZyplaNwjO9KiWbfVBJ73Fry0rVHJ/kgscgtZVRpS/8KAaiIavUd7znaQ4fENVCEuIAIR+8jdm0x2xjqDddaRpOKbdVyhmn6I55dupwZgBQ+hGOmvTD4tnln0av1+k8y12ygexr30AtZKKkEEwr3emYv9e78xuo2q/KKeX3fNUshForR3vOsfSooj3bz/Ia/HWqb1k/YvD+u/aJ2JQJaHBQK/hOWMtz8bt6ZNJO9notdd8TQO6k94RXfaDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3091.namprd18.prod.outlook.com (10.255.136.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 24 Jul 2019 12:04:21 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 12:04:21 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVQGZoAIAkO6cfhESDQvB+1ma7GabWTmUwgAAaH4CAACIW8P///zuAgAAjM0D//+s8gIAAJkZwgAADUt6AAIoGGoAAAwRXgAEppbWAAADYpIAABBtqgAACZwCAAS4YgIAAAQmA
Date: Wed, 24 Jul 2019 12:04:21 +0000
Message-ID: <db726afd-8723-41e3-2f50-72410c5d66c0@suse.com>
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
 <34dd9288-d7e7-d0c9-630e-c740fdda0be0@suse.com>
In-Reply-To: <34dd9288-d7e7-d0c9-630e-c740fdda0be0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:45::37) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcc52c3d-9439-4dbf-4add-08d7102f0fe5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3091; 
x-ms-traffictypediagnostic: BY5PR18MB3091:
x-microsoft-antispam-prvs: <BY5PR18MB3091C0A9554FF688C00ABEF5B3C60@BY5PR18MB3091.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(199004)(189003)(53936002)(6246003)(6116002)(6512007)(3846002)(66066001)(5660300002)(14454004)(107886003)(25786009)(4744005)(68736007)(316002)(80792005)(54906003)(99286004)(31686004)(7736002)(76176011)(52116002)(305945005)(6506007)(53546011)(71190400001)(6436002)(71200400001)(102836004)(4326008)(26005)(31696002)(6916009)(478600001)(86362001)(256004)(5024004)(14444005)(386003)(2906002)(229853002)(476003)(2616005)(446003)(11346002)(81156014)(81166006)(36756003)(66446008)(486006)(6486002)(64756008)(66556008)(66476007)(66946007)(8676002)(8936002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3091;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qdHkLQnOFfwzNhVi9mZO7okJ9mQtEJq5Ype5BYYxGK73G0D7bWv4NZVleo3xlyhDmAopgyE+jS8tfhbc1YIDDohHIS/0Mu0t3H5+Jq1lj8k/fXJ+vILxdJaYB8PwewXKQ9JNAZ3A6DsDmcrTxSubKqWwLw6OAPKhOQTSlJodcLuagbbqTlMv/IKgmaLWp3M27lbOC51blp6CUmF/3daOo/2mJHg/wGV7YNc1Fru7sOfML9N9GTAzAkny2o+b76AJLRcugMxXOlBpAyTN3jBWJzyy3wgiCLoxC0bNt4jdaHT/PbNa8XK68lw8IYQ5v/fRmf5o74LcF1tOm9fKWmPd1qQa/slFOQxeKcAwruLPJMbbGVzemRnSlAZnnClxu1g39JaknKHhXBXAgdVhvi9sSXUO5dU0t4eJFZr5NlhEOmU=
Content-ID: <2C4BDE6491A525469BF1E71D8C319FA9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc52c3d-9439-4dbf-4add-08d7102f0fe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 12:04:21.4605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3091
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

T24gMjQuMDcuMjAxOSAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA3LjIwMTkg
MTk6NTgsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6DQo+PiBObyB3b3JyaWVzLiBUYWtlIGEgbG9v
ayBhdCB0aGUgaGVhZCBvZiB0aGUgbG9nIGF0dGFjaGVkLg0KPiANCj4gT25lIG1vcmUgdGhpbmcg
Zm9yIHlvdSB0byB0d2VhayB0byBtYWtlIHRoZSBsb2cgZXZlbiBtb3JlIHVzZWZ1bDoNCj4gQXMg
cGVyDQo+IA0KPiAoWEVOKSBYZW4gdmVyc2lvbiA0LjEyLjAgKEApIChnY2MgKEFscGluZSA2LjQu
MCkgNi40LjApIGRlYnVnPW4gIFR1ZSBKdWwgMjMgMTc6MTU6NDggVVRDIDIwMTkNCj4gDQo+IHRo
aXMgaXMgYSBub24tZGVidWcgYnVpbGQuIElmIHlvdSB1c2VkIGEgZGVidWcgb25lLCB0aGVyZSBv
dWdodCB0bw0KPiBiZSBhbm90aGVyIGNvbmZpcm1pbmcgbWVzc2FnZSBuZXh0IHRvDQo+IA0KPiAo
WEVOKSBbVlQtRF1mb3VuZCBBQ1BJX0RNQVJfUk1SUjoNCj4gKFhFTikgW1ZULURdICBSTVJSIGFk
ZHJlc3MgcmFuZ2UgOGQ4MDAwMDAuLjhmZmZmZmZmIG5vdCBpbiByZXNlcnZlZCBtZW1vcnk7IG5l
ZWQgImlvbW11X2luY2x1c2l2ZV9tYXBwaW5nPTEiPw0KPiAoWEVOKSBbVlQtRF0gZW5kcG9pbnQ6
IDAwMDA6MDA6MDIuMA0KPiANCj4gcGx1cyBvdGhlcnMgaW4gY2FzZSBvZiBlcnJvcnMgYmV5b25k
IHRoZSBtZW1vcnkgbWFwIHJlbGF0ZWQgb25lDQo+ICh3aGljaCwgYXMgd2FzIHBvaW50ZWQgb3V0
IGFscmVhZHksIGlzIGEgd2FybmluZyBvbmx5KS4gSW4gY2FzZQ0KPiB5b3UncmUgaW50ZXJlc3Rl
ZCwgc2VlIHJlZ2lzdGVyX29uZV9ybXJyKCkgaW4gcGFydGljdWxhci4NCg0KT2gsIGFkZGl0aW9u
YWxseSB5b3Ugd2FudCB0byBhZGQgImxvZ2x2bD1hbGwiIHRvIHlvdXIgaHlwZXJ2aXNvcg0KY29t
bWFuZCBsaW5lLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
