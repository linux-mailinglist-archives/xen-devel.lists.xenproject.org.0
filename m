Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0DA6B87E2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 02:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509424.785151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtsu-0004Zs-TD; Tue, 14 Mar 2023 01:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509424.785151; Tue, 14 Mar 2023 01:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbtsu-0004Wo-QK; Tue, 14 Mar 2023 01:55:28 +0000
Received: by outflank-mailman (input) for mailman id 509424;
 Tue, 14 Mar 2023 01:55:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhtR=7G=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pbtst-0004Wg-Q1
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 01:55:27 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 449fe60f-c20b-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 02:55:19 +0100 (CET)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:55:21 -0700
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2023 18:55:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 18:55:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 18:55:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 18:55:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 18:55:20 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 01:55:18 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::1aac:b695:f7c5:bcac%9]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 01:55:18 +0000
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
X-Inumbo-ID: 449fe60f-c20b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758925; x=1710294925;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vI3F0rj7QWzkvpHVeussW4i2MPFpmN3sNkoxZOK3/Q8=;
  b=CN2X+IHGyJQ4GcJwaNZ6dyy8p4658WE8wA9gjxETw4l81SeumT99Awxd
   Nk+Tj9nrcJLFsNsP9Y9lelzRltYhZOqTE1PgodFSqhLbYNiJPdgVujvQs
   JqiVUrZ+iGw40RtQUF/uYszw9nth4xDMupkLCdBv/5/Q7PVawMLWf5iN0
   cRE8o4YEd5gZXY/mheKrWv8ze13dvoZZTX0fwo+77hi3GGtu6PD8DEhWY
   R6Xckh14xobw+qI90HsTHmCGCxs1gwvzaj+HvuvpAnWNk7RsnoGNjKZr6
   vrlCgy1G1m6MDd+xcxfQEyB2WV3MBj3iBOR35K3504LZviOGYS/WLDaEm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="364968398"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="364968398"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924725034"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="924725034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6O/vnIaxbZhbcPwHr1jjUSIlqVwsNb7wTAmXhV56MDfUmh9LNsOnAN4njKQAPyl6WjEFquLDaRkjynQIy9isKRbfkX/W6cQ9WGKPtTw1/N417/9Oezy2l02ufhLjwsSi9XLrfgSaEn69nMRXUGDwYhxnLLYWQaFQiQPBQvOsqTTOacRkjzhsG3dOkbLKX+VjKtYUN3WmdTjLBJYsI2MOU0cCHOUbZrN54WUuRX6WJ0sg0jmd6l6bVoa+EFSkXJNO/uwp1STEzvgrMAFusCc+i4Yt+LPw7gfhmwCPetmXX5eNbnz4mwop+dOlJbcZr3E4UEjDrpsOWC5liWW1VMb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vI3F0rj7QWzkvpHVeussW4i2MPFpmN3sNkoxZOK3/Q8=;
 b=emATcI8E06UWEi91va9Tt4onVPbGDqmHWHfcqh27WMn6v8C+LU78JPEzWaqmpE3IV3XNGBaqh36zY6/Fd1QyaPwREDe640Sg14NYqYdeE+ZMsIFd4qSxD7zVBrzJLCBtJgCdLhVVRLMP19+9zkDmU6AE69BaHMF9UI/8UNJWD9bdFwP2BOX2Y7upHZ7Ne2a5EACn8cPMC/QJu1lc8GvwPpZ+un7iiKjC9eUMpKN4uKu39wr2Ll8Z4bh8p5TbzLGn8P4LLpdA1JHqVypiBIQvFn0XliBtLm+0/gXOxyQeT2i8RNqtSCvu9iJw92F7E+WF1hDOr1lNGIxBwX0GQl2bQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, "Nakajima, Jun"
	<jun.nakajima@intel.com>
