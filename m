Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7A8579430
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 09:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370443.602214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDhhi-0008E6-5D; Tue, 19 Jul 2022 07:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370443.602214; Tue, 19 Jul 2022 07:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDhhi-0008BE-2L; Tue, 19 Jul 2022 07:31:38 +0000
Received: by outflank-mailman (input) for mailman id 370443;
 Tue, 19 Jul 2022 07:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z3/S=XY=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1oDhhf-0008B8-Vb
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 07:31:35 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfa2c3e0-0734-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 09:31:34 +0200 (CEST)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 00:31:31 -0700
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jul 2022 00:31:30 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 19 Jul 2022 00:31:30 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Jul 2022 00:31:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Jul 2022 00:31:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Jul 2022 00:31:28 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 07:31:26 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:31:26 +0000
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
X-Inumbo-ID: cfa2c3e0-0734-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658215894; x=1689751894;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U9urn5LBzX7deftHHBmns6fZBycOG2pTxxCGfdTGXjc=;
  b=Fi0qRcXwQe7+v0laOuHsFCbj517yHYKXCUOGbo8wnUsrABg0uc1LHHEO
   jenbd5gCtjQ2TD81H8p57FzxXMrawN3nyqQjnAHOlnSsVTObvxCVMpOKv
   gknNHZopoXHBNoDqtpoBe3t1aKtVm4pPt5EvA9HWV32ZSEEmsBHUPHC8f
   ngJZnNPx+PW6aC8Gm5mjFrLNPBUQY3I+Q1P/Q7YdtfUtBhAs6GiW6MSI5
   ZhgAol1lIbm35n4DNkDQYjYMYwbVs/hohDnigSnwITbv4+wb8Qivzimu2
   4pBZQKFF+S6OGbz2jutbvODHcvyRiM4vekzh6X2BDJbErZCHDgaoCSEFY
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="269443748"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="269443748"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="601495473"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJchAt4JRf3fOXZIyjFRXOZajx3i8EkDbXW2u/pZCeBZGZDytk1g3o7jupTCwtG809jwXtnbTTp3IeJrkprCFAI9wb4ZNco/SzIgIX0OABwcSjpyFqI6FaSjPoGCo8rPDkSUBMPHyGNlQASVNunbnC8hvX9HRTw9hgNKElABME3rBfKXqis4N2PNCY1Fzubzai3qLvZbX5qv8SrJgyabZw4GNTRJV9/6Ws5bdmXeBDMYvCPH9McOzPz30G4Yl1FHF8kbOyvTbRuseOxHVVpJXNcuTu91Zxs6UYIPoiAIjcQx4XEHmQrW6ML51bKfnhpUxm+ccXKIg7sb+0UYES2UXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9urn5LBzX7deftHHBmns6fZBycOG2pTxxCGfdTGXjc=;
 b=XNim0R5b7yYJKyinfJ7Wirb8KmHU8hJNJv0Q+BK3K+zNz/Gsfb14AG/HbOyxubwWyalpPlWtRxCOqb0LUIcKU0PVULAfpSvBpKhhJTBR2ocbcRn9hRt2lo/xirnO+YpBninxtrTpdgaUqRIYskyQfDkufrwUfCyVxZMuLErg7Ba6XNOM+6XwOVofR/9W7lt7BfgAQsZQxl0i3Gv3hTFK1G/YLcj4lRbQX5VzlPJ6h9mqdodU9l/I8RbkJtA0bu8a2LR4lY0nl/Xn9Q4Sh9cbMQVuF3MWPgOY6EgPpq/TBNmUAR6bB31rbXCr1zb6ouYPxPjIRg6B9TIMewlqkjDh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, "Beulich,
 Jan" <JBeulich@suse.com>
