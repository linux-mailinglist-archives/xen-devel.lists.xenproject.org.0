Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45829429C08
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 05:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206697.362331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma8dx-0006C1-1v; Tue, 12 Oct 2021 03:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206697.362331; Tue, 12 Oct 2021 03:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma8dw-00069y-Uw; Tue, 12 Oct 2021 03:39:56 +0000
Received: by outflank-mailman (input) for mailman id 206697;
 Tue, 12 Oct 2021 03:39:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amut=PA=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1ma8dv-00069V-4E
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 03:39:55 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e8dcea0-2b0e-11ec-8104-12813bfff9fa;
 Tue, 12 Oct 2021 03:39:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 20:39:50 -0700
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2021 20:39:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 20:39:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 20:39:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 20:39:49 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN7PR11MB2850.namprd11.prod.outlook.com (2603:10b6:406:b3::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 03:39:48 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%9]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 03:39:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0e8dcea0-2b0e-11ec-8104-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="290524237"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
   d="scan'208";a="290524237"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; 
   d="scan'208";a="625755457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMcr9J2X4rcuo584n3CcPpspZwfUbBWAtu3ml2qxmy9PvDMAZtU/u5HU8OfrrdTw8mF61h+/TdqonGZQvCDzLmjgDw1WMLU5zAaZwfYAbB16K2IrncAdPIbWmbPogr7Uhl2GZTqY9IcU+jpy7R+AJoZkU0h8BZGn7jvYI/doN3I5FjsxpFR5bRySLya1oqSQhE8T1cGaAxdOAzhoZgURZ4GEXlQvoE5nojxYEiXO4u5t18zGvg7bwXWsiJQwW36jcuyynCoXKnOj+1ZJcCjzbSaFKLOLr+38CAASu1uLHoKZ62zNwZEkSwNwIlJ8MiiXNdTNezShPR63gJn0W1PysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZx4LVInx3jJVd+Jk20AQWUe2yMLxTUrm5mn3U441II=;
 b=eZ0aqIFmFlpsnFMViusEc9AIY8bQAqEqqqtYFE7Rya+839SgBeU2zfRpuN7Lmlis/Eg9YCFOVKhlBBfoMPodhpqHwMDhcxObSqQV4+TldaPicG6BJWU/ulZBv6ils9vlCMRNbsu8bq2MDX5zEc7aqLq4uSxOAHEf4MgikRTgnIBshfOTxVDbwSMUSVjN3KPPKIXQsZebD9rqDmCMZ4tIuOUA/2Z95PA06nvwV1kYz2EmppeBTrYQxcFkhsH3FEaPiGUBaT/ARMh5sB+/CoTcbkT1Tj3njVyCq8mhKZn9Y1lYRakiVlpuhiAiycj2fI3hzREWD+IFiPIV+DQYyW9dCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZx4LVInx3jJVd+Jk20AQWUe2yMLxTUrm5mn3U441II=;
 b=P1DbP3HS3R808N1OT4UB1DfH7aakCsYMweujIZ3/rm2TSG3fw3M1gOithQupmOBEpdfdPnQLYb1TP3YJuAQGX9j7wcorR9SuO5ELKZ9nIRGR+vi0h0ecsvMhl7oRy9hn96xPx4ZCGBXdGXtx2rOxZlKF/mOPhndMAUERnfHrN+w=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>
Subject: RE: [PATCH 1/2] VT-d: generalize and correct "iommu=no-igfx" handling
Thread-Topic: [PATCH 1/2] VT-d: generalize and correct "iommu=no-igfx"
 handling
Thread-Index: AQHXvnzo4Ip5MEhSkEq0GJRaR1PfzavOuIvg
Date: Tue, 12 Oct 2021 03:39:48 +0000
Message-ID: <BN9PR11MB54335BDA95CE264683DF79878CB69@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
 <388b8562-e76f-e07c-a13d-f325bbc731c9@suse.com>
