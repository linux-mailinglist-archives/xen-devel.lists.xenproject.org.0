Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DFD790B7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:22:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs8Ni-0000D4-AY; Mon, 29 Jul 2019 16:20:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hs8Ng-0000Cp-GO
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:20:12 +0000
X-Inumbo-ID: b9b03326-b21c-11e9-bd41-a7873761eb9a
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9b03326-b21c-11e9-bd41-a7873761eb9a;
 Mon, 29 Jul 2019 16:20:10 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 29 Jul 2019 16:20:07 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 29 Jul 2019 15:59:06 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 29 Jul 2019 15:59:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkGnrkNG8hNHEdiMLhGS1ei5mnT0gFTPoZ5KXWOxJiRV/UMQ0I8ULEApa+KThxPPzy1mGnvmTZs/4F6ajNMS3HruUfhj2RIqrUVui7V8n0nItjo3ZKP2cU2gijz8Ylq0za/wSY6/Tmrt0GsFSN6nVdijozUX7TMUTVxrlPGD6s3rFh26KrmgHWtA7psVCZIVQ+LP1TA/bpMJyCtjXRs3HqihQCDKg48Kiw3MBsbq0rTTt4o/YP/zq6CfV0Ay/MvXz6rnIbMqeF5DqZAoYwGCZZgKqxzh6Wdy3+fo56f/mH9nbeYB6N/7AGtvN44WFpQ7/RB7/p4LDXKjd+Xo8H2MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtZLIB5zou5BfyHT4QUc/dQ+sZllD1U2ga3yEzAuUuY=;
 b=ZLGn0XBa4Fel+prOuqHuzmTlPPwlj+uWnEdM5ZcmPiwHdf/8gNDOgKebfAarqZVr71lGwURvO7JqenawsVn8JhdqTTTgUf68k0jG8k34+aZdTCKkSlHTnv+0OUhki8okNjWwCHYsv6xEDKFIluuZdYqGHAOi+S7rptKRyPoHyDqDnhPzGNCqkc5a+MGcntk/B46WPVoHRjKOMymhASu9QRGybcn0LL7LcRtCS3x6eDiGYBUJT4/U5P8WSM6RyNG1AyBaL1KRf98bpbTuQCGm5kZe80tyr9SVbIMRZNgmkT/qVQRgIg44ZOqtUeVeZNsLgHyRSmh0tzaTlCCnc81ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3234.namprd18.prod.outlook.com (10.255.163.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 15:59:05 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 15:59:05 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
Thread-Index: AQHVPNaoMN4/6VqHlEm91bwrx18tx6bQMluAgAAkhnuAAARMgIAAAL3BgAAFHgCAAAROh4AACw0AgAACMMeAAAMOAIARWovcgAADNgA=
Date: Mon, 29 Jul 2019 15:59:05 +0000
Message-ID: <15085fb4-5e3f-e473-2716-55158cc90c1e@suse.com>
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
 <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
 <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
 <6e2986dd-5416-4ef3-c00b-eca4db578e7c@suse.com>
 <CABfawh=6vwfcRqHMrbgojduvvAk5jMJ_u=vOt=r-3sCiYGapoA@mail.gmail.com>
 <f3fc709b-d959-07f3-c047-a1da24816e09@suse.com>
 <CABfawhkvmiUoRLJaiCU4RwNpCRpcqRthTW9xZ0NLc6CCbS8-uQ@mail.gmail.com>
 <92678567-f9d1-aea4-52e8-d9e1fb6c12e2@suse.com>
 <36a73179-8c2b-4550-ce94-cb630b0b4ea9@citrix.com>
In-Reply-To: <36a73179-8c2b-4550-ce94-cb630b0b4ea9@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0020.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::30) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e24e6614-bb4e-4f35-07dd-08d7143dae7f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3234; 
x-ms-traffictypediagnostic: BY5PR18MB3234:
x-microsoft-antispam-prvs: <BY5PR18MB32345E8F70EEEC2312CD541EB3DD0@BY5PR18MB3234.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(189003)(199004)(6246003)(31686004)(53936002)(68736007)(4744005)(7736002)(8936002)(5660300002)(66946007)(66476007)(66556008)(64756008)(66446008)(305945005)(6512007)(3846002)(4326008)(8676002)(6116002)(81156014)(81166006)(14454004)(25786009)(478600001)(99286004)(102836004)(36756003)(52116002)(54906003)(76176011)(26005)(80792005)(316002)(2906002)(186003)(386003)(53546011)(6436002)(6506007)(71200400001)(446003)(229853002)(11346002)(2616005)(476003)(66066001)(71190400001)(256004)(6486002)(31696002)(6916009)(486006)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3234;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BvbmS6axb9huhcN8f/o2u5VufiCzQviNNvhX4/GjJmmIarNkA91M2Yoc/wqgcnHPAEy6N13GP5q59EXPLHbEbPLbOIuUAFgPr6lDgkLYPu+zTdOibzEPqwcvxXyzR4eP2tOoso4IDUHIg1Q1pl9jGnAE8YAlwPXCdgX667M+CrZdx0SZJMkm9ACU6T5zVtfGVbTM9ekff1M4C4iheExh+GE85VlPDlHDMlsOTEHCpRyC+Ju16Rgn020FAnVW50tpco3Awf+MGcHVWNqyGYPan7tP3MZDyArRE7SHdBReHr+LLuYt3I/XHitJxG6wU4OGIDjIpgoucWhFdFUZ8WO22yhkiqTYeQop00ASSUan9hFM6WE8p2oEIjFgDKyZVExCYSL+AZ3GKSbh+ETegnKmh+CvCfef/+9kcftZbwhH0xk=
Content-ID: <761A41DE5E93574CABB15671C585102C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e24e6614-bb4e-4f35-07dd-08d7143dae7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 15:59:05.2344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3234
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMjAxOSAxNzo0NiwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gNy8xOC8xOSAz
OjQ3IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IEFuZCBidHcgLSBpZiB5b3UganVzdCBzZW50
IGFuIHVwZGF0ZWQgZGVzY3JpcHRpb24sIEkgdGhpbmsgSSdkIGNvbW1pdA0KPj4gdGhpcyB3aXRo
b3V0IGZ1cnRoZXIgd2FpdGluZyBmb3IgR2VvcmdlIHRvIGZpbmQgdGltZSB0byBldmVudHVhbGx5
IGFjaw0KPj4gaXQuDQo+IA0KPiBUaGFua3MgLS0gYnV0IGl0IGxvb2tzIGxpa2UgbWF5YmUgeW91
IGRpZG4ndCBjb21taXQgdGhlIGZpbmFsIHBhdGNoIG9mDQo+IHRoZSBzZXJpZXMgKCJ4ODYvbWVt
X3NoYXJpbmc6IHN0eWxlIGNsZWFudXAiKT8NCg0KWWVzLCBiZWNhdXNlIG9mIG9iamVjdGlvbnMg
dG8gdGhlIGRhbWFnZSB0aGUgcGF0Y2ggYWN0dWFsbHkgZG9lcy4NCg0KSmFuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