CC: "Nakajima, Jun" <jun.nakajima@intel.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Thread-Topic: [PATCH v3 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Thread-Index: AQHYjUzyisX0+ExRGkiFh4Bp+KXF1a1t9f+AgAALFYCAF2Y1QA==
Date: Tue, 19 Jul 2022 07:31:26 +0000
Message-ID: <BN9PR11MB5276B9550739B74A13D79A958C8F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220701131648.34292-1-roger.pau@citrix.com>
 <20220701131648.34292-2-roger.pau@citrix.com>
 <325bbf52-3b56-4062-88b5-a04dc21404bc@suse.com>
 <YsK71YGh7hlTFuYm@MacBook-Air-de-Roger.local>
In-Reply-To: <YsK71YGh7hlTFuYm@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c909eb00-2f28-4cf4-ef81-08da6958b05a
x-ms-traffictypediagnostic: CH0PR11MB5250:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TmdZ36qX1ciFxrDJ5DeQA9zQc5WJ6PTRdpr+k2EoL7BXjRHFWDsha1J0xjtkGFH6wq9Tfu281lxKrruQ27xv/s3Rt0+Fb4441DLXozGrm4It8qTUiUJmLSiFRdUobF9YuZX37trzsHBpaV8XdoR/qLg/34kiJNO43m556id6y/5r+7NyRL8ulCXsyfyQ80hy4T39R6I51KJhTcOp3MoqGYwt0ArDMr7l0YDBOTm/Z3J16DI5VWfeQkmtUFmdxA5qyHZB1RjWr5uYUWir7FB63ptQPeyiNay+6FufRlRH03QH1s1vJTnwh561GwNMMi4phUhKmsNiKX60APFHX4N65+00BPFBZWOqJ9iHeoVlB4a1N8RRucMwAKTkcJWMjbKFbnk1kSj/Kl/Iz8OzHaUFEFVix6URqnKYYcXONGUymR85438nWrAEpnUa274o5AIRrh9PIrlzqj4gOlighc2RK68ZcGUe/HC0g40Suz7C9iGSA744LtV0u1RSgWzT7wHgAccLKNRuR1XXetfbuknY52fm0CqFVAryt0SZZuM7hq/MRrGD52+7Jmg8ZhTLt1QkgKC+3Z0yPmDrSBKRNHcXwuBWUWMsFwCPTr7Hkw7PA+OrLnfuQWa/lpUxgZcbKmf2JfJWSPPxF9oHWgxJPV7TKPtxEJGDTwqkSYn//lYc3objtY7zPWFKqs23Wra/0yz7gONJlBMPx/ClHSlhBsyWmwReigxZQta7FRIJGktkw2iTbU972LQ3ar6ov6shWb6MsWsTO+iWGvQTHn3CAyxbGbsrOHDdTjL4gRub5euwKu+balE/JCaKtUTzm1MxPgcF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(366004)(39860400002)(346002)(52536014)(8936002)(4326008)(5660300002)(55016003)(2906002)(33656002)(8676002)(64756008)(110136005)(54906003)(76116006)(316002)(122000001)(38070700005)(53546011)(82960400001)(26005)(86362001)(41300700001)(186003)(9686003)(7696005)(478600001)(71200400001)(66446008)(66556008)(6506007)(83380400001)(66476007)(66946007)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFVSSHdqM21pdG54QVZVM1dRbVF0SzNaazduWG5oR1Q4MDJ2RjRRN3VwKzk3?=
 =?utf-8?B?YmpOTTZDSGQwTzRYempOL09XeW80M1orQ0MxN2NBM05tVEVOcWpRTmRhY1hC?=
 =?utf-8?B?TjZBM05waEZsaGh0SnEvcWJXcm9sanFuaEpSSW5TZFgvM1RXaGJPcWJzeG9n?=
 =?utf-8?B?OVdpRUVmY2ozWk9FUGU3NEhvMjFISVc1aElVNDJYM29uN2x2anJKc05aUk5w?=
 =?utf-8?B?TDk0RXVBZ0ZVeFVmY0VVV3owSXpoZVNudTNUSVAyTzRLTXgvTGpYeVdEd1Fu?=
 =?utf-8?B?bmdKV0lqR2Y3WC9pUE1QUWtScG1KT1NYT3lSTTNHTUNqV3dtUlNIWVB5dXhz?=
 =?utf-8?B?VUtrZUt5eVdNbm91NG5tMG1LYlBqUXFFV24wNzhaN2xMdXpSVDl5RWZ1MzlR?=
 =?utf-8?B?Ymw2cHgrRmJZWHJBMmlRL3JNVGdjcmJWSFQzamx3ZFpEamJrN2NFL3J1VXNE?=
 =?utf-8?B?cDB1VCswTVdCc0xHL0FnVW9wZHMrUnZpZlY3dk1iMDhaQUc1Tkp2aEVORzZN?=
 =?utf-8?B?dmJpVy9Lams4d212ZDByR0tvT0dic0Naekdoa3JLOHBRVE9xOXAwWkp1b0dR?=
 =?utf-8?B?TFNlNURaelp0bW9XUXVwbFRPMklicnlvbitSNmZkZS95cnk3TzFkZkhPeUpD?=
 =?utf-8?B?ckpXaWE1T0Y5VGFTQnF6SDExbG0yazBxNzBhTVAyZFJOaVNVVG9QRWl0OTc5?=
 =?utf-8?B?SFVGcGt1VHh5OGNCbURweHRYZ2tPc2xia3JUWWUrM1NWTzhYakZpeXJRaURI?=
 =?utf-8?B?MVJ2azg3UlVWY0J0a3lCZFZqSW53THB6ZFc3M21MR3grdGE5NEFldjYzTzhQ?=
 =?utf-8?B?QzNFK0VwdEd6RDdQWGExRzMxb1VJWjdpdndseGtqck1FNzJNYnJGY21ZbUkz?=
 =?utf-8?B?cDlNNVhNWkNlTzlWWW9PNWh4OGxDQXZ0dWx6M2h1cXc2NWxWN0Jsbm9ibXRG?=
 =?utf-8?B?Wi94bm1GTXc5cGgxaUxqSEJmZlE0VEFWQUdvcDJUN2RSQ0NCOFNZc0hSSXg4?=
 =?utf-8?B?YU1lNnJKYS9FNmJ0VkxSdmxEUzl3SVJ6dlFHNld4bll3bWRhZDAvNVV1L1Zi?=
 =?utf-8?B?MXVDcFAvRkt0enhvZnFIcmpUdU8vK3FReElvN29Hc0pWa21jaGE5NXlEVzF1?=
 =?utf-8?B?WFlPeDlOQTF5Q0NDcWtlMEc3eWZ0ZmJzKzB4eFYwZklaZzAzY2ZoK3RieGgw?=
 =?utf-8?B?bVhJeTV1WERacHpDTXZuMXNkMm9Jd29oUUpjSG9sNytvOC9lR1VORkxlanpp?=
 =?utf-8?B?Y3lLUnZ6TXJIb0VTaVlzMUJadjM3dFpSNVM1YjYxZUpSVWlEYkFGNHVKS0o1?=
 =?utf-8?B?aUU5ZFVhVnlhekdIcEY0allvNzlaZzMyWDB1U3ZpVlA5eFNLUG11Y0pNL2Q4?=
 =?utf-8?B?cjIrOHlsYk1XdmRVOHpUMkJqRlZSVUd6dnFZdk02eU81aHpuVWhoOXF3Rmw0?=
 =?utf-8?B?NFYxQ1BpWEFwZjlhSVlkbTk5TnlIbURIWWVwbFNTNGR6TStqSW5CS1c2Q2NQ?=
 =?utf-8?B?Uld6OU9kdFRJcWx3WVU3a2tUVUNpZlljQWZWTXZ1SkdJbVNBa1RLNGNOc2pz?=
 =?utf-8?B?QmhkbUUyVlh6b1h1OXozL25QNkV3SGJJMXFzbzRrYmRZa0drVHRZcGNkYUxr?=
 =?utf-8?B?SXoyOVRrdG8zZlN5L3FMdTd3SXUxdmVpWkg3b1lnajVjdi8wOExMR2hETkZS?=
 =?utf-8?B?TUdJNUttYU95OXYxTUFyOHpoK0lkelEyOTRtcndFL1VKMkFpWEl6VUszK0hY?=
 =?utf-8?B?UmdjcmN3VHFaQVV1T3g3cU9pcm9ZREhoT0VYcU1UVUUyQzd0WVNlZHM4dE1O?=
 =?utf-8?B?ckFzakVNclVSV2F3cmwzZHFiY09qQThWcTRNNG5sVGZva1V4WVpjQW5GVFMv?=
 =?utf-8?B?My9uWGRMSVRQUndBS2djM05iNExDRDdaOFJzOGVQQ0dHbitRb3J3dlN2cVNq?=
 =?utf-8?B?d1hIVURVUlhlVUYrVXJnOCszYlNtYVNJc0hrckRFRmJxL1FXcmM1SFZLSWZU?=
 =?utf-8?B?aHBmZHM2VGprUWUvOWlqNHRLN3M4em9qbksvbUdIZzVHT3dYWSsydldIQ2JZ?=
 =?utf-8?B?V2x5d3BlWU9rc2ZKUWN4ME94OWJGWlpubVRTMVFGOUZ0M1VseEtWWkE4L0c5?=
 =?utf-8?Q?g0VKvT/Sj9hF4g+xmC9YQz/ca?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c909eb00-2f28-4cf4-ef81-08da6958b05a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 07:31:26.2822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9odf1OJiiYmV8SjYASo7VZwAqySYOI1AVLkPH2RrUNewXxjbyIM20mcH86QTQ4ZauOAAJEIlao+kaPsUCYhaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
TW9uZGF5LCBKdWx5IDQsIDIwMjIgNjowNyBQTQ0KPiANCj4gT24gTW9uLCBKdWwgMDQsIDIwMjIg
YXQgMTE6Mjc6MzdBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gT24gMDEuMDcuMjAy
MiAxNToxNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92bXgvdm14LmMNCj4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jDQo+
ID4gPiBAQCAtNDA2NSw2ICs0MDY1LDExIEBAIHZvaWQgdm14X3ZtZXhpdF9oYW5kbGVyKHN0cnVj
dA0KPiBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPiA+ID4NCj4gPiA+ICAgICAgaWYgKCB1bmxpa2Vs
eShleGl0X3JlYXNvbiAmIFZNWF9FWElUX1JFQVNPTlNfRkFJTEVEX1ZNRU5UUlkpICkNCj4gPiA+
ICAgICAgICAgIHJldHVybiB2bXhfZmFpbGVkX3ZtZW50cnkoZXhpdF9yZWFzb24sIHJlZ3MpOw0K
PiA+ID4gKyAgICBpZiAoIHVubGlrZWx5KGV4aXRfcmVhc29uICYgVk1YX0VYSVRfUkVBU09OU19C
VVNfTE9DSykgKQ0KPiA+ID4gKyAgICB7DQo+ID4gPiArICAgICAgICBwZXJmY19pbmNyKGJ1c2xv
Y2spOw0KPiA+ID4gKyAgICAgICAgZXhpdF9yZWFzb24gJj0gflZNWF9FWElUX1JFQVNPTlNfQlVT
X0xPQ0s7DQo+ID4gPiArICAgIH0NCj4gPg0KPiA+IFRvIGNvdmVyIGZvciB0aGUgZmxhZyBiaXQs
IGRvbid0IHlvdSBhbHNvIG5lZWQgdG8gbWFzayBpdCBvZmYgaW4NCj4gPiBudm14X2lkdHZfaGFu
ZGxpbmcoKT8gT3IgKGRpZG4ndCBnbyBpbnRvIGRldGFpbCB3aXRoIGNoZWNraW5nIHdoZXRoZXIN
Cj4gPiB0aGVyZSBhcmVuJ3QgYW55IGNvdW50ZXIgaW5kaWNhdGlvbnMpIHBhc3MgdGhlIGV4aXQg
cmVhc29uIHRoZXJlIGZyb20NCj4gPiB2bXhfdm1leGl0X2hhbmRsZXIoKSwgaW5zdGVhZCBvZiBy
ZS1yZWFkaW5nIGl0IGZyb20gdGhlIFZNQ1M/DQo+IA0KPiBUaGlzIHNlZW0gdG8gYmUgYW4gZXhp
c3RpbmcgaXNzdWUgd2l0aCBudm14X2lkdHZfaGFuZGxpbmcoKSwgYXMgaXQNCj4gc2hvdWxkIHVz
ZSBqdXN0IHRoZSBsb3cgMTZiaXRzIHRvIGNoZWNrIGFnYWluc3QgdGhlIFZNIEV4aXQgcmVhc29u
DQo+IGNvZGVzLg0KPiANCj4gSSBjYW4gc2VuZCBhIHByZS1wYXRjaCB0byBmaXggaXQsIGNvdWxk
IHBhc3MgZXhpdCByZWFzb24gZnJvbQ0KPiB2bXhfdm1leGl0X2hhbmRsZXIoKSwgYnV0IEkgd291
bGQgc3RpbGwgbmVlZCB0byBjYXN0IHRvIHVpbnQxNl90IGZvcg0KPiBjb21wYXJpbmcgYWdhaW5z
dCBleGl0IHJlYXNvbiBjb2RlcywgYXMgdGhlcmUncyBhIGp1bXAgaW50byB0aGUgJ291dCcNCj4g
bGFiZWwgYmVmb3JlIFZNWF9FWElUX1JFQVNPTlNfQlVTX0xPQ0sgaXMgbWFza2VkIG91dC4NCg0K
b3IganVzdCBtYXNraW5nIG91dCB0aGUgYml0IGluIGFuIGVhcmxpZXIgcGxhY2Ugd2hpY2ggdGhl
biBhbHNvDQpjb3ZlcnMgbnZteF9uMl92bWV4aXRfaGFuZGxlcigpIGJlbG93PyBUaGVyZSBhcmUg
YSBmZXcgb3RoZXINCmdvdG8ncyBhbmQgcmV0dXJuJ3MgYmVmb3JlIHRoZSBwb2ludCB3aGVyZSB0
aGF0IGJpdCBpcyBjdXJyZW50bHkNCm1hc2tlZCBvdXQuIEhhdmluZyBidXMgbG9jayBjb3VudGVk
IGV2ZW4gaW4gdGhvc2UgZmFpbHVyZSBwYXRocw0KaXMgYWxzbyBub3QgYSBiYWQgdGhpbmcgaW1o
by4uLg0KDQo+IA0KPiBJIHRoaW5rIHRoZXJlJ3MgYSBzaW1pbGFyIGlzc3VlIHdpdGggbnZteF9u
Ml92bWV4aXRfaGFuZGxlcigpIHRoYXQNCj4gZG9lc24ndCBjYXN0IHRoZSB2YWx1ZSB0byB1aW50
MTZfdCBhbmQgaXMgY2FsbGVkIGJlZm9yZQ0KPiBWTVhfRVhJVF9SRUFTT05TX0JVU19MT0NLIGlz
IHJlbW92ZWQgZnJvbSBleGl0IHJlYXNvbi4NCj4gDQoNCg0K