In-Reply-To: <388b8562-e76f-e07c-a13d-f325bbc731c9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfe3ecfc-8765-4704-5592-08d98d31f0e3
x-ms-traffictypediagnostic: BN7PR11MB2850:
x-microsoft-antispam-prvs: <BN7PR11MB285027C976CFF001D256C3F28CB69@BN7PR11MB2850.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EwbuNebp4JvUJj08rRuiGm7YU+s+wIchNVrJIpOlbPlSHG86ktNLwHgRfxm9XNIH0FZ95Okj/4NgipJRfCzEUyd+UkUXXIk9YhVe/yofCQhRa6ut9gXIFdsZsOhMi4k57KPJKc8o41LASYWrmgZ1kHXlSwcw+ovpwfryryBVsRvsQNuGRVNEwj4eiaKFSdfSd6d66HBJ/LAC2q6hFJdC7z0tlGWVeVd9OACU8b1uV4t/usodkovXi1cUbVwtYs/bGIkj+YcK6qfidHtkVy0TYGv+gLSqIeaejTkZbqAJ/hExfVyCnMmcTUkrEZJ1W0nPgLt3h/O4tkp6hZ5Ca8ZJ8YXuiUcDgfkyE6bkpyPAUFBmtS0ceYO7U6y2yPzk2Wt+82Y+FrRbGs65xo1wCKihZBckJj7m3+V4dQL3Qj3NGCQBSfoUdThsTGx4UFMMRhJWlUUkqZzoGLTC3SToTjjM0H5vCYMVaFsWkLKAom/k9+sw4lWD4YkTctM1zDj3/WF/CFRh7y+xRbm+2lalIiXjN09ZRXCVof2HVVbY7RvEM6rp0veaYpKhtuYrHoHg5xyKpXhGT+R2TZpwKH4Rj9DjZKC1ZnS0hCqHsGyIakwH5mUkhVZfmyQ6ofCaB/Ya1kGrbnqyAWCmj7FKWybmDpDiTKZszFTbQeCKVz0UBXLzKTj1Mf00HPkWmqR30iHYFddzuICw9lsgPC3qmy0utyFHOQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(38100700002)(508600001)(9686003)(86362001)(316002)(5660300002)(33656002)(110136005)(7696005)(6506007)(38070700005)(26005)(4326008)(52536014)(122000001)(8676002)(64756008)(66446008)(66946007)(66556008)(66476007)(83380400001)(8936002)(71200400001)(76116006)(2906002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0lMOC9SRVdZelJJQitrMzllTDBKVjJMYUc3UUpVUThJTEY3Vko1c0dLdG9T?=
 =?utf-8?B?WEpDY3BHblRKZjg1aUFjUG02U0xlRlZsKzlmRlNFcnkvOXVVakNwU2hPWlRU?=
 =?utf-8?B?ZGNzTGlUdXA3V2Zob3FWRVJBWk1wUUZRT3hZam9vczNSbmFwS1N2bGNuM1Zw?=
 =?utf-8?B?ajM0ekdkS3RlU1NtaWpId3RvQ1hncWhnN2N1cjhhMmpWc1hQNWZKVDNqa25F?=
 =?utf-8?B?dSsyK2hkaEYwa0FJeVJ3RDAyWTJVU2FBN2xlcGNmd1RTV1Q2ckZKK1ZqSjQv?=
 =?utf-8?B?MWV5SVF0NUY0NUdsM01BV1ZZbkl1MTl6K1loSkNZZEFHbm1wZ3ZkQWlibW4r?=
 =?utf-8?B?ZjJRR2hLWmoyVnA1aXZMcFhlNklvRlYrM3BNd1NlbkFGSVlRcU05SzAxZjVi?=
 =?utf-8?B?anQ1UjhKTktLM28zdUgxMUFyM0tDelgzb05YcFo5S0ZFTWhsM0V3cExSNFEv?=
 =?utf-8?B?dVByZ256Sk9IUithT1Z6V0hqOU9tbU9CeE5JVGU1Z1JEVHBNK3FMK2w2VFg1?=
 =?utf-8?B?VjhoK1JHMnFDMWNJREVwV3Y2NERxZVpDdEkwRldIWDZyR1hick9jSjZJMWVo?=
 =?utf-8?B?WklQRlpSa2QzZXd3d3FLbHI0TTB1U1ZvV1FYUHNPM1NtVjZ3NTd0alBoUXFC?=
 =?utf-8?B?b2RmZ04wQ2lVMmhUVUZzcHNQeExBekFMS2hqNmk0Z3dxeDBML1hiSmVyZGdw?=
 =?utf-8?B?dElRMFJ5NzRxS1VaQlNQUjd2eVBFM25Qa3dUQ0w2TnZ6MjU1RzBzNmp4bjFI?=
 =?utf-8?B?Nit0UnI3TEYybmhUK282RTdTS3FUTjZudEFLV1Zla2ozM2hsdUJtRXFGaVY3?=
 =?utf-8?B?NUVldHpEeE9rbi93aTN3bTg2UitMVnJJUjBiVVA2Z1RRWjFHY0FPd29pTTZS?=
 =?utf-8?B?NFVsbE9xVTQ3SmNXTEJ6SGR5OXl2cXoycFRjdjQ4bzgzeWp1TUNpSmZEUW1Y?=
 =?utf-8?B?Q1YvQzdOVyt5L2h6ekp4TkdFeElYaHU0NlFMTGd1VGcxSzlwQ0orWTk5Zldh?=
 =?utf-8?B?U3FidFZwYVo5azFEc1VBdEQ5RWw3dG1ZbWpFYlYrellTQmF6TlE1TmN1NlMw?=
 =?utf-8?B?cEVFWFB0TmRrWkorNlFaN2NJRndXa1FQMU5FVHBaNTJ1bkROZFFXYVVJNEVP?=
 =?utf-8?B?dkE4T3ZZNUt0RmxSTk05SFJ6UDN0TUlDaFV5dGV4SGxRODgyWEROUjdvNU9r?=
 =?utf-8?B?R0NlMTJpa25Uckd3VFMva2hpQ3JzVElvYXpHN21YY2JpUjIrTVNqaEI5OHRQ?=
 =?utf-8?B?aStoN1k3OVBOU2VkUFVqakxHdW1yekdwRkZFYkhvV2xZajdCM2xPUVJvZ2xw?=
 =?utf-8?B?VXEybUoyOFo2Si8vRjFKOHF5Uy82Q0pRQmJiRXRPRWVJZ2tHT0dHaWdhMUt6?=
 =?utf-8?B?ODh5alNiOXo4aENzdVg1WWJmQWVvd0drMyttY0VHSllZazgyRjE5UktaakM3?=
 =?utf-8?B?WkQyRHRSVmFjTENxR1MvVzJMeHJpLzFvTG5NNFcweDAwK0RqTnNvYm5RSXNk?=
 =?utf-8?B?WU42VWNuc1oxRGpXNm9JTzNZK011NGQ3THZUQUdyTkh1TFNOZHV4emxDMHNa?=
 =?utf-8?B?OFZQT2FvZS9EVWlXZGdiQlBBN0VXUkM3MFIyY3ZqKzN4RG9TUkJpTldEZnZX?=
 =?utf-8?B?OElCMzY1YzJNaG1GN21zK0ZVZWllWll6UVVLRWJqelFyUUw0KzFxbkJXb1J4?=
 =?utf-8?B?c0RTWFVESUFvNmkvTCtoZi9vWVhxN1lPaFJhOVlIMWRGVEdxejhHU2twNDlJ?=
 =?utf-8?Q?NcKjDwHVPsCyQ5k96Dm2Lt6a7DxrAg7DR30bTx5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe3ecfc-8765-4704-5592-08d98d31f0e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 03:39:48.3442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIauc4QsAqE4ox9GKFV4j1Tte/c5KVv4XSoZ2kpAgV8cmGofXq+JgAF1R/zpLf+Hsr2Mja2hLJGqzSMzI9qc8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2850
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
T2N0b2JlciAxMSwgMjAyMSA0OjQ5IFBNDQo+IA0KPiBMaW51eCdlcyBzdXBwb3NlZGx5IGVxdWl2
YWxlbnQgImludGVsX2lvbW11PWlnZnhfb2ZmIiBkZWFscyB3aXRoIGFueQ0KPiBncmFwaGljcyBk
ZXZpY2VzIChub3QganVzdCBJbnRlbCBvbmVzKSB3aGlsZSBhdCB0aGUgc2FtZSB0aW1lIGxpbWl0
aW5nDQo+IHRoZSBlZmZlY3QgdG8gSU9NTVVzIGNvdmVyaW5nIG9ubHkgZ3JhcGhpY3MgZGV2aWNl
cy4gS2V5aW5nIHRoZSBkZWNpc2lvbg0KPiB0byBsZWF2ZSB0cmFuc2xhdGlvbiBkaXNhYmxlZCBm
b3IgYW4gSU9NTVUgdG8gbWVyZWx5IGEgbWFnaWMgU0JERiB0dXBsZQ0KPiB3YXMgd3JvbmcgaW4g
dGhlIGZpcnN0IHBsYWNlIC0gc3lzdGVtcyBtYXkgdmVyeSB3ZWxsIGhhdmUgbm9uLWdyYXBoaWNz
DQo+IGRldmljZXMgYXQgMDAwMDowMDowMi4wIChvcmRpbmFyeSByb290IHBvcnRzIGNvbW1vbmx5
IGxpdmUgdGhlcmUsIGZvcg0KPiBleGFtcGxlKS4gQW55IHVzZSBvZiBpZ2RfZHJoZF9hZGRyZXNz
IChhbmQgaGVuY2UgaXNfaWdkX2RyaGQoKSkgbmVlZHMNCj4gZnVydGhlciBxdWFsaWZpY2F0aW9u
Lg0KPiANCj4gSW50cm9kdWNlIGEgbmV3ICJncmFwaGljcyBvbmx5IiBmaWVsZCBpbiBzdHJ1Y3Qg
YWNwaV9kcmhkX3VuaXQgYW5kIHNldA0KPiBpdCBhY2NvcmRpbmcgdG8gZGV2aWNlIHNjb3BlIHBh
cnNpbmcgb3V0Y29tZS4gUmVwbGFjZSB0aGUgYmFkIHVzZSBvZg0KPiBpc19pZ2RfZHJoZCgpIGlu
IGlvbW11X2VuYWJsZV90cmFuc2xhdGlvbigpIGJ5IHVzZSBvZiB0aGlzIG5ldyBmaWVsZC4NCj4g
DQo+IFdoaWxlIGFkZGluZyB0aGUgbmV3IGZpZWxkIGFsc28gY29udmVydCB0aGUgYWRqYWNlbnQg
aW5jbHVkZV9hbGwgb25lIHRvDQo+ICJib29sIi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiBJIGFzc3VtZSBhbiBpbXBsaWNhdGlvbiBp
cyB0aGF0IHRoZXNlIGRldmljZXMgdGhlbiBtYXkgbm90IGJlIHBhc3NlZA0KPiB0aHJvdWdoIHRv
IGd1ZXN0cywgeWV0IEkgZG9uJ3Qgc2VlIHVzIGVuZm9yY2luZyB0aGlzIGFueXdoZXJlLg0KPiAN
Cj4gLS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+ICsrKyBiL2RvY3Mv
bWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPiBAQCAtMTQ5NCw4ICsxNDk0LDggQEAgVGhl
IGZvbGxvd2luZyBvcHRpb25zIGFyZSBzcGVjaWZpYyB0byBJbg0KPiAgICAgIHZlcnNpb24gNiBh
bmQgZ3JlYXRlciBhcyBSZWdpc3RlcmVkLUJhc2VkIEludmFsaWRhdGlvbiBpc24ndCBzdXBwb3J0
ZWQNCj4gICAgICBieSB0aGVtLg0KPiANCj4gLSogICBUaGUgYGlnZnhgIGJvb2xlYW4gaXMgYWN0
aXZlIGJ5IGRlZmF1bHQsIGFuZCBjb250cm9scyB3aGV0aGVyIHRoZSBJT01NVQ0KPiBpbg0KPiAt
ICAgIGZyb250IG9mIGFuIEludGVsIEdyYXBoaWNzIERldmljZSBpcyBlbmFibGVkIG9yIG5vdC4N
Cj4gKyogICBUaGUgYGlnZnhgIGJvb2xlYW4gaXMgYWN0aXZlIGJ5IGRlZmF1bHQsIGFuZCBjb250
cm9scyB3aGV0aGVyIElPTU1VcyBpbg0KPiArICAgIGZyb250IG9mIHNvbGVseSBncmFwaGljcyBk
ZXZpY2VzIGdldCBlbmFibGVkIG9yIG5vdC4NCj4gDQo+ICAgICAgSXQgaXMgaW50ZW5kZWQgYXMg
YSBkZWJ1Z2dpbmcgbWVjaGFuaXNtIGZvciBncmFwaGljcyBpc3N1ZXMsIGFuZCB0byBiZQ0KPiAg
ICAgIHNpbWlsYXIgdG8gTGludXgncyBgaW50ZWxfaW9tbXU9aWdmeF9vZmZgIG9wdGlvbi4gIElm
IHNwZWNpZnlpbmcgYG5vLWlnZnhgDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0
ZC9kbWFyLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYw0KPiBA
QCAtMzE1LDYgKzMxNSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFjcGlfcGFyc2VfZGV2X3Njb3Bl
KA0KPiAgICAgIHN0cnVjdCBhY3BpX2RyaGRfdW5pdCAqZHJoZCA9IHR5cGUgPT0gRE1BUl9UWVBF
ID8NCj4gICAgICAgICAgY29udGFpbmVyX29mKHNjb3BlLCBzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQs
IHNjb3BlKSA6IE5VTEw7DQo+ICAgICAgaW50IGRlcHRoLCBjbnQsIGRpZHggPSAwLCByZXQ7DQo+
ICsgICAgYm9vbCBnZnhfb25seSA9IGZhbHNlOw0KPiANCj4gICAgICBpZiAoIChjbnQgPSBzY29w
ZV9kZXZpY2VfY291bnQoc3RhcnQsIGVuZCkpIDwgMCApDQo+ICAgICAgICAgIHJldHVybiBjbnQ7
DQo+IEBAIC0zMjQsNiArMzI1LDggQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9wYXJzZV9kZXZf
c2NvcGUoDQo+ICAgICAgICAgIHNjb3BlLT5kZXZpY2VzID0geHphbGxvY19hcnJheSh1MTYsIGNu
dCk7DQo+ICAgICAgICAgIGlmICggIXNjb3BlLT5kZXZpY2VzICkNCj4gICAgICAgICAgICAgIHJl
dHVybiAtRU5PTUVNOw0KPiArDQo+ICsgICAgICAgIGdmeF9vbmx5ID0gZHJoZCAmJiAhZHJoZC0+
aW5jbHVkZV9hbGw7DQo+ICAgICAgfQ0KPiAgICAgIHNjb3BlLT5kZXZpY2VzX2NudCA9IGNudDsN
Cj4gDQo+IEBAIC0zNTQsNiArMzU3LDcgQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9wYXJzZV9k
ZXZfc2NvcGUoDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFjcGlfc2NvcGUtPmJ1cywgc2Vj
X2J1cywgc3ViX2J1cyk7DQo+IA0KPiAgICAgICAgICAgICAgZG1hcl9zY29wZV9hZGRfYnVzZXMo
c2NvcGUsIHNlY19idXMsIHN1Yl9idXMpOw0KPiArICAgICAgICAgICAgZ2Z4X29ubHkgPSBmYWxz
ZTsNCj4gICAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gICAgICAgICAgY2FzZSBBQ1BJX0RNQVJf
U0NPUEVfVFlQRV9IUEVUOg0KPiBAQCAtMzc0LDYgKzM3OCw4IEBAIHN0YXRpYyBpbnQgX19pbml0
IGFjcGlfcGFyc2VfZGV2X3Njb3BlKA0KPiAgICAgICAgICAgICAgICAgIGFjcGlfaHBldF91bml0
LT5kZXYgPSBwYXRoLT5kZXY7DQo+ICAgICAgICAgICAgICAgICAgYWNwaV9ocGV0X3VuaXQtPmZ1
bmMgPSBwYXRoLT5mbjsNCj4gICAgICAgICAgICAgICAgICBsaXN0X2FkZCgmYWNwaV9ocGV0X3Vu
aXQtPmxpc3QsICZkcmhkLT5ocGV0X2xpc3QpOw0KPiArDQo+ICsgICAgICAgICAgICAgICAgZ2Z4
X29ubHkgPSBmYWxzZTsNCj4gICAgICAgICAgICAgIH0NCj4gDQo+ICAgICAgICAgICAgICBicmVh
azsNCj4gQEAgLTM4OCw2ICszOTQsMTIgQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9wYXJzZV9k
ZXZfc2NvcGUoDQo+ICAgICAgICAgICAgICAgICAgaWYgKCAoc2VnID09IDApICYmIChidXMgPT0g
MCkgJiYgKHBhdGgtPmRldiA9PSAyKSAmJg0KPiAgICAgICAgICAgICAgICAgICAgICAgKHBhdGgt
PmZuID09IDApICkNCj4gICAgICAgICAgICAgICAgICAgICAgaWdkX2RyaGRfYWRkcmVzcyA9IGRy
aGQtPmFkZHJlc3M7DQo+ICsNCj4gKyAgICAgICAgICAgICAgICBpZiAoIGdmeF9vbmx5ICYmDQo+
ICsgICAgICAgICAgICAgICAgICAgICBwY2lfY29uZl9yZWFkOChQQ0lfU0JERihzZWcsIGJ1cywg
cGF0aC0+ZGV2LCBwYXRoLT5mbiksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQQ0lfQ0xBU1NfREVWSUNFICsgMSkgIT0gMHgwMw0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLyogUENJX0JBU0VfQ0xBU1NfRElTUExBWSAqLyApDQo+ICsgICAg
ICAgICAgICAgICAgICAgIGdmeF9vbmx5ID0gZmFsc2U7DQo+ICAgICAgICAgICAgICB9DQo+IA0K
PiAgICAgICAgICAgICAgYnJlYWs7DQo+IEBAIC00MDgsNiArNDIwLDggQEAgc3RhdGljIGludCBf
X2luaXQgYWNwaV9wYXJzZV9kZXZfc2NvcGUoDQo+ICAgICAgICAgICAgICAgICAgYWNwaV9pb2Fw
aWNfdW5pdC0+aW9hcGljLmJkZi5kZXYgPSBwYXRoLT5kZXY7DQo+ICAgICAgICAgICAgICAgICAg
YWNwaV9pb2FwaWNfdW5pdC0+aW9hcGljLmJkZi5mdW5jID0gcGF0aC0+Zm47DQo+ICAgICAgICAg
ICAgICAgICAgbGlzdF9hZGQoJmFjcGlfaW9hcGljX3VuaXQtPmxpc3QsICZkcmhkLT5pb2FwaWNf
bGlzdCk7DQo+ICsNCj4gKyAgICAgICAgICAgICAgICBnZnhfb25seSA9IGZhbHNlOw0KPiAgICAg
ICAgICAgICAgfQ0KPiANCj4gICAgICAgICAgICAgIGJyZWFrOw0KPiBAQCAtNDE3LDExICs0MzEs
MTUgQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9wYXJzZV9kZXZfc2NvcGUoDQo+ICAgICAgICAg
ICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HIFZURFBSRUZJWCAiVW5rbm93biBzY29wZSB0
eXBlICUjeFxuIiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgYWNwaV9zY29wZS0+ZW50cnlf
dHlwZSk7DQo+ICAgICAgICAgICAgICBzdGFydCArPSBhY3BpX3Njb3BlLT5sZW5ndGg7DQo+ICsg
ICAgICAgICAgICBnZnhfb25seSA9IGZhbHNlOw0KPiAgICAgICAgICAgICAgY29udGludWU7DQo+
ICAgICAgICAgIH0NCj4gICAgICAgICAgc2NvcGUtPmRldmljZXNbZGlkeCsrXSA9IFBDSV9CREYo
YnVzLCBwYXRoLT5kZXYsIHBhdGgtPmZuKTsNCj4gICAgICAgICAgc3RhcnQgKz0gYWNwaV9zY29w
ZS0+bGVuZ3RoOw0KPiAtICAgfQ0KPiArICAgIH0NCj4gKw0KPiArICAgIGlmICggZHJoZCAmJiBn
Znhfb25seSApDQo+ICsgICAgICAgIGRyaGQtPmdmeF9vbmx5ID0gdHJ1ZTsNCj4gDQo+ICAgICAg
cmV0ID0gMDsNCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmgN
Cj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuaA0KPiBAQCAtNjIsNyAr
NjIsOCBAQCBzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQgew0KPiAgICAgIHN0cnVjdCBsaXN0X2hlYWQg
bGlzdDsNCj4gICAgICB1NjQgICAgYWRkcmVzczsgICAgICAgICAgICAgICAgICAgICAvKiByZWdp
c3RlciBiYXNlIGFkZHJlc3Mgb2YgdGhlIHVuaXQgKi8NCj4gICAgICB1MTYgICAgc2VnbWVudDsN
Cj4gLSAgICB1OCAgICAgaW5jbHVkZV9hbGw6MTsNCj4gKyAgICBib29sICAgaW5jbHVkZV9hbGw6
MTsNCj4gKyAgICBib29sICAgZ2Z4X29ubHk6MTsNCj4gICAgICBzdHJ1Y3QgdnRkX2lvbW11ICpp
b21tdTsNCj4gICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGlvYXBpY19saXN0Ow0KPiAgICAgIHN0cnVj
dCBsaXN0X2hlYWQgaHBldF9saXN0Ow0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92
dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0K
PiBAQCAtNzUxLDcgKzc1MSw3IEBAIHN0YXRpYyB2b2lkIGlvbW11X2VuYWJsZV90cmFuc2xhdGlv
bihzdHINCj4gICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiAgICAgIHN0cnVjdCB2dGRfaW9t
bXUgKmlvbW11ID0gZHJoZC0+aW9tbXU7DQo+IA0KPiAtICAgIGlmICggaXNfaWdkX2RyaGQoZHJo
ZCkgKQ0KPiArICAgIGlmICggZHJoZC0+Z2Z4X29ubHkgKQ0KPiAgICAgIHsNCj4gICAgICAgICAg
aWYgKCAhaW9tbXVfaWdmeCApDQo+ICAgICAgICAgIHsNCg0K

