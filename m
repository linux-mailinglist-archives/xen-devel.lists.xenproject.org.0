Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B14D7ADB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 07:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289910.491604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTeJT-0004xF-Oy; Mon, 14 Mar 2022 06:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289910.491604; Mon, 14 Mar 2022 06:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTeJT-0004uY-Le; Mon, 14 Mar 2022 06:36:15 +0000
Received: by outflank-mailman (input) for mailman id 289910;
 Mon, 14 Mar 2022 06:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMf=TZ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nTeJR-0004uS-Vu
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 06:36:14 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06215c21-a361-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 07:36:06 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 23:36:04 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 13 Mar 2022 23:36:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 23:36:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 23:36:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 13 Mar 2022 23:36:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 13 Mar 2022 23:36:01 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 06:35:59 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 06:35:59 +0000
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
X-Inumbo-ID: 06215c21-a361-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647239766; x=1678775766;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Uy9+7M3ERNNieNsQ5D2FRzFFgf+QvDat5baL9WxIhVc=;
  b=fMr5CGHwuS2FBacGvanizhVAWzRF5gMpDKqHl5NsydzaLj4X3Q+AawmD
   dyYmUZs1P9DhBPoUvqaP9h7yhk5+Et0y4CdllAA60bhSzoeyB7eqkrwwQ
   Q4bIK72wKFwg56lhzUC86YM6kEB8JODFnRaxic5/jCdLDUciaSeKPV9kz
   JxbilWcfqPkxyL16XKYwVgiM4rY6tcvd8xkgCqZVwHu8/NgmI7yFnxR+r
   4nnbO6xruM68UbbP5jjsHz+yjs+PhBbKPN8AVEBKkykljB8vn8hnOLMlP
   yWSmcRcU8WSzPJRMb3hEWZ04TqlSHrGKWjenoAiIMYs/d2LsExzxDJRGJ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="236551953"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="236551953"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="713597124"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiskI8vlVRkXvolZm/T3WSSuhhjB61S1KCRw8Y8zD/ODOkO87c2pyJCo2dp4bTBHUurpRBGUFpGDBguZVOn5vG7fZ95OkVWA359MW9eiDceGYq3yDY94m7HPAxNJK4cqJZD30u3wKtYZcxqsF6UTyrv6nyO7UsSzsgSTINzgtO4BHgAVnKmsagRpKqzamPG0CZPIPFPK00lFFQdRV+mdZOXDGLLKe4BqAQp3FaSFaYiL+N3nLGuc5BhtYAi4KvTWrRMG6tKAym4tmCG5EZMi/5hIpFxdWw76jx1ku5WBGb7y5/vpRV+m9gmn2+28NJ0hN9dSJjmjRa2bzC2FecJLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy9+7M3ERNNieNsQ5D2FRzFFgf+QvDat5baL9WxIhVc=;
 b=O1v+UrX8FbcvHDNdSsPTnjy8gk1CQ/JaRml/OwCrgpfrlo5S6yN+5HiAG9xRwma4hE9OFVVD1RicDNdskxm5pxZCBBl+W1J2TrCEO3V33Wg58TNePVIWCEJmXLNOUtLEMbVhYgHYggE+sGsybBEp7h6YX+x9J3CoD6VmbuVNLPFVH0wWYU7f8qehiJriOTkU4HtvlQWSZpnBKAFHn0IRrlIPUZl+n5QyueZgPN6MgUeZbqAq4abdgWDUUDFU10o8kuK3MjGLL5ALiHJCJrSrau2oXcrrvikRY0vWjFHqc9psZrxMiFVugvNSdLSqZzUHtfSLGgit4DzIE67f9aashw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "Cooper, Andrew"
	<andrew.cooper3@citrix.com>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>, Thiner Logoer
	<logoerthiner1@163.com>, "Marczykowski, Marek"
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: x86/vmx: Don't spuriously crash the domain when INIT is received
Thread-Topic: x86/vmx: Don't spuriously crash the domain when INIT is received
Thread-Index: AQHYKbevPQACrsDTpUmflGdlWuTEmayj9FgAgAA+nwCAAA5IgIAAQNmAgAQWIgCAFe3v8A==
Date: Mon, 14 Mar 2022 06:35:58 +0000
Message-ID: <BN9PR11MB52767BF5573E31241734F2A28C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
 <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
 <965e91fa-1f1e-7c57-5a71-a09b170a7d9f@citrix.com>
 <2e1dcfb8-20ae-26b2-427d-9c19bd8c8add@suse.com>
