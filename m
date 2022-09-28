Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF35ED428
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 07:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413125.656636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odPQ5-0007j2-54; Wed, 28 Sep 2022 05:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413125.656636; Wed, 28 Sep 2022 05:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odPQ5-0007g9-1g; Wed, 28 Sep 2022 05:15:41 +0000
Received: by outflank-mailman (input) for mailman id 413125;
 Wed, 28 Sep 2022 05:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEfI=Z7=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1odPQ3-0007g3-Ea
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 05:15:40 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 938ad12d-3eec-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 07:15:34 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 22:15:31 -0700
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 27 Sep 2022 22:15:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 22:15:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 22:15:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 22:15:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 22:15:30 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH8PR11MB6730.namprd11.prod.outlook.com (2603:10b6:510:1c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Wed, 28 Sep
 2022 05:15:27 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::ff76:db8b:f7e9:ac80]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::ff76:db8b:f7e9:ac80%5]) with mapi id 15.20.5676.015; Wed, 28 Sep 2022
 05:15:27 +0000
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
X-Inumbo-ID: 938ad12d-3eec-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664342134; x=1695878134;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bfOyxd0JFT9Wik7hBR/LzX5S89ipwV9LmvGZ6XanbP0=;
  b=dY64HL5OYVvKJhDUP0Yc7WL5noPdpj5+wNsxj+9k2XKNBPmqhq5CMBv3
   8B24VvWPzlKO8hXw9FjTuWZ+HjYKU5Gv82osheHeLCNaE0s9wN51g3gY8
   aHQ3EWztqHji8GvcjbeNjZHVJ1CZkjIh2FMQirO7NEL8KGTxUJu4k44hn
   b3w8KxoVxp7jVtBbwogDqHwuQY0RSZHlasK0IN8K511V53p+WG5MvfuaK
   thitiDPArG3/1I0OtCrU5eQxFP2+s3d1e5b4LYn7iN5GxzXeXIekD9RCe
   N3nQ15/0VAjKVbV74K5gPrfExUjbbRDzlyN88MTlnyd9PfIo+DuZNjaX5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="363347249"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="363347249"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="652542115"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="652542115"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/mOlEWQY+YwPdn5WiIm2vXMCAT8nya024Ov4haFEwRdR9iKpRPdXIE78nOb9PEi73ZUCsTL5XaBEuoaa1QtZqn7wvSaJ7ICgYu1wAz39vsMgW8mfVwMpRWeRsyb5EenuJSPYs1pp9RqocwW9Pb5hMgJLDBzGZbJauESW83iAsMmLpLVgQqe3eNqJL7r0uU5Bzju+P6c+XEpx1XtAPpi8F0bh+a1D3jt3tY+xe+4fCVC2GD96717QG5fLuTjM78EcqBR61rh2kOdP4HZJRj4EcyK0Y0BoDkvPGJajynhMz7FkrREd7SCpoHKMfnzN+RkmbIyi0PeJUD+ikFbRc6OMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfOyxd0JFT9Wik7hBR/LzX5S89ipwV9LmvGZ6XanbP0=;
 b=DD9xE4waPD46yfo9M1YkWA/zrPO09FDJTTcLXwPb3f5Osww+zvUMLEYLvOgSQFQ0jIKdTbvsVVvn4hznLQB9ga8FWptD5/JAZEwQVVJ8bXrDt4DAbhiHVvLeFwbWPNsqRXoikubtyCEEIOd2v24AiGt6mEsdiv+Sue5ZylBnAsnVK0JKATqIgdxbEQ83nkgOGcpFn1ipXZ1D/2QYU6bUNtSDD3eti6JN3BGH0NnlyUDCXCRnkbzWnWonWP1jUA0dcxG3ZjuWE1hmEpTEtXZtSXa+Te43VVU7qTgzvTQgalEzgxPLutmf2PSunHwYccqnmOx1akE/SuoBZy0eRZiTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 08/11] IOMMU/VT-d: wire common device reserved memory
 API
Thread-Topic: [PATCH v7 08/11] IOMMU/VT-d: wire common device reserved memory
 API
Thread-Index: AQHYykB/Pv1Ek/NIGEWzHFZweNfBzq3so7bggAXOUoCAAevfEA==
Date: Wed, 28 Sep 2022 05:15:27 +0000
Message-ID: <BN9PR11MB52765D8EA8D915A46105D0708C549@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
 <902f7007a679c5850bee43b1347b159e1f5eeb16.1663383053.git-series.marmarek@invisiblethingslab.com>
 <BN9PR11MB5276B5BB972B44B0FF1EBB518C519@BN9PR11MB5276.namprd11.prod.outlook.com>
 <YzI7oUQEJripBRj9@mail-itl>
