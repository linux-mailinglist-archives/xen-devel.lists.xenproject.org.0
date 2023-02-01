Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B0685ED8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 06:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488107.756017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN5Zq-0005mc-9r; Wed, 01 Feb 2023 05:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488107.756017; Wed, 01 Feb 2023 05:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN5Zq-0005js-6m; Wed, 01 Feb 2023 05:22:34 +0000
Received: by outflank-mailman (input) for mailman id 488107;
 Wed, 01 Feb 2023 05:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rT7Y=55=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pN5Zo-0005jm-CB
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 05:22:32 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b808c5f-a1f0-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 06:22:30 +0100 (CET)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 21:22:28 -0800
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2023 21:22:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 21:22:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 21:22:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 21:22:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 21:22:27 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 05:22:25 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 05:22:25 +0000
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
X-Inumbo-ID: 6b808c5f-a1f0-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675228950; x=1706764950;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zOTlIpf2oigtCg5VIk1QqY2SReEAL5oHdH2ha8N45rY=;
  b=YxJGYV6TLfT+/A4u62n47ptvbUCwgnkw3jFmq/ULutPq+tdJMsXP3+Lq
   9Bp6swRlYExQOP1ixclx+vRE3zESEuuO9r6B0Fvzaz+JNlTU1gSKRn607
   tHvy5evRX5rDgnC8Rzu4jWwLWVaLMcvi1TLyIF0p8BNgGzzt8hafhhoyz
   nYyspBvqy0IWwhjTn1S4MFQNeKEQ1hQ/2XQ8OrB/y+j+AxevIbCfQk6NK
   fi2SixWyM/p2E6swKq0qENlbGD9Cc4wipZZmEgbd0WmmpaPvhsY5/csLg
   dJKNoEqsWeU+A3iMqWOnK/c0Ym+vhyEfKkJmWefZZw5m3DVQzAlj/zl1V
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="326704959"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="326704959"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="728247281"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="728247281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBOf+shBrKvyh7hnkx1WdyBEJrYclSQrtoCT1Oc3UYyWn7CFW1YnBcOv7J4NWLOrulbg1QJ/uYLEqYPesiTJcbkQQrVyIEbihx+6FKVbOLt3/7Qq/GIYs6B5eH4ZX8zgWnX9sb3TvLibyCozJ/Rh7fd3YHF9GoW3OVan0YgZInHIhJrCmnBBj3Gj1xcCUyF07qWlE86P3hAWvTKHNrpIF/ILI1UIX0XPFaXpN4YnZco7j7dJLjtwM4hNXepCmxBXrmmYkf5TdnjlfCUGmjfPZmeAhK6K95bXOwc2NwgNKNYLJeENaMV/Ism76TPzokR6J/BKImmk1aYv/2BcAhFI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOTlIpf2oigtCg5VIk1QqY2SReEAL5oHdH2ha8N45rY=;
 b=GjjSQae7cV38KSYWNg41Y9GKgeCf6Puck2BOnBWpfxak6H0RNhwc9hJjUpJWwmPaxwfWThS+XcgWq4I3+BWvBmmtDG+sFHIylaViDDkzSI+MDLY5mjP3AR/SVx8De2wvPVLAR7blVYPSi8pjiWz4ONibOo/zubFcsqH/vuILPthxSloosmzJpy8G9vwIzIKUxBNDOTQ3NCzh3LBoXEDLZVGJmh33DqT46aTpBBav0h2fKWaBSTn30Qrhu5uQxpzBg8kPhk7nliy5LYCygbiXFzE544GNF34P9EipeT0AhqaP1SwyYmJI8aa8paUb/AggVhG70NDvWwOuCdmbG3f6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Beulich, Jan" <JBeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Pau_Monn=E9=2C_Roger?= <roger.pau@citrix.com>
Subject: RE: [PATCH v4 4/5] x86/dpci: move hvm_dpci_isairq_eoi() to generic
 HVM code
Thread-Topic: [PATCH v4 4/5] x86/dpci: move hvm_dpci_isairq_eoi() to generic
 HVM code
