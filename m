Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0968252D567
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332992.556764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrggc-0007VC-QM; Thu, 19 May 2022 13:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332992.556764; Thu, 19 May 2022 13:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrggc-0007S9-N4; Thu, 19 May 2022 13:59:30 +0000
Received: by outflank-mailman (input) for mailman id 332992;
 Thu, 19 May 2022 13:59:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q20b=V3=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nrgga-0007S3-D6
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 13:59:29 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e23af36c-d77b-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 15:59:24 +0200 (CEST)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 06:59:20 -0700
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 19 May 2022 06:59:20 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 06:59:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 06:59:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 19 May 2022 06:59:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 19 May 2022 06:59:19 -0700
Received: from CY4PR11MB0056.namprd11.prod.outlook.com (2603:10b6:910:7c::30)
 by BN6PR11MB1939.namprd11.prod.outlook.com (2603:10b6:404:ff::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 13:59:16 +0000
Received: from CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::181f:ef86:8705:bd1f]) by CY4PR11MB0056.namprd11.prod.outlook.com
 ([fe80::181f:ef86:8705:bd1f%7]) with mapi id 15.20.5250.018; Thu, 19 May 2022
 13:59:16 +0000
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
X-Inumbo-ID: e23af36c-d77b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652968764; x=1684504764;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Tt4HgQwb3iIBbOJi3FOSUT1ONHQlUSSv9LGRFWKTg7Q=;
  b=iSLlbsGjICcFCHu7s2GZ0E+lFJ9cJ0eWHB32GeR79/TcrUSK+p83KZ5A
   UPCFn2HmpOGQ65YGWghrSULyCGeMcuMy4OgyT8SDro5w482cYZZBPvh2G
   77JQv/m3LXS03/Vg5Aia0gPwGsugy7mf+OBbCd3Gsuo9tqP01BKQyp+lA
   IjOwTmh63wJW9qBLacu6lsXAemZJz0T9HZYP1PQsnEu/4GrxHVSG29JKB
   Ws6Gi3d8inSr2yaygxUy0A+vI7ZLlo4ClSc8Ih/3DWp0p0nXjZzPNNAv0
   eBskPRn/Z7949lNS/x6swmT0oNIAx2m5sF1VXq7NwrfIsR0jZVmtal76J
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="269800383"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="269800383"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="639796476"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpcJX6mMSrY3F3DsTg1fsoCWoDMV/zZ8yi50ASi5HbA+Sknt0sr0CUsX9lO8I7QXWYtF5KCBG2WDhWrOWB3AovyUdbGCfDBXXFxkdwQ3PSyzHszGg0tq24kBBRKsc6w8jDLzzWHyja+SGRAxpU2GUJqzVWD1phu4BZ3MBVFY37Z0a6mI5X8sK4SrtlCe7s8H8nN/3kolRdo+G5gjRoPxBMEp8yeK/Wl5WJdSWpV1m9Tjntq21qA+Qx+ML9OSjTX6NjcZP1FiLgObFaeTydYGtfcPQ7reX9l9zCmyQLyhhM1e4RCCcude90DglfvQVH9PXoSQUEF6F+71+Qs+G3LN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tt4HgQwb3iIBbOJi3FOSUT1ONHQlUSSv9LGRFWKTg7Q=;
 b=U5+GsS3iAwyhC3AAcYLyzm5Ww5T17m71Iq/fhTdCBJ8t8xedlNpJIsC9B7JrY2WqXstRxNdkq8z1igDNHHXCY01uccM3Y1zn1ML9+pwrur4dOFDbHMBSETGCCTizn2lUHePbWcN34WtKyJCIcwlYqpAVAeRZIZwkwtBawPVlAAH7swl2uz/sX+j0Mo/vve3xr9EhkhECUKUCqTLhY4xiUDS8t+2pcQzStNFnuqmlzYmES5lpFnUxunPro2TogRoiWwJLiTBZ4kHA9QVubNYftQHXcBdtYZDo/JNLTqXkzMo2JsMTa4DTP4h+emqxgvzvrSfU+VLZMCZh2bTvNwfUHQ==
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
Thread-Index: AQHYa4RIF+g6mxBRRU+cd4s+ndSX+a0mMskAgAAGnRA=
Date: Thu, 19 May 2022 13:59:16 +0000
Message-ID: <CY4PR11MB0056943EA3C905629887A4E3FBD09@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <5c72f793978997970888254a9050e97b34cbb3c7.1652966447.git.tamas.lengyel@intel.com>
 <9b3c46f8-737b-b145-4abf-a08b34d4e932@suse.com>
