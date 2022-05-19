Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE9752D6CA
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 17:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333092.556878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhh6-0002zX-G4; Thu, 19 May 2022 15:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333092.556878; Thu, 19 May 2022 15:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhh6-0002wI-BP; Thu, 19 May 2022 15:04:04 +0000
Received: by outflank-mailman (input) for mailman id 333092;
 Thu, 19 May 2022 15:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q20b=V3=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nrhh5-0002wC-Cl
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 15:04:03 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8eeaa2c-d784-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 17:04:00 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 08:03:57 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 19 May 2022 08:03:57 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 08:03:57 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 08:03:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 08:03:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 08:03:56 -0700
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 15:03:54 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::181f:ef86:8705:bd1f]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::181f:ef86:8705:bd1f%7]) with mapi id 15.20.5250.018; Thu, 19 May 2022
 15:03:54 +0000
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
X-Inumbo-ID: e8eeaa2c-d784-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652972640; x=1684508640;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dy47+LCe1rnw9Uz4ogMSHAsTEseQzSt/iaei8La9KAg=;
  b=gdWAGZFAphQOOpwcPVJFcoH2L1wt8h1fviL+aqaccyzS9oaZSiYcsMRF
   IBJIuwRKMl47KelfDlOim0gnGhH2povYTkdIxQIXV8jCW7sifEWYU0+dp
   xGY133hQV4kTBq4zr0NNOICy4r9tQ8pmJQLVADicLPwNuis3dOTBTWPcf
   ZmJrSG8HpdBQr+hRNUKiiSDk8dIIYf3S7Qaxh5fwwhGo/s7Fc5TxKWJSD
   tb8ufxgmxBj9kqLOU4Wi2giYh3Q3yFdYOqe/RaWN063IuezGTi8empRxP
   rSmyhTcjzkakcoRYmfSi/Lof1V6XBnjP5Mihgs7N0xb2rpFLpogQsyyf7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="259813643"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="259813643"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="598614765"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxoQ7KNEiNwj/KOcMCqfn29fgsmy8qL3vMZiLTPC2z/2LJ1zU+V682gyQdhqVcRdpDjr/hUarKAien1/u3JIkZPX6ez2qtTj+xVw1V1bLn1pFeVNdquaSFql8C0wCZiCCpYiP9MornTnNm18IK6E4MdAI8btHMYiIxukTPJy5C+EKaA+p6H7yYGYFJcNVhCsPBseSkEk4F6xwUGeVMIPqAqj2CWvC8ibwFbVqjqGePk03+xtHv0Xg+2aISemj5kbXeG0nuHFOnLiyBwrP0afHE0dUXCswDYbaWkTnn9/66yQ6qigcHPQuxIMsYpOPNTdlhi8DpzbBpYvNOq/HOz34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy47+LCe1rnw9Uz4ogMSHAsTEseQzSt/iaei8La9KAg=;
 b=T94ZTM2s2e9iawjsS2B9prLk8ANTkBpRz85mvRPo6q1IIyHYXkqyCsjucNpifLM514xkkh1IaBQZ3HuaVLk6ngEmJ8/WSDEzNJkvA5VyUzz8el8f3QQ18pLldQccec6VFFtI+1dxFrphA3T4Ohwp1mAzF98CqTEtkQmlqgHetS/gsvInsK5fCdBv4F6Ev/zPAnN1haO/FyUeu4t/tx5b5lIIx93Qfni9RypADfkJzG8l01ztqjo9cI7KhtA+vOT5l99nQ+SfaGxX4C2UqaNSqrC5gAiP4d5k8rGfn5HLZpN19/IJikCS5UBznhR9kt2ecoB6jkTGxSxdxzNgCMK5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Lengyel, Tamas" <tamas.lengyel@intel.com>