Thread-Index: AQHZL/FFtoM+gBrgKEi9hv9HYuOhzK65mlrA
Date: Wed, 1 Feb 2023 05:22:25 +0000
Message-ID: <BN9PR11MB52765F85D681A9B0510D7B3F8CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
 <20230124124142.38500-5-burzalodowa@gmail.com>
In-Reply-To: <20230124124142.38500-5-burzalodowa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN6PR11MB8170:EE_
x-ms-office365-filtering-correlation-id: 7f122c90-6fe6-4e0b-13f7-08db04144db9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KjXE9ECx6qWJLCsbwYT1nPfKlfKZ2ZQzdvbfDENVXiBaFBpd2HOWMDAKt3O82X9cidy1tSvGG9APsTNf+TN3F4enN7ZQNZB9ZmNuqlL9f6vcmIg72P571ehUBb8Db/4uqWbo/Qcc2bqnJiWtz63z7SWj2Bs6tmpEWpvScd7s1w8dHA7ExlAp/9aqzZmmajjoCQgSHN2U58J0b3TRrdbfUgF8otGHtw/2TiQw4VZ0V7z4NeYEAcGyEWBdwX/tsEo9OYIpcKndQmJmLXIUnDOFsgIsrTaUFgkdfH8IioQxYyVdXi1wE9wTfFcOrW8rFbaAyRKfgIy1ioGRemR+NenU+zxqg65+H6M19tF5eY/JTXHcWvX6sVDtbfMUqifglSG11AfYiF82zqxx42vgJ+TC0lqg4S9YOMNPX62OisQV0cGzy8o1xKEtBc3zN1mLcNeVByhoEg22p4IrfwE8zMfOKXeRaH6n8mHaNKMQpBzn+7AbMiPwxugDZpPLbKPCmYoxovEQGAoUNbWMjwZfvd1U5stEoRXlQuOUW0IJruBz1X3HKGrl8IVwEGsmw+2JvmlOfFqSdgUNt5/LwE3XrLpEfVGi6nwGkcidAigZlW4DOw8jBelymZqjxD2h7yCpmsKVURyB0aBPRuPerp+q47dPC7czxAEgvmC6O4/yfy8r40WQjdefUpnSuKjYOGPnIMgIyimlj7NiuL1q9FmgOEBE6dcG2L6t5FjmZnFPSc15nKY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(8676002)(64756008)(66556008)(66476007)(66946007)(66446008)(76116006)(110136005)(316002)(54906003)(6506007)(26005)(9686003)(186003)(478600001)(33656002)(71200400001)(122000001)(7696005)(38100700002)(86362001)(4744005)(38070700005)(2906002)(55016003)(4326008)(82960400001)(5660300002)(52536014)(8936002)(41300700001)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?z+GWMihmly/zX7lG4IPxfQ/uoZ5eloCN03e87F52UA0XuhB1YEl0TOLdSG?=
 =?iso-8859-1?Q?IBI8MEyTi2mv/LkwzzHP9GBB74gGrka+h9CUu/E89QUSRVh3i6c83Tb78Q?=
 =?iso-8859-1?Q?DQ5ZbRFm23oxtwuch/35yDv1y/GtX7bPM96B/9Udin2+TnEb96V+TCAmpt?=
 =?iso-8859-1?Q?xlNhyeV/Ns7Lte26cn8jTgG7M1MqT4AuhaKewy6hxpW8mN+1RNcylV7b0Z?=
 =?iso-8859-1?Q?7ydc1S/TDEO/xgn3tZtxF0yV3bUZKuL6tcFUaDUaUEcNJdw93xzhNYcPWV?=
 =?iso-8859-1?Q?4zBoy2iXvtWBnL3otpmgxheyye2KeDB/6ag6+qVZa0IndX4nBhbOBivNaA?=
 =?iso-8859-1?Q?c3OPohJgvXNhYN19qJlpSWhYLvLtenY3dCpYGHFOs2DizvO47d0Ndxlo/Z?=
 =?iso-8859-1?Q?DYNA41Oy0qLx/f8Z8bTq2cq21rWVbCPJERH4h/EH1h8nphqrUycY29PYcw?=
 =?iso-8859-1?Q?XU5N/nilPBTQI1i+lgBzSlobp5he3gY9t+UcHIHBktCQs82jIAUzyvc824?=
 =?iso-8859-1?Q?zkuDwgnnoPx+bg6MM9nVsldpGNsJaiRUq9XfN6P5ke3T3sn5XAayz2VbWE?=
 =?iso-8859-1?Q?LrDg4v2XuNdxSqMXdlZh8LqKYuHKhk4gmMuK10bNh0Ae7oGJ9Xun9yzYaB?=
 =?iso-8859-1?Q?+dojKR6EolpwLTgtjoWTatpWAm33iOKAq84gTK0HhGLKzkopFmRFtDLKcH?=
 =?iso-8859-1?Q?V72I/utXA6FXasj6OmcWgc/TlHUA+Y71peLMBBkV1aXd15qsPQbgnMFb0J?=
 =?iso-8859-1?Q?XhUkyV5vavBEGnMKQdC0BnKdH99BtJsFQOFThmxOb4jkZL/KiJzbDM4fhU?=
 =?iso-8859-1?Q?bWaf0d/lWqDprIwa+5hJWfC4OyeGV9Q85ZnM1v/Tswj3vTEG8Utdwsz2nV?=
 =?iso-8859-1?Q?nwHp5Pj8pmRKKbQgVwi+WlABkIVD+8s3A2dmh4e9FIE5+WwS02CwtoJcjq?=
 =?iso-8859-1?Q?D066sSMmHFOewoCAnO0kq822utq/FxZC/NfV+DEoJ3YiPmOu+49ic/T92Z?=
 =?iso-8859-1?Q?npdmp8dOU9I67zKzR26dvXzBCU83OD4PSA5ox9192hPPqSlxmHVA+WKfB4?=
 =?iso-8859-1?Q?7AvY2AgG/YPRffAV+NsX5rDOyZ/rnGik+Z9UVzvnOhRwhMAcYFMkFmQkI0?=
 =?iso-8859-1?Q?cGCnPY//IWSU5t0jNP35brkBy+FAQhXRRXb2EjMF1MBLvezWBvy/NRqJ5t?=
 =?iso-8859-1?Q?51wlJYByR+JIDUK18yzONWmS7JlwWT5Tb6I48+oXr7zm39Sv4XM/W4U3ra?=
 =?iso-8859-1?Q?w3OCA4+KTUwvXqHcmo+hRmP6FMXiv7dgJxZNqkaebAfwkKXhwbslouxFH3?=
 =?iso-8859-1?Q?FbrsusvxlaP4StFpRJk/bNZEnRM3D/17/lxVUirdLwEL7sFji3jpB+Kd7e?=
 =?iso-8859-1?Q?lyrpYyj5RIHzZK57QZKIbq40k1MalmAY1n+JXS5C8RRA6U43JyNLg9ij/g?=
 =?iso-8859-1?Q?IELAUksxutkWSJwXDAZCs2R0d6vtsws3vrAZ3fbG6bPCR9M/pxSS128iam?=
 =?iso-8859-1?Q?sqSnVVNeMOCFxA51Mx/8C6/9Q36H3nTJZ/jJND0YdbOwK2joPkn/F3Uc6f?=
 =?iso-8859-1?Q?0MEapjBobDbeCggVHb4bOCWGo1t57sR0N3SXIfiTZ1UCvllE1pzw/OjJjy?=
 =?iso-8859-1?Q?vJzLkcesF0i24CBFIQkOca0R3NSn9KCum3?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f122c90-6fe6-4e0b-13f7-08db04144db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 05:22:25.2264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pUAizSI0aHD5KhbvPBFkcYlU0NFSTkph6wno2SpUfTLEPJJyyCixlE7DpQWV/f7WCttTtXg9rLxhO1y2OH67Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
X-OriginatorOrg: intel.com

> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> Sent: Tuesday, January 24, 2023 8:42 PM
>=20
> The function hvm_dpci_isairq_eoi() has no dependencies on VT-d driver
> code
> and can be moved from xen/drivers/passthrough/vtd/x86/hvm.c to
> xen/drivers/passthrough/x86/hvm.c, along with the corresponding
> copyrights.
>=20
> Remove the now empty xen/drivers/passthrough/vtd/x86/hvm.c.
>=20
> Since the function is used only in this file, declare it static.
>=20
> No functional change intended.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

