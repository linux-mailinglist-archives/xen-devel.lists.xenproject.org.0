Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F14A3378
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jan 2022 04:09:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262367.454561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE0aU-0005cC-KO; Sun, 30 Jan 2022 03:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262367.454561; Sun, 30 Jan 2022 03:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nE0aU-0005ZL-HD; Sun, 30 Jan 2022 03:09:10 +0000
Received: by outflank-mailman (input) for mailman id 262367;
 Sun, 30 Jan 2022 03:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lkCg=SO=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nE0aS-0005ZF-QI
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 03:09:09 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fafe090d-8179-11ec-8f75-fffcc8bd4f1a;
 Sun, 30 Jan 2022 04:09:07 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 19:09:03 -0800
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2022 19:09:03 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 29 Jan 2022 19:09:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sat, 29 Jan 2022 19:09:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sat, 29 Jan 2022 19:09:02 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR1101MB2365.namprd11.prod.outlook.com (2603:10b6:300:74::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 03:09:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 03:08:59 +0000
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
X-Inumbo-ID: fafe090d-8179-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643512147; x=1675048147;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5IkzbfmcN2+CErwxVase6v7i7D+DE2BdKqUL5KDlsc8=;
  b=dRjTULZglIWdLOyWckt118t76j0BKYdHNNHKkfINFL1a6yUaNL19X+Jz
   RLFpaWiZsMlS7O1O9t0rEVtN4m8QHJ7XcUvS+v/0/AMHEvndTEE45ErJf
   1uE7ckuDpP7Sc7/vBXxfTd75VxDbH3XuwWLpdLUJhhvAkCjm9yNgERmBy
   2OSX/AlT8ehz1xg3OMaWST7my/NKE+CQVKcnFqdffHX2UazXKxjglmc2z
   AXF6XXRhnTJR09BLjhbKwh4xBRRRT3OzVY5nwM56Id5neFfnQtRG66vmT
   Jv9ierJYgFExP+yaYeWodBu1WQmWGiFtTjmRXMgCqscn9xKxsOLDuvg6E
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="227980050"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="227980050"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="697509673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j89iHZ78YLsXtqG5hAhl/KiDoJ7ls6sXCq8rwrFqED9Tb5FC0NO3Ll1/8y4C3G6lnoY+YAIEMaG1fm6NyUOPsg2YGmVd6e14+lUmcB1KDPbVa4JRWgaKeRmnJDeXWE7PcmrgUZDqkELGnqKgVubdfINI7NGt1sO3JtlCH9Vd80BIOTbk/+ift9t1s+gNE+JhbhNIz6yF7irh5BPDIEFk4fAw66Ud4B1JMypfkBUyjUIRu5HE1HlO1sFYl+rGkX0cMA94qTNvLX6FtEWEpCTdViEdCBwm8DB3B0e5lDX/A0KCV/CpXgWKgUM8VB5JtaKEqgnkzw39m0lRag9qCbWSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IkzbfmcN2+CErwxVase6v7i7D+DE2BdKqUL5KDlsc8=;
 b=Y9ltvMNjFq89MFkme73QkPe9/z78NDtjwJpYrxUZbOfdnFQcvkHVH9P3hnvt5X+4wUI2hzid8yDW16bqTewgVzsE3lxnE/K4nGKR2PC3TsNHtT7KRCxuh4RKuBTS1tJJvLY/omeLqlBIo1JLt3Z4kU5AziZ/adi6rS6HjMQxyWMseEoFvKD5+gv1b4BBxBUFf33DeiXZnyFdDt2CF4f2PqPL96F/J07YHUgCL2KTpZ83RYBlm0UIDbJas7HRFcSE1tStlKBWz/Cd7WyKofiPqeQVVCPdtYpWGNKWLoEcU4WiB76heG3XhwY43fRXm8dphTw7VDYXn1BrIPba/u49SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Nakajima, Jun"
	<jun.nakajima@intel.com>
Subject: RE: [PATCH v2 1/3] VMX: sync VM-exit perf counters with known VM-exit
 reasons
Thread-Topic: [PATCH v2 1/3] VMX: sync VM-exit perf counters with known
 VM-exit reasons
Thread-Index: AQHYAj+mrfy4jhb6gEO6nCskr+JyMax7CMyw
Date: Sun, 30 Jan 2022 03:08:59 +0000
Message-ID: <BN9PR11MB52766E7198FB5B93FAF016218C249@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
 <7955e956-c619-38ef-618f-344f16fe6517@suse.com>
In-Reply-To: <7955e956-c619-38ef-618f-344f16fe6517@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a02ae3ce-218f-433a-31e2-08d9e39ddc6c
x-ms-traffictypediagnostic: MWHPR1101MB2365:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB2365AA2114487700608B43968C249@MWHPR1101MB2365.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d6BK+ETkZdylDpnb77eYzgY3tKiGg5rA20RlWxyC6FBwVIhzQm5MLTheLM+TDe/2xHIsk19irwQfD/nDpiKgUr+NvYaORTS1wNQOjpsPJO5j5TGhP7Xe33yuP4VcLYNXme+zNbghl9AK4wu5nhjxn/X0KSRo1iWYa/NqPLGni8xXzPGZWLVhZk0RY0nGdjVNcxgw4xffzYmm+Mg8iYcKr9QklTpHMCv3/K98lasjUHkM+w6JMo2xRfMVmsEPJBJBfDXsQLtsTUGysdHpCqYLU0YAAU8dBHijRV05YJjbsOuG86T8TSg7zGd+Yim95/d/9IfXjeIdB07qr4zzPNgno9CUzPDShlDOY1Ukle4KDePlEWcyetP7ehQQaH2DTJFBYH+28UPlimBolfnWwcWFNEaPEHYH4XbDxIFhbAYfNKYlryxN/HZDuOyS0c7BMqRZkKiFN60pnp9f3/xe9QrCLi2z+IGdt7qRnJARlD0Z/L4yYQFUXoN7vuCGUFs8ZnDdzlvIcn5wAhlGnA5G61yekWG5erBlJlywKfp39WUyXCRBGaoDtUdLG8qvAF4G2YIZgj7AmC9a9mLRRvSsUVwSzqHJDLHLT8SJ5xSQ1NQ1MMPbetnksaptuKvddTb+hZYXvoSpueUclnuHwflihanjRkYUG1ZKWmecV1JzbpTT0G2MSjzXrGqlGPBrWAQ60T+XWx97DtcC8VmyKDcCCBTTGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(86362001)(107886003)(38070700005)(38100700002)(83380400001)(33656002)(82960400001)(54906003)(52536014)(4326008)(316002)(76116006)(6506007)(66556008)(26005)(110136005)(55016003)(186003)(8676002)(66446008)(64756008)(8936002)(2906002)(9686003)(66476007)(7696005)(5660300002)(508600001)(66946007)(122000001)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDBvT2pQR24vVHh6Y1Mrblc4L20yMUJyR1krYVZsTWNLZm05QkxpNE41akVO?=
 =?utf-8?B?OVo5c1p4bEZ5N3VST3NHWjcyTnJWRnljanRPTk9YQnFjc3RYVjkrN09DbHZT?=
 =?utf-8?B?T05XZi8zV3hVcW9XZHZoWkZWR1pLYVJpL0dNSTBqUmYzTVl3ZW9xRTNnSDd2?=
 =?utf-8?B?V0E5eVpicURvcDBSQjVGYmxYZVhHaXMyU0w1bnoyYXJ6c1Q0N3Q5Q2FYR3dQ?=
 =?utf-8?B?TUQxeERjODlueG4xdXhKOEJIaVdWb01KaVpXNlRjMENTa2MyV2JvOE5XcTV5?=
 =?utf-8?B?QXBOa0UzZGt6bkp0UEJKc1U1RkNNNVUyZWZEcm80MExuaFNpZjNaR25TRWlT?=
 =?utf-8?B?R3hlbXBZUHZoU0Y1NXRSemduL1VKanE3dkUrSnoyLzl1bzNwN2ZuTWtqRnMv?=
 =?utf-8?B?cTdPb054UytoRy9tQzJHTmZTdXBRa2I1SUVHc0x3Q2hOYksyUWRhK2Jtd0Jm?=
 =?utf-8?B?RWgwV2txaHZZSjh1NitncmRNY2ovUlNFTnRuRXJNZFIwdEVVeVdBaE1vb3Vw?=
 =?utf-8?B?YUY5QmViNDBycnV3T0lXazVoSzgvdVUraUpsb1ZnUmFiUTNsYXllMWRYYmEz?=
 =?utf-8?B?clVCa0twVTVTMU5tRG9DY3VKNUZJOUEvSklVWWFHVmFZZHJZM3h3Nm1ZQ0lG?=
 =?utf-8?B?Yk9JbWczamdGVXhvV1lPR3dOa1IvbFRZcWJNOVJ4V21VZUNldkdQVzlTSGtF?=
 =?utf-8?B?R1V2U3RiVDd0ODF1WnpVOHJGQXBRbkhPMGhXd1RFTVJZRHFvVDRaaDJUMTJs?=
 =?utf-8?B?UGVGY01rbWF3MXljenN0YWp1L3BXYmFHYnM1eUY4cExzampYUGprN2FpaTJl?=
 =?utf-8?B?bWFDQmhnQjlwTHcvNGptU0wzY041ZWNJaTl6OW53SE92NGVqYmhiUWhWMmtt?=
 =?utf-8?B?Qjc1TjQ3RGdGalZjUWlTczAyMnlLeWlkL0Z0c2phTmVnVkVpeGFpaDUvQmVu?=
 =?utf-8?B?c0xoU09QZHJpQkhuVGZzZEN3TWk1WXZabkxTWHpEUjFnemI2Y0Y0by9MV08y?=
 =?utf-8?B?UExLWGVtc2hscWwyVkVuUFdpbHNxR3lOY2F1YzRCb25CVi92aWZOMWtST1lJ?=
 =?utf-8?B?dGROSHRSK045ZUdkMEJnSW5oeTYwSVdWbHF1U1lEZUpRemo1YjNKRWtMTTI3?=
 =?utf-8?B?YlQ2Q2xIaVkxbHhmVXRnOUx2SWQ4L2dJQkROSG5aRUxaNlRETzNlbFAzbith?=
 =?utf-8?B?OVlQNXBNb3hZWURWazV6TnprRTVyM0MvTkdnS29reXpKbmZkRm5hVjRvYmpY?=
 =?utf-8?B?eVBJZDAxYjBLdmp2MGVqQkdnT1haNklhOXlXQWJ0S2hqYytjRklnb211YUY1?=
 =?utf-8?B?anZISzJvb21ZNVhncGpZUEcwMi9QUHMreXdCZFlTTDNEK1ZRdDd3MThNTTJZ?=
 =?utf-8?B?MVF1TTUwaGVUTitvMlFFZXNXTVhLaGQxY3NDQldhQTF3MVpjVG5RVG5yYkYz?=
 =?utf-8?B?bjdBcnZrenJQWjZkMmU1MXNzWkpDMURReVIyeXI2V3FxdkF2RHFUNHdxYjl0?=
 =?utf-8?B?UjVoNXhBbWNTaHZJZVZWOWduajEvbUZhTXNkVGE1eWN6UXBRVzdOd0pCQnVF?=
 =?utf-8?B?M0pBUmpDbi9EbUlNcE9qMm5PV3p3U2dYU3VPMTNXaGpWaEY4SVl0SmdZSWhH?=
 =?utf-8?B?a0tqcFZHcjRaQ1NFV1Y2ZzBLTU11WWR1aFJxS21iNXo3dFpFQkU2Ri9vYkF5?=
 =?utf-8?B?S3Myeld4MEx2NTFaMllMaVpBc3l4UkxpeTNDZGluTGsydXpNRC9BLzJRYmV6?=
 =?utf-8?B?MmhiQk1zaFh5MGxER0N5NlNNSlV5T0IxZ2hqWjNkcyt4d1N3bmxGZ25lMWpn?=
 =?utf-8?B?N1hDNU9JaGJWdFhKaDU5OWxLc0Z0bE5BZ0hlZWlaOE0xcDBkLzB3Q0dZSzd6?=
 =?utf-8?B?ZEVEb3JoTGVKRmpWdHFTalJ2R1JTaFgzSlU2dm01U21LVlRCOGl3V29yYW1W?=
 =?utf-8?B?bmQxd0hMREVHMmx4cVF1bEQrZW5JN1B1b0N5VXl5TE1TTkMxSzhhK0hWbmRu?=
 =?utf-8?B?bXpGNnZwZVhDY3BVQVByNTljRXhFU0lnZDMybEFRSjVIR3hNeklYMEg1SXdB?=
 =?utf-8?B?K2xYOVN2azJ5dm5oMGRNTEtib2NNaFdOaGFPVzBleURKK3lHbGlRaE9SejVQ?=
 =?utf-8?B?MXpWTktQM2gzMFRvSitGZFFyWWYyOS9tclh6WTZQemREMDd1YVlHZTV0RG1X?=
 =?utf-8?Q?QFva7Jv1y3f6iYbx02dFuyI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02ae3ce-218f-433a-31e2-08d9e39ddc6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2022 03:08:59.6459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C41FZHRbGRaUl0Endb6WvDZ0qyGwcPrC2N/5RiwwjgG1N2n3GtOzUUzMFa7EcJP+mOnnkij/6PCEowaq2Iwwzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2365
X-OriginatorOrg: intel.com

PiBGcm9tOiBCZXVsaWNoDQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA1LCAyMDIyIDk6NTgg
UE0NCj4gDQo+IFRoaXMgaGFzIGdvbmUgb3V0IG9mIHN5bmMgb3ZlciB0aW1lLiBJbnRyb2R1Y2Ug
YSBzaW1wbGlzdGljIG1lY2hhbmlzbSB0bw0KPiBob3BlZnVsbHkga2VlcCB0aGluZ3MgaW4gc3lu
YyBnb2luZyBmb3J3YXJkLg0KPiANCj4gQWxzbyBsaW1pdCB0aGUgYXJyYXkgaW5kZXggdG8ganVz
dCB0aGUgImJhc2ljIGV4aXQgcmVhc29uIiBwYXJ0LCB3aGljaCBpcw0KPiB3aGF0IHRoZSBwc2V1
ZG8tZW51bWVyYXRpb24gY292ZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IHYyOiBVc2Ugc2VudGluZWwgY29tbWVudCBvbmx5Lg0K
PiANCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm14LmMNCj4gQEAgLTM4NjksNyArMzg2OSw3IEBAIHZvaWQgdm14X3ZtZXhp
dF9oYW5kbGVyKHN0cnVjdCBjcHVfdXNlcl8NCj4gICAgICBlbHNlDQo+ICAgICAgICAgIEhWTVRS
QUNFX05EKFZNRVhJVCwgMCwgMS8qY3ljbGVzKi8sIGV4aXRfcmVhc29uLCByZWdzLT5laXApOw0K
PiANCj4gLSAgICBwZXJmY19pbmNyYSh2bWV4aXRzLCBleGl0X3JlYXNvbik7DQo+ICsgICAgcGVy
ZmNfaW5jcmEodm1leGl0cywgKHVpbnQxNl90KWV4aXRfcmVhc29uKTsNCj4gDQo+ICAgICAgLyog
SGFuZGxlIHRoZSBpbnRlcnJ1cHQgd2UgbWlzc2VkIGJlZm9yZSBhbGxvd2luZyBhbnkgbW9yZSBp
bi4gKi8NCj4gICAgICBzd2l0Y2ggKCAodWludDE2X3QpZXhpdF9yZWFzb24gKQ0KPiAtLS0gYS94
ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vaHZtL3ZteC92bXguaA0KPiArKysgYi94ZW4vYXJjaC94
ODYvaW5jbHVkZS9hc20vaHZtL3ZteC92bXguaA0KPiBAQCAtMjE5LDYgKzIxOSw3IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBwaV9jbGVhcl9zbihzdHJ1Y3QgcGkNCj4gICNkZWZpbmUgRVhJVF9SRUFT
T05fUE1MX0ZVTEwgICAgICAgICAgICA2Mg0KPiAgI2RlZmluZSBFWElUX1JFQVNPTl9YU0FWRVMg
ICAgICAgICAgICAgIDYzDQo+ICAjZGVmaW5lIEVYSVRfUkVBU09OX1hSU1RPUlMgICAgICAgICAg
ICAgNjQNCj4gKy8qIFJlbWVtYmVyIHRvIGFsc28gdXBkYXRlIFZNWF9QRVJGX0VYSVRfUkVBU09O
X1NJWkUhICovDQo+IA0KPiAgLyoNCj4gICAqIEludGVycnVwdGlvbi1pbmZvcm1hdGlvbiBmb3Jt
YXQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BlcmZjX2RlZm4uaA0KPiArKysg
Yi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcGVyZmNfZGVmbi5oDQo+IEBAIC02LDcgKzYsNyBA
QCBQRVJGQ09VTlRFUl9BUlJBWShleGNlcHRpb25zLA0KPiANCj4gICNpZmRlZiBDT05GSUdfSFZN
DQo+IA0KPiAtI2RlZmluZSBWTVhfUEVSRl9FWElUX1JFQVNPTl9TSVpFIDU2DQo+ICsjZGVmaW5l
IFZNWF9QRVJGX0VYSVRfUkVBU09OX1NJWkUgNjUNCj4gICNkZWZpbmUgVk1YX1BFUkZfVkVDVE9S
X1NJWkUgMHgyMA0KPiAgUEVSRkNPVU5URVJfQVJSQVkodm1leGl0cywgICAgICAgICAgICAgICJ2
bWV4aXRzIiwNCj4gVk1YX1BFUkZfRVhJVF9SRUFTT05fU0laRSkNCj4gIFBFUkZDT1VOVEVSX0FS
UkFZKGNhdXNlX3ZlY3RvciwgICAgICAgICAiY2F1c2UgdmVjdG9yIiwNCj4gVk1YX1BFUkZfVkVD
VE9SX1NJWkUpDQo+IA0KDQo=

