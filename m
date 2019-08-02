Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138CD7FCC5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 16:52:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htYt4-0007zK-RB; Fri, 02 Aug 2019 14:50:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htYt2-0007zB-Vh
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 14:50:29 +0000
X-Inumbo-ID: dcf057a4-b534-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dcf057a4-b534-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 14:50:28 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 14:50:25 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 14:47:00 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 14:47:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jF6p20JpDEKnvRv2MKQ3RNqeGSajW379MY3HWGH2LJ+fAUzz8tL82Y2cWXLGJy6Gu57NP9U4wafIOU4kCHIHYcM+Rub3vHF/J7Gd3+VpFZ2y7xm1I/Gyo5Bi1NnCcVgYHl43x4xbWDDuHysTnreLNgeqistnvW7vjWbmMKxr7beJUNRKydi1h5iiEsyOEKmfUNtysAF60CjOrwkgDjoItJSoWuJYZC+77Uac+BeOK/v3Aja72L35ft9zhfuqPHdCFkTQxEGIC532GiLdJu9sYzIrxQBcr/Ttc99lxWq/9gH5wOvleQ/JoIfvyNpgIa+QZ5g1di9VXq7Cn8O8NJ91fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVoMFbuwCSamqEP2kwaablSdQNddzJBauAG2Tw7fE8I=;
 b=Rd+n1jBEP/nyCL4PE2F2+ReHzfevrO3eyqpdwxfCWWGcBe4K2zae2cBtR4htx+QNBauqPrE5PEZCxltGY/Wz6Gj5ZEgj0c4ky1ivkkEInGnQ0LMXebl9baDCpFOmHzPyJ7aPlwMtFdCWRXY+/ouaKz+NNUtqF9wEoBWb4P3xN9YcaD4sXskB8BhDRaENCfkBXPlEcRvJXQSYNtisyekCMh7WM5FSu0PMeLr+2yOwLrL011XDbXvWmOcYDbBabuntkSDQAHdcMdEoc4h3mfNMyoEtnqj7weRXE9KvxjeXTvI1muUlInnU/lCRoscDrCA2KjzmgSIiu3GRbn8l4JPZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3098.namprd18.prod.outlook.com (10.255.76.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 14:46:59 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 14:46:59 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 06/16] microcode: introduce a global cache of ucode
 patch
