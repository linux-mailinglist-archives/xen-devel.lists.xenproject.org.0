Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029FD732475
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 03:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549974.858816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9xy8-00079C-K7; Fri, 16 Jun 2023 01:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549974.858816; Fri, 16 Jun 2023 01:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9xy8-00077W-HJ; Fri, 16 Jun 2023 01:09:40 +0000
Received: by outflank-mailman (input) for mailman id 549974;
 Fri, 16 Jun 2023 01:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Va/Q=CE=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1q9xy6-00077Q-7f
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 01:09:38 +0000
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7407d617-0be2-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 03:09:35 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 18:09:32 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 15 Jun 2023 18:09:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 18:09:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 18:09:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 18:09:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 18:09:30 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 01:09:29 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4f05:6b0b:dbc8:abbb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4f05:6b0b:dbc8:abbb%7]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 01:09:29 +0000
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
X-Inumbo-ID: 7407d617-0be2-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686877775; x=1718413775;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LxGP2GWzJRVmTxcnM6mofTmNwNDqLU+VDC0evC6/D94=;
  b=BDq9ZGGuaGdF3WOX5dHQaLrh1R1CFIPqqFw6y8TSXbLe/BX+kyCMeUQW
   gPZgQ3n3nZDtdax0wLwbR2PuZ7fn/ZrpbwPXomTYPtcb5VG+vNkJzZH/n
   HkIfwuJqW/MpBidFjBGF69bGzIojp72GiCCDNZlcnq/5sb+btmpwlBs9R
   RjsidlbGuUyxbky3t+fQfQRa7Yd/M93WgDHdC9KHcKgXv15HUZw9Iln8y
   YatC8BKLnDunSSbkgeQ4aGAzC7UAeXzRy4qWXcXiwdv1lfc+KtoHhWZXc
   F4XkZ0oQ6NWM0X6/87H4wxoGIA3cUobKJ14UVUWrZH/ghm3hYVaZMIXF4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359085247"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="359085247"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742453117"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="742453117"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmF5uMiR1di6V7Kwobf96dw0/7VNo1jNi3W8Y72UWDHoFw9N822tse4WScUfJ942g/Rmj5VjN28AndSzwxLLZ0FWIVF0gKLVELG1sAYnxEwdg8+IXJRWhaQyTtqNFPNIAYkVdwO0mXWwQac/2Ip4SEbf9obnrMBRHV6gziMk/DXzDdKPlIq41RHVyrT92xRXpmFJUKSz2hGlRQveL4WM2bu/IJA4gIsFbYTdZw0MC6M+y+acDzAY1Wll48HH98kIKEI8Fm8M+0Uxbm50i9zb4xMnQPSdDha8wFkh8yhEXLdh5bPkDU+OtWT5HVLhUvi1SJVtxMRgP0a1zsMsppvQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxGP2GWzJRVmTxcnM6mofTmNwNDqLU+VDC0evC6/D94=;
 b=oQgn+p4XwwdXnOYlKtqHTKvxTRJ+PAmxfgEx69in5gS0JA6kUXrNrg0nfMToeU3cOTXOsSpJ7tEuwuYAS0x4VDJGBx8ou7wSLo7vWV8cstInQglrTnfaptsXTvoC+cda20Xc0ez2d5Cj32SZ9Yf6KhRVO67BITOc+oAa9rX4ctlSICEI6y4Q0UEKOFDK1ADMDdK6Fn8nBZwyFxJ+45xmBj706nL9Mz3x04M7K2xxbkt+0/syjtAPWCXYBx+fExKOo5RVcuobxijK9rJ0PStAw5emIGRTwOzF5GK/TpSls7+ZD+sJPjqM3eWIrpYvkeZMAOy9Pfqn95yKx5X76/MUkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3] iommu/vtd: fix address translation for leaf entries
