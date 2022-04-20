Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B378508131
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308869.524744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3ql-0001ef-9U; Wed, 20 Apr 2022 06:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308869.524744; Wed, 20 Apr 2022 06:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3ql-0001aD-66; Wed, 20 Apr 2022 06:30:03 +0000
Received: by outflank-mailman (input) for mailman id 308869;
 Wed, 20 Apr 2022 06:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWYm=U6=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nh3qi-0001NN-ST
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:30:00 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c35c36f-c073-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 08:29:59 +0200 (CEST)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:29:57 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2022 23:29:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 23:29:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 23:29:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Apr 2022 23:29:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Apr 2022 23:29:54 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3500.namprd11.prod.outlook.com (2603:10b6:5:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:29:48 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 06:29:48 +0000
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
X-Inumbo-ID: 4c35c36f-c073-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650436199; x=1681972199;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x/eKREl69vllJ+U+bZtwaa2nBis5/VWJXqQ0wKa6d/Q=;
  b=I9EnBP41ORgS6PWoOlZW4WcXW8vY9kp/cm0oIXZKsWHkJxTVwcirZhkF
   LgXHPkjxUKGufgg53RAnchsCUte38lYHFyD3XUubpDDjUT4d4bVdtgbEG
   4TGZfWMwYUfMuXZov1fkeNN7f5QsYKhe/a3zCYOJaBdssR+JxPvilLOa3
   iqfoSuWy0zOlo9hkt2uAOONmf860Xo78YpkJDvWnaNQZS/PKP5SQjHQ3T
   WRdNJM1W6ydGVxkpcmd1fQsXoZvGbuu9I8lRGUlwdZ/YnP5qVUcCK3gWS
   rl6D9fnPtBDWP4WWNeg3MuMxYIBOnKtwUDLV2q5nggJixSijjN5Qu2Jgy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="243884045"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="243884045"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="555055201"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHa0LJOJzQ9FRiX9/Q3taPLNAsKGnFOP/7+m7z3a7MtK+RggbrzU9/lQT6M2dGjw/EBk6cSnRDIywY/+aVO7wIWsX05hrrXyVSGpZbEVhEYrHo5fMe1amxGBCdHYA+G0ZT34rPm7TMifZ8DILiY647uya7OLGc88TcHPOz/izlyVA4LgjB78HzE5/Fdewt/FTkCR+1YccJm3VYfUzMDr0rsrImhGtA2zApmFV+sPY/5LeN+6PgKi3YLFDY7PWk+hayVxn0Er/0dTmXeibti/EH+Rg7sC7B8r/QLpenimpV3DTRVM3LzLFRXPHaWZzvN7SimWon2TTfP7+MrwNGQGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/eKREl69vllJ+U+bZtwaa2nBis5/VWJXqQ0wKa6d/Q=;
 b=UntJneeaKgwyoaUf3O5eBN13Bsz3VgCQFeIimwMfISG3Xe8hSvWrLonzdBE5omkGDL60UhQ5DuWGYdvFE/+5uX6WFbioG4nMsj3Xqc2/ss2k/7OiBV+4pi7/+sHysQABEVCzdbkxJE+fttTS7mHN/BSNDR2rKI0IaWOn0Lh6xyX5y05VgnJLGn0dA1xHOhXAkHGRxiHw5TCx0gXWVx1Gb9v+YykPaWLyvvCd9qbGssbPM13GROnIxE87o6gIxm0dcQkUL0OKeqCMDVvsNVTXb57SJg8RmYnP1MO+wIF6eSCQTmplsktEypMnXl4vPhm8nEf+TUmBtLNSpP9XSvhX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Thread-Topic: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Thread-Index: AQHYTYg2fJ9LlsxQzUiWYjlpaUlfRqz4ZOWA
Date: Wed, 20 Apr 2022 06:29:47 +0000
Message-ID: <BN9PR11MB52763455AF804EDA3300CE368CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
In-Reply-To: <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0433be2a-e6c2-4a26-50f6-08da22972ae4
x-ms-traffictypediagnostic: DM6PR11MB3500:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3500397FD09AB7D691E62BA88CF59@DM6PR11MB3500.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JYuNqxjpeBfdlPvIbOc+zhN1KtWZWe1ZzB0FDfAR4gezPLcFVkdkdlplyJw4icdEr3whv4iDqAfWA01SbFhMr3G6LcdcTi4s9DD/qWZMFqXpTxGDSE1L8q4lwqh3sj6SILug9+G3IbFYUN2u/7LRVNQxqcUPjopvBXbA++ojSQi1OvYPm/3vYGPmckESoay5EOylRTe3HP7+kEN8OL1yDo5aZcAL1NMhh1iUeskIr1FWlSOqETAYAiyJkomSmX8ulWX9ITQ/aH+yBn7wE9QUPY/bVuDs5sTAF31fQz+Ir+L+sawaC5/WXyKf7FS49IiwEgQGafFJFX+n1RMWrYs1rkMOws6Z3/vtpW5s+BOKRPHQDQIa/6B6yutxJcnXNuo1V02fJQdJcFdQekz4Lq2Tv5E1UhjYodg3vCqb45rkpO0y/Ldlc1aoLetqgnMxzf13kef1LkEVee9r0cgTW/ClehQtIqMLw4MSxdvA8OvwIYZb/gljICNR6xxK5RIUX0Us1I7nBDeMw5fuTU+YtAgGvAm2bo0XHim0sHcSNcmpoxSt9YFO/l4DvGzl66Y3ZRP3PSlO1YGIN5kuRkIhT1Zlr5ZjJ81bwAK04Zk9OpLwJO+hIcdbGFv84Ry/ho//h5ZBFYgVuQn8Wi0pdyEyw/wIKh70cwmoj5RiK4skiZpUNpuIZhR/jXMxhP01UZkl5WTtLBX38V293aj2urGERGfx0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(54906003)(2906002)(5660300002)(8936002)(52536014)(7416002)(122000001)(38100700002)(33656002)(38070700005)(7696005)(9686003)(4326008)(8676002)(508600001)(6506007)(76116006)(66946007)(86362001)(64756008)(66446008)(66556008)(26005)(66476007)(110136005)(82960400001)(55016003)(316002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aktrcHdiM3grVFNidUdFSUdMT3RIU3hYRmVIWFkyK2JZL0lUSE5qc3ZQZVpC?=
 =?utf-8?B?aEJoSTAzazI0U2tkSjYvTmd5OHFLS1pqNU5ETkxoTmFISDdxSGZnNWh5R2dT?=
 =?utf-8?B?aW1JNi9oUDNuMytOWkVaNnNCTUlzNXZIWTgzTnd4aUswWFdGV29abjVYTTN2?=
 =?utf-8?B?bVEwaTlEOUE5L1U0VlhyL1NIRC9ZNHp5UjdTUVpFYm5yeE5Vc3B2Rk1OWmEx?=
 =?utf-8?B?K1BsdlJlckZVQ0JsYlg3TU54RXhMTFBlVld5TS81eVgrWXBnSXJnVSt4Q3l1?=
 =?utf-8?B?Nml3WTZvR2x4SG5TUStCSUNQV1o1Q0tUTmpZRXdubUVSek9ETDFCVHJWK01S?=
 =?utf-8?B?SXE5aE41UGs2NTloZTFFNC9qWmwzMS9BcjloM1k0aHdmQnI0d0M5Ujdqb1hT?=
 =?utf-8?B?MWVVelBFSi9DZnM1bjVNN3I3LzRSZzU0OW1NOFpURytlMGk1RDQ1MElGVEFR?=
 =?utf-8?B?R3N2UVliSEZSeWoxbWd5YWdjYzVDa2hjekdPcnJ5M0k2NnlHNWx1NmtudEpS?=
 =?utf-8?B?ZHdVQjZTS2JxU3JNbFpZTFNINnBlUWd1YjlPKzcxTk5LZ0hqZVVKRnh3T3Bq?=
 =?utf-8?B?clYzYWV6RkJZRDB6QUhHMXJnOU5hMmF4SHhNRUQ0bjdsaVZwQUw5cC9PT1Fj?=
 =?utf-8?B?aE5tNFhDeE0weUdXUkdVYWI5TS85bnhNeUdrSGJpc0N0MWppRi9sOVNqVVAr?=
 =?utf-8?B?NmRUdzFrSVVYNS9nOGJ3b3RHbnNDako1TzRtOHpuRnJRV2NSUWhnS2poREh4?=
 =?utf-8?B?cEhjRW81ZW5uQm5ITUNpeEQvdWIwM2FROXF0MG41MVpabCtmUG92eGxKYWRi?=
 =?utf-8?B?Z1RCUjc0a2kwck9SWGpNbzkrSjQwcXJhbzlXZ3M0NVFOS2pLUTkyYTVmUW0x?=
 =?utf-8?B?bVpoY0gvRU8wdWU0Q0FuR2Ivc3hYK0c0dG1BSEh4Wkl4bElQeXNpNVI5SFJn?=
 =?utf-8?B?eFZQSXdhcUoyTElQTXlvMURNSVgxcWNZNS96VC9RRU12aFFla1Fjc2xGL3hZ?=
 =?utf-8?B?S252TEdENmFHN3NnSW9waVlwdzVhZkxZalhmMUZvNnYxZnZuMklzbmVPcUx4?=
 =?utf-8?B?aWRUOHRPb25hTDFtelZRMXZZcjFZWUpIWWkvdlNDdzh1MDA0MDRGVjFkcXdt?=
 =?utf-8?B?QjJtZXBwaHJZUzJjZXFURENTbTFsb2pPN1pLcXVvaElFdHlrSGlua0dyTk4v?=
 =?utf-8?B?SVNnK2hqdGQ0QzE3Z2FGeW5uZy84YjlnWkN3endnKzdlN0IwZ1BCd0dvaE1v?=
 =?utf-8?B?Ym5GK3NPYWMvVEtYMXJGS1IySGdGK29GelpqSVVCb3dtcldEdGJWRXJFdFkv?=
 =?utf-8?B?TWN5cUJIb1NMWXV5d2VjN3N6TFRpZkwxK0dFNW5CTEplQTh2WHBWWU1iWHlK?=
 =?utf-8?B?dURFVzlCb3Nyek1aakFYRlBxamlUTUVkdGN0ZjN1T0xJekRCRlpUY1NaNVZx?=
 =?utf-8?B?WjJ3SUFOdDcrYkZmcCtUWktWcytVK2JtSjRmL3Jrd1d3YzFvWDJabUVRY21I?=
 =?utf-8?B?K0x3Tlc0ZkF0QjdhQU40SWh2NmJQdEhTeUFVMWVTVnhpOVdnR29NNHEvT3dx?=
 =?utf-8?B?VEZ1ZUpuNnptTVErUnZ2SU1wQUxqREM1bVkrbkY2SGRITXlqOTNFSXhrM1Rh?=
 =?utf-8?B?d3RKWGw2cERMYUpJVk1ONEFDejQvaXlyOHpZOUc3RTlCTjZTTGhEeU11ekVw?=
 =?utf-8?B?RjZleWpzSFV2OVhIWUhMNi9oMG9jckQzV1J3bzZoMStvTDRDa2ZuSFFQQXFw?=
 =?utf-8?B?cDA5OTcyTHpmcnN4eDhBWTM0WGJHdmVmUVdaTkpYTDFwWWp2a2V6SURHekMz?=
 =?utf-8?B?MDhCYlplR3BLRFg0L05jYVg1S2pkTlAxNlA4cHh1bWVYa1FPc2FlWlo1WGJm?=
 =?utf-8?B?OVpCcmVucVpwYTBwcU1NWmFSZTFtZHRMelpLbUtmcElXV2pBRGNQMm9qY0xk?=
 =?utf-8?B?SFMwMzhielZDQWRvT1lUem9RQVpoV0E3RnhMckRwNjMvcG9Lb29CWmVndy9a?=
 =?utf-8?B?T1JvK293UnpLc3N3aTB6VG5mWDBmYmxncFlQcnZVS2dvQUNVeEYvL09EeDc2?=
 =?utf-8?B?OTYzcm9Rd0tocWJWc2pFcGcyVDl6QWZ6MDZzdzBhZFNtMnBCb3ZCT2FBc1Fq?=
 =?utf-8?B?ZEw4ZWdBQkhnR2tNV2RLb2FtbThUdENIazJZWUtLSisycXgxOWhRUHNxRWFW?=
 =?utf-8?B?dlBMTjRKVzJPZ1RsNW9uNHZERmgxdnQ4Wnp1VFUyNTJha2diSVNXc0N0QTBT?=
 =?utf-8?B?eFIrSG5GTVB2V3A4bVVaTnJHVVMxcmhFRzZtTzRDUkdVSkl3dDFnbW1uQVNq?=
 =?utf-8?B?RlF5eGN4bFJGVmhpS2tLUStNSVJwMkw5a2xucE5udEdWQ2RaNWVYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0433be2a-e6c2-4a26-50f6-08da22972ae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 06:29:47.5723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+depBxIDDacy1I4zlUU7Ii+XQ+xFb1zqzz9rFnS2ZIUo/r3bFWX8ZkmgSgU+87l1I6vZdpRNddBt0v71Oa3AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3500
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMTEsIDIwMjIgNTo0MCBQTQ0KPiANCj4gVGhlcmUncyBubyBnb29kIHJlYXNvbiB0byB1
c2UgdGhlc2Ugd2hlbiB3ZSBhbHJlYWR5IGhhdmUgYSBwY2lfc2JkZl90DQo+IHR5cGUgb2JqZWN0
IGF2YWlsYWJsZS4gVGhpcyBleHRlbmRzIHRvIHRoZSB1c2Ugb2YgUENJX0JVUygpIGluDQo+IHBj
aV9lY2FtX21hcF9idXMoKSBhcyB3ZWxsLg0KPiANCj4gTm8gY2hhbmdlIHRvIGdlbmVyYXRlZCBj
b2RlICh3aXRoIGdjYzExIGF0IGxlYXN0LCBhbmQgSSBoYXZlIHRvIGFkbWl0DQo+IHRoYXQgSSBk
aWRuJ3QgZXhwZWN0IGNvbXBpbGVycyB0byBuZWNlc3NhcmlseSBiZSBhYmxlIHRvIHNwb3QgdGhl
DQo+IG9wdGltaXphdGlvbiBwb3RlbnRpYWwgb24gdGhlIG9yaWdpbmFsIGNvZGUpLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdl
ZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IE5vdGUg
dGhhdCB0aGUgQXJtIGNoYW5nZXMgYXJlICJibGluZCI6IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8g
c3BvdCBhIHdheQ0KPiB0byBhdCBsZWFzdCBjb21waWxlIHRlc3QgdGhlIGNoYW5nZXMgdGhlcmU7
IHRoZSBjb2RlIGxvb2tzIHRvIGJlDQo+IGVudGlyZWx5IGRlYWQuDQo+IA0KPiAtLS0gYS94ZW4v
YXJjaC9hcm0vcGNpL2VjYW0uYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0KPiBA
QCAtMjgsOCArMjgsNyBAQCB2b2lkIF9faW9tZW0gKnBjaV9lY2FtX21hcF9idXMoc3RydWN0IHBj
DQo+ICAgICAgICAgIGNvbnRhaW5lcl9vZihicmlkZ2UtPm9wcywgY29uc3Qgc3RydWN0IHBjaV9l
Y2FtX29wcywgcGNpX29wcyk7DQo+ICAgICAgdW5zaWduZWQgaW50IGRldmZuX3NoaWZ0ID0gb3Bz
LT5idXNfc2hpZnQgLSA4Ow0KPiAgICAgIHZvaWQgX19pb21lbSAqYmFzZTsNCj4gLQ0KPiAtICAg
IHVuc2lnbmVkIGludCBidXNuID0gUENJX0JVUyhzYmRmLmJkZik7DQo+ICsgICAgdW5zaWduZWQg
aW50IGJ1c24gPSBzYmRmLmJ1czsNCj4gDQo+ICAgICAgaWYgKCBidXNuIDwgY2ZnLT5idXNuX3N0
YXJ0IHx8IGJ1c24gPiBjZmctPmJ1c25fZW5kICkNCj4gICAgICAgICAgcmV0dXJuIE5VTEw7DQo+
IEBAIC0zNyw3ICszNiw3IEBAIHZvaWQgX19pb21lbSAqcGNpX2VjYW1fbWFwX2J1cyhzdHJ1Y3Qg
cGMNCj4gICAgICBidXNuIC09IGNmZy0+YnVzbl9zdGFydDsNCj4gICAgICBiYXNlID0gY2ZnLT53
aW4gKyAoYnVzbiA8PCBvcHMtPmJ1c19zaGlmdCk7DQo+IA0KPiAtICAgIHJldHVybiBiYXNlICsg
KFBDSV9ERVZGTjIoc2JkZi5iZGYpIDw8IGRldmZuX3NoaWZ0KSArIHdoZXJlOw0KPiArICAgIHJl
dHVybiBiYXNlICsgKHNiZGYuZGYgPDwgZGV2Zm5fc2hpZnQpICsgd2hlcmU7DQo+ICB9DQo+IA0K
PiAgYm9vbCBfX2luaXQgcGNpX2VjYW1fbmVlZF9wMm1faHdkb21fbWFwcGluZyhzdHJ1Y3QgZG9t
YWluICpkLA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbXNpLmMNCj4gKysrIGIveGVuL2FyY2gveDg2
L21zaS5jDQo+IEBAIC04MzksNyArODM5LDcgQEAgc3RhdGljIGludCBtc2l4X2NhcGFiaWxpdHlf
aW5pdChzdHJ1Y3QgcA0KPiAgICAgICAgICAgICAgcGJ1cyA9IGRldi0+aW5mby5waHlzZm4uYnVz
Ow0KPiAgICAgICAgICAgICAgcHNsb3QgPSBQQ0lfU0xPVChkZXYtPmluZm8ucGh5c2ZuLmRldmZu
KTsNCj4gICAgICAgICAgICAgIHBmdW5jID0gUENJX0ZVTkMoZGV2LT5pbmZvLnBoeXNmbi5kZXZm
bik7DQo+IC0gICAgICAgICAgICB2ZiA9IFBDSV9CREYyKGRldi0+YnVzLCBkZXYtPmRldmZuKTsN
Cj4gKyAgICAgICAgICAgIHZmID0gZGV2LT5zYmRmLmJkZjsNCj4gICAgICAgICAgfQ0KPiANCj4g
ICAgICAgICAgdGFibGVfcGFkZHIgPSByZWFkX3BjaV9tZW1fYmFyKHNlZywgcGJ1cywgcHNsb3Qs
IHBmdW5jLCBiaXIsIHZmKTsNCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3Fp
bnZhbC5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xaW52YWwuYw0KPiBA
QCAtMjY3LDcgKzI2Nyw3IEBAIGludCBxaW52YWxfZGV2aWNlX2lvdGxiX3N5bmMoc3RydWN0IHZ0
ZF8NCj4gICAgICBxaW52YWxfZW50cnktPnEuZGV2X2lvdGxiX2ludl9kc2MubG8ucmVzXzEgPSAw
Ow0KPiAgICAgIHFpbnZhbF9lbnRyeS0+cS5kZXZfaW90bGJfaW52X2RzYy5sby5tYXhfaW52c19w
ZW5kID0gcGRldi0NCj4gPmF0cy5xdWV1ZV9kZXB0aDsNCj4gICAgICBxaW52YWxfZW50cnktPnEu
ZGV2X2lvdGxiX2ludl9kc2MubG8ucmVzXzIgPSAwOw0KPiAtICAgIHFpbnZhbF9lbnRyeS0+cS5k
ZXZfaW90bGJfaW52X2RzYy5sby5zaWQgPSBQQ0lfQkRGMihwZGV2LT5idXMsIHBkZXYtDQo+ID5k
ZXZmbik7DQo+ICsgICAgcWludmFsX2VudHJ5LT5xLmRldl9pb3RsYl9pbnZfZHNjLmxvLnNpZCA9
IHBkZXYtPnNiZGYuYmRmOw0KPiAgICAgIHFpbnZhbF9lbnRyeS0+cS5kZXZfaW90bGJfaW52X2Rz
Yy5sby5yZXNfMyA9IDA7DQo+IA0KPiAgICAgIHFpbnZhbF9lbnRyeS0+cS5kZXZfaW90bGJfaW52
X2RzYy5oaS5zaXplID0gc2l6ZTsNCg0K

