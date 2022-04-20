Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC83508107
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 08:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308833.524668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3jp-0005v1-Kl; Wed, 20 Apr 2022 06:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308833.524668; Wed, 20 Apr 2022 06:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3jp-0005sU-Gj; Wed, 20 Apr 2022 06:22:53 +0000
Received: by outflank-mailman (input) for mailman id 308833;
 Wed, 20 Apr 2022 06:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWYm=U6=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nh3jn-0005Ls-DT
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 06:22:51 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b5be7b4-c072-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 08:22:48 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:22:46 -0700
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2022 23:22:46 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 23:22:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Apr 2022 23:22:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Apr 2022 23:22:45 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3500.namprd11.prod.outlook.com (2603:10b6:5:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 06:22:42 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 06:22:42 +0000
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
X-Inumbo-ID: 4b5be7b4-c072-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650435768; x=1681971768;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i6tJ708GVSj0+gSZc2TeKfsPoF1n6uzLCmI3y/n+rNU=;
  b=jVoko/QuB0TMoE1WYzlVl2sBqwzhgyrxgzDckbOllcRS6ifF0wZM8nGK
   Nx+E6KlYrVQpGkxD/GJwgdYn939OlbovmXOyN+ApEsnqgzyLRY6Ktz+Km
   pY7rySuGCUI7UavLREFJu7s7nhjBayn7bpZT4jNIOCxtySSCIv2YnJ0uP
   Yf6uBPZADShdNZF2ldf0tyQpukPiUA4hKjoIzGz35VUH+lvjgMTNK1nqm
   CFm8K04XCIbrQc3QvmyEhua+wYsAeVi+zHx2P2rdXyFdeCBCI/yBV7SMA
   39rLwPSYPhqm1KK+b8fZwB8zMakz1ZRJb6vEncequqyIgfhw6Td4Fi+tD
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="251258233"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="251258233"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="804935255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnzjhNO9kVhLPEWMcQ6cB+Lc93BmB9WxXuECj2uM6Hk+NAFltqapGRVlKH0VxOiljAtAqfFusritS9/Y+WjwDSNBzTwm6Vpa7dZPbbXWAjVV5avmIUfvLSdzDv2L4Ecih+LV/QrKp4wxZnme2KoekQo4afq6FcTLUA0nY96FNAsedxw5wFmqef/NQ5EPO1UZHVaFNDsKHG8MGPEWDBdea/XgmHqffC+r2UFNaqZRObr+FKi4r/CCTT3k8QJd0E1bCml6nHlCXYJEm/MHGygExUDYKFT/33BTpgz7mJXHgauqZTMIB/roe8g3Ta9XTSQdRSIjPo6/guFrB+QrhbVAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6tJ708GVSj0+gSZc2TeKfsPoF1n6uzLCmI3y/n+rNU=;
 b=Th+pxJwgPrYsQRFm/auU8gljafu8+xMkoiy8w6S6uwng/0bTmcXrGX6j624XttAfYYWlaG8tPxi9AWkD6sEfHryA6c+GFusur5zdxIYprUgR4mcIwQejjynviYVRx4PA8WdPsZ2Npb7wdu4siQc6bx0H5XxGhtf5fgvgZNZzIkAoHkD/+5RC8CUfeAl0Ul1EO8QVdGDIBj03urJ2KEBxmpwlaBSAjscgN7xvd9cwv2xp1QxJdPgSVn/w5PRSm4ha2v78KrFhKMlTyiXijrfUfQVwwkImdNocKz9c0XPDua4To0jNwXHAa75WMU3RXf7oM10eCAPmLb631znahE7sDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Thread-Topic: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Thread-Index: AQHYTYeTB5xLKnU08E+muTG4n+sN9qz4W6FQ
Date: Wed, 20 Apr 2022 06:22:42 +0000
Message-ID: <BN9PR11MB5276E8449FF75BE461E7148B8CF59@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
In-Reply-To: <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fb00e29-5015-4f99-4a7a-08da22962d4b
x-ms-traffictypediagnostic: DM6PR11MB3500:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3500F66606A1476F6B407FE38CF59@DM6PR11MB3500.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3HLQFA4/K8mllLGTtcAbGVNKPCIEO1iTdaPq5zlwbUTXsU7l8BLkY7aW5lFJrclNwi4O1q/F22QK7paC4rVRg8ABrOsf7tihHTmR3KkvXgNvKSfy7rQ2cDjZu6q9A5YtT9vwLASw9BkO/SuGx231zGjdAmbIv5BkGhz8q70IqR5dNb48LsNUrfgmzKJ6cgmG2AMtfxh8ENx5gsPQUpO4bmpkTm8wYQgrfqJzPwEndWyR5UUhH+b15NRqN2qEPJtC6EVZ5GHNKmfrdxiMkMUQys0pSqc/MJEbrdf4m6qz6ZJ/Wvku9/amTn8+XYD1lEmBOyNyXE3IgspqxsJt3fkBCDlMKgMxPBZ7DW98Qs5jL4WDVkpIfNxAJo4riCcrbbKFjTe1DIEzihCi8qETNSZmXQBS9rfDS5WbQL1H4WiK9vdnenPLENWU5bAWW95eAD1wzGy8Q22qtMXL2cQOrLdq2h1NxXYwxxeKsBlagsChwJnJaFqq6+0f09fG1qeHSn6NQG7b8q15Mid8GDp8L+3Ugy09mS2QkHRecXoPcEADND0R1261L7iJX2lUc9ou/6vbIKgysV+BBrdVgpIeFtL/TjI4bkA3WNj7EZHrIZJMBSRAp1AQMbepXX0DcWYPXgbiw8AyhGLxNwDJnueDVjD6zanLrRIUzjvfpQwvYCU8mwARipMMRVCHRAa4elH6l7GI/O2AHFRofFKQwfWVCTYZtA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(83380400001)(54906003)(2906002)(5660300002)(8936002)(52536014)(4744005)(122000001)(38100700002)(33656002)(38070700005)(7696005)(9686003)(4326008)(8676002)(508600001)(6506007)(76116006)(66946007)(86362001)(64756008)(66446008)(66556008)(26005)(66476007)(110136005)(82960400001)(55016003)(316002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVV6eFQwenlXVEtYNGFIT2ViRlpKMEU2Q0NRWmZ1UkhqeVBUcDN4SENRUXlC?=
 =?utf-8?B?QjNvTGdRL0pzWFpIU0kxYk81WkFpaGxXZ1djTWxiK04rZkszV0tPZ0p1VUkw?=
 =?utf-8?B?aklYU1BHZ0h1TDFVNUxRb0h0WDRrVWQvTHpoa1V0NHBGcERyV01JUExXbm5v?=
 =?utf-8?B?NlkzdEkxdUJCNW1mbDQ2dUJ5eVRpWmZ5SzNycndDaWhXd2h5TndKa0VreUhk?=
 =?utf-8?B?WjZnZi9sYTdQa3ZYZlVRb21jZ3ZTcXZUSGpHVUhtS003YmdzSit4bjNkTTRO?=
 =?utf-8?B?ck5uY29aOWR0dkpieWk1WkJCL2ZwTWJJbzRFVk5JOVNNb1J1K2lLVmFZNWov?=
 =?utf-8?B?TXZCcnlrbVR3N0Y2TXZLaEk0d3VQSU9lL1dRUURTOGNqcDFoM0xRKytpUEdO?=
 =?utf-8?B?T0dvS2lnNld3bmdhbWdZVEdxa3ZWYjRLbXJkRkhUNTlsWEVNbXk4T1RqR0V6?=
 =?utf-8?B?V2kwTTlsRkJzTE50a1BvU2YydllGcFdCalJrdFZCckp5ckNXdFpJOE9NWXVu?=
 =?utf-8?B?eUVaVUdsT0lDVTJTZWZSNnpDSXBvRGpyU1JSRXdTRGxxU0ZnUGtvQmcweTR3?=
 =?utf-8?B?eTJTR1ZhWUUzUUNKeVhZeXJzaXlXbGhPNnF6dWo5cWoyTEJ6U21lQXJjY0VF?=
 =?utf-8?B?VGFQREE1R0xObzhNdTdjRGU2TkJoK0t5ckJrM3JjeHpFOUFVLzA2NjFucW5V?=
 =?utf-8?B?b2JmYXFSdFp0L09QRW5qSkFFMEt2aFVacFIwaEZVNmVyazU1R1pqWWFCQWNx?=
 =?utf-8?B?eUJxS3VzRFJOVU5ZaWJveHRIZmpMK3RvZXNpWVdBL1VwcWo4WXk2NjhBMGJU?=
 =?utf-8?B?cUo1MVNSS2N4cko4RVRNSUdPVXFLcEZ4NDk0eGU1djFRckVLRDdSTWZjaXdC?=
 =?utf-8?B?QzU1ZTUzaGhUdlJzSGtJM3JsWFVSQTlkckcweHFJTzMyR25WckhuL1Q3QnFp?=
 =?utf-8?B?bW85OTd2bFk3aGpXZVh5S3JvRWNFTVdWMzFCcHg4ZDJuWitPMGFDeFVIMWVl?=
 =?utf-8?B?aEN6SjVzd3dPckN5MS9sZ0paaUo2UXBuWGNwMGRUUHFaYVJCanNtV0lzbUha?=
 =?utf-8?B?VFg4SHBCU0VSZUo0T3VkdERZZUF6SEY4czFuUit6VThZbjNvMU44TG9CT0Jh?=
 =?utf-8?B?NmtYbFJpWGhLWEJPcXo4YmdNNVJrb1l2ck1oTmRVM3VTTWlTQkpHM0Yvb1hI?=
 =?utf-8?B?YXhoWitMZ0VSb1hVL0xTVWVwT3NOb3hwdWpCYytpZS9UWVRXN01SWm01eGIx?=
 =?utf-8?B?TmcxQXdNOXBSWVViK2o4S2l1RkwwbDkyazhEWHZLQjVpWWk0bFlrdDAxeFJt?=
 =?utf-8?B?UE1GK2dnc0NWb0tlOXlWakd0TTUrNWo2eHA4SWtjVDVKS3JjOVpodkZjU3RM?=
 =?utf-8?B?d0YvanlnM2pkbTluV3E5YXdsRnFBWWNlb0F6NUJQY3B1a2k2SFYxd3RaaUVB?=
 =?utf-8?B?aHpwK0dFMk5nRi9WYmVqdUFsQ0lVK3ZiVXE3d2c3Mjd6RTVDVS9GVW9SSWEy?=
 =?utf-8?B?SklZM1l5Z0k1ZnVFbExZQ3drYWJmNXZkV1BhYnp2RGl3VXF3RE9iSUNtMVV2?=
 =?utf-8?B?K0FZVWc3ZnF1TlE3aytoSGM2S1ZSNStlT2ZTelJsYUtncE1lVkY1NndjQnpP?=
 =?utf-8?B?eVp3clNIUDlJNForNnJlZkgrVXh3L3QrVzk0RlB2U1p1bjVZQUxkb2lpSWhX?=
 =?utf-8?B?MmRQeS9ua2VXRFloL1FWSlZRSXVIcDZicVFCQXBVU2IwMDM2MFBDOGF5Y2Y0?=
 =?utf-8?B?UnNlKzVKendlVEpRVGpXb1hmSW8velFGZWNzN2cwWWJuWjFSNTlHZENSMmE3?=
 =?utf-8?B?bGhsRXp5aHg0YXg0cWNER2tYTlNKNGpoOUczdnpnNXN4bEpHNWxiSDRHTTNO?=
 =?utf-8?B?Q3hqWlpPU2NEM1pwRFhLT3FNZGE5N0VyaXVHTDV0Ui9UZ3pzelBUVUx6RHJ5?=
 =?utf-8?B?T3hxb1Y5cVFmRmlVUUZLdXpaRDltdUxOblhDR2h2dStHVGhtZGdjRk1PQzVM?=
 =?utf-8?B?bHdjSVYwN0lYQ00rVGs4NkJyYkNOZU44Y0o3c0dMcXhSczB1MVdWUkl4Sk1w?=
 =?utf-8?B?NEQzZmRHNzJGMXpmaDBUNFhUUEwxNFpVcENOOVJJb0htOG5YZU5OMHIrdWpq?=
 =?utf-8?B?eWR0WFQxcFd5RjVKYkF4eWdvOFp5dkVDeXVxS0VTcjU0SzNVWldpdVRzRTZB?=
 =?utf-8?B?c0VCTHAxVnBJZm9wV3h2dVU4M2tPelVDZ2lPdzdtZ2JWUHYvckRDYTF3TmM4?=
 =?utf-8?B?TUl6OFlRQWR0MklTWitlUEY1WEU0K2tiOVhDcHk3ekNPQncrTENoQXBCQ1N6?=
 =?utf-8?B?aUpVTjVBYldHSHdtZHJubkc3V0habVkxeGE5R214VmpCUGJtWFl0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb00e29-5015-4f99-4a7a-08da22962d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 06:22:42.5430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cARzXvizHQnqKbhHFwrm+gG08e0qcbZj2gljpOmeIkEBBVqrVNhX5XIpbA9KvKDxrh6F/RbBA2FJ1vP53Bdw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3500
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMTEsIDIwMjIgNTozNiBQTQ0KPiANCj4gUHJpb3IgZXh0ZW5zaW9uIG9mIHRoZXNlIGZ1
bmN0aW9ucyB0byBlbmFibGUgcGVyLWRldmljZSBxdWFyYW50aW5lIHBhZ2UNCj4gdGFibGVzIGFs
cmVhZHkgZGlkbid0IGFkZCBtb3JlIGxvY2tpbmcgdGhlcmUsIGJ1dCBtZXJlbHkgbGVmdCBpbiBw
bGFjZQ0KPiB3aGF0IGhhZCBiZWVuIHRoZXJlIGJlZm9yZS4gQnV0IHJlYWxseSBsb2NraW5nIGlz
IHVubmVjZXNzYXJ5IGhlcmU6DQo+IFdlJ3JlIHJ1bm5pbmcgd2l0aCBwY2lkZXZzX2xvY2sgaGVs
ZCAoaS5lLiBtdWx0aXBsZSBpbnZvY2F0aW9ucyBvZiB0aGUNCj4gc2FtZSBmdW5jdGlvbiBbb3Ig
dGhlaXIgdGVhcmRvd24gZXF1aXZhbGVudHNdIGFyZSBpbXBvc3NpYmxlLCBhbmQgaGVuY2UNCj4g
dGhlcmUgYXJlIG5vICJsb2NhbCIgcmFjZXMpLCB3aGlsZSBhbGwgY29uc3VtaW5nIG9mIHRoZSBk
YXRhIGJlaW5nDQo+IHBvcHVsYXRlZCBoZXJlIGNhbid0IHJhY2UgYW55d2F5IGR1ZSB0byBoYXBw
ZW5pbmcgc2VxdWVudGlhbGx5DQo+IGFmdGVyd2FyZHMuIFNlZSBhbHNvIHRoZSBjb21tZW50IGlu
IHN0cnVjdCBhcmNoX3BjaV9kZXYuDQoNCkJldHRlciBhZGQgc29tZSBleHBsYW5hdGlvbiAoYXMg
eW91IGV4cGxhaW5lZCBpbiBvdGhlciByZXBsaWVzKQ0Kd2h5IGFib3ZlIHJhdGlvbmFsZSBhcm91
bmQgcGNpZGV2c19sb2NrIGxlYWRzIHRvIHRoZSBkcm9wIG9mDQphIGRpZmZlcmVudCBsb2NrICht
YXBwaW5nX2xvY2spLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IA0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+DQo=

