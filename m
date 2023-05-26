Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFBB711F08
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 06:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539956.841329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2PVF-0002Oe-7S; Fri, 26 May 2023 04:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539956.841329; Fri, 26 May 2023 04:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2PVF-0002Mz-49; Fri, 26 May 2023 04:56:37 +0000
Received: by outflank-mailman (input) for mailman id 539956;
 Fri, 26 May 2023 04:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+8a=BP=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1q2PVD-0002Mr-RF
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 04:56:35 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeaa1923-fb81-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 06:56:33 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 21:56:31 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 25 May 2023 21:56:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 21:56:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 21:56:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 21:56:30 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 04:56:28 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dd3:4277:e348:9e00]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dd3:4277:e348:9e00%3]) with mapi id 15.20.6433.015; Fri, 26 May 2023
 04:56:28 +0000
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
X-Inumbo-ID: aeaa1923-fb81-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685076993; x=1716612993;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xLpSRQs2/RbFKHEh6YqMMtyheTjAvjGhS1osYhd82n0=;
  b=b0Fun9qbSmGi5CHOhPeHg5Exa+EltIJhBKh4ThAXNydX42lRY/zdjYnE
   mMhBU7eDlBCapD0zFRqCsHOtCFi8619U0+QD0QzSA6mid3VeNAFq/AQ8f
   fuZbbgJDgH/uXYk6fQiglQBgEwsdOgVNi1Zgj6X9cpA7cQraGqZkWaez2
   d38+OFG2s6J0KfBP/fmxiZ1iS0AivdG5ACs7C0+k4WIBIsO9uctvhl0Oh
   ES0Bloype70DulzrFjQvDKj9GYko1AtdEDJMvQBATYqJ51B9aftGy31x2
   F2fzLss5vvsVBe9ElKfvbS3rmGmK2Tgf9Ub5KN4wBWGkevMPhOJoxUSsi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356499480"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="356499480"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682598750"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="682598750"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/RL2g9MkeKtdvgYB4yw+q42QTODe44bN+El7GIZxlwY/c49F2cYE363KFtskC92+ZrR1zIpY5Vdhph9bgYmwvNQxtL84JZiJXaIZ92H5D8lhp4RRe7KFUEDF9thBZ1W938yLRUyNl5Nq5TVk8dYKNCcCOFmre47LwBbOCA9WiUmw/MKFXgoscHDcSX6H6qwM/D4T/85o1MKPA3dui0Irtl5+UfNeAUn8WhJxMlb2oftPNUuuXFRlyryCTvaK3pFapdUZMvHP5rqI79fmlEZOiVFbu+DqcGm842OKQinPcdchqf08XRySkJjorJfeJaIJ5+7tbbHBeFDSzTzfhNd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLpSRQs2/RbFKHEh6YqMMtyheTjAvjGhS1osYhd82n0=;
 b=gXYnkppxLs61M6PXK744Sv3zrMtViX7uqXDHyb72B6vMCdx7gCD4B72iBL0oPhDlCmC7Tr9PUvU3ndd0cp7RiQULLChvaHOk4ISOFjikGCtp8y1y77cEdSyCVV1mc3mt70VacqBZXfzH2yskmyvJF5+3bLnDTrd1R392xn7IGWJroZt7B1WeYyHK9pSFl+b5Dd2TMAirWAg1/GqluN/9u9bJASkkiWWD2zvXWAbq/T755ek2mma+AMsn45ogjiL+rD/pP7VINJCAQAqJNANgdfU4RbqBXAXyesjd81HiipHGpcdcsbwrTTOHdVqXZlBn3geKar2cXlgqlI9/W7swWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Beulich, Jan"
	<JBeulich@suse.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima, Jun"
	<jun.nakajima@intel.com>
