Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B70508108
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308834.524678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3jt-0006CJ-1C; Wed, 20 Apr 2022 06:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308834.524678; Wed, 20 Apr 2022 06:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3js-00069i-Tc; Wed, 20 Apr 2022 06:22:56 +0000
Received: by outflank-mailman (input) for mailman id 308834;
 Wed, 20 Apr 2022 06:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWYm=U6=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nh3jr-0005Ls-JY
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:22:55 +0000
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4efc88fc-c072-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 08:22:54 +0200 (CEST)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:22:52 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2022 23:22:52 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 23:22:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Apr 2022 23:22:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Apr 2022 23:22:51 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3500.namprd11.prod.outlook.com (2603:10b6:5:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:22:48 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 06:22:48 +0000
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
X-Inumbo-ID: 4efc88fc-c072-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650435774; x=1681971774;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=03xnvSEgeZc2kLEIH/lD3I3fUQvE0976IRBRbE2YKPI=;
  b=UjNuOVl5uI0mdFNmTpCNR6R5Kopjcw4bCK55i2epLg5o6Q5NWbKF8nR+
   qLDKOsjc8DUO95MoD4C5WB9a1vWGXXjzlKjBqKhXknBR5IOgPbDBgZsZ+
   VVnrFKh7o6wQY1PLPnw32PLz1uvkP/VaxHBq98hOnyAaW9aITQ+znyV2Y
   9lZLUkwToSUwlI/4rJrkRGymZ/SHqYi2+lXxseSaS60juu8BILL88cB+W
   xemsyf4zE9XVzoIoF+pEcZ2mSq3jdwtfqhXpxcHk7+uK841Rg10pQY3yi
   H5b3qwb8a/RbpwBNMN+GJ9EvnpMm1gx7i7sOgkZZm08C+vjl5UHiD125s
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="264122902"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="264122902"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="555053049"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMEcQ1xs0zWy4Y6fCf08AZzGHKo+UYD2jKCe0AM+0tx38XTZ8GycGnOS/Lml3yRjILryyaJVI5fOgUYj97CsAKrrPbu9D2BV4Za+VlJQne1kgcbUjF9l1MHs6HFV/CuvlPikRh9/gGgJAIFN4UDq/fqdqT+ViWLebMGpIyqao8ovmPd6IYbdlYKgChKXcNHP57S9Uy1pCCnW9tMhPqVy+u5SrCnUF+Jj2Kiu14VYSibKXK3iIDU77ozNiOca9967WnYQIB7LJg9KOiO7YJQ+WSDyI+11p0VkIJ1B/2jkwMNEmZ73FS25LkUgqJJH+9VTu9knhIteCWJT8Hb6XV3+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03xnvSEgeZc2kLEIH/lD3I3fUQvE0976IRBRbE2YKPI=;
 b=mvPTlOoywlI+01R26Ms3qYv6RCXihWG9I3H7UtI4uP40ee8+i9BlwmhLarQCtObaAF6fUENAdZRGn7ZVOUbnzAYdF0ZQM2BCcbIf+DC2YsKx9+hpDL5sHuhsfxoFauJBpr2iIVIyVIGgiTO8HDenUfFNfnAq2uZ8sLkXdYvwMNLMjt/Sr6UYxRt2rQmhxiu5FM6Ywc1HsD8q3ZLv301p1mBXDcbt7WirgipP6LlrO2v+52K0rMfm7bHAKrUf2Xap1YiCN//5++Zc3FY6bgwCW5A6r8OYrr0QG71EhYYEQBGzEJCmCgSbR7fdrXrDIYEysK9Kx6ibOZrKu1cE1igGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH 2/8] VT-d: drop ROOT_ENTRY_NR
Thread-Topic: [PATCH 2/8] VT-d: drop ROOT_ENTRY_NR
Thread-Index: AQHYTYekX5EMpeqzC0Kga/gFrdxJaaz4XMTg
Date: Wed, 20 Apr 2022 06:22:48 +0000
Message-ID: <BN9PR11MB5276E62B24DC42DE517CCBC78CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <ad944163-e8cb-6ecc-7e6f-400f9e8cd4bd@suse.com>
In-Reply-To: <ad944163-e8cb-6ecc-7e6f-400f9e8cd4bd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 361ef8b9-248f-4812-45a1-08da229630f9
x-ms-traffictypediagnostic: DM6PR11MB3500:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB35003F77F57C08A8E287C1018CF59@DM6PR11MB3500.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJUekOWK7eIkksHMdMC6b3Vf5165sL3S5dXy/PgvC/4yD8wGKEoFjqa/iZRfUOu33JtS8TU2KFz+j9boOIV/XXDNqUa4WpsTZ7x4cBBwCdaeRNngKnVBfUdKZq/u+AvwCZhgtzjuTGZx4EbNd9og7sPHP6xk/8K7Le2DSKUxLgVKy3DxvL8jXMEPAqSkDBbHA9pdziTJeA9hQ+GZeiAx90Fh8XQu2Ty2R4DoxvKA0UD1PBwsE8Nk0Ng8UvVXjK1Wxuc572oEQ9hkNLHvRr/YhXcY97vi0Z4W6ZNPNshyuPRWA4btmlZWHoEIYtx30DbWj/0E8neepIV2OPIYvUNt8/6HFbG6d1BChZaq/6WPgumilBi/ZvcGtKSlNHqq6sYpCPvkZ9sDJEFKj/8ZYYKKjdH2hTtNWpoR/Dy6xbTP8cP2rVGLHXrpPheg63JkpRldySM4jm0W7WK8KSyKC0fSenhFgLShOS7vZI/qyMXaZlt2frPJY9R4XiBLdjK7HOEXE+DBLO6bqI2qX9YrudoK/UdjWHnBcBlLrfj3I7SinkYwPssmj9y9ldKiLiA2yhyl/oBLaiq5lRPqJISkAS9hdJ9Mwj+67vDgEFBsVDGYsv92JNAGvXi4SucV8mL51p87ngpnHx/ytlAanbUfR5iTCYd27RyyBeHZ4NU4lzlfrOP9+n5syHp0kXuWDJRSNRj38AeVvdAZPilUpLt9QETGgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(54906003)(2906002)(5660300002)(8936002)(52536014)(4744005)(122000001)(38100700002)(33656002)(38070700005)(7696005)(9686003)(4326008)(8676002)(508600001)(6506007)(76116006)(66946007)(86362001)(64756008)(66446008)(66556008)(26005)(66476007)(110136005)(82960400001)(55016003)(316002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?byszVzBoTHJRSVB5eFJpc0g5cVhmbS83c1NEZGdFeXdVUGdHOStFcXVjUDZa?=
 =?utf-8?B?WUxWOEVDWDQvRm0xekM5cEllQXUybyt4OVU2UTB4T2wvbTc5WEtGSGFabUlF?=
 =?utf-8?B?UWQxaWR5UEw5WEM5ZE9hZXhsYjYwOXFIS1hWZm1tQWpmTm9TbnBFbThVQUpX?=
 =?utf-8?B?S3lNZ3BUZGpyNUk4QU1EUjg1TmpxVTl5dy9VTzJqanNkejNTQ0NPallUaUFu?=
 =?utf-8?B?NCtqVWhtUmVaUE02Znh1TkplL2ZzNUNmVExMOHI2dWFMRlppMU5ZdzVhTU51?=
 =?utf-8?B?b1pYSUxvR0kyVkxkNzlBa3hJM1JKRWFqMmFVWWFiZGhKWFZaWmNHRnRFakpF?=
 =?utf-8?B?bFdORVpnODlqSmRzR2dTdVhyMWU5SEJSR3JON0pyTUpHRzg3a0c2NnVYbENr?=
 =?utf-8?B?MWxSeDl5ODk5MTFzRzZ2a1FtVFdzbkxPUHhZWVhoWFY3WkVXS2pya2lmRVRM?=
 =?utf-8?B?c09NZFR6dEZWSUlJSXJpSGFUczNSOVVaMVd6Qm8wYkI0RXNNem40YnhhWGdZ?=
 =?utf-8?B?NkNIUXpTRGFoZUpXOTdobGN6L21qWEZ4ZnNHRkFUbUtsblRsNWR0QjNQMWpK?=
 =?utf-8?B?T1ZNaTFhMmZZWDlrNjB6RnNXcFBabmtmMC9xdkFmTTdzU3ZJZng0TVU0RHFW?=
 =?utf-8?B?RFZmaGdHRU11SEpaeHM2YVJ4MmxRY21vQlgrWnBkZDZTTCtmd2Y5SjUxeitR?=
 =?utf-8?B?QUdjQU54N0lWRGpBRWlNY3crejg2SjJaTjYrMXdRWjRkZ3ppVzRzT3ZyUUZ5?=
 =?utf-8?B?ZlRsQjVEM0U2VERPSzd0emVlM3hDWFlvVlRlK2N1azdacU1SMTJqWnFyQlFW?=
 =?utf-8?B?dVJ1dXRxQ1RrS2V5L1pTSS9hRVRjUzhpckQzczdwYkJ2ZUNMRzJCdTNhUml1?=
 =?utf-8?B?aGNRSmJURDFOak1mU0xTVS9JWUMvQWxWaDZ6K0U0M2dhdUcxKzFoei9mTFhP?=
 =?utf-8?B?NTJvZksyMkNxNnVMM3ZpRUJLQmtpMGI0Y29OdW5ZeHVMY3NPWk9OR3VtZGFO?=
 =?utf-8?B?WU5MYm5MWnpCR3BhdXpYOC9yM1JzNEE3OXpHblN3SmYxSEpYVnJCeThQN3pM?=
 =?utf-8?B?SHZlOW82cDFLTUdZSEp0Q3FpUFdVMVhTQkFmbFlEZVVWNjI2R2Fqb2d5QlBs?=
 =?utf-8?B?Yk13ZmVURzVMSjE5V1JHUmw2aDRiMFdDdkY1U0FPcGtoLzFLVUxmWkZQTVJD?=
 =?utf-8?B?aXZKbVdjOGdHeTJFakdmVVV4T09KUVJGUVZZYk8wK3NkRVk2VXdMTlFRU01y?=
 =?utf-8?B?WWh2STZicE1HMklkS2xIaktid2pGdURMMjJVSkxPOGMzWG1KWDZHazdiMUxX?=
 =?utf-8?B?bTc5aEtzbE5vcXhJRmtJTkRRWUNZM3MwL1hPVmdSbVYrSW1WV1FPWGUvQzFW?=
 =?utf-8?B?MXpOeURtendpbmhzK3VqU0IvVTF4K3RSbzRNd05CZlV5aWZLL05mRDRSNURm?=
 =?utf-8?B?RHZEdVY2bkRVK1M4NWVsRjlRNGYxYTE0aWloaDRJODZnK01SMUpyK0dCVkYw?=
 =?utf-8?B?NUUvZndzejdmdzJBOW51b0xiaXNiSUdvMmlHTklZU0FrazNJQU4vcW5GbitT?=
 =?utf-8?B?QWJTRllMalpwTmE1alA3c05KcExZbWYzZ0pzR0srSnRQME1tbjJXNDM4U0d2?=
 =?utf-8?B?SHp2N0RXdFkxakd5MmRsa2RhaE1EbFRwTXJvUnp2RnNqaWx4eExFM0ZhY0lS?=
 =?utf-8?B?aUx0UkVRblNuMWVNWWJHV3REZzBFTXJsWVNRbXZJSituMEgvUkthakNxNWpS?=
 =?utf-8?B?NndXRnVibyswRWVpaHY1WTBYYm8wSGRualFDNml4ZHhqS1ArWTRNRmJSTVVx?=
 =?utf-8?B?eld4dkMxbEluNEsydGZkaU1HN3gzNEZQMWhXQkZuTU5QT1hpVkNKdFd2ZDJQ?=
 =?utf-8?B?T1RwNVNxcUwzYzJrKzJVME0vVHlGR0dZMkZLUU1FcFFHbEM5bHlFWFhxN2hh?=
 =?utf-8?B?QzZla3VWZGVNblltWEtpS3ZyRkFrakJLNWl3VFdMc1EvZHcwLzJJN0NZK2xG?=
 =?utf-8?B?NHh0WTk0MUhqZEl0c0hpSzlVVVd6ck9MQlhPVHpXazJEcTFqVEk1WnRKV1pl?=
 =?utf-8?B?ZXp6QXlxOWM2YTV2bzZMdHhLK0tjK3RaRlBveXhiRjF6ZXVHRnJwc2FhZytk?=
 =?utf-8?B?Q2ZNc3JtRGxsNlZMWHdMK3pxUGp0M1RxN3dGcWRxc0ZBTFo1ODhBOHNlZ1Fy?=
 =?utf-8?B?M3NWejJYZTMvQkVYbGlWM05uZTc5cENINEdOd1lTNEVMNy9WZzJoUDVwYTNR?=
 =?utf-8?B?Skc4S2F2bVFSNTlwemdvbUowUEswdDl0WlJIMUtNOTJHaElOY1VPaFpCZTFJ?=
 =?utf-8?B?TlVxR1YyMFozeXI4ZHJjdm5yYWZHMHQzN056STJlWEh4OGtwYzMyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361ef8b9-248f-4812-45a1-08da229630f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 06:22:48.7021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMJgW3AAqm0pRo/SHcngZKWqmUX0TckQFohZU5NIlRf11RHrld1HwFm5QiNKDfa+KjTGa1p88P39uBFyzjDsNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3500
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMTEsIDIwMjIgNTozNiBQTQ0KPiANCj4gSXQncyBub3Qgb25seSBtaXNwbGFjZWQsIGJ1
dCBlbnRpcmVseSB1bnVzZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11
LmgNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmgNCj4gQEAgLTIw
NCw3ICsyMDQsNiBAQCBzdHJ1Y3QgY29udGV4dF9lbnRyeSB7DQo+ICAgICAgICAgIF9fdWludDEy
OF90IGZ1bGw7DQo+ICAgICAgfTsNCj4gIH07DQo+IC0jZGVmaW5lIFJPT1RfRU5UUllfTlIgKFBB
R0VfU0laRV80Sy9zaXplb2Yoc3RydWN0IHJvb3RfZW50cnkpKQ0KPiAgI2RlZmluZSBjb250ZXh0
X3ByZXNlbnQoYykgKChjKS5sbyAmIDEpDQo+ICAjZGVmaW5lIGNvbnRleHRfZmF1bHRfZGlzYWJs
ZShjKSAoKChjKS5sbyA+PiAxKSAmIDEpDQo+ICAjZGVmaW5lIGNvbnRleHRfdHJhbnNsYXRpb25f
dHlwZShjKSAoKChjKS5sbyA+PiAyKSAmIDMpDQoNCg==

