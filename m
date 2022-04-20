Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17D950810A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308841.524700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3kF-0007G2-KN; Wed, 20 Apr 2022 06:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308841.524700; Wed, 20 Apr 2022 06:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3kF-0007Dc-Ed; Wed, 20 Apr 2022 06:23:19 +0000
Received: by outflank-mailman (input) for mailman id 308841;
 Wed, 20 Apr 2022 06:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWYm=U6=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nh3kD-0005Ls-8F
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:23:17 +0000
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c14b469-c072-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 08:23:16 +0200 (CEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:23:14 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 19 Apr 2022 23:23:14 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 23:23:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Apr 2022 23:23:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Apr 2022 23:23:13 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3500.namprd11.prod.outlook.com (2603:10b6:5:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:23:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 06:23:11 +0000
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
X-Inumbo-ID: 5c14b469-c072-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650435796; x=1681971796;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+oUTanEnh2AObnHMuWR4ZPdXYH+k9bN76JETz2KqUek=;
  b=atLK8hKYO54LYVXfzNTK+UC4NTqcE+JJp3qrB0FQyc6HrLcv4jEnUnVd
   odO0xFvW7WBMhRwOX+YaTj7haYLKBgTUp/O7cE42SGgiJYdJRulcvifmC
   0b2qxoViL7YTOCjV5v9D3wIg8q11nfoqRiujcc1O74hTN9U8wDPVPSRyJ
   SZYkumhHvaitxg5g7vdlC2Av/5Rtf5otkNsCmYQbGj/FAhOThrzdmOq1d
   atpOHNSEwKm9V8zFOwx1PWcN0tA++oyMHA1Fv7rDFT3F2o9c05aalJzP8
   7PxC4ufo77B3Mrda5an5rOB6UZrKjGL0exzZMBBNh8/n2SlDHMhip/KFo
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="264122960"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="264122960"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="510429285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2GQ/030/ccWmP2IEf+/KYzyg1U/fjaUlQObA9/uCYV87nZuMX2vif3ZufqWQbJyCiy7I6r9fvmtN86Btz1z4/MWCdVNnIG3nD0P2wgBUjIYLT8kZKlOg3IEZn+Y8ljZDrrRk+JSDtE/rEQrEubGdA6FcKQYG4omiq4PzboR2W9Vv+RiR2975Ik8PtHTOg4MjgEoohjVcLg9olHiJrJpVKuQg6sZFbc3bkXG8Ouh+CIZA1ZQZAS2h+XMgGX0lkD/4Zs3+gCxeH1DuJPNeTch2x8+3iOfa4KmBCOQOkz7yyUWYGZ4Uvlxrv6ehn0blTY9tqwlX0Paw2qx9rJSj5hIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oUTanEnh2AObnHMuWR4ZPdXYH+k9bN76JETz2KqUek=;
 b=AOEkKmLlfBb1I+/LvtIQJodwmGScI8ZgZjoEmUVhTdNb5RuLSWAm82VQWTpseA5Yb5clcFRbwl2f7Jwr2qkeSv2D37ieApGuM/BceCvrThPqmZzT259TEwBw0M14SXpni5lKTREqwCkZemaXEqA2yqQTuUjDdQM4wzS1W5oYZIA1+8hEUIHY+FL5NGmWtrdTKhw/8H26EzUgftz9HoYzNgjvNuD/Q4pSlJTXZKlxFgd6z903fxHoGaurV19TAdc5LfFXuTKRs9ZRrYPx+hLidM9v5ayhgqrx6unieGKgzjHxsG9UOW/6AzfCHoSPs1oWrAIm3OJPpZtBqowfkpGOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH 4/8] VT-d: refuse to use IOMMU with reserved CAP.ND value
Thread-Topic: [PATCH 4/8] VT-d: refuse to use IOMMU with reserved CAP.ND value
Thread-Index: AQHYTYfNLLeYzKkfHkCJpFNUAy97oqz4YdEw
Date: Wed, 20 Apr 2022 06:23:11 +0000
Message-ID: <BN9PR11MB527679AB16E82DE7BCE5EF888CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <0f7136ae-0b52-431d-f789-4b7d5bbecb25@suse.com>
In-Reply-To: <0f7136ae-0b52-431d-f789-4b7d5bbecb25@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c863f4f-f1d7-401b-7131-08da22963e93
x-ms-traffictypediagnostic: DM6PR11MB3500:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB35002B73E2816F540F88B5648CF59@DM6PR11MB3500.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pg6+6WYOJnpg+hOhUxmJ3PWsRWZAC0f8VYUXcaT7xnBNDAUCQB0e4a17SLO0nBkfmomAqMWJ7SLnHUqm/b08Qsi3vJaiYjxQ9aaZHAL4oYuOAbxRs/Doc7m4r1sjEVI+TCSsWls2xkQ74juQylnz9p5sOPdGzhVNUZlhJdkuGKp0f/02BU7vfHxEKb+rSplrza91PfA1OHC0q9tafVi8ZlJu1NDUrW1dO2gXy98wCIEkIkJP53lF735vqG0aO7RQH69RwyBxLbegNreAJuuJyuXvIqh97c3vDhGqM5xSuoXxEcGWufrhpVMflAKqLfiVTmZTDdnjgF/Z3n8o7pRgrnL2HY9a8LKYCmUXYr/B3XrigVl8Jj8H0/ieEN73gPI7S/PZ7UedX5y+Z7PmJxWoqHd6LOGlJ4Z4+w75FnoEY+W/XTLRY969s46GSKtpYIq+qd7I/sPBJoueqBuwXXV18ClriVx2Raozn8V2W4iuqxdUEr/DlTA4zjcwt545r0M8geZXlwUBQC1bEhXfF5nQ4C4Q5UyGPTvGpk1Z/JL8KMrJv75jJwkTLU6RWpY8cTMAX2hUQp2i3nyOofrteb7NF0l+5/uMX2aoZkPvcpgi4dF5sA2+Z4YdccVEa8M1Izwcx2y0/gANPR8LJYgslo11okAPxs+NexAuGoUbeWis5uo6wuoYf4PFkO6er9lmuiUhQyO7jXCETXY3rgzaci04YA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(54906003)(2906002)(5660300002)(8936002)(52536014)(122000001)(38100700002)(33656002)(38070700005)(7696005)(9686003)(4326008)(8676002)(508600001)(6506007)(76116006)(66946007)(86362001)(64756008)(66446008)(66556008)(26005)(66476007)(110136005)(82960400001)(55016003)(316002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlRNRnV5YnovSzhvZElnOFo3U0Q2ME9NUHhwejZGUDhnSTN3RXdKV2Vqc3Jl?=
 =?utf-8?B?RU1jWTFkUG5QeDh0dVk2VHpDUXhoZFhPTzQzSUU3TzFET002TmRPVWpiU0FV?=
 =?utf-8?B?c2RhQXFUVnNGVDEyRjF5bTJLaUlta3F1a3lTS2tFZ3FxWnp5cGE3V1R6aDZT?=
 =?utf-8?B?WFA1TmxHQmRkOXhWQmZGd0YvWFV1d2o1bEJFbGtDd1lvRUp3K3NJNHNUWUIx?=
 =?utf-8?B?ZW5FM1BZQ2k3TXVkWTE0cjc0STJOWnk5NWxleXRGY2xISEp6YitCUTBKK0ZV?=
 =?utf-8?B?bGM5ZzVaT3U1alFjeU5Ub2JzeEFlWGhjYThmSHIzeTRGZVlOTjMvWmtMLzZt?=
 =?utf-8?B?YldpbTIweDNCeU80QUdjOU9vSzk1NTBXY3d3RSt6ZWdEbVR6VCtrZ3NEN0dT?=
 =?utf-8?B?bHZkMEs4aUVVL2pSaUFCaFR4cy9sOExRaWxMcy8zVC9zc2tFMDFXTEQ2OGI3?=
 =?utf-8?B?QlJDN3BBMUhWcmE0R2dqaDJTU2V2MEwvWWs2NEFUalY5T0RXaXYrQmRNZkVJ?=
 =?utf-8?B?RFdiblZmZVhzdkFHSXJXM3JXZHkzRGxnd3JLNXo4OFdISXBmL2lqS3lweU41?=
 =?utf-8?B?OHY0dmNlbURNS1l4WmljN1doR2pRVXRGRTY3b1k1Y1o4cDRVRThzajNXODNK?=
 =?utf-8?B?ZkRyNEhtTG9IK3R2Skpnb2JtSDFBRi9GTE1vSHprVGwrRzVSeEVFeUtnaVFq?=
 =?utf-8?B?TkRiWlRvUkNiSjhnWmNvdkRubGZWMkd3dk5CMWt3ek92L2xiZE82eDVtWG5v?=
 =?utf-8?B?WklYd3hDV2lLTi9TSEd6NTdFdzA2aG82UFJvMnZKdjZGUXBubFhQS2VFbXVk?=
 =?utf-8?B?NExabTRNL2N6aHRTUS92UGkrTzZlaDd1SmhwOEdmRDViV3hPMW5wWlRMUkpt?=
 =?utf-8?B?ZTVLdUFQSXJGTjlKelhoMURGUktOb3lmckNtZEFtVGF3MFhobTM5Si9jaE4y?=
 =?utf-8?B?SFM0aTBNaFhqc2FtQzVSSlRxZU1yWnBreFA5NXJYQ25zZ3ZteXdFWndXOVJ2?=
 =?utf-8?B?OEFyU2liYy9IUkxPRFUrTjBzSUNvY1pWWWxEUUZ2ZXM1dW1xU2lqcldDMXpZ?=
 =?utf-8?B?eG9MYU0xQW10NUdWdThTRklOVEVxOUM1QWt2bEorSkxmVUpsZU5YLytxWk5O?=
 =?utf-8?B?UlJQOGhRMXo5UUdDRkJraWxaeFdCd1Z6V1ZXYzlLck1pQU8xcDNDS29NOVlS?=
 =?utf-8?B?OUFNWEMzQmxkZ3F0SWladDN2cUV1a2NpYkJIQ3pLcjIzdi9hRmdQQXpDeWcv?=
 =?utf-8?B?SXdHVU5acmQ1NlEvM3FwRThuNEp2TUJtZGl0TzZoU0owK0ZHNm1reVZWZ25t?=
 =?utf-8?B?Q1U4bERiQVZ0KzhUbmV6ZDJWOFg2MXZsQ1BsR2E4eHkxa1RuUElYbG9QQlVV?=
 =?utf-8?B?aHFXUVh5N2JWbTdvNjIvQ2hoNjVCMkhlTk43eUo2dSswbHlDNjZ2U2ZxUXZJ?=
 =?utf-8?B?TktVaFlkRythODI5QUtGc0R1Vldpb3RNQlNoc0VDTzJ1UjFLRGpsUThhS0ZJ?=
 =?utf-8?B?M3JEd0JRWk91L1dzVVBsb2pCNkliWVpZYmZ4Wk9PcDFvbjFSLytOSTI5bXY5?=
 =?utf-8?B?ZzJGZWpEcEVnam9YWjBSR3l6M2R4Ym9DKzdlK2FaZEdCUGxVb0h0STY2OGI2?=
 =?utf-8?B?Ukd3TzhhMWg2RGlKNDdRS1RreUtwWE03cW9JblhCMExsUmhjTTNzZW9PT0g1?=
 =?utf-8?B?UUZmK3RMemxoY2F2Mm1GdkpDRjdsZVNQUjd5T0lyS2lUME5tWW5BTjFmNkhK?=
 =?utf-8?B?STZWR3VXc2VpaEpYWFp3aTJ1cFZZOWhwbTRyc0tCV0c5K09PZ0MwUFhmYUY5?=
 =?utf-8?B?b2hZOXU3MnhwMytkTmVicE1mMnI0ZU9VMFpmN2p0ekFQRVh2K1RNTVVRV3Ey?=
 =?utf-8?B?eHpSbEFicFRkckYzSi9DUUhCVWd2akNRUUxNUXdjYkF3VGtLZjh1L1JxQnRK?=
 =?utf-8?B?WUFuOUoraEU5enpzcGNFT0djS3lHY2NBQStyaUtvZ3lRazN6dUhreUdRRHY0?=
 =?utf-8?B?V05xcUl6Sm40anQrd09vTTNDVkJaNktJTFo1TkgvN0swb25uL2VzK2hZM0ky?=
 =?utf-8?B?SGZyckszRENVRlIyS2hTYUNCdi9POWpCUTNnSHFEU3E0UFg1REg2bDV2SmVE?=
 =?utf-8?B?TG83YmM5QXNtSHRJc01nUzlabjY0TlhrNjAzbWpoeTN4eXhoWXVzUkp0dEJU?=
 =?utf-8?B?d2VYLzh4U2YrTXJXbUdmcENaaXM1RWJhVmxMeUIrb0R6YnZjQ0JaSTAvUjFm?=
 =?utf-8?B?WTcrOC8wb29XYU5IV0MrWWw3S29qTzdPUlRkeE41UVdTc3p6Z2JwZmNkQWtO?=
 =?utf-8?B?QmNYMzBISC9nc3R3L0hzUFVJK1ZQcmQxNFA0eHpCSXYrbDVvMlBkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c863f4f-f1d7-401b-7131-08da22963e93
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 06:23:11.5230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RlF4ogfQofDYMaKpr4cyopJx5FKUrVoJ2FPtV5sMiQNhd20jf1WVXj6X0CEd2/IQQtH40S+MGrDamC2tnmpjwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3500
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMTEsIDIwMjIgNTozNyBQTQ0KPiANCj4gVGhlIGZpZWxkIHRha2luZyB0aGUgdmFsdWUg
NyAocmVzdWx0aW5nIGluIDE4LWJpdCBESURzIHdoZW4gdXNpbmcgdGhlDQo+IGNhbGN1bGF0aW9u
IGluIGNhcF9uZG9tcygpLCB3aGVuIHRoZSBESUQgZmllbGRzIGFyZSBvbmx5IDE2IGJpdHMgd2lk
ZSkNCj4gaXMgcmVzZXJ2ZWQuIEluc3RlYWQgb2YgbWlzYmVoYXZpbmcgaW4gY2FzZSB3ZSB3b3Vs
ZCBlbmNvdW50ZXIgc3VjaCBhbg0KPiBJT01NVSwgcmVmdXNlIHRvIHVzZSBpdC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KDQo+IA0KPiAtLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMTI2Nyw4ICsxMjY3LDExIEBAIGludCBfX2luaXQg
aW9tbXVfYWxsb2Moc3RydWN0IGFjcGlfZHJoZF8NCj4gDQo+ICAgICAgcXVpcmtfaW9tbXVfY2Fw
cyhpb21tdSk7DQo+IA0KPiArICAgIG5yX2RvbSA9IGNhcF9uZG9tcyhpb21tdS0+Y2FwKTsNCj4g
Kw0KPiAgICAgIGlmICggY2FwX2ZhdWx0X3JlZ19vZmZzZXQoaW9tbXUtPmNhcCkgKw0KPiAgICAg
ICAgICAgY2FwX251bV9mYXVsdF9yZWdzKGlvbW11LT5jYXApICogUFJJTUFSWV9GQVVMVF9SRUdf
TEVOID4NCj4gUEFHRV9TSVpFIHx8DQo+ICsgICAgICAgICAoKG5yX2RvbSAtIDEpID4+IDE2KSAv
KiBJLmUuIGNhcC5uZCA+IDYgKi8gfHwNCj4gICAgICAgICAgIChoYXNfcmVnaXN0ZXJfYmFzZWRf
aW52YWxpZGF0aW9uKGlvbW11KSAmJg0KPiAgICAgICAgICAgIGVjYXBfaW90bGJfb2Zmc2V0KGlv
bW11LT5lY2FwKSA+PSBQQUdFX1NJWkUpICkNCj4gICAgICB7DQo+IEBAIC0xMjk0LDggKzEyOTcs
NiBAQCBpbnQgX19pbml0IGlvbW11X2FsbG9jKHN0cnVjdCBhY3BpX2RyaGRfDQo+ICAgICAgaWYg
KCAhZWNhcF9jb2hlcmVudChpb21tdS0+ZWNhcCkgKQ0KPiAgICAgICAgICBpb21tdV9ub25fY29o
ZXJlbnQgPSB0cnVlOw0KPiANCj4gLSAgICBucl9kb20gPSBjYXBfbmRvbXMoaW9tbXUtPmNhcCk7
DQo+IC0NCj4gICAgICBpZiAoIG5yX2RvbSA8PSBET01JRF9NQVNLICogMiArIGNhcF9jYWNoaW5n
X21vZGUoaW9tbXUtPmNhcCkgKQ0KPiAgICAgIHsNCj4gICAgICAgICAgLyogQWxsb2NhdGUgZG9t
YWluIGlkIChiaXQpIG1hcHMuICovDQoNCg==

