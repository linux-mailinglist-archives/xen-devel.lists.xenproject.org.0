Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA796F94A8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 16:47:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUYKZ-0007FQ-0J; Tue, 12 Nov 2019 15:43:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ob2=ZE=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1iUYKY-0007FL-56
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 15:43:46 +0000
X-Inumbo-ID: 322de6ec-0563-11ea-a21f-12813bfff9fa
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 322de6ec-0563-11ea-a21f-12813bfff9fa;
 Tue, 12 Nov 2019 15:43:43 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 12 Nov 2019 15:43:01 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 12 Nov 2019 15:40:42 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 12 Nov 2019 15:40:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNpgSiKKZp2L8ApBDJPW6kgfq41M77YRvN0hE5qcpuMfE/zrr+5HUcITgL2tZHT6hPHJ0sA7LrW6AunGRxqkafs0QbSn/LeggD29bwD9aSsnoihCyIwPeOYDf7yH7r3qM6+v2uSSV44w5UWR3M8XQJHIYx0MHflikWYdwcTI4G81WLZiDRksvq3YhwdNcuC9ltmHH/e/MGiADWRhqPkTXx4ChyfBCrQo0Bewq3XyTRKsDRe52Spw+qIlObV5TvRGBxJsuhdUTlSsrBuuTYoooT2MPsT5KDN3Di+QUXEr4pnTiT/vBIa+Bgpf7VcZAsipArZbKziWFJmW8b3Myh5uKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gBVMxYTVHPwJ7hhWCClwJ0xWpjj03XcsLajFbCZ/TE=;
 b=StdfOEYMzEewNNCtYHRFaNNuU74LC95CzHanT2Oi8b+C5JzrgaIpd/DpmabiZNNeVv4XK77M6ubzaqKai2VUigZFpd58i+Ahcg0QHdtUl2ImVsPDh73m2uCkkIzJ4ECa43QluwRKBvj1w5n31QeZ5/m/SQcvQE8L5Jt3yH4uDoP9eZBPS6zHX41Gh3WkAVgdJfgG3JVNQiatcoY1cQ2NMAVtn75Pu/d4U99ILntXCX5Bv1l+Omf1J5gN4s/1P162w2iQqA74Lox/WMRJQhGCkF0+mSnNRsGxQWn98TSNFr34Yy0rOIevL8sgRwxBzPcpuHi/M+7JhUE49uFFEkT7CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3329.namprd18.prod.outlook.com (10.255.137.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 15:40:41 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::c8de:408d:71ed:551c]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::c8de:408d:71ed:551c%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 15:40:41 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [OSSTEST PATCH 1/2] ts-libvirt-build: Provide PKG_CONFIG_PATH
