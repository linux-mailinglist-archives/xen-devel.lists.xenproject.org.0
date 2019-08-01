Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C387D687
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 09:42:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht5gA-0004w9-Kf; Thu, 01 Aug 2019 07:39:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ht5g8-0004w3-M0
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 07:39:12 +0000
X-Inumbo-ID: 6fe6e720-b42f-11e9-a507-33c55d4178a8
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fe6e720-b42f-11e9-a507-33c55d4178a8;
 Thu, 01 Aug 2019 07:39:07 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  1 Aug 2019 07:39:05 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 1 Aug 2019 07:35:43 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 1 Aug 2019 07:35:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwwROogbSO5SmATXygQNOJzXL9wsKoYjdf6Q43nOGNhKQIY5HZ3IzRQ9QCmXKwyA2Jav3I/iqNBHBB7zHrkuXWfg5DflNXo6BlCjeCsh4dPRupmpzOdb7Xktq7Izn9aq7wvyBosEe8AbZizTZA2jsJ7Kb3m6IPrVg1Fe3judSwq1fmoVYV/XX8hks4EEpGRL1GT6Jc+WOktxxcsuMK3B5/cluLt7x8wSGncB/sUD069sAql5/4yu+SMDW8cFveJavCHg07xJX0p8YRxChw0jLTmcc58sb4KHgUNViA3Czg07+RKsxyXl8H/P69c77SXXjf86s6fOt/jxlaZ738AAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeGrWtPp+eiZAlhvLulUkQeZ4kOekC/tJRHXSnBojug=;
 b=K/7fG593fQSMvFzzxAjdt7chTkKXLHC5aORetSxHQA0EB36u8cgtffQf4KtiXGj2rOp6IdshdwkexKo0f+CPD5XcKfOaasLpLaO8Rs4FleuPYbzsDww+x8EwzgA306sOVqB1Q4rezfmQkRoniW2NwcZ1g9UsBReNPNqyPhzFbWoVW+bZM72KKPTRPViqGbBYuPTzCBsm6BzmPF0WDaSguL5Gfbu4RaWpehMzh16GEAvpOwWLERzqr/91c956UBH09AR0IJr8GBhUF95AEUmO6kX9YbqlO9+amOplz9ysZSihTt4uCO9gqLXAPXxM2tc+ZEUBl+ztKwSym6lzCPDWDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3332.namprd18.prod.outlook.com (10.255.136.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 1 Aug 2019 07:35:42 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 07:35:42 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVQGZoAIAkO6cfhESDQvB+1ma7GabWTmUwgAAaH4CAACIW8P///zuAgAAjM0D//+s8gIAAJkZwgAADUt6AAIoGGoAAAwRXgAEppbWAAVqcJ4ACQ4I9gACTsOWABkWlEIAAj2PVgAD2Ml2AAAHqUoAAtif6gAADGGaAAMXfAA==
Date: Thu, 1 Aug 2019 07:35:42 +0000
Message-ID: <8e17641a-f7d7-2b5f-4083-4993aaea74c5@suse.com>
References: <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
 <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
In-Reply-To: <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR06CA0028.eurprd06.prod.outlook.com (2603:10a6:6:1::41)
 To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77560491-322c-4029-889c-08d71652dba5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3332; 
x-ms-traffictypediagnostic: BY5PR18MB3332:
x-microsoft-antispam-prvs: <BY5PR18MB3332678F77AC5076C2BD2288B3DE0@BY5PR18MB3332.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(189003)(199004)(102836004)(8936002)(316002)(386003)(229853002)(53546011)(6506007)(4326008)(6116002)(36756003)(76176011)(5660300002)(52116002)(186003)(66946007)(99286004)(26005)(66476007)(305945005)(64756008)(7736002)(31696002)(25786009)(86362001)(66556008)(71190400001)(66446008)(71200400001)(3846002)(256004)(81166006)(2906002)(14454004)(31686004)(6486002)(6436002)(68736007)(8676002)(81156014)(80792005)(6916009)(4744005)(53936002)(446003)(6512007)(478600001)(66066001)(6246003)(107886003)(54906003)(11346002)(2616005)(476003)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3332;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mEwH99mlqo/92PI/yp6GcABBwfm330wHLDz7vUZ2X06eDyIDpQK02lJ+sR2g6vai7jLIb1iiSEbvSJPXWKJx4xmcKWlyBz0yx49grwO2vv6f51sa9vVRHJMUeRDaWkAYffxLYTV8sWERLrUFTMzUoQCDZecNANw+QMDLp7DoVbFSpDFSbBNBJSR8SgwC+Zy35OwkyT600Fv9jxDwBhEn8itB3HUvJ/Fv1fnLP3sIbGh9PnO1hvdiKHcs8IlGdmEptSN7eQ4CnQzyri4EgrKGYDb5RBJWQfPxMVsqdiWvC9ZLvhieDYuKD6QXSOO1eLWo8WQ28h+K5BnJEem9oKqk5olvevCK1c+kZ4kqaTDdH3+QT2t2flzKe9OYdDHOJ40St7LcQYVii/4eim5en52B9fwcDCHe8EqY1lrs1E2L7LM=
Content-ID: <F67AEF9B47100049B1A0D2E16469B141@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 77560491-322c-4029-889c-08d71652dba5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 07:35:42.6071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3332
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
Cc: Juergen Gross <JGross@suse.com>, Roman
 Shaposhnik <roman@zededa.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDcuMjAxOSAyMTo0NiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gTXkgYmV0IGlzIG9u
IHRoZSBpbnRlbF9pb21tdV9sb29rdXBfcGFnZSgpIGNhbGwgaGF2aW5nIHNpZGUgZWZmZWN0c1sx
XS4NCj4gSWYgeW91IHRha2Ugb3V0IHRoZSBkZWJ1Z2dpbmcgaW4gdGhlIG1pZGRsZSBvZiB0aGUg
bG9vcCBpbg0KPiBybXJyX2lkZW50aXR5X21hcHBpbmcoKSwgZG9lcyB0aGUgcHJvYmxlbSByZXBy
b2R1Y2UgYWdhaW4/DQoNCldoaWxlIHlvdXIgZ3Vlc3Mgd2FzIHJpZ2h0IGFjY29yZGluZyB0byBS
b21hbidzIGxhdGVzdCByZXN1bHRzLCBJJ2QNCnN0aWxsIGxpa2UgdG8gbm90ZSB0aGF0IC4uLg0K
DQo+IFsxXSBMb29raW5nIGF0IHRoZSBpbnRlcm5hbHMgb2YgYWRkcl90b19kbWFfcGFnZV9tYWRk
cigpLCBpdCBkb2VzIDEwMCUNCj4gbW9yZSBtZW1vcnkgYWxsb2NhdGlvbiBhbmQgaGlnaGVyLWxl
dmVsIFBURSBjb25zdHJ1Y3Rpb24gdGhhbiBsb29rcyB3aXNlDQo+IGZvciB3aGF0IGlzIHN1cHBv
c2VkIHRvIGJlIGEgZ2V0dGVyLg0KDQouLi4gdGhlcmUgYmVpbmcgMCBwYXNzZWQgYXMgbGFzdCBh
cmd1bWVudCBpcyBzdXBwb3NlZCB0byBzdXBwcmVzcw0KYW55IGFsbG9jYXRpb25zIChhbmQgZnJv
bSBsb29raW5nIGF0IHRoZSBmdW5jdGlvbiBJIGNhbid0IHJlYWxseQ0Kc2VlIGFueSBzaWRlIGVm
ZmVjdHMgeWV0IGluIHRoaXMgY2FzZTsgYWxsIEkgZG8gc2VlIGlzIHRoYXQgdGhlDQpmaXJzdCBj
aGVjayBvZiAiYWxsb2MiIGNvdWxkL3Nob3VsZCBoYXBwZW4gYmVmb3JlIGxvb2tpbmcgdXANClBD
SSBkZXZpY2UgYW5kIERSSEQpLg0KDQpJJ3ZlIGFsc28gZG91YmxlIGNoZWNrZWQgLSB0aGVyZSBj
bGVhcmx5IGlzIGEgZmx1c2ggYWZ0ZXIgdGhlIGNhbGwNCnRvIHNldHVwX2h3ZG9tX3JtcnIoKS4g
SSdtIG5vdCBldmVuIGNvbnZpbmNlZCB0aGlzIGZsdXNoIGhhcyBtdWNoDQp2YWx1ZSwgc2VlaW5n
IHRoYXQgdHJhbnNsYXRpb24gZ2V0cyBlbmFibGVkIG9ubHkgYWZ0ZXJ3YXJkcy4NCg0KSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
