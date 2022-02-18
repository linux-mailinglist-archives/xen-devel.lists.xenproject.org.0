Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2D4BB13B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 06:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275084.470794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvh8-000531-46; Fri, 18 Feb 2022 05:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275084.470794; Fri, 18 Feb 2022 05:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvh8-00050F-0O; Fri, 18 Feb 2022 05:20:38 +0000
Received: by outflank-mailman (input) for mailman id 275084;
 Fri, 18 Feb 2022 05:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkm2=TB=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nKvh6-000509-94
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 05:20:36 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e11a3a8-907a-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 06:20:33 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 21:20:31 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 17 Feb 2022 21:20:31 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:20:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 21:20:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 21:20:30 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR11MB0058.namprd11.prod.outlook.com (2603:10b6:4:6c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Fri, 18 Feb
 2022 05:20:29 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 05:20:29 +0000
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
X-Inumbo-ID: 7e11a3a8-907a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645161633; x=1676697633;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=55WpNPG1YQ4oNB2e4F6gEqonZ7TVbRzDH6W+HYJNnmU=;
  b=hwb7BD9PiheVJv40zBTMEpdT7Xhez4PoKMxuSVK7KPtCJiqlZ0iK6YsO
   LIWIiIiDJ7ECXM43sr4Trn421wZmUULnYCQ7YvnwaWescmQAMofiQ2mAb
   n8/sgKGM9eFnE2NaC9jFtRk52V9h/9HY1C6mHl8EF1ha2qjE/ctZiWLqS
   tcvDFrzqBEHIOtuMC8CTj1pD+ri+I60vSfSokvOM/KI6EFhfsLaxe9saB
   gX8EKsQrvCYFotg3ly3e56FZI8XM/pXc5wXeAwajj6lqd0NKb6Mrjqw03
   p+Kw7IFnEA9up7anQzE4xcbKzU9hc2gUw8ds2amFd6vyTqPt96p95kEBo
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314319413"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="314319413"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="705231493"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAQKMHG3rKsqIwsvSEeOe1Ti/OSPySwGY/l4jp53krRvQ5lL7oycnNJEzxdk7VPFvw7cv8Z4QrGmBlM8GsrhBVGqFmwhAXVIjkdJH5mur7iM2AM7kf8vZxZa/WQDygbPI8d4BlMaPvnkrUcuJkRTa+SjQG+Qj78Da3UwH6+TaLk4u+eI/qMQdC3uNEMCbOdrhwA5Rmp7wN9OAENqpS1mzOREVCKtqFS7MXf0/5pTUosZfEmuJI8kBtKts69l/7WhsLpL07uscLV/S/waXNTXSr72uc1MKN3w9m8htAANhpbPlEfDkRuEVEhrDxG/gBmBXDqcHm7TFGSPso5Npd/f9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55WpNPG1YQ4oNB2e4F6gEqonZ7TVbRzDH6W+HYJNnmU=;
 b=mypLZWSnFg0w0+dBin2tAxsv8NdyCJluGUXC1FqXyceFPi6iWrpZ7P1knbf2/IzsmKnsYFdgeFiUTU2D+cdqPfKiMVW4/gMfA6RRi1gSAbs6xnKAlUACfT1maJhWL7edvz7thbNDtrg6hNrhzDYZ/j0r1ThkNSgdlcMlQvG37nFClyK7zMnpt2E6I9sNVxm0fjWBZuVS7hHVEL8I7Ia9nXbUmYqjXKBIPrZBTSa213341u4KrtWmHs6C9byT6GnlX9FJhGIcM5I5DDaC0EB5GepMkeiRVZ4tCM99KkWnIQLHj/j1oLjsbiDcvvmunOHdWP4qXVXzXVIcxOlmtsGlDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3 20/23] VT-d: free all-empty page tables
