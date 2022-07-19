Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA9557943E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 09:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370448.602227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDhk2-0000Ph-KX; Tue, 19 Jul 2022 07:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370448.602227; Tue, 19 Jul 2022 07:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDhk2-0000MR-GN; Tue, 19 Jul 2022 07:34:02 +0000
Received: by outflank-mailman (input) for mailman id 370448;
 Tue, 19 Jul 2022 07:34:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3/S=XY=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1oDhk1-0000MG-2c
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 07:34:01 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2655b13d-0735-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 09:33:59 +0200 (CEST)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 00:33:53 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2022 00:33:52 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 19 Jul 2022 00:33:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Jul 2022 00:33:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Jul 2022 00:33:51 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS7PR11MB6016.namprd11.prod.outlook.com (2603:10b6:8:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 07:33:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:33:47 +0000
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
X-Inumbo-ID: 2655b13d-0735-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658216039; x=1689752039;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jufNV3nxQkFwocZat4wcTsVyyuEHjh01WxwsvJNYDGI=;
  b=CTmgyy0hCAEns2GVD5rDwMSEzw0Vz//dMlwlqoN+K4/T2pTtj307bgcu
   wxUHAiRSfr7X2Iwl8UVc5yqAIIAp5zEK5wzexHgSVxxg+dJvJMVrombLZ
   3n52QWB6z0a7Kl6B7l9WVx88ocD6X61Kc+IvSl/2YqXi75rHMbt9M0Q4K
   jfw49u8AowWW4YD0HOOhX3QoM69ssSuE5tcZIWJoBtJzM1ImBB5liIeTF
   8jnyCo0Hph0Q8ipy2eDAd7uvFNBlMJAYLSgXoxYNoZk1d1S/61Kbr5JSX
   z+BkE9hj1olGHXjlp5mHK0cvELe6VLFv/jj3DFJaTBSHyrLBoMw3KKhpT
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266821746"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="266821746"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="665326433"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5zi4Zws0niGOpUXIfoTy9MMa2g7IAD9r6tkrijjUHNIXDz6BlFQNr6C5JHeckCraXju9vF1PeEtvox7VQbULSl28+7192dld4AFsgADV6Ng1AQwJF4AvD9iABznduAcmUS+uMX/BA3UCnV2jYiB+F0XqZ0RPvRY0vomKe1TFhSLjX0vhUpLjiA+ARvj0t+Y3LxDewqFwwj6i2uaJkEY3MRjGkjrw2HbN+mVUGZ3JgPsgj7IYsUIGC0tG8eKZ9Zslz9UudjgwCODtsb/MDOCgaTb0/D0q6esdRHz15mw4c7uQCURmfA+PH5tHQJKDSTr9dz9dcS+eBoH0rzzf7HpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jufNV3nxQkFwocZat4wcTsVyyuEHjh01WxwsvJNYDGI=;
 b=KPKGSsHt8GeV0l8QpZ0rVBI5yPKgcLSZlt4qli5uBcrVG3MQwwNRhwX1A/jt8te3tCvG2Wx6VwA45bJ+hhTvaw57fZTM5IyiYqJqMnJgESh5lWLHAHME7hiuUvVpLX3mI2dm3qfYa+Q5Nl4smmX6wMuiiFKfWqXZo5lB+eypMwZ+Kj1auC6wRmiWjP4ZuCGuYYcecMf+mWq57uXz95d+FwoLfPj3ahpz+FAbuNFM3daP3syIaU+psz5H0mYX3xri9TmIk7mT0pM+2pRJhf4Oi0IPHH0ZnENNeEUXFI+7rpLB2BJRaUo2St75dVQf3wBwIE5wXFZ9gKZ7NjJyusWfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "Beulich, Jan" <JBeulich@suse.com>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v3 2/3] x86/vmx: introduce helper to set
 VMX_INTR_SHADOW_NMI
