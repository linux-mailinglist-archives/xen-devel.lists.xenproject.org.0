Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C021B68741F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 04:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488515.756629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNQZR-00019k-5U; Thu, 02 Feb 2023 03:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488515.756629; Thu, 02 Feb 2023 03:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNQZR-00016R-1J; Thu, 02 Feb 2023 03:47:33 +0000
Received: by outflank-mailman (input) for mailman id 488515;
 Thu, 02 Feb 2023 03:47:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1o19=56=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1pNQZO-00015z-SG
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 03:47:31 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e9d9d41-a2ac-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 04:47:28 +0100 (CET)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 19:47:15 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 01 Feb 2023 19:47:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 19:47:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 19:47:14 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 19:47:13 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 03:47:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%8]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 03:47:11 +0000
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
X-Inumbo-ID: 4e9d9d41-a2ac-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675309648; x=1706845648;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BE+zvSmVO6w/55TnSEmoRkCo49DJVphCeVu/vQLoedw=;
  b=barx7AsaHGQQTQGcj5O9hrd1UGVHjt6CXaGogYKW/cCj0+wDUWDUHIWP
   nlxbqTbVLFmnd6NOD1pmpvqBMeidS840POEIVtui15ZRQ7Kwl47tcLEWX
   DWE/Jyg2w55S45rxNU+jlAfHQiiqrKo5FoT2dL14Opg59PkvSvPtP2dtF
   AFyWmeheIxNPxiGtcwNbJTQHv1lfP+0r3CfspTX6uaHY/WwBPYy9u3mOi
   awqbr3WmsVaFjv4iAFXJJTw7DlaV7+YAZ87KdY2C+lLiwY8UFn1Co95E0
   iLSNRdhbE0Q3oriIdosvfQSEzkpYMBTc3Uraq1y1URnFQOqLYT4L2iAVV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414548889"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="414548889"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="697543012"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="697543012"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWAe8qafv9lh/kmrSXmGCPkPOYYmM9JRAZeSuaQGYBVeuU1h5NDJ/ym4/EEx09y6JrzlGlZti/AcVvoOzuneyI+9rEACjJoC0S7DveWp/juINwv7nTPjkuI+VFLyvRC6xPbaD+aRZSAEY83TtO1SOsr+CzPqrb9a/0uP96jUQ0pZpfWWt4PlEKtiuTihyr6m7NhMIquCDG0UTG9KK+rQFp7W7xMutKYkzTB6Q/2AyVAdpCIzGEVhQKHOaK91T2xxCPNo2IwIUrW8tR+jhaG3VwIG65qw5jzpDPSFt0LsRRlzGZ3IhAgtHJ0DWiBvKho99zluBSicNPVNDjV/vu2N0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE+zvSmVO6w/55TnSEmoRkCo49DJVphCeVu/vQLoedw=;
 b=b+Ob07ObT3VWL4Z9Pco2DLGvpuj7s63HwibTxGli0DSR0ZjlnoZdGHwcARvy030ukMG9thiBRUVK9jAAsV0PJMG69ogHqZ/tE2wPITf4smcoCh2/hHXVsJM7KOXjcgetaJK/Sqjsdhgdozs5HWQ7Ft/1AUuXUTtJkomvfCeaRj9gE3T3ae6ecmnynwyLlgINCjkLnm5c41tZInSx3XLgGK1X98fYZIABtjT/1hppgQjzHvSODh5hLhM2rtCrLpmtfymw7e3JSgSI0xpTmJr60J32Act/LzralmO+Y/0dqC9kfi3GJWgKWUr/tJGih44Thk7dn820R0w9c7smXCEjwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?=
	<roger.pau@citrix.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 2/5] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Thread-Topic: [PATCH v4 2/5] x86/iommu: make code addressing CVE-2011-1898 no
 VT-d specific
Thread-Index: AQHZL/FVJOdom3IWD0Wag5ryo7ERT665k35wgABMM4CAATJKcA==
Date: Thu, 2 Feb 2023 03:47:11 +0000
Message-ID: <BN9PR11MB527684E71102E3BF8C5AC9368CD69@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
 <20230124124142.38500-3-burzalodowa@gmail.com>
 <BN9PR11MB5276023EB640F1CE9DD72BEE8CD19@BN9PR11MB5276.namprd11.prod.outlook.com>
 <34649fa5-4676-1e45-e1cc-ea57d7027c5f@suse.com>
