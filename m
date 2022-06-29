Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6255F6D5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 08:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357573.586205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6RNn-0004G6-90; Wed, 29 Jun 2022 06:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357573.586205; Wed, 29 Jun 2022 06:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6RNn-0004D9-5P; Wed, 29 Jun 2022 06:41:03 +0000
Received: by outflank-mailman (input) for mailman id 357573;
 Wed, 29 Jun 2022 06:41:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8wio=XE=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1o6RNl-0004D3-3Q
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 06:41:01 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dbbdd54-f776-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 08:40:58 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 23:40:55 -0700
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga004.jf.intel.com with ESMTP; 28 Jun 2022 23:40:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 28 Jun 2022 23:40:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 28 Jun 2022 23:40:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 28 Jun 2022 23:40:53 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BY5PR11MB4371.namprd11.prod.outlook.com (2603:10b6:a03:1bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 06:40:45 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 06:40:45 +0000
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
X-Inumbo-ID: 6dbbdd54-f776-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656484858; x=1688020858;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=063tlB7U9zlc1H1dfbr0xOAIGkeOokp1UkJxgtcJ8cY=;
  b=iH4oLOZ/ac9Y83ufMmmUOgmAsoLhg1gdRWAExCss7DgBYgUZ2+e254sy
   6v2HF2IICLBk91OXnc01QfiTraZPsq8EFv7BZGfcJXZ3Iw3NGXIxiDNuH
   /M1uG7CxREIYzydZlAbJeIcch0C9NMYgfYQ126OfAatnjZ8ysV1Qayjqu
   3NuBvpTT0/m8DZRdrffOwt3FnhtdLPIBVcfU9zgK4CgQt2gHnPX8r8ZiC
   +q5fC39fNC0eVa0YJDcka9Sg6wJOD6sUAiEAwi1SjZ5zhB95Jpz+y2a60
   tpsX5W+2SF7b2ms2HahLhB5xsOoZ3Hm9BHtsBbQbIK0EYqcby7v/vjL/v
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="264980511"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="264980511"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="717707417"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzVSEx1ceulXBHyoavM7SxOLz0JXpDG0oBQV42f1EdFCKY22zkoqM1/V08E3+IyfpgRnDsxyAVENmmUkW4ig/OyJb75DtIylrdIPl/wyOQFZAhJkxwiU1gt9ZPipr+pFVf3Jdf0UepfzzpwXrEQFFSvsGI7uxtVDgcmc1Uu4/wFgG9rDe/JuRoBGTcL5hk2JmuFB7tv68dMOyHa+J/MwkVTfpdMs5JaDEphuCyfNZz3PFxN4tOmWaS1UTfH/9vHIZMUBqD1JfjGZHA8TpjDkJ7x9Hy7HUZeq3KuoxfnRhS4Y173F1Pw+VDhAjJxEohV1X5nT/eYghFlNoqpEFUrXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=063tlB7U9zlc1H1dfbr0xOAIGkeOokp1UkJxgtcJ8cY=;
 b=UbbdGs831aeBkgjxihO/K1UHBbx6G9wEp/YH12zWbv7nLx9fCbcw58AK/QHZS1c/pFdepJqmcVm3owaFL30se4Kx1CFvKPSKELIlo9Nxoe1YEtqEmq2eir5kJpZwSQncsXrWkyxZ5s1pXg/fV2ZHQV/oJvezK5hPfEBdtjT6ZVAXOFeBOQlGu9AcQb59MrAk/WIKX0VSXhZe4JdCu4mitCYoipy+XNuCfvyhdHlsV3GZJNyqOgVL6WfgzzL2j4QzwXWyDLh9dj9EJ6tDtOqj9bLZU5pTVnSPCDGflCiQwu3qYYPlomSYxxZ3Q/uH1ZHEg7XQkrWVhaamxEHvy4zU6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "Beulich, Jan" <JBeulich@suse.com>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH 5/5] x86/vmx: fix indentation of LBR
