Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D552E146
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 02:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333374.557196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrqfI-0003g0-A0; Fri, 20 May 2022 00:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333374.557196; Fri, 20 May 2022 00:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrqfI-0003dd-5y; Fri, 20 May 2022 00:38:48 +0000
Received: by outflank-mailman (input) for mailman id 333374;
 Fri, 20 May 2022 00:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBQL=V4=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nrqfG-0003dX-Tr
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 00:38:46 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3369c66a-d7d5-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 02:38:45 +0200 (CEST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 17:38:42 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 19 May 2022 17:38:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 17:38:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 17:38:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 17:38:42 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Fri, 20 May
 2022 00:38:40 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 00:38:40 +0000
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
X-Inumbo-ID: 3369c66a-d7d5-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653007125; x=1684543125;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mZD+eysfE5wzUcPQkxrPInegcpLTHXSHQSGYSuJL1wo=;
  b=H75K/U7GEZms01nXqE4LqZsDxQzVZt0o8CZCQ5EFSRAbvMovsBLCbkcA
   9qT6VcL+NgrrzBvs9+vFOAA/JEUHHHo5DlSVTPmUimBBidnhhOahNnSes
   QGOgdpHeEqVWKM7TMQ85+MjCaOgv01jdBCLo7UKHsPtR4iqsSyH6zpp7t
   neVN5HSixcVqQmo1A2fPdducg7mwe6qlcJ5xLssepm1t3M1iLAbjNUu+m
   SVtYwEx8JJFUzRrgKZNJwbLiI1rW0Dz2T1Fx0HhZjJ1ejFyEIeVn1/N7Y
   ofuVJ0xHYS50R7k0LsSCh3ofhkeLn1yyteR2yoOIowJTNUNXwl4GKc2Ew
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="252948632"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="252948632"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="674345195"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ih1QUnV0kzPdfUjNHMtuVarG5CU0vNtk9XkS7PDryAVtoaS6auEDA2hIVPfv/rE4lmkV1h/3CU8w2aYaWtFYltoupyzHGFZzt6g9Li6D0dLPElTjBtZMSvWzWzgSlMo3JmioIyoSbJUUl4QpCO2Mcbyyacyw9J1/zQ2suR116DhCBU/f8bqUQIdcaxGKfByunAay9CFug/CxmKIF+kwIUBKG8Jn/avtikg6QRIJPQkeFm0hAZ1BZQI7OR4Yeh5yZNmO4pTscirgrTjyn2jwGt8mS5W0rjStK1HJE79S54ABiEmLVv5eF7aCRI7HxPR9n9lqqfXLCVGidiAc31xLqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZD+eysfE5wzUcPQkxrPInegcpLTHXSHQSGYSuJL1wo=;
 b=lSQ1JSBx0A3pcdI/5u1py4aoZrWpcPDuyIZNzoI1MFgMaA0YPFC0rLcwTQJAYASy2op92HfOjluBqtj+Y54UHzJTmlZ42Syo76YbkiMgNGldq7G3QVzQSDJn9BBqRySSlNt0npfTe2dSL5eFgF1IBo8gn/IlKduc/FQu5pMDM8cYy2xlQQmr1AFTjfzqZK0zCiEGL7+hYDI+j3eUZi5mg6QGNpXllTWrbbokNHfto5YUtQQYXxwyGYa4UmxtDCt3Zm7GGPkJCS3ps0R5/m1BB7BzLVs+2I9/ojLbKxrNK0KBWfjR4KefoZmYRfjub1RPPTMQD1RFXD/KxjSUlbLT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH v4 16/21] VT-d: free all-empty page tables
Thread-Topic: [PATCH v4 16/21] VT-d: free all-empty page tables
Thread-Index: AQHYWIB55LiJis4LlU+Of8jQSBwnua0YQ++AgAxOaYCAAoAxgA==
Date: Fri, 20 May 2022 00:38:39 +0000
Message-ID: <BN9PR11MB5276E699E10CD6D9ACA1466C8CD39@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
 <Ynp2+faOjZguAUVP@Air-de-Roger>
 <597c3630-b69f-e885-bb08-a52d2c6e7f92@suse.com>