In-Reply-To: <34649fa5-4676-1e45-e1cc-ea57d7027c5f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB7091:EE_
x-ms-office365-filtering-correlation-id: be52e16a-b4d7-461a-a9ee-08db04d02a47
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ikKm38PK6HpSEQ0SwUav2FjBc5DPxaXXxENpaE8QtzVAvpjLEqwdrByrlFWhFEp6AffpdQ2MWnedPcpVkCGoxfzu2UFQKoyJndjiokhz4z/qplTUCZ5UELfaSf0iHp5XbtLjtRLp4s8MwJ7HoplesgTy79AJdOVMiKQwdlU7/f2kARmGQEbrz8Z6BE5S7kpLoA+jDBQ6wrmGoyeWbACHXnET5FUaVAk8NI8Y2qkuAhPArTgxkEyBL3GhapD5/C2toJsV7k83YgFh1Us3Ur6wyZ/KMzQDK3u4xSvj/2WUdCxHxWLmGwQR/XeqIGeoyVfXQvoihnwuV/9+TWcwi9c8qHw8Gy2OAUr/MIZ14kO1TktwN6metq4x60QyAXVy885W0P4oclzD4obwS944IfG/ny/Ffp9Ef1sQQPABHrBOUmusTy1UdxpYUYCeWBtWjChLNITiuDdPyx42MGYlCrNdl2p1ffGz8Q9AO/SjKVbKYfSgqgAwg1MgpV+/gv0HcB9p+GtOHrkHszVO016ZZ4d93ps8ZZOeGWBZZ2dFp0Lfcs3HrjFgMK77FTnMG+32spBMbZcIxa1JprLp+bgLNA5bq8CXfdwkchR9uQndhhWd6EulepkO2lJ8s5ZCt+GGMLFpE2VWY0kBofrcrza+8tTkdjjMfIgaO8uELUhvcgbHhiWGq705avENODGtctqrLS5RBBt5sxpjIdS8UwqOxTBYvg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(122000001)(33656002)(54906003)(71200400001)(316002)(83380400001)(2906002)(66556008)(38100700002)(82960400001)(66446008)(53546011)(64756008)(6916009)(66476007)(52536014)(6506007)(76116006)(478600001)(26005)(186003)(9686003)(55016003)(8676002)(86362001)(66946007)(8936002)(5660300002)(41300700001)(38070700005)(7696005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUtHZ3NkYzlGMXdyTmkrOW03RTVSZWduZGR6dk1jTlZNNXgzR2Q3Y21rWHFy?=
 =?utf-8?B?ZUZjNDVSRXR3SHBZNW1jQm9zeWZsbHRtWERKeTc4bnJNS29qU29wcmN6RnpC?=
 =?utf-8?B?UXVBbmVSS2hXeWlYRUxjNTI2cVJFWU8yanE4LzNoc3pSc0ZWdXZXcmtZc2dj?=
 =?utf-8?B?Z3FpQVk2QnBSSHdIMjEyd0FmR01VMXhWYk0za1JqWlJZcGUyZk9lamNwaUI2?=
 =?utf-8?B?dFlJbCtGWVAyQUdGckhrQ2xPRStRR1R1VjRNRWs2SHBwSEZFYTFBdXloMEhP?=
 =?utf-8?B?ZWJBdkpVU2lsUEp1OUZYa0VHeHNEQXlaakRLbnBQV2ZtTC9hYzdRakZ5R1NH?=
 =?utf-8?B?aGNjWUR2ZGp2KzdPYmhkUVg2cTh3eTZTTnVrSkVtUUlGMy9kK1ZwZnJMeHpk?=
 =?utf-8?B?ZExKQ3N2MER3SWxRWmU1T1kwdVI3YmZGY3Z0ek1kcVdHSmJuallCMlpXNUV5?=
 =?utf-8?B?eS9mSjZCdHdKQnZaSUM3YVgyUWI1OS9UWXc1dGN6THArcGhxWmNPc3BwZjUw?=
 =?utf-8?B?cjRBcEFaaklUeGZZUkFqODJOQmR0MFQ3Z0htUCsrcHpBYS9sclY5cHNVTUNL?=
 =?utf-8?B?RytDTVlmN3pOSnNUWkJuaGxkNWxiRG11WFo2bFFKRUJhUzgrd2FoQjRuNVht?=
 =?utf-8?B?VzJaRFF1amF5UXVuaVZDRDVpdmR5T3NjVmVzUTJQa1oxcXdxRUtDQ1JNZWFI?=
 =?utf-8?B?Uk5yeC9CUERTVXZ2UGUzdlJ3OThJTFRLM04veVVBSE5lQlQwWFF3dlhyTnAv?=
 =?utf-8?B?eERZQjBMMGgxb0VRWkFPeVNpZ1hKK3ZEYTJleWRzOXc5YmI1enVTdXN0Sm9C?=
 =?utf-8?B?RC9oK1JjbVVLQXZCVkZScWtWNmorVzArbHlLSzVaSVRCWjloQURFYmhNUDZ2?=
 =?utf-8?B?TXZZenhhQmYvbGNxVEdkNDZzTUEyL1BtWnpscXJSMWxsTlRDSm5CM01GK1JU?=
 =?utf-8?B?cWtqcVF2Y1Vyb1FMR2h2TWMxSkN5UWtiOWZ5eEQxV2djWnFtdi9GQVdTWkg0?=
 =?utf-8?B?Y1Bjc005ZVYycjVJUXA4NlFsY3ZjUjVPUUd6MlFtSGtSSmJDYVZHWS8wUlR2?=
 =?utf-8?B?YlVXZlhob2dIWUNKT1QrcDJYTTBuTDhhMStKRlRSMElzMVBjdzBZU1Y4bWZD?=
 =?utf-8?B?MUVwejRReXJ2elNQWU1kV05qM21aYUNUckhXQ1Yxa3FORmhHeW5GdnVUZkJB?=
 =?utf-8?B?T0xvWDVOVFMxdk9odkE5ekptWldNR205RnlTNXFKd1p5akVBNEhKaDNOalBL?=
 =?utf-8?B?SzFsVHlmeXpZQ0lpbG1qUmxROEo4Y2tnNjlHY2ZXRnNNNG9GcEJRdDQ2MG5C?=
 =?utf-8?B?OXdKOXkzWEJ5dUFHTmhoWHdOZWF2MzNEWm9Fb3lRUDhaSzRJTHFrK3hHam83?=
 =?utf-8?B?VXlkS1BOaW9ObHJ5eEVtTjNkNVA5MEt2dGxINGVJYWk5c2kvemRaMk5sTDRP?=
 =?utf-8?B?dUNlMWQ4dTdncDdFZUJrek4wWkh2SW9sVXQreU1MUmFmWVBTODE5bXdBcEdl?=
 =?utf-8?B?MXhrNHAraUQ5TnRRQVVmUjlodUROUHRHUzliZXZjRGhvb1NUNThMcmN1Y1Jr?=
 =?utf-8?B?b1hIZmZRUWNEbDUzVkFJa3ZleGRnY3JPM1dmcW51Rk4wbVgxVE14N2xvUDlh?=
 =?utf-8?B?VjAzN2Vxc1dzR2hjYkZEdUFmMzJLYmhxL3lwUjVOSUwxWXZCL1NhYkFXOFhJ?=
 =?utf-8?B?VGFUckRvRkJrVklqUGVOTXYxOFJpV3pyMFpBdVh0ak5RdTg0aytwSW9vbGs0?=
 =?utf-8?B?WitDMUEybGc4TkNRTXRsM2I0cENXM0pSOCtnckhiUE5sZTJJWTViTno3ZlJn?=
 =?utf-8?B?SUhzUXBvK3JWOVBET0E0clN4bXQ2d3FqUEI2b2gzWHFZZ2cyOWo0cTIyVndP?=
 =?utf-8?B?TUVkUkJVOEdrWXpaby9MUzkwc1pLTmExQmlXODNra0dmQm9jOWRqNWVRdzJE?=
 =?utf-8?B?dldoMlVobnlvVm9ITTJhSy90ZVZOWXBpY3lCQldmV2toOUE0bVVvUjFhb3gv?=
 =?utf-8?B?aHhaSW9PNis4Wm5wSEsxalhxRE50b2RLM2FtbllIZnFzR2tLNTFiNDdCSHJH?=
 =?utf-8?B?VVoyK3EwMGNiem50aGFrd3RkZWxVUDdMaFo4V1VnclFjSUlCbWZqY1d4dUk4?=
 =?utf-8?Q?lH0zfYHXVXaBvfrX8fZ258Upy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be52e16a-b4d7-461a-a9ee-08db04d02a47
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 03:47:11.1793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uA76qjeX8y7HbhFeSyq3PZUQ41y+cJAkpIvFpk8mRiNbjrCOJdHIfKJrLyhvHc+SCer2ZzMgHP5CSFNaChoSjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgRmVicnVhcnkgMSwgMjAyMyA1OjMwIFBNDQo+IA0KPiBPbiAwMS4wMi4yMDIzIDA2OjA3LCBU
aWFuLCBLZXZpbiB3cm90ZToNCj4gPj4gRnJvbTogWGVuaWEgUmFnaWFkYWtvdSA8YnVyemFsb2Rv
d2FAZ21haWwuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI0LCAyMDIzIDg6NDIg
UE0NCj4gPj4NCj4gPj4gVGhlIHZhcmlhYmxlIHVudHJ1c3RlZF9tc2kgaW5kaWNhdGVzIHdoZXRo
ZXIgdGhlIHN5c3RlbSBpcyB2dWxuZXJhYmxlIHRvDQo+ID4+IENWRS0yMDExLTE4OTggZHVlIHRv
IHRoZSBhYnNlbmNlIG9mIGludGVycnVwdCByZW1hcHBpbmcgc3VwcG9ydC4NCj4gPj4gQWx0aG91
Z2ggQU1EIGlvbW11cyB3aXRoIGludGVycnVwdCByZW1hcHBpbmcgZGlzYWJsZWQgYXJlIGFsc28N
Cj4gYWZmZWN0ZWQsDQo+ID4+IHRoaXMgY2FzZSBpcyBub3QgaGFuZGxlZCB5ZXQuIEdpdmVuIHRo
YXQgdGhlIGlzc3VlIGlzIG5vdCBWVC1kIHNwZWNpZmljLA0KPiA+PiBhbmQgdG8gYWNjb21tb2Rh
dGUgZnV0dXJlIHVzZSBvZiB0aGUgZmxhZyBmb3IgY292ZXJpbmcgYWxzbyB0aGUgQU1EDQo+IGlv
bW11DQo+ID4+IGNhc2UsIG1vdmUgdGhlIGRlZmluaXRpb24gb2YgdGhlIGZsYWcgb3V0IG9mIHRo
ZSBWVC1kIHNwZWNpZmljIGNvZGUgdG8gdGhlDQo+ID4+IGNvbW1vbiB4ODYgaW9tbXUgY29kZS4N
Cj4gPj4NCj4gPj4gQWxzbywgc2luY2UgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gYXNzdW1l
cyB0aGF0IG9ubHkgUFYgZ3Vlc3RzIGFyZQ0KPiA+PiBwcm9uZQ0KPiA+PiB0byB0aGlzIGF0dGFj
aywgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZGVmaW5lIHVudHJ1c3RlZF9tc2kgb25seSB3aGVu
IFBWDQo+IGlzDQo+ID4+IGVuYWJsZWQuDQo+ID4+DQo+ID4NCj4gPiBJJ20gZmluZSB3aXRoIHRo
aXMgY2hhbmdlIGdpdmVuIG5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiA+DQo+ID4gQnV0IEknbSBj
dXJpb3VzIGFib3V0IHRoZSBzdGF0ZW1lbnQgaGVyZSB0aGF0IHRoZSBjdXJyZW50IGNvZGUgb25s
eQ0KPiA+IGFwcGxpZXMgdG8gUFYgZ3Vlc3QuIEkgZGlkbid0IHNlZSBzdWNoIHN0YXRlbWVudCBp
biBvcmlnaW5hbCBtYWlsIFsxXQ0KPiA+IGFuZCBpbiBjb25jZXB0IGEgSFZNIGd1ZXN0IHdpdGgg
cGFzc3Rocm91Z2ggZGV2aWNlIGNhbiBhbHNvIGRvIHN1Y2gNCj4gPiBhdHRhY2sgdy9vIGludGVy
cnVwdCByZW1hcHBpbmcuDQo+ID4NCj4gPiBBbnkgbW9yZSBjb250ZXh0Pw0KPiANCj4gSXNuJ3Qg
dGhpcyBzaW1wbHkgYmVjYXVzZSB3ZSBkb24ndCBhbGxvdyBIVk0gdG8gaGF2ZSBkZXZpY2VzIGFz
c2lnbmVkDQo+IHdpdGhvdXQgaW50cmVtYXA/IChJJ20gbm90IHN1cmUsIGJ1dCBldmVuIGZvciBQ
ViBhbGxvd2luZyB0aGlzIG1heQ0KPiBoYXZlIGJlZW4gbGltaXRlZCB0byB0aGUgeGVuZCB0b29s
IHN0YWNrLikNCj4gDQoNCk9LLCB0aGlzIGlzIHdoYXQgSSdtIHNlZWtpbmcuDQoNClJldmlld2Vk
LWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==

