Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A7B560EEB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 04:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358137.587162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jXk-0003ya-LE; Thu, 30 Jun 2022 02:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358137.587162; Thu, 30 Jun 2022 02:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6jXk-0003wP-HR; Thu, 30 Jun 2022 02:04:32 +0000
Received: by outflank-mailman (input) for mailman id 358137;
 Thu, 30 Jun 2022 02:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0xB=XF=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1o6jXj-0003wJ-3T
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 02:04:31 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7912a7d-f818-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 04:04:28 +0200 (CEST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 19:04:25 -0700
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 29 Jun 2022 19:04:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 29 Jun 2022 19:04:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 29 Jun 2022 19:04:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 29 Jun 2022 19:04:23 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 02:04:21 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 02:04:21 +0000
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
X-Inumbo-ID: f7912a7d-f818-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656554668; x=1688090668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M5U6Uo0IVW3vHmxN8E2RMKF6mrAdlDY0/XN+ZTiqiTw=;
  b=IMz6iaEvivGiq4DZ9fPZZZai7g3X8OqIi9n6wBACcWk+u4Nr7qSemZS/
   X+eUyosi6691czID7Lzlwrrnfz0pECLmJkV9akasKJKkAkD2RpdCyabRX
   yM+yASxq8A/OAJwKphHe4rsjEcy4XfZT82O8OUBG/g0jnrtxoB19resIx
   gZDEp5YVoNuc7V3lTdC8n6bQ9KAJWgMhgSllWX31HdvzACiJuwtR49C1Q
   n4r3Ic+AHXntAiT+wTQXezNKZnASSV6V6WX4NLvNV039riEnpXoGSwsf2
   6waboJSOdFCKN+AwoNeM7RFXvzIhlOUckC0jeS9xXpQ0o91jVZOrF+JBQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="346207514"
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="346207514"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; 
   d="scan'208";a="590974461"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwPRf4OF9OuP5uxHU+KGP7cPycOdkt2kp2x6H/AS2NUhjGq4aG2h1QZ5cBSRvHDNoUE7eJ7YJB8xcJfA7xO7gPimUsQ6kE8k4E+OYW1Go7PfLw866hAjMz95MnVAcJUAwjF4DOmMJJ3uTM6vItsHf0GuohX1hPvNCpES5lWTyVvNimbwQbTLC7dw+oSnEKnf6wzM2boH+rV2DgiBsSVDc+Oa4q+Ilh9huQfjyTWj3HYjM8asQnx7OBusmCoMAP8nDo7wWRw/ypqmabMdvv6JKvcYkIHMgTeLaLHdRCBnHSdV3CyFBg3IHEgQw4+abs2GK/j66LYPwJcVyjGr8QyiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5U6Uo0IVW3vHmxN8E2RMKF6mrAdlDY0/XN+ZTiqiTw=;
 b=RxI6ZKYsJNEgDcZtCeKcxq2qg/aQibH1NiOaaSJuRjYxNGR2262nsQmnWlJQYTuZAQep5ZrdoSXJUzahvPtWDPj2+9Mj44/F2oBb9i1SacPjua07F+ZSeAdxiHD1lbis82g+ia2ysjT9Xl1ZRAM0ub/Ie+kBC0ecWV9MfO+NbhMrhWury92KhwjcK3pl08JXBocHgZjP17gTLpNH6z4JA4F0PjwaMYXJ6Vzx6q8nuvFzngLj6L0mA3nGgZFvqoZSkqSWDVTarm2S0fxpQJ9aXUNNH7gzddxqsRpd3e0h7lfM8UZKFzFlK2tRMyduVxBil4a/7R79nm8xQFKwiow7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Beulich,
 Jan" <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH] x86/ept: fix shattering of special pages
Thread-Topic: [PATCH] x86/ept: fix shattering of special pages
Thread-Index: AQHYig0A8+iuyC//Bk2PKQQEd7+3W61mDnbAgAANmACAARrLMA==
Date: Thu, 30 Jun 2022 02:04:21 +0000
Message-ID: <BN9PR11MB5276E5D3B9EBC700729E7F808CBA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220627100119.55363-1-roger.pau@citrix.com>
 <BN9PR11MB527685F117AAA3C1716A41EF8CBB9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <YrwXBtvpIl81GhQ7@Air-de-Roger>
In-Reply-To: <YrwXBtvpIl81GhQ7@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dd24497-22e9-401e-fcbc-08da5a3cd929
x-ms-traffictypediagnostic: MN2PR11MB4711:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZnZhRBxyHIJjtlht/zj22g+92D+C2b1n9ZmOqCv+xr89Pt4Ae8HyEzw1jpYpH+upRToh8Ha2BjCaZ8q3oqneYHLAi0EVl4ix3vDs2opJ0zcI7Nd+1Vd2hJ/6XJSHpDAlF9YyuD6o6rAv1D7IkbIrbAMf5t2cSGzd8YEcPEyusatTb9bv4EeBVtB3DhUHAf2ZoutgnYaTkmwjUVe/jVQ9BMBv/l8TWBuxK97V6i25RU+8IUA7EJV81OBjDHpJW7UiMclacJ3EAPHF71+yd2uQYQcVbTd66DnTNukhVZ2LnQe/sE2JK4jaUIsZKCkz0HQcI1hmC+iO32VJme/KOEd8sQWBx4jrMModC4yBwgIWfEgYfj5csyHlM1ha3LwqvGzq1SLmvBBJ/75ApeGhXOpcp5pKL/zqVLs5eoi4NB0E+3wLMTufJQ9+ilVg5z3gONiDm9vKkxeVurph7/kNGXfEnB88ZLEYNmWbq7s959C0LeYLqZ9eUHmjmG3c1+Fpv7RHfO5S/DZjnswLi1rjbriyUj5UB/1L08UbQh5S++rvMeJGBBs/MDhmjdOJvqlX7dCSz/wUqgrOWMixLjgG+OXIi33LUQ/fGqPSZeS7euPXEJhL2WQlDWagSFPWmpFYoG+zJ2RCnjx1iqPfWPPsnPr1f2eiAKSVvO8cQRTUzpT7/LlvC8SBi2ymMW8WaO+nR/BASVef74pabmrQHc0SF/muPnV+uIzhlyn1bke/CelZszivzCgOu5c4jMA/ejUv1RZY/9gyJiuomyLDAyNG3NK9NqkCUuoevFHeMMyu+J+4A5v0F8cXQxDDR9dLVxQQpHxA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(39860400002)(376002)(396003)(366004)(8936002)(52536014)(186003)(41300700001)(7696005)(6506007)(71200400001)(5660300002)(33656002)(478600001)(9686003)(2906002)(26005)(86362001)(66446008)(38070700005)(83380400001)(122000001)(82960400001)(54906003)(110136005)(4326008)(38100700002)(8676002)(76116006)(66476007)(64756008)(66556008)(66946007)(316002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkNaeXhweExrdnZEK0E0WFI4THJRVElIcjBqTTlKcmlZWnhwTzU0SEEzeDl2?=
 =?utf-8?B?OXUvYWd6ZFhWL25SWER4T243NWhxS25LRFNidUs2SGxlSHNhM3ZPODI4S0p4?=
 =?utf-8?B?Zm95TjV4NS9FNUZXdmFsMzZ5SFovSzJhMll5dDdEd29tWnBMMjBaeXNsenhl?=
 =?utf-8?B?aldOeDhnL3ovRW5KaFJ0dkZFeXNrNlZtc2hqTnhMWk41Z2hSVWF6NGoyQmh3?=
 =?utf-8?B?SC9odmVHaHR6Kzl3SVM1dk11U05vMHFXZ0FJeGZkem1ubjRuU09nWkw1TXdZ?=
 =?utf-8?B?T1lYOWxiZW5OS2dnRTNlRnlNaVFQSGZISndHR1FmclU3T0RQTEdmdHN2ajFm?=
 =?utf-8?B?NWlqbDJZZnoxeERDV1JzR0pXelhIUSsxUmZKNm1udFpwaG9RaGZJVjdRM1Qw?=
 =?utf-8?B?YWVPOHZBSFNXRFd2Yk9ka25VOWJBYjRkZXRlNlorM1NGYXBNd2dTU2pLSk1M?=
 =?utf-8?B?WGZoa3k2NzdRbktzMThzUlc3S3RlVWtvUlhWVW4rWHZqSVV1ZGxJb1N5OUZ6?=
 =?utf-8?B?S2ZLc1VrVm41c00wbWRnbXlNQ21sN3BXRkdRT1dKNnMxS0h3ZnlKelB2NXlB?=
 =?utf-8?B?T2N4aDkvVEZtdzI4Mm1FYU1INlF3NkVwSUVXdHQvNm5JOGl2OUhnR3dGMUtZ?=
 =?utf-8?B?T2tOUVNvVCtSLy9aR0dVdlBuUHIxdmRoYmJ0MVBoL0h6ZkNTdlVRc0xWckZ2?=
 =?utf-8?B?REh1dkVBQWVwSVV5cEZrNzB5MytQTEV3bHVRUDBKaTFOdmtsdFlmOHZDcTRM?=
 =?utf-8?B?dWtRYS9TaFJRL3gyNTJuQ3lWODJDc1VHU2I4cU9OVlFQeGdZZlZhSnpITGdQ?=
 =?utf-8?B?SmZGM3BVZ0pmK2FBUHFGOHpXUFkzaGhWWEtNMy9pZ0NQM2pRR1FobVlBUHlv?=
 =?utf-8?B?S01Wa2pPUTU3cllTa25WOUw0aFRjM1NSLzV0U09ZcURHTEdwVHl2VzIvbWxk?=
 =?utf-8?B?MTVLL0ZUWVZoQXpGS1ZlK1ZrbFE0NmdiNWVCQVhUdU1DbkVNRWlYYmU5NnpO?=
 =?utf-8?B?WlFkVEVGV1JNaDFLelJxQzN1TVZxSzFYdFhYTGZlRmxpWi90QkxDVW9wV3NE?=
 =?utf-8?B?WlJTa3Z5d2QwZU4xUmdBSUNuNXRpeW4vbU5ELzV5NFphTGNXNDVrRDVuQnlJ?=
 =?utf-8?B?YjR3cFNrT3VORTQ2QWNGek9paXQ3K3Z6UStPZ3cyNVRzdTJ1aHl3bEd0c25r?=
 =?utf-8?B?QmJtNFBidWVZZFZwUDZCRnFZNUNSa2ZrQmEyM0tvREhjUTVxRDdCb0J2RTF0?=
 =?utf-8?B?NzNydGFEUVVXZmx4N3JKVlJ1MTRWbU0ySEc2WS83VjU2eFNDOUJvWnd1dXNj?=
 =?utf-8?B?M05pN0FRc2FHRld2V3RZSERQZVRIYm9mM3FaWEJ4L3JyS015dG9KS2g0ell5?=
 =?utf-8?B?eXNvazN4OUVsZ2F6M2l4UnlXRUtucTZWdEEyejhZbGxZSm9nWGhQdHNYUTR1?=
 =?utf-8?B?NUZWUGoxa204bWE0N00ydXgwVzlYUVlWZW84dEhnSVJmSkU3TTJlM3lJeUNT?=
 =?utf-8?B?SGxtU0NzQkF5UmFYSjRlWlZhUTJlM2xtS3loL3JXQ3JIN0d1WkVsYnFiUk95?=
 =?utf-8?B?Uy81ZkZZUldOSUNmTmZ5djhIbzY2S3RYQVdock1qMlJjZjFqSEE0MmIzdldO?=
 =?utf-8?B?YVpDTlhEZk9lUEhnQTg2UTg2WVBHdE53R3I5TGtMNTRndHMzeU9OWE52UWxj?=
 =?utf-8?B?YjROd1VuelNzdVhrOHJTVG5NRGIwQU9zK0x3STR2NnE5WVREN1RrVXZVRVkx?=
 =?utf-8?B?VUEwOEZsWHorZGtaMFp5NW54UkdaK3VoRjRmSG9maUoyRVdvM0J2blBXc1Jw?=
 =?utf-8?B?NWNlR3BjVW9VRFV5WjBTSjQwdEF0ZHBucndYRmpUL3Qya04zWVVyZTdQTjcv?=
 =?utf-8?B?ZWtwUUhwZlU3YmF0YUZmemlIZ3hBNFREcXpFeEc0MmJTbGxqZ21qT0tiRUpQ?=
 =?utf-8?B?NXp3M0lCbkpVMkVQMzFoQnJTakxzNTQ0citNbVU3eTVJb0pvdTU4R0RnTmh1?=
 =?utf-8?B?TUVORW51NFlJbGoyVExWYUV1eXM4QXl0bVlPcVI2VFZBQ1lheGpsRHJWK2Vt?=
 =?utf-8?B?VTVIS3V0bFkrbWl2NEZjSVFhemZXWHZnbW9ScUhHNzVKSnYvUzBoYy9kemFm?=
 =?utf-8?Q?1GOt1c4vDu4WfjloYkTpseIIt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd24497-22e9-401e-fcbc-08da5a3cd929
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 02:04:21.4135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5EZB8ArfR5TVTp5szxnaga0W4f7ofmX/S50tN/i6p4pWYh3vS1l/Nw/+PrnP10Iq96SEa/Jj+icCRspLp0pmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBKdW5lIDI5LCAyMDIyIDU6MTEgUE0NCj4gDQo+IE9uIFdlZCwgSnVuIDI5LCAy
MDIyIGF0IDA4OjQxOjQzQU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOg0KPiA+ID4gRnJvbTog
Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiA+IFNlbnQ6IE1vbmRh
eSwgSnVuZSAyNywgMjAyMiA2OjAxIFBNDQo+ID4gPg0KPiA+ID4gVGhlIGN1cnJlbnQgbG9naWMg
aW4gZXB0ZV9nZXRfZW50cnlfZW10KCkgd2lsbCBzcGxpdCBhbnkgcGFnZSBtYXJrZWQNCj4gPiA+
IGFzIHNwZWNpYWwgd2l0aCBvcmRlciBncmVhdGVyIHRoYW4gemVybywgd2l0aG91dCBjaGVja2lu
ZyB3aGV0aGVyIHRoZQ0KPiA+ID4gc3VwZXIgcGFnZSBpcyBhbGwgc3BlY2lhbC4NCj4gPiA+DQo+
ID4gPiBGaXggdGhpcyBieSBvbmx5IHNwbGl0dGluZyB0aGUgcGFnZSBvbmx5IGlmIGl0J3Mgbm90
IGFsbCBtYXJrZWQgYXMNCj4gPiA+IHNwZWNpYWwsIGluIG9yZGVyIHRvIHByZXZlbnQgdW5uZWVk
ZWQgc3VwZXIgcGFnZSBzaHV0dGVyaW5nLg0KPiA+ID4NCj4gPiA+IEZpeGVzOiBjYTI0YjJmZmRi
ICgneDg2L2h2bTogc2V0ICdpcGF0JyBpbiBFUFQgZm9yIHNwZWNpYWwgcGFnZXMnKQ0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+IENjOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gPiA+IC0t
LQ0KPiA+ID4gSXQgd291bGQgc2VlbSB3ZWlyZCB0byBtZSB0byBoYXZlIGEgc3VwZXIgcGFnZSBl
bnRyeSBpbiBFUFQgd2l0aA0KPiA+ID4gcmFuZ2VzIG1hcmtlZCBhcyBzcGVjaWFsIGFuZCBub3Qg
dGhlIGZ1bGwgcGFnZS4gIEkgZ3Vlc3MgaXQncyBiZXR0ZXINCj4gPiA+IHRvIGJlIHNhZmUsIGJ1
dCBJIGRvbid0IHNlZSBhbiBzY2VuYXJpbyB3aGVyZSB3ZSBjb3VsZCBlbmQgdXAgaW4gdGhhdA0K
PiA+ID4gc2l0dWF0aW9uLg0KPiA+ID4NCj4gPiA+IEkndmUgYmVlbiB0cnlpbmcgdG8gZmluZCBh
IGNsYXJpZmljYXRpb24gaW4gdGhlIG9yaWdpbmFsIHBhdGNoDQo+ID4gPiBzdWJtaXNzaW9uIGFi
b3V0IGhvdyBpdCdzIHBvc3NpYmxlIHRvIGhhdmUgc3VjaCBzdXBlciBwYWdlIEVQVCBlbnRyeSwN
Cj4gPiA+IGJ1dCBoYXZlbid0IGJlZW4gYWJsZSB0byBmaW5kIGFueSBqdXN0aWZpY2F0aW9uLg0K
PiA+ID4NCj4gPiA+IE1pZ2h0IGJlIG5pY2UgdG8gZXhwYW5kIHRoZSBjb21taXQgbWVzc2FnZSBh
cyB0byB3aHkgaXQncyBwb3NzaWJsZSB0bw0KPiA+ID4gaGF2ZSBzdWNoIG1peGVkIHN1cGVyIHBh
Z2UgZW50cmllcyB0aGF0IHdvdWxkIG5lZWQgc3BsaXR0aW5nLg0KPiA+DQo+ID4gSGVyZSBpcyB3
aGF0IEkgZGlnIG91dC4NCj4gPg0KPiA+IFdoZW4gcmV2aWV3aW5nIHYxIG9mIGFkZGluZyBzcGVj
aWFsIHBhZ2UgY2hlY2ssIEphbiBzdWdnZXN0ZWQNCj4gPiB0aGF0IEFQSUMgYWNjZXNzIHBhZ2Ug
d2FzIGFsc28gY292ZXJlZCBoZW5jZSB0aGUgb2xkIGxvZ2ljIGZvciBBUElDDQo+ID4gYWNjZXNz
IHBhZ2UgY2FuIGJlIHJlbW92ZWQuIFsxXQ0KPiANCj4gQnV0IHRoZSBBUElDIGFjY2VzcyBwYWdl
IGlzIGFsd2F5cyBhZGRlZCB1c2luZyBzZXRfbW1pb19wMm1fZW50cnkoKSwNCj4gd2hpY2ggd2ls
bCB1bmNvbmRpdGlvbmFsbHkgY3JlYXRlIGFuIGVudHJ5IGZvciBpdCBpbiB0aGUgRVBULCBoZW5j
ZQ0KPiB0aGVyZSdzIG5vIGV4cGxpY2l0IG5lZWQgdG8gY2hlY2sgZm9yIGl0J3MgcHJlc2VuY2Ug
aW5zaWRlIG9mIGhpZ2hlcg0KPiBvcmRlciBwYWdlcy4NCj4gDQo+ID4gVGhlbiB3aGVuIHJldmll
d2luZyB2MiBoZSBmb3VuZCB0aGF0IHRoZSBvcmRlciBjaGVjayBpbiByZW1vdmVkDQo+ID4gbG9n
aWMgd2FzIG5vdCBjYXJyaWVkIHRvIHRoZSBuZXcgY2hlY2sgb24gc3BlY2lhbCBwYWdlLiBbMl0N
Cj4gPg0KPiA+IFRoZSBvcmlnaW5hbCBvcmRlciBjaGVjayBpbiBvbGQgQVBJQyBhY2Nlc3MgbG9n
aWMgY2FtZSBmcm9tOg0KPiA+DQo+ID4gY29tbWl0IDEyNjAxOGYyYWNkNTQxNjQzNDc0NzQyM2U2
MWE0NjkwMTA4YjlkYzkNCj4gPiBBdXRob3I6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPiBEYXRlOiAgIEZyaSBNYXkgMiAxMDo0ODo0OCAyMDE0ICswMjAwDQo+ID4NCj4gPiAg
ICAgeDg2L0VQVDogY29uc2lkZXIgcGFnZSBvcmRlciB3aGVuIGNoZWNraW5nIGZvciBBUElDIE1G
Tg0KPiA+DQo+ID4gICAgIFRoaXMgd2FzIG92ZXJsb29rZWQgaW4gM2Q5MGQ2ZTYgKCJ4ODYvRVBU
OiBzcGxpdCBzdXBlciBwYWdlcyB1cG9uDQo+ID4gICAgIG1pc21hdGNoaW5nIG1lbW9yeSB0eXBl
cyIpLg0KPiA+DQo+ID4gICAgIFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gPiAgICAgQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPg0KPiA+ICAgICBSZXZpZXdlZC1ieTogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+DQo+ID4N
Cj4gPiBJIHN1cHBvc2UgSmFuIG1heSBhY3R1YWxseSBmaW5kIHN1Y2ggbWl4ZWQgc3VwZXIgcGFn
ZSBlbnRyeSBjYXNlDQo+ID4gdG8gYnJpbmcgdGhpcyBmaXggaW4uDQo+IA0KPiBIbSwgSSBndWVz
cyB0aGVvcmV0aWNhbGx5IGl0IGNvdWxkIGJlIHBvc3NpYmxlIGZvciBjb250aWd1b3VzIGVudHJp
ZXMNCj4gdG8gYmUgY29hbGVzY2VkIChpZiB3ZSBldmVyIGltcGxlbWVudCB0aGF0IGZvciBwMm0g
cGFnZSB0YWJsZXMpLCBhbmQNCj4gaGVuY2UgcmVzdWx0IGluIHN1cGVyIHBhZ2VzIGJlaW5nIGNy
ZWF0ZWQgZnJvbSBzbWFsbGVyIGVudHJpZXMuDQo+IA0KPiBJdCB0aGF0IGNhc2UgaXQgd291bGQg
YmUgbGVzcyBjbGVhciB0byBhc3NlcnQgdGhhdCBzcGVjaWFsIHBhZ2VzDQo+IGNhbm5vdCBiZSBj
b2FsZXNjZWQgd2l0aCBvdGhlciBjb250aWd1b3VzIGVudHJpZXMuDQoNCldpdGggSmFuJ3MgY29u
ZmlybWF0aW9uIEknbSBmaW5lIHdpdGggdGhpcyBjaGFuZ2UgdG9vLiBKdXN0IGJlbG93Li4uDQoN
Cj4gPg0KPiA+IERpZCB5b3UgYWN0dWFsbHkgb2JzZXJ2ZSBhbiBpbXBhY3Qgdy9vIHRoaXMgZml4
Pw0KPiANCj4gWWVzLCB0aGUgb3JpZ2luYWwgY2hhbmdlIGhhcyBjYXVzZWQgYSBwZXJmb3JtYW5j
ZSByZWdyZXNzaW9uIGluIHNvbWUNCj4gR1BVIHBhc3MgdGhyb3VnaCB3b3JrbG9hZHMgZm9yIFhl
blNlcnZlci4gIEkgdGhpbmsgaXQncyByZWFzb25hYmxlIHRvDQo+IGF2b2lkIHN1cGVyIHBhZ2Ug
c2hhdHRlcmluZyBpZiB0aGUgcmVzdWx0aW5nIHBhZ2VzIHdvdWxkIGFsbCBlbmQgdXANCj4gdXNp
bmcgaXBhdCBhbmQgV1JCQUNLIGNhY2hlIGF0dHJpYnV0ZSwgYXMgdGhlcmUncyBubyByZWFzb24g
Zm9yIHRoZQ0KPiBzcGxpdCBpbiB0aGUgZmlyc3QgY2FzZS4NCj4gDQoNCi4uLiBJJ2QgYXBwcmVj
aWF0ZSBtZW50aW9uaW5nIHRoZSByZWdyZXNzaW9uIGNhc2UgaW4gdGhlIGNvbW1pdCBtc2cuDQoN
CldpdGggdGhhdCwNCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPg0K

