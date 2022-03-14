Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC364D79B8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 04:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289867.491516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTbbq-00007Q-N3; Mon, 14 Mar 2022 03:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289867.491516; Mon, 14 Mar 2022 03:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTbbq-0008WS-Jw; Mon, 14 Mar 2022 03:43:02 +0000
Received: by outflank-mailman (input) for mailman id 289867;
 Mon, 14 Mar 2022 03:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMf=TZ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nTbbp-0008WE-8Z
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 03:43:01 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d658249e-a348-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 04:42:59 +0100 (CET)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 20:42:56 -0700
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga003.jf.intel.com with ESMTP; 13 Mar 2022 20:42:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 20:42:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 13 Mar 2022 20:42:55 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 13 Mar 2022 20:42:55 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 03:42:53 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 03:42:52 +0000
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
X-Inumbo-ID: d658249e-a348-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647229379; x=1678765379;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p887uf0TXNXf/PQUOtxZhhikezJyHUC/mzsjzKSlOpY=;
  b=ZQQr/7V9pfpK2Eej35DXomezlYhx63K0CfuexyGc3PgC+qPOa2Zb4WXT
   1POI2aYe6pfT5p3nTagT00+bN4YeXvihkbYC8xYiVZ2ap5o4j6TArO7lx
   UZ9yLbx+iBxBodEjG+j8QGeFkXXI1uCcaKv5UgkGvndUHnF+3UcciVxt6
   8OY/W8g1szLzPCjg84kTwloatA1PGcXvUFvFKZ0P192lUbDStdX+p/EZH
   wztDPEKqgCeNm0XA8fPI6Gp7zm7Pkl/tOT5T+R1uTpkg2susUOiEKPxSF
   Pyah+YP9MoXBT790Rm+dIPNqpvSIft4fp/9sNrD9N0qYPkzl/yWoexl1J
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="342353159"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="342353159"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="497449376"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBXtcCTRzLFrN/RkyiiuzMYBMxiVMcIyxS0Rlh+/O9tfZuyzsUWTaBH+SKPzSoDf48ie+00qY5n5dlG0dw5ob4m9hUEbboRA/qS+ArJfD5IzuX8IdBu7eYyKOebFjJ2E3M4RJUJZ9ckPCCLWJJEPM2xzqniFk4VFA0nAoBgm+eX/dHjsArRJ3fc+FBTQVAIyjxYBm91aZJNeXaH3KF1mhxnrAno6dUtacrX2+XYjM3VnapL5l21uRxIlU1hzrWaeeLkXHtURv5YxXwTWOTfDtczMwk+yAumpwY58v4S3oCXgdiTXi9RSjbqzGkDWgnsuN5b76SMAZAeReE0FXPcyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p887uf0TXNXf/PQUOtxZhhikezJyHUC/mzsjzKSlOpY=;
 b=WfU5rVDuzSKHT464n1KLuSlMxNWJVrPdQdElXJZMUBBqJ+acS1bvcKDtKSuO3whx1owD4KtsnhDTsWxk0DolkO9eqlEF++XXsqdnxYRQrwqJ6k+JP9wnscLeXkQloy+1m+L7FtZoXZGMd6hjGuydJGtXacqxyGSd5poCa6JCa9bROWhQZw/6sSQP8EwavGOYSJvSWD9gruV872TdtecUgX/qvtCRWwrb/G/nwf2PJW2Tzq8t+3eauDLqkVwes82y2EPz+/Sde8Df0hLu4Ir9pD66SSuucTxDXZ587iwuGyMn++xGxwWFd0t7JQ8f+33t3KNgq1zWss9RuLwHPVPptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "Nakajima, Jun"
	<jun.nakajima@intel.com>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH] x86/vmx: remove dead code to create domains without a
 vLAPIC
Thread-Topic: [PATCH] x86/vmx: remove dead code to create domains without a
 vLAPIC
Thread-Index: AQHYIl87iX8bB2tBzkuN2evUAzBqdayUmrQAgCRWlQCABXUBQA==
Date: Mon, 14 Mar 2022 03:42:52 +0000
Message-ID: <BN9PR11MB5276A2F0B18385F11F87EE5D8C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220215112835.99230-1-roger.pau@citrix.com>
 <b254d8ac-8bdd-af65-f9d3-e2fe69ffdde9@suse.com>
 <15d8232a-51c5-77c8-b246-ca0266576b30@suse.com>
