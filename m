Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3CD74C25
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:49:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqbEe-0002qv-M4; Thu, 25 Jul 2019 10:44:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqbEc-0002qq-Qr
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:44:30 +0000
X-Inumbo-ID: 2b1aa3cc-aec9-11e9-ab75-b3ea602c0b72
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b1aa3cc-aec9-11e9-ab75-b3ea602c0b72;
 Thu, 25 Jul 2019 10:44:25 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:44:13 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 10:38:49 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 10:38:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUWZolhxc/ZCaqG8gtu48nGd+WzngiPENXtWPj+N5Ya/qKW6ss6F2WNeQiu5ZkmbH6GplWXE3BO7aQV+iE8Sd2oMMMAxohAhlr5bdd+g5y6+huJ5Yrf7HjVJbMEcpZAOrFmo9gc6rAIaUsjQXBCVkueeo3E2gBduhml17RR1wSmZCydiINA+VaMgnQ4PduHaQmVbIvnUlPr10yBwcUWRhsmDlkNF+tAKFpyUEjFALmQ+qMPI1Pfb4iE1SJ/JFVi8UUodzN0pKBiMx9qaNpijXhoiy9PIj80fWOjoQPA9y34t1eZFDzYQhCNYJ6nJpJW44zuQPvAv91oJC+RbWM0Yxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+kqnQ2I+AP6J16iB+6XxcfE8h5BsdedpigvbjEMqjA=;
 b=nb4f5PHXcf9pp86e/ken58+8KHIbAOOwRi7I6Z+/2XJwt76G0rcCtGMmbBYtYR0FNizDmZjKjEjayAUZvr+uy0UU2z7uYDfmETP/f0gcMJ/BnayJQu1YIzXkd+AQdHUnKPM6HpppLH2iVkjaLrc3eIRxnyMW2UqOtjqJkRBqcHAa9rc1Mj4a/KWIjEyOik8z3ELcWF3fOML94KXe930fH+k+Kym2+mbIKEtGTkotXW6ErgThphtTQ2XxKo3DS+HSCv2jJJo1xc6B6rLKroMcc65H6Bk7PMowLwxTve+4AaiTtDox7w8RRaWbA4RjKoN4lrJEkjzicyY5Xn3xxJ4wUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3290.namprd18.prod.outlook.com (10.255.173.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 10:38:47 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 10:38:47 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 4/3] x86/dmi: Drop warning with an obsolete URL
Thread-Index: AQHVQkkL+bIdwDrMgU+wtySXaZ09cabbJbCA
Date: Thu, 25 Jul 2019 10:38:47 +0000
Message-ID: <4b30bcdb-6081-201c-3b89-b41536c7ac3b@suse.com>
References: <20190724174256.5295-1-andrew.cooper3@citrix.com>
 <20190724175538.6098-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190724175538.6098-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0377.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::29) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6bcefb3-ebf7-4846-4b69-08d710ec463e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3290; 
x-ms-traffictypediagnostic: DM6PR18MB3290:
x-microsoft-antispam-prvs: <DM6PR18MB3290D01AF69F72E17E4A7DD3B3C10@DM6PR18MB3290.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(199004)(189003)(64756008)(386003)(6506007)(53546011)(102836004)(66946007)(66476007)(76176011)(36756003)(52116002)(3846002)(14454004)(316002)(305945005)(6512007)(7736002)(6116002)(81166006)(86362001)(81156014)(486006)(66446008)(99286004)(2906002)(31696002)(66556008)(5660300002)(8936002)(6436002)(6486002)(25786009)(68736007)(80792005)(53936002)(6246003)(4326008)(11346002)(8676002)(26005)(229853002)(558084003)(31686004)(66066001)(446003)(54906003)(6916009)(71200400001)(256004)(71190400001)(2616005)(186003)(478600001)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3290;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xum5zgLugfGozd9dgpKTf3fc/sykoPFszS56bSQW9gkLbqQEu4xxRBptpQoykkB//20x7SEijgAcPoy4+AeDTGOFog5WPSmOo33aZFjZqMuBC3x84Hr1u0r4Rl5wM8YyrZI1dpGczas4rmRxMHbTPY6xyqUqMa4ZJRanNM17KzCUEG0fmSh/cRWpVJEQ6VUCPQG/OXUvimffV99jTRPmvpn7Bg5+oyMlqK5U9OLwq4MIiSsvts4kC3pVfb1X4jImrk1ey9ibpGx8H9rPdWF5FMUkXa15/xPTzL47AbUthCfIaRyZaksXohMdkKdMHZ5z+/umKc8CZkBB9NAIztt4HJkPSxOkNboPHzVcPTv0Y9rt54v5vIF6Zby0i4hvgRos53ulO/3uioEz/ANfiMtVCVqp1S+jvXJBEBkAGdFxMRg=
Content-ID: <74BE7B8082D5544A8DA053AE9F7E6EF1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bcefb3-ebf7-4846-4b69-08d710ec463e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 10:38:47.4367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3290
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 4/3] x86/dmi: Drop warning with an obsolete
 URL
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAxOTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhpcyBxdWlyayBk
b2Vzbid0IGNoYW5nZSBhbnl0aGluZyBpbiBYZW4sIGFuZCB0aGUgd2ViIHBhZ2UgZG9lc24ndCBl
eGlzdC4NCj4gDQo+IFRoZSB3YXliYWNrIG1hY2hpbmUgY29uZmlybXMgdGhhdCB0aGUgbGluayBk
aXNhcHBlYXJlZCBzb21ld2hlcmUgYmV0d2Vlbg0KPiAyMDAzLTA2LTE0IGFuZCAyMDA0LTA3LTA3
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4NCg0KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
