Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5429C4DBECF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 06:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291365.494462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUj6U-00062R-SY; Thu, 17 Mar 2022 05:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291365.494462; Thu, 17 Mar 2022 05:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUj6U-0005zx-PJ; Thu, 17 Mar 2022 05:55:18 +0000
Received: by outflank-mailman (input) for mailman id 291365;
 Thu, 17 Mar 2022 05:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VDd=T4=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nUj6T-0005zr-4h
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 05:55:17 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ceb88551-a5b6-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 06:55:14 +0100 (CET)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 22:55:10 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2022 22:55:10 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 16 Mar 2022 22:55:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 16 Mar 2022 22:55:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 16 Mar 2022 22:55:09 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (13.101.156.242) by
 MN2PR11MB3597.namprd11.prod.outlook.com (20.178.251.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Thu, 17 Mar 2022 05:55:07 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5081.014; Thu, 17 Mar 2022
 05:55:06 +0000
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
X-Inumbo-ID: ceb88551-a5b6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647496514; x=1679032514;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZLKtX1MqicQrdOmkggv7LPVFrM59lsFn+8kyk7iXBd0=;
  b=Z22tOiGtLa8TY3slYkXXLFmNnmUdpGVHKD7Ha1D7LL7UMyUTLsWhof+t
   06RAwsAMFFSkYdSobU/Ij6rI1zIHMKH9zzUE3aZ7c0pskEKa4TGgl5jrt
   YkjdkliJxlwRA117vtOwBGazRaAl8DM9nfcxfWOwVQq1AImnDSI2ywCpE
   T5HWUq7+TJANjGtqHojo2LoIyv6FpKuiLRM0IXNneQ1lOxXUE165fh3sH
   syNNcj8gS0bc4d+ga4yW6UjjOUc1B00mP8aViuIxtkSJ0ux2UVjTPrYOT
   Kb7ad2kXxYrnQe3QYYljymVqsBsxU3ewWUkx7ykK8F3XrVvrTRJJ/r7D/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237395643"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="237395643"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="690837324"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECO+hQxITh8K0vs3wd4wavLnNLkGjgOtMiKcnCF8SUY7xhhtbA0V+FuEP1ZH5kRBxJkCwXEAvNrNRulXBAEZ3UFH+61oW5tVUoESXJrjuOyzPUtu7ktc+jScB2lFUrAP+sXpN/DSgmat+JTn59F0Ler/3YPoeFJWKpOE48qpy3KqkhKS7zXxEhyiBdsavk3mmhK3rrsxAvWkwn4XmC43jDB9OQPUDMh8Shu98SjDv0gNCA/7q41wMpsIPXZ+SuBxC+PxnkPKmhJn5VeIeeXEB8nubNKLdvrrB1OWYr26QluF4oB6LaJdsWmtzYjnH/g4OZ8JSMU1e52Z3OyN6c7T5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLKtX1MqicQrdOmkggv7LPVFrM59lsFn+8kyk7iXBd0=;
 b=R1ejOyl/pnArIboyxw2zzQjTw5SRaAf+KS/eolHBPpaNPCFlwkhECuyqTeQwxZxpBI7UWfQgBrbokzJYoPh1xICZQ211MGUSqYZekXu3UFQBWqeqny+aKccm1kmJq+re1NVbQ9EWpdskLzgZLjaOnu0Jx7rNnfViWgx+gte9jwveFmCxHcdRT5uiA/7Qm3M+WZmEb0owBrTPOAV55uJv73hlLgXqeEIa0Zgksg924Whd2v92vQBPozV/UX8l7bERH6b3AbSKQW/7iG+zEywF1zM1lJPY8Tt4yaJMJfFzDS9k7kvGJ2bRN4EM/LOLlvalrPY5yLMmjVZF5ulCZIwdLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 20/23] VT-d: free all-empty page tables