In-Reply-To: <15d8232a-51c5-77c8-b246-ca0266576b30@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7cac378-6fd0-4a64-9f9a-08da056cb810
x-ms-traffictypediagnostic: PH7PR11MB6030:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH7PR11MB6030BE6130420D9764ED58848C0F9@PH7PR11MB6030.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +JjrY+g9YD5oOeNPpJptJpGOs0bNE8UpELH56fW9gBvnpZl34CRMuNNZlrwjPjr9aMfwfRixmbOCDvOgJ+tWkE4wxVoO0W2b1vkFYyauDlMMSAFTZbzhUp1F6Y1NPZRGNYUsUSQyYIkFL7UoEGaSRJwIgcfxGKCwJEbhZSq4FSq1bDX53oHI4Aw17lnx2SlFqs72VufAQHsHE1yiZ0tTiD7+osrRf5vrcRCC2cyq4ZZGyudUcKfjQ7Bbwua1F4WuyGUxjUr/HlUdZDU4paQzqzekn2slxDSiNgBXSppBg13PoCeIdW3xtFG/BWMpMiY2FIbNx4boIS9hnpeLVQNYYR+P5jQDcYkkDb4tkGTMVqGYV9f/RSnoZLtnylCY44FwlrzoUZrUVHLNNJ5PDte+bt2M1j21Wb9eoXxPQiOF9uVLFltfbf9x4ffkb+E1DjYRi0+OQswJhtfNffhbU5N82reGhqy4AFmZtqw6RqISeJsqvqDdRVyQtc2v8NPPEAijZ8EWivrFRX3OzY2lBJsepAAZEebn+gbg2RJ12ibkmrb7PnyM3fT2u5WHzeeO5qJoBtEzg0m0lmsocsCOt0IqkOF7t+EARj4evThfxGGX2pBWVSOWQtdp8+bRsPim/p2PsVKes7/XSV7uvWVYj8XEwC+flkZiodsH8qJVjb5cZ/2SOOzQamoP6/r1toltddnODtolB9/dSAmS9iPlZv84sg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(82960400001)(54906003)(316002)(122000001)(9686003)(508600001)(6636002)(86362001)(33656002)(66556008)(55016003)(76116006)(66946007)(66476007)(4326008)(8676002)(66446008)(64756008)(38070700005)(110136005)(53546011)(7696005)(71200400001)(6506007)(38100700002)(83380400001)(2906002)(4744005)(52536014)(186003)(8936002)(5660300002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDdONElEUjAwbDhvK0VUMERDbVowU0dDZnJYVTVUMGJtTHdDSHlGTHdINzkv?=
 =?utf-8?B?ZFFiNjU0MXFjZDAydnYwRXVGdllVNFdNeDd6M0thTWR6SFpzbjl1Q0pJRFYw?=
 =?utf-8?B?aWVMeXBLMXdvNjZueDMyaThySGh2Q3VvajdFWG9BdDZCVEd2UFhtVTBpU0N6?=
 =?utf-8?B?MjM2N1VwUS9JeEVpbHJ5enJHQUswcFM0WDBVeWlGLytJdjhRYVBKdDVuUGdn?=
 =?utf-8?B?TDlwaHlyUk9CMVNXYXlKcnZrMjMxVHg2RUVhUGxNRlVsUkdKaXY0TE1KRXZD?=
 =?utf-8?B?c2Roa2x4cXFtRzd0WUF0Yk00SGdhYmhIVGNhOG1jcDRVVnNhUXNkUTZsVGJO?=
 =?utf-8?B?TW1HODZKV2RMVHY5a3BCWXRQU0dkRUNwdVNrdS9oWWVFRzB5cmt6Y2NrWXNv?=
 =?utf-8?B?Mm5wZnh4RnNmY0VLNXQ2L2ZrQkdpVmJzYWRJQ3JtQmo2MlR5eThyNHNxTllk?=
 =?utf-8?B?R0w3SGhBR1l1UW9KR1pML0luSG1VWUZ3cFl0TzFRK3dDd0c0L2pVdHZqdm1y?=
 =?utf-8?B?WGF0SlBBbzRkbXhhcmhwVlA2WGhTS3FYMkFuVmMyN3B3cUJlcHFtbkk4cndP?=
 =?utf-8?B?cW9jbkszNkdsK0U3MnRsVUNVTk9qMUY2bnFRTWs4SE5KTkdsaG5FVU5BWTF1?=
 =?utf-8?B?cFRCdXgydEYvVE9odDZkNmpQSDJDM1k0QnBmZnU3cThrK2FVQzVCZWlJU1Uz?=
 =?utf-8?B?NmtyWEk3UnNKVzhSRXhCUjFTM1g3N0FHSGNwdjRodGJXRXlDODlncW45N3dP?=
 =?utf-8?B?RWdYb1U3blhJTmlvMm9ZeHVRdmRMcWJQRmNjTUNoSUFlYmxCZUVLbWc0QUJn?=
 =?utf-8?B?YWVGQm9aUUVaTVU3dHBiRHdjdFM4U0N5Njk5ZUJCd0Fka29ObzVUS3ZmblB4?=
 =?utf-8?B?Q2xneTRXVE11NmlxSGpsZU80OFhlVzhKVWYrUUhZOGRwN1dZOUNNUmE5REl5?=
 =?utf-8?B?NGYrdGx0eS9EZ3hlZUJjeHl5MGZ1WlJYYzl4KzJKL0VaZ281d3pBSWJYV0Nx?=
 =?utf-8?B?NW1JSHdaOWRUQkFyZEEzVE45a1RwWFlBbmN3ZlJXRk1vYzAwMkR0d3FLRTlH?=
 =?utf-8?B?aTFhek9YZVpkZ1dQaTAzcXg5cFpyOFE0VjhlSEcyTXdCNWJZU096cVhKaTU0?=
 =?utf-8?B?Y0VLMEVjVys4aWNwM3ZsZWtYams2OGJIVWZnZm5SbzlHWG9IV2Y1cG1RTk81?=
 =?utf-8?B?UENJYmZoa3pUdUMzT09OL0syZC9qbDRvbjRrZDJJSHVYdTdEU2pKL05IYkh5?=
 =?utf-8?B?Nm1QaHloZjJocExnd1g0YVA2Z2ZZVDJqZWdjOG9zcGxPK1dET25DQytpV3gr?=
 =?utf-8?B?elIzRHR4ZG9kUC9KR1hhQVhHSm1kWHQxSUJnK29rMGgzeEQ5UGdzallZbDg3?=
 =?utf-8?B?K2R2Vk5ybGRNNjgwK3pHbkpVaWlTMUtFSW5EdW84c0lYSTlsRlhIUEJSYmZt?=
 =?utf-8?B?TXY1d0FmaGttalRucXFwSkZhUnVrb1hyZjRaQlZrWTBHQnFpbGZDVFREMzht?=
 =?utf-8?B?WEZwV2NWdWorOVFqN013Sjhhd2d6czNhUy9IVENLWmc0Y0w2ODFKMmRxQUs0?=
 =?utf-8?B?dlBCeUhOOTJuY1BmOG9JL1RrS29aVHVRY1NtSllwWFpIcXBlZFNGV2hNWFA5?=
 =?utf-8?B?cktJMGRkTmt2c1F3Z2d2NGdUQUdlak0rOTJFOWpGY1pEK0d2SXdGSFEzVEdG?=
 =?utf-8?B?aHpXWUJSK05ZL3VrSXpOYjc2S1pteEh5R1ppTkZWNk5NMVJVUkxHalc5ejJ4?=
 =?utf-8?B?WlFSaWlNZnVWaWhuS0Q4bzRZK3d0bENyU1RGYmQwWG5ScXFQYVAvdnhEeVU5?=
 =?utf-8?B?UWJUVkhFVUd1ZGtZVzJPOUVwaFdta1YyREgvZGtlTUZXYWVPd0VNQTk2bnpw?=
 =?utf-8?B?TFRrb21aeTBodTRvVW5ncTlRZnN3WUQ2WVYyNHJhKzdiQWYwMEFzMGVNRmE3?=
 =?utf-8?Q?HyOXVYbj8J/oSEKDW8vMcsvrYby38l65?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cac378-6fd0-4a64-9f9a-08da056cb810
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 03:42:52.8113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SLfAO8BoDZvn3UCBI3YKUZEG1mfTDQvI+5JwEBB25pZ5NQwnlpVa0LCPy9XMx3MyTtgG+NOMU0jBfSkXBo7Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6030
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
TWFyY2ggMTEsIDIwMjIgMTI6MjIgQU0NCj4gDQo+IE9uIDE1LjAyLjIwMjIgMTQ6MjcsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDE1LjAyLjIwMjIgMTI6MjgsIFJvZ2VyIFBhdSBNb25uZSB3
cm90ZToNCj4gPj4gQWZ0ZXIgdGhlIHJlbW92YWwgb2YgUFZIdjEgaXQncyBubyBsb25nZXIgc3Vw
cG9ydGVkIHRvIGNyZWF0ZSBhIGRvbWFpbg0KPiA+PiB1c2luZyBoYXJkd2FyZSB2aXJ0dWFsaXph
dGlvbiBleHRlbnNpb25zIGFuZCB3aXRob3V0IGEgbG9jYWwgQVBJQzoNCj4gPj4gUFZIdjIgbWFu
ZGF0ZXMgZG9tYWlucyB0byBhbHdheXMgaGF2ZSBhIExBUElDLiBSZW1vdmUgc29tZSBzdGFsZQ0K
PiBjb2RlDQo+ID4+IGluIFZNQ1MgY29uc3RydWN0aW9uIGFuZCByZWxhdGVkIGhlbHBlcnMgdGhh
dCBjYXRlcmVkIGZvciB0aGF0DQo+ID4+IHVzZS1jYXNlLg0KPiA+Pg0KPiA+PiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gSnVzdCBmeWkgLSBJJ20gaW5jbGluZWQgdG8gcHV0
IHRoaXMgaW4gd2l0aG91dCBmdXJ0aGVyIHdhaXRpbmcgZm9yIGFuDQo+IGFjayBieSBvbmUgb2Yg
dGhlIHR3byBvZiB5b3UuDQo+IA0KDQpJbiBjYXNlIHlvdSBoYXZlbid0IGRvbmUgaXQ6DQoNCglS
ZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=