In-Reply-To: <YzI7oUQEJripBRj9@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH8PR11MB6730:EE_
x-ms-office365-filtering-correlation-id: 896fa2eb-dad5-4792-2d01-08daa11074c4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NC2VordyZI5XlFDDtM1zjP/d2I2xUvwFqU2j1l1VvVlWRuIuuk+NZ7JbVUWzSoQFZJUsSCI8oPPioBjd4/3kUGlodUPNQP+Sx9vZ7ZiM7ejNHA6GX8jcvy6EbXANB/h9TTsZTIZzoH6EbkIZRyADRP6tkiaNYdVF+PpyP5pSg5f6/D+CdOgsQnAzOYr6l/NywERc7v9KgMLZ5B8/X0zTDG1DVPX7/y3S3JtN1Ui2xynrxvZc2mo3DCPhG6n+bK76XW3khE+X3ovKRBPAObizwAMpyF/3+ZHUbyQuAj1y/BDFAHbkZVLdj48rKADn06xgGvlEXVkGJMabndIUejjJmt97MW9MIprMYJej2fEn7xqTFToYB3h6aTk5yFyo9j580tk69bri8stLZkTyhPKbUOX+ZKEPve0Ywei0dKTchH4XWUYGREtISgRTckp6/AvEMKb8E3l6G6tqoegSEMm8N5CVB4S0JAANrkmqSlRC87ZdyHOFzuiAl38dhgN0ilMiIX4LF4MmdvGEdKfEWzlorBEuRP3fhqBBFPqTGn8ZlHmFRRVA54gzRT02S32S8hNUddGYvnUy86bme8W34rGpmsLqvibjHMgDA9MeRP3Ybbta8WGP23gpm0IxdyU8AQRh4C4nN/N2sZkseIoS1uJ69t8TVhtDIhqB6XXZTeJFVd7Nr6UP7qA44SXNsxw2xm1yE6goX9mIkQQH60KSarob8xfku9P4yPf7wJiHMYjEUwlBlmx8gYh2tIBVE0UCzaombRXoPCk9A+Fc3vJis/xdUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199015)(2906002)(33656002)(38070700005)(86362001)(38100700002)(122000001)(82960400001)(55016003)(76116006)(5660300002)(478600001)(71200400001)(64756008)(316002)(66556008)(66946007)(66574015)(6916009)(7696005)(4326008)(52536014)(8676002)(8936002)(66446008)(66476007)(186003)(83380400001)(41300700001)(6506007)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlRsa2dqMDFhc3cxWk5nQ3prZGpUUlllTVYzbHViZ2NNaDZkeGN3RDNiY3h2?=
 =?utf-8?B?ditudEZwbWhWSno5NTF2b2liMTRFeGFjbXpLRmw2WlRZTDh2MnhRbUM1WEJT?=
 =?utf-8?B?U3NhMG43dCsrdlE4dXVaN3MvTjhocU9BeU5CN3Z6dW9GZ2VPSUYycHl4TlNy?=
 =?utf-8?B?VWhHbmtrdGNXV3BqQkk2VUlUK1dvYU1mTExRWmg1S1NOYVRZWTlrL21EbHFN?=
 =?utf-8?B?K2M3RS9raE4xM09Pd29mMWtCT01KVm45SC9RZ2FHVnNZK0liMFNmWTFzV29C?=
 =?utf-8?B?ODVPQmhGVVFnNHhiVGR6bkFuRENSb2lZUkg0VGhXcDVhNUxCdjhFbkJhU25T?=
 =?utf-8?B?aXFzZ2t4KzRxN3Q3UWVqNHkrTTBFb2dFZDIzeUIxeithbEN3cTEzQXBiVkVF?=
 =?utf-8?B?V3FmYUF5RmRMekxkajlJdjcrSE1iUk5rc0Z5eDhpcjdQelg0ZG5IdXc0Z29O?=
 =?utf-8?B?dGJYQlAvUjRtbTZZZkIxZmo0RVlYeFNucW5LZFpHSmxsQ1RFQjNLTzFPUk1v?=
 =?utf-8?B?U25CWk1uVXV6bGtlOUZQTm50VDVIMTRoTDFaMFJBalZTbHJkUWZSdzE5SXhy?=
 =?utf-8?B?QVp1bjYrRjFkQmVHeE1Ma29CWG1vTFg2aCtYdWt0UW1WSkgrQ3UyWU53REVR?=
 =?utf-8?B?VUcvMStHeDJKRVNIZlowZVpoT3ZHWUhZWENqb2VPK2E0VkJ4a2IyeVpQL0d3?=
 =?utf-8?B?OXJkSmI4ZGtmcnNwUmR0ejZjZmlwVXgvKzFNS25pNVdGV3ExVGhWY0ovK2lF?=
 =?utf-8?B?L2paYXN4ZjJ2NllBTXYxK201bG0zdmtFb3U3ZGt4YnZteTVuaHdJR1BUcW95?=
 =?utf-8?B?aFRTWTZxWklQbWNtaDNpYXg1cUVxYUNNSSthZllTYVdpRncxbjhJaE9meDVH?=
 =?utf-8?B?SVNRZmQwdXFQM0tQZ25DTXlNaUNOTit4RDF4OWNsc3hIR0FhRTN6OEsxODIy?=
 =?utf-8?B?UkFtY0crbjhzbElwWDBCVkF6c1pBZk82NnpEVnA1clg0bnBkL0ZCOXJJdW1l?=
 =?utf-8?B?S0lseXVFZzhSVmRNanlRdnhRK2dTUVJ3RVhZaEhJNTdXNzZiWnNsVGVrV1F4?=
 =?utf-8?B?bnNyakQ1cVRMRTBVaU93RjRHSmE5NHdCdkhic2FQcmczV3V2S2daRjY0aExi?=
 =?utf-8?B?NW4rdGxkQ3Q3MkFSaU9QVC9PRHhQalh1TjFhcjV4ditvQ253Yi85ZFNGU1VF?=
 =?utf-8?B?eEZBQlAyM2JWazNleHNlTnlpMSttMlREd0RXQSs5eUpmZ20za0dvcWJTMlFr?=
 =?utf-8?B?NkxLZkZMUUFIc0E0Wm5wYzBObEppVlBhd0NmL1d6R2g4eVUyRFFrVXprTi83?=
 =?utf-8?B?emUrM1hjWkIwSHM3Yng4S2JKSDRaQWxUWFEweTdRSFdla0ViWlo0dDkvcUFq?=
 =?utf-8?B?YlRjSVdvQWJ2VVdqU0xQb0xkVTBFQTlPOFdOSGpETExBbjNpNUY2aTJhRm8z?=
 =?utf-8?B?S2YxZ0RCNHJqdVR6VWxYZkZoNDZSV2R3RkU4ZXQ2cTJ1bUpMT1dNc3dHQ0FC?=
 =?utf-8?B?b2VxMEZBcjBMM0N0emVRR1M2QjFmVllLTDJLQlQ4K3gxclAvRXExdlpIZGlk?=
 =?utf-8?B?c2lucUtUR0JlcEpMY29QamJzcWh3K2cyeUQzWHRmT0tURHlZbmcycTk1SG5v?=
 =?utf-8?B?NnV3a3RGVWxSWXNieUlrNHZMRVhqYUhkc0U4dGcvWC9qMmpDeGVvZHdheSsz?=
 =?utf-8?B?Q2ZlU0U3SzFDdXVOUEsrRW1XZGhqdGFVK1k5elg0QjhmWVBmUzJZNkd1NXE1?=
 =?utf-8?B?SzdXaHNreGRzZkxEaE9DU2dSS2NnVHpLVVNLbmoyQWx3ZHA3ZjNWWitGdWla?=
 =?utf-8?B?OVNqS2pvNkxrVDl0UUpQdXR2cGp2MytMVi9FSnpYeS9RMiszL3RoeUZ1Vnpl?=
 =?utf-8?B?bU95SGxTanV4VTdmTGMvZDZxY0xDLzBydlc0WU0ydVpnVWlTMWxYUjY2ZUNM?=
 =?utf-8?B?dVBFUTAza0hPSE9ZT2o5UUovQnNrRmc0YnVJbkx1dFVGK1NaOTdnRWxiREJS?=
 =?utf-8?B?Y01FanliNnJMbjdmSzJ3YUtOZ2RPeThFakk4djFoTEFSU1FzUGR6dVM1TzM0?=
 =?utf-8?B?dnVITHh6RnpUNnJrVDJpd21HOE8zQll1Y3FJaUVwc2g3N3pmQzQramN0NjJM?=
 =?utf-8?Q?ItAbCZHXCXUg3ZM5bcHbWp8mi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896fa2eb-dad5-4792-2d01-08daa11074c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 05:15:27.6751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IsAn+prfaHLpASTeOX4t5DgnzFFDDQx1i0a5aEP1Kmx6UrgMv36P/0wRUUev7d6CO8CpIJ52KjsoccqZ018/EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6730