Thread-Topic: [PATCH v3 20/23] VT-d: free all-empty page tables
Thread-Index: AQHYBkBAHcUqxDPFCEWIL9jRoPTFzayZAFJQ
Date: Fri, 18 Feb 2022 05:20:29 +0000
Message-ID: <BN9PR11MB527622E58C2E4EF90CF29EF88C379@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <807a48fe-3829-d976-75dc-1767d32fb0f4@suse.com>
In-Reply-To: <807a48fe-3829-d976-75dc-1767d32fb0f4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98afe172-4c82-4b1a-f177-08d9f29e60dc
x-ms-traffictypediagnostic: DM5PR11MB0058:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB00587728688EBB114225134C8C379@DM5PR11MB0058.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lN47a3R3U5mkSCtVlJoUb4U3Tj13ElbFNvwXvBfHeFYipFFReaM5bSQfs+QdL6KGme3jYYjNhav9PplItHaumkatOKnWFKL9IGoUKE2MWJH3wdqvDrQoXFak89ISSdLTrH4zyjuK0ndFtTrU9eLzuS544/jCfTdzLyjQ9kx1prvO8+II8tI8+Wip4yn9GzZG0LnPueFfuQgKWrdIRI1tusiELeU0CuPa3Nu+OjnBi636cCZfc3piwbh/RxnP85K5UshfX9APkaiUf+5QPGzoXfxx1nmvceWTlU2n81gxbZqGLducnRqXVb61xkQTO1COgtazk4KwNpvAr2I9XtMxuhIapGu6dPVkb1wOLX1M4/+hfFSj2jYdSYFn7GYjrUPsWQMCC0zvU1hzMlVz7ONtTW0yvXFIPDgXWlFuPSs95oJBtFuqfegswyxIYdLQ95LYNFweGGfY1U9M/8lSglSsngQ+IaMSQmAV3FCHKCcfv7fkTbYBbAcwWDIEojaYwtRbtkcmwxQyVf3lxd/5Q01X5BJYfn/7k6gMVeOqvfq+nGIErmFUPrITiClyFTODal9bR6lWxUNWhs70T+z2G5INGHX03CcIacsbblDjgcmRGwL5+UwXPjZIWURtaSYmrozJPk/QBr5ltWNh7KNvL0KaUe9hxuSXhAYw11726K4ziMSwd7kxo/DmRqET2gYckLQIV5XXFJUaNVT+ll2TZUesUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(26005)(71200400001)(52536014)(83380400001)(38100700002)(66476007)(8936002)(110136005)(7696005)(64756008)(186003)(508600001)(82960400001)(76116006)(66946007)(9686003)(86362001)(33656002)(55016003)(66446008)(38070700005)(4326008)(66556008)(6506007)(2906002)(316002)(8676002)(54906003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnBPSHdxVjNSaHZGTFQ2ODMrbUU3dm1BRVdJZEFVTE5JUm9HN284TUZ0bnVJ?=
 =?utf-8?B?MGZZYXZsSG9mTW1EYWlwakNhTkppLzgyS0drK3dpSGhrbTA3NjBDWjZTMWw5?=
 =?utf-8?B?eDdGRDUvOU9PTGpWbkdLTWJtemRmQnJjdEJQRTZBbWxqem5wa0dXZU5SaEM4?=
 =?utf-8?B?ZXNwUlYzM0VwU3dWam0xZUpzZHVmTjZrM0FqZ09CTDVWaUpVNWZ4TXB2TTJO?=
 =?utf-8?B?V2tFVXJENkE4Tng4SDZrNlhYaDJRa0tZQWgzVUxhY0QrY3JVVzRySDNpNW5T?=
 =?utf-8?B?Q1AwOTd5ZFZBMkVLNlJiZ1ZBVXN4SzQxVHhwcDc2VmIzalNkdlVPeHJyVWNI?=
 =?utf-8?B?aGxicUZra0NmUUd2MEROL3E4SFM4U0NYMzB3dnkvRWFJRzZORkI3ZXJRN1Rt?=
 =?utf-8?B?VXJWaThxN1pTZXNsdFdqTFNoRW5sVGw4ajZBcERoMkxGaVliZndhaVkvQ2Fx?=
 =?utf-8?B?ajU2VEIrTitRMFBBWE5pZXJ0MXZjTWNuUkpyZmNMb3k0RzRFY1d0UmcwNk5U?=
 =?utf-8?B?MGhlWGJray9DbGdCWFRlOGJDZlVtdG42aFVTUENVM29iQWh3Znh3NGYvTWlH?=
 =?utf-8?B?dzNpUHNFYmI4eCtEYWphQjRGQ1JpenpsSmY2Q1VJcmRWM3BVWVE5OHhJSGIz?=
 =?utf-8?B?bC8vT1ZZSVAxdFk1S3Q3OEFaVXhRejR5QVk4VFhRZlJ1KytGTGpRR0crN3ZH?=
 =?utf-8?B?NlBNSWhQQmhxN2krNTZMYllWem9mcnpRdVJ2QTNKYm9uYlBOL2R1VUhOb1Ux?=
 =?utf-8?B?UkdSS0pzWnN1L09DdWZ0dVI3QXJXZjlHbXR3WFRyRnBEbXlVU0hrQmd2WlNy?=
 =?utf-8?B?akI0YlI3a2lSK0FHUlF3MXNXVHlRdC9zT1pzVWp4SGRLLzE3U0ZWMks1dG1a?=
 =?utf-8?B?N3l3bzNjQ2VpUVhDMEJxcElEMDJTcllWQmVNd2ZkZDhNRGF0UGdiQ1hjSXdw?=
 =?utf-8?B?cnkzRm1HTnFKSFM5azdUMGpMVEFPalg3NGZQQUNhb1BvOE1pMnFFdGh1Mkll?=
 =?utf-8?B?dVl5a2V3OGNQaEVWTG51d3JmM0UwNVFNTzkvK3dzUlpDb2xCREZGQVptdUxS?=
 =?utf-8?B?aGNnaG5TS3BsNUljSDJzTUc1MGZObnUrcEJLMHEzRkxsaUVFNjZ6NUtQVDUz?=
 =?utf-8?B?eDRKK3ZFSk9TTVRDaFp3d2pUczRnb2kwanVQZ3NuZzhGc2RnaFkxTVpKVGlw?=
 =?utf-8?B?UlZvSGxVTmFrNXlWS1d1Nm5ZZ0dJVml4WVhOQU8xblZ1a0RjZXpGbVhPeElz?=
 =?utf-8?B?TXdUQ0pzVEVUYU9aYld3OFgyYzZKZFdkb1duQTJVdVNzMUJpM3RScnZjSkRJ?=
 =?utf-8?B?Vkhnc2FIV0orbzUwaGhjd2VlWTIwdlAxd1hqZG5FL0I1ekRHQjJ4MUI1T3lR?=
 =?utf-8?B?OTJoQTJqUWpaL3NwVFF5TWQ5YWdTWW1Rb0U5L01ZT1J1UTU5b0hvS3lLYWtE?=
 =?utf-8?B?U1QydE9nbHpKUG5TSXp2VDc0cUVFOEJBL1M1Z0FOUDVTbmlTL3hnVUJSUmpI?=
 =?utf-8?B?NzNLSS85NjU1MmlrQWtPVDFDYkVHMnJTbzkxMko0RlZzUzBuUEdYTjc5Mjd0?=
 =?utf-8?B?QmZ4bUZ4RHhtelE4YWd4TGJJdE1zaHhZM2FaeDAwaTdrQzRIa2RIWE5CMW9F?=
 =?utf-8?B?NEJJb0N1NVZqN0UzV0pieml4Nkh4YVdadmlBMytzRW9vY3V1ZEtpblkvTVBP?=
 =?utf-8?B?RE94RkJlK2RjamJwQi83WEpzalVoNzRldENRcXJsSEpjc0RCTVNTWnIrYUl0?=
 =?utf-8?B?UVFsaUQ2RVpBaGsvbXRIdVpieHFtTXpyaUVhcXY3WjZ6YVpLNHpybU9UZ0I5?=
 =?utf-8?B?ekgwTmE1QzQ2bkx1alBwbldFL25uQkFtbkE0K2h5K0ttUUdwWDRFRjhGeGJL?=
 =?utf-8?B?NXMzZ24vbzlTc2ZYMTZ3OGRvMlNMQ0FVb1pkc3BnVTQyaFNVdG5qM0NqMjdZ?=
 =?utf-8?B?OUFNN1hWVTYwL0wxZENqbldkb2lTWGhWWFJQZS9KZ05RNEEwTXM1cG9Pdkpl?=
 =?utf-8?B?dTJwa1FNbkJ4VXc5bGloOC9MekxMTWZKK0xnQlE2T3ZlMHNjbnRvR1p0TEcz?=
 =?utf-8?B?dTBoYWZkenRPbnpxeVNTYkRtVlcvY29Qcm02bTdWWEYrNkZjVTV2M1M4UjZs?=
 =?utf-8?B?TllhaXc1dkZkV29SVFpOMmNZVzFvVGhNWm4rRklkVkNEZEMxN1pwVXNEVWVF?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98afe172-4c82-4b1a-f177-08d9f29e60dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 05:20:29.2701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNOJsI3VRfKyTnDKOpp6Dj3B0To9vnhJLw3V++Iu1i0dEXRVjo7GoxCG0WfGPa1kJocao4nRVbFWH8rJDV3s6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0058
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgMTEsIDIwMjIgMTI6MzYgQU0NCj4gDQo+IFdoZW4gYSBwYWdlIHRhYmxlIGVuZHMg
dXAgd2l0aCBubyBwcmVzZW50IGVudHJpZXMgbGVmdCwgaXQgY2FuIGJlDQo+IHJlcGxhY2VkIGJ5
IGEgbm9uLXByZXNlbnQgZW50cnkgYXQgdGhlIG5leHQgaGlnaGVyIGxldmVsLiBUaGUgcGFnZSB0
YWJsZQ0KPiBpdHNlbGYgY2FuIHRoZW4gYmUgc2NoZWR1bGVkIGZvciBmcmVlaW5nLg0KPiANCj4g
Tm90ZSB0aGF0IHdoaWxlIGl0cyBvdXRwdXQgaXNuJ3QgdXNlZCB0aGVyZSB5ZXQsDQo+IHB0X3Vw
ZGF0ZV9jb250aWdfbWFya2VycygpIHJpZ2h0IGF3YXkgbmVlZHMgdG8gYmUgY2FsbGVkIGluIGFs
bCBwbGFjZXMNCj4gd2hlcmUgZW50cmllcyBnZXQgdXBkYXRlZCwgbm90IGp1c3QgdGhlIG9uZSB3
aGVyZSBlbnRyaWVzIGdldCBjbGVhcmVkLg0KPiANCj4gTm90ZSBmdXJ0aGVyIHRoYXQgd2hpbGUg
cHRfdXBkYXRlX2NvbnRpZ19tYXJrZXJzKCkgdXBkYXRlcyBwZXJoYXBzDQo+IHNldmVyYWwgUFRF
cyB3aXRoaW4gdGhlIHRhYmxlLCBzaW5jZSB0aGVzZSBhcmUgY2hhbmdlcyB0byAiYXZhaWwiIGJp
dHMNCj4gb25seSBJIGRvIG5vdCB0aGluayB0aGF0IGNhY2hlIGZsdXNoaW5nIHdvdWxkIGJlIG5l
ZWRlZCBhZnRlcndhcmRzLiBTdWNoDQo+IGNhY2hlIGZsdXNoaW5nIChvZiBlbnRpcmUgcGFnZXMs
IHVubGVzcyBhZGRpbmcgeWV0IG1vcmUgbG9naWMgdG8gbWUgbW9yZQ0KPiBzZWxlY3RpdmUpIHdv
dWxkIGJlIHF1aXRlIG5vdGljYWJsZSBwZXJmb3JtYW5jZS13aXNlICh2ZXJ5IHByb21pbmVudA0K
PiBkdXJpbmcgRG9tMCBib290KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IHYzOiBQcm9wZXJseSBib3VuZCBsb29wLiBSZS1i
YXNlIG92ZXIgY2hhbmdlcyBlYXJsaWVyIGluIHRoZSBzZXJpZXMuDQo+IHYyOiBOZXcuDQo+IC0t
LQ0KPiBUaGUgaGFuZyBkdXJpbmcgYm9vdCBvbiBteSBMYXRpdHVkZSBFNjQxMCAoc2VlIHRoZSBy
ZXNwZWN0aXZlIGNvZGUNCj4gY29tbWVudCkgd2FzIHByZXR0eSBjbG9zZSBhZnRlciBpb21tdV9l
bmFibGVfdHJhbnNsYXRpb24oKS4gTm8gZXJyb3JzLA0KPiBubyB3YXRjaGRvZyB3b3VsZCBraWNr
IGluLCBqdXN0IHNvbWV0aW1lcyB0aGUgZmlyc3QgZmV3IHBpeGVsIGxpbmVzIG9mDQo+IHRoZSBu
ZXh0IGxvZyBtZXNzYWdlJ3MgKFhFTikgcHJlZml4IHdvdWxkIGhhdmUgbWFkZSBpdCBvdXQgdG8g
dGhlIHNjcmVlbg0KPiAoYW5kIHRoZXJlJ3Mgbm8gc2VyaWFsIHRoZXJlKS4gSXQncyBiZWVuIGEg
bG90IG9mIGV4cGVyaW1lbnRpbmcgdW50aWwgSQ0KPiBmaWd1cmVkIHRoZSB3b3JrYXJvdW5kICh3
aGljaCBJIGNvbnNpZGVyIHVnbHksIGJ1dCBoYWxmd2F5IGFjY2VwdGFibGUpLg0KPiBJJ3ZlIGJl
ZW4gdHJ5aW5nIGhhcmQgdG8gbWFrZSBzdXJlIHRoZSB3b3JrYXJvdW5kIHdvdWxkbid0IGJlIG1h
c2tpbmcgYQ0KPiByZWFsIGlzc3VlLCB5ZXQgSSdtIHN0aWxsIHdhcnkgb2YgaXQgcG9zc2libHkg
ZG9pbmcgc28gLi4uIE15IGJlc3QgZ3Vlc3MNCj4gYXQgdGhpcyBwb2ludCBpcyB0aGF0IG9uIHRo
ZXNlIG9sZCBJT01NVXMgdGhlIGlnbm9yZWQgYml0cyA1Mi4uLjYxDQo+IGFyZW4ndCByZWFsbHkg
aWdub3JlZCBmb3IgcHJlc2VudCBlbnRyaWVzLCBidXQgYWxzbyBhcmVuJ3QgInJlc2VydmVkIg0K
PiBlbm91Z2ggdG8gdHJpZ2dlciBmYXVsdHMuIFRoaXMgZ3Vlc3MgaXMgZnJvbSBoYXZpbmcgdHJp
ZWQgdG8gc2V0IG90aGVyDQoNCklzIHRoaXMgbWFjaGluZSBhYmxlIHRvIGNhcHR1cmUgYW55IFZU
LWQgZmF1bHRzIGJlZm9yZT8gSWYgeWVzIG1heWJlDQp5b3Ugd2lsbCBvYnNlcnZlIG1vcmUgaW5m
b3JtYXRpb24gaWYgdHJ5aW5nIHRvIHR3ZWFrIHRob3NlIGJpdHMgYXQgYSBsYXRlcg0KdGltZSAo
aW5zdGVhZCBvZiB3aGVuIGlvbW11IGlzIGVuYWJsZWQpPw0KDQpUaGFua3MNCktldmluDQo=