In-Reply-To: <9b3c46f8-737b-b145-4abf-a08b34d4e932@suse.com>
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
x-ms-office365-filtering-correlation-id: fd8fab01-c21a-495e-dde7-08da399fc372
x-ms-traffictypediagnostic: BN6PR11MB1939:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB19398C229CF076F9F92E9ED0FBD09@BN6PR11MB1939.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pFfSuydxRL4ve+kpK6p0apdcf7q03rXlyj5KzAn1HoEGp3A0c5SkI7469CSMxrBw4GSSdGMMpPzH8OoD4hW6XcWhnjLW7X9FHHp88oalEzLsN2A+ZYet8ha/j7vZBDW2yBxeCOcW67NySENBEfb0e4ilcJW77C7hVf4GVed1T1iWIYE0qc0ld3NqkzSM7NTz0Yvbs78mo4s+2Zcnk3SVfB7VHKm7vjcYwHELio4maeo+0flwSaXFZ/s2d8wm6rvTl+ohWtgkaYPJucAuJ6e1yh74GLA1LgkeUUr0iBs2xc501SQXX9ypg5DyvQfRZtk3QZ7OfGmE1BIVaKsp2s0dmMswRWx0UfrnF3JUzbK62hwdwzLmFOs3Y0c913rX7UPOanPzmFt2ayDU4fyoZ+9Av5ctqP5MDNyGMG+AT97lGWAydWs2RcmE7S8WVp5hYtJU1paOqqTPhmaPfyOSgqDIeXexUclAAFwqPU9BLVEgrrqfJpRS3Io/bnIlMnw1Ag/CWu3YTVG/gHVvCqzASvfqtoWbkSfsZQ2+ef2XD07shZ7dW4NxWOBieGLjs9JrlkAuMmFJHUpseFmv+J4e4srCJOCNtLqJ7Gz/FoP+u/g2Gi8gheTqkxY1VBfWFkYHJmyymAOJtnxvUOgvclCLVaW4+Ig1ejBouS4lLMcuTkXVswiVnpYiU1xVXWlR7ON184bxR1cyzR5EWdcC8HmB79v9YQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0056.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(186003)(8676002)(316002)(6506007)(4326008)(7696005)(33656002)(8936002)(52536014)(9686003)(26005)(53546011)(66476007)(66446008)(64756008)(55016003)(54906003)(5660300002)(508600001)(38070700005)(38100700002)(110136005)(66946007)(76116006)(66556008)(122000001)(82960400001)(86362001)(2906002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YURmVm8wVFF1aHdHWjRtOU4zQ1ZmeXB6ODNaY1BXYVFWNmcraFhoYmU4NGZ3?=
 =?utf-8?B?K29uSVRTVytRcXMxT3hKQmNaQWptb3Z6S05YK2RKdldqeEFNRjRGa1lOVHlj?=
 =?utf-8?B?dEdmVEtINk5ZbktMNlB5U0pGeHFXZi9xSkdGa2pTSkFxaWZDOEtKMzBSM0I3?=
 =?utf-8?B?STRhM2kvTzFGaVhoNUNXSzA2V3RwaWxyRTI2aTRFOElyZDlVRFRGR3NZRnhX?=
 =?utf-8?B?eFRNWGJEN0ZoR09iOUhsczFPWWU0RjNMeHdnaVhhMkNWL1QrU2RYbTQxZlVp?=
 =?utf-8?B?cGVoMDN3aWtxbi9SVkRWaE1yUXNENnc4aTRPTUp5WWthMmJlam1lLzhWQmtW?=
 =?utf-8?B?bmVsN1g3V3lDeS8wSW1RMVllNWZ6OWplR2FHQ3dRQUZ5K1lmamw0czBJWXEr?=
 =?utf-8?B?Y1RIdmxpaytVb1ZuVDQ1bjJzNDVGd0JIQkdsYzlOeDN4enVuTGFUaXVOTG1u?=
 =?utf-8?B?V0NadFkrazVSSXgyR1hVUGZmanlOeFdFY2Y5SGZrelhmbmlYdlJIQ2xpcklr?=
 =?utf-8?B?Z0ZWOU5sNkFxcDFiMS9JU2JteDVqaVdRWnFtcThBcVAxWm5Ra2JZcFVldjV6?=
 =?utf-8?B?bVQ0WkdyNCtZeGZoVjhtSVJtVnJ0MEN3c3dJVStvcHJtRUZoSkNIODY3QVBJ?=
 =?utf-8?B?WmxZS3llZmxnMWdvL3NoZU91am1WanRRbk8xL3Z3a2ZoRkFEd3FhVlhuTXMy?=
 =?utf-8?B?TytOSWszYmszbDM4UHpvbTZ3eEZycllwNmdHR3VCUGVkK1Y2dkh3NkphR05t?=
 =?utf-8?B?enhHUmxFVkNGYUZrYzFoeTlNRDlZQWN5dHVjNWRVdVBxZ1FLUWdtOCtlY0Jk?=
 =?utf-8?B?aDZUSHFQZXlVNGx3K1VaL1JBaHVZbFViQmZrWVRPckQ5T3Z0Y1JKNDNjd1lM?=
 =?utf-8?B?WGpQUFJjVzQxVXZaazlFME5wSkN3ci9BK21jWU1JV2JzejhodzRaSmZVc3Rp?=
 =?utf-8?B?aVU3NjZoTWpEQVc3NnpLVGR6L3lmbXJwV2FOK1E1QVRVd0kzU3dyc2tVTEI3?=
 =?utf-8?B?WjRBR3Q3NThYL0h4VFhlOVlWT1JQRVl6dkQxMWhhbVpacllvNXk4YWUxQ0Vt?=
 =?utf-8?B?Q0NFb3pzN2krWU15ckw2ZXpJVlRYVmJYZEdBM0tNamlaSEh3ckdnU1FVYjll?=
 =?utf-8?B?aUp6OENJWXpaOU1TcEp0anB6VkZDSmR1SVBMMThvSDBKTjI4YmROWjNWZ1lX?=
 =?utf-8?B?VEtMNnROTnZManhhMVp5WnFFZVBKRTVUTWpCSGQrT1dvSXY5WlM2UTFVMnRM?=
 =?utf-8?B?T2xPSjV3bnptd2lEaG0xTnFGOG1sZnJBMDVhVk91dEZTSU9kMlRXbEdoZ2VO?=
 =?utf-8?B?V2wxcis1aGJXTkRXdE9SZEFhanZuQUNJY0puanNrWHB6dmZZazR1NUhvSEdj?=
 =?utf-8?B?V2lXY2VjNGJJVHJ6bzI5TGllU3I3cm5zNU5GUkk2bVVqbnV1VkVkQmc0cUxB?=
 =?utf-8?B?Q05MSGhmOUlZbmtUZEFIUFVrNlY3RzFSVllDUkU5Z1JWQk5QRFBCM013UUtU?=
 =?utf-8?B?ZHR0UXl2KzNibHdCS09RNElzbk55TTZGL3Jud1JqSC8ydmx0a1hhWDYzSWhL?=
 =?utf-8?B?MHdMa1JQUU92eHVyRmxkK3BmQk8zbjZ5cXNrdk1hTDhsZSsyZWxFZElGdnkx?=
 =?utf-8?B?WjJPWHREaVdGREkrM01zSTVHYkFxaTVaMHhPbmpObzV0R01Kc1VzQVROUkVr?=
 =?utf-8?B?aG5MaW1DTVVDdnZIaW9FTWcyaU9LM0JPdnZWeUNDVUx3TGxJaEErejdMclU2?=
 =?utf-8?B?TzJjbmZqa2NncTNlUDdEMXF6eUJEZTVLU0dTL0FQYTJMMmVIdlV1dHRKSith?=
 =?utf-8?B?LzZSb2IxZHcvYlJ2blhnMUtqT2pnWEh0RmdYN2tWeW52UFJtSkVOcWVkb2pn?=
 =?utf-8?B?RzN2cnpFOUhJbGtlRHhSY2I1T3NHTG1UQXA5djcxZVB5MG9aQ2xwSG5JZ1dU?=
 =?utf-8?B?Wjhjc1ViSnJ0WVMyNGlsZFdkZFIxK1RkdDBPbGtnOU8xaTl5Nk1yTnRwTmdQ?=
 =?utf-8?B?SFBMaHBITXIyUzYwZnhOWGpGZldEMkREb3AvT0dZd0V5aktjdCtua3YrLzFx?=
 =?utf-8?B?bUsrVURBZm1JcjQxamJFY1hYN05lLytVZjdMUHhIakZYenE2Yk1LU0dSWVZT?=
 =?utf-8?B?eHA3ZmRibTBxd3B5eW1KQW9BK0tWbDhMUDREK3BvWWpaNExBT0lYUkNSQTNn?=
 =?utf-8?B?SGJKbGUzMVh5UWJnSGxlYkk1QWw5cGduRTVpQUpsTkoxUi9SSHlqdlE1cFdj?=
 =?utf-8?B?ZkZ2WTVzK2NQMW9PL0pxUnp6eDl4Vi96S2lKd0lJdFA5R1RRNGNUeDlXZHhs?=
 =?utf-8?B?NFdCODQyZ3hjaFRPMmtGRkxWQS9HT1BMcXQ3TDlpSElhOXlEdEs2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8fab01-c21a-495e-dde7-08da399fc372
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 13:59:16.7546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2rfXx3c4yu+A2E/fHN+0CrcSElnYbQjrgStaz90CwGqt1zS6eSNpxtltnqjozAtay0KjA2BzpR/micEmHmywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1939
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEp1ZXJn
ZW4gR3Jvc3MNCj4gU2VudDogVGh1cnNkYXksIE1heSAxOSwgMjAyMiA5OjMzIEFNDQo+IFRvOiBM
ZW5neWVsLCBUYW1hcyA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47DQo+IENvb3BlciwgQW5kcmV3IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB0b29scy9saWJzL2N0
cmw6IGFkZCBhbmQgZXhwb3J0IHhjX21lbW9yeV9vcA0KPiANCj4gT24gMTkuMDUuMjIgMTU6Mjcs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gPiBBZGQgYW5kIGV4cG9ydCB4Y19tZW1vcnlfb3Ag
c28gdGhhdCBkb19tZW1vcnlfb3AgY2FuIGJlIHVzZWQgYnkgdG9vbHMNCj4gPiBsaW5raW5nIHdp
dGggbGlieGMuIFRoaXMgaXMgZWZmZWN0aXZlbHkgaW4gdGhlIHNhbWUgc3Bpcml0IGFzIHRoZQ0K
PiA+IGV4aXN0aW5nIHhjX2RvbWN0bCBhbmQgeGNfc3lzY3RsIGZ1bmN0aW9ucywgd2hpY2ggYXJl
IGFscmVhZHkgZXhwb3J0ZWQuDQo+ID4NCj4gPiBJbiB0aGlzIHBhdGNoIHdlIG1vdmUgZG9fbWVt
b3J5X29wIGludG8geGNfcHJpdmF0ZS5oIGFzIGEgc3RhdGljDQo+ID4gaW5saW5lIGZ1bmN0aW9u
IGFuZCBjb252ZXJ0IGl0cyAnY21kJyBpbnB1dCBmcm9tIGludCB0byB1bnNpZ25lZCBpbnQNCj4g
PiB0byBhY2N1cmF0ZWx5IHJlZmxlY3Qgd2hhdCB0aGUgaHlwZXJ2aXNvciBleHBlY3RzLiBObyBv
dGhlciBjaGFuZ2VzIGFyZSBtYWRlDQo+IHRvIHRoZSBmdW5jdGlvbi4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gICB0b29scy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgIHwgIDEgKw0KPiA+ICAgdG9v
bHMvbGlicy9jdHJsL3hjX3ByaXZhdGUuYyB8IDYzICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiA+ICAgdG9vbHMvbGlicy9jdHJsL3hjX3ByaXZhdGUuaCB8IDU4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCA2MyBp
bnNlcnRpb25zKCspLCA1OSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90b29s
cy9pbmNsdWRlL3hlbmN0cmwuaCBiL3Rvb2xzL2luY2x1ZGUveGVuY3RybC5oIGluZGV4DQo+ID4g
OTViZDVlY2E2Ny4uNDg0ZTM1NDQxMiAxMDA2NDQNCj4gPiAtLS0gYS90b29scy9pbmNsdWRlL3hl
bmN0cmwuaA0KPiA+ICsrKyBiL3Rvb2xzL2luY2x1ZGUveGVuY3RybC5oDQo+ID4gQEAgLTE1OTcs
NiArMTU5Nyw3IEBAIGludCB4Y192bXRyYWNlX3NldF9vcHRpb24oeGNfaW50ZXJmYWNlICp4Y2gs
DQo+ID4gdWludDMyX3QgZG9taWQsDQo+ID4NCj4gPiAgIGludCB4Y19kb21jdGwoeGNfaW50ZXJm
YWNlICp4Y2gsIHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwpOw0KPiA+ICAgaW50IHhjX3N5c2N0
bCh4Y19pbnRlcmZhY2UgKnhjaCwgc3RydWN0IHhlbl9zeXNjdGwgKnN5c2N0bCk7DQo+ID4gK2xv
bmcgeGNfbWVtb3J5X29wKHhjX2ludGVyZmFjZSAqeGNoLCB1bnNpZ25lZCBpbnQgY21kLCB2b2lk
ICphcmcsDQo+ID4gK3NpemVfdCBsZW4pOw0KPiA+DQo+ID4gICBpbnQgeGNfdmVyc2lvbih4Y19p
bnRlcmZhY2UgKnhjaCwgaW50IGNtZCwgdm9pZCAqYXJnKTsNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS90b29scy9saWJzL2N0cmwveGNfcHJpdmF0ZS5jDQo+ID4gYi90b29scy9saWJzL2N0cmwveGNf
cHJpdmF0ZS5jIGluZGV4IGMwNDIyNjYyZjAuLjZhMjQ3ZDJiMWYgMTAwNjQ0DQo+ID4gLS0tIGEv
dG9vbHMvbGlicy9jdHJsL3hjX3ByaXZhdGUuYw0KPiA+ICsrKyBiL3Rvb2xzL2xpYnMvY3RybC94
Y19wcml2YXRlLmMNCj4gPiBAQCAtMzI2LDY0ICszMjYsNiBAQCBpbnQgeGNfZmx1c2hfbW11X3Vw
ZGF0ZXMoeGNfaW50ZXJmYWNlICp4Y2gsIHN0cnVjdA0KPiB4Y19tbXUgKm1tdSkNCj4gPiAgICAg
ICByZXR1cm4gZmx1c2hfbW11X3VwZGF0ZXMoeGNoLCBtbXUpOw0KPiA+ICAgfQ0KPiA+DQo+ID4g
LWxvbmcgZG9fbWVtb3J5X29wKHhjX2ludGVyZmFjZSAqeGNoLCBpbnQgY21kLCB2b2lkICphcmcs
IHNpemVfdCBsZW4pDQo+IA0KPiBXaHkgZG9uJ3QgeW91IGp1c3QgcmVuYW1lIHRoaXMgZnVuY3Rp
b24gYW5kIG1vZGlmeSB0aGUgdXNlcnMgdG8gdXNlIHRoZSBuZXcNCj4gbmFtZT8NCg0KRm9yIHR3
byByZWFzb25zOg0KMSkgaGF2aW5nIHRoZSBkb19tZW1vcnlfb3AgYXMgYSBzdGF0aWMgaW5saW5l
IGlzIGNvbnNpc3RlbnQgd2l0aCBob3cgZG9fZG9tY3RsIGFuZCBkb19zeXNjdGwgYXJlIGltcGxl
bWVudGVkLCBzbyBsb2dpY2FsbHkgdGhhdCdzIHdoYXQgSSB3b3VsZCBleHBlY3QgdG8gc2VlIGZv
ciB0aGUgbWVtb3J5X29wIGh5cGVyY2FsbCBhcyB3ZWxsLg0KMikgdGhlIHBhdGNoIGl0c2VsZiBp
cyBjbGVhbmVyIGJlY2F1c2UgdGhlcmUgaXMgbm8gY2h1cm4gaW4gYWxsIHRoZSBmaWxlcyB0aGF0
IHByZXZpb3VzbHkgY2FsbGVkIGRvX21lbW9yeV9vcC4NCg0KVGFtYXMNCg==

