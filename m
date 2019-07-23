Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA73719F0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 16:07:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpvPi-0007vy-Ap; Tue, 23 Jul 2019 14:05:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpvPg-0007vt-Hk
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 14:05:08 +0000
X-Inumbo-ID: d8319231-ad52-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d8319231-ad52-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 14:05:07 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 14:04:54 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 14:03:29 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 14:03:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1QNwItVZ1xDfuofpjchY/W4Jbyv+UGzPBihUpCDW0Scnor9QmWpzlBGWlcWD37yRJR2IS1+y97lGfhmEok+TDdXtGGpxQmBSVbq9CV0mT9DK5mxp0K6IiWxlzXZfFJuY7pRZe/kRvVYRPZNxT95FXUKGqSlSeyCXbgRBs9bz0IGSHSRCKbXP52Be3jh0gib4lsKrITJYPoo/U8CZ2yX53Kyl7O2SQfgd5/CyWUzKH8KnzRUcBcjYQXjgx+Doz9psdkKj5JgDyHqnznaRvYOlpBDKSGnTGMkjWogjbOHgI2UJylGmqSz21uvywbb2iYwUD/WAPQQD0wrtyY+wYr03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGKspDcuZ8YNVJBgjd3xckuhB/93Dh4QgtD3KN9/k3g=;
 b=oCMC6/efE80VMZ22Vlo9bDSYyI00yOGo3Y06wcyWk9k+KCWf3xUUNV0jGGiSxNgwV9yWxX7hVqBabXmFxIHWwWdb1VL/vzyqdlV2SAQGGxbYEoIam6T9n8qs8dHR7zLIl+TV25A/pMIw6JQct1lqMEWxey+W2ViQoHCAQHIVoNvK2QDYEw540xBhHp/D1F08N+6+nmxxThr5RNUkx6EgVM8BdyiejMB6AV/Rhy5X9uMvyGdacp9GaY8BHg20PhH1OMGp0RL9cPDgDoX4gsx0eQ5LpcDfAp0f7rpMtAXrGlkgAN+KvgGi3elKNVESAJkleVK7Ov5ujQVIYTMYoDFezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6SPR01MB0073.namprd18.prod.outlook.com (20.179.55.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 14:03:22 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 14:03:22 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 2/2] xen: merge temporary vcpu pinning scenarios
