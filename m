Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31A4F8CF0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 06:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301114.513849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncfvQ-00048y-HP; Fri, 08 Apr 2022 04:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301114.513849; Fri, 08 Apr 2022 04:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncfvQ-00046K-Cy; Fri, 08 Apr 2022 04:08:44 +0000
Received: by outflank-mailman (input) for mailman id 301114;
 Fri, 08 Apr 2022 04:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XiXL=US=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1ncfvO-000464-Dg
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 04:08:42 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ecb56f-b6f1-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 06:08:41 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 21:08:19 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 07 Apr 2022 21:08:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 21:08:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 7 Apr 2022 21:08:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 7 Apr 2022 21:08:18 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB2572.namprd11.prod.outlook.com (2603:10b6:5:c8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Fri, 8 Apr
 2022 04:08:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%9]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 04:08:16 +0000
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
X-Inumbo-ID: 91ecb56f-b6f1-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649390921; x=1680926921;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x7QBY+2397q67d8T16EQA4MJaySGLnCri0MEKS8LzgY=;
  b=fqYm460piC2O4kObwq1VUfWgD1H9TEWpK+3759cykKPRdwo9018XTCg9
   tHsC652hS7s4RQXB66NwFFgv2eCsWZIPkiqZH+0fEFuy7swSj5c3aY9up
   Nt3IivZ1UyQfVtKomt7uNUNiHUCUyG2yiFCbfznGZKlmGZsNYtC7koc2t
   WOv2ipNKK+yL5TV7U3vxC4ShqjdRY5O+CKOc+Gn3f93g0IU3tRAA1Z0hr
   d2ELKeGtpVW3mCYY+OYwEbRP7qfNLWpEElnQ7XcSmlHnoPUn1vY/QIV+c
   dsLQvsvjm4FV9CLTfFBcwx/U9bm3zq0tEN2n2fDo60G7alx8KHwbLV7NT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261498263"
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; 
   d="scan'208";a="261498263"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,243,1643702400"; 
   d="scan'208";a="525216571"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bg1HSdmmoy9DLbKQjTvNmgvS4vPsFmSG7h37z1w22LolCdPjnuRYSMrICvUfVpOnIzpX2IPfAF5gY0I/CSa7ONvYCCJ7ienyDfag+av10JXZyk00Dz5XOcpNGUN4BZi/VGJ9JkeuxrmxQO3FhNt0upJjtdKRtiX0cr2n7R+Y3a8EYcABf8a5gpveK6eSZAErOljgZT99GK0+99i122zpeD4CO++UV1VxIkIEQ8OZIyrLZyG94yKcZSW7zqv7+nEaq+OP5/RsYtxEuHfqYnJelVjhwPlcWhOuZCsnJciJ0NPtrOa4SGuKUeVgcFcKMicn72uybbFy9pHP1LWxzrYSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7QBY+2397q67d8T16EQA4MJaySGLnCri0MEKS8LzgY=;
 b=bNyCa281tljK7Ywxc5nfRFIlpPrIIlJt2IA49gZwsNYquMnH9TH+TqDmJ+AcRSPpMSREo9bT29wTwwa9EJPbG8hWlGbl6pnIqRUtNQqNC+eFjIBEmlDKTDi79VkeBT9inCGhEm1eMOT4Cq5MJD3iuRfN4TBeKKg3/fzvJX3uNehagXRz76SRDExwJQFxUCTxNlbPduhGPSQeIeJmYLO5PjXAhOPC27moxMV210Cn2TDdryCTszcE9B717toOjecA4e8rgnXmjbo3L+//jydpVAa16pT/MUBus0bQaJyXwMwis9lJFStQ85MlWPHmXU9TKLaEKGen6BsYqyiqYuB+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH v2 0.9/2] VT-d: don't needlessly look up DID