Thread-Topic: [PATCH 5/5] x86/vmx: fix indentation of LBR
Thread-Index: AQHYbE70QXaX6+cUdUmsLrVvfVqSp61mLXgQ
Date: Wed, 29 Jun 2022 06:40:45 +0000
Message-ID: <BN9PR11MB52769BAB408AB479E48DB6808CBB9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-6-roger.pau@citrix.com>
In-Reply-To: <20220520133746.66142-6-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19d91251-50ce-43da-c6dd-08da599a4bba
x-ms-traffictypediagnostic: BY5PR11MB4371:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mounQFDSFgSrriBvKsWVr6TmevCCzFcasdE74X5SFxZNvT35QpimdPRfk35xNOvbwzYsz2zZ8cOI2Gei58jeLJN2aMq1W5bHxX/WkbuIobzLUGK/aeZyqPG4gJNB3L4x5jXhq+CWRvolHULJbQo0dxvSf24pfCnNQdTMnmQa38Qa/FI0z9xmp6CaZgbVfoTgxb1sTlXTqw/yt3dEtwi9voYzP0h56CzQyz7fJ4Sqh9mkX5GAlrtH25bhxMjFNE/qxC2iXwTasEWqcoWfNFK9PlNDHxr6XcgVXwmsZxpPOr1v1wXq3nDiAXcItpPIZIpu2jFHkHfczSfKu/NiU+GVtBf8s0S2QrZz8EnLA1qKCgpKdWCKm16zrksbqijVnBhkIsab2tpDEnwYbWRgbhiGb5c55SK0XBjUJDgVJMZgtI3fJh2j69aATrmVbh3xSITMKPFwFoFKspIHqMFjQpRO2RzBoI4MqygNxee+CBm+wpsaHcx7/H9T0/ZQC/fhEK0Qf/jv3E0CXK3GlcZw08HnE0Um9dVlryVv3m+hTrNYVw152V56Kc3qMvwmX0iczDHlE7zTErix8kNpMZyEal89uBwg9gO90+GqzGe+Mvv2gapjKiFVnjcoIEXE3fLImTQDBUjj8cDrnVXCAYKk8suHMrBjBsgRMdJEoVxDu3UKel8rGDBSZ0ixhSb4n8xiciamy7w1UynQJXvB2/emw3hL/HvQ/pOnwErZCQFvg5CwTNnnLsyKOKmoybW00cHNqJsx+CeJD0az8KIPz8KHcn/lchJotMxxSaZnlk/WBfnrWzI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(346002)(39860400002)(366004)(41300700001)(7696005)(64756008)(316002)(5660300002)(76116006)(66946007)(4326008)(66556008)(83380400001)(38100700002)(122000001)(8676002)(54906003)(186003)(9686003)(55016003)(2906002)(66446008)(52536014)(26005)(33656002)(38070700005)(110136005)(6506007)(8936002)(82960400001)(66476007)(71200400001)(86362001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGlwNjRpUDlYdWZnUHh1Y3BiWDNJcGFldmxLSGFBRmVTQ0ZFdnB1dFVJa1hn?=
 =?utf-8?B?bFFRUHgwNnlzU0xMRGd3MFA2d3Bya1JQS3NMZWVuS0tUSnNuQlEwRjQzM1Zy?=
 =?utf-8?B?R01XTHZGUUhnQW12K2pCbW0vODJENnVEZkRqdmNkNlRMYUQ3R3lJYk5Kd1Mv?=
 =?utf-8?B?Q1NYSnhTWGRUV3Q5c0gvV0V2Sy9iY05reDhQaWxVKzh5S0xzNUhkM3drWUlY?=
 =?utf-8?B?NnJack5GWDNmSFpCYkpidFhCNDFGdmhROVVNMG5RQ2lhb2txWThxdlJJaUNm?=
 =?utf-8?B?MHpwMzRjQ0hRakpSWG5WY2pOcFMxNjRiVlZLQUQwbmhMSTd2L3YvNWtua0xD?=
 =?utf-8?B?OTNGTVVlVEZKbEtSbjkvWXh6OTkvKzcwMGsyQ211QXlNYlFKR0ZuZjF3RjJi?=
 =?utf-8?B?YnloK3FlbzFCMGdSUG9Xa0xnRkoxWlNuMDNYekoyQlh0b2lnMjdybUZZbFBN?=
 =?utf-8?B?WDdzYWd5OFcxc0hnS25BU05iWC92WDdaeFVORHlmeHJ4eWRRaVFWR29PTmo0?=
 =?utf-8?B?YWw3QURzZHM0S01VeTNiNURqNGFZVlpBOGpLaWtjVVVsVS9vbmNqc2Nyamtn?=
 =?utf-8?B?OEVGMS9qb0dSbXo0MlVZUDkxTXpiN3cxazlodlpObXN0KzZ6ZWRZYWM2TDQr?=
 =?utf-8?B?TWErQzFiSDZiTmNmUEt5TFBaLzU2cGNaWUtaOVBhcEtIYm5CZ1NOYXZqNklu?=
 =?utf-8?B?RTVtci83Tk5tWmFqNDBzOTJwVVNRQkR6bGFrbnVQSHdCeE1LTlNsdXYwRXIy?=
 =?utf-8?B?ZVdxSGxnMHVCZjVVQXVSVlRqMVVvSFBjTmtZRTA5OTR2TXFPK0pvSmNIcXd4?=
 =?utf-8?B?SUhkY21ydG15WVF5SzdybVkzNVI0ZVM5enhYc2xpYmFIeHZOdWt0a1Y3WlVz?=
 =?utf-8?B?b0RGVk1PN1R6OU8yNldvc0VvMXlMVDVkRXFVclR6SnRyV09QeWNTWkplUkhZ?=
 =?utf-8?B?WFkxWGVINmhyTFBPc2FYaHptcFlqdnhUVVF4QmFuTDg4dFJkcmVBd1N2QWpB?=
 =?utf-8?B?NzVHcmZFckRIQVVaUmJPVWpCSDNNUjVBR29mZTNtRjNEVERTZS8ybndUb0lF?=
 =?utf-8?B?Y1FIWGJqaHNubTNwSDhQZS9jRVBnQWsyZXlHTkxOTkd3eG5IRXRqcG9tWTdB?=
 =?utf-8?B?N0JTZVRUMzAyY2hZQ01IbHAzU1FoYzFvZVdLY2RDcGFUZTJkSzkyblQ4OXpF?=
 =?utf-8?B?bWdaOTF0QkpINENBakc2Qmk5cnZybUdYMXlYRDhONmU2bnk4bDc1MGFJNVVO?=
 =?utf-8?B?MjFPRGFucjRoRHkzbU5jM1kySm9ORS9naVNMOHJIWStJZy81Vm1TcHlPN0N6?=
 =?utf-8?B?SkJWOFV0QlBIa2hBWkxCTldnenB5V3Rpcy9GOE52Y3c0RWdIcGZybGF6Uyt0?=
 =?utf-8?B?bldCV0JiYVppamhSR014TWpnV1Znaks3RG9UWG1IZ3ZwTmhLVWlKNTBKR2Yv?=
 =?utf-8?B?ekxZTmgwRzhnVFo2ZS94em92YkNxRmZTaG45OGVGN0ROWjMrWmJVNXVHVTJH?=
 =?utf-8?B?cHFIajRyRGJ0RlY1RWxSWWV4ZlMzSjZIMFEyUkFjcjFWL29oSGY4dTRpbDg2?=
 =?utf-8?B?Mnl1ZTdRcG9FK25SRmJzZmlKWTlaRUF6R2s1c05OL2p0Z1A2U3RUVERxNGND?=
 =?utf-8?B?QUc5eUg3eGd5UGQ5VDVtempKK0ZQTzlLZWJzR1NnTEpKdG5xQ3FlY3JyTkpV?=
 =?utf-8?B?Ulk3cnV2OXk4cmxhOG50VjQ2TkdKN1ZmcEtZNlk1N1FZZkhsZFRNS2ZuYk9u?=
 =?utf-8?B?R0pQQkZ0RUczd1NFeXd3WWxGU0xqTmxRbE0vK0JLQThCbG9ZdEtjcmI1QURz?=
 =?utf-8?B?NkhEZ0dlempvS3Q2dVkxczNCUWtSWjgyWmc1OE45alFSa1RKa1FoRnZCQnRl?=
 =?utf-8?B?NS9zTmNIbEx3c2hHOTY4c1NHSExaVkFUOHJnSFFHTlZtU2RPYzYvQkxlSE03?=
 =?utf-8?B?bTlncjRGOFhaYXBydzF0M0xHYjZTUytoVVRHak52aUgwV3lGakdRdmwyR1Zj?=
 =?utf-8?B?VC9tZ1F3Y2Q3L1A4TkdMOG94WGFIQXIvRjZ4T29RZFF3dUF6MkVwR3FPcSsz?=
 =?utf-8?B?Nno1UXNlVkRsV01YdWpCVUppcEhzN1U2TmJHd0NvTis1dGphZUh5VG9ya3N3?=
 =?utf-8?Q?6ChB6SmnGwkCYPrx9iZqYSrNd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d91251-50ce-43da-c6dd-08da599a4bba
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 06:40:45.6245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6J3BLv9G02DUUll7/6JHCrcBYbDnafJddPBjCaFyW4QVKtS8Asc6riDBXVkO7g+nYM2rS5GhX7aZFb3oRETTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4371
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUNCj4gU2VudDogRnJpZGF5LCBNYXkgMjAsIDIwMjIgOToz
OCBQTQ0KPiANCj4gUHJvcGVybHkgaW5kZW50IHRoZSBoYW5kbGluZyBvZiBMQlIgZW5hYmxlIGlu
IE1TUl9JQTMyX0RFQlVHQ1RMTVNSDQo+IHZteF9tc3Jfd3JpdGVfaW50ZXJjZXB0KCkuDQo+IA0K
PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IEZlZWwgZnJlZSB0byBzcXVhc2ggb250
byB0aGUgcHJldmlvdXMgcGF0Y2gsIGRpZCBzZXBhcmF0ZWx5IHRvIGFpZCB0aGUNCj4gcmVhZGFi
aWxpdHkgb2YgdGhlIHByZXZpb3VzIGNoYW5nZS4NCj4gLS0tDQo+ICB4ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYyB8IDM4ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bXguYw0KPiBpbmRleCAzZjQ1YWMwNWM2Li5mZjEwYjI5M2E0IDEwMDY0NA0KPiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYw0KPiBAQCAtMzU0MCwzMSArMzU0MCwzMSBAQCBzdGF0aWMgaW50IGNmX2NoZWNr
IHZteF9tc3Jfd3JpdGVfaW50ZXJjZXB0KA0KPiANCj4gICAgICAgICAgICAgIGlmICggbGJyLT5j
b3VudCApDQo+ICAgICAgICAgICAgICB7DQo+IC0gICAgICAgICAgICBmb3IgKCA7IGxici0+Y291
bnQ7IGxicisrICkNCj4gLSAgICAgICAgICAgIHsNCj4gLSAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgaTsNCj4gLQ0KPiAtICAgICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbGJyLT5j
b3VudDsgaSsrICkNCj4gKyAgICAgICAgICAgICAgICBmb3IgKCA7IGxici0+Y291bnQ7IGxicisr
ICkNCj4gICAgICAgICAgICAgICAgICB7DQo+IC0gICAgICAgICAgICAgICAgICAgIGludCByYyA9
IHZteF9hZGRfZ3Vlc3RfbXNyKHYsIGxici0+YmFzZSArIGksIDApOw0KPiArICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gDQo+IC0gICAgICAgICAgICAgICAgICAgIGlmICgg
dW5saWtlbHkocmMpICkNCj4gKyAgICAgICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBs
YnItPmNvdW50OyBpKysgKQ0KPiAgICAgICAgICAgICAgICAgICAgICB7DQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJHdWVzdCBsb2FkL3NhdmUgbGlzdCBlcnJvciAlZFxuIiwgcmMpOw0KPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgZG9tYWluX2NyYXNoKHYtPmRvbWFpbik7DQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOw0KPiAtICAgICAgICAgICAg
ICAgICAgICB9DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMgPSB2bXhfYWRkX2d1
ZXN0X21zcih2LCBsYnItPmJhc2UgKyBpLCAwKTsNCj4gDQo+IC0gICAgICAgICAgICAgICAgICAg
IHZteF9jbGVhcl9tc3JfaW50ZXJjZXB0KHYsIGxici0+YmFzZSArIGksIFZNWF9NU1JfUlcpOw0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCB1bmxpa2VseShyYykgKQ0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwcmlu
dGsoWEVOTE9HX0VSUiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJH
dWVzdCBsb2FkL3NhdmUgbGlzdCBlcnJvciAlZFxuIiwgcmMpOw0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRvbWFpbl9jcmFzaCh2LT5kb21haW4pOw0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICB9DQo+ICsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHZteF9jbGVhcl9tc3JfaW50
ZXJjZXB0KHYsIGxici0+YmFzZSArIGksIFZNWF9NU1JfUlcpOw0KPiArICAgICAgICAgICAgICAg
ICAgICB9DQo+ICAgICAgICAgICAgICAgICAgfQ0KPiAtICAgICAgICAgICAgfQ0KPiANCj4gLSAg
ICAgICAgICAgIHYtPmFyY2guaHZtLnZteC5sYnJfZmxhZ3MgfD0gTEJSX01TUlNfSU5TRVJURUQ7
DQo+IC0gICAgICAgICAgICBpZiAoIGxicl90c3hfZml4dXBfbmVlZGVkICkNCj4gLSAgICAgICAg
ICAgICAgICB2LT5hcmNoLmh2bS52bXgubGJyX2ZsYWdzIHw9IExCUl9GSVhVUF9UU1g7DQo+IC0g
ICAgICAgICAgICBpZiAoIGxlcl90b19maXh1cF9uZWVkZWQgKQ0KPiAtICAgICAgICAgICAgICAg
IHYtPmFyY2guaHZtLnZteC5sYnJfZmxhZ3MgfD0gTEJSX0ZJWFVQX0xFUl9UTzsNCj4gKyAgICAg
ICAgICAgICAgICB2LT5hcmNoLmh2bS52bXgubGJyX2ZsYWdzIHw9IExCUl9NU1JTX0lOU0VSVEVE
Ow0KPiArICAgICAgICAgICAgICAgIGlmICggbGJyX3RzeF9maXh1cF9uZWVkZWQgKQ0KPiArICAg
ICAgICAgICAgICAgICAgICB2LT5hcmNoLmh2bS52bXgubGJyX2ZsYWdzIHw9IExCUl9GSVhVUF9U
U1g7DQo+ICsgICAgICAgICAgICAgICAgaWYgKCBsZXJfdG9fZml4dXBfbmVlZGVkICkNCj4gKyAg
ICAgICAgICAgICAgICAgICAgdi0+YXJjaC5odm0udm14Lmxicl9mbGFncyB8PSBMQlJfRklYVVBf
TEVSX1RPOw0KPiAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICAgICAgZWxzZQ0KPiAgICAgICAg
ICAgICAgICAgIC8qIE5vIG1vZGVsIHNwZWNpZmljIExCUnMsIGlnbm9yZSBERUJVR0NUTE1TUi5M
QlIuICovDQo+IC0tDQo+IDIuMzYuMA0KPiANCg0K