Thread-Index: AQHVQTgCmOXaxQxPLUKxvpzXZTTLrabYJaWAgAARcbKAAAU4gA==
Date: Tue, 23 Jul 2019 14:03:21 +0000
Message-ID: <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
In-Reply-To: <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0200.eurprd07.prod.outlook.com
 (2603:10a6:6:42::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 565a553b-1712-4427-5823-08d70f768590
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6SPR01MB0073; 
x-ms-traffictypediagnostic: DM6SPR01MB0073:
x-microsoft-antispam-prvs: <DM6SPR01MB0073211C8F34CAE9F7556166B3C70@DM6SPR01MB0073.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(6636002)(6512007)(66476007)(6436002)(66446008)(66556008)(6862004)(66946007)(64756008)(102836004)(31686004)(6506007)(186003)(5660300002)(2906002)(25786009)(54906003)(99286004)(76176011)(80792005)(486006)(386003)(6246003)(4326008)(14454004)(53936002)(52116002)(229853002)(478600001)(6116002)(8936002)(14444005)(7416002)(305945005)(256004)(6486002)(31696002)(36756003)(26005)(8676002)(316002)(71190400001)(71200400001)(66066001)(3846002)(476003)(446003)(81166006)(81156014)(37006003)(7736002)(86362001)(2616005)(11346002)(68736007)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0073;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RSBhKG74amF3Vv2JdwXEjT9kRVusdV+yLACMalsQkSLPkVnt8ZT2QLcIUmb0xwkleYvLeBZlW8m8oeUFHprVIJfQU0ujPjavuzw5t53C9/oV9EdUEl7bJz7er0S76yR5D92WE09/vNh8SkqiAo2oHGNfBS1YKLp8iNelP0H92VZNKB5aq2I9d7sR4TRx1s7YeqYqUSoz2RcJakChFWt+kLrK+CEUscPvlN3lr+eP9GjPBQvjeyKVCrhk+lXTptjdRt3IuS6kxpecdXUeCjJg0wyvsMy7jL97pPNeARkDlgJta2CVU/Ym5DZXhGyW/epHMKzWbsfXpD5aeOnt1ggsFcuNL1endZmcdTDW8mDw52Cb49d5uwVd7A26xih7sfV1oJeBaoyoaidwDKiMtR6CGLG0z54VRjwFmJmlaUXb6Ds=
Content-ID: <6B27441AAF5116488A9C1D6126CF7C80@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 565a553b-1712-4427-5823-08d70f768590
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:03:22.0090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0073
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxNTo0NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjMuMDcuMTkg
MTQ6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gdi0+cHJvY2Vzc29yIGdldHMgbGF0Y2hlZCBp
bnRvIHN0LT5wcm9jZXNzb3IgYmVmb3JlIHJhaXNpbmcgdGhlIHNvZnRpcnEsDQo+PiBidXQgY2Fu
J3QgdGhlIHZDUFUgYmUgbW92ZWQgZWxzZXdoZXJlIGJ5IHRoZSB0aW1lIHRoZSBzb2Z0aXJxIGhh
bmRsZXINCj4+IGFjdHVhbGx5IGdhaW5zIGNvbnRyb2w/IElmIHRoYXQncyBub3QgcG9zc2libGUg
KGFuZCBpZiBpdCdzIG5vdCBvYnZpb3VzDQo+PiB3aHksIGFuZCBhcyB5b3UgY2FuIHNlZSBpdCdz
IG5vdCBvYnZpb3VzIHRvIG1lKSwgdGhlbiBJIHRoaW5rIGEgY29kZQ0KPj4gY29tbWVudCB3YW50
cyB0byBiZSBhZGRlZCB0aGVyZS4NCj4gDQo+IFlvdSBhcmUgcmlnaHQsIGl0IG1pZ2h0IGJlIHBv
c3NpYmxlIGZvciB0aGUgdmNwdSB0byBtb3ZlIGFyb3VuZC4NCj4gDQo+IE9UT0ggaXMgaXQgcmVh
bGx5IGltcG9ydGFudCB0byBydW4gdGhlIHRhcmdldCB2Y3B1IGV4YWN0bHkgb24gdGhlIGNwdQ0K
PiBpdCBpcyBleGVjdXRpbmcgKG9yIGhhcyBsYXN0IGV4ZWN1dGVkKSBhdCB0aGUgdGltZSB0aGUg
Tk1JL01DRSBpcyBiZWluZw0KPiBxdWV1ZWQ/IFRoaXMgaXMgaW4gbm8gd2F5IHJlbGF0ZWQgdG8g
dGhlIGNwdSB0aGUgTUNFIG9yIE5NSSBoYXMgYmVlbg0KPiBoYXBwZW5pbmcgb24uIEl0IGlzIGp1
c3QgYSByYW5kb20gY3B1LCBhbmQgc28gaXQgd291bGQgYmUgaWYgd2UnZCBkbyB0aGUNCj4gY3B1
IHNlbGVjdGlvbiB3aGVuIHRoZSBzb2Z0aXJxIGhhbmRsZXIgaXMgcnVubmluZy4NCj4gDQo+IE9u
ZSBxdWVzdGlvbiB0byB1bmRlcnN0YW5kIHRoZSBpZGVhIG5laGluZCBhbGwgdGhhdDogX3doeV8g
aXMgdGhlIHZjcHUNCj4gcGlubmVkIHVudGlsIGl0IGRvZXMgYW4gaXJldD8gSSBjb3VsZCB1bmRl
cnN0YW5kIGlmIGl0IHdvdWxkIGJlIHBpbm5lZA0KPiB0byB0aGUgY3B1IHdoZXJlIHRoZSBOTUkv
TUNFIHdhcyBoYXBwZW5pbmcsIGJ1dCB0aGlzIGlzIG5vdCB0aGUgY2FzZS4NCg0KVGhlbiBpdCB3
YXMgbmV2ZXIgZmluaXNoZWQgb3IgZ290IGJyb2tlbiwgSSB3b3VsZCBndWVzcy4gRXNwZWNpYWxs
eSBmb3INCiNNQyB0aGUgaWRlYSBpcy93YXMgZm9yIHRoZSBkb21haW4gdG8gYmUgYWJsZSB0byBh
Y2Nlc3MgdGhlIE1TUnMgaW4NCnF1ZXN0aW9uICgpLiBJaXJjLCB0aGF0IGlzLCBhbmQgcHJpb3Ig
dG8gdk1DRSBhcHBlYXJpbmcuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
