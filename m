Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EA87BF05
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 13:15:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsmW8-0000xo-Lw; Wed, 31 Jul 2019 11:11:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsmW7-0000xj-18
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 11:11:35 +0000
X-Inumbo-ID: f3ed890c-b383-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f3ed890c-b383-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 11:11:33 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 11:11:31 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 11:00:52 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 11:00:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jxew/CdFJ19E0r+qZ39pOrVAfikMf6uX9Nq/XB6AqH02x2fo7E0L/jeYdckQbMGN1/FNsIVFoa4DWsEJOntFWbAurGz98maa6/b63QhdpCip6AQ1GDk6i6x8KiQngESfHLFxjTS+BmAfJ2EPA98tSNuLsU/kZQCenxMZk/S9jGxACCkUd7C7uUzo+CBKvx+MFd/bIMSsQcqZRadtjeqDIesqsIGIbxN35vTnm+5NQ6J0s1L3WU59gqihpSEIn2Qho00egGqOHD+Lt0eAV0f8nOEdn1Ksm/NMejU8r8zqEl2ydrnflNQnzprgy9OAbSLlOw32hQ+mYXkZT/rAGyLnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFfV6oer0A5iCfDOSVr3yJSed0xs146tMYb4A6Z4KGM=;
 b=JqAy2cOLGXEMbKiaVDOCN9EmVODKVl9gE6VgOc0Y4UHbhSzU3dssxfKSDzE60Gaq0vJCjHf8kiqBpkOB0xcUOtikpo4YxNF7IKE459FkVhMw52BV0AlfOkOkavFePz2iM+9FEuiQw9DU595Rjt3ncqwaiYbLK3XSRXLx36tko7RU1rhUqDquqbs5mXiLyWAqA+YRQSe9eGel1ZwtIU5uNOTXvkrFtvJOGjz8HlWyqTTP9mNWMW2cIzorE4MNkDVwQz7D1OpoKQw1DsnoT/rzBYwz3S6AEVmIwE5SZJIEIalNlUk/etWUa13ioO1dC1Ec6WgAltpJmDIuZp234GzRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3002.namprd18.prod.outlook.com (20.179.107.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Wed, 31 Jul 2019 11:00:51 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 11:00:51 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/boot: Fix build dependenices for reloc.c
Thread-Index: AQHVRvlh35Y0aLssukeaGZj6K0FuCqbkkHaA
Date: Wed, 31 Jul 2019 11:00:51 +0000
Message-ID: <0ea3770b-39aa-0b71-6cfd-3d849142bb05@suse.com>
References: <20190730170754.31389-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190730170754.31389-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::13)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a662e9c-69ac-459a-ac5a-08d715a659c0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3002; 
x-ms-traffictypediagnostic: DM6PR18MB3002:
x-microsoft-antispam-prvs: <DM6PR18MB3002C6ABFE42B7254A737EFBB3DF0@DM6PR18MB3002.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(189003)(199004)(14454004)(66446008)(76176011)(66946007)(5660300002)(386003)(66476007)(53546011)(80792005)(6506007)(486006)(64756008)(446003)(66556008)(2616005)(6436002)(52116002)(3846002)(53936002)(6916009)(6486002)(31696002)(25786009)(229853002)(11346002)(6512007)(102836004)(476003)(6116002)(86362001)(478600001)(71200400001)(7736002)(68736007)(81166006)(26005)(186003)(2906002)(305945005)(31686004)(8936002)(8676002)(66066001)(4744005)(99286004)(36756003)(316002)(256004)(4326008)(54906003)(6246003)(71190400001)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3002;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c20E1woX4RA4jic6gFAShWDGm0BKLL9W3E/oq1xvpFXaPMqBy/EAGJd/CdJv8hCwLB1DfcY2o7EJ1wJ1XACEH5c2oiKJDOgLtbX/cbSfihmDSnG7u0sKLjCpb3a8FFPkRaPPJ7hB9y2SojBkQ1V80x5X3RGqWBGnXKQd/TqhcDmBtncJIHRuLTVfSSapDrM3Q5aND4k2mhNVnGBepPrSDBF9n82rH17qzVT1f+fINGpccnk47ImXSRtc/FH25Yvox/VP0V4ZSwBxdi3bWRBmUoWnpLrip/SroIK/yTMCXZRRonNP96eGbnHsP91QD0OsLzlm03PJkgZsU9655bCuEQTk12UpGrlB602FJsLT6+qAmWLV1iH7eQ+S/Q3p5MnCa3QtRNrt9GgzTfdI/98NXg7VNyR0Ov6EsyFFcr5wfcA=
Content-ID: <BC423B19C4A0824A8AF233BB016242AB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a662e9c-69ac-459a-ac5a-08d715a659c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 11:00:51.3446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3002
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/boot: Fix build dependenices for reloc.c
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxOTowNywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gYy9zIDIwMWY4NTJl
YWYgYWRkZWQgc3RhcnRfaW5mby5oIGFuZCBrY29uZmlnLmggdG8gcmVsb2MuYywgYnV0IG9ubHkg
dXBkYXRlZA0KPiBzdGFydF9pbmZvLmggaW4gUkVMT0NfREVQUy4NCj4gDQo+IFRoaXMgY2F1c2Vz
IHJlbG9jLmMgdG8gbm90IGJlIHJlZ2VuZXJhdGVkIHdoZW4gS2NvbmZpZyBjaGFuZ2VzLiAgSXQg
aXMgbW9zdA0KPiBub3RpY2VhYmxlIHdoZW4gZW5hYmxpbmcgQ09ORklHX1BWSCBhbmQgZmluZGlu
ZyB0aGUgcmVzdWx0aW5nIGJpbmFyeSBjcmFzaA0KPiBlYXJseSB3aXRoOg0KPiANCj4gICAgKGQ5
KSAoWEVOKQ0KPiAgICAoZDkpIChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioNCj4gICAgKGQ5KSAoWEVOKSBQYW5pYyBvbiBDUFUgMDoNCj4gICAgKGQ5KSAoWEVO
KSBNYWdpYyB2YWx1ZSBpcyB3cm9uZzogYzJjMmMyYzINCj4gICAgKGQ5KSAoWEVOKSAqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ICAgIChkOSkgKFhFTikNCj4gICAg
KGQ5KSAoWEVOKSBSZWJvb3QgaW4gZml2ZSBzZWNvbmRzLi4uDQo+ICAgIChYRU4pIGQ5djAgVHJp
cGxlIGZhdWx0IC0gaW52b2tpbmcgSFZNIHNodXRkb3duIGFjdGlvbiAxDQo+IA0KPiBSZXBvcnRl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
