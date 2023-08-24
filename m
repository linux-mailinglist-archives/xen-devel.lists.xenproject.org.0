Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D247866AE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 06:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589742.921765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ1vH-0006k6-2i; Thu, 24 Aug 2023 04:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589742.921765; Thu, 24 Aug 2023 04:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ1vG-0006hi-W5; Thu, 24 Aug 2023 04:26:18 +0000
Received: by outflank-mailman (input) for mailman id 589742;
 Thu, 24 Aug 2023 04:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OU3w=EJ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1qZ1vF-0006hb-GO
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 04:26:18 +0000
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b77d789-4236-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 06:26:14 +0200 (CEST)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 21:26:11 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 21:26:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 21:26:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 21:26:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 21:26:10 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB6751.namprd11.prod.outlook.com (2603:10b6:806:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 24 Aug
 2023 04:26:08 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dcf3:7bac:d274:7bed]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::dcf3:7bac:d274:7bed%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 04:26:08 +0000
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
X-Inumbo-ID: 5b77d789-4236-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692851174; x=1724387174;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2YCQ36XlDDBYKoRH3/pEy+TulW1T9BQ+WYYvrW+KKNM=;
  b=hL1Sr3FcN+EBNvBl67XBieFukAmzO7+ky9FTOQ3HbTj2r67uw0QTX7+W
   b6v+5TEoUtGCzq3EQ43FEiLMwK+PQaW8We/kl8ssOBMcCnRPhdE+ZxC/g
   28sVgjj72ILdT16idGEnWJ5nBEakU+shCaPqZBBMcmTB07bEOhPK8OaRS
   qUqAMuQit45zqiPr7b9SXr6oCkZTHOEjmbmkYlL2ztg89ZQljiWw74d73
   CH+emYrB4v3fIJPXgHr7H+orSQZxUk8g9Jsf9URvn+GyfskH4ox0+Joxk
   bY/XYBmu8VoidPqEqif6aW3KqrXdtNp6E2/0p6AWaQb4r13UOToPKp2ba
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364511860"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364511860"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="740025129"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="740025129"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk7NENYGGapeeBQL4ylEhPScv/AL9pqPZqy+3S962VrL9AgHKNl98BXhcVbN/SV5I13Z7oN/uUPBHD7CP0bCKRV34sWjnPUS3F9/lsUeCCl8Kb0eEnEEHeIVPlYF60UwtavYibzxi233SbHoFLJBt9XyvYTMrrYoHbjyO9rlobIqBe0j8GGlfv9QBaR/qTHGL10oSITpCz/IACaTPHqQ+4isNNs7olNiGtfsZYrNg9MpFcIa9jKmcwEKI+lG0+zr5M6uVMrE7+UMCGSWJls7r/mzirDV8osVclepdWpAxf2Yu2APbILtM0NoTjoNUpEroXIq3gsoiFzcpYNDg/EN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YCQ36XlDDBYKoRH3/pEy+TulW1T9BQ+WYYvrW+KKNM=;
 b=C9g2hTi/DWGXlXavjKQa/uXW/tbd1AelG1j8JSUXvKBOBLzfKuM0eMFEIp2C3BG41vJcAGcFnE5mCh0N/isP+32HabAr5flwX7nBLERJ28rHyazUpzqLy3lAHw42yLHnPyup05PF2tL2sMIrwKVF+mkwUmLMttkdHbF8RBGoieotC6QiYpLXcxB0QbbxEt4b2XZ8tYj6WVDQz8HtRP2BKrI224OoxktxiFJ9WOiyOKpBLDsA2lLETD9ceh1/bMZweq25/gyx3gWMa4CJFNH9+DxPWswMCqIR0nGgA1HbIfPFhQRNPL3BcWllDP2TTFQACYjahxx0aEfQQErCdRMU+g==
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
Subject: RE: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
Thread-Topic: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before
 re-entering guest"