Thread-Topic: [PATCH v2 0.9/2] VT-d: don't needlessly look up DID
Thread-Index: AQHYSmHO5XmPjC2LsUKpawre5sD9M6zlZ60w
Date: Fri, 8 Apr 2022 04:08:16 +0000
Message-ID: <BN9PR11MB527666EFEF577609B4F254488CE99@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <7671478f-e7c0-c43e-6395-1adc70333e04@suse.com>
In-Reply-To: <7671478f-e7c0-c43e-6395-1adc70333e04@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7de706e-f13f-4bb7-cfff-08da1915686b
x-ms-traffictypediagnostic: DM6PR11MB2572:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB2572350C51F52F945AD682D08CE99@DM6PR11MB2572.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NFexa4EwRb5bEHMPdDcJDzt0MnFjo83OOwxwSvaGIJp1h2Yhbm1b/jWZ7Ra8Qb0YSZXhTujb7QwqpERI2BVfE8E203O7a4aHJpKq6S32aVjMJUMPqjX1y52euSCU3lFrTolFb7zknawO6PLG28ci2pjQg3NpOLjgpz6LzOoEqqS839P6yNcBtyzvCe1rxjQFuVVPbS/xPlPoF5OHBX4eaFP8Xi7KJY2bVru3RxtBxqYP2E9PqHFO76c8TVWovfy9gn11dB7JDsJWe+eGOkbtGBs0FLQuPBOTmJ2Uai72hPKdGEeI3BErg46goSnN9JFtpQTRYUZn/ERmhyGXlrtbeLy0uE+T57S/Jc34QKap7aZE6plZb9txWB3vC+ZZfHrxVfg+U1KoXfb3cis1z3z8kFWrwoEHit7qDXwXVsVBzwFn4GzfU5X+3iEUEHg8+V6/7WnfGaep0En2ZmXCZlQvnObwwsWkYmz+HWEGy7Pfwi81MqMAa5eMaOiRljehFCBhmrP8VyrbeGc9ktzIhz7ZZwMn3KYXhsZJRqDdGEoX1p6Bl2CUNFx8SrjjKW681l/4b/bevTYUPEJrZK9GufFaZJTAm7l5tCeKz1kmauF6AF/v6easLD84jNJmRIXpgcKHtuXXKsvJtICRKu4hSUkyR95qz4r1dQoiFCfBVUQDwT4xu80lrxnNFyRIZTeJDirbN5NRzq+JMSdlVCCpfRHT6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(33656002)(9686003)(86362001)(508600001)(83380400001)(7696005)(52536014)(2906002)(5660300002)(8936002)(186003)(26005)(66476007)(71200400001)(66446008)(66946007)(66556008)(38070700005)(38100700002)(122000001)(82960400001)(55016003)(64756008)(54906003)(4326008)(8676002)(110136005)(76116006)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlJFZkRCSWZVKzNkZG9QbHdDTjNwNmpQSTBwKzgxZmdpWlNMNGJENDhhVitY?=
 =?utf-8?B?WTNYMlNDeGg3ZmlRNkd2K3lxSDhiOUNvaEMzQVRNR281Skgwc2Y3NXhmOXZK?=
 =?utf-8?B?eHhXQkhqS0JVTVQ5b2hBWURJaVo0ODljS05WTHVhZWdlbmVUa05TMXFZNlZJ?=
 =?utf-8?B?UjI5Ykg4YWVRU004NGtNS1Y2Qklmd0FZLzNOSzZuZXpESWEyRnhFTEdUR25y?=
 =?utf-8?B?WmZ4dWpSVTFHUzhtSzJLM3QwbFNJTC80ZXJteDlnZ1QvRHZRbVpIWW1zQ2Uw?=
 =?utf-8?B?Tnh4L0tDTDYxZmpSTzRXbmM2SFBGUWhua1RZM282c0o2bG16Y2RPSEZVWFY4?=
 =?utf-8?B?V1MzTTdJZmUvb2NkQ2VNaGE4TnlSVE44TEhvUkVZNDZObFZYclc2Y3BkVTNX?=
 =?utf-8?B?aTF2ZTM0T0EwTGg2b1lMYXB1ZXNqT09nNzNuQTFsR1owTWljSkVXdDJXUXpB?=
 =?utf-8?B?OEszTGJYZDlHakozRlZsZ3NnSkJ6REZNM3E0T3kyVjJmQmdIZSt2eW56T2xp?=
 =?utf-8?B?S2xnWjU0VlFRa2VzWjRISWlHbGcxekVnYXR5cFRmZG1odUhXejV0Y0FmL2Fn?=
 =?utf-8?B?WGZkNml4Q2hGMFhKNi9YQUtnRC9WbnZlK0t6QUkwa3JFRWk1d3pRWnJXdG4w?=
 =?utf-8?B?U0Q5WE5ZVzNYVTE5VWh5SUxEV1R1RzFWUEVLZDA2U3JWcXcrUU00YS9ZYXBq?=
 =?utf-8?B?WnBDK0g1Y0ozb2g0bjFaNUhyNDhKRWJKWSt5MkFRcUk1bmIwdVRvMlBVSkYw?=
 =?utf-8?B?MFlqcFJ4eTY0d3hsZ2duUGtCTHVBRjhrcDBzYXgvTndzSm50SnNCeWVUWXNm?=
 =?utf-8?B?RUtFTDVvNUNLVXk3WkhzWXIrM3ZZWlFnWDZGSGdPZlhTeGpad1kyb2l5Sk9t?=
 =?utf-8?B?dmp3NlA3Y2owUTRzc2pTUmd6b1VpaXJtbXlQbXoyN0VJRENsaU9haEhMZTU2?=
 =?utf-8?B?QUNUZW5qREhBMHVFVWErRFVTUTRjSHhOeHFWamxUUHdLV0phQ1ZidHRJTDhI?=
 =?utf-8?B?bC9JTTRsRlhwY0tnd05jVzlZaWxvWWdFMTdEMlpoZ1BOWGU0QmpWazMzTlhl?=
 =?utf-8?B?NkJsODlHOXhiLzV2MkFOL0ZVaE80ZlpPaUZ4aFc3TW9hdFV5VkJJbGxxV3hE?=
 =?utf-8?B?WDZtUklRcTgwU0UzbzFHK3BQRWpYVTdhMmRRZ3cwZ1k0SUE4KytZaW1mTTZ1?=
 =?utf-8?B?OGpHcTVodkVZYlBodzdDOEVBQ0o5WDh0VnZsNUtxek84am1HcE5wYkNXY1BS?=
 =?utf-8?B?Syt0VHB3SHhRTXErY25JaGpBQ1NnbWpWank2U0JHZjVYYUJPckRyYnF5QkRn?=
 =?utf-8?B?czFhOHBudHdud3h6L01EcUFCVlhYVEVpUXJoTk9SMTFNMW1Wekk3eXNGN3po?=
 =?utf-8?B?NDljWll3S0FvVEdNMmM4NzltTmVOVUtSREViZ1RkcnRMd0hWclBsei82bmtk?=
 =?utf-8?B?dDRwQUR3bC81UnBEaVpzaWk5Ylc3Y01BRU02dUZFUFJjMjVIU3hzNGt4RmlK?=
 =?utf-8?B?U0lrNXBhY0Y5UkJQb2lDWXdZRENhUUJlSGNwWnVIWmtZdVdVeXc0T2JoaVVB?=
 =?utf-8?B?WVRvTWR2WlVWU3cvN2xkK2cwUzlkUHhXdUJWWmFvY3MzUlQ0ZGd4V1gvYjBh?=
 =?utf-8?B?cEZ0cE10d0c4bUJZNDBsRVRvTE5wV2liM3MyeXBxZmtoVEZlK0hVSzhPMC9u?=
 =?utf-8?B?WGdvWDVsUlBBZ0tNTjU0TzRSUjdqeTdrNE4yeVVaN2pHeUdaMCtkcjJvMjN3?=
 =?utf-8?B?ZHhrNm5UT0ZvTlUrLzZYcmZXMU9XMUIwZThZbXR1eDlPc2dVbXY1amZxTitI?=
 =?utf-8?B?aXhGSGJlYjR6RjE5cnFiM0FuUGd0WmFlVW92clhjRVdYZlUxWE5OZzRNbTBi?=
 =?utf-8?B?eFNHMlFFV3pnZkVvdUZySHd4N2dFQTk5SXdEMDljSlJWcXNVRmI3RExVckdl?=
 =?utf-8?B?eGlMM1k1cFExdTd0ekM5ejdVRHpxV1JxWG94OEcyMUM3Wm5VRUxMRkZWMmRy?=
 =?utf-8?B?Zit0VHI2RHBqYXlMK1BTa2dlbmwwTzJNb3JBNGtjNmczUkE3dzQ3a0g4bUox?=
 =?utf-8?B?MmlhQTE3VzRKeVhRekZ0NC9ZWmU0QTZCeGI2cGdmK3NVamdYbTJRMEcxa045?=
 =?utf-8?B?MTE2MkN1TmNEcDhxTExjUnVVN005bDRBdWM1TGhSMWkyOW9Jb3J3K3UxWXdt?=
 =?utf-8?B?akVqUTk0eUFCOFkvQjRqR3JjVGJsbEdNdjZkZklJc1hHb1Ric3RodUdEYXpz?=
 =?utf-8?B?TXQwZWZqZU92V29YN3RreHpQVjkyNGRCS0t1QWdIZjBqZTE2MVhTK1U1VFVn?=
 =?utf-8?B?QkZ5cW5mZEdxSEt5WUdzRS9jWWtnczR1ai9yYkovN0I0Zm92eGpZZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7de706e-f13f-4bb7-cfff-08da1915686b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 04:08:16.1844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyzVuTbDuAyfx9SvDxV6HXttikOsrwsZXRTSFcHh3w4aO6blKSmgy4sv7zlZP8vIi+SyU2klyGV8x/6E221PKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2572
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBBcHJpbCA3LCAyMDIyIDU6MjggUE0NCj4gDQo+IElmIGdldF9pb21tdV9kb21pZCgpIGluIGRv
bWFpbl9jb250ZXh0X3VubWFwX29uZSgpIGZhaWxzLCB3ZSBiZXR0ZXINCj4gd291bGRuJ3QgY2xl
YXIgdGhlIGNvbnRleHQgZW50cnkgaW4gdGhlIGZpcnN0IHBsYWNlLCBhcyB3ZSdyZSB0aGVuIHVu
YWJsZQ0KPiB0byBpc3N1ZSB0aGUgY29ycmVzcG9uZGluZyBmbHVzaC4gSG93ZXZlciwgd2UgaGF2
ZSBubyBuZWVkIHRvIGxvb2sgdXAgdGhlDQo+IERJRCBpbiB0aGUgZmlyc3QgcGxhY2U6IFdoYXQg
bmVlZHMgZmx1c2hpbmcgaXMgdmVyeSBzcGVjaWZpY2FsbHkgdGhlIERJRA0KPiB0aGF0IHdhcyBp
biB0aGUgY29udGV4dCBlbnRyeSBiZWZvcmUgb3VyIGNsZWFyaW5nIG9mIGl0Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1i
eTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IFRoaXMgKGFu
IGludGVuZGVkIGZvbGxvdy11cCB0byBYU0EtMzk5KSBpcyBhY3R1YWxseSBhIHByZXJlcSB0byB3
aGF0IHdhcw0KPiBjYWxsZWQgcGF0Y2ggMSBzbyBmYXIgaW4gdGhpcyBzZXJpZXMuDQo+IA0KPiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMTgzMCwxOCArMTgzMCwxMiBAQCBp
bnQgZG9tYWluX2NvbnRleHRfdW5tYXBfb25lKA0KPiAgICAgICAgICByZXR1cm4gMDsNCj4gICAg
ICB9DQo+IA0KPiArICAgIGlvbW11X2RvbWlkID0gY29udGV4dF9kb21haW5faWQoKmNvbnRleHQp
Ow0KPiArDQo+ICAgICAgY29udGV4dF9jbGVhcl9wcmVzZW50KCpjb250ZXh0KTsNCj4gICAgICBj
b250ZXh0X2NsZWFyX2VudHJ5KCpjb250ZXh0KTsNCj4gICAgICBpb21tdV9zeW5jX2NhY2hlKGNv
bnRleHQsIHNpemVvZihzdHJ1Y3QgY29udGV4dF9lbnRyeSkpOw0KPiANCj4gLSAgICBpb21tdV9k
b21pZCA9IGdldF9pb21tdV9kaWQoZG9taWQsIGlvbW11LCAhZG9tYWluLT5pc19keWluZyk7DQo+
IC0gICAgaWYgKCBpb21tdV9kb21pZCA9PSAtMSApDQo+IC0gICAgew0KPiAtICAgICAgICBzcGlu
X3VubG9jaygmaW9tbXUtPmxvY2spOw0KPiAtICAgICAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2Uo
Y29udGV4dF9lbnRyaWVzKTsNCj4gLSAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IC0gICAgfQ0K
PiAtDQo+ICAgICAgcmMgPSBpb21tdV9mbHVzaF9jb250ZXh0X2RldmljZShpb21tdSwgaW9tbXVf
ZG9taWQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfQkRGMihi
dXMsIGRldmZuKSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERNQV9D
Q01EX01BU0tfTk9CSVQsIDApOw0KDQo=