Subject: RE: [PATCH] x86/altp2m: help gcc13 to avoid it emitting a warning
Thread-Topic: [PATCH] x86/altp2m: help gcc13 to avoid it emitting a warning
Thread-Index: AQHZTaI8c6Gg7osE6EW0fUR5A226Ra75lKrg
Date: Tue, 14 Mar 2023 01:55:18 +0000
Message-ID: <BN9PR11MB52764DAA3A1A8BE422B2C45A8CBE9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <3a455e81-6db1-be47-42f1-9aa49531d715@suse.com>
In-Reply-To: <3a455e81-6db1-be47-42f1-9aa49531d715@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5769:EE_
x-ms-office365-filtering-correlation-id: cb154518-353a-470c-4457-08db242f29ab
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nUyb2As3JkLiY4h/Px179oFvxLarNPgAlkTc6riqhmjilD7zGBkqT9eLsGJQyubeaGECaZ+jlIKqRX90UNXjJ1rUXNDaVy6auGa5/+/ja6bw2hqLzC0uinqmYxWQvhFCmeOCXnU8RE836FqAzi7TabDnJnbwUjkPqfXoyJP8H8kQQK4Y4GrhziLZ70oPcPalFtaymPpgMhVEmLgPEKwJwp3o+Jn7h/yN97i46p3nLiEk9vJnC07Cw7Fu2CWWFh1Z7yX4QtJdq7KJvcYzRBbudSt6/9oJpmnkcLWvi+zmueeu7dKhnqUmwSYn0jRTeqUTJv+n8UrU4GdoQ0Aphj7XhkXxLSu1fxq4w0Ym8089TS/xI/FiXh29kKbbYe1O/tmOlg5FY5Z3y4C6ps77soOjw26TqeZvNmS4Nz5RP61329Bq57nF05JM3hoOpK8+BXGxhIh5DKxu8zP0gyngCJOfEz+IiG2D5ETc6kqoQ5H4m+CDDEbMyF56ddYa7bo4xdOnroaaRVWRDz0npauQCeehpxWDbSMhn2Cjqk+Ng86eU/wui8eZj2JQ8ZFcwFQggL4Aauh3iBubMyYeQItkgeXAC82CI/Wuq6XMigS+8UK1QovCEyT+FIHeTmavcvET98HnmlMLknhEQr7oUQu1KguP5d6VN2fGj0CuKpztzBubZQAg1sjwlp5lPmwBBVyMu6eS2mM4E5MApZewOGjJgX9kHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(5660300002)(83380400001)(7696005)(478600001)(107886003)(9686003)(6506007)(26005)(71200400001)(186003)(38070700005)(4326008)(66476007)(52536014)(8676002)(76116006)(66446008)(66946007)(55016003)(8936002)(33656002)(41300700001)(64756008)(66556008)(38100700002)(86362001)(54906003)(110136005)(316002)(82960400001)(122000001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d29zKzB5YmNpWmVkVHZ5SE1qb1pMeldsSHlXcHJzelhpSDgzNHhDZnh6eGJX?=
 =?utf-8?B?RitGd0l5QWVlcFlEZ0puVTd2UzBjb0dZc3ZqZHVtSDBCM2ZKUnJxbkc5eUxZ?=
 =?utf-8?B?MmZCQXdlZENEVGF1MnRyMTc3K2JMSmsvYzBJaC9NekNJOHVZZWNzdGxZM3JS?=
 =?utf-8?B?UTFEUDYxZXRrZzZUR1Noc3I2NWtBZ0x5eCtZYlJselhjaHRKSndFUVAwaFp2?=
 =?utf-8?B?K2grUHVVTGFPU01hcGdOeTE2WG5BUS9na1JZQjJnbmpUeE9NaG1PMW8xQ25J?=
 =?utf-8?B?Y1R2b0h4L2dEd2tWcWVQczRqK1hEb3QxUWY3aVBWRUp6WlpyNGtCSzdtMDRh?=
 =?utf-8?B?WWNSRHZ2QW1VNDl3a05KL1RGSHRIM2ozUnBmVFBuQnkrVE1hN0xaMzE0amRR?=
 =?utf-8?B?NDRya0luMU9Zak9ONzRDclFCYmUvdGUzc1R4MENmS3ExRzFWWmh5cFBvc0d2?=
 =?utf-8?B?eitRR2RNNENqUnNCUzlPcVkwTks3dTRIdldPZzRFRmVhaDZpL29mdGp5dFI0?=
 =?utf-8?B?MlVvRDFyOVE5Z2sxUURzdE11WXBveTh0cmR5QysvbDJuOFZVTXVDVnc2WWRj?=
 =?utf-8?B?OFNQajNEdFZmcWoyT0tmNXExa2w0cmtFcUpKNitYSXJGcFVvTm51NmFCclI4?=
 =?utf-8?B?Z3hxUWRvYU5FMmFjV2taVkN0dlJzSlRPWUtnU1pYYVdtT1EwSE14ZTAvT3k1?=
 =?utf-8?B?OCtrTkRoU01WclljcFIrZkN2dHU0S1JaczBTT3lTSFZuN3kyNGdmYkYxaFIx?=
 =?utf-8?B?di80WDFJV0sxRUFYTWw2N0Z3Sm1UM2daTGMvV25FK1JIZkI3aGY4cFQxVDZ1?=
 =?utf-8?B?QW1OK01xMkt5YnNaR0hHK3B2TXRoOEYyUnpQOUlyNlMwVnlLVVhRNUtDdlBS?=
 =?utf-8?B?b2plQy96ZVFRT1ZKTFNGOFRRTFlOelFYWVN3ZFAwSDgrNVN4ckFOVThEd0dW?=
 =?utf-8?B?eVQ2VTFITmJXblFpU1FScmZKVEtZMVFKQlgvMDdKWmRFV2pSK1kvemFMN2xO?=
 =?utf-8?B?WUM0dHJxRDZCM2FNb2Z4ejJCVTJBekRtUmVNMkFRK1FDZUVsWHRqaTI3Vzd5?=
 =?utf-8?B?b0FSZTEzbkU3VXUrSFZoem5xcXFKR0FKRndjbTJXdE52Z0xmeWVTdjlXZ2hE?=
 =?utf-8?B?dzFwRW10b2hJQmVEbHVIWjVJY1E3MlArOHZNbEVyQUZWcWVDWTd6NSsrR0Uv?=
 =?utf-8?B?bWwyREtka1RMbFpIRW9hS0dYenBHSkZRc204MTEzd0ZOMkU0eTFKQlFUMVpP?=
 =?utf-8?B?Rm45cHFWNmVHUG5vUGl2d0YwVVNlVlpnZFE0WUhWV1JLWVdyallSSGN5Sk1q?=
 =?utf-8?B?eWp0dXg3OWFiRGlkM280RGVWc1haSnFzL3BNa09mWmZoNCtJQk5LWkJHYlRJ?=
 =?utf-8?B?NGkrL00zOHVTQXE1TkdIZ2NSU1k1WUx0eXQrdWE3VEIvd3gySE1QSzMrb2Fq?=
 =?utf-8?B?YVpsV2ZETjFTQjRvNTk2eDE1K0dTd0J3TWxrRlhXVzhWR3R4UXR1cW9qUVhj?=
 =?utf-8?B?dmxMQzU0dzdkVHJER3ZFTW5vUERZREd6dW1vMWh5ZHRjbnNFLzdUSVFDYkNq?=
 =?utf-8?B?V0llNmVGMHhpb0NELzUwNjVDYThLNUNaL2YrWjk3L2s5TFlocnJOTnpaSDJ2?=
 =?utf-8?B?UjZiUDNpNXBDWFI0N1VjaW1Ud0xrTnozN1M1dkdENjBTc3haQ3BuOEViV3JZ?=
 =?utf-8?B?Q2NGcXdDcy9LYk5UckxBc0pjaHNDa3I3N010SHpGNmVDbkRLL2hBUHpmcXVi?=
 =?utf-8?B?dVp6cGVkNXo5dmZVRFV1RGJjVktIcE5ic3FsR2JDb2dMUFlubVhoQ3BuN3gv?=
 =?utf-8?B?TnF6M3VRNkZoazZXVXpqUzZCQU1lYnZOdi8xS1ZCN1AxMmtwZ242QXRLUUto?=
 =?utf-8?B?OFFhcFdEK3hyWkRqT2xIcjAyVFJtb2p1S1d0ME1ZUXVNY2U3TjVhSkhsUFRK?=
 =?utf-8?B?SWg5c1EzOWVhUzBFdDNHdTV5czFoRk1wclBYWDdybXJveHBSZ3hEQjgrT1A3?=
 =?utf-8?B?bkI4ODAwOUJJUVFjL3RYcjR0cDNQTS9hUlplclVjN2taVWVVOFIwSSttS0xh?=
 =?utf-8?B?czMxbk9FdW1VOVlyWmZJa1hTQVNTY1pxNFJISG5idFRKQXRqdlVxRnhwN0Q5?=
 =?utf-8?Q?bMeWxgDOx/ndU5pftzLaxDSqp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb154518-353a-470c-4457-08db242f29ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 01:55:18.3897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PaAPT+m3FGEB8DA+sEGjut+hxfbzbIHImj8oWWYUwfLx8lNu7IC4XEF2IMe2yPPl99cou1TrsVCIkLaaf5O8Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
TWFyY2ggMywgMjAyMyAzOjMyIFBNDQo+IA0KPiBTd2l0Y2hlcyBvZiBhbHRwMm0tcyBhbHdheXMg
ZXhwZWN0IGEgdmFsaWQgYWx0cDJtIHRvIGJlIGluIHBsYWNlIChhbmQNCj4gaW5kZWVkIGFsdHAy
bV92Y3B1X2luaXRpYWxpc2UoKSBzZXRzIHRoZSBhY3RpdmUgb25lIHRvIGJlIGF0IGluZGV4IDAp
Lg0KPiBUaGUgY29tcGlsZXIsIGhvd2V2ZXIsIGNhbm5vdCBrbm93IHRoYXQsIGFuZCBoZW5jZSBp
dCBjYW5ub3QgZWxpbWluYXRlDQo+IHAybV9nZXRfYWx0cDJtKCkncyBjYXNlIG9mIHJldHVybmlu
IChsaXRlcmFsKSBOVUxMLiBJZiB0aGVuIHRoZSBjb21waWxlcg0KPiBkZWNpZGVzIHRvIHNwZWNp
YWwgY2FzZSB0aGF0IGNvZGUgcGF0aCBpbiB0aGUgY2FsbGVyLCB0aGUgZGVyZWZlcmVuY2UgaW4N
Cj4gaW5zdGFuY2VzIG9mDQo+IA0KPiAgICAgYXRvbWljX2RlYygmcDJtX2dldF9hbHRwMm0odikt
PmFjdGl2ZV92Y3B1cyk7DQo+IA0KPiBjYW4sIHRvIHRoZSBjb2RlIGdlbmVyYXRvciwgYXBwZWFy
IHRvIGJlIE5VTEwgZGVyZWZlcmVuY2VzLCBsZWFkaW5nIHRvDQo+IA0KPiBJbiBmdW5jdGlvbiAn
YXRvbWljX2RlYycsDQo+ICAgICBpbmxpbmVkIGZyb20gJy4uLicgYXQgLi4uOg0KPiAuL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2F0b21pYy5oOjE4Mjo1OiBlcnJvcjogYXJyYXkgc3Vic2NyaXB0IDAg
aXMgb3V0c2lkZQ0KPiBhcnJheSBib3VuZHMgb2YgJ2ludFswXScgWy1XZXJyb3I9YXJyYXktYm91
bmRzPV0NCj4gDQo+IEFpZCB0aGUgY29tcGlsZXIgYnkgYWRkaW5nIGEgQlVHX09OKCkgY2hlY2tp
bmcgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUNCj4gcHJvYmxlbWF0aWMgcDJtX2dldF9hbHRwMm0o
KS4gU2luY2Ugd2l0aCB0aGUgdXNlIG9mIHRoZSBsb2NhbCB2YXJpYWJsZQ0KPiB0aGUgMm5kIHAy
bV9nZXRfYWx0cDJtKCkgZWFjaCB3aWxsIGxvb2sgcXVlc3Rpb25hYmxlIGF0IHRoZSBmaXJzdCBn
bGFuY2UNCj4gKFdoeSBpcyB0aGUgbG9jYWwgdmFyaWFibGUgbm90IHVzZWQgaGVyZT8pLCBvcGVu
LWNvZGUgdGhlIG9ubHkgcmVsZXZhbnQNCj4gcGllY2Ugb2YgcDJtX2dldF9hbHRwMm0oKSB0aGVy
ZS4NCj4gDQo+IFRvIGF2b2lkIHJlcGVhdGVkbHkgZG9pbmcgdGhlc2UgdHJhbnNmb3JtYXRpb25z
LCBhbmQgYWxzbyB0byBsaW1pdCBob3cNCj4gImJhZCIgdGhlIG9wZW4tY29kaW5nIHJlYWxseSBp
cywgY29udmVydCB0aGUgZW50aXJlIG9wZXJhdGlvbiB0byBhbg0KPiBpbmxpbmUgaGVscGVyLCB1
c2VkIGJ5IGFsbCB0aHJlZSBpbnN0YW5jZXMgKGFuZCBhY2NlcHRpbmcgdGhlIHJlZHVuZGFudA0K
PiBCVUdfT04oaWR4ID49IE1BWF9BTFRQMk0pIGluIHR3byBvZiB0aGUgdGhyZWUgY2FzZXMpLg0K
PiANCj4gUmVwb3J0ZWQtYnk6IENoYXJsZXMgQXJub2xkIDxjYXJub2xkQHN1c2UuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KDQpSZXZp
ZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=

