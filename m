Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A8653E4B2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342499.567532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCdF-00041g-8J; Mon, 06 Jun 2022 13:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342499.567532; Mon, 06 Jun 2022 13:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCdF-0003zT-4r; Mon, 06 Jun 2022 13:18:57 +0000
Received: by outflank-mailman (input) for mailman id 342499;
 Mon, 06 Jun 2022 13:18:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8G/q=WN=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nyCdC-0003zN-7X
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:18:54 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32bbea1c-e59b-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 15:18:49 +0200 (CEST)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 06:18:46 -0700
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2022 06:18:46 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 6 Jun 2022 06:18:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 6 Jun 2022 06:18:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 6 Jun 2022 06:18:45 -0700
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 13:18:42 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::4d92:bf6e:eae9:27c0]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::4d92:bf6e:eae9:27c0%3]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 13:18:42 +0000
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
X-Inumbo-ID: 32bbea1c-e59b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654521530; x=1686057530;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BWEnTEfdQTb5DG67CdP92HYnY9l85AiyiKxAnrOb/tc=;
  b=ZcNvidcwXQM/jMxemu8pL2ckbBbucCwM1zLY4TPg+70YCiQyb+MYIvm3
   F59QMB55V5vcXQT9JW//u3hp6oAJcV0nnDC3Eo7hTeHBv4o1VcBpVzcUn
   DpHfLNSjzxQGeHWpgsLsvejqu5xWR/LnGAqAoyiARyNxzXZdSeevlKUfh
   v9fEwthubwEQi/VGZM9Gb4psSTb8vVmwfNuPWHgxBYc9M99cygwl5Xnsh
   dGdT5Lzy3Cxs/WgESVhEJLhD8qNVqR+/27I1Y5b+DAXDicdDo8IlXXNda
   arD50otQDkuT+yJhz8aExFXdfVrc7plIL5ePP8wzQzlocGoFqHstpKOqx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="275432569"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="275432569"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="583634223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OR+ZwsoM6r60VYp7iXIvBKtWuJ7o/5ooH9zf/Q7oQ7T5AZ6rG/0CgRxLBtInKdo+w6k9CwI5pB+WTU7hVEs9GzrgydVSN/RSnwfwPXi2IR/trOC1yG/a1ZQvX8kC+tU31z8FctaEKqG8NdCHbhToUeeaEyO3d2YF6vuQVxxSNgFIq5fJkXUbiPkQYC2abiBVoqg2SU9TN5DbzOtb17biCj1rkvgXwxCPjqnfAT/IIch8teN1wio0ZQPF0M1ekqzaEsrGTvwY4uybxvTIKGU/Q3U8q5z7ROVI7q3F7HK67vG7aXf6goUa3nul8ke+a/WuYK+tPfC9PixOoeSQnOI2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWEnTEfdQTb5DG67CdP92HYnY9l85AiyiKxAnrOb/tc=;
 b=lD7qoLA29rx9b+LwkRALsnfQDr3Z8iZgdZ+qC5PmzzwHOPoabGsQdCQyBzfI4wzzuQ3dKd3HsA2PpUtTI9dRJvglzyebJ0yiLWHoVrUc3AkCJUt08/tTLqYYobx/Rjk2EW5fd6pSns6nLW5SZ+XqhpXtPSMyrlaDEvXV+fbyjEghwf06+FrINGvNOCp4GTWud2EHQpFwnK2ncRfo4kG/kMmEQD+InLWCqK0XSc9+QaoJsWC4+jPYz35dhlAt6g2ZbzQizmHHJ55lzBQeGYARBtCmi74jJAI+U6Q535IcpLk5vSOjQm0ZY5eGx+z071/lZjkrIEUx2mTnsZ5emdCS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Beulich, Jan" <JBeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, Paul Durrant
	<paul@xen.org>, "Tian, Kevin" <kevin.tian@intel.com>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: RE: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability
Thread-Topic: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability
Thread-Index: AQHYeVd8ujqeRGJ5skKWtq2o4Wh0c61CXJcg
Date: Mon, 6 Jun 2022 13:18:42 +0000
Message-ID: <CY4PR11MB0056686DC984391051B53D59FBA29@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ee8bad9-822b-4990-c293-08da47bf13ad
x-ms-traffictypediagnostic: MW3PR11MB4524:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MW3PR11MB45241E92B4315ADBB6FB7524FBA29@MW3PR11MB4524.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oISWyupY9e41qTnaIisNDQzOlcCcJcjmnctnbH+Vf6PWL8iEUXKjlHWZM9oG9WXNhvx8mHdrlnmZV0B2kOKbK19idZaPspYEdHqrtM2OtmxzHJbkZMvCKqa//51nQ20BmNazibN8tYfWFdkJjqJSojZ1XpucNZMLrL9IMupTcsT9giC6wN8TvN+TVx0g+lodswMCbQz2bVOIeZh4PrrPBaUxUpiOdQCZJI2ew8Q7iC+XqbQ+tvFiLZTKqeNr7RvJ0SYEieoPWLX8dXGVjf4JJ6QKy94Y6Ia+8mkNpbfgw0ENYww5bN/AJVJb8NxP/4jCVjDeAUMxlNTmGADd69NAFqKvhnYEC0pB6uEINHvccW3bSnb2qYpBgBpMdFf1TGsfJydNCqLNfWwNEO27hXULa4jCY6O+IL+1/U45SNpuTIyn2TSL6/cr/cYR/XBU6k/wFT5xv8t4AGm62bLdC95O5gs+17NARQmpYNnFfLSR6cZ7hkvATpQylZrnz4MhyPjgatYJoJEnmyf12gVJRgSzajSTOC68DHyeVlxXg3psznp4/9ADm4p/hTLokhiXa3Uva71XA0daa1DKgHOEDnK15sn4cFQ5nzhfj7/Q/8CqPx7zHBKyexO0hdXRZPBoSL8JTY3ApvRBPoByyUf/9kRBi9CjgoZvlbud/x2U2WjykACLAGPXHjjCXFKtL7sUm+/v+LROCjq/dBJSlRgGfvKz/KYkWTz07HwiPDTTl4UJs+ND2hG8fxQUVCHgogrSAhDhT+JsE0JNJKAtr8VTPXr/ze53vNZRISbwlt5Cp7ocNUk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0056.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(66556008)(66446008)(55016003)(2906002)(52536014)(8676002)(7416002)(186003)(8936002)(316002)(26005)(64756008)(122000001)(38070700005)(83380400001)(82960400001)(9686003)(110136005)(66574015)(54906003)(66476007)(66946007)(33656002)(71200400001)(38100700002)(6506007)(53546011)(7696005)(76116006)(86362001)(4326008)(966005)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTRKa2NPT21pS1pCSEVtSm1NQklyamhqZ0pZUUZMQzEwWVVpNi9ELzhWQy9m?=
 =?utf-8?B?MEtYZ1RwTkttRnZSaHBONjlXYS9IQXhzT0k5N2w0NFIvTDcrc0dRaUhhUmh1?=
 =?utf-8?B?cUZLUVZsdFdBSmlFN1MyS09nYUM2OVlyQm9ZeEhMQkhjbTExOThCOTF1dDVr?=
 =?utf-8?B?Z3dCZllOVkZzUXVTck93cjdGV0FOZ1FNbzc2d2dzZWROdWZ0Qm1kRXZucG9Z?=
 =?utf-8?B?aUxCTGRoNWNYMGNXRjlVVzJ1a28xMGhDaGRuQXlTQ2JkWWdhWGpjTitDczgv?=
 =?utf-8?B?NnhOd0MwSVNmTC9wVEc5dVNTVyt6ZUwwV3hDUHdoSUQ1dmpmaGRBQXdpT3Ni?=
 =?utf-8?B?cVdTZTg1V0dxb1JxeXFra2diaFp4eEMvTk1PMU1RUGNsL3ZqMkh6c0JJRDJt?=
 =?utf-8?B?a2xUZytSbGVaWkkvaldXekJLTFlhb3AxVDRVWG5ySzlpa3FMbzBncUx1LzJL?=
 =?utf-8?B?bUs4bTlBUit3a2tPSTUwelJaOHh6U1V4b3QyQVJ4bEdnWUdub0gybi9uUjE4?=
 =?utf-8?B?SE5aVEFoMkF1MFQrdkZtRnBRQWJXZk91U1JvV3JlSkpLbFZodWZaNEdpUkk1?=
 =?utf-8?B?RzlJNzRXUXVtRU9heitNZHZzVGc2MlJEWkpCMS9uS1o3Rml4M0JWaEFnVUlI?=
 =?utf-8?B?aFJINzhpbldvL0w0YjU0QUpNNzB6Q3pTSHJvUXZ0cEoxUU92dE5KMm8vSEpZ?=
 =?utf-8?B?ZyttWmE5WkFkeUtuL28veFJQT2luY3p1K3F4a1V0QnlqWkxmK3NScTNQZmth?=
 =?utf-8?B?cEs5eFpKaDQwYkNVMm5JSHByY0NzYU1VQnViTzNmZ251d2xhVzJLV0crN2M3?=
 =?utf-8?B?MSsrMVZuK0ttTU5lSEpUUksvNXRqYjhwUlZVN3IvUCtHSUdTbnc2Yk14Mmda?=
 =?utf-8?B?VDd0dngwSm1BZ2ZiNUVoRDZ1VTZpVk9SbHJUUE1YczBtQ1JPOCtaNWhTa3FD?=
 =?utf-8?B?QjI1K1ZnOVY5VDBhTk1LNnZIaC82eC93ZGlzOFVBMys2Qk9UdWk3Wng1bk01?=
 =?utf-8?B?OThLT1RidlFUVjZVWnY0ZGNTc0Nwd3FwTzFpNUUyOGlLOGFhNmxpWi82UVpk?=
 =?utf-8?B?dmlSMEhBeHR0TmRpTm1PZFJ4VmlKeHF6a3Jhcms5dkN5RVdZcEkzZjFmellP?=
 =?utf-8?B?eEFvMUVKZ3orK3dOWXVQMi9QVEQ3QXN2cWRZRUdlZU9CV1lRVkZPV0gwSE5W?=
 =?utf-8?B?bkZpZTZMamR1eDg2WW1NT1pxZGJtTGNxSmNrMThuTHA2RlBjWTNaK295WER1?=
 =?utf-8?B?OEJrRmVLQkpTUmxrTVR1ZVlCV2RsRjJkOU04by9yL2dZelp2V2F2MzJNWS8z?=
 =?utf-8?B?VEhLYitkY1dNK0xKcTh2amlwYXEwOHdEcjJQL2xaTXlBQWJMTHV5WU5DL2ll?=
 =?utf-8?B?WVV4NzVndm1GMjFiUTlsTlZHNlZodWtOYXBiTW9wUUhIMi8wYU9NNmZuYzh2?=
 =?utf-8?B?SlcwaUMzOEhmdGxzcC91TjFrTVppMzNjWFc1YjRGMGQ1Q1VuUGZnZjNwZHRY?=
 =?utf-8?B?K1VMSXRuOU15Z0FwMXRzaExtcVJ1MDFmM0kxQW52QkV2ZVZGOS9ZbFdNNDUx?=
 =?utf-8?B?a2pwLzhsQ0prbW0ranMxSEh3cm9yWUNUdFdJdHlUWDIrbmFHaitNUXRXLzJY?=
 =?utf-8?B?UlZyTGIvMmN2ajVzK1pkSEhJUFlYTUdKRmRaVmlqdTVzaVFCMThUUGM1NjV4?=
 =?utf-8?B?OEJNUDc5QnBHaENCUmhydTUxSXNVVGs4ZkVVaFo1Rk8xUWVkMUFHODRDUzlC?=
 =?utf-8?B?NVZkZnBFRTViM0JtOFdBRXZ5TVdIMENqWDhsc3lDNzdiV3NQdGtoemt3enMz?=
 =?utf-8?B?STBHbllvd2pOZ1FVVTgrUlRtZmxSNGdpZG1VUVQ0eURjUGo5WkVkMHhjY0ls?=
 =?utf-8?B?OTFxZzBrNE93SDZWU1ErS3p0SFZqajV0dW5ZQ1NsZTNoNFBlMEJ3c0pFMHRz?=
 =?utf-8?B?ZGx4T0xPVTVOTUZrSkVBbGdaa3dicUhldEVIWXk4eFpHd3Z2QWFZazJrcWEv?=
 =?utf-8?B?K0g5a0VmQzFkYytaM0RLRnZETEoxa090WCt5WFJGNlNDclBESG45VVNucUhT?=
 =?utf-8?B?dm1mS2xlekN4by83RFhEVkN4bVZMWWhwd2V2TWpOOWgvQldiaEhybGduWFJX?=
 =?utf-8?B?T0V5WFF4Z2NzaUxzbE1iVW5mNGJGK0NHMXFRYW12MDRyUGJ6bGh5R3h1SzNI?=
 =?utf-8?B?cXgvQklJNTJ6c05vUXNPanloekFHT3hFWmxEeldPWGhTOWQxTWxVZTJndklp?=
 =?utf-8?B?aDNZclcwL2crRzdieURnajRpSzhudm5OK1dkQmduN1pvZ3c0SkhBR0RXdXB1?=
 =?utf-8?B?WWNlMWlLSElaQ0NBeU82WWJmSXVKQncvR2c0RFNCTkNFYWFXR2s4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee8bad9-822b-4990-c293-08da47bf13ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 13:18:42.0358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Ike6aO1p9CBbRAo9o9S0iDNaT7hwmjksDY87i8A5dez9rvo9O1nLHjYH/pREIwa4dhT9jQEATKpiCgRLkIPdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