To: "Gross, Jurgen" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>
Subject: RE: [PATCH] tools/libs/ctrl: add and export xc_memory_op
Thread-Topic: [PATCH] tools/libs/ctrl: add and export xc_memory_op
Thread-Index: AQHYa4RIF+g6mxBRRU+cd4s+ndSX+a0mMskAgAAGnRCAAAm+AIAACMUQ
Date: Thu, 19 May 2022 15:03:54 +0000
Message-ID: <CY4PR11MB0056617E5CAE8C5FBF4785B1FBD09@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>
 <9b3c46f8-737b-b145-4abf-a08b34d4e932@suse.com>
 <CY4PR11MB0056943EA3C905629887A4E3FBD09@CY4PR11MB0056.namprd11.prod.outlook.com>
 <403a66db-143a-7d05-1d0f-5a7d30721e34@suse.com>
In-Reply-To: <403a66db-143a-7d05-1d0f-5a7d30721e34@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b75e142-636a-4d12-1e67-08da39a8cae5
x-ms-traffictypediagnostic: CO1PR11MB4836:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB48363797E68E21661D18C0F8FBD09@CO1PR11MB4836.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +d10NtUw438Ryvtxp5pzhq5jJB6igGd5BgxqyqGy318cUvcqoooM9aeXUjIp7qCjJfvKzP/zO3pmADS7Fu3+jrXophA9po8GgQVaG9zDzW6RZIcgGCfM2yeETdkeZgwah8+FomgZvnrf/kH6xv1opyPVlXgyRwJF6VWRYbXQwh2shytzT8fLMzF4OYxJc/kLeuYx5UIa776rZBd8HIxCdBPAs8nTSFWvlyH1uU3kPF6W/63fUqx53yJ6df0dfnFjgwr/Xu+GSaelKBIsM+ZnOl9/ys6I2XBuSxq+luJXNDh6KXMkcjS+t4cfd/E8oqoPioIwkwh1yIESjhpwLEd57SZh3EZagLJn7WMH7VJG7fKHmZm9+nfv29Sk1emtP4r3QYN6euuCqd4DrflDh7ru8HATzueEPfSAxLBo1PdL01LvE+x6ZKXhNT8LIpXtTdhuOMMXSK4I71lhdBjKbMzfapT10wAaRrOg3OgjmqC4YL1X/5P4OEKoscAjDVRQz+gBx8zOzFJyw5wEV+c9/0gyVfpi2EGj+uyFtKj49Nou4yFulu4aWCZftQ1/tpZWEySK3T1gWeYD04zeYgWH05CczYgGogc54gox0rKKj9yt//ond8f7rYvC+0kSYYHNULqGb5mVNuTiBf8UA9EGmWpmZLd0Ho/rE1X7iUExpEIpGnG362s2qjTiOM5wPOLq4mzgRZOLnKXGcprIzvvohJbUfg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0056.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(86362001)(8936002)(5660300002)(54906003)(66556008)(55016003)(66446008)(76116006)(66946007)(52536014)(110136005)(186003)(4326008)(508600001)(64756008)(33656002)(66476007)(316002)(53546011)(38100700002)(38070700005)(122000001)(8676002)(2906002)(7696005)(82960400001)(71200400001)(6506007)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXlwSHExVlNiTXN5SXlnTElhY3dueVBieW0ra29KbkVUaFF6WlE5TEpVMFlm?=
 =?utf-8?B?aUd1RjRHREJ4anYvZ242TmRlYmJSK1BqZlBabWw0Y2w1NGV4SS8xR0lERlRJ?=
 =?utf-8?B?cXdZUWR2ZWw5SmRKU2s0SDlQdVIyZnFxdkUwa0ZIWW0rSzNpR05abDlvZTF0?=
 =?utf-8?B?SmJnZjhVYitGK0xiVmh2MjRsQVE3TFlwV2pSSlZHSk1Sc2l6QlJ5MEFrS0k4?=
 =?utf-8?B?UTBDZzVkblVZOTdDeS9Jai9yNWI1a1l5bWlGUWExSTI2cFV3WHlJcWplcHk1?=
 =?utf-8?B?WmNDb3d2NG8zMHdjOW9wQktEYnlzOEJ0MEd5djJMM3owTnBqUG95cVdjV2dK?=
 =?utf-8?B?SE1peC9OZ0paNTU4Z2xOb1dweDc4MUhEVDlxUXBXQWdKMVFCY2tkanRpNUt2?=
 =?utf-8?B?SVRDa3VEVFNvRzJZUlM0NUR0anZkeTY5dFYxUi9rc0JmclVaR0tJYUJFVVpv?=
 =?utf-8?B?WGE1K3F4M2dPZDBManV0alR3cm9yMm1tUXNCWlFPRDVBWlhyK2swUEtRcnpj?=
 =?utf-8?B?NWZHSEFGL0l0c2JZNW52VFZPRTRXUDdqcVUwV1ZOQUVmYmZSSHFZbng3bmFR?=
 =?utf-8?B?MnJzUVZ2UGlvWTl5UE1SN1ZuQ0hKLzBhb29XMnRZL2RIOFYza2dxWkFWOXB2?=
 =?utf-8?B?UytnZWxjVHc2Yjl5NXBJZnAyR0dyRllDREcraFZQdDZqWWJ0ZTZlcit2N0gw?=
 =?utf-8?B?YmFSSUt6S0I4aUdkeEU3SnZKNExkdUtpWUgxL0lPUnBac0hjTlVYSUR2TGhu?=
 =?utf-8?B?aGljYlJ0b09RN0huM2FpRzNyWWdyYm1QTzZaekFTYnRnZ1J3T0xPR09WMXpR?=
 =?utf-8?B?amlUTC96dW5KU3UwWmJZK285cFVNMXlWem9pYnluTmZub0h6clBNZDFLbUtZ?=
 =?utf-8?B?bG10bDhiMTNKVTFUanVuenJLcWRXdUp0TjBva1FRNUc4UVd6NHNZTURLRjEw?=
 =?utf-8?B?OFdMQThwTUxjM0JlcnE3WmthU1VDL3JhVWw0bHVXYnlxVEw2OTZsbllaazNi?=
 =?utf-8?B?QnBYaVNlRVllVlZ0WnU0KzRlOTBuYWdlcnFyQ3JQWk4ybHdDSDJWSVhodVRa?=
 =?utf-8?B?N2NKbW83Z0luZU9XdkxlUlhSNWxablVpNnMrOHhBTUxIdEMzdFdRVS9mZGZq?=
 =?utf-8?B?U0RBTGthY2MyVkJFdlNBTXl5dnFKaW1Rd3hSZTlBTGxYdGVpWXd6a0xSRExG?=
 =?utf-8?B?Qi9jV2RkOVg2bTE4SVlFbndJaTZjMllKQ054ZlpINjhDcVFrY28zVmhWV2Z0?=
 =?utf-8?B?aDdBTVZvb091aGp4ZCtpT3d1Z3BHbzJnaXZtKytWKzBqYzdRd3g3SlIvdjR0?=
 =?utf-8?B?MXl4bVRoNlZjVHBMQ0I5SHJHWU1pSEhqZTd4S3M1OHBmeGY0RnVSZ2YzZitF?=
 =?utf-8?B?NDJSenBXK1EwZjZ2SzJrRW9ieFpoUFRZdUlxNmdCOFVnWHM0RG9FNkQ2Nkw3?=
 =?utf-8?B?MmorNnJSYlNWeDJaKy9rck9EL2tHQ2VwM3ZXNzcrOXBGU3JUM092VWMwR2JB?=
 =?utf-8?B?VzZtWGRRZjRqaEUzN2d3VlE4SkgvcGFmWFo1b2RwU2VNc3AvYndjS0QxTVlV?=
 =?utf-8?B?SUZreHdyalRmL202andYV3dVRm1nSU9oU0RTNGlvOWF5TWxtZHZXNkJOQXBj?=
 =?utf-8?B?ZHFwNFllOHNiWjhZcyswUVpzRCsxZnMyNWhBeGx3bjEzWGVVREdyWENLVm5h?=
 =?utf-8?B?SkZ3bkw5a0FsRmg0ajNaajY1WEdlSmIyeG8vVEZSUTRscmRzSnl3czNIVk43?=
 =?utf-8?B?VVhINjJvMm9keXNPTVBnYW9wSkk3b291emRlRXV0UkRLcnJpc0RyN0YwU0RI?=
 =?utf-8?B?ZmVnRHFBWTk5MURSNnN3cVFEaVZBU0NvRUFldHUydWtKZExJeExYNXNZdnRR?=
 =?utf-8?B?d25EWjBMc3Y2aHVUYjRSWWNpcndJMHpIMTh6VzBpMllhaWIwOW10YkVybmlZ?=
 =?utf-8?B?am52UTlhNkNocVQ0Rm9hcE4rdUNvdmJsSS9IK2dlTCtkYmY1eWpTWk9NTjYv?=
 =?utf-8?B?c2NnQi9abVNmWlFuYkxoTmVHci9RQ3VhWGV6dDBPb0RpV1JERkhsNWxvNS8y?=
 =?utf-8?B?M3Z1YWpDc0NucnFvMTFJV1Y1VytvSVZoTXc4WUZvQ1Z2enVJUlJ2UkdnNXlR?=
 =?utf-8?B?OVFhUDA4dVY2K25QZVdPQmtQaDR3OWVGVERJZlArakJFdnhyekxyZDVOUTlI?=
 =?utf-8?B?c256MlU2cFJqdFIyenlCQ2oybUgyRmRZOHEvKzZhQ1ZUOXc3WGRqdkNQRWVl?=
 =?utf-8?B?ZmN0YzV4VzcvdDVEckVtZ004L3I2Wko3QjJ5YUtVaXBSeW1hTHYxWXZXSUtO?=
 =?utf-8?B?NldIUExVNXhUdW9jaUEzWXVyT2QrVm1NcWFKZElzVzZqUXNMQkhMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b75e142-636a-4d12-1e67-08da39a8cae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 15:03:54.7179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GTKKzZc5oI7RlA3EDulVkBviSvD8BNiyKSOYeCoKXFMv+Q4+VHz62t1i1dkKZfkNIZik0p34Wvh2ZcyqymJe6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDE5LCAyMDIyIDEwOjMxIEFN