Thread-Index: AQHVmVI7cHFevYomN0alPs/WNgSR96eHrGyA
Date: Tue, 12 Nov 2019 15:40:41 +0000
Message-ID: <38b0ce49-d9ab-047b-90fb-7a468f8163ab@suse.com>
References: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
In-Reply-To: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR16CA0017.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::30) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [137.65.135.33]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa857dd9-fabf-4399-d891-08d76786ac63
x-ms-traffictypediagnostic: BY5PR18MB3329:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB3329ABC5891FDED7FAD455BCC6770@BY5PR18MB3329.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(189003)(199004)(174874002)(102836004)(6506007)(386003)(36756003)(76176011)(99286004)(8676002)(52116002)(6486002)(31696002)(66066001)(53546011)(478600001)(25786009)(31686004)(6116002)(3846002)(446003)(486006)(476003)(2616005)(11346002)(6436002)(2906002)(186003)(8936002)(26005)(5660300002)(229853002)(66946007)(110136005)(81166006)(66446008)(6512007)(4326008)(66476007)(64756008)(81156014)(316002)(66556008)(2501003)(71200400001)(86362001)(14454004)(107886003)(6246003)(305945005)(6306002)(71190400001)(256004)(7736002)(966005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3329;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K2JABcfhNYDUFihxu3MGT/kJM4qPVA938jwf6MgZv21WALh7Qg6NQqBTeG8zACBsgI1COdGKLh30XlfH70qfFblkidnJ0kiPOZENgWCw9Y0rorNx1+ndbhCmyLRinC2N1xODNelHEbQBSZn+YEd0mjxCohn6lt0F4zC5ViUtm2Pi3mxQsbCbHdHRF7XW+0tlcfb5KEQPgPAZyURrUjaKURdwskSoDdP1oJMEFBlXGFHS7nb1iLD8zMweUTWoDsf6itWeKu8X3bg6fD9fvz23R3aLFrR8cjJPW8t4oEbBoWhUYk9jhU171O2uXNMuZTOsKtU1LT7n8ljmiW3oNBrt45iPYzlRYUsYqQmb0bbdefgVtDtu3VrCVr9PoQklFey4rF6h0hTv7wxlsYIZPYeiWPMLDi8iu4UAYDg95v2gIPt0wQ02jTBbdGE5R9cwL38MH+fnX0oHy/N8eHx2fAoDHwUuQRDnGFNKA+o5/MV8HWQ=
Content-ID: <72B7B3C806DCF6479E78B7B0C2980B9C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fa857dd9-fabf-4399-d891-08d76786ac63
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 15:40:41.4456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cdEtfRVuPbSWK4SKNki/MFnl7aYzC2ntSM9hrFv5zj7Px7dMSNEdx5n9SJRKL6S3XUZ2SBzSkPLmPNqqH2RdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3329
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [OSSTEST PATCH 1/2] ts-libvirt-build: Provide
 PKG_CONFIG_PATH
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
Cc: Juergen Gross <JGross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTIvMTkgNTowOSBBTSwgSWFuIEphY2tzb24gd3JvdGU6DQo+IEluIG9zc3Rlc3Qgd2Ug
ZG8gbm90IGluc3RhbGwgdGhlIHhlbiB0cmVlIGluIC91c3IvbG9jYWwgYmVjYXVzZSB0aGUNCj4g
YnVpbGQgZW52aXJvbm1lbnQgaXMgc2hhcmVkIHdpdGggbWFueSBkaWZmZXJlbnQgYnVpbGQgam9i
cyB3aGljaCBtaWdodA0KPiBiZSB1c2luZyBkaWZmZXJlbnQgdmVyc2lvbnMgb2YgWGVuLiAgV2Ug
cHV0IGl0IGluIGEgam9iLXNwZWNpZmljDQo+IGRpcmVjdG9yeSBpbiB+b3NzdGVzdCBvbiB0aGUg
YnVpbGQgaG9zdCwgYW5kIHNldCBlbnZpcm9ubWVudCB2YXJpYWJsZXMNCj4gdG8gZW5zdXJlIHRo
YXQgaXQgYWxsIGdldHMgcGlja2VkIHVwLg0KPiANCj4gUmVjZW50IHZlcnNpb25zIG9mIGxpYnZp
cnQgaW5zaXN0IG9uIGZpbmRpbmcgeGVubGlnaHQucGM7IG90aGVyd2lzZQ0KPiB0aGV5IGRpc2Fi
bGUgbGlieGwgc3VwcG9ydC4gIFNvIHdlIG11c3QgYWRkIGEgUEtHX0NPTkZJR19QQVRIIHNldHRp
bmcuDQoNClNvcnJ5LiBUaGVyZSB3YXMgYSBoYWNrIHRvIHdvcmthcm91bmQgYSBmZWRvcmEgMjgg
YnVnLCBidXQgbm93IHRoYXQgaXQgaXMgRU9MIA0KdGhlIGhhY2sgd2FzIHJlbW92ZWQNCg0KaHR0
cHM6Ly9saWJ2aXJ0Lm9yZy9naXQvP3A9bGlidmlydC5naXQ7YT1jb21taXQ7aD0xODk4MTg3N2Qy
ZTIwMzkwYTc5ZDA2ODg2MWEyNGU3MTZmOGVlNDIyDQoNCj4gKEluIGFsbCBjYXNlcywgY29udHJh
cnkgdG8gdGhlIHVzdWFsIHByb3RvY29sIGZvciBwYXRoLWxpa2UgdmFyaWFibGVzLA0KPiB3ZSBk
byBub3QgYXBwZW5kIGJ1dCBpbnN0ZWFkIHNpbXBseSBzZXQgdGhlIHZhcmlhYmxlLiAgVGhpcyBp
cyBPSw0KPiBiZWNhdXNlIHRoaXMgaXMgYW4gb3NzdGVzdCBidWlsZCBzY3JpcHQgcnVuIHZpYSBz
c2ggdG8gdGhlIGJ1aWxkIGhvc3QsDQo+IHNvIHRoZSB2YXJpYWJsZXMgd29uJ3QgaGF2ZSBiZWVu
IHNldCBhbHJlYWR5LikNCj4gDQo+IENDOiBKaW0gRmVobGlnIDxqZmVobGlnQHN1c2UuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4N
Cj4gLS0tDQo+ICAgdHMtbGlidmlydC1idWlsZCB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3RzLWxpYnZpcnQtYnVpbGQgYi90cy1s
aWJ2aXJ0LWJ1aWxkDQo+IGluZGV4IGJjMDgxOTBhLi4yYTM2M2Y0MyAxMDA3NTUNCj4gLS0tIGEv
dHMtbGlidmlydC1idWlsZA0KPiArKysgYi90cy1saWJ2aXJ0LWJ1aWxkDQo+IEBAIC02MCw2ICs2
MCw3IEBAIHN1YiBjb25maWcoKSB7DQo+ICAgICAgICAgICBjZCBsaWJ2aXJ0DQo+ICAgICAgICAg
ICBDRkxBR1M9Ii1nIC1JJHhlbnByZWZpeC9pbmNsdWRlLyIgXFwNCj4gICAgICAgICAgIExERkxB
R1M9Ii1nIC1MJHhlbnByZWZpeC9saWIvIC1XbCwtcnBhdGgtbGluaz0keGVucHJlZml4L2xpYi8i
IFxcDQo+ICsgICAgICAgIFBLR19DT05GSUdfUEFUSD0iJHhlbnByZWZpeC9saWIvcGtnY29uZmln
LyIgXFwNCj4gICAgICAgICAgIEdOVUxJQl9TUkNESVI9JGJ1aWxkZGlyL2xpYnZpcnQvJGdudWxp
Yi0+e1BhdGh9IFxcDQo+ICAgICAgICAgICAgICAgLi9hdXRvZ2VuLnNoIC0tbm8tZ2l0IFxcDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0td2l0aC1saWJ4bCAtLXdpdGhvdXQteGVuIC0t
d2l0aG91dC14ZW5hcGkgLS13aXRob3V0LXNlbGludXggXFwNCg0KVW5yZWxhdGVkLCBidXQgdGhl
IGxlZ2FjeSB4ZW4gYW5kIHhlbmFwaSBkcml2ZXJzIGhhdmUgYmVlbiByZW1vdmVkIHNvIHRoZSAN
Ci0td2l0aG91dC17eGVuLHhlbmFwaX0gb3B0aW9ucyBjb3VsZCBiZSBkcm9wcGVkLg0KDQpSZWdh
cmRzLA0KSmltDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