X-OriginatorOrg: intel.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgTWFyZWsNCj4gTWFy
Y3p5a293c2tpLUfDs3JlY2tpDQo+IFNlbnQ6IFN1bmRheSwgSnVuZSA1LCAyMDIyIDExOjQwIFBN
DQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IE1hcmN6eWtvd3Nr
aSwgTWFyZWsgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+OyBDb29wZXIsIEFuZHJl
dw0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT47DQo+IEJldWxpY2gsIEphbiA8SkJldWxpY2hAc3VzZS5jb20+OyBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFBhdSBNb25uw6ksIFJv
Z2VyDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3Jn
PjsgVGlhbiwgS2V2aW4NCj4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUkZD
IFBBVENIIDAwLzEyXSBBZGQgWHVlIC0gY29uc29sZSBvdmVyIFVTQiAzIERlYnVnIENhcGFiaWxp
dHkNCj4gDQo+IFRoaXMgaXMgaW50ZWdyYXRpb24gb2YgaHR0cHM6Ly9naXRodWIuY29tL2Nvbm5v
amQveHVlIGludG8gbWFpbmxpbmUgWGVuLg0KPiBUaGlzIHBhdGNoIHNlcmllcyBpbmNsdWRlcyBz
ZXZlcmFsIHBhdGNoZXMgdGhhdCBJIG1hZGUgaW4gdGhlIHByb2Nlc3MsIHNvbWUgYXJlDQo+IHZl
cnkgbG9vc2VseSByZWxhdGVkLg0KPiANCj4gVGhlIFJGQyBzdGF0dXMgaXMgdG8gY29sbGVjdCBm
ZWVkYmFjayBvbiB0aGUgc2hhcGUgb2YgdGhpcyBzZXJpZXMsIHNwZWNpZmljYWxseToNCj4gDQo+
IDEuIFRoZSBhY3R1YWwgWHVlIGRyaXZlciBpcyBhIGhlYWRlci1vbmx5IGxpYnJhcnkuIE1vc3Qg
b2YgdGhlIGNvZGUgaXMgaW4gYSBzZXJpZXMgb2YNCj4gaW5saW5lIGZ1bmN0aW9ucyBpbiB4dWUu
aC4gSSBrZXB0IGl0IHRoaXMgd2F5LCB0byBlYXNlIGludGVncmF0aW5nIFh1ZSB1cGRhdGVzLg0K
PiBUaGF0J3MgYWxzbyB3aHkgSSBwcmVzZXJ2ZWQgaXRzIG9yaWdpbmFsIGNvZGUgc3R5bGUuIElz
IGl0IG9rYXksIG9yIHNob3VsZCBJIG1vdmUgdGhlDQo+IGNvZGUgdG8gYSAuYyBmaWxlPw0KPiAN
Cj4gMi4gVGhlIHh1ZS5oIGZpbGUgaW5jbHVkZXMgYmluZGluZ3MgZm9yIHNldmVyYWwgb3RoZXIg
ZW52aXJvbm1lbnRzIHRvbyAoRUZJLCBMaW51eCwNCj4gLi4uKS4gVGhpcyBpcyB1bnVzZWQgY29k
ZSwgYmVoaW5kICNpZmRlZi4gQWdhaW4sIEkga2VwdCBpdCB0byBlYXNlIHVwZGF0aW5nLiBTaG91
bGQgSQ0KPiByZW1vdmUgaXQ/DQo+IA0KPiAzLiBUaGUgYWRkaW5nIG9mIElPTU1VIHJlc2VydmVy
ZCBtZW1vcnkgaXMgbmVjZXNzYXJ5IGV2ZW4gaWYgImhpZGluZyIgZGV2aWNlDQo+IGZyb20gZG9t
MC4gT3RoZXJ3aXNlLCBWVC1kIHdpbGwgZGVueSBETUEuIFRoYXQncyBwcm9iYWJseSBub3QgdGhl
IG1vc3QNCj4gZWxlZ2FudCBzb2x1dGlvbiwgYnV0IFhlbiBkb2Vzbid0IGhhdmUgc2VlbSB0byBo
YXZlIHByb3Zpc2lvbnMgZm9yIGRldmljZXMgZG9pbmcNCj4gRE1BIGludG8gWGVuJ3MgbWVtb3J5
Lg0KPiANCj4gNC4gVG8gcHJlc2VydmUgYXV0aG9yc2hpcCwgSSBpbmNsdWRlZCB1bm1vZGlmaWVk
ICJkcml2ZXJzL2NoYXI6IEFkZCBzdXBwb3J0IGZvcg0KPiBYdWUgVVNCMyBkZWJ1Z2dlciIgY29t
bWl0IGZyb20gQ29ubm9yLCBhbmQgb25seSBhZGRlZCBteSBjaGFuZ2VzIG9uIHRvcC4NCj4gVGhp
cyBtZWFucywgd2l0aCB0aGF0IHRoaXMgY29tbWl0LCB0aGUgZHJpdmVyIGRvZXNuJ3Qgd29yayB5
ZXQgKGJ1dCBpdCBkb2VzDQo+IGNvbXBpbGUpLiBJcyBpdCBva2F5LCBvciBzaG91bGQgSSBjb21i
aW5lIGZpeGVzIGludG8gdGhhdCBjb21taXQgYW5kIHNvbWVob3cNCj4gbWFyayBhdXRob3JzaGlw
IGluIHRoZSBjb21taXQgbWVzc2FnZT8NCj4gDQo+IDUuIFRoZSBsYXN0IHBhdGNoKGVzKSBlbmFi
bGUgdXNpbmcgdGhlIGNvbnRyb2xsZXIgYnkgZG9tMCwgZXZlbiB3aGVuIFhlbiB1c2VzDQo+IERi
QyBwYXJ0LiBUaGF0J3MgcG9zc2libGUsIGJlY2F1c2UgdGhlIGNhcGFiaWxpdHkgd2FzIGRlc2ln
bmVkIHNwZWNpZmljYWxseSB0bw0KPiBhbGxvdyBzZXBhcmF0ZSBkcml2ZXIgaGFuZGxlIGl0LCBp
biBwYXJhbGxlbCB0byB1bm1vZGlmaWVkIHhoY2kgZHJpdmVyIChzZXBhcmF0ZSBzZXQNCj4gb2Yg
cmVnaXN0ZXJzLCBwcmV0ZW5kaW5nIHRoZSBwb3J0IGlzICJkaXNjb25uZWN0ZWQiIGZvciB0aGUg
bWFpbiB4aGNpIGRyaXZlciBldGMpLg0KPiBJdCB3b3JrcyB3aXRoIExpbnV4IGRvbTAsIGFsdGhv
dWdoIHJlcXVpcmVzIGFuIGF3ZnVsIGhhY2sgLSByZS1lbmFibGluZyBidXMNCj4gbWFzdGVyaW5n
IGJlaGluZCBkb20wJ3MgYmFja3MuIElzIGl0IG9rYXkgdG8gbGVhdmUgdGhpcyBmdW5jdGlvbmFs
aXR5IGFzIGlzLCBvcg0KPiBndWFyZCBpdCBiZWhpbmQgc29tZSBjbWRsaW5lIG9wdGlvbiwgb3Ig
bWF5YmUgcmVtb3ZlIGNvbXBsZXRlbHk/DQoNCkhhcHB5IHRvIHNlZSB0aGlzIGVmZm9ydCwgaXQn
cyBiZWVuIGxvbmcgb3ZlcmR1ZSB0byBnZXQgdGhpcyBmZWF0dXJlIHVwc3RyZWFtISBJZiB5b3Ug
aGF2ZSBhIGdpdCBicmFuY2ggc29tZXdoZXJlIEknbSBoYXBweSB0byB0ZXN0IGl0IG91dC4gSSBh
bHJlYWR5IGhhdmUgdGVzdGVkIFh1ZSBiZWZvcmUgb24gbXkgTlVDIGFuZCBpdCB3YXMgd29ya2lu
ZyB3ZWxsLg0KDQpUaGFua3MsDQpUYW1hcw0K