Thread-Topic: [PATCH v3 2/3] x86/vmx: introduce helper to set
 VMX_INTR_SHADOW_NMI
Thread-Index: AQHYjUzyHVJg5Vl520WKm8Qoee4tTK2FaJfg
Date: Tue, 19 Jul 2022 07:33:47 +0000
Message-ID: <BN9PR11MB52763434820370E44457745D8C8F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220701131648.34292-1-roger.pau@citrix.com>
 <20220701131648.34292-3-roger.pau@citrix.com>
In-Reply-To: <20220701131648.34292-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a4479a5-22c8-4d90-fbe2-08da6959049e
x-ms-traffictypediagnostic: DS7PR11MB6016:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JCWNuRAHUHEK6B+xbwNGv1oSzX/dhzF5qvc0CiQ99xKivclKe8HdZqH90YXXcs0afDKg/9pbAdAAbdho6DzvSHDUxxAJ08Q9Gx5cVKd0KuyXFBzKljy73AWmCKkSzPfawuQblnWFso+E4mu08W94L/7HQGE/pbzaL54kvOGT5nWKuLfKyBac61bpLnCXpWaTL1VDC2xS+x+HrIAWgEEqOKGHvvsWXddExUEjjFMAhJQHoYSzgMST48sJwA6zwn1WKH1tG52Oy6JGr1dByQzbZkIs+f+LpEZ1AkX3RFhi9rHmlM80LM11OwULDqlgxX0pp/Ze3U1ykIxyjtFsTZfRuTPXdssJ4PZyx5q9lDFnZwBmn0rE8mYqYGS+CJHymj70AX8QhgtyaoAIdjfOtAYQY/4e64d2Apd1v8Yd4uBG+V5tlcF1iQgtXDHgc30c5p47B6Dm85PKAVRoz6og834N3K4al67MjSyQVvwnnBE0IK5Rs6aSdgkhb9xpuLol/7ecpcugFl0fF02ax9nqhRIo070DlWRU9PHNuBPtEn07Yw3Gb2qIf66NSDy47zGeozNRlp+lCGktkfRqKzd6E2ZFqpm4Y1nJLtz+GKvfkk7bmyncffxbauuE1xqEJsWPexChcrgQNFCKwd/TfIO7RgP9N48HGO9i35HwE5jVfgYr5zt9sKR2F90GnRNrp2bRFp9LrOW5BJtpJlF1yt6SSXfXjVdX3l3OFUWVbas8Az0MDqqb+0rj8VAtYOO/27G1IhoFaO8gLWJFVtCUQVjzE2/cVMXil6ebJbfNy5in8AwA1LRGhWCIBX6mgoHAP0OEs3wI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(136003)(39860400002)(376002)(52536014)(5660300002)(64756008)(8936002)(55016003)(66446008)(33656002)(2906002)(4744005)(8676002)(316002)(66556008)(110136005)(86362001)(76116006)(41300700001)(82960400001)(122000001)(66476007)(26005)(71200400001)(186003)(478600001)(9686003)(38070700005)(54906003)(4326008)(66946007)(83380400001)(7696005)(38100700002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Snd6bW9IYy9FVlVuamJ1U3RqbERTOTJiY29JNmZvZDdmNU5GV2JuM3NFVE5v?=
 =?utf-8?B?dVZKRUtvR2VQS1FoTUVOT2J0dXdvL2FtZXZIUHNLQWJONGFUZERLUGxnV3Zk?=
 =?utf-8?B?RHFaV0pkMzRQYzhUeTZiQTk4Mnl6MVdCUnhSZGxJb08xdzRzNHA0KzRwRHZx?=
 =?utf-8?B?dTBZT2lxTnp6b2lMT3A3QkhoK1dzT3IxR0hiOHAxQ094NURnWDE4dndVOEdS?=
 =?utf-8?B?aU1GT3ZIdDF4MVRRTElkaXZ5UHk5UnFOc1ZPUkxsd1BaYlY1RGNOUEFheFNV?=
 =?utf-8?B?bGp6RVFMZGtGd0k5T1lqazNQQ3JSaFJWOEJLU2JnUy96QmUyS2RWSUlCb005?=
 =?utf-8?B?alM0Z09WTWhib0N4dUhTbDJjemhMRWNuZUlQS1hIZWJxZFF0QUJSTFpzVzV6?=
 =?utf-8?B?ODk5bEVzVGpmUlRraVFwZFNGL3RScVJ5eU5XdGppQVA0YjNOTE12c1JZUDgw?=
 =?utf-8?B?dEVZZjI5WTNkdkl2U0R5MURrdmkrMEhIblYwTDJpZmtDeXlZNFdhY3ZxWnZW?=
 =?utf-8?B?Q1JCOEhxeUdMU1lGT1ZBNlVNK2xPMmNQZTZ5Vjk4SXY2N3FFOU5Gci84bGxL?=
 =?utf-8?B?ek5VWE9TQlYvOEFYTk1ONHpwdFppYzNETXZYc0hZZHIrZTdWR0g2aTlQWWlv?=
 =?utf-8?B?T2tHZ1Z3Y1B1NGxZcEJ2QjVaZ3lWMEttNFhvOXdmeFk2dFFTRDBMV1JuVXJW?=
 =?utf-8?B?cUV1aUFUcnVjeFNqaitGWGU5VnBsZzNkSG84dDFxZTZub0EwY0p5ZU9sMmZ6?=
 =?utf-8?B?NjIrcUZLZEg5OU5oNEljMll0NDJDTk5FWkZqMThqYzcrb21EUlRXNG0rWWlU?=
 =?utf-8?B?bmVQOGxyU29jbnpRYldCdGd3cU5YM21vdjU5c2JyVDVXaHNJd1M4THJBOTVI?=
 =?utf-8?B?UnZMN0w3YStMeXFxcHlpVWFQaUlQWXFoYXFCa1lUcTYvNmt0aW0rS0RTUk9m?=
 =?utf-8?B?MWcwaUs4eVlSRGV6VDBRSm9zNzcyODFkRzBmTVd3WFpOdlJrRGhjWDJqUDg0?=
 =?utf-8?B?Y1ArRGNoZDd6Z29WMEFOdU1uS3VNVFRXVTFYT1VwNUVJbTFyQzBOWnhVNVlj?=
 =?utf-8?B?SjVIeEZQL1NKYVNjL2E0VGEyKzRyZURncksza29BR1pjaldYMTdyS0FXS3Zi?=
 =?utf-8?B?ejF6eUpnKzQ2RkdkRjJYQ25UV3RVQ2pPQ2o2SzJoZ1BabXVQdDRBd2h4ZXAr?=
 =?utf-8?B?THlqQTJPRkE5QndNV3N3VThzMTlaQTgrejFOcGdQanM3cmN4U3NpdnBoRkVG?=
 =?utf-8?B?UHhDN0x6RVRLV3NrU20rME1saU9KM0NTY2luOXBPMVZSc2hLK1hjK2VlTmFD?=
 =?utf-8?B?SWNGbk5DWU14bjVPUkw1a1NvZUJ4SXlJdDluUUplSCt1MDJnVW10ZnV0OUd2?=
 =?utf-8?B?ZVJGSENUYko0WHdjdnpaaUU5NlhxVDJLaGRlQlpodUFCZFJJaEVleEFsUEN0?=
 =?utf-8?B?TS9Xd3g4NTVJVnBCelQ5YUVwNlRDRGwwVG5Cb2VYWSszRElTS1JtQ3psbkRa?=
 =?utf-8?B?ajR0RjlMZHhTU1FlQXZ6Nks0UDhXK2xFU0FTK0FUVmJOWHl1bEtIUS9PZk9N?=
 =?utf-8?B?REVBOHFJZFY1d2twK2xNVjlzRm50TFNSWlNGVkFpZ2pKUGZ4UGt1MWhDbmp5?=
 =?utf-8?B?cENHZW0rYS8wVGFkcVZ6RWNNdzFUcXNiVjdtejc0SXIyNmppRUVGVHpYS3M4?=
 =?utf-8?B?NEt4OUJ1aDlvSS9DRGlaZHNObkFsNDA2OHByYkRXNkZzTFJVbzBVMlhKTEtJ?=
 =?utf-8?B?YUkzKzJSSVdoWlIxQi9NeWFGeTV4aWpmYjN1TDdZY1RBTlBkS2x1U1Avb0ZZ?=
 =?utf-8?B?R053c05iQitVNVhWc214eTVvR2NQeDZEQy81SWlQVVpjNURIYkVJT29aZ052?=
 =?utf-8?B?T0FxVXpTbENoWk1SQUcvU0g5cVgwUjEzbEo0VXVaQ25BakR2MnhDakpodUFr?=
 =?utf-8?B?MzJrWGxKOVBWQ1hQVDlIWHNZbmdMMGVtVmtta0JRMnJBUkxzbjRJZjBPdFR3?=
 =?utf-8?B?WnQ3c0pZVW5DeGtKU0syQlM1ai9zTEM4SzNjY2tRdWtYdVFWdXhiZHVHb1NW?=
 =?utf-8?B?amhEVTNMV3FiUVdpUy9nekl4cWVJOVp3NmJwY1V6TEx5YUVCYkh0K0tXY25t?=
 =?utf-8?Q?98VKzsb8NN4tAHzOLfDRtMpJq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4479a5-22c8-4d90-fbe2-08da6959049e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 07:33:47.6255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FBvETTPFNnFie9cAcYQpGtUbaQyCJULoMA/KeV80VcMdrcHCFEzpRun/NwJCgBQhjSYT6MIVgQhSVW5YT7lxmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6016
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBG
cmlkYXksIEp1bHkgMSwgMjAyMiA5OjE3IFBNDQo+IA0KPiBAQCAtMjI1LDYgKzIyNSw5IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBwaV9jbGVhcl9zbihzdHJ1Y3QgcGlfZGVzYyAqcGlfZGVzYykNCj4g
DQo+ICAvKg0KPiAgICogSW50ZXJydXB0aW9uLWluZm9ybWF0aW9uIGZvcm1hdA0KPiArICoNCj4g
KyAqIE5vdGUgSU5UUl9JTkZPX05NSV9VTkJMT0NLRURfQllfSVJFVCBpcyBhbHNvIHVzZWQgd2l0
aCBFeGl0DQo+IFF1YWxpZmljYXRpb24NCj4gKyAqIGZpZWxkIHVuZGVyIHNvbWUgY2lyY3Vtc3Rh
bmNlcy4NCj4gICAqLw0KPiAgI2RlZmluZSBJTlRSX0lORk9fVkVDVE9SX01BU0sgICAgICAgICAg
IDB4ZmYgICAgICAgICAgICAvKiA3OjAgKi8NCj4gICNkZWZpbmUgSU5UUl9JTkZPX0lOVFJfVFlQ
RV9NQVNLICAgICAgICAweDcwMCAgICAgICAgICAgLyogMTA6OCAqLw0KDQpPdmVyYWxsIHRoaXMg
aXMgZ29vZC4gQnV0IEkgd29uZGVyIHdoZXRoZXIgdGhlIHJlYWRhYmlsaXR5IGlzIHNsaWdodGx5
IGJldHRlcg0KYnkgZGVmaW5pbmcgYSBkZWRpY2F0ZSBmbGFnIGJpdCBmb3IgZXhpdCBxdWFsaWZp
Y2F0aW9uIHdpdGggYSBjbGVhciBjb21tZW50DQpvbiB3aGljaCBldmVudHMgaXQgbWFrZXMgc2Vu
c2UgdG8uLi4NCg==