X-OriginatorOrg: intel.com

PiBGcm9tOiBNYXJjenlrb3dza2ksIE1hcmVrIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIu
Y29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjIgNzo1NCBBTQ0KPiANCj4g
T24gRnJpLCBTZXAgMjMsIDIwMjIgYXQgMDc6MjE6MDRBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6DQo+ID4gPiBGcm9tOiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kNCj4gPiA+IFNlbnQ6
IFNhdHVyZGF5LCBTZXB0ZW1iZXIgMTcsIDIwMjIgMTA6NTEgQU0NCj4gPiA+DQo+ID4gPiBSZS11
c2Ugcm1ycj0gcGFyYW1ldGVyIGhhbmRsaW5nIGNvZGUgdG8gaGFuZGxlIGNvbW1vbiBkZXZpY2UN
Cj4gcmVzZXJ2ZWQNCj4gPiA+IG1lbW9yeS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBN
YXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kNCj4gPiA+IDxtYXJtYXJla0BpbnZpc2libGV0aGlu
Z3NsYWIuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiBDaGFuZ2VzIGluIHYzOg0KPiA+ID4gLSBtYWtl
IE1BWF9VU0VSX1JNUlJfUEFHRVMgYXBwbGljYWJsZSBvbmx5IHRvIHVzZXItY29uZmlndXJlZA0K
PiBSTVJSDQo+ID4gPiAtLS0NCj4gPiA+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1h
ci5jIHwgMjAxICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+IC0NCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDgyIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4g
PiA+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jDQo+ID4g
PiBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMNCj4gPiA+IGluZGV4IDM2NzMw
NGM4NzM5Yy4uM2RmNWY2YjY5NzE5IDEwMDY0NA0KPiA+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2RtYXIuYw0KPiA+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
dnRkL2RtYXIuYw0KPiA+ID4gQEAgLTg2MSwxMTEgKzg2MSwxMzkgQEAgc3RhdGljIHN0cnVjdCB1
c2VyX3JtcnIgX19pbml0ZGF0YQ0KPiA+ID4gdXNlcl9ybXJyc1tNQVhfVVNFUl9STVJSXTsNCj4g
PiA+DQo+ID4gPiAgLyogTWFjcm8gZm9yIFJNUlIgaW5jbHVzaXZlIHJhbmdlIGZvcm1hdHRpbmcu
ICovDQo+ID4gPiAgI2RlZmluZSBFUk1SUlVfRk1UICJbJWx4LSVseF0iDQo+ID4gPiAtI2RlZmlu
ZSBFUk1SUlVfQVJHKGVydSkgZXJ1LmJhc2VfcGZuLCBlcnUuZW5kX3Bmbg0KPiA+ID4gKyNkZWZp
bmUgRVJNUlJVX0FSRyBiYXNlX3BmbiwgZW5kX3Bmbg0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyBp
bnQgX19pbml0IGFkZF9vbmVfdXNlcl9ybXJyKHVuc2lnbmVkIGxvbmcgYmFzZV9wZm4sDQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmRf
cGZuLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBkZXZfY291bnQsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgKnNiZGYpOw0KPiA+DQo+ID4gSnVzdCBtb3ZlIHRoZSBmdW5jdGlvbiBoZXJl
IHRoZW4gbm8gbmVlZCBvZiBhIGRlY2xhcmF0aW9uLg0KPiANCj4gT2suDQo+IA0KPiA+ID4NCj4g
PiA+ICBzdGF0aWMgaW50IF9faW5pdCBhZGRfdXNlcl9ybXJyKHZvaWQpDQo+ID4gPiAgew0KPiA+
ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiA+ICsgICAgaW50IHJldDsNCj4gPiA+ICsNCj4g
PiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBucl9ybXJyOyBpKysgKQ0KPiA+ID4gKyAgICB7DQo+
ID4gPiArICAgICAgICByZXQgPSBhZGRfb25lX3VzZXJfcm1ycih1c2VyX3JtcnJzW2ldLmJhc2Vf
cGZuLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXNlcl9ybXJyc1tp
XS5lbmRfcGZuLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXNlcl9y
bXJyc1tpXS5kZXZfY291bnQsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1c2VyX3JtcnJzW2ldLnNiZGYpOw0KPiA+ID4gKyAgICAgICAgaWYgKCByZXQgPCAwICkNCj4g
PiA+ICsgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gKyAgICB9DQo+ID4gPiArICAgIHJl
dHVybiAwOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICsvKiBSZXR1cm5zIDEgb24gc3VjY2Vz
cywgMCB3aGVuIGlnbm9yaW5nIGFuZCA8IDAgb24gZXJyb3IuICovDQo+ID4NCj4gPiBJJ20gbm90
IHN1cmUgdGhlIHBvaW50IG9mICdpZ25vcmluZycuIElmIHVzZXIgc3BlY2lmaWVzIGEgd3Jvbmcg
Uk1SUg0KPiA+IHJhbmdlIChvdmVybGFwLCBtZm4gaW52YWxpZCwgZXRjLikganVzdCByZXR1cm4g
YW4gZXJyb3Igc2ltaWxhciB0bw0KPiA+IC1FTk9NRU0uIElnbm9yaW5nIGEgdXNlci1zcGVjaWZp
ZWQgcmFuZ2UgaW1wbGllcyB0aGF0IHNvbWV0aGluZw0KPiA+IHdvdWxkIHBvdGVudGlhbGx5IGdl
dCBicm9rZW4gaGVuY2UgYmV0dGVyIGZhaWwgaXQgZWFybHkuDQo+IA0KPiBUaGF0J3MgdGhlIGJl
aGF2aW91ciB0aGF0IHdhcyBoZXJlIGJlZm9yZSwgSSBzaW1wbHkgYWRkZWQgYSBjb21tZW50DQo+
IGFib3V0IGl0IGV4cGxpY2l0bHkgKHByZXZpb3VzbHkgaXQgdXNlZCAnY29udGludWUnIGhlYXZp
bHksIG5vdyBpdCdzIGENCj4gc2VwYXJhdGUgZnVuY3Rpb24gc28gaXQncyBhIHJldHVybiB2YWx1
ZSkuDQo+IFdoaWxlIEkgYWdyZWUgaW4gcHJpbmNpcGxlLCBJIGRvbid0IHRoaW5rIHN1Y2ggY2hh
bmdlIHNob3VsZCBiZSBwYXJ0IG9mDQo+IHRoaXMgcGF0Y2guDQo+IA0KPiAoLi4uKQ0KPiANCj4g
PiA+IEBAIC0xMTA4LDYgKzExMzYsMTUgQEAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sNCj4g
cGFyc2Vfcm1ycl9wYXJhbShjb25zdA0KPiA+ID4gY2hhciAqc3RyKQ0KPiA+ID4gICAgICAgICAg
ZWxzZQ0KPiA+ID4gICAgICAgICAgICAgIGVuZCA9IHN0YXJ0Ow0KPiA+ID4NCj4gPiA+ICsgICAg
ICAgIGlmICggKGVuZCAtIHN0YXJ0KSA+PSBNQVhfVVNFUl9STVJSX1BBR0VTICkNCj4gPiA+ICsg
ICAgICAgIHsNCj4gPiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBWVERQUkVGSVgN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICJSTVJSIHJhbmdlICJFUk1SUlVfRk1UIiBleGNl
ZWRzICJcDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICBfX3N0cmluZ2lmeShNQVhfVVNFUl9S
TVJSX1BBR0VTKSIgcGFnZXNcbiIsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICBzdGFydCwg
ZW5kKTsNCj4gPiA+ICsgICAgICAgICAgICByZXR1cm4gLUUyQklHOw0KPiA+ID4gKyAgICAgICAg
fQ0KPiA+ID4gKw0KPiA+DQo+ID4gd2h5IG1vdmluZyB0aGlzIGVycm9yIGNoZWNrIG91dCBvZiBh
ZGRfb25lX3VzZXJfcm1ycigpPyBJIGRpZG4ndA0KPiA+IGdldCB3aHkgaXQncyBzcGVjaWFsIGZy
b20gb3RoZXIgY2hlY2tzIHRoZXJlLCBlLmcuIGhhdmluZyBiYXNlPmVuZC4uLg0KPiANCj4gVG8g
YWxsb3cgaW50ZXJuYWwgY2FsbGVycyBieXBhc3MgTUFYX1VTRVJfUk1SUl9QQUdFUywgYW5kIG1h
a2UgaXQgYXBwbHkNCj4gcmVhbGx5IG9ubHkgdG8gdXNlci1wcm92aWRlZCByYW5nZXMuDQo+IA0K
DQpXaXRoIGFib3ZlIGNsYXJpZmljYXRpb24gYW5kIG9yZGVyIGFkanVzdG1lbnQsDQoNClJldmll
d2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==

