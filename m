Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CD971B1D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 17:10:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpwOL-00049Z-Tc; Tue, 23 Jul 2019 15:07:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpwOK-00049U-Gq
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:07:48 +0000
X-Inumbo-ID: 9945bea0-ad5b-11e9-af50-5b8bc3e15bd5
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9945bea0-ad5b-11e9-af50-5b8bc3e15bd5;
 Tue, 23 Jul 2019 15:07:46 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 15:03:42 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 15:04:07 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 15:04:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLJWyDw56InSDJ0bZCR1Tcjx8ATNYoJP/fXLuBQwX7tVZngpTS2fGvWm2EIWDXJqxDGIIRdWuia+ztiQtDe+EgyTNCc74wOv6lrhm1b3AbbZ5PCEzNeonBJa2PsZI7u7naSH0nuiwqmjw/0t/gAIn2yZnLyCru22Od4sOQ8n8lMako0e6bYsgxAzXqRFExKx/RJrWW/BQuwY+ripgkMVyOKcqjjR3LjWq9yEU/2UsH4atC88FQT4gEOe28sWI+8qiMp6gwFFfD/rnoodEUEKn80c8JUGez1QGumm+MGbsKdH/I1znZfxMYN4mOy0gHItFQ+prU/Dulp1tgGF6xvQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7vltMln1+TkLiSogUpdiQo5vgqynBCwuZHqvuJbnp4=;
 b=kCioNJa9h9/TOAw2mE5ft/dUx07pCMCZHKmN1lb4FaO0QbmAYFa3u6u+JIYu/9yy800w2EO7eiBzaxa4pdyjLXSKswoGp6a4zhlWxOquBIi4VM/xuKS/4s8wtEMA6lgX5iAhVFUhRI0xrTZwwII/HEwW9+hwfg1ZwImnUr0LwEhZ5uZqCSFN2oP6/N4LlxMq3QgFWI0rlfzojYFDIn7bg+CoBlb9JbP6Ket+EgMFOCAXSlh1+f28XQin51Jpnlao5MaY7SL0YXBjv+1v2KqQA98dTV+kZ1pUayhkZQnre3kyAy0/l4W+Zkb8NcVMf30aG8L6rw6l3AivKWbo7ujDKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3227.namprd18.prod.outlook.com (10.255.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 15:04:06 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 15:04:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
Thread-Index: AQHVQTgCmOXaxQxPLUKxvpzXZTTLrabYJaWAgAARcbKAACa/gP//4aOAgAAEQOaAAAmMAA==
Date: Tue, 23 Jul 2019 15:04:06 +0000
Message-ID: <0da102f5-6f61-4a14-5c07-3ac92f4db68c@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
 <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
 <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
 <fd38498a-2918-8cb1-3575-044ecbdd423e@suse.com>
In-Reply-To: <fd38498a-2918-8cb1-3575-044ecbdd423e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::22) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15156e79-5e45-422a-a8ed-08d70f7f01ba
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3227; 
x-ms-traffictypediagnostic: DM6PR18MB3227:
x-microsoft-antispam-prvs: <DM6PR18MB322764697933BCBAFC41CE37B3C70@DM6PR18MB3227.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(189003)(199004)(229853002)(6246003)(2906002)(66066001)(4326008)(80792005)(26005)(66446008)(53936002)(64756008)(14444005)(66556008)(31696002)(66476007)(316002)(6862004)(7416002)(7736002)(256004)(6636002)(305945005)(6486002)(86362001)(6436002)(486006)(476003)(478600001)(68736007)(8936002)(52116002)(81166006)(25786009)(6506007)(386003)(2616005)(76176011)(102836004)(11346002)(53546011)(446003)(8676002)(186003)(6512007)(37006003)(66946007)(71200400001)(14454004)(71190400001)(6116002)(3846002)(54906003)(31686004)(36756003)(81156014)(5660300002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3227;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bl2CvPNs6N04k/Saz/9mJOsskApNZKu4Hy4nr2m0WDJwnxYL0KvIJUN9KsQPw6kKiYMXAUFvvTOcSpbBtyP911mNs2w2nWcSqj7sExoyQCfLqtH7omze2oHNeoZE+qEWw2YeLT68i+mK2O3A5Cb03IaURvJalX31KopgJ/wboDSQhkmthDiIDwC4PHvk7DiA1PikTBLC0erkMrDZ0Tst0xz8KiGIkM21bQ0Lwz47z9TBpRb6htX2QjKPM08JtrQP8kKqnsMbmqtY/Qnzr/uz5h//fUFW+GaxexXsfkrdXpU3iv9D7rVWljCk/jLERQ/2MMsSnzdbFol5IJmFWLmqrJY7+RVrzmx859Sam01aorTX3ExbWHWbxKkMCLMTfDlODGEHlB+SzzvhkOvI49FZQ2tKr8oTjWS5j/U9WAM2I5U=
Content-ID: <32EDE1B58718C84D85B62E9A1EC18170@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 15156e79-5e45-422a-a8ed-08d70f7f01ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 15:04:06.2566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3227
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMjAxOSAxNjoyOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjMuMDcuMTkg
MTY6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjMuMDcuMjAxOSAxNjowMywgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4gT24gMjMuMDcuMjAxOSAxNTo0NCwgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4+Pj4gT24gMjMuMDcuMTkgMTQ6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gdi0+
cHJvY2Vzc29yIGdldHMgbGF0Y2hlZCBpbnRvIHN0LT5wcm9jZXNzb3IgYmVmb3JlIHJhaXNpbmcg
dGhlIHNvZnRpcnEsDQo+Pj4+PiBidXQgY2FuJ3QgdGhlIHZDUFUgYmUgbW92ZWQgZWxzZXdoZXJl
IGJ5IHRoZSB0aW1lIHRoZSBzb2Z0aXJxIGhhbmRsZXINCj4+Pj4+IGFjdHVhbGx5IGdhaW5zIGNv
bnRyb2w/IElmIHRoYXQncyBub3QgcG9zc2libGUgKGFuZCBpZiBpdCdzIG5vdCBvYnZpb3VzDQo+
Pj4+PiB3aHksIGFuZCBhcyB5b3UgY2FuIHNlZSBpdCdzIG5vdCBvYnZpb3VzIHRvIG1lKSwgdGhl
biBJIHRoaW5rIGEgY29kZQ0KPj4+Pj4gY29tbWVudCB3YW50cyB0byBiZSBhZGRlZCB0aGVyZS4N
Cj4+Pj4NCj4+Pj4gWW91IGFyZSByaWdodCwgaXQgbWlnaHQgYmUgcG9zc2libGUgZm9yIHRoZSB2
Y3B1IHRvIG1vdmUgYXJvdW5kLg0KPj4+Pg0KPj4+PiBPVE9IIGlzIGl0IHJlYWxseSBpbXBvcnRh
bnQgdG8gcnVuIHRoZSB0YXJnZXQgdmNwdSBleGFjdGx5IG9uIHRoZSBjcHUNCj4+Pj4gaXQgaXMg
ZXhlY3V0aW5nIChvciBoYXMgbGFzdCBleGVjdXRlZCkgYXQgdGhlIHRpbWUgdGhlIE5NSS9NQ0Ug
aXMgYmVpbmcNCj4+Pj4gcXVldWVkPyBUaGlzIGlzIGluIG5vIHdheSByZWxhdGVkIHRvIHRoZSBj
cHUgdGhlIE1DRSBvciBOTUkgaGFzIGJlZW4NCj4+Pj4gaGFwcGVuaW5nIG9uLiBJdCBpcyBqdXN0
IGEgcmFuZG9tIGNwdSwgYW5kIHNvIGl0IHdvdWxkIGJlIGlmIHdlJ2QgZG8gdGhlDQo+Pj4+IGNw
dSBzZWxlY3Rpb24gd2hlbiB0aGUgc29mdGlycSBoYW5kbGVyIGlzIHJ1bm5pbmcuDQo+Pj4+DQo+
Pj4+IE9uZSBxdWVzdGlvbiB0byB1bmRlcnN0YW5kIHRoZSBpZGVhIG5laGluZCBhbGwgdGhhdDog
X3doeV8gaXMgdGhlIHZjcHUNCj4+Pj4gcGlubmVkIHVudGlsIGl0IGRvZXMgYW4gaXJldD8gSSBj
b3VsZCB1bmRlcnN0YW5kIGlmIGl0IHdvdWxkIGJlIHBpbm5lZA0KPj4+PiB0byB0aGUgY3B1IHdo
ZXJlIHRoZSBOTUkvTUNFIHdhcyBoYXBwZW5pbmcsIGJ1dCB0aGlzIGlzIG5vdCB0aGUgY2FzZS4N
Cj4+Pg0KPj4+IFRoZW4gaXQgd2FzIG5ldmVyIGZpbmlzaGVkIG9yIGdvdCBicm9rZW4sIEkgd291
bGQgZ3Vlc3MuDQo+Pg0KPj4gT2gsIG5vLiBUaGUgI01DIHNpZGUgdXNlIGhhcyBnb25lIGF3YXkg
aW4gM2E5MTc2OWQ2ZSwgd2l0aG91dCBjbGVhbmluZw0KPj4gdXAgb3RoZXIgY29kZS4gU28gdGhl
cmUgZG9lc24ndCBzZWVtIHRvIGJlIGFueSBzdWNoIHJlcXVpcmVtZW50IGFueW1vcmUuDQo+IA0K
PiBTbyBqdXN0IHRvIGJlIHN1cmU6IHlvdSBhcmUgZmluZSBmb3IgbWUgcmVtb3ZpbmcgdGhlIHBp
bm5pbmcgZm9yIE5NSXM/DQoNCk5vLCBub3QgdGhlIHBpbm5pbmcgYXMgYSB3aG9sZS4gVGhlIGZv
cmNlZCBDUFUwIGFmZmluaXR5IHNob3VsZCBzdGlsbA0KcmVtYWluLiBJdCdzIGp1c3QgdGhhdCB0
aGVyZSdzIG5vIGNvcnJlbGF0aW9uIGFueW1vcmUgYmV0d2VlbiB0aGUgQ1BVDQphIHZDUFUgd2Fz
IHJ1bm5pbmcgb24gYW5kIHRoZSBDUFUgaXQgaXMgdG8gYmUgcGlubmVkIHRvICh0ZW1wb3Jhcmls
eSkuDQoNCldoYXQgY2FuIGdvIGF3YXkgaWYgdGhlICNNQyBwYXJ0IG9mIHRoZSBsb2dpYy4NCg0K
SmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
