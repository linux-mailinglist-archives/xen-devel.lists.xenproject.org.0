Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2A45697F5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 04:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362712.592886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9HEJ-0006k6-DD; Thu, 07 Jul 2022 02:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362712.592886; Thu, 07 Jul 2022 02:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9HEJ-0006iC-AX; Thu, 07 Jul 2022 02:26:59 +0000
Received: by outflank-mailman (input) for mailman id 362712;
 Thu, 07 Jul 2022 02:26:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BISB=XM=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1o9HEG-0006i6-C8
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 02:26:57 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 427630ac-fd9c-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 04:26:53 +0200 (CEST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 19:26:50 -0700
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2022 19:26:50 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 6 Jul 2022 19:26:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 6 Jul 2022 19:26:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 6 Jul 2022 19:26:49 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BYAPR11MB3782.namprd11.prod.outlook.com (2603:10b6:a03:fd::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 02:26:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.021; Thu, 7 Jul 2022
 02:26:47 +0000
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
X-Inumbo-ID: 427630ac-fd9c-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657160813; x=1688696813;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l02ZgzzjtxBR02xbLyESgJpMNKJgFapPVKFCv90Y5jI=;
  b=aTNSRWnn2AKp9G4pHgCdeWDfzF0TjaEfnORMj+1ThSshLyWp176lMdt6
   WKr3rQLDcsx25ljMJYgVTU64xmFvE0KFG8yIIou2Pb2KOWKPOfGR6c+3p
   mn0zMJzNjYJ5eAXsIUDvpdkKCAA79uhpGJUHFR0Nc4XsEdG9Q5Jc1z9Ap
   +s6yTA1gsKfDF+SoB734eHmzEbrN2dNdMKqzaG01h0/M56PbwMvb5U6SL
   cB1XGqTrLUe7GijphOUTnqGquYwww0bGVw7GR7mXmGZ+nm5Y7nl7chHo8
   xgHF/GmTe9Oz3RACBajB/lTmb8ZoYpHtShAdSZz6P8cB2GCE4pe+40M6f
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272705018"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="272705018"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; 
   d="scan'208";a="696342033"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuQGcew/OQjHkx8jfMsz9X2gD0S9ZPd+j3JQhW6ObCyqlFk044ZV/7zhi93XFlwd+d+EqNBGN6dl0YvkErMRJx94CKgkhLxjDnjihx5yBN3xj/b2uJTEOPlJisZ73LlkLSkG9nG+1VGOZozjvjH+Z4x7X7reT6Q5GI1xa+nVGim0BBg9z/kwBVhKQDu3WJD3qcUVK9I51Jj7r4a/Kp52qqYps6GVKTTThvloD7cjAwO0BOz2HmUrD1xob1NW+QiPuvYfLoAQjXmCgjZD6eSp69yNOHsc5ymRVSF6ykJW6EYa5zK9DjFosQiqJzMIiEQ8G3GFaJEn3BAPRPkpNOZsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l02ZgzzjtxBR02xbLyESgJpMNKJgFapPVKFCv90Y5jI=;
 b=RVJhFCAUPbnK/qAHpYHE4UuPj5A/ryyQGNtrKQNUf/WJtK1uhz04yZ6tFaTuh9p3TIDbxSH7EQqeY38rE5icefYNmS6AOT008t4t7eRZs7lk4NQKwnC0CZFAfqgMa0Z9KfHorOXKUL04wX0axtYMD+0C8dqzH2qTEYlw8atgxcJKYsSf+xLNB18Oenum38Gdhp5E8wphONmdYVzgNi+lYhCQeTcqwA4I0r8en6MYtU/xeO2E43DdN6JJkyF/ry551dXXXQ11HiwwG45HQLyou0MfXUGoWXLAlHiyt8n7+5HHaLPLITgiIFffXjDFJjOTDg6yCVlQPYdadUfKLVzqoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v7 04/14] IOMMU/x86: new command line option to suppress
 use of superpage mappings
Thread-Topic: [PATCH v7 04/14] IOMMU/x86: new command line option to suppress
 use of superpage mappings
Thread-Index: AQHYkG0USa5jTvMMrkiGoFwB656pZa1yMPew
Date: Thu, 7 Jul 2022 02:26:47 +0000
Message-ID: <BN9PR11MB52761088A44E444AECF5489C8C839@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <7e587d78-43bf-70e5-b629-b7fbed0ae0fc@suse.com>
In-Reply-To: <7e587d78-43bf-70e5-b629-b7fbed0ae0fc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 075c31f6-bcbf-40e6-8e12-08da5fc0241c
x-ms-traffictypediagnostic: BYAPR11MB3782:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kik+e0id8xnjl9NdTmW+Y0PlexKOnxvG8j0oPeYDcz0QMfpihF3b347TKQjzh+vnylpAp875GHVEuPQHaN30wWNXX+lEk4TuYYLDPFatyk40xn9nKfM1eP7bq7mpWbKxdzXzJ2hh5eSF+2X/tw1+cVEmdDWtOOTt4Go9wRXHdmmq7r7zRpPwoXjeuCTd2/x/6KE/9sby5vMJxGhT6r+pHVsyDnmpTE+QQTUTCKlIanMpcDckkX+NPk+TjqjgVwQvXiMM0c0VZX6Z6xHPHgBbVSgsMpZaoRtpyiU+qwHaC6GE5sLC33opTr8AcbRJtfxpLW3TxSwpZmHewGc9hbvH9QWwMLGIU7ZpmCTuCa2tj/4ZUMqdVeHjwwAhsmYPRqOmow9bVolr9eF5vqIMz36xyZcLAx3HVd8eQmRowPgKfxegO7viwsp3JLlqFpzIGh3D3VsKR9FYMTalu+ITVC313ZcxRAEkf2s2PVL7s6/Ou1HCdRoKYF9uDPaJk5pXkabU5hJi4+VMMRXGylS5ancKaJInfmsgUZA0AbOKMcVt/nbT34yTerj6M9c5JoSx4HNJ91z9pogmgNG2S5tHCnTA8bFTubhp+IPFpkuoZyD6+n3Nr1xGc0rhsuYaiQhWfaRsU+1CeRP4YhxbV5dyDtVeueVEHPL8Ovwq13TopVbmAUo/ZyTdnxSJYmdoq9uI+H4m1Z13V1jR0PrA4APd6dyjQ4y3WgrMBPDQA/MUbYDtyTnlDeHE5tTKoYSAQ871t7PoH+AxiULXC4qmpenJ/HS1AOAsodZO3p+baHxz52ewp/lV95MzFeDi2zDJj1t+eypF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(136003)(346002)(376002)(366004)(82960400001)(110136005)(316002)(4744005)(8676002)(54906003)(55016003)(5660300002)(86362001)(71200400001)(8936002)(83380400001)(66476007)(38070700005)(64756008)(76116006)(52536014)(66446008)(6506007)(4326008)(7696005)(41300700001)(66946007)(26005)(478600001)(66556008)(9686003)(2906002)(33656002)(38100700002)(122000001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE9sckV4SENqWFkvNHFIbXVpKzVleFNBaFVtSktOaWc0Mys0TkFySER3dGVt?=
 =?utf-8?B?SC9VSmYzSVVORVVhMkx3SEljUXJKRmhiQ3lmbmVOb3Z2YWFFbjVJTHozNEdh?=
 =?utf-8?B?RVh6QVN3RzhCRHhITXVKaTMwaGUvMTM0Y0pnQ2prcmZ1QWFySXo5cklFVVJX?=
 =?utf-8?B?TkZpMllyLzNNSWVmeTdOVHgyMTZVOFFxQU1NQW11MlM3QlhyRUdNZUNrSHJs?=
 =?utf-8?B?bTNkanNURUhPTGhCNnBYUWpta0RQeHRTK1dSd1FsTjBZajFieThhMVNQTGJq?=
 =?utf-8?B?ZEYyTGhhbFVlZzVCb0RxMmdwbTdXMUlpL2RmTlhYUitoWlpBMGVaZlM4VXZj?=
 =?utf-8?B?UVVZcUJNMG9ZT0NiaUN1dUo0Rm5zZzdKS3dLK3NnTW5ZdG9zTjYrSDI1YzYy?=
 =?utf-8?B?L0VSRm1rM0ZYYVQyTWVpdTJQYWorcGViYlpuL0F4dCtsbHVXQ0NBWHlGUlU0?=
 =?utf-8?B?Sll1VUNBMGRUaEdpUXhCU1c3VWVnM0JLb0RsaGM4WHAvSFFsQ0doWUxJY2gx?=
 =?utf-8?B?K2FuSjZTMC9CUWZjeWFhR01MWTQrd2Y0WFJPRVFkZFRFUnNjeXZXbXo2UGU5?=
 =?utf-8?B?Qlp3KzUremVaV3htQlphNGVCS2xQYmwxaVYwNXpPdVlqWXVNWXpMbjhycTNl?=
 =?utf-8?B?UHpaY3Fqck03LzM5TCthM1JKN3ByNjlSTjl3eEtYdG1acnBqR2thbWZ1UDQw?=
 =?utf-8?B?cjBPVDlzS0gwYjFlOEJMeXVtY0JCSngvYjJNMUl2QlBpVjU3TU5RUnh4VXIz?=
 =?utf-8?B?ZTN6b1l5RDN4ME45cUR0TlM2U0VCaUJJajJ3a0p3Y2diYW1EZUZnZmtCaEJK?=
 =?utf-8?B?US9mZkViQ1JqU0E0M2tVRFV3RlU0YnRFc3BBU2hFM3FxMlJqR1pkTEhhUFRu?=
 =?utf-8?B?T3hpTmhUVG0yRE9TTm0wUGN1dHJLWWxoREJGTmpzL0NIL0lGL2pvNTJBOTBv?=
 =?utf-8?B?KzVPOHp5bFAyVzJNMVV2b2xYd3VkR2RFbllYQyt2d0IzZlRwNkRuSmZUeVJ5?=
 =?utf-8?B?MWtNSzdtZy92RUFNZUlBMHljRTkweklnYUs2Y3dBd3B6Y2lQOEQ2WGNRY2tG?=
 =?utf-8?B?U3RLUmhZeGtOYnM3eTlVZC9iZHpIM1hsbFl3MVZ3aUliaWhycWhsS1VQcDBp?=
 =?utf-8?B?MkRCUkFsbzVtSDhrTDdQNk9vYTkwZVRLOXV6cXZzVHVFbUJzclF3Q0Nkck5R?=
 =?utf-8?B?S3lrTGJ3UGtFRjVjenRxaHpWWEUvVWF0Z1Z5OU42V0VtVlpLbkhZck9mTHpD?=
 =?utf-8?B?d3d0Z1AvN21YWmN2NEE2UHR3ZEFoS0dFQzRMbVdrSG8zYnN1VXdrVDVuR3pK?=
 =?utf-8?B?SXh5OEMvV3RLT2xUOTV2NjNJcERORTRER0pkamtLRU5xU1pNdFpRNDRVWmdW?=
 =?utf-8?B?K1dtYlJ6d0tuanlHV3ozdW5ZUFpIMGFGL1o1VEgrNTAvWkV5ZFhyRWxwR3Bu?=
 =?utf-8?B?aTBaNHlwdFBkZW8vUDlhWG5WK2w2dmRvNk9aNmNGWStJZHBhZ01iYUUvUk45?=
 =?utf-8?B?T2lQK3JxenEwbzF5TjI5enczK3lwb0kxWlBzNktSNlVyK1kvR2VnVDNpQzJE?=
 =?utf-8?B?REFuSWVBc2dNcUpQRGdMdlR5RXhXWStuSGJkTzdLa2d0V1h2dVRyQUJoeWJN?=
 =?utf-8?B?dlJkcGV3Mm10U3V3T2ttZ3BFWHhmUCtTME5uNGo0emZmZk1KaDcwVVpkYXZE?=
 =?utf-8?B?eGt5VEVLanQySTl3RVBxS21QVGZnTm95cjVJL080cmRTWTVHYmJpTEFHSTNt?=
 =?utf-8?B?alU5cnJUNnJnOGVvcm1kSmp0cDc2U1ZaRFJleno3OWdSMG42ZlZsV0diMDZF?=
 =?utf-8?B?blQxMkd2WGpJUVRGaXNZSmVtRVN2SDU3SUpvemdqOWFPRDJFVWVmZVlkNnpp?=
 =?utf-8?B?NG1OcTRLcTMxT3N1UHhXNnNIbHFmdVZ6bEZ1bG1odE5iK1UyUFFtOWt5bWVa?=
 =?utf-8?B?VmJCUXdkUmtXK3diNTRGaXJIeFg1R3Z5OWUwRTlPWVFOVWlRYlhkNldySnAz?=
 =?utf-8?B?ZEVIdTdnZTZEME4yTExpNUZ4d2sxYWpoRXprVXdIUEFCUlNDQ01PL2c2cTNZ?=
 =?utf-8?B?a1VYTEk0ZHNrc3VMSFZFeGFmT2cvc1V3MzFYRlR1NDhITk9HbGpGLzg0Tngy?=
 =?utf-8?Q?p0c4Q3QMwrLzgsW0oD8tAYTJp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075c31f6-bcbf-40e6-8e12-08da5fc0241c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 02:26:47.0400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trcTcWildx9kIRYsSC49f8ykwiOZipDxZLfvYOpq2grdmw/jO4FYKkjYS5usvucC9I0o1NytXylI0Wo6JwFYZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3782
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEp1bHkgNSwgMjAyMiA4OjQ1IFBNDQo+IA0KPiBCZWZvcmUgYWN0dWFsbHkgZW5hYmxpbmcgdGhl
aXIgdXNlLCBwcm92aWRlIGEgbWVhbnMgdG8gc3VwcHJlc3MgaXQgaW4NCj4gY2FzZSBvZiBwcm9i
bGVtcy4gTm90ZSB0aGF0IHVzaW5nIHRoZSBvcHRpb24gY2FuIGFsc28gYWZmZWN0IHRoZSBzaGFy
aW5nDQo+IG9mIHBhZ2UgdGFibGVzIGluIHRoZSBWVC1kIC8gRVBUIGNvbWJpbmF0aW9uOiBJZiBF
UFQgd291bGQgdXNlIGxhcmdlDQo+IHBhZ2UgbWFwcGluZ3MgYnV0IHRoZSBvcHRpb24gaXMgaW4g
ZWZmZWN0LCBwYWdlIHRhYmxlIHNoYXJpbmcgd291bGQgYmUNCj4gc3VwcHJlc3NlZCAodG8gcHJv
cGVybHkgZnVsZmlsbCB0aGUgYWRtaW4gcmVxdWVzdCkuDQo+IA0KPiBSZXF1ZXN0ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==