Thread-Topic: [PATCH v3 20/23] VT-d: free all-empty page tables
Thread-Index: AQHYBkBAHcUqxDPFCEWIL9jRoPTFzayZAFJQgAA29ICAJWrDAIAAPPsAgASap8A=
Date: Thu, 17 Mar 2022 05:55:06 +0000
Message-ID: <BN9PR11MB5276A8DF0810DE510C1294038C129@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <807a48fe-3829-d976-75dc-1767d32fb0f4@suse.com>
 <BN9PR11MB527622E58C2E4EF90CF29EF88C379@BN9PR11MB5276.namprd11.prod.outlook.com>
 <9432990c-6de4-ad12-e9fa-12792200748a@suse.com>
 <BN9PR11MB5276930B2AFE79C4961E66548C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ca2ad24a-0703-de6c-81a5-e01615f93d21@suse.com>
In-Reply-To: <ca2ad24a-0703-de6c-81a5-e01615f93d21@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2187d17-0176-440c-5c96-08da07dab059
x-ms-traffictypediagnostic: MN2PR11MB3597:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR11MB359703CC22A7280C6C37AC448C129@MN2PR11MB3597.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Flvp4md2VYjp+kE8T1lygV5w4b9gsl9nQzEdriot+cGLqe5Hgyai8tCbpM0rnd5+5JQwf4zNTPkQe+annzKeHetms2goddsDK82y4g7gEwTBWf1/R5BGZXd62xCHHb8Yw6uzxNrMmLqsVO04RWQaFUzjh56Y2KCC2hWNq9dPUGLD+foMafSgBXw9UFzp8w5W27Fo4+8mn0z9Z+Eh21MOZuubC0B1P9Ck34bm62Z7uKes+1wxdbI1gwex5LKGD+b6X24PrA0GLJZoo1gn2tKV5pCApLV6SOkauUm9skN2ZB/g5BSfAL4HSQkOm7MXvB2Z+jWxcje9FWUD1PqMh3B3eSiKOQEOUtqV+/WT/v5hFW+h82DnhhGWylDUK6G7XSkgFkOEF8rqIMi3OGYp9QdP5gql3OFSxWlUBgV/lmjm1QnVTIOy1a5uiXew/xX8TAIi190NOP2KdsRTud0YoG4P4GwtCxOxppqWVLWdIgSgI9oyBCMSsaBGK2/UKCGsZu735s3MjoZ4Toptn1J7x+e/raYEw4FartmxMFkwpfGDufWIVPJ9G0J7n2etnYgAio5UAIyTZJLCv9sa3b7olOQODFH61ZAw7P2//GmW0YDoQBWi6ulP6LFFun4q6vyM2hRyOw7A57IoI+SDJH0deM+C29Xpr9qfehXe7DyVGRFEU6veMRYqZSxUpDrd3QCTJopmvhlZDTqiVn5kGbWMvM86yA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(55016003)(54906003)(6916009)(53546011)(7696005)(508600001)(316002)(6506007)(38100700002)(83380400001)(26005)(186003)(8936002)(52536014)(2906002)(82960400001)(122000001)(9686003)(86362001)(71200400001)(38070700005)(5660300002)(8676002)(66476007)(66946007)(66446008)(64756008)(33656002)(76116006)(66556008)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3d5cWZ2em1PUWlYdzVaM0NXVU92SGh1czlQcHNSVkk0Unp4MGF2NEplTE0z?=
 =?utf-8?B?SjQ4VllnUlZvcnZWNmRGK1hGaGpHSWo0THRZd2JDcHEreVZQZTkzSUtjRGxN?=
 =?utf-8?B?d0Q3eS9ITnpvN3JOSmlyemlISC8zZUhNeUxmeXlsNlM3MjJxcHA0TFRPbFcx?=
 =?utf-8?B?M0R5TjNlSUpXNm9KdWVuWVZuSllHYlVIVWU4L1lYMURpTk1iZFJlNkl4M0ZN?=
 =?utf-8?B?NkZhWlY3QlJucDNESTdpckNKazJJTVB6d2I0UmJWRjBibFl0dVNZZXA2Vjho?=
 =?utf-8?B?cUxTSFBQeDdnOTlMb1VsRERiOXhzTzI0RVhqNTlHVFVhVFZmSDVud1FBbGkz?=
 =?utf-8?B?UDJ2YmpxcVUraFNISnlEWlNWdFNicFFZT2FDVzlEZXp0TjMyWVN3cDV4L1JT?=
 =?utf-8?B?Nzlwd00zcjhjNVBjUEhtTytwaTVXWHpzSS9LWmp3NC9TUzRDWFRZU01RTEJO?=
 =?utf-8?B?UWRKaVhsbTR1ODN0ZGl1WklZUHhxeS9XeGM5VVNxeWk1dkNNU0ZpYnNzMzVy?=
 =?utf-8?B?b0xjOU1oUDl3QUlmMVVUYW94SjBpd080MmRSZSsyQi9iTzd3WmU5THZsZEY4?=
 =?utf-8?B?TU5IQ1pKL0ZrZ2pyeHR5WW1tQU11d3h4QnVjcjdZZk1ueVhRbFYyM1FFZHA2?=
 =?utf-8?B?eVZnbFYzNTF6UFI3RzVUQ0s3bEZyRHBjcjQ4RmNOeFVzY2thUWNzTkJXS0lp?=
 =?utf-8?B?UXFuY1JtTkVXdmV0MCtlYVVzelgzS3J5bkJCN0Yvckp4Y3pYTDYxeVlPVmd5?=
 =?utf-8?B?THlMS2x0UFVEV0M1QTB6VjZGeWtkQ3ByUndtQkJYcFNGSTJFWUptSFUwVWsw?=
 =?utf-8?B?Zk8vWUtMRXFVaU1ZdEtrVCtaV0ZvVi9Nd1BwMnBFTUVCUFBmVGxTd3dkWHhO?=
 =?utf-8?B?NWNnYStURW9IQnpwaEk3bmVRZlJYMzI0Y1hJOVVnVHRlY0luNjgxUVZGemJI?=
 =?utf-8?B?dDVsTjI2ajZLZmVWcUlKdnNTUUZaVE8zN3pBdVBRRjlQQjUwYndKV1dRb1J1?=
 =?utf-8?B?OFJEamVYYmxxK2JOUUd2TytVaW5WUGdkeGQ0NTBDS3RWSGhpUnhBWlc2bDZh?=
 =?utf-8?B?cCtVOTU5VGw2djB6WU41Y0R6T1BkejZpTUg5RGg1SkVZU29JUDdocUJ0S2hr?=
 =?utf-8?B?aWNTcU5ac0ptN0ZIdnEweDNteG1MRzNqUVFWbTRjWHl5S1BDQ2llUGZtRkxa?=
 =?utf-8?B?TWpNY3lBcndHZ1orcjlEVDZFSkRLdTBIVC92OVZxQ1NSZ3hIaTVHak9HSW9Z?=
 =?utf-8?B?WXI0Z24rdzFnNUVuaThHVUxuOStCcmNOZnNwUE8zRnlQVnBLTWVBZ044UU15?=
 =?utf-8?B?eG9pb20vR0pzeE5BN216d0tEZVovKzdEdE5JVk1ETzlpcERscFRBQi92aDJG?=
 =?utf-8?B?RWlxQ2xCM2xlb09ham1yQ2g3My9uNkZrZU55ait6Q1BpLzlpWlpXN3pUbm16?=
 =?utf-8?B?d002TWtnT1FDUDJmdkZNSEpaTnRpQVlVTVRrV3dKbTEzSlBTWmRNSmUrdnly?=
 =?utf-8?B?TWVxRlc4eG1tVHFnN0UzMS9UQUFKS0hxSWU5SEdaQ3d2T3o0VXUrN0RsdmJO?=
 =?utf-8?B?OTlhdTZrNXE0Q0NyTkIxSVpXNVA0SjBYNGNqekxEQldXUXhFR05VNXJMb082?=
 =?utf-8?B?MGZtVVh2RFpQd1BTZ1M3RmhKZWdMN0JEYnRyS1dlTnA1VTBlRmhYY1JkaHB4?=
 =?utf-8?B?cFQ3d3liUEdlUm5BZTZTcWZ3TDdmYkJjVmtYUVI4YnBIN2Z5VkQ0NUxQREZp?=
 =?utf-8?B?SlVxT3d2RkJlcmNRU1ZZSEFoN2JPc21qM3lublZNVWRyMzNYbFFyT01iUEEx?=
 =?utf-8?B?MXJNa1FFVDV2Z2tlQ1NlWlVtWDJoMk5lRk41M3BkNGQrN3J6aWlxTnpsMFBx?=
 =?utf-8?B?V3NheVV0VHkvbGhVclh6MmdIWHAzazFHVXVOb2d6M0pCanlBYTVtby93bExj?=
 =?utf-8?Q?4zqCs/Le6+/UX8TK84GmHZlfeYs3jWNv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2187d17-0176-440c-5c96-08da07dab059
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 05:55:06.8008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CtluKq7lCwfUIC0gc3iIBPLGA6ELORGuXRs6/diF7h4dpRc/pkkc7C+VYWTw2saJx3PKM5AdUlouSwcHVzJG3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3597
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
TWFyY2ggMTQsIDIwMjIgMzozMyBQTQ0KPiANCj4gT24gMTQuMDMuMjAyMiAwNTowMSwgVGlhbiwg
S2V2aW4gd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gPj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAxOCwgMjAyMiA0OjMxIFBNDQo+ID4+DQo+ID4+
IE9uIDE4LjAyLjIwMjIgMDY6MjAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+Pj4+IEZyb206IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiBUdWVzZGF5LCBKYW51
YXJ5IDExLCAyMDIyIDEyOjM2IEFNDQo+ID4+Pj4NCj4gPj4+PiBXaGVuIGEgcGFnZSB0YWJsZSBl
bmRzIHVwIHdpdGggbm8gcHJlc2VudCBlbnRyaWVzIGxlZnQsIGl0IGNhbiBiZQ0KPiA+Pj4+IHJl
cGxhY2VkIGJ5IGEgbm9uLXByZXNlbnQgZW50cnkgYXQgdGhlIG5leHQgaGlnaGVyIGxldmVsLiBU
aGUgcGFnZSB0YWJsZQ0KPiA+Pj4+IGl0c2VsZiBjYW4gdGhlbiBiZSBzY2hlZHVsZWQgZm9yIGZy
ZWVpbmcuDQo+ID4+Pj4NCj4gPj4+PiBOb3RlIHRoYXQgd2hpbGUgaXRzIG91dHB1dCBpc24ndCB1
c2VkIHRoZXJlIHlldCwNCj4gPj4+PiBwdF91cGRhdGVfY29udGlnX21hcmtlcnMoKSByaWdodCBh
d2F5IG5lZWRzIHRvIGJlIGNhbGxlZCBpbiBhbGwgcGxhY2VzDQo+ID4+Pj4gd2hlcmUgZW50cmll
cyBnZXQgdXBkYXRlZCwgbm90IGp1c3QgdGhlIG9uZSB3aGVyZSBlbnRyaWVzIGdldCBjbGVhcmVk
Lg0KPiA+Pj4+DQo+ID4+Pj4gTm90ZSBmdXJ0aGVyIHRoYXQgd2hpbGUgcHRfdXBkYXRlX2NvbnRp
Z19tYXJrZXJzKCkgdXBkYXRlcyBwZXJoYXBzDQo+ID4+Pj4gc2V2ZXJhbCBQVEVzIHdpdGhpbiB0
aGUgdGFibGUsIHNpbmNlIHRoZXNlIGFyZSBjaGFuZ2VzIHRvICJhdmFpbCIgYml0cw0KPiA+Pj4+
IG9ubHkgSSBkbyBub3QgdGhpbmsgdGhhdCBjYWNoZSBmbHVzaGluZyB3b3VsZCBiZSBuZWVkZWQg
YWZ0ZXJ3YXJkcy4NCj4gU3VjaA0KPiA+Pj4+IGNhY2hlIGZsdXNoaW5nIChvZiBlbnRpcmUgcGFn
ZXMsIHVubGVzcyBhZGRpbmcgeWV0IG1vcmUgbG9naWMgdG8gbWUNCj4gbW9yZQ0KPiA+Pj4+IHNl
bGVjdGl2ZSkgd291bGQgYmUgcXVpdGUgbm90aWNhYmxlIHBlcmZvcm1hbmNlLXdpc2UgKHZlcnkg
cHJvbWluZW50DQo+ID4+Pj4gZHVyaW5nIERvbTAgYm9vdCkuDQo+ID4+Pj4NCj4gPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+Pj4gLS0tDQo+
ID4+Pj4gdjM6IFByb3Blcmx5IGJvdW5kIGxvb3AuIFJlLWJhc2Ugb3ZlciBjaGFuZ2VzIGVhcmxp
ZXIgaW4gdGhlIHNlcmllcy4NCj4gPj4+PiB2MjogTmV3Lg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+IFRo
ZSBoYW5nIGR1cmluZyBib290IG9uIG15IExhdGl0dWRlIEU2NDEwIChzZWUgdGhlIHJlc3BlY3Rp
dmUgY29kZQ0KPiA+Pj4+IGNvbW1lbnQpIHdhcyBwcmV0dHkgY2xvc2UgYWZ0ZXIgaW9tbXVfZW5h
YmxlX3RyYW5zbGF0aW9uKCkuIE5vDQo+IGVycm9ycywNCj4gPj4+PiBubyB3YXRjaGRvZyB3b3Vs
ZCBraWNrIGluLCBqdXN0IHNvbWV0aW1lcyB0aGUgZmlyc3QgZmV3IHBpeGVsIGxpbmVzIG9mDQo+
ID4+Pj4gdGhlIG5leHQgbG9nIG1lc3NhZ2UncyAoWEVOKSBwcmVmaXggd291bGQgaGF2ZSBtYWRl
IGl0IG91dCB0byB0aGUNCj4gc2NyZWVuDQo+ID4+Pj4gKGFuZCB0aGVyZSdzIG5vIHNlcmlhbCB0
aGVyZSkuIEl0J3MgYmVlbiBhIGxvdCBvZiBleHBlcmltZW50aW5nIHVudGlsIEkNCj4gPj4+PiBm
aWd1cmVkIHRoZSB3b3JrYXJvdW5kICh3aGljaCBJIGNvbnNpZGVyIHVnbHksIGJ1dCBoYWxmd2F5
IGFjY2VwdGFibGUpLg0KPiA+Pj4+IEkndmUgYmVlbiB0cnlpbmcgaGFyZCB0byBtYWtlIHN1cmUg
dGhlIHdvcmthcm91bmQgd291bGRuJ3QgYmUNCj4gbWFza2luZyBhDQo+ID4+Pj4gcmVhbCBpc3N1
ZSwgeWV0IEknbSBzdGlsbCB3YXJ5IG9mIGl0IHBvc3NpYmx5IGRvaW5nIHNvIC4uLiBNeSBiZXN0
IGd1ZXNzDQo+ID4+Pj4gYXQgdGhpcyBwb2ludCBpcyB0aGF0IG9uIHRoZXNlIG9sZCBJT01NVXMg
dGhlIGlnbm9yZWQgYml0cyA1Mi4uLjYxDQo+ID4+Pj4gYXJlbid0IHJlYWxseSBpZ25vcmVkIGZv
ciBwcmVzZW50IGVudHJpZXMsIGJ1dCBhbHNvIGFyZW4ndCAicmVzZXJ2ZWQiDQo+ID4+Pj4gZW5v
dWdoIHRvIHRyaWdnZXIgZmF1bHRzLiBUaGlzIGd1ZXNzIGlzIGZyb20gaGF2aW5nIHRyaWVkIHRv
IHNldCBvdGhlcg0KPiA+Pj4NCj4gPj4+IElzIHRoaXMgbWFjaGluZSBhYmxlIHRvIGNhcHR1cmUg
YW55IFZULWQgZmF1bHRzIGJlZm9yZT8NCj4gPj4NCj4gPj4gTm90IHN1cmUgd2hhdCB5b3UgbWVh
biBoZXJlLiBJIGRvbid0IHRoaW5rIEkgY2FuIHRyaWdnZXIgYW55IEkvTyBhdCB0aGlzDQo+ID4+
IHBvaW50IGluIHRpbWUsIGFuZCBoZW5jZSBJIGFsc28gY291bGRuJ3QgdHJ5IHRvIHRyaWdnZXIg
YSBmYXVsdC4gQnV0IGlmDQo+ID4+IHRoZSBxdWVzdGlvbiBpcyB3aGV0aGVyIGZhdWx0IHJlcG9y
dGluZyBhdCB0aGlzIHRpbWUgYWN0dWFsbHkgd29ya3MsDQo+ID4+IHRoZW4geWVzLCBJIHRoaW5r
IHNvOiBUaGlzIGlzIGR1cmluZyBEb20wIGNvbnN0cnVjdGlvbiwgaS5lLiBsYXRlIGVub3VnaA0K
PiA+PiBmb3IgZmF1bHQgcmVwb3J0aW5nIHRvIGJlIGZ1bGx5IHNldCB1cCBhbmQgZW5hYmxlZC4N
Cj4gPj4NCj4gPg0KPiA+IE15IHBvaW50IHdhcyB0aGF0IHdpdGggeW91ciBndWVzcyB0aGF0IHRo
ZSBpZ25vcmVkIGJpdHMgYXJlIG5vdA0KPiA+IGlnbm9yZWQgc29tZSBWVC1kIGZhdWx0cyBzaG91
bGQgYmUgdHJpZ2dlcmVkLiBJZiB0aGUgcmVhc29uIHdoeQ0KPiA+IHlvdSBjYW5ub3Qgb2JzZXJ2
ZSBzdWNoIGZhdWx0cyBpcyBiZWNhdXNlIHRoZXkgaGFwcGVuZWQgdG9vDQo+ID4gZWFybHkgc28g
bm8gbXVjaCBjYW4gYmUgc2hvd24gb24gdGhlIHNjcmVlbiB0aGVuIHRyeWluZyB0bw0KPiA+IHNl
dHRpbmcgdGhvc2UgYml0cyBhdCBtdWNoIGxhdGVyIHBvaW50IG1pZ2h0IGdldCBtb3JlIHNob3du
IHRvDQo+ID4gdmVyaWZ5IHlvdXIgZ3Vlc3MuDQo+IA0KPiBQcmV0dHkgY2xlYXJseSB0aGVyZSBh
cmVuJ3QgYW55IGZhdWx0cy4gQW5kIGluIGZhY3QgbXkgc3VzcGljaW9uIGlzDQo+IHRoYXQgdGhl
IGJpdHMgYXJlIHVzZWQgZm9yIGFkZHJlc3NpbmcgbWVtb3J5LCBhbmQgdGhlbiB0aGUgbWVtb3J5
DQo+IGFjY2VzcyBoYW5ncyAoZG9lc24ndCBjb21wbGV0ZSkuDQo+IA0KPiA+IGJ0dyBhbnkgcHJv
Z3Jlc3Mgc2luY2UgbGFzdCBwb3N0PyBIb3cgdXJnZW50IGRvIHlvdSB3YW50IHRoaXMNCj4gPiBm
ZWF0dXJlIGluIChjb21wYXJlZCB0byB0aGUgaXNzdWUgdGhhdCBpdCBtYXkgcGFwZXIgb3Zlcik/
DQo+IA0KPiBXZWxsLCBvbmUgd2F5IG9yIGFub3RoZXIgdGhlIGlzc3VlIG5lZWRzIHRvIGJlIGRl
YWx0IHdpdGggZm9yIHRoaXMNCj4gc2VyaWVzIHRvIGV2ZW50dWFsbHkgZ28gaW4uIFRvIGJlIGhv
bmVzdCBJIGhhZG4ndCBleHBlY3RlZCB0aGF0IGl0DQo+IHdvdWxkIHN0aWxsIGJlIHBlbmRpbmcg
Li4uDQo+IA0KDQpTb3JyeSBJIGRpZG4ndCBnZXQgeW91ciBtZWFuaW5nLiBEbyB5b3UgbWVhbiB0
aGF0IHlvdSBkaWRuJ3QNCmV4cGVjdCB0aGF0IEkgaGF2ZW4ndCBnaXZlbiByLWIgb3IgdGhhdCB5
b3UgaGF2ZW4ndCBmb3VuZCB0aW1lDQp0byByb290LWNhdXNlIHRoaXMgaXNzdWU/DQoNClRoYW5r
cw0KS2V2aW4NCg==

