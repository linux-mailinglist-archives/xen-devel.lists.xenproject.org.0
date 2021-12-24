Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A00147ECA6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 08:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251233.432534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ewQ-0003sd-U0; Fri, 24 Dec 2021 07:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251233.432534; Fri, 24 Dec 2021 07:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ewQ-0003px-Qt; Fri, 24 Dec 2021 07:24:38 +0000
Received: by outflank-mailman (input) for mailman id 251233;
 Fri, 24 Dec 2021 07:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P6v+=RJ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1n0ewP-0003po-58
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 07:24:37 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88da81e1-648a-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 08:24:32 +0100 (CET)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 23:24:29 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 23 Dec 2021 23:24:29 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 23 Dec 2021 23:24:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 23 Dec 2021 23:24:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 23 Dec 2021 23:24:28 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5369.namprd11.prod.outlook.com (2603:10b6:408:11a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 07:24:22 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%2]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 07:24:22 +0000
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
X-Inumbo-ID: 88da81e1-648a-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640330672; x=1671866672;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4EtgHTgdvoZyWdMxh0XiWHYZjaBSHOGh1WXMaHY8eFw=;
  b=TwbwZnTfaFBYPoS+DadQxX92okoFWhJXW/FNA8MKRRuBuY/ugovy+Isr
   fRSnhUw8/LJFpdO4qTMvvnEhWLJww+NxBXsFVpx0d2LZraOwbc25yZR+v
   eWTHa4CyLNQg0IarwdltCNOxzbey5XwJ/misQfXk0aHqAPrgD+ar0iqq/
   6F8Z7h30aJ0QNRpPoe6iumcAFaO3ngNks9LrcDuvE0/f2ZtK8aARlA5bf
   xVhcFnpYUQEgfCILRam8ute+u9vZotdARlrJAv11bZeeSxZDYLih6lb4m
   BcrlCoKBMqNIVe6/TX6s5Is1HOZ9f4Bmyi49/TKynRKhdMGunTGawiVwf
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="304312803"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="304312803"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; 
   d="scan'208";a="617712960"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POdWB9GQvLI+SiZbdRexz5YdJGQ7OLhaucCsgNtrcrJ58BrUT88AXcygsKmr80dLFEXDbHpbS0jrR2kDKQMUfjbT2BipFJnY4QAYtHVtcwt9/VQ9p7C/6BChXEVmHdHrKGJguF0iT+qcxr5Ge/j2GicfhtU6JXA44Fba2A2pyFPnAssx8fBmPu2/U//s3d81xAoF25w6Op9f1T45rFoEfMzOvt4bpY015wA47prbItcqjC76ib6S0TL9EBhk9Q22ph75r6cQnH3foYWGyGIdvhoFCwacACk6gKs/+4fPhKZIx+8BjPKop7qB10n3PunnDnCxMiNyAZEWV5RhjvCYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EtgHTgdvoZyWdMxh0XiWHYZjaBSHOGh1WXMaHY8eFw=;
 b=X++73B9ePwl+QaZuDWwE7X/obzcSrIFx0AHUF/Whe/EtvIq/wZG9MF6coplO49bhEfH5asJvpXgJl8ESdjdsO6U5cy4dmwl/GwSzwrWb663ngrA/0/dFy0QXb1AmM/yMFLDIx37m9EXkofbgh+RQrGlePoD0d3UUJx5cu3CZyDNN0rpWrtNYCy6YChnFFUzy4VCvCyiORTK6zX+0oTldgfpGoxS86oMlJcNji6+BMd+meKiYvqPhVNcWAkhmyXiMu4vQUttwY9333r3R6Z3uem3+oNT3ylAEVLm9kEjYdVoiczC+K/UNRyD+kx1wtPIxphBL3ZN6Qqd2LZjlmFpu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, Andrew Cooper <amc96@srcf.net>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/4] VT-d / x86: re-arrange cache syncing
Thread-Topic: [PATCH 2/4] VT-d / x86: re-arrange cache syncing
Thread-Index: AQHX5pein16Riinjd0WXoe65lFt6IqwdtVIAgAE4ywCAInJTkA==
Date: Fri, 24 Dec 2021 07:24:22 +0000
Message-ID: <BN9PR11MB5276C2991C9A5563316E7D8A8C7F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <e0819175-83b4-9489-8e4b-7be4940f1d54@suse.com>
 <2a448375-6f57-578f-6ac3-ba818d0c2eb3@srcf.net>
 <b361ea84-2b4c-6f3f-5a25-11d1ad2bc5fc@suse.com>
