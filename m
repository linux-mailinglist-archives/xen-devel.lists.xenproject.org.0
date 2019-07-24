Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6693572B85
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 11:35:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqDdI-0001t7-OC; Wed, 24 Jul 2019 09:32:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqDdH-0001t2-IQ
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 09:32:23 +0000
X-Inumbo-ID: e45fd96c-adf5-11e9-a444-e7e8a78d7d2d
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e45fd96c-adf5-11e9-a444-e7e8a78d7d2d;
 Wed, 24 Jul 2019 09:32:17 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 09:32:05 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 09:28:28 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 09:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPkkGAIFAVRB+8dvr93vgSwMRdLQ1VEuvQMT4LD+zNE6JpcoYCFAJf0oWzMOu+PJl5Mx2kuSPG9mRV607J8KL386NpX+KAvWA3e1EQaMdu2TA7tNfTbHQH9+8THSbqfyi69p+z7Ew2+Weq1RDj8uBdZqQN++ft3XfKRPpZJUUDKpBf1NTduYtFPPYkk6uoRUsrBCnGx220211WKNjR/RIs8L+o+zjHTD4DVjcFE6f3D7zXA0tr0Wl1eKBHDg4JPxsYleqRHJ0mEomr5ZYCmBvrYazTkJCIzjGN3Wc6LE0BLllev5P498d+Ir1NZS0pVHP/tDq50dMntCrbO5K4RDqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jM96Hmj0W+NWh53jAw5p/viarNaUhEbWC49ZYoPe/0=;
 b=UsEq2Eu1BSV8Vjw26CD/M+nj3jZsIxrNsOxTqtOn+tsTUu7RrLhSLQj5dHqhY3PgmDmF7D4TY9MNq/1jCr0E3oSVYt/7VyNlUSgkm6ZGCsrSZVolJKgaja+DHdN8yEpTz60sNarQN3ar7+1zBlPceok1zKX4HAyaHaQ0Ty6ud+dyOxstw+GeYh64Ddc4oDx24jbG+yNer4Ma5T+tzmi3CYiA3z95YD8tLJDSebiQv8CYB0z6giy38kNchGRZT4XeK/XfvvlBD6ZY0tT4yUtyEnYBzupFAOaD0Y4Sm1EMyW6sDLM2YUWKTRgFVHTRhpAfejJkwATLckBSsc9oQc1BIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3281.namprd18.prod.outlook.com (10.255.137.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Wed, 24 Jul 2019 09:28:27 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 09:28:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [Xen-devel] preparations for 4.12.1
Thread-Index: AQHVPj2SYnjK2Jp9JUOJM4bdl2JgJKbYtrALgADRGYA=
Date: Wed, 24 Jul 2019 09:28:26 +0000
Message-ID: <253af22b-7983-5cbe-5d67-cb9a055dd854@suse.com>
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
 <20190723205929.GK3433@reaktio.net>
In-Reply-To: <20190723205929.GK3433@reaktio.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0021.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::31) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74477997-a009-4d84-f943-08d7101947e4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3281; 
x-ms-traffictypediagnostic: BY5PR18MB3281:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR18MB328196B0D51D0E7A82190FF9B3C60@BY5PR18MB3281.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(199004)(189003)(966005)(53936002)(6246003)(6116002)(6512007)(3846002)(66066001)(5660300002)(14454004)(25786009)(99286004)(4744005)(68736007)(316002)(80792005)(66574012)(54906003)(31686004)(7736002)(76176011)(52116002)(305945005)(6506007)(53546011)(71190400001)(6436002)(71200400001)(102836004)(4326008)(26005)(31696002)(6916009)(86362001)(478600001)(256004)(14444005)(386003)(2906002)(229853002)(476003)(2616005)(446003)(11346002)(6306002)(81156014)(81166006)(36756003)(66446008)(486006)(66556008)(66476007)(6486002)(64756008)(66946007)(8676002)(8936002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3281;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: seEe33PdLotjx3wbnmjVhXPL2HGeps0kVWkqoCazCNaaSCvcwlyWWf7tNEIUy47ZPBQq4gcX6NOKax3/08whloHnTANXtXZ6kDFMZ2Ui7c8hV4Auvpuw74Gou5oI0dvlnBhpno0z1VBmirlvLHhcBG4dFGsEV+ac25Q+O/CroKDRBETZMGsul5a32WHrW6slF8GVOMuFI2zu/SjftqEUE1PLpmJCvYSks2fUiwe/RYzxggWrebvZTYwuNn5Wz2BYBuGag4sAsCCvWH2bAxBmYZXSP7K3qZx2mOtqcTn3UJwE9iXqTjofo/498iHfP6qik8QAksCydqiTeOiassSg75hMaEsdI0ROftA5XZw1XksvvleLjnSw6nsmFQvnGRV4C6EvSFUZJYMKjjDhzYdV2fGnM4V7wdF9TXoSltX/W+Q=
Content-ID: <FFA5CB3EBC9DBB4E896DAA4A0575458C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 74477997-a009-4d84-f943-08d7101947e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 09:28:26.7107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3281
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAyMjo1OSwgUGFzaSBLw6Rya2vDpGluZW4gIHdyb3RlOg0KPiBJJ2QgbGlr
ZSB0byByZXF1ZXN0IGJhY2twb3J0IG9mIHRoZSBmb2xsb3dpbmcgY29tbWl0IGZvciA0LjEyLjE6
DQo+IA0KPiAibGlieGw6IGZpeCBwY2kgZGV2aWNlIHJlLWFzc2lnbmluZyBhZnRlciBkb21haW4g
cmVib290IjoNCj4gY29tbWl0CWMxOTQzNGQ5Mjg0ZTkzZTZmOWFhZWM5YTcwZjVmMzYxYWRiZmFi
YTYNCj4gDQo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29t
bWl0O2g9YzE5NDM0ZDkyODRlOTNlNmY5YWFlYzlhNzBmNWYzNjFhZGJmYWJhNg0KDQpJYW4sIHRo
YXQncyBzb21ldGhpbmcgZm9yIHlvdSB0byBjb25zaWRlci4NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
