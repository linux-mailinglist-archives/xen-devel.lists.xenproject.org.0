Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4DB713DD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 10:22:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpq1U-00079C-T8; Tue, 23 Jul 2019 08:19:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpq1S-000792-Va
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 08:19:47 +0000
X-Inumbo-ID: 9e4cdf37-ad22-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e4cdf37-ad22-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 08:19:45 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 08:19:31 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 08:19:27 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 08:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/IDNCtWzWBHUZkFgw3noa+6m5EEyELUp2wxcoFaCWuOx4qwtPCTKRDr0rBudx65EvQc/NowygDOR5HeQVryytsCufF6oGxneflMnj58I86ZQ3+o4EyQ5ycAtmqgsmHvZRgFmAOymbEfUucGWDZ4nJ3ZYX8SCV9aVTQPFsEIntyKrsLKCoAA/Itb4/LJJwYmaBGv/BslfdjLemngyeoyifl8HOLpjK96UiDVTvNpn076pEuW8n6R7TfChAU0dgTvB4txIoB91S6GTJiPhEhQb5AkDURyCZAJRDxn6ilRR0K17+P7bsjWM7hWgjrEaduQcSShpDfJLZ/6PHeZinvKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM1962bKAm8ahbhg1jm2HCZQaBSbtEFmaCG8XqKSxWc=;
 b=c0+wuyaGv+SnEgiOnGt+HIAAyZzROB57jObHV7Kt5U7R2FnAZVDwwA4jzgUV6qoDbZianej4rPgixenxuKiTD0zP221KPf6a08dVh/CmstonxZ+IdUKdWgqmQfcFUyaNixRhorWOtW58FEqRjgWjrTUFaDqACkTNSVqm+eNOTd4yY3DFd/7VAxlO3KPuKKsmMiY3MVheOJz3VukPCQq8eR0xWVAKT7B3x9exxz3g8TcDTXOSUV/6HVaLSGO5zoooau/jPyPLZy9W8U+vReb6Q4JoapBEKfUzDSelpt3JzHU8V+L1ROGKnT2ptP1spvoRgE7f2AOkV7ueV1kb/3JtQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2971.namprd18.prod.outlook.com (20.179.52.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 08:19:26 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 08:19:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: Re:[PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
Thread-Index: AQHVO/TlAPsnkpqPo0+X2y95y9fr6KbSNr9CgARDQ4CAADOwm4AAFvIAgAAMdA+AATWQAP//4BSA
Date: Tue, 23 Jul 2019 08:19:25 +0000
Message-ID: <1516b0ce-0853-c3f7-0519-71f116c75c81@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <94c28919-81cd-e6fa-aa43-e05dfea7cbed@suse.com>
 <9612f97f-904d-7b72-cff9-ead2e8590ffc@citrix.com>
 <9c6a7b4b-af52-c93d-480f-f34334de868a@suse.com>
 <aeb53abe-af9e-37ba-9f25-90b6b30192fc@citrix.com>
 <dc1481ff-4c18-cf0b-cff7-1f2866b6ad40@suse.com>
 <c25f432f-5408-83ce-26f4-fe9a0edf4e46@citrix.com>
 <4266c118-7a89-ed64-6196-52a82ec6e42a@suse.com>
In-Reply-To: <4266c118-7a89-ed64-6196-52a82ec6e42a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0339.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::15) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e842af6e-e0c6-47ff-5587-08d70f46796f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2971; 
x-ms-traffictypediagnostic: DM6PR18MB2971:
x-microsoft-antispam-prvs: <DM6PR18MB297135B98CD9A6714BA4935BB3C70@DM6PR18MB2971.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(189003)(199004)(8936002)(305945005)(76176011)(14454004)(102836004)(476003)(8676002)(81156014)(478600001)(6916009)(386003)(6506007)(3846002)(53546011)(486006)(6116002)(256004)(7736002)(446003)(26005)(2616005)(11346002)(186003)(54906003)(68736007)(52116002)(80792005)(4326008)(5660300002)(6512007)(2906002)(4744005)(66066001)(53936002)(71190400001)(71200400001)(66556008)(66476007)(66446008)(66946007)(64756008)(31686004)(86362001)(6436002)(31696002)(36756003)(81166006)(6486002)(25786009)(316002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2971;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FYDPhB71fjr9iQHwzYOoultJsCzq55hjx0g31LRpiLIx0Aw/RVe58f1QsCXWxq1BWfl8T/1CLxqpZy2LFJNVuixZMb/07mkl+DZ8UdtoFSBd1Tb2qTlfbRXepWEOXV5QB2V1fLrUl1x/tG5kPQyYQors2sjG8QVpA/wA7t4MWHYUpITziItU3+SpB/YJwsGJTPGz/w5J/xBMTd/4oXlJ3cLSEUtT2zlOytT6zz+RwYsmuezldCxWB6Yfv6PyB0TPDHtYzyD4lW8SoIqnGaqCEHwN11PRusZgvfR/H0ZEIhRDHOkKWk+YEMwx5gbeUHN2RMYta769buiUI4xjI96Zet7BEHlst3lliorWmwrGit77I1BL3L9kaYKrnujNCD77xm59ilxDARHJPBgZrZXmxqwfntiPNxD2ZWaMltY54zI=
Content-ID: <A5E3D63CC2CFEA479FB6439A14F09E22@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e842af6e-e0c6-47ff-5587-08d70f46796f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 08:19:25.8589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2971
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 BrianWoods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxMDoxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIyLjA3LjIwMTkg
MTc6NDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBIb3cgd291bGQgeW91ciBhcmd1bWVudCBj
aGFuZ2UgaWYgdGhlIElPTU1VIHdhcyBhIHJlYWwgQ1BVIHJ1bm5pbmcgcmVhbA0KPj4geDg2IGNv
ZGU/wqAgSXRzIGludGVyZmFjZSB0byB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtIHdvdWxkIGJlIGlk
ZW50aWNhbCwNCj4+IGFuZCBpbiB0aGF0IGNhc2UsIGl0IHdvdWxkIG9idmlvdXNseSBuZWVkIGFu
IHNtcF97cix3fW1iKCkgcGFpciBmb3INCj4+IGNvcnJlY3RuZXNzIHJlYXNvbnMuwqAgVGhpcyBp
cyB3aHkgc21wX3dtYigpIGlzIHRoZSBvbmx5IGFwcHJvcHJpYXRlDQo+PiBjb25zdHJ1Y3QgdG8g
dXNlLg0KPiANCj4gSXQgd291bGRuJ3QgY2hhbmdlIGF0IGFsbC4gV2hhdCBtYXR0ZXJzIChhcyBw
ZXIgYWJvdmUpIGlzIHRoZQ0KPiB1bmRlcnN0YW5kaW5nIHRoZSBPUyBoYXMsIGkuZS4gd2hhdCBp
cyBiZWluZyBzdXJmYWNlZCB0byBpdCBhcyBDUFUuDQoNCk9oLCBidHcgLSBJJ3ZlIGdvdCBjdXJp
b3VzIHdoZXRoZXIgd2UgY291bGQgdXNlIExpbnV4IHNvdXJjZXMgZm9yDQphcmJpdHJhdGlvbi4g
V2hhdCBJIGZvdW5kIHRob3VnaCBpcyB0aGF0IHRoZXkgZG9uJ3QgdXNlIGFueSBiYXJyaWVyDQph
dCBhbGwgLSBzZWUgbW9kaWZ5X2lydGVfZ2EoKS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