Thread-Index: AQHZaAkTaZqJ/lBq3kixDzLj4TJx56/5tglw
Date: Thu, 24 Aug 2023 04:26:08 +0000
Message-ID: <BN9PR11MB5276438F5DA8FDC0A59C16C88C1DA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB6751:EE_
x-ms-office365-filtering-correlation-id: c16a86f1-819a-4499-58cb-08dba45a3d52
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g+WktrGh5Cx9cacADlg6bXCUrEuRUyIccRkJtHtPNfugshcsd2pn2QXpPV3dHsohqgDP7nyHHTXPBb4ykgAGFw+1CCJ4CgHfaymrPnw4pm4NTLFQ8NBUKUTWX6LgDOog/2hF4Cx7TUSPI+bBjp7F7YEJXVULoucq77HwwPjO1aBD24lbmhNNWJ0tVY/Q/NPIyadE9y/hvq2iuUgLCQwc3QXqPUx765rB8R5nJKtTDRt0c2zFuZ8dj43ON8qwAb/Q7WJkSILJqurjZolxtaLVegcb97VJhg+cCtwB/32vBbD6PnX1RgiBorakhI01h+GS1iT8bJPtBVFAHrS506LdLrvagqZQWgIFb+aGtQH8B1Z6bFg5zLLS9Kz8S6qg+uYEIY1TvXV4JQiBMcha+/3HhogkfcbFOdMBBmtO6MnVoBIOh9xnMu2S+fDg7IeT4F3VKT2A3u2o4Xe++X1jxJs5pD+N01BMuZyUhH0cNQhkbD232QmOhnR7EQX3sW/FQVff5cZrH7R9LVi7CGqkFDf/OGR0nwo6BNgAO8VD2cmnRETNxrMuQvROoNLRoIxMq0j5Q4/eOsnc1iLBszZNqgfne4NFooEpkwYdS8u9S+ToH05JwFCC+Ka2H4gTcSvOw8OJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(186009)(451199024)(1800799009)(122000001)(33656002)(38070700005)(38100700002)(86362001)(82960400001)(55016003)(107886003)(54906003)(76116006)(478600001)(71200400001)(52536014)(66476007)(7696005)(110136005)(6506007)(66556008)(64756008)(66946007)(9686003)(4326008)(5660300002)(316002)(8936002)(8676002)(41300700001)(66446008)(2906002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzVSODh2MmVjM0tPSklVRlR2VVp5RnBRNHdCaTRLL3k5akJoNmN4SFpwZXFJ?=
 =?utf-8?B?WEhXaHlKaTNVelNzTW5VN1FLWUkzUXlZNGs3dSt5d2dYZUc2Q0dZdUd4cUVQ?=
 =?utf-8?B?eWptZGdmNVhHb1k1RTV2ZDdTdkZCeVl3NzQ1SjI5WVhESndTNkU2KzMvT0Fi?=
 =?utf-8?B?bFBDUEJMdFR5ZXFjc2ZsL3g2bFU4NVZDZHh5ZzIvckFkSUZuTHBkNWhBVjlC?=
 =?utf-8?B?b1F6eWdaSk56WURtK0hmVFhtdUg0STZEZnhhVVl0QjhwWDQxUFB1T2luc0Jl?=
 =?utf-8?B?S29CM3FOKzhYUnZKWG5NdG1TZE1kZzl2TXFiNjFxbGNCSkpPakFmOVpBd1Mv?=
 =?utf-8?B?ZHBGN01UUW4rK3JSMkJXVmxKbWxWYW5SMDQ1R3FDYkhLUXhRL1pzZWt4N1hT?=
 =?utf-8?B?K2o0ZGlvb1RUK2trcXJ3YVdjTzRDZFZ5Q3ljZW05L2NpWXcyL2RYUTFQUUxM?=
 =?utf-8?B?SXZpcnpPMGUwNGhSNlhBc3NQVEt4V1NzWkt1QjhyZ0Q4Z0VPWk9XYWZvN2sv?=
 =?utf-8?B?Tm82aDhsWUptY0hjMUptWWQ2bWxwT2VNWit2ZzF2SFQwNHdvMFh2WWNJNDhu?=
 =?utf-8?B?Tlc1RGxmSHJ3VDVkR2M5K2Y0bmF2ampjb2xub3N5Qk1ZSGNZY0U5Y1djV0Mw?=
 =?utf-8?B?bkNBR0NGL2ZxanpycFpRNzg1ZGxpRWdaV1FDcWhVQWRSMTEvUVp2VnlqZlFQ?=
 =?utf-8?B?RVBiamJsOVFuN0wzSERxRkFJbFM1Q1JDbGdBRXBGbld5UzlXcXpkb1ZGdUkr?=
 =?utf-8?B?TitFTEduNmRucjBvcHBxSXZmUUxLUzg2QVQ2VS80OGszbnpEdTR3RDVQMDVj?=
 =?utf-8?B?aGp4OVg3VHJHazRmeTNpYkJsdUhVVWF4V0JtQlo4dCtqVTdpeFFnMGNDY3N4?=
 =?utf-8?B?cEMxVFZsUWYrblIyV0JPMVR4Q0phR2hsZHZ1aVFxKytsR2IzNUF6T0RYNDdS?=
 =?utf-8?B?M2luVkVoN1Zjd0I5V1VOZXFpNmoyUXlacTdUTjVVOWpNRVBid3krU2JMVmtI?=
 =?utf-8?B?TEF5ZGFuWW12RkZodkRlTFg1c09oNHgzUy85OE40UWVwVDFRWEdTZC9remlK?=
 =?utf-8?B?TXlUNXlCWUZheUhxNHhMSE5rbm54V2tyb2duVXlIRVp5ZlNXOVJiV1oyMnpW?=
 =?utf-8?B?Q29mY29lVm5uL2FyYW5GOC92UWE1dG5QMUloV1JEdHZ1bjcyODZEOWJzOFUr?=
 =?utf-8?B?bndIYVFaMW9vaFhDWERPdmFLRi9WTDJVc2VURDRaR1B1RDJZcENVNVFXbE9F?=
 =?utf-8?B?QTF1YWgzNllGNER6SzNhMXh1RDZYenFnZ0tnM2hYRG9mdmIweTZMbGpWOWJM?=
 =?utf-8?B?amQyZVltaFRGQ1hLYmtGc20wL0hNOUJDMDBxKzNPU3NzWGw0eTl6YmI0eDVw?=
 =?utf-8?B?NHRQbFdsVVdEaDQwUkVVTHp1REN6ZXdrcFEyUmpiYVZwTHpCcU1jVlRvWXdR?=
 =?utf-8?B?UHlNVXA1WmQ4S2tBWWwyaWlUU3NLUm5HRWo4a1NpeUJDY0dxUlBVQmtkeFN6?=
 =?utf-8?B?aFFoaHdrWXZhQ1AxdHRoTDF1amIxMzR2ckdWaWtKeWFpd1U5dytXRFk3bCtV?=
 =?utf-8?B?RFdoZkdBZ0c4SDVJS1VlS0w2MVdTN3lxR0lzN3dKTFZmNUtQSityUWJYV2NV?=
 =?utf-8?B?ODkwbFRmN1QwTnBJbDFuN3A1OGFLY2drK2NTRlBvc2d4MlRPd21LdHVFbE9K?=
 =?utf-8?B?cnZGb0E1dnBkemc1azR1L0hpTHpIakljbWRDdzBLdVFBMWtxdFVCbkVLUi9Z?=
 =?utf-8?B?c01aZ3lvaytaSDgrVkc3bk56RHNPT2VsTnh0SEc2dDEzKzN6cXJTSTc3TGU1?=
 =?utf-8?B?S0wrSUE0WmxjVnNOK0xGZDdKUGpjVWpLWHIybk1JTHQzTSthUXIzOW1YUFRz?=
 =?utf-8?B?MUt5NHBVTXVZVzUvR0J4NGNnRzZtQnllSmtEc3JkSkdZYWJLTWhCRVllaXpZ?=
 =?utf-8?B?eFc1cWtYMXRSK3ZyK0JHa09QLzEwL0k1dlFBSktOQ1ZRVDdqVTh2cUszdk1U?=
 =?utf-8?B?UEwyWmU0MVJHaklMQjM3Q2FmdURKYnRvT3dUVHFQclhVNkNEZ2RDZFB5blhq?=
 =?utf-8?B?b1ViS1pmb2VKWkhUd0ZoalN3RXFKaXVCMFRveW1pdW13N3dOUmFpNUNTY2lC?=
 =?utf-8?Q?bbDM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16a86f1-819a-4499-58cb-08dba45a3d52
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 04:26:08.5863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pgqjZYKjz189WcnYX5Xj4ATTNaKvw/CFSC4/2/q4twWyOzsNlwtAPsrEhvcLgoiqGt+M0k8xGiMiXZEMIHCOEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6751
X-OriginatorOrg: intel.com

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBUaHVyc2RheSwgQXByaWwgNiwgMjAyMyA1OjUzIEFNDQo+IA0KPiBBdCB0aGUgdGltZSBvZiBY
U0EtMTcwLCB0aGUgeDg2IGluc3RydWN0aW9uIGVtdWxhdG9yIHdhcyBnZW51aW5lbHkgYnJva2Vu
Lg0KPiBJdA0KPiB3b3VsZCBsb2FkIGFyYml0cmFyeSB2YWx1ZXMgaW50byAlcmlwIGFuZCBwdXR0
aW5nIGEgY2hlY2sgaGVyZSBwcm9iYWJseSB3YXMNCj4gdGhlIGJlc3Qgc3RvcGdhcCBzZWN1cml0
eSBmaXguICBJdCBzaG91bGQgaGF2ZSBiZWVuIHJldmVydGVkIGZvbGxvd2luZyBjL3MNCj4gODFk
M2EwYjI2YzEgIng4NmVtdWw6IGxpbWl0LWNoZWNrIGJyYW5jaCB0YXJnZXRzIiB3aGljaCBjb3Jy
ZWN0ZWQgdGhlDQo+IGVtdWxhdG9yDQo+IGJlaGF2aW91ci4NCj4gDQo+IEhvd2V2ZXIsIGV2ZXJ5
b25lIGludm9sdmVkIGluIFhTQS0xNzAsIG15c2VsZiBpbmNsdWRlZCwgZmFpbGVkIHRvIHJlYWQg
dGhlDQo+IFNETQ0KPiBjb3JyZWN0bHkuICBPbiB0aGUgc3ViamVjdCBvZiAlcmlwIGNvbnNpc3Rl
bmN5IGNoZWNrcywgdGhlIFNETSBzdGF0ZWQ6DQo+IA0KPiAgIElmIHRoZSBwcm9jZXNzb3Igc3Vw
cG9ydHMgTiA8IDY0IGxpbmVhci1hZGRyZXNzIGJpdHMsIGJpdHMgNjM6TiBtdXN0IGJlDQo+ICAg
aWRlbnRpY2FsDQo+IA0KPiBBIG5vbi1jYW5vbmljYWwgJXJpcCAoYW5kIFNTUCBtb3JlIHJlY2Vu
dGx5KSBpcyBhbiBleHBsaWNpdGx5IGxlZ2FsIHN0YXRlIGluDQo+IHg4NiwgYW5kIHRoZSBWTUVu
dHJ5IGNvbnNpc3RlbmN5IGNoZWNrcyBhcmUgaW50ZW50aW9uYWxseSBvZmYtYnktb25lIGZyb20g
YQ0KPiByZWd1bGFyIGNhbm9uaWNhbCBjaGVjay4NCj4gDQo+IFRoZSBjb25zZXF1ZW5jZSBvZiB0
aGlzIGJ1ZyBpcyB0aGF0IFhlbiB3aWxsIGN1cnJlbnRseSB0YWtlIGEgbGVnYWwgeDg2IHN0YXRl
DQo+IHdoaWNoIHdvdWxkIHN1Y2Nlc3NmdWxseSBWTUVudGVyLCBhbmQgY29ycnVwdCBpdCBpbnRv
IGhhdmluZyBub24tDQo+IGFyY2hpdGVjdHVyYWwNCj4gYmVoYXZpb3VyLg0KPiANCj4gRnVydGhl
cm1vcmUsIGluIHRoZSB0aW1lIHRoaXMgYnVnZml4IGhhcyBiZWVuIHBlbmRpbmcgaW4gcHVibGlj
LCBJDQo+IHN1Y2Nlc3NmdWxseSBwZXJzdWFkZWQgSW50ZWwgdG8gY2xhcmlmeSB0aGUgU0RNLCBh
ZGRpbmcgdGhlIGZvbGxvd2luZw0KPiBjbGFyaWZpY2F0aW9uOg0KPiANCj4gICBUaGUgZ3Vlc3Qg
UklQIHZhbHVlIGlzIG5vdCByZXF1aXJlZCB0byBiZSBjYW5vbmljYWw7IHRoZSB2YWx1ZSBvZiBi
aXQgTi0xDQo+ICAgbWF5IGRpZmZlciBmcm9tIHRoYXQgb2YgYml0IE4uDQo+IA0KPiBGaXhlczog
ZmZiYmZkYTM3NyAoIng4Ni9WTVg6IHNhbml0aXplIHJJUCBiZWZvcmUgcmUtZW50ZXJpbmcgZ3Vl
c3QiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
DQo=