Thread-Index: AQHVSFKbg6V+T8KOdE+RBvqghdKkCKbn8Z0A
Date: Fri, 2 Aug 2019 14:46:58 +0000
Message-ID: <87a8ebf4-75f7-2397-204a-794d04404d1f@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-7-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-7-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::14)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd0320a2-cd00-40c3-2908-08d71758457d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3098; 
x-ms-traffictypediagnostic: DM6PR18MB3098:
x-microsoft-antispam-prvs: <DM6PR18MB309827B17CDF51CA9FE2F4D5B3D90@DM6PR18MB3098.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(189003)(199004)(6506007)(256004)(478600001)(6512007)(7736002)(305945005)(3846002)(53936002)(6116002)(4326008)(2906002)(6916009)(76176011)(229853002)(68736007)(486006)(80792005)(31686004)(8676002)(81156014)(81166006)(446003)(14454004)(6436002)(476003)(2616005)(11346002)(66446008)(64756008)(5660300002)(66556008)(66476007)(6486002)(316002)(54906003)(6246003)(86362001)(186003)(102836004)(71200400001)(386003)(25786009)(66946007)(8936002)(26005)(71190400001)(14444005)(53546011)(31696002)(66066001)(99286004)(36756003)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3098;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aDhgIYw2lZ0rJ7cVH3h+ol8KDCyzqa5pb7f1gXsQZ34zzZWQwONQLo2iO+Ps03DN4NoV4WZ0WSKqkkX34Gz6C9F4INGowJG0hnxxOy3Xp/3q7AEfNX6CvemCeXssCKE+tjdDp8VkD7A7guXhd6SeUFZjj47zib46auB4t3KV0II1EEoHcWAN15v7XnYr17RQJOjQ5ZC1nXR5zsvf0c/x4eQgVoqMSszUZGQOxnTh6oN8kXhlYefi1bbNm65w0oayNVadctoVQJ7d8LbzRnyHtzhRGdvETPU+cHGr52AMFpT87HszY0UO9VAR3VXrrIYkP/AOgsZBueLJw0lKXS+UYRlXWAyM2t83K6PxSlhP1PltAPgJgQobzlaEZEGjQJE4PAVhLsUru3c7VxNy0Y03wMUqJt7+wuF2KzWrM6MIiuw=
Content-ID: <9256B9CC81338B4395238AC41CE44889@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0320a2-cd00-40c3-2908-08d71758457d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 14:46:58.8774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3098
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 06/16] microcode: introduce a global
 cache of ucode patch
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+ICtib29sIG1pY3JvY29kZV91
cGRhdGVfY2FjaGUoc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gpDQo+ICt7DQo+ICsNCj4g
KyAgICBBU1NFUlQoc3Bpbl9pc19sb2NrZWQoJm1pY3JvY29kZV9tdXRleCkpOw0KPiArDQo+ICsg
ICAgaWYgKCAhbWljcm9jb2RlX2NhY2hlICkNCj4gKyAgICAgICAgbWljcm9jb2RlX2NhY2hlID0g
cGF0Y2g7DQo+ICsgICAgZWxzZSBpZiAoIG1pY3JvY29kZV9vcHMtPmNvbXBhcmVfcGF0Y2gocGF0
Y2gsIG1pY3JvY29kZV9jYWNoZSkgPT0NCj4gKyAgICAgICAgICAgICAgICAgIE5FV19VQ09ERSAp
DQoNCkluZGVudGF0aW9uIGlzIHdyb25nIGhlcmUuDQoNCj4gK3N0YXRpYyBzdHJ1Y3QgbWljcm9j
b2RlX3BhdGNoICphbGxvY19taWNyb2NvZGVfcGF0Y2goDQo+ICsgICAgY29uc3Qgc3RydWN0IG1p
Y3JvY29kZV9hbWQgKm1jX2FtZCkNCj4gK3sNCj4gKyAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNo
ICptaWNyb2NvZGVfcGF0Y2ggPSB4bWFsbG9jKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gpOw0KPiAr
ICAgIHN0cnVjdCBtaWNyb2NvZGVfYW1kICpjYWNoZSA9IHhtYWxsb2Moc3RydWN0IG1pY3JvY29k
ZV9hbWQpOw0KPiArICAgIHZvaWQgKm1wYiA9IHhtYWxsb2NfYnl0ZXMobWNfYW1kLT5tcGJfc2l6
ZSk7DQo+ICsgICAgc3RydWN0IGVxdWl2X2NwdV9lbnRyeSAqZXF1aXZfY3B1X3RhYmxlID0NCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeG1hbGxvY19ieXRlcyhtY19hbWQtPmVx
dWl2X2NwdV90YWJsZV9zaXplKTsNCj4gKw0KPiArICAgIGlmICggIW1pY3JvY29kZV9wYXRjaCB8
fCAhY2FjaGUgfHwgIW1wYiB8fCAhZXF1aXZfY3B1X3RhYmxlICkNCj4gKyAgICB7DQo+ICsgICAg
ICAgIHhmcmVlKG1pY3JvY29kZV9wYXRjaCk7DQo+ICsgICAgICAgIHhmcmVlKGNhY2hlKTsNCj4g
KyAgICAgICAgeGZyZWUobXBiKTsNCj4gKyAgICAgICAgeGZyZWUoZXF1aXZfY3B1X3RhYmxlKTsN
Cj4gKyAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+ICsgICAgfQ0KPiArDQo+ICsg
ICAgbWVtY3B5KG1wYiwgbWNfYW1kLT5tcGIsIG1jX2FtZC0+bXBiX3NpemUpOw0KPiArICAgIGNh
Y2hlLT5tcGIgPSBtcGI7DQo+ICsgICAgY2FjaGUtPm1wYl9zaXplID0gbWNfYW1kLT5tcGJfc2l6
ZTsNCj4gKyAgICBtZW1jcHkoZXF1aXZfY3B1X3RhYmxlLCBtY19hbWQtPmVxdWl2X2NwdV90YWJs
ZSwNCj4gKyAgICAgICAgICAgbWNfYW1kLT5lcXVpdl9jcHVfdGFibGVfc2l6ZSk7DQo+ICsgICAg
Y2FjaGUtPmVxdWl2X2NwdV90YWJsZSA9IGVxdWl2X2NwdV90YWJsZTsNCj4gKyAgICBjYWNoZS0+
ZXF1aXZfY3B1X3RhYmxlX3NpemUgPSBtY19hbWQtPmVxdWl2X2NwdV90YWJsZV9zaXplOw0KPiAr
ICAgIG1pY3JvY29kZV9wYXRjaC0+bWNfYW1kID0gY2FjaGU7DQo+ICsNCj4gKyAgICByZXR1cm4g
bWljcm9jb2RlX3BhdGNoOw0KPiArfQ0KDQpXaHkgaXMgaXQgdGhhdCBldmVyeXRoaW5nIG5lZWRz
IHRvIGJlIGNvcGllZCBoZXJlLCByYXRoZXIgdGhhbg0Kc2ltcGx5IHNodWZmbGluZyBvbmUgKG9y
IGEgZmV3KSBwb2ludGVyKHMpPyBDYW4ndCB0aGUgY2FsbGVyDQpzaW1wbHkgaW5zdGFsbCB0aGUg
YXJndW1lbnQgaXQgcGFzc2VzIGhlcmUgYXMgdGhlIG5ldyBjYWNoZSBibG9iPw0KDQo+ICtzdGF0
aWMgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0IGNvbXBhcmVfcGF0Y2goDQo+ICsgICAgY29u
c3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbmV3LCBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3Bh
dGNoICpvbGQpDQo+ICt7DQo+ICsgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50
ZWwgKm9sZF9oZWFkZXIgPSAmb2xkLT5tY19pbnRlbC0+aGRyOw0KPiArDQo+ICsgICAgcmV0dXJu
IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goJm5ldy0+bWNfaW50ZWwtPmhkciwgb2xkX2hlYWRlci0+
c2lnLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZF9oZWFkZXItPnBm
LCBvbGRfaGVhZGVyLT5yZXYpOw0KDQpTbyB0aGlzIGlzIGV4YWN0bHkgd2hhdCBJIHNhaWQgb24g
dGhlIGVhcmxpZXIgcGF0Y2ggdGhlIGZ1bmN0aW9uDQpjYW5ub3QgYmUgdXNlZCBmb3IuIFRoZSB3
YXkgInBmIiB3b3JrcyBwcmVjbHVkZXMgdGhpcywgYXMgc2FpZCBpbg0KcmVwbHkgdG8gYW4gZWFy
bGllciB2ZXJzaW9uLCBhbmQgbm8tb25lIGNvcnJlY3RlZCBtZSAoaS5lLiBJJ20gaW4NCm5vIHdh
eSBleGNsdWRpbmcgSSdtIG1pc3VuZGVyc3RhbmRpbmcgc29tZXRoaW5nIGhlcmUpLg0KDQpKYW4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