Thread-Topic: [PATCH v3] iommu/vtd: fix address translation for leaf entries
Thread-Index: AQHZjuA2oVnv7WacykC43mswHahgOK+MwIiw
Date: Fri, 16 Jun 2023 01:09:29 +0000
Message-ID: <BN9PR11MB52764DFD139794204087356C8C58A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230525080859.29859-1-roger.pau@citrix.com>
In-Reply-To: <20230525080859.29859-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB7580:EE_
x-ms-office365-filtering-correlation-id: 117bfb58-19d3-4041-3bc7-08db6e0655cb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yR1XHOPFSqDntfUL4Chn8I28pJCvhiCaycwmsUoGwfWWcb4vta3rgDWH+/0bxOZyyBHUPHT+vAwZftmmt/ceWV8bHywbhVykEjSiJX/fvTpqGk7+5+HyEFmMgrPq3n4JCFSSSLfpyhIeSc38x/WwWSNWbJt9Kf1ZctzeZcZW/fMmIHwvYRAGQZeq1FTZ33j0r5p6+5HTRe+522QdM8NIX+wVAEXM3FvOm1VUlVXnDHtPU+0XGsD/L9Lei4JIM/W4Ki6rMNy7R/1DgxnfpLYrVDEA2cvxNV8ogfaf/O7S0Jy6mrcNqqpjz4EucRhGwHr8+AuCc8Lvet/rMyMYWD9tSrqVj8w8SpjGL6sWPXM1/+5KAzYRjo4sHUVcp2UbgGHU9DOFrWFMwKPF8Q8Vx/iB9yCpgWQz47Qrw2RmybmvtQv8zY8MtFr4VwPdEbZSWITxsWDeh509LGXFXBwi4SHaTQtVzfT9HOPfBGKSnq3eqvqV4Y3VovNtuQs3AuWu1gGw6sRauOLrEspJvDRIfXO7gTAMcN9NqOxbGioDVzH4qOD1dRLjk/gx51YDqiK0RkrRe2sImy3vkmZYNNfezqWhAVJ1gPeHAypGos3b5dlyM2ubWHWEjyhYyTqExVUqpqVb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(186003)(38070700005)(2906002)(33656002)(38100700002)(4744005)(86362001)(26005)(83380400001)(55016003)(6506007)(9686003)(122000001)(82960400001)(66446008)(4326008)(316002)(71200400001)(66476007)(64756008)(76116006)(66556008)(7696005)(66946007)(478600001)(41300700001)(8676002)(5660300002)(110136005)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW1rTU1MaXpmcE1rZEZub2pvMWx6ZXdRYmdUVXRvWW0zWDJESHZVVUNMTFFl?=
 =?utf-8?B?cXRrUlRKM3I3enZ5dXJrRHVQbGE5ZTk4NVp6NUI0QUY0amRwcDc1ZHFaTmc1?=
 =?utf-8?B?S2RPaUdWaVZ2SUEzM1lubElxdzZjNUowZ1ZjTDA5Zms4alZ1S3JxYWZaSlBC?=
 =?utf-8?B?ZFhrL0FzQWN2UWg3NkNjOXlIVWVRclVyU3pkdXhvd0lpSFVjd3k2UGpDVzVJ?=
 =?utf-8?B?UWcvUnF0WkNoZU9pMHBmMVp5TEQ1RmRaQitvYVNzSTQvWU8rS0NqeWJuZGZJ?=
 =?utf-8?B?ZVlwQ1pvSks0NFhNejFsb1VOZUFYMlFKdFdWRXh1d1FIeVRjYnBoemtmMXd6?=
 =?utf-8?B?ZkJSNUc5eFVDZEtIMVVYU0hIdEdUNXlOVmRFZ3lOMTUzaVJGUnQ3bXdSdXM1?=
 =?utf-8?B?OGQ4bnJiRlBob3Z6SmdzVVhLWkFUeUVwaENPKzdDTEIxWklmU2tCeUJ6OUUw?=
 =?utf-8?B?YU1XZ1hJamlib0lrSXU2K0lBZnd5aDNBZ2JrU20yZW4wOU5ObVo3NURpZS9v?=
 =?utf-8?B?M1I0Z0liVm9zNUovWGpNOUY0Yk1vMDRxL0ZmenI0dU44c1dFdHNWcnI0NTl5?=
 =?utf-8?B?aW1rclB2NFNFY3dsaGZTYmpaQTRHTm9seU54TVQvWnEydmJwZmZFaHZTN0dz?=
 =?utf-8?B?bkkvYXZMUDNaY2daYS94ZGhTcm9JcWNFamY1REMxZGFQdTJRSGVTYVVvSXBl?=
 =?utf-8?B?aUQ2ZlFWY0V5TlFvNlo3SitIVHZubm5saWZkbVNWMFMrVVEvemtOQ3pRRnR0?=
 =?utf-8?B?b1ZGS2FIOFdVbjFVWTVTZXBBbDR5SDJDYlNkc093NnFQbGM0RzhtbjNTOURM?=
 =?utf-8?B?Q2p2dXg5T0JjeXFWTGY3SHJIOGR0RzJwdGMyK0RQZGRwMFFOTzQ2RURNU1Rr?=
 =?utf-8?B?OU0yTnRpVXhmVHV1WFBhNEhpbnpIUzV2cnR6UTZUNmtrUVZBaWZROERhU3BW?=
 =?utf-8?B?RzhhdGxwR3FWalFVVkZoMTRJOXROTThyc2NZNWVqYnptUlFyRGVFNDQ2Qi9Z?=
 =?utf-8?B?NnhsNFF6Y3JFSTlOZVJRcGNBbHZGTzNQRjZMSUpIMDRKTXYxVTZ5TGYrZmV0?=
 =?utf-8?B?cXhyclFRbitLamtRNWo4Y0U5a0ZZRTk5NW85dnM2UFdHZ1Z6aGJrenZyL3FP?=
 =?utf-8?B?eWplVjNUYzAvanIrZURHdm5rZG80eXdOcStXOFV2QnlvcEJwVHVzOEpTS1RK?=
 =?utf-8?B?ZE96OFhaREdwb1ljcXlPUWkrZmxVdHlVVkJoUS82SU50Y2MvdXJIRXVaUERy?=
 =?utf-8?B?ZWtvZlYxSEduNEFxUTNtR3ZNZWt1SG10SHFTalZKcW5XdHhqRnljUEpyb3p2?=
 =?utf-8?B?YnVYVjRPcGJTYnBaQWx6MVVTcGFhdG04cy95UjJPd3MrRlhHTU9uWHpjaFA1?=
 =?utf-8?B?eUJvRE1oWkpTd3lMOHRRVVQ2bllMc2J4RWhMTHd2dHcwWExRTk9sQ3lVQ0Er?=
 =?utf-8?B?OTh0eWZHamhpajJObHRrTHJJMUpzei9ydklrbElYTUEvMWk4MVpZS2lJMVdL?=
 =?utf-8?B?UjFBd1lYVVUvTXRRWmZSSW1LSzd4b1NqSzRFaUxRcDV6ZWJ1QlNYSWZ6UlZ5?=
 =?utf-8?B?TmRKTXNCaHUyNzRjVk9zM3V4WGlwSVpONEFzbkVpNzhxUlNUSDRrVi9nWXdW?=
 =?utf-8?B?QzVTbUFGZXRsWWtYKzhybENzZnhYeTQ5aTNKdEIvN2pmWkorNFpRbU1Kdm11?=
 =?utf-8?B?MG53djBvRnVrZjhWNlNreU4vd3R4L1MzM0p2Uk5xMjNlaEpocEU4bDRIM1cy?=
 =?utf-8?B?NEs0dDhqaEZMRXF6YnhnK3hDQkFEOGNEZ2cvQkpSZ1Q4YjVscnc4MU51cS82?=
 =?utf-8?B?V0JEaUtOMjdaREZ0TnkwVUc3anpDQ2x5UVIxbXRKT2NEeXUxQmI5NUNvYitr?=
 =?utf-8?B?Tm9WcFNMUDQyaTF5aThyZyt2dGZGR3BTZU5hV0tLb09tdUVQUm41WFlocHZ3?=
 =?utf-8?B?V0pWV3JqWXZLR0VUOTlyRFdjejk1azd0YjFJWFYvMEZtN0lzSTY0MGw4T01r?=
 =?utf-8?B?T2taajVwUEc2OWVhNUtLVmRSalNDT0RGYTdKTTdlUDVqU0s3dXlzTnV3MG1Q?=
 =?utf-8?B?U3htMW5oQUtQL2V5QUtWWVdWckFkNWF5cjlEeXJ3VHQzMjlrSkJXL1VKSm5I?=
 =?utf-8?Q?jylS1ztauJH2JJYpcOygb0uch?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117bfb58-19d3-4041-3bc7-08db6e0655cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 01:09:29.0780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWLqaefBQVwqgXbzI5eL2+aHsx5gtdjTJIFxHmal+ypf0BwadVWF9U6H8EHZM+tyX3bRfsDwDtK2OaQCdafHtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgTWF5IDI1LCAyMDIzIDQ6MDkgUE0NCj4gDQo+IEZpeCB0d28gaXNzdWVzIHJlbGF0