In-Reply-To: <2e1dcfb8-20ae-26b2-427d-9c19bd8c8add@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa03578a-e49d-4437-3a28-08da0584e6b3
x-ms-traffictypediagnostic: PH0PR11MB4840:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB4840B5C2878FFED58512D6218C0F9@PH0PR11MB4840.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vx7nDcqhQGWdZjBmay4EO/zTP6eB8Z/LNBtzmEb/olteK2LcSfaZv1LFpJ/upF8Ps5oabCiZDJAO+JwXwOoKJS0sH6Ao8zIfngckD4CQRKuiUD59oeAd8VcanTG243gCwteXwbVafJ/eMe9HbvAw2do4U0tnnRqY0f7sLoM9TYsLO3ePKTvHBYK/3p9TfWR6rRtdSYA7tuiJQnB10q/rbymhYHutRDWE7F9BvoKDrHGza649+xclyFzevTTU1KdG6F9xKetEtFHxHggSD2FNYT78fGSzRdjKstOO2EFkB7MwZSk/YfJpu1+wNk/tobIksldesoNXoLHYzeoz1dHyjHJbBpCtpLyLQ2dMLKhAhMjM8w7x4ZFR3TcngJRZLTz3Vx8fz8kUEXAvNdjNEHaQYzLIX0xgmSVo9K5LXltTlLUnoWgliK8iXCNf/adxaQ5FzPr0Zvb6fxLP2hZiW9aQ+m3FJwnrg599DY63IojP+qxmnTC9yNLJpaVfXf24ZsZxueiELy62y39j071UN4qrb6aZrttEYjGLd0aipsWRzSlZXmrinMTT0128WWO5oax6OhhoitnrTnmFNhGOZ5wYON7jkenxMhvIUtVx/UoBdKe6p2Qp3p8QCNo3l58ieJECosW40PCHBTfUOoy5uWvCNIXa6ROw51stjng+9YOXUPzs4tfHQc4WiCj8HmBL0Ep3SqbQ4Ck8CfIodxjrFN9wrg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6506007)(7696005)(83380400001)(71200400001)(186003)(53546011)(54906003)(5660300002)(110136005)(86362001)(8936002)(2906002)(9686003)(38070700005)(76116006)(122000001)(55016003)(316002)(38100700002)(82960400001)(52536014)(33656002)(508600001)(66556008)(66476007)(66946007)(66446008)(64756008)(4326008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUZHOFJ3WUYrVWxkZ2VRcFVjZHpORWwxODlNeG05TkltYlVlTXdVVWpQT3Jw?=
 =?utf-8?B?b1NybUtWeWNxNE5tNENBQ3VqQmlUQkYxNzJZQ05uK2tjRk5jK283U2E2aGk1?=
 =?utf-8?B?OGEzUVhzOUlHRVNFbEZiSGZiNmxoS0JPUHJjWUpobFprK3U0N0x6OThWTVBm?=
 =?utf-8?B?ZVRJdjF6T2kwZVhzUFVFMVpvSVRXOElCaHNnREY5d3lhNEZ0MCtFZjJWNjlM?=
 =?utf-8?B?aEdzZlc5SDIrNTBXQXR5dHowZVdYMlpjd1JzcWZkTHJDSWZ6MTJDcGlUdnVS?=
 =?utf-8?B?dW92QlBjMnkweThCZUpxQ3hGTXRodENIR1hhbmZHdnZvUERVWjJmUFVQaXlh?=
 =?utf-8?B?bHRFN1QxNjNscVA4bEc0OGtPNmFLSWczL25vUW5oSUx2UjY0bUxIVFloMmFN?=
 =?utf-8?B?L29qbU0wbzZGekpNcTdDejJHc1ZEc2JNcXNiNlRlWENlK3pBdVo4aEJDU283?=
 =?utf-8?B?a3dnaExLdmVnRHZLUjQwOXNCNWUxWWtUUVNQR1dxNlFnVCtGRHF3bmdDTzQ0?=
 =?utf-8?B?TlJJdWo5OG9lakplY1c2MUZNQ1RXTmRiSWx1YUZkRTR2WFlFdjVKZXE5UG5v?=
 =?utf-8?B?dkQ3dTBRTDFKTElwQXd5TmJ6SGdGZDk3SFhyT0NvbHFPcmpCaUpGSTZqMTBk?=
 =?utf-8?B?dDBKU2pLcXFkWWFrWnJtQXZ3WUFOUEFMZVZSa25HdHc3SmRvQjZtOHlzVTF5?=
 =?utf-8?B?VndhRG9aK1M5cVFGLzl3ZVBKaVp0L2ROZVZLbmRtMlhySThSeGVZdHA5QlZz?=
 =?utf-8?B?dFFTZzBLRUhabzc2RjlPTGN5T3JJczNJVFlvVlE3SmphNXV4WHlvRE1zOXZ2?=
 =?utf-8?B?S3hkQVlMZyt1NmVlczVaOW9OWmNqbXFhbVJieHpPSW56eFpnYUdId0hiOVBt?=
 =?utf-8?B?Zy9oOEh5eTg5MTR2d1IrMG81ZVpIbnc4bElFN1o1UEhPS2NQelFyUmcwTkR2?=
 =?utf-8?B?WVRDenBWbk9MRVI4Qm1EcnhxUkF5UTgxb1FGUEMySTJHcjN3MU1GUDB0NG5v?=
 =?utf-8?B?MmtRWCtiVUl5UnZjWWlYeW5hWHNPQVdXSTFoT3M0NUN1Vk96UDJ1MWJWNW1N?=
 =?utf-8?B?N3d1d2NpYVljNUZRZnhtbnVoa3BPYmViMzNNSitqN2gvTFNKMy9aVmZUWkFk?=
 =?utf-8?B?aHk1UXFZK09QQ1pTUDdXL1F3WG9BWjlYbUNvRWh0MXQ1OEpNSE9PSXNKQysr?=
 =?utf-8?B?MjdwZ1MvOVppOGxMYnUvS29yRnBzc1cxU0ZmcnVFTzVWdzR4Z0ZJTjVpbmtm?=
 =?utf-8?B?YVZXZzRJaitKWFhSeit5L09aN2xUNGhkVXlyQ0pTQXhPU0tyb3Z5T29IN2Ji?=
 =?utf-8?B?dmJEb3lJZkl2dzlhdzI3ZnMxRE1hU1kwYWNOWUZFbS9lcjhtRG1IRUk1SG10?=
 =?utf-8?B?Zis4bFZHMytTeDJuSXg2VTFtSzBhV2VGQURLaUVDWUs3eVlPaUVIc2s4Z29z?=
 =?utf-8?B?MndtRnhybmd3V2djMHlONG02V3hFNUVpNzRwcFgrdnRoZlpMRnRRamc1bThm?=
 =?utf-8?B?SmtwTEozR0dKYUtKVEQ5WjcvNys3SU9NTzVBeXFnZGs1Nm5QSHQ1T20xSUZj?=
 =?utf-8?B?alhlOS80dXdtdVFxTW5QU1V3UmlDS0RsanFFSy9LY0NNcEg4NGkxSHlabXV1?=
 =?utf-8?B?Vi9PenJua1Zyb1FxcFoxSFdud3F6dkxyVFJwaE9CMU03eGZOazNvWVpHTE42?=
 =?utf-8?B?Mm1ncDE3bWw2U2xCaXBqYndLR0NLYWJhZTdHWnBBck9zc0QrVnZ3RXdCZ2lW?=
 =?utf-8?B?SXVmY0JyMEpKblJITnNsL21NNnlMNVFMSVpGV0VMRnpEVXE2MEszS21VZmQy?=
 =?utf-8?B?ZVlFQTZaZExkK3dnN0hTbE43VGxGWW0yWGZtNDBmeTZkd0taQ29Nbnl2RWJk?=
 =?utf-8?B?Wmt2TWJEcnZLRjVXc2lneWFaUVBwN0hmTDQvMjlUL3M2b21ISnpyUjYwc1Bh?=
 =?utf-8?Q?AKebKIEWFvhb1n+96diJ1MsoP74PYSDY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa03578a-e49d-4437-3a28-08da0584e6b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 06:35:58.8955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IeHpUp5uaTXICxXnPGBE9xZEBfPSqmOnvcZH9dxlCNQHJqgOQV5tVaiS+HV0aNIR61wCJm1IcxphSWzd6cXJKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
RmVicnVhcnkgMjgsIDIwMjIgMzozNiBQTQ0KPiANCj4gT24gMjUuMDIuMjAyMiAxODoxMSwgQW5k
cmV3IENvb3BlciB3cm90ZToNCj4gPiBPbiAyNS8wMi8yMDIyIDEzOjE5LCBKYW4gQmV1bGljaCB3
cm90ZToNCj4gPj4gT24gMjUuMDIuMjAyMiAxMzoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4g
Pj4+IE9uIDI1LzAyLzIwMjIgMDg6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+IE9uIDI0
LjAyLjIwMjIgMjA6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4+Pj4+IEluIFZNWCBvcGVy
YXRpb24sIHRoZSBoYW5kbGluZyBvZiBJTklUIElQSXMgaXMgY2hhbmdlZC4NCj4gRVhJVF9SRUFT
T05fSU5JVCBoYXMNCj4gPj4+Pj4gbm90aGluZyB0byBkbyB3aXRoIHRoZSBndWVzdCBpbiBxdWVz
dGlvbiwgc2ltcGx5IHNpZ25hbHMgdGhhdCBhbiBJTklUDQo+IHdhcw0KPiA+Pj4+PiByZWNlaXZl
ZC4NCj4gPj4+Pj4NCj4gPj4+Pj4gSWdub3JpbmcgdGhlIElOSVQgaXMgcHJvYmFibHkgdGhlIHdy
b25nIHRoaW5nIHRvIGRvLCBidXQgaXMgaGVscGZ1bCBmb3INCj4gPj4+Pj4gZGVidWdnaW5nLiAg
Q3Jhc2hpbmcgdGhlIGRvbWFpbiB3aGljaCBoYXBwZW5zIHRvIGJlIGluIGNvbnRleHQgaXMNCj4g
ZGVmaW5pdGVseQ0KPiA+Pj4+PiB3cm9uZy4gIFByaW50IGFuIGVycm9yIG1lc3NhZ2UgYW5kIGNv
bnRpbnVlLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBEaXNjb3ZlcmVkIGFzIGNvbGxhdGVyYWwgZGFtYWdl
IGZyb20gd2hlbiBhbiBBUCB0cmlwbGUgZmF1bHRzIG9uIFMzDQo+IHJlc3VtZSBvbg0KPiA+Pj4+
PiBJbnRlbCBUaWdlckxha2UgcGxhdGZvcm1zLg0KPiA+Pj4+IEknbSBhZnJhaWQgSSBkb24ndCBm
b2xsb3cgdGhlIHNjZW5hcmlvLCB3aGljaCB3YXMgKG9ubHkpIG91dGxpbmVkIGluDQo+ID4+Pj4g
cGF0Y2ggMTogV2h5IHdvdWxkIHRoZSBCU1AgcmVjZWl2ZSBJTklUIGluIHRoaXMgY2FzZT8NCj4g
Pj4+IFNIVVRET1dOIGlzIGEgc2lnbmFsIGVtaXR0ZWQgYnkgYSBjb3JlIHdoZW4gaXQgY2FuJ3Qg
Y29udGludWUuwqAgVHJpcGxlDQo+ID4+PiBmYXVsdCBpcyBvbmUgY2F1c2UsIGJ1dCBvdGhlciBz
b3VyY2VzIGluY2x1ZGUgYSBkb3VibGUgI01DLCBldGMuDQo+ID4+Pg0KPiA+Pj4gU29tZSBleHRl
cm5hbCBjb21wb25lbnQsIGluIHRoZSBQQ0ggSSBleHBlY3QsIG5lZWRzIHRvIHR1cm4gdGhpcyBp
bnRvIGENCj4gPj4+IHBsYXRmb3JtIHJlc2V0LCBiZWNhdXNlIG9uZSBtYWxmdW5jdGlvbmluZyBj
b3JlIGNhbid0LsKgIEl0IGlzIHdoeSBhDQo+ID4+PiB0cmlwbGUgZmF1bHQgb24gYW55IGxvZ2lj
YWwgcHJvY2Vzc29yIGJyaW5ncyB0aGUgd2hvbGUgc3lzdGVtIGRvd24uDQo+ID4+IEknbSBhZnJh
aWQgdGhpcyBkb2Vzbid0IGFuc3dlciBteSBxdWVzdGlvbi4gQ2xlYXJseSB0aGUgc3lzdGVtIGRp
ZG4ndA0KPiA+PiBzaHV0IGRvd24uDQo+ID4NCj4gPiBJbmRlZWQsICpiZWNhdXNlKiBYZW4gY2F1
Z2h0IGFuZCBpZ25vcmVkIHRoZSBJTklUIHdoaWNoIHdhcyBvdGhlcndpc2UNCj4gPiBzdXBwb3Nl
ZCB0byBkbyBpdC4NCj4gPg0KPiA+PiAgSGVuY2UgSSBzdGlsbCBkb24ndCBzZWUgd2h5IHRoZSBC
U1Agd291bGQgc2VlIElOSVQgaW4gdGhlDQo+ID4+IGZpcnN0IHBsYWNlLg0KPiA+Pg0KPiA+Pj4+
IEFuZCBpdCBhbHNvIGNhbm5vdCBiZSB0aGF0IHRoZSBJTklUIHdhcyByZWNlaXZlZCBieSB0aGUg
dkNQVSB3aGlsZQ0KPiBydW5uaW5nIG9uDQo+ID4+Pj4gYW5vdGhlciBDUFU6DQo+ID4+PiBJdCdz
IG5vdGhpbmcgKHJlYWxseSkgdG8gZG8gd2l0aCB0aGUgdkNQVS7CoCBJTklUIGlzIGEgZXh0ZXJu
YWwgc2lnbmFsIHRvDQo+ID4+PiB0aGUgKHJlYWwpIEFQSUMsIGp1c3QgbGlrZSBOTUkvZXRjLg0K
PiA+Pj4NCj4gPj4+IEl0IGlzIHRoZSBuZXh0IFZNRW50cnkgb24gYSBDUFUgd2hpY2ggcmVjZWl2
ZWQgSU5JVCB0aGF0IHN1ZmZlcnMgYQ0KPiA+Pj4gVk1FbnRyeSBmYWlsdXJlLCBhbmQgdGhlIFZN
RW50cnkgZmFpbHVyZSBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZQ0KPiA+Pj4gY29udGVudHMg
b2YgdGhlIFZNQ1MuDQo+ID4+Pg0KPiA+Pj4gSW1wb3J0YW50bHkgZm9yIFhlbiBob3dldmVyLCB0
aGlzIGlzbid0IGFwcGxpY2FibGUgZm9yIHNjaGVkdWxpbmcgUFYNCj4gPj4+IHZDUFVzLCB3aGlj
aCBpcyB3aHkgZG9tMCB3YXNuJ3QgdGhlIG9uZSB0aGF0IGNyYXNoZWQuwqAgVGhpcyBhY3R1YWxs
eQ0KPiA+Pj4gbWVhbnQgdGhhdCBkb20wIHdhcyBhbGl2ZSBhbiB1c2FibGUsIGFsYmVpdCBpdCBz
aGFyaW5nIGFsbCB2Q1BVcyBvbiBhDQo+ID4+PiBzaW5nbGUgQ1BVLg0KPiA+Pj4NCj4gPj4+DQo+
ID4+PiBUaGUgY2hhbmdlIGluIElOSVQgYmVoYXZpb3VyIGV4aXN0cyBmb3IgVFhULCB3aGVyZSBp
cyBpdCBjcml0aWNhbCB0aGF0DQo+ID4+PiBzb2Z0d2FyZSBjYW4gY2xlYXIgc2VjcmV0cyBmcm9t
IFJBTSBiZWZvcmUgcmVzZXR0aW5nLsKgIEknbSBub3Qgd2FudGluZw0KPiA+Pj4gdG8gZ2V0IGlu
dG8gYW55IG9mIHRoYXQgYmVjYXVzZSBpdCdzIGZhciBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gSSBo
YXZlDQo+ID4+PiB0aW1lIHRvIGZpeC4NCj4gPj4gSSBndWVzcyB0aGVyZSdzIHNvbWV0aGluZyBo
aWRkZW4gYmVoaW5kIHdoYXQgeW91IHNheSBoZXJlLCBsaWtlIElOSVQNCj4gPj4gb25seSBiZWlu
ZyBsYXRjaGVkLCBidXQgdGhpcyBsYXRjaGVkIHN0YXRlIHRoZW4gY2F1c2luZyB0aGUgVk0gZW50
cnkNCj4gPj4gZmFpbHVyZS4gV2hpY2ggd291bGQgbWVhbiB0aGF0IHJlYWxseSB0aGUgSU5JVCB3
YXMgYSBzaWduYWwgZm9yIHRoZQ0KPiA+PiBzeXN0ZW0gdG8gc2h1dCBkb3duIC8gc2h1dHRpbmcg
ZG93bi4NCj4gPg0KPiA+IFllcy4NCg0Kd2h5IGlzIElOSVQgbGF0Y2hlZCBpbiByb290IG1vZGUg
KHRha2UgZWZmZWN0IHVudGlsIHZtZW50cnkpIGluc3RlYWQgb2YNCmRpcmVjdGx5IGNhdXNpbmcg
dGhlIENQVSB0byByZXNldD8NCg0KPiA+DQo+ID4+IEluIHdoaWNoIGNhc2UgYXJyYW5naW5nIHRv
DQo+ID4+IGNvbnRpbnVlIGJ5IGlnbm9yaW5nIHRoZSBldmVudCBpbiBWTVggbG9va3Mgd3Jvbmcu
IFNpbXBseSBjcmFzaGluZw0KPiA+PiB0aGUgZ3Vlc3Qgd291bGQgdGhlbiBiZSB3cm9uZyBhcyB3
ZWxsLCBvZiBjb3Vyc2UuIFdlIHNob3VsZCBzaHV0DQo+ID4+IGRvd24gaW5zdGVhZC4NCj4gPg0K
PiA+IEl0IGlzIHNvZnR3YXJlJ3MgZGlzY3JldGlvbiB3aGF0IHRvIGRvIHdoZW4gYW4gSU5JVCBp
cyBjYXVnaHQsIGV2ZW4gaWYNCj4gPiB0aGUgZXhwZWN0YXRpb24gaXMgdG8gaG9ub3VyIGl0IGZh
aXJseSBwcm9tcHRseS4NCj4gPg0KPiA+PiBCdXQgSSBkb24ndCB0aGluayBJIHNlZSB0aGUgZnVs
bCBwaWN0dXJlIGhlcmUgeWV0LCB1bmxlc3MgeW91cg0KPiA+PiBtZW50aW9uaW5nIG9mIFRYVCB3
YXMgYWN0dWFsbHkgaW1wbHlpbmcgdGhhdCBUWFQgd2FzIGFjdGl2ZSBhdCB0aGUNCj4gPj4gcG9p
bnQgb2YgdGhlIGNyYXNoICh3aGljaCBJIGRvbid0IHRoaW5rIHdhcyBzYWlkIGFueXdoZXJlKS4N
Cj4gPg0KPiA+IFRoaXMgZGlkIGNhdXNlIGNvbmZ1c2lvbiBkdXJpbmcgZGVidWdnaW5nLsKgIEFz
IGZhciBhcyB3ZSBjYW4gdGVsbCwgVFhUDQo+ID4gaXMgbm90IGFjdGl2ZSwgYnV0IHRoZSBvYnNl
cnZlZCBiZWhhdmlvdXIgY2VydGFpbmx5IGxvb2tzIGxpa2UgVFhUIGlzDQo+ID4gYWN0aXZlLg0K
PiA+DQo+ID4gVGhlbiBhZ2FpbiwgcmVzZXQgaXMgYSBwbGF0Zm9ybSBiZWhhdmlvdXIsIG5vdCBh
cmNoaXRlY3R1cmFsLsKgIEFsc28sDQo+ID4gaXQncyBteSB1bmRlcnN0YW5kaW5nIHRoYXQgSW50
ZWwgZG9lcyBub3Qgc3VwcG9ydCBTMyBvbiBUaWdlckxha2UNCj4gPiAob3B0aW5nIHRvIG9ubHkg
c3VwcG9ydCBTMGl4IGluc3RlYWQpLCBzbyBJJ20gZ3Vlc3NpbmcgdGhhdCAiTGludXggUzMiDQo+
ID4gYXMgaXQncyBjYWxsZWQgaW4gdGhlIG1lbnUgaXMgc29tZXRoaW5nIHJldHJvZml0dGVkIGJ5
IHRoZSBPRU0uDQo+ID4NCj4gPiBCdXQgb3ZlcmFsbCwgdGhlIHBvaW50IGlzbid0IHJlYWxseSBh
Ym91dCB3aGF0IHRyaWdnZXJlZCB0aGUgSU5JVC7CoCBXZQ0KPiA+IGFsc28gc2hvdWxkbid0IG51
a2UgYW4gaW5ub2NlbnQgVk0gaWYgYW4gSU5JVCBJUEkgc2xpcHMgdGhyb3VnaA0KPiA+IGludGVy
cnVwdCByZW1hcHBpbmcuDQo+IA0KPiBCdXQgd2UgYWxzbyBzaG91bGRuJ3QgY29udGludWUgaW4g
c3VjaCBhIGNhc2UgYXMgaWYgbm90aGluZyBoYWQgaGFwcGVuZWQNCj4gYXQgYWxsLCBzaG91bGQg
d2U/DQo+IA0KDQpOb3cgdGhlcmUgYXJlIHR3byBwcm9ibGVtczoNCg0KMSkgQW4gaW5ub2NlbnQg
Vk0gaXMga2lsbGVkOw0KMikgVGhlIHN5c3RlbSBjb250aW51ZXMgYXMgaWYgbm90aGluZyBoYWQg
aGFwcGVuZWQ7DQoNCkFuZHJldydzIHBhdGNoIGZpeGVzIDEpIHdoaWNoIGltbyBpcyB3ZWxjb21l
ZCBhbnl3YXkuDQoNCjIpIGNlcnRhaW5seSBuZWVkcyBtb3JlIHdvcmsgYnV0IGNvdWxkIGNvbWUg
YWZ0ZXIgMSkuIA0KDQpUaGFua3MNCktldmluDQo=