Subject: RE: [PATCH 2/4] x86/vtx: Remove opencoded MSR_ARCH_CAPS check
Thread-Topic: [PATCH 2/4] x86/vtx: Remove opencoded MSR_ARCH_CAPS check
Thread-Index: AQHZiAZCK4QzVtVhyE6LhJcXivukV69sDMAA
Date: Fri, 26 May 2023 04:56:28 +0000
Message-ID: <BN9PR11MB52761BEBB12A7D42812EDAA08C479@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-3-andrew.cooper3@citrix.com>
In-Reply-To: <20230516145334.1271347-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA1PR11MB7812:EE_
x-ms-office365-filtering-correlation-id: 15434de6-885e-4356-7359-08db5da5910d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ueip2I5HSoChXR0ZqprCFbg2yNrjkrSc9UXhi0vA+LQ/J+DW+W5Cqm5zSf3HqcAbkvTU7hwh3XE2Mnjjyixs3ueedt802rRuMwjQhfYYz0M2epB4s2IL0HCfM73kdXCC5rJeGTTI3mEVR8JqQ1rX38Y1Ql2gzESK+ZU6EXd9VpKQ/eA8ddgDQwti82UUQDAagBn5rMhBtsHRreDMhkillnT8nROZ/HjgrBmn2f0bq19jf+6cAl0chbiYwFGQQpNtwu6vLvWdeDNYM3C1VqNSYqwyLOmgm6NMm/B9mUwJeA6/vyrjpFEMv0Zol7Kul5w5SyOK3vZQlLKeYc/oGlMhDB9ssnhNv68gb+8IeyslDsSlEsJrS39Lammj5zprMhNfjz42YKz8yjqE90DuvHTQfa24k6WZxTA07ZvtQ1g0faZRSExmXFZqO9/F0NkWzmh4T96i1pTMeeiQkAKateTjYlopNAPhf7N1svd92k/DRSXsSl9tRDsZ61zgp8MvPvqi6lmuYnDcBUiplwwsqnX2LV4ttowCHkvrgfts6UCaJp2kVtHC48zfW2JhLjduoyX/JqXfMcbhymk2/fdfQ8ojfaGpuKHPYfcDMR5EPsPrX/TPCW3BUSRYyjSqzNhLTQXU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(122000001)(316002)(71200400001)(52536014)(26005)(9686003)(76116006)(6506007)(82960400001)(107886003)(66476007)(66446008)(64756008)(66946007)(66556008)(4326008)(38100700002)(558084003)(5660300002)(55016003)(33656002)(41300700001)(7696005)(8676002)(8936002)(86362001)(478600001)(54906003)(110136005)(186003)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2VoRXQxRkRucCtCQllTYWt5NTIwSW0xVHRXakJWcjk0SFd0RndwcVp6T014?=
 =?utf-8?B?YUZ4eHRYZ1hnQU1oNVhYYVMzN3NVendWZW8yUDIwNVJSR0hhQ1ZPY0U2ZEY3?=
 =?utf-8?B?REZIT0JMMVUvR3ViR3VqMi9sb1ljdDlBNDFHREtDUXlVdVFTdjlkWjF2SzhE?=
 =?utf-8?B?dTU3ZEN2Qk9Xbk5lZmg0OER2UnNxSVlyRFZndlM0MXdWVTJtUmluVE1PRnlQ?=
 =?utf-8?B?aXZhM1M5NkxCb2s2cHhXcUZjdlA0cVdBaW5ibGFNaUhjUG0yYnJHaVpkeEY1?=
 =?utf-8?B?MUxnckZveC9FN0tzSGlXbWplR3JIckhoUnN2ZkpMN2Ewc3ZXT001THF0T242?=
 =?utf-8?B?YzlOdTBxMkVmTithNExkUE9BbG10UXI3b2ZvbkxTTGlTRTRxeXBsS2dJU0M4?=
 =?utf-8?B?dkUrUEtpSjQ2OVEwZDF1cy9Bc2pFNlZsVXdpcWVwcmtZUFN0WXF4aTNlbjRC?=
 =?utf-8?B?ZzMwWVltUDVNNHA0RWpwUEQrd01TUWw5M2ZPeDlaaExHWndkR0FTZityc3ZP?=
 =?utf-8?B?ZlhURncwQllGMnlBemg4cGRGYzRBOEJUd29hUE1jQUpsVmZLcUFkZ1Y3S1ZK?=
 =?utf-8?B?dXRTYzczZnY1THZLTzA4QlZ0MmZ4RDRyME41WnFRRW1CVXQzU0h0YktjL0ZL?=
 =?utf-8?B?OWRicDdZRlVMT3lDTHZ6WmJXaWJQYmErMVVKQ0Q0YThXTER2UmhsUlhTM0RX?=
 =?utf-8?B?K3gxS3dqSkRiM1BTRUFHVXFmZ3I1b0JBQmZ5eHJibzZLSFFlNnFxTzlCeTNM?=
 =?utf-8?B?VzZ6UzczQ1lIS2JoYXlWNG1uUmdidzdFM0QrY2w0MWlMWElINDEySXU2T2ZV?=
 =?utf-8?B?enhxNUtHVjRvSjEzWGhGL3JnclZERUZnWVYwN0w0ZjdodW8rRytMTEJOZ3RP?=
 =?utf-8?B?M2dkRmxrc3Q3MEZmU3MzbnllNk44WU0yRC94SklKRHJjYllwZTd1RHRyMEN2?=
 =?utf-8?B?SkUwUzRuL21Ea2VDb1BtRWJBWUpieGxBRGVhQXJyOGRSVDhCZ213Q1J6OEFq?=
 =?utf-8?B?emd2aXJLeERiZFBJNGpNbjR4eldHeWRrTXU5Zzl6WTFBOWtpalBrRWx0dmZ3?=
 =?utf-8?B?VUxqTkhuZXVqc0YzQjRGWVhiTnhkY1BZVndqTXlTbVR3bXhhNE5rankxK0c5?=
 =?utf-8?B?TmlNeFFDZnBwS25XZTJlc2ZCWTV0a3AveVZvc29VQ1hFcUhMWHRwRXNQaHR2?=
 =?utf-8?B?SXZKNWJIMjNlcUoySzVaZnVnb0gyaXBJSkx6bVE4RkZYVHNWMEV1d2swZzZE?=
 =?utf-8?B?WG9GRERKTCtoTEZ4cm1IdWMxUTl0TUhoNWp5ZVk1Y3RuN0E5ZGU5RFVXcSt2?=
 =?utf-8?B?a05UWmJnZ3RjWi9CRkQweXBEQVJHV0tOcFZqU3QwcHg5VmN5QXE4a1JVbVdO?=
 =?utf-8?B?YTZaaUpJbytGckpVckJtMmZhbmlObkh0Nm1lWlFlcjdEOE0vc1Btb3FrVlNx?=
 =?utf-8?B?SC85cWR2dlRJczQvd3hGYWhqT0UzcnhLVkVUejhsVkZ0M00zU2ZuM1VwSmFl?=
 =?utf-8?B?OGxwUm53Q1pmVDFIcXAvOHNDT2k0cXluRmVyVWE2cjNLM2wxTjEwOGlHZ1Bn?=
 =?utf-8?B?bDZxbVRkbW5XS3BxemR2ODNzN00vT0p1bUpnMkcvc3QrNVRBRm9FUHU1UmUy?=
 =?utf-8?B?eU9XK05PaVk5QWd4Ui83U1ZPNG9uRk5tNEFTM1dIRXVUcDRHeFh0ckV1cnB1?=
 =?utf-8?B?Szl1eGJEUUdmZnFDZlVUblRIVGUrS3EvZndmTktZNGxJdTJmdFl5QjRKTVhU?=
 =?utf-8?B?Yk0rdUd5b3BoZkxNc2FEVWlaOGtiUGF4TUNxLzhDcSsvVE5QSU04cUREK3d2?=
 =?utf-8?B?VWo3eHdQUFJuYzlFcWdGcmwray96Q01FZ0ZQLzNOb05qTVd2VG5RME1CZ2lC?=
 =?utf-8?B?YkdKRDJRdlhnaThsMmNVdmZGSXM3QVVCaVp5TGNLZjRQd3c0anpmSTRYYVps?=
 =?utf-8?B?NERIN2o5d0JsRytKL3h1d1Y0UjR5V0NaWVJ4bkVXWm1UV1dWL3lLUFdwTWxp?=
 =?utf-8?B?RDhNaGFrY1dna1QwY3lZQmp6dnBVcklsOXgrL0EzWVBEaE9SZTJIYWVyUjA4?=
 =?utf-8?B?bVFZVHNwWXg3QVp0N3MrUjRWNGIyaEZTQk1NU29QUm4yOCtRb1BTMlpkSlZx?=
 =?utf-8?Q?BGthpLWRRxUXuPWr4cre+p/zO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15434de6-885e-4356-7359-08db5da5910d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 04:56:28.7516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55qL7+RyMIrxWUK1KExL9yjn93fOXGCFcdOKkGyIq0Dv/3qJmlRe8Ro23SB5MyBgdxrKdiqy0MbXdPBG+SjiHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
X-OriginatorOrg: intel.com

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBUdWVzZGF5LCBNYXkgMTYsIDIwMjMgMTA6NTQgUE0NCj4gDQo+IE1TUl9BUkNIX0NBUFMgZGF0
YSBpcyBub3cgaW5jbHVkZWQgaW4gZmVhdHVyZXNldCBpbmZvcm1hdGlvbi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJl
dmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==