ZWQgdG8gbGVhZiBhZGRyZXNzIGxvb2t1cHMgaW4gVlQtZDoNCj4gDQo+ICogV2hlbiB0cmFuc2xh
dGluZyBhbiBhZGRyZXNzIHRoYXQgZmFsbHMgaW5zaWRlIG9mIGEgc3VwZXJwYWdlIGluIHRoZQ0K
PiAgIElPTU1VIHBhZ2UgdGFibGVzIHRoZSBmZXRjaGluZyBvZiB0aGUgUFRFIHZhbHVlIHdhc24n
dCBtYXNraW5nIG9mIHRoZQ0KPiAgIGNvbnRpZ3VvdXMgcmVsYXRlZCBkYXRhLCB3aGljaCBjYXVz
ZWQgdGhlIHJldHVybmVkIGRhdGEgdG8gYmUNCj4gICBjb3JydXB0IGFzIGl0IHdvdWxkIGNvbnRh
aW4gYml0cyB0aGF0IHRoZSBjYWxsZXIgd291bGQgaW50ZXJwcmV0IGFzDQo+ICAgcGFydCBvZiB0
aGUgYWRkcmVzcy4NCj4gDQo+ICogV2hlbiB0aGUgcmVxdWVzdGVkIGxlYWYgYWRkcmVzcyB3YXNu
J3QgbWFwcGVkIGJ5IGEgc3VwZXJwYWdlIHRoZQ0KPiAgIHJldHVybmVkIHZhbHVlIHdvdWxkbid0
IGhhdmUgYW55IG9mIHRoZSBsb3cgMTIgYml0cyBzZXQsIHRodXMgbWlzc2luZw0KPiAgIHRoZSBw
ZXJtaXNzaW9uIGJpdHMgZXhwZWN0ZWQgYnkgdGhlIGNhbGxlci4NCj4gDQo+IFRha2UgdGhlIG9w
cG9ydHVuaXR5IHRvIGFsc28gYWRqdXN0IHRoZSBmdW5jdGlvbiBjb21tZW50IHRvIG5vdGUgdGhh
dA0KPiB3aGVuIHJldHVybmluZyB0aGUgZnVsbCBQVEUgdGhlIGJpdHMgYWJvdmUgUEFERFJfQklU
UyBhcmUgcmVtb3ZlZC4NCj4gDQo+IEZpeGVzOiBjNzFlNTU1MDFhNjEgKCdWVC1kOiBoYXZlIGNh
bGxlcnMgc3BlY2lmeSB0aGUgdGFyZ2V0IGxldmVsIGZvciBwYWdlIHRhYmxlDQo+IHdhbGtzJykN
Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==