DQo+IFRvOiBMZW5neWVsLCBUYW1hcyA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+OyB4ZW4tDQo+
IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsg
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ow0KPiBDb29wZXIsIEFu
ZHJldyA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
dG9vbHMvbGlicy9jdHJsOiBhZGQgYW5kIGV4cG9ydCB4Y19tZW1vcnlfb3ANCj4gDQo+IE9uIDE5
LjA1LjIyIDE1OjU5LCBMZW5neWVsLCBUYW1hcyB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJv
dW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+PiBKdWVyZ2VuIEdy
b3NzDQo+ID4+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMTksIDIwMjIgOTozMyBBTQ0KPiA+PiBUbzog
TGVuZ3llbCwgVGFtYXMgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPjsNCj4gPj4geGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW50
aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ow0KPiA+PiBDb29wZXIs
IEFuZHJldyA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gdG9vbHMvbGlicy9jdHJsOiBhZGQgYW5kIGV4cG9ydCB4Y19tZW1vcnlfb3ANCj4gPj4N
Cj4gPj4gT24gMTkuMDUuMjIgMTU6MjcsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gPj4+IEFk
ZCBhbmQgZXhwb3J0IHhjX21lbW9yeV9vcCBzbyB0aGF0IGRvX21lbW9yeV9vcCBjYW4gYmUgdXNl
ZCBieQ0KPiA+Pj4gdG9vbHMgbGlua2luZyB3aXRoIGxpYnhjLiBUaGlzIGlzIGVmZmVjdGl2ZWx5
IGluIHRoZSBzYW1lIHNwaXJpdCBhcw0KPiA+Pj4gdGhlIGV4aXN0aW5nIHhjX2RvbWN0bCBhbmQg
eGNfc3lzY3RsIGZ1bmN0aW9ucywgd2hpY2ggYXJlIGFscmVhZHkNCj4gZXhwb3J0ZWQuDQo+ID4+
Pg0KPiA+Pj4gSW4gdGhpcyBwYXRjaCB3ZSBtb3ZlIGRvX21lbW9yeV9vcCBpbnRvIHhjX3ByaXZh
dGUuaCBhcyBhIHN0YXRpYw0KPiA+Pj4gaW5saW5lIGZ1bmN0aW9uIGFuZCBjb252ZXJ0IGl0cyAn
Y21kJyBpbnB1dCBmcm9tIGludCB0byB1bnNpZ25lZCBpbnQNCj4gPj4+IHRvIGFjY3VyYXRlbHkg
cmVmbGVjdCB3aGF0IHRoZSBoeXBlcnZpc29yIGV4cGVjdHMuIE5vIG90aGVyIGNoYW5nZXMNCj4g
Pj4+IGFyZSBtYWRlDQo+ID4+IHRvIHRoZSBmdW5jdGlvbi4NCj4gPj4+DQo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPg0KPiA+Pj4g
LS0tDQo+ID4+PiAgICB0b29scy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgIHwgIDEgKw0KPiA+Pj4g
ICAgdG9vbHMvbGlicy9jdHJsL3hjX3ByaXZhdGUuYyB8IDYzICsrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiA+Pj4gICAgdG9vbHMvbGlicy9jdHJsL3hjX3ByaXZhdGUuaCB8
IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+Pj4gICAgMyBmaWxlcyBj
aGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCA1OSBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBk
aWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9pbmNsdWRlL3hlbmN0
cmwuaCBpbmRleA0KPiA+Pj4gOTViZDVlY2E2Ny4uNDg0ZTM1NDQxMiAxMDA2NDQNCj4gPj4+IC0t
LSBhL3Rvb2xzL2luY2x1ZGUveGVuY3RybC5oDQo+ID4+PiArKysgYi90b29scy9pbmNsdWRlL3hl
bmN0cmwuaA0KPiA+Pj4gQEAgLTE1OTcsNiArMTU5Nyw3IEBAIGludCB4Y192bXRyYWNlX3NldF9v
cHRpb24oeGNfaW50ZXJmYWNlICp4Y2gsDQo+ID4+PiB1aW50MzJfdCBkb21pZCwNCj4gPj4+DQo+
ID4+PiAgICBpbnQgeGNfZG9tY3RsKHhjX2ludGVyZmFjZSAqeGNoLCBzdHJ1Y3QgeGVuX2RvbWN0
bCAqZG9tY3RsKTsNCj4gPj4+ICAgIGludCB4Y19zeXNjdGwoeGNfaW50ZXJmYWNlICp4Y2gsIHN0
cnVjdCB4ZW5fc3lzY3RsICpzeXNjdGwpOw0KPiA+Pj4gK2xvbmcgeGNfbWVtb3J5X29wKHhjX2lu
dGVyZmFjZSAqeGNoLCB1bnNpZ25lZCBpbnQgY21kLCB2b2lkICphcmcsDQo+ID4+PiArc2l6ZV90
IGxlbik7DQo+ID4+Pg0KPiA+Pj4gICAgaW50IHhjX3ZlcnNpb24oeGNfaW50ZXJmYWNlICp4Y2gs
IGludCBjbWQsIHZvaWQgKmFyZyk7DQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnMvY3RybC94Y19wcml2YXRlLmMNCj4gPj4+IGIvdG9vbHMvbGlicy9jdHJsL3hjX3ByaXZhdGUu
YyBpbmRleCBjMDQyMjY2MmYwLi42YTI0N2QyYjFmIDEwMDY0NA0KPiA+Pj4gLS0tIGEvdG9vbHMv
bGlicy9jdHJsL3hjX3ByaXZhdGUuYw0KPiA+Pj4gKysrIGIvdG9vbHMvbGlicy9jdHJsL3hjX3By
aXZhdGUuYw0KPiA+Pj4gQEAgLTMyNiw2NCArMzI2LDYgQEAgaW50IHhjX2ZsdXNoX21tdV91cGRh
dGVzKHhjX2ludGVyZmFjZSAqeGNoLA0KPiA+Pj4gc3RydWN0DQo+ID4+IHhjX21tdSAqbW11KQ0K
PiA+Pj4gICAgICAgIHJldHVybiBmbHVzaF9tbXVfdXBkYXRlcyh4Y2gsIG1tdSk7DQo+ID4+PiAg
ICB9DQo+ID4+Pg0KPiA+Pj4gLWxvbmcgZG9fbWVtb3J5X29wKHhjX2ludGVyZmFjZSAqeGNoLCBp
bnQgY21kLCB2b2lkICphcmcsIHNpemVfdA0KPiA+Pj4gbGVuKQ0KPiA+Pg0KPiA+PiBXaHkgZG9u
J3QgeW91IGp1c3QgcmVuYW1lIHRoaXMgZnVuY3Rpb24gYW5kIG1vZGlmeSB0aGUgdXNlcnMgdG8g
dXNlDQo+ID4+IHRoZSBuZXcgbmFtZT8NCj4gPg0KPiA+IEZvciB0d28gcmVhc29uczoNCj4gPiAx
KSBoYXZpbmcgdGhlIGRvX21lbW9yeV9vcCBhcyBhIHN0YXRpYyBpbmxpbmUgaXMgY29uc2lzdGVu
dCB3aXRoIGhvdw0KPiBkb19kb21jdGwgYW5kIGRvX3N5c2N0bCBhcmUgaW1wbGVtZW50ZWQsIHNv
IGxvZ2ljYWxseSB0aGF0J3Mgd2hhdCBJIHdvdWxkDQo+IGV4cGVjdCB0byBzZWUgZm9yIHRoZSBt
ZW1vcnlfb3AgaHlwZXJjYWxsIGFzIHdlbGwuDQo+IA0KPiBJdCBpcyBtdWNoIG1vcmUgY29tcGxp
Y2F0ZWQgdGhhbiB0aGUgZG9fZG9tY3RsIGFuZCBkb19zeXNjdGwgaW5saW5lcy4NCj4gDQo+IEFk
ZGl0aW9uYWxseSBpdCBpcyBiZWluZyB1c2VkIGJ5IGxpYnhlbmd1ZXN0LCBzbyBtYWtpbmcgaXQg
YW4gaW5saW5lIHdvdWxkDQo+IGV4cG9zZSBsb3RzIG9mIGxpYnhlbmN0cmwgaW50ZXJuYWxzIHRv
IGxpYnhlbmd1ZXN0Lg0KPiANCj4gPiAyKSB0aGUgcGF0Y2ggaXRzZWxmIGlzIGNsZWFuZXIgYmVj
YXVzZSB0aGVyZSBpcyBubyBjaHVybiBpbiBhbGwgdGhlIGZpbGVzIHRoYXQNCj4gcHJldmlvdXNs
eSBjYWxsZWQgZG9fbWVtb3J5X29wLg0KPiANCj4gT1RPSCBhbGwgY2FsbGVycyBhcmUgaW4gWGVu
LCBzbyBpdHMgbm8gZGVhbCB0byBjaGFuZ2UgdGhvc2UuDQoNCkknbSBmaW5lIHdpdGggZ29pbmcg
dGhlIHB1cmUgcmVuYW1lIHJvdXRlICBpZiB0aGF0J3Mgd2hhdCdzIHByZWZlcnJlZC4NCg0KVGFt
YXMNCg==