In-Reply-To: <597c3630-b69f-e885-bb08-a52d2c6e7f92@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 896e22ff-bca1-4b5a-2b28-08da39f915aa
x-ms-traffictypediagnostic: IA1PR11MB6243:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <IA1PR11MB6243611C0825AC0E3875CEE78CD39@IA1PR11MB6243.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3RNguWbfysyVjamhfvA1v+OtR2cd3VzrzDS2fdE2fnBuqjTtliUYUNpykDtGCUzgI6jWoZrddH7xPzd6UbOehTBE6pXNmmG81rOAKlMSLekl28sqYL6bpX5tU6EduBoeX8Pr3O352rgZHUU7kHZKae0l88lxXUv+If0ZAjcGOq3brzL9Hl/hG3suOKecmdzSu0jpDG+QrMIXMnfs7Y+NBal/Wpm7qTDcek4Ohirq3UcEVoGtGr22QEXF9rkj8N6dknxaRtqjQqNr6ZBxNu3oe769ynC/9m8yG9/fXT/WKd6pjQ3d4EzEGAeLAIDScsfJx+TcwpPVKfeQbc77DVtuolQsoazuNii1+njt0kLW5vlC1L1TDKiwmRjAs6d7raW9ufbog1Is+GB8erSO5X/loCi47dcAexZGugso3yKU8G6HnruFVOw1eKFaXWl8UFlb+AZnBAxopaB9UONrQhSrC5/MSCliCNLZOEGYMAXpWkimtd8F8+471Bd0NTwzFlvW4S6ryXKiKCy1e1H68n6T9ieLAGeRWerkfYA7GegfR41aXWbspbxY7l/U4F53cwDW3O1Npa7lWEMyX9hLy2fwCt4tAhCjZvOh3tt3z6+tvfA8A3mz/yx0/NDed7PAzX1q73F9lbFJWqmUp1JPDCZsbmizZu7KQqs3POJwE5H0QLlYjE6PcYgy//GKTf5D6CvoJmccwTLSkPykfmoWxD4J9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(7696005)(6506007)(53546011)(8936002)(2906002)(33656002)(52536014)(9686003)(26005)(55016003)(38100700002)(64756008)(4326008)(71200400001)(508600001)(66476007)(86362001)(82960400001)(66446008)(76116006)(8676002)(122000001)(38070700005)(66556008)(83380400001)(186003)(66946007)(54906003)(316002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkxuYTdiV3ZBRE5qVm9zRzh3OHRrMlMwb202aU83Y1l3UjBhSWJnMTNCaE9r?=
 =?utf-8?B?YzZiak5TYzhtNzZKNGxuSmRtanR2RWtpcE9vb1ZUL1NxV2FCZUpqS2VXU2I1?=
 =?utf-8?B?Q1haQVJJRzJaaFMyS0lTeldSRkVxRVNCTXhsWllHVERHTXJZa2loY0hqOU9S?=
 =?utf-8?B?aE5kd3dpZ1FqT2p1SW85NDFHcDFXK1dVbXROREJLNXlocFNEWEUxTDA5NkJ4?=
 =?utf-8?B?Nk12bjFjSUFDTk41SFhNd291SzVDVFdQWDZrZjV4d25GaG5BT1h1RkRVUzU2?=
 =?utf-8?B?T2lDZnVYRmRsQ0hiMnpsZzZKaVhEaU1BU2VKYkJNbnBMYmtXUkVkbEl3TTJo?=
 =?utf-8?B?UGlYK2EwclE0RXhqOHJUbHJGOUlER0l6WUsyRnpWbHBVQk1OTVhGS1N2eHBP?=
 =?utf-8?B?RVVXQ1kxMFlHWEM4N2RkQXM0QmFQNHFNQVhwNVYrQXFMYW5odFpZL0ZYSWNO?=
 =?utf-8?B?RU5ZTW1tZEdmdW5vcnlES3NqaUhCeXIwNXE0c3NZQ203S1JEQWl1ZHY0ZlIw?=
 =?utf-8?B?elcvWmo3T1RIQXhxeVlXMy8vblNjYnR4SThiQlV4bXkvZjNJZEFEenMrZjVq?=
 =?utf-8?B?RDYvREVyNlI5dEJuNkl6NlFGRVN3bUhqRUVGNko1Yis0UGJJeDNKWWNIZWJo?=
 =?utf-8?B?Sm5XaWs1dXRDdndrSmVLSWJKaUdNd1ZxTkNFNGQrZlhmdUVQQ1VZNG85enp6?=
 =?utf-8?B?QWVEU0wrSzNpelFyUHNqZDRuWDZSbFNzVTZKWUZYWWhBU3M2cFVKNGV5UEFZ?=
 =?utf-8?B?TEpTcjhxbEJ6czduT0t4bEVrdzVXUENjdDJSeDRheTFpZUQ2czRYalY5NlNs?=
 =?utf-8?B?cjZGQU1SVGEwOXNReWM2V0p6RmtxenIzSkJqdlFjYnlyNlVtYnMvVFJIM1dC?=
 =?utf-8?B?ZGV2MGNlVnNDNzR1U1JUL2VlenRNWUQxVUo2QzJmVWhnM1VXVHJreFE2dHBO?=
 =?utf-8?B?eVlQY1MvUkRFRWljOXZ4TlA3eDRLaHA4SkllNXhONkw0N3Y4S25QY1ZkU2pX?=
 =?utf-8?B?VFN4dDZZTy9xblBHOXlraUxpT0t3aWJGUGxJbFBaYzFNVWZFUk5rQ3RIeFA3?=
 =?utf-8?B?TWZOVlRQckZQZWNjWHBlNVNtZWJjZkRoOVNqbUVORVBkTFhCMTBYdjh5OFBl?=
 =?utf-8?B?S3NLV1poUGJmWmdkNFYyQjI1RTdpd0FtS1RpNHdsN1ZweEJkN0xJSFlLRE9u?=
 =?utf-8?B?cERGU2JBd0R5b2hWSkFZM1BxTmlyNFQwR1REWWpPclJ0ZjUwZFEzVW45dWMr?=
 =?utf-8?B?WDAzM05Lc3VTdTFUcXdvZ3dac1kzUXZIMmpET2NvSVVLL1Y0Yy8zWnNiTEk0?=
 =?utf-8?B?Qkk4anVQVnNac2hlVjRIaUkyWEFPZ0pCWkZoU3ZIVHNjS3dIWXdzcVd1bERa?=
 =?utf-8?B?dGhZTXJjbnE5YlZpWExDSitvTlFqQ0VXa0pickpka0lURDA4MUlZRHpaNmFO?=
 =?utf-8?B?MHNCVnZkNkxvQ3YweDZ5S2pxcXJYeGlaZjYzdGJrSVV4d2JnbDBIY3R4Zlpu?=
 =?utf-8?B?NThDdjdJTSs0VzNtNnU3TkFrR1BRQU5lL2tPU0J0QjZtb2VlRUZheW1JcDhj?=
 =?utf-8?B?OWNOOVFGZTBvbXk5VmIwTE1kMHc5UjdMVVNjWitTOS8zV0JUNXhlVnpka2Zx?=
 =?utf-8?B?NzIzTmVIZUR0S2F6ejR6SWpiQW12WkNiTUxJV3U0bnB5eDdGSUk0cmJLU21J?=
 =?utf-8?B?aUFNWjFpdzJKQm1BM0ZiMHF1QitZS2FuQlhQOUh5cGlvUnlCSHNVaWhkYnNL?=
 =?utf-8?B?SnJXeTE1TUpDcW4vTHVDTUViT3F4ZHA5V3l2UXNnbGh6YjJCdjUzL2cxdEh2?=
 =?utf-8?B?aCtXcndOK0llVkRoRE9NRGJ3WWthUnlEQzR5QjlWT21ZS3AzdC95Vk50QTdi?=
 =?utf-8?B?Vm9mWVcvdkQxc05WMzNIU25TL0tRRTB6Q1JteFZkOVQvS2c4RUhzN1hkUUxL?=
 =?utf-8?B?Zk45K3IwM2pNbFdCNnNKLzUvcTV4eTNLRGZQWStQSFQxMExHOElGSDNxNloz?=
 =?utf-8?B?VHVVd3FvVk5ESmJnbEk1dHdwTUQxektLSDZBallVcTdZL0lTVUdlb29BL2ov?=
 =?utf-8?B?NXlaMEhIOXovblh1VEZKR1ZiV242a3hvRjNnRHpuRjBTNDBxdlJMcXlDWVMv?=
 =?utf-8?B?c0V2WmFsdy81eEorOUdLSERDMngyMm54RVhmdzl4dnhOS1cyQWMzRGlwWUZP?=
 =?utf-8?B?b1JQSWpQOVVsM3hQU2lpRXF4aklRMU9QWWltWGNQMGpTMlhzRGxUd3pTNGpr?=
 =?utf-8?B?QWRyMDBDczJBbmtRSysrT0t6M0lTVFprczh1b3Q1aUdNT1pTSlpxUGQ4TVow?=
 =?utf-8?B?Rndyakt6U24zYnF4WEwzRnVFdTdJeUc1Q29jL3V4M05Dc1h3ZXg0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896e22ff-bca1-4b5a-2b28-08da39f915aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 00:38:39.8510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFkOQY0TYn9APO8Yq5gN361JifNxwrkmXedlasnvB7NXsxDaLP3FA+Pc6Zq7pk1KMnnXHiHIim/a6ddcNXKK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaA0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAxOCwgMjAyMiA2OjI2
IFBNDQo+IA0KPiBPbiAxMC4wNS4yMDIyIDE2OjMwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
PiA+IE9uIE1vbiwgQXByIDI1LCAyMDIyIGF0IDEwOjQyOjUwQU0gKzAyMDAsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPiA+PiBXaGVuIGEgcGFnZSB0YWJsZSBlbmRzIHVwIHdpdGggbm8gcHJlc2VudCBl
bnRyaWVzIGxlZnQsIGl0IGNhbiBiZQ0KPiA+PiByZXBsYWNlZCBieSBhIG5vbi1wcmVzZW50IGVu
dHJ5IGF0IHRoZSBuZXh0IGhpZ2hlciBsZXZlbC4gVGhlIHBhZ2UgdGFibGUNCj4gPj4gaXRzZWxm
IGNhbiB0aGVuIGJlIHNjaGVkdWxlZCBmb3IgZnJlZWluZy4NCj4gPj4NCj4gPj4gTm90ZSB0aGF0
IHdoaWxlIGl0cyBvdXRwdXQgaXNuJ3QgdXNlZCB0aGVyZSB5ZXQsDQo+ID4+IHB0X3VwZGF0ZV9j
b250aWdfbWFya2VycygpIHJpZ2h0IGF3YXkgbmVlZHMgdG8gYmUgY2FsbGVkIGluIGFsbCBwbGFj
ZXMNCj4gPj4gd2hlcmUgZW50cmllcyBnZXQgdXBkYXRlZCwgbm90IGp1c3QgdGhlIG9uZSB3aGVy
ZSBlbnRyaWVzIGdldCBjbGVhcmVkLg0KPiA+Pg0KPiA+PiBOb3RlIGZ1cnRoZXIgdGhhdCB3aGls
ZSBwdF91cGRhdGVfY29udGlnX21hcmtlcnMoKSB1cGRhdGVzIHBlcmhhcHMNCj4gPj4gc2V2ZXJh
bCBQVEVzIHdpdGhpbiB0aGUgdGFibGUsIHNpbmNlIHRoZXNlIGFyZSBjaGFuZ2VzIHRvICJhdmFp
bCIgYml0cw0KPiA+PiBvbmx5IEkgZG8gbm90IHRoaW5rIHRoYXQgY2FjaGUgZmx1c2hpbmcgd291
bGQgYmUgbmVlZGVkIGFmdGVyd2FyZHMuIFN1Y2gNCj4gPj4gY2FjaGUgZmx1c2hpbmcgKG9mIGVu
dGlyZSBwYWdlcywgdW5sZXNzIGFkZGluZyB5ZXQgbW9yZSBsb2dpYyB0byBtZSBtb3JlDQo+ID4+
IHNlbGVjdGl2ZSkgd291bGQgYmUgcXVpdGUgbm90aWNhYmxlIHBlcmZvcm1hbmNlLXdpc2UgKHZl
cnkgcHJvbWluZW50DQo+ID4+IGR1cmluZyBEb20wIGJvb3QpLg0KPiA+Pg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IC0tLQ0KPiA+PiB2
NDogUmUtYmFzZSBvdmVyIGNoYW5nZXMgZWFybGllciBpbiB0aGUgc2VyaWVzLg0KPiA+PiB2Mzog
UHJvcGVybHkgYm91bmQgbG9vcC4gUmUtYmFzZSBvdmVyIGNoYW5nZXMgZWFybGllciBpbiB0aGUg
c2VyaWVzLg0KPiA+PiB2MjogTmV3Lg0KPiA+PiAtLS0NCj4gPj4gVGhlIGhhbmcgZHVyaW5nIGJv
b3Qgb24gbXkgTGF0aXR1ZGUgRTY0MTAgKHNlZSB0aGUgcmVzcGVjdGl2ZSBjb2RlDQo+ID4+IGNv
bW1lbnQpIHdhcyBwcmV0dHkgY2xvc2UgYWZ0ZXIgaW9tbXVfZW5hYmxlX3RyYW5zbGF0aW9uKCku
IE5vIGVycm9ycywNCj4gPj4gbm8gd2F0Y2hkb2cgd291bGQga2ljayBpbiwganVzdCBzb21ldGlt
ZXMgdGhlIGZpcnN0IGZldyBwaXhlbCBsaW5lcyBvZg0KPiA+PiB0aGUgbmV4dCBsb2cgbWVzc2Fn
ZSdzIChYRU4pIHByZWZpeCB3b3VsZCBoYXZlIG1hZGUgaXQgb3V0IHRvIHRoZSBzY3JlZW4NCj4g
Pj4gKGFuZCB0aGVyZSdzIG5vIHNlcmlhbCB0aGVyZSkuIEl0J3MgYmVlbiBhIGxvdCBvZiBleHBl
cmltZW50aW5nIHVudGlsIEkNCj4gPj4gZmlndXJlZCB0aGUgd29ya2Fyb3VuZCAod2hpY2ggSSBj
b25zaWRlciB1Z2x5LCBidXQgaGFsZndheSBhY2NlcHRhYmxlKS4NCj4gPj4gSSd2ZSBiZWVuIHRy
eWluZyBoYXJkIHRvIG1ha2Ugc3VyZSB0aGUgd29ya2Fyb3VuZCB3b3VsZG4ndCBiZSBtYXNraW5n
IGENCj4gPj4gcmVhbCBpc3N1ZSwgeWV0IEknbSBzdGlsbCB3YXJ5IG9mIGl0IHBvc3NpYmx5IGRv
aW5nIHNvIC4uLiBNeSBiZXN0IGd1ZXNzDQo+ID4+IGF0IHRoaXMgcG9pbnQgaXMgdGhhdCBvbiB0
aGVzZSBvbGQgSU9NTVVzIHRoZSBpZ25vcmVkIGJpdHMgNTIuLi42MQ0KPiA+PiBhcmVuJ3QgcmVh
bGx5IGlnbm9yZWQgZm9yIHByZXNlbnQgZW50cmllcywgYnV0IGFsc28gYXJlbid0ICJyZXNlcnZl
ZCINCj4gPj4gZW5vdWdoIHRvIHRyaWdnZXIgZmF1bHRzLiBUaGlzIGd1ZXNzIGlzIGZyb20gaGF2
aW5nIHRyaWVkIHRvIHNldCBvdGhlcg0KPiA+PiBiaXRzIGluIHRoaXMgcmFuZ2UgKHVuY29uZGl0
aW9uYWxseSwgYW5kIHdpdGggdGhlIHdvcmthcm91bmQgaGVyZSBpbg0KPiA+PiBwbGFjZSksIHdo
aWNoIHlpZWxkZWQgdGhlIHNhbWUgYmVoYXZpb3IuDQo+ID4NCj4gPiBTaG91bGQgd2UgdGFrZSBL
ZXZpbidzIFJldmlld2VkLWJ5IGFzIGEgaGVhZHMgdXAgdGhhdCBiaXRzIDUyLi42MSBvbg0KPiA+
IHNvbWU/IElPTU1VcyBhcmUgbm90IHVzYWJsZT8NCj4gPg0KPiA+IFdvdWxkIGJlIGdvb2QgaWYg
d2UgY291bGQgZ2V0IGEgbW9yZSBmb3JtYWwgcmVzcG9uc2UgSSB0aGluay4NCj4gDQo+IEEgbW9y
ZSBmb3JtYWwgcmVzcG9uc2Ugd291bGQgYmUgbmljZSwgYnV0IGdpdmVuIHRoZSBhZ2Ugb2YgdGhl
IGFmZmVjdGVkDQo+IGhhcmR3YXJlIEkgZG9uJ3QgZXhwZWN0IGFueXRoaW5nIG1vcmUgd2lsbCBi
ZSBkb25lIHRoZXJlIGJ5IEludGVsLg0KPiANCg0KSSBkaWRuJ3QgaGVhciByZXNwb25zZSBvbiB0
aGlzIG9wZW4gaW50ZXJuYWxseS4NCg==