In-Reply-To: <b361ea84-2b4c-6f3f-5a25-11d1ad2bc5fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d0a78b0-7b03-4054-e20f-08d9c6ae6841
x-ms-traffictypediagnostic: BN9PR11MB5369:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB5369C90C068FEB18F5A1A2F38C7F9@BN9PR11MB5369.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bJx28a+PhY/6gKMipLf36aTz1Af3AVm/l5/orvVhaycdshL4UPDzueyLsyyQkhDXXr5S8O+ibJLTl9Jd1eJX/XEitdCtFrHP8JB7lNuImNov8kQPgnQwJqgQrK6xEg4cWP0Bjx0EMZFwN/9pMf6JqsAtHXWNE2IWYFwSe9n2whYn+8/CkBTdWcyxifwUhlVJhonSfYNrhvC6EtBTXCJjldxNjFQX/8r21grNHQy4EYz/ZYgc1Dr0PntXm/jqZQKpVQIjol7j05PKIAnm9P//n1SKm/hKphCqm1BdEA7V3IY0qb0g4XtW65okZjSLSl9f2bSletsHdN1xwR+yS+tqjyJJ0yx9+/SRv89nejg5N58I+NLBuKfeGv9T8wK1z8+OiqQPy6ibdIH/cH7aanQb8NczxJFuEBQO/uqxpZIgYnCF57fEw0vTNv9PlOuVMYwSJ5f4QlLXHEj83k4JVETkcfIqdmD8JDxyA5wpSNZZ2KhT3p5p50M9xqaroeJqrbkKh22zX550/BGbNwBoGAzCgbCGs353xHhkIXLzu+tW0JfcQaBzA1I45CKqsOHk4d6h3TI6AngiU0sHiIGEZfZ1l6jPsT1MNP20o+83wUgoU24sT5i7Rs61ZDXuCES/0grYItEl5bUeUQu6MnAYQPVK/uxCrc0MdSoL7MtV0kXfCgqrkxKiujy2WXETy/RIesMqZFtqRKGjyWJK6vqLwMgwMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(55016003)(122000001)(110136005)(83380400001)(2906002)(316002)(86362001)(38100700002)(33656002)(8676002)(8936002)(5660300002)(4326008)(66476007)(508600001)(6506007)(82960400001)(53546011)(66946007)(71200400001)(66556008)(186003)(38070700005)(64756008)(76116006)(66446008)(9686003)(7696005)(52536014)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3RWTUVkSGtZcnA1R0Q2L3A0bGw4REs3WDR3ek5Yb2tSN0RZUllVcFNFN1Nk?=
 =?utf-8?B?eFNvRGYvNFJFUGxTLzRCZTdFczQxcXl5VUNhTnZsWDAxQkdHTGJWVHgwa1c1?=
 =?utf-8?B?RlVMMWdsL21BcDZybFJFTWEvWGpHRTdzVUJTRWZpdDh5bFVtVWZBdFZZYlpu?=
 =?utf-8?B?aFgwL0tCc1F1STdyeC9qemJjOXBTOFBaOHFDRjd6dVlKSUxqVm82cUdZdzIw?=
 =?utf-8?B?cFlpYklLNTlRa01nVmZIdlFWOTB2MmVrYVBCSStScVB3MnI5RVV2NTdkdUdy?=
 =?utf-8?B?WUNOQkorNGJySW13QjgzblpEdUdzeXZMdjBkSEs4dGxObGs0dnFQeWxvTjZt?=
 =?utf-8?B?OGZVcDcxT2lPMDBWMmtsUEw4dWx5VmV2ckpIOEkrTzZnK3ZjVDAwUnAxMTk3?=
 =?utf-8?B?d2xSSmxaN2pkajlUazhHS28wVW5MMjBadkdXVUpBL2pnait6S2VXVVMzN2xV?=
 =?utf-8?B?Zlc5QytHRDFTaytFOFJLcmV4b0FwUkorUnkzMU9mR2xWS1VaODJ2MFY5UGU2?=
 =?utf-8?B?clUySmJodUkxT0ZaMlBWR1Aya1NWYlBjc3V6czEzb1QvM0pEZ2RxVWtMR2xx?=
 =?utf-8?B?QzhxUjZCbGs5MlVyQ05PWTF1RXBIMGkwZ2tORkRFZUNYN1BEektLRmg0cVhu?=
 =?utf-8?B?WWk5RjFaWWxraXRHaVAxVnQ0SXN0WVVUZEltQ0xnYnRIZi93Y1NHM3JUTnpq?=
 =?utf-8?B?RGFkbWs2eVZicXZsbVcxNFU0OTZWUjZvVWljaUFRTnAybkhyemJueGR3S1JJ?=
 =?utf-8?B?T1VXdjN3dWtLSnUyYXEwSEsrV2VZQzR2ZCt5Q3NUZDJzMkM5aCtuckJaSVBW?=
 =?utf-8?B?cnNJQTdiWXJJTnU3N21FRGFlVkRlRmxaK2hkdFhkaWdzR21KLy9DaHQ2YUdq?=
 =?utf-8?B?b1R0S1FlbHdka282ZVorWTdiYktZRUxuUDlLYXRkUE1BamNvcEp5TnEyV3dj?=
 =?utf-8?B?b1VKVld1azIweHRSdjQ1VFpTNEg2ZlBHSmlvdHY3U2ZMenk1VmVHdUVBVEVM?=
 =?utf-8?B?d2FVby9OK28xYlNESFN6cDVDMTZQaU1WTG9wWERwUndLSit4QVNBdDNkM0Zi?=
 =?utf-8?B?dzFsYW5JbU90Q1p2N2xHbTFKcS9SbGZKT3EvcHo1Q0llb3N0MStWTHZ4cTNE?=
 =?utf-8?B?SU1jWFBiQmVOV2pUSWJyakRTQituNWl2c1JySHRCVVhLbHBkMjZlY3kvK3JU?=
 =?utf-8?B?eDdxUm9leVUrck9UcDBrK1oweUYwYWF5V2FlV29KVWpyVjV0TzBQMndPSjFI?=
 =?utf-8?B?ZEhlZHVnbTJmdm9zRld5UjYyNkJjQ05xZTJQdHA2bi90Z2ZjaDhLQU9iUXlp?=
 =?utf-8?B?OFlrRnA3UHQzTEZNeHQzcWQ0KzFtMFY4REkxbG5vWVppL3o2MGpxUWNOOVlQ?=
 =?utf-8?B?THhvbVVYTURzbUZoR2h2Q2Z1TmhUZWNyS25tdUxIMHN0VVRwUmU0dFF5L2dR?=
 =?utf-8?B?T055bldJT245WVh5TW9CQjRGNXNyMStoUzhzZ2lyM3paUmZxWWUyK2ZwK2N2?=
 =?utf-8?B?MEN4blRVZDRmWlhGNm1yVnV5bVc4R1g5Mlp1TlU3ZWVWUHdZVnQ0c3ZsK3JU?=
 =?utf-8?B?WlEyNmpTVXFkRDJKazdwd083MUkyeGpEOFpKQzFGK1JlN3B6cUVmeWpwNTEy?=
 =?utf-8?B?b3ltR2pWZXlqZHRjK2RET2d3Mm51RFhkU3VaOVAveUZDQU9PL2JsWUhVNDdm?=
 =?utf-8?B?OVJTK3dLd2FwS3FXYWxWaUV4TWkzYmFEM3VpQytBSC9tY09QSFVHUTZPNFR0?=
 =?utf-8?B?RU1VUjNIQ1BkSGtDdEpSdHFwR0c5eHdROFFyT1hqWDFiYlBRSUNmeFFJNFVQ?=
 =?utf-8?B?TnRHb0lCeWtqR2NrZFBYWVVaaUhTYkYyTnNhNkNwdFNBWkMxWWlSbFlmLzlK?=
 =?utf-8?B?OW5NdlRYOU9LR0FOOHlCeC92cFIzbFArL0VsNnpidU9jYU1iQTYzc05pRHli?=
 =?utf-8?B?VFBrdXNVYWYrTWJ6VEs0WU1LVEFhU3Q3UW8xZUU3VzZYUk1xWnF5MXQvc2RH?=
 =?utf-8?B?SVRybG9BWGhsN0lvQ1h3VzU0RHRuclhMN3NRSWszM1ZxampCWm1SNWZiUWFR?=
 =?utf-8?B?Q01sUUJiclVZdUM3QmkxQUVOTHNqbXpXckJMZG9qaXZPaEZpYUswa0tXTFhS?=
 =?utf-8?B?dzB4R3MvM1NOT3FyUmlJOFFXSktrY0M2NzVRVlFKVUE4UUh3bmZMWUdzS1gx?=
 =?utf-8?Q?kuilOheHHifuS42Zh0GBNYQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0a78b0-7b03-4054-e20f-08d9c6ae6841
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 07:24:22.3929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ju8sX1/hksy2L/t4rHHiDyy5bldBuzm5vHvZJJo5S5FnXSaVFotEBmdn25rUVXXADldrqy6p+JftJxejQrx/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5369
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBEZWNlbWJlciAyLCAyMDIxIDU6MTkgUE0NCj4gDQo+IE9uIDAxLjEyLjIwMjEgMTU6MzksIEFu
ZHJldyBDb29wZXIgd3JvdGU6DQo+ID4gT24gMDEvMTIvMjAyMSAwOTo0MCwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+ID4+IFRoZSBhY3R1YWwgZnVuY3Rpb24gc2hvdWxkIGFsd2F5cyBoYXZlIGxpdmVk
IGluIGNvcmUgeDg2IGNvZGU7IG1vdmUgaXQNCj4gPj4gdGhlcmUsIHJlcGxhY2luZyBnZXRfY2Fj
aGVfbGluZV9zaXplKCkgYnkgcmVhZGlseSBhdmFpbGFibGUgKGV4Y2VwdCB2ZXJ5DQo+ID4+IGVh
cmx5IGR1cmluZyBib290OyBzZWUgdGhlIGNvZGUgY29tbWVudCkgZGF0YS4NCj4gPj4NCj4gPj4g
RHJvcCB0aGUgcmVzcGVjdGl2ZSBJT01NVSBob29rLCAocmUpaW50cm9kdWNpbmcgYSByZXNwZWN0
aXZlIGJvb2xlYW4NCj4gPj4gaW5zdGVhZC4gUmVwbGFjZSBhIHRydWUgYW5kIGFuIGFsbW9zdCBv
cGVuLWNvZGluZyBpbnN0YW5jZSBvZg0KPiA+PiBpb21tdV9zeW5jX2NhY2hlKCkuDQo+ID4NCj4g
PiBDb2hlcmVuY3kgKG9yIG5vdCkgaXMgYSBwZXItSU9NTVUgcHJvcGVydHksIG5vdCBhIGdsb2Jh
bCBwbGF0Zm9ybQ0KPiA+IHByb3BlcnR5LsKgIGlHUFUgSU9NTVVzIGFyZSB2ZXJ5IGRpZmZlcmVu
dCB0byB0aG9zZSB0aGUgdW5jb3JlLCBhbmQNCj4gPiB0aGVyZSdzIG5vIHJlYXNvbiB0byBwcmVz
dW1lIHRoYXQgSU9NTVVzIGluIHRoZSBQQ0ggd291bGQgaGF2ZSB0aGUNCj4gc2FtZQ0KPiA+IHBy
b3BlcnRpZXMgYXMgdGhvc2UgaW4gdGhlIHVuY29yZS4NCj4gPg0KPiA+IEdpdmVuIGhvdyBleHBl
bnNpdmUgc3luY19jYWNoZSgpIGlzLCB3ZSBjYW5ub3QgYWZmb3JkIHRvIGJlIHVzaW5nIGl0IGZv
cg0KPiA+IGNvaGVyZW50IElPTU1VcyBpbiBhIG1peGVkIHN5c3RlbS4NCj4gPg0KPiA+IFRoaXMg
d2FudHMgdG8gYmUgYSBib29sZWFuIGluIGFyY2hfaW9tbXUuDQo+IA0KPiBUaGF0J3MgYSB2YWxp
ZCBjb25zaWRlcmF0aW9uLCBidXQgbWF5IG5vdCBiZSBhcyBlYXN5IGFzIGl0IG1heSBzZWVtIG9u
DQo+IHRoZSBzdXJmYWNlLiBDZXJ0YWlubHkgbm90IHNvbWV0aGluZyBJIGNvdWxkIHByb21pc2Ug
dG8gZmluZCB0aW1lIGZvcg0KPiBzb29uLiBBbmQgZGVmaW5pdGVseSBzZXBhcmF0ZSBmcm9tIHRo
ZSBzcGVjaWZpYyBjaGFuZ2UgaGVyZS4NCg0KSSdtIGZpbmUgd2l0aCB0aGlzIHBhdGNoIGlmIHlv
dSBwcmVmZXIgdG8gYSBzdGFnaW5nIGFwcHJvYWNoIHRvIGltcHJvdmUgaXQuDQpCeSBhbnkgbWVh
bnMgdGhpcyBwYXRjaCBkb2Vzbid0IG1ha2UgdGhpbmdzIHdvcnNlLg0KDQo+IA0KPiA+PiAtLS0N
Cj4gPj4gUGxhY2luZyB0aGUgZnVuY3Rpb24gbmV4dCB0byBmbHVzaF9hcmVhX2xvY2FsKCkgZXhw
b3NlcyBhIGN1cmlvdXMNCj4gPj4gYXN5bW1ldHJ5IGJldHdlZW4gdGhlIFNGRU5DRSBwbGFjZW1l
bnRzOiBzeW5jX2NhY2hlKCkgaGFzIGl0IGFmdGVyIHRoZQ0KPiA+PiBmbHVzaCwgd2hpbGUgZmx1
c2hfYXJlYV9sb2NhbCgpIGhhcyBpdCBiZWZvcmUgaXQuIEkgdGhpbmsgdGhlIGxhdHRlciBvbmUN
Cj4gPj4gaXMgbWlzcGxhY2VkLg0KPiA+DQo+ID4gV293IHRoaXMgaXMgYSBtZXNzLg0KPiA+DQo+
ID4gRmlyc3QgYW5kIGZvcmVtb3N0LCBBTUQgc3RhdGUgdGhhdCBvbiBwcmUtQ0xGTFVTSE9QVCBw
YXJ0cywgQ0xGTFVTSCBpcw0KPiA+IHVub3JkZXJlZCB3aXRoIH5hbnl0aGluZyAoaW5jbHVkaW5n
IFNGRU5DRSksIGFuZCBuZWVkIGJvdW5kaW5nIHdpdGgNCj4gPiBNRkVOQ0Ugb24gYm90aCBzaWRl
cy7CoCBXZSBkZWZpbml0ZWx5IGFyZW4ndCBkb2luZyB0aGlzIGNvcnJlY3RseSByaWdodCBub3cu
DQo+ID4NCj4gPg0KPiA+IEFNRCBleHBsaWNpdGx5IHN0YXRlcyB0aGF0IFNGRU5DRSBkcmFpbnMg
dGhlIHN0b3JlIGFuZCBXQyBidWZmZXJzIChpLmUuDQo+ID4gbWFrZSBzdHVmZiBpbnN0YW50YW5l
b3VzbHkgZ2xvYmFsbHkgdmlzaWJsZSkuwqAgSW50ZWwgZG9lcyBub3QsIGFuZA0KPiA+IG1lcmVs
eSBndWFyYW50ZWVzIG9yZGVyaW5nLg0KPiA+DQo+ID4gQSBsZWFkaW5nIFNGRU5DRSB3b3VsZCBv
bmx5IG1ha2Ugc2Vuc2UgaWYgdGhlcmUgd2VyZSBXQyBjb25jZXJucywgYnV0DQo+ID4gYm90aCBt
YW51YWxzIHNheSB0aGF0IHRoZSBtZW1vcnkgdHlwZSBkb2Vzbid0IG1hdHRlciwgc28gSSBjYW4n
dCBzZWUgYQ0KPiA+IGp1c3RpZmljYXRpb24gZm9yIGl0Lg0KPiA+DQo+ID4gV2hhdCBkb2VzIG1h
dHRlciwgZnJvbSB0aGUgSU9NTVUncyBwb2ludCBvZiB2aWV3LCBpcyB0aGF0IHRoZSBsaW5lIGhh
cw0KPiA+IGJlZW4gd3JpdHRlbiBiYWNrIChvciBldmljdGVkIG9uIHByZS1DTFdCIHBhcnRzKSBi
ZWZvcmUgdGhlIElPVExCDQo+ID4gaW52YWxpZGF0aW9uIG9jY3Vycy7CoCBUaGUgaW52YWxpZGF0
aW9uIHdpbGwgYmUgYSB3cml0ZSB0byBhIGRpZmZlcmVudA0KPiA+IGFkZHJlc3MsIHdoaWNoIGlz
IHdoeSB0aGUgdHJhaWxpbmcgU0ZFTkNFIGlzIG5lY2Vzc2FyeSwgYXMgQ0xGTFVTSE9QVA0KPiA+
IGlzbid0IG9yZGVyZWQgd2l0aCByZXNwZWN0IHRvIHVuYWxpYXNpbmcgd3JpdGVzLg0KPiANCj4g
SU9XIGZvciB0aGUgcHVycG9zZXMgb2YgdGhpcyBjaGFuZ2UgYWxsIGlzIGNvcnJlY3QsIGFuZCBl
dmVyeXRoaW5nIGVsc2UNCj4gd2lsbCByZXF1aXJlIHRha2luZyBjYXJlIG9mIHNlcGFyYXRlbHku
DQo+IA0KDQpTYW1lIGZvciB0aGlzIHBhcnQuIGJ0dyBMaW51eCBkb2VzIG1mZW5jZSBib3RoIGJl
Zm9yZSBhbmQgYWZ0ZXIgY2xmbHVzaC4NCg0KVGhhbmtzDQpLZXZpbg0K

