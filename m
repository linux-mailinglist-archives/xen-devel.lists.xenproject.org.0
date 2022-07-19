Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407C5794D0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 10:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370475.602258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDiCw-00063Q-QL; Tue, 19 Jul 2022 08:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370475.602258; Tue, 19 Jul 2022 08:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDiCw-00060w-N9; Tue, 19 Jul 2022 08:03:54 +0000
Received: by outflank-mailman (input) for mailman id 370475;
 Tue, 19 Jul 2022 08:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3/S=XY=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1oDiCv-00060p-1X
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 08:03:53 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 515ea7c0-0739-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 10:03:49 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 01:03:47 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 19 Jul 2022 01:03:47 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 19 Jul 2022 01:03:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Jul 2022 01:03:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Jul 2022 01:03:46 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB1364.namprd11.prod.outlook.com (2603:10b6:404:48::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Tue, 19 Jul
 2022 08:03:43 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 08:03:43 +0000
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
X-Inumbo-ID: 515ea7c0-0739-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658217830; x=1689753830;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uaihzsmynefoCVA7HkcZN6dgUgOF1fJkgG2oIsBmMds=;
  b=byVtQFFS0ZB0WfN2EUzDZw5s9S/UykzvXQCYdgePxXCFzjGFY1X89WsT
   aaRxjfYWD1/CfD8PBPaODWA1cMt7XnkuBCknRFKL0DfC1YQlNtllvAEov
   fBgEh2f14jAFSVFHOtge342b4ZErURpDiYJda+Yg8YdIinXUSgYlZIm8H
   2LyW4fy0CjSwnQ5Stn1oC+6Dyv1d7YT6uXLzon7e239aaqC2ydsbAOUMq
   ncj0iXopguGo63ehc7shRpeoH//bX7otgu4pXWwXVxqvEON8sFjbnnhIU
   AN/TZzf0lris+Q4V5GFm8dTDLgD4yqIzSmbBkDlRuB47YnD23FMygTrbN
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="283989162"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="283989162"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="572749740"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkVFwMjngpt1YGBirgk+1ntGL5QCk52tmUmbPLc2TetUd2qVW4J5EDgXz/mHH8u3cabgP0HeGTYAZ+USg9DEXkBE7mnD9GvDT5a6gse1h0QqWWG/Uulm+W3EDouVHcTBCb6ZHX9maO2YntLzOECHBe/gse2bXt6nGm6d3Qovw+FpZ8KRCd4OaXhy9T2bT/knxrtbUCUHGZrl2bDn1g5vA4IWQp2gNrEnuXQpuBr2j19FFgMVLoo8d3ih985elAfxKspGcHPyh7SfwkMzlACR+sQRImuuwtbOyvzwJFU+iEnDM2i8D6sU8FeLAqyXYX20yHRxRGLnwZtFwXsOcH6cmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaihzsmynefoCVA7HkcZN6dgUgOF1fJkgG2oIsBmMds=;
 b=OPyKaExDCHqunmqVmFocT7kLaYOVfeDJ5FbEFonjisB9fUVgYJqDeESugi2bvOPB5oPq6iqpHMKZARTg7a0U3lmRY5/KKrbVhCz/ujmSPTwlNbNGD2SihOjssDSdqjb4S7Bal/ZIi0JtGL78zgHOGwAj4sp/W7qxg9d+AhAasfmIyUzIpsr70KSc633SIoCoOepL/7igXzXcUSdTbd02UAzk6L2RHso5eKK3jUWELtg45S/hTagj6r0J9ssVt5MtKXN1IBFcqQ5cXYh1QIZSaCfGOqfuUkSL3msMiv/JdN5nsYh1Lwo+3ZRsEfMF52LRObWKNZsinqpcscwOpBDROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Cooper,
 Andrew" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "Beulich, Jan" <JBeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH v3 3/3] x86/vmx: implement Notify VM Exit
Thread-Topic: [PATCH v3 3/3] x86/vmx: implement Notify VM Exit
Thread-Index: AQHYjUz0v2qm7nHLtEKNiFhvlgtrma2FaavQ
Date: Tue, 19 Jul 2022 08:03:43 +0000
Message-ID: <BN9PR11MB5276488B247996D0C20280AD8C8F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220701131648.34292-1-roger.pau@citrix.com>
 <20220701131648.34292-4-roger.pau@citrix.com>
In-Reply-To: <20220701131648.34292-4-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 792d2027-d897-4260-503a-08da695d3320
x-ms-traffictypediagnostic: BN6PR11MB1364:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FAxvvtq3/p39kuEb/0GpP/BHsPEOePC0u9KawYiiqFyaco689sRNOEzJCfitGoLc9CsNJmpcbJP/rkZy2XooaaphANH0rRlvgYPtFakUqLR81T4w+FC/IRfkXFiBzPY0p2DwuQhQuCNN3603R2ljQQW0Uj9C9+IS+AFyBtG5S72lYA/EgK46EvB8kMySvWfFMKOpzSFNRk1sEJQRODezGuWklW1tFUyLxDAb/JsD5qmbYcxp2WrIOaC7WdBzHsbOJ//V8ysaHRpJ85rUPxFa9QRhay00BaVqW70nK71VrRgFvmpom7VD296GUFEf1B3MI2q2ka9sJEXABO522fMb1LXEnxIxnhGHbKe26sVeyTcg6dryFDqdMKg21+5fGxBVc0t5drvVeWir1ztFeckIDo1rULBO8KBYqT86Q2jhR/bz70D0ac2TBQaOSko5VYaGc+WH/USRoNTw/9KdoyhAuxh8Z3DMor1ea0frXs+4ZUSUUNBq+HShghoT7ZefxHfXYP1LmgRHPRx4jo9Jmc61W8YDs9FL2IZitxKnz5xia3Np/Z/rLtLoF+htOo1t2sh2e/2NPbhyFooKZobuKLqfnrclk0I+EwOeFB2ArU5vY1QofTI0lN2L1RLe1po4JCG4HVBuhfFBaLwUMvDhcFxlNl7ghoam/itYQdY6BtupT3aq4+3Sor5UbCSNf8+QFiwLbpLNMkxR3lnWDQEkxxfKIA0EzB2AefDzsaJJyyxCIKRQVZ4DsKzCNaPMb/QBJo4JCXlSChMrzl2wAnRsTTDUzClteIpFA+vr9VgBMvLeRWevhvcl+97txQA5nBmkSar7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(76116006)(66446008)(66556008)(66476007)(4326008)(52536014)(8676002)(64756008)(66946007)(8936002)(478600001)(110136005)(71200400001)(38070700005)(5660300002)(33656002)(38100700002)(316002)(82960400001)(122000001)(86362001)(186003)(41300700001)(26005)(7696005)(9686003)(107886003)(6506007)(54906003)(4744005)(2906002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlJwT1gvMWhiZHVuTGx0OGNSbnJ5clRVdk9HRFpkTmpiV1FSR05vTDN5VlI2?=
 =?utf-8?B?ZnhVUFk5Y3pQRFNOM3VWM1lPWmQ0dnRaanhhREdZNGdFYlpGdXB5L1Zxbys0?=
 =?utf-8?B?S2ZxTUJobUNOT0h5RW9HanNxcWRzWlcrYVM0Ym9IZ3k5ZWZkVUZDeTkyV0lC?=
 =?utf-8?B?M0VKUEFvRHg1dUZ0QVJtT2lIRG1YZTVsTmEyZjVlUkwzVkx2aEhMV0dqVkRK?=
 =?utf-8?B?bmhRK2M1TzNWTmQ1Yy85WWIyTzBzc2RORTJXQjJEMC8ybjhYeEE1Ym13QnV5?=
 =?utf-8?B?a3RCMTl4N0JBMlo0Ynl3dll2ZnF4M25RTG9pS25HZkJiUlpMQlVGSmRrRkZJ?=
 =?utf-8?B?MVZQY3UrTVdjRndIR0l1Uk5rM1BSM28rbVVlQUkzY0xMei9sQVNmbXlhd0N0?=
 =?utf-8?B?cy91L1VaenZ3U3RaMnl1Sit4Slc2QzlVa1JQTWJxTE8wc09kUlNmTGovd2dt?=
 =?utf-8?B?eS9sSThrbndHQVo0THRJdGJma1cxMzN5MWpNVmo0QmIrM1p6MnlpMmRWelFz?=
 =?utf-8?B?VlppZWwzUVNnc21sL1VLd25ZaEFjMC9BbGcveXlhSlMyaU5xN3E5bVFMcGZw?=
 =?utf-8?B?UFQ3Qlo2Vi9LSUZpd1ljalJ2NFpEMnNCcjMzZEc4VTZnSW9YaHp0VkFmRmR4?=
 =?utf-8?B?a3NoWnhUS1g2U3gxS29BMllUOU56K2FGeDJ3bW5Hd1RXaFMwSTNFWVJrVzQ3?=
 =?utf-8?B?Skk0UVg2cENaZmJCOUFPQkxaNng3UGphN3JVZm1RclNpc2twU29vOFdwUlE5?=
 =?utf-8?B?L3RRWVZuQWVIRjgwUWtOYVlQajh4WlpRRW9zTEFyRk90KzRrV3gzOUl4RU0r?=
 =?utf-8?B?eUJVdTRKYTBMKzh4Si9uN0dzN29qTkMwTDBFVXNaRUFDdHdRYThFUkNCMDBR?=
 =?utf-8?B?L0ZsTSt4VHg2eVkxOHNvcjl6K2VtekMvVmRrdUdtcit3alo5RU9ncnRWd2o2?=
 =?utf-8?B?U2hLbCsyZGN1TlVXd0tMRkduSytEVXRrY3l2TlJRdDNpY3NkUGpIU3hkQU9S?=
 =?utf-8?B?S0NEdkE0aHNCL1hrMGExd2xLOGc4cTFMUUE2RFBQTGZGanI2OG9WQkFDTlFV?=
 =?utf-8?B?UURsdkN3UTJKYmxJTlFFSHFGTGxCZ09HbUFIUzJXT2ZjU0puNy9pbnlGNDlR?=
 =?utf-8?B?VnRtL0tMV0E5NTBwRWgwb1oxR1padHNsRmcwMUMzRndBQkFFTC84T09aRTJn?=
 =?utf-8?B?dm16ODJoa0ZRL2VsNkg3QVZaVmpxVkRGenB1MytVTjBlVXhiVzhHK1BWNk9w?=
 =?utf-8?B?RkNFb2cxRzZQSTljeVh1d2RZSmpjNUVEVHd6d0orMFUvVHNBeDR6blQvVERn?=
 =?utf-8?B?WTdkUWNHVDNtazV0UU5MQk9wQVc3OWZCV0F3b0IrU1ZvUGVvcmtNazUrZnlV?=
 =?utf-8?B?U0pab2krc1hwOE1GVi9BSVJXVnMzZEFxL0lrelVaWjlXbXlqbmE5MHI2WkdF?=
 =?utf-8?B?VTBtd2I2dmhlT3NWZnkxanJ5b1dGYkRDaHJEK043ZDZxWTJPSExaUDBJbHVI?=
 =?utf-8?B?TCszNSs2b3V1WHhBVU1vWTlmRDlwMzVCbGlWTjgwazZHQW83SUlwWGN2UWlz?=
 =?utf-8?B?NHVNSmcwdjVlNFV2L2dMVkFaVUMwbzBBbThJODFzV0dFQW5Ob0NEUDd3UE9W?=
 =?utf-8?B?cnIzakc3TUIrZ0NFS0xWcFZURHU4aDJXemVDR01zMG1BS2FZWXJYaU9WMThp?=
 =?utf-8?B?VUpQU2swRDdJdjNSYVJ6bEtWaHQ5ZGpZUUY4am4vQTRkUEREaGV4dlRUOG5H?=
 =?utf-8?B?K045aFlscmg2cXc0dkVKTkhqTGFVSGNyazZPNUVYeFRvWUt1eEtQQmI3WFFk?=
 =?utf-8?B?SWo3dmpiLzc3RXUzOVJrczBpNGVPYVJ3RGNTay9pQXhhYVdFTXcrOHpwUlZw?=
 =?utf-8?B?S1ZCY1F1UENJQWVlTC9aMFVvZzd4NjR1VHJyMTE2S0IwdDhMUll3NEZLSVJh?=
 =?utf-8?B?ZEsrc0krdWJDRkpWVW04dzRQcjNFM1dSR2kwSlJEeUtUQmMvTVZiekhaNkpM?=
 =?utf-8?B?YS8rUVdDZkRuSGhSSmk2Q3d5SURadzRpNWRKamZjbCtFMjJYeGxXUWtxUU1B?=
 =?utf-8?B?MFNtdDNxUlZzK1ZKUE9QZnlaQVg3VUJRRUdzVC85SEpNZjJIU0lERDVOYklK?=
 =?utf-8?Q?7uc9vu7DtJDfz6u4ahyenFzv+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792d2027-d897-4260-503a-08da695d3320
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 08:03:43.6664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qnyJ4HTAveSomi8Ck/xWcp1+b4KWx83++FXO9ffQgQdpP/4nV6RuOZ7YOfEdzGCRPc243PPi/rqzBsaPIz7FbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1364
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBG
cmlkYXksIEp1bHkgMSwgMjAyMiA5OjE3IFBNDQo+IEBAIC00NTg5LDYgKzQ2MDEsMjIgQEAgdm9p
ZCB2bXhfdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MNCj4gKnJlZ3MpDQo+ICAg
ICAgICAgICAqLw0KPiAgICAgICAgICBicmVhazsNCj4gDQo+ICsgICAgY2FzZSBFWElUX1JFQVNP
Tl9OT1RJRlk6DQo+ICsgICAgICAgIF9fdm1yZWFkKEVYSVRfUVVBTElGSUNBVElPTiwgJmV4aXRf
cXVhbGlmaWNhdGlvbik7DQo+ICsNCj4gKyAgICAgICAgaWYgKCBleGl0X3F1YWxpZmljYXRpb24g
JiBOT1RJRllfVk1fQ09OVEVYVF9JTlZBTElEICkNCj4gKyAgICAgICAgew0KDQoJaWYgKCB1bmxp
a2VseSgpICkNCg0KQXBhcnQgZnJvbSB0aGF0Og0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=

