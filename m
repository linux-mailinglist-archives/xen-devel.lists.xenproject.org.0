Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF94BB122
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 06:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275068.470772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvOc-0001yw-4i; Fri, 18 Feb 2022 05:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275068.470772; Fri, 18 Feb 2022 05:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKvOc-0001x5-0m; Fri, 18 Feb 2022 05:01:30 +0000
Received: by outflank-mailman (input) for mailman id 275068;
 Fri, 18 Feb 2022 05:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkm2=TB=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nKvOZ-0001wz-Q1
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 05:01:28 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0695a7f-9077-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 06:01:23 +0100 (CET)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 21:01:20 -0800
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 17 Feb 2022 21:01:18 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 21:01:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 21:01:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 21:01:17 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR1101MB2304.namprd11.prod.outlook.com (2603:10b6:301:4e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 05:01:10 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f514:7aae:315b:4d8d%3]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 05:01:10 +0000
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
X-Inumbo-ID: d0695a7f-9077-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645160484; x=1676696484;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DeRfIz/ZZN9WK9zX+Y3M8EAmfgxbe1Ge5kugEXG99Zs=;
  b=iSIOrakMyqsrbXg1BwHEQC7K0oSTmDZm7u18xyv/o40ZGFskXMj5RzRN
   F2WjjHbq6HvPoK9gr4dWIPGAzrxeuXIJbjIw7fmLKpOZIMZdyi6G/WJQl
   kK2vUyrkwu5Tof9F85C4XdHDMQjnTqlD3DfrQjKEf7sc1Se77mnwe+Rf7
   FQqCx0JIEUfWjnsMIkYF+mDaIGKHU/dfHvxdXV+1L1TphOyJvQoR9Q7S+
   o62H5k4lj6W+x+kGEtkn8ZREpSLWn6wclX/a3Ac2Qx1rzLDLGKqq1iQ9w
   9Yi2agBF5qsg6bAaLKaEIfNKrDO4biyRQ2P6++2P6r4Mki+BAfTbqAF88
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337496732"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="337496732"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; 
   d="scan'208";a="504655328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM5FSjLIkrp/GFnrFKnKZY6G1eaP4TxlG2Hhj+kCxVVSsdfjW4zZ11wjJLuS732W2mvGKY91rJv8kK17Y809lqwUq2tM8PC1xlYsdnCrquLgmXXNcgNFVQiJ2YFbuCTUqjAmcvSonGXUf/oFJiq3d1+A4641ho2R7i6mzrm1V8OcoZM3PIpArB9vG5/FigCD40abR6+LdHf//LR/zZuDgxjMCJfMLTKpnQ1LtICOwYcwOYhCeqdpAUpzYMA+42jIUGoSLOMWkCJPOwakwoa0BftOVeqZrUwTTNtRBWQhsZ04WyYnpkZtCEF5H1HUNoKoNLzJpcajmRWzR1/M8+W2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeRfIz/ZZN9WK9zX+Y3M8EAmfgxbe1Ge5kugEXG99Zs=;
 b=U+J33e04r1d0sSIrX2aokD/bhET6XSmq8Px1DDNh7jOQw6nOjgYpkqMJELiVkqMHTXx0LTHFgNZifK7UGQZr/3em1rH7U0i2rEcxBdjnFJCr9h5Ru6IRCwz1ec0seMRi0X4OcKk49tUuRVj4lhsjKc289n5m8ZrHrnRdKyTj6QnkuIs1goIdQ3aYYhT0+8tD+JI2+BnxgJZiZv5xfAJOxvzAYLMbmeIjxbAzjuDB6q7vOpuohLgJkPfqnakl+HekX5UVauLmUTSnRrwTNO1AW1jEMOcZ0yeRny69BE/ipL79k53A+YzuIysqUdV8iWjYrqdpahLuTcnCA0Ghc/QK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3 17/23] IOMMU/x86: prefill newly allocate page tables
Thread-Topic: [PATCH v3 17/23] IOMMU/x86: prefill newly allocate page tables
Thread-Index: AQHYBkAJc6JSR61nEESS/gtIFkcsm6yY/BvA
Date: Fri, 18 Feb 2022 05:01:10 +0000
Message-ID: <BN9PR11MB52763A2638F1460EC83420B38C379@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
 <b985d619-05ea-73c1-1919-b0343e5a9b8e@suse.com>
In-Reply-To: <b985d619-05ea-73c1-1919-b0343e5a9b8e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77bd9722-8220-4264-0a4e-08d9f29bae4e
x-ms-traffictypediagnostic: MWHPR1101MB2304:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB2304D60ED003445D3B376B1C8C379@MWHPR1101MB2304.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IYtmsLVkFo0+dDUEnH7dgCYszwp8L3keCG2xuMOgLL/+JBWC2trZJCCqSQFCHvl9HImAuxbDSXOuk2kVhXS/RuFXTZIXgbJFfqGagsosa0eDBLRwB1WhWPA0xTk/OXICPy0eaFmKktI9/R2B4qDL/Ifelycqwu07gq6YS9vluA6OjOrbQw/NupPIDFfFnXO+eljDlFBQJ7LQ/2fyTrkinxvNNgLhRUm6TsfLwK7MSINL97biVt2GEnt6ZR1WsZVFwqN/6SvaMvpDc7923AmC/x+mh+7ceatsy1E1CbnYkY+ikVCzzeUwtTPAq8oUbqpLbciWncmHPLWaEDb+yuesbke01NdkZvEBhGp9srXTCJ70+0Uc3j7I0M4yoYIFMuC1A3ZzxBqi3RVDxMyJ3PpgximZyZ1f4TcY3AVvqsZ0AjgVesy5uXbgWHBDofghFQ6ENVKwuLsVjwRavnKrF0qFwMJZSWl6ar0daLznhFSO10p9H6UB3PTOahnAbF3d5b0XpEjRhv4Se2F5aSJmYz/g28zINpZklGy2pCrLhsC3vnNpgwRkQrwoX7HD94UE0LJKW4U/K+LPgSJZAbuPjqoS/QBTs3kV1zWsSdPtcHMwdhTyFZuWXjT9m7M0focDSM1Xg/L6ZaSF6qkXJFqGZQdW9BJ1evxii91nN7HF7Wfh4wrAXFaqwxGhbOonP60Qi1mTuqSwExOXtY5AtBept08WXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(5660300002)(186003)(26005)(122000001)(82960400001)(54906003)(110136005)(8936002)(83380400001)(55016003)(7696005)(6506007)(2906002)(508600001)(86362001)(38100700002)(52536014)(71200400001)(9686003)(66946007)(8676002)(4326008)(66556008)(64756008)(33656002)(38070700005)(76116006)(66476007)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmVhbGRFVTNzanpmcG1aejVjOXpETE5HWGlpUWFGdWdaRGw1NHJCOHJCRkdS?=
 =?utf-8?B?bUVaOXJtNjdqL1N0ZGsvQjAwa3dQbXpBRTNpYXVwQU8xQmZaR0FJUW5rdGJH?=
 =?utf-8?B?QnNqWWNoVnMzNW5MbVYyTWpyU1pLcUxjQmtJNHRGbU9mUUdINytMZ2h0ZWdF?=
 =?utf-8?B?MzBEM2Rua2NVcDVLZXRud0VMSXM0U2ViODBUOHRUakJjWGdhMnJSK3VFTHlD?=
 =?utf-8?B?eFR2ZXRpYlMzNUdYNms0enJ1alNRYThlblJENnBNVVFBcVc3dk1XcEc2U21M?=
 =?utf-8?B?MG5SSGFLN2xNcWxET0VqdnJ0V2lZSUZMcDUzOGJpaTVXaFI1d3pEVGprQllD?=
 =?utf-8?B?dEl3QjdsWDdDQmUveWNqMEx4TWxSZ3RiZ3Q4QUpMK3k5NFdPMTdRY2ZGRm4z?=
 =?utf-8?B?UzgxdVdKNjFkcjJHQ3hzOVdOVlZGTGh6L3JWQ3BKZUNXQUpUWHN2WFZZdk5y?=
 =?utf-8?B?WGd0Sy9UMFpoQ241WWs0Y3BpS1J5TStDWG1yMzZzdWxMbElHaC9aWnZTMEh0?=
 =?utf-8?B?cExhbW1oUVNhc2l3Y1dWTjllbThiVEE2aklsSEZlWlA1bnM5TmJXeWpMTFNW?=
 =?utf-8?B?a1Fqc09Dc013WG8zbE4wSDlBVEZWQzJNOFpZTzluVUlkTWo4VWdOVEszQllF?=
 =?utf-8?B?RjhNNGNpbWNrZFZiTTNYcEdJQ3Z6VWtxUmpEdjYxWWJ0bnFualBQa3RZeVQ3?=
 =?utf-8?B?endOM1c1NVVXWUQxVUE5UFlmUTdsNlBXdk5taVhXR2lWYlZSQmVxZVlreDhG?=
 =?utf-8?B?QkxNSHk1Wno4N3c0cm1CT254ZVB4QWs0RHNOV0VtMXE5NDdNTnRBdnFDL00z?=
 =?utf-8?B?Tlgvcm5xMms5NFJCRlpGUDJhQjFJTTV6dks5bVpDeWg2RlJCQmpiNXJwOWF1?=
 =?utf-8?B?cS9jZUNSTktvaGhHalh0aDZTdFFtODh3SCtBYjJ3QWNJMWd5U2w3OG1BaXEy?=
 =?utf-8?B?TGtYYjRtSURlampZc3d1dzF2L1NtVkNZSERtNnJPWndYa1pkM1Q1ek9Od2h0?=
 =?utf-8?B?bU5wMHZ2Y2lwUG16MjR5NEw5b2VvbDlOMzJaUEVFZlB6RWhPdFl0RVA5QU1F?=
 =?utf-8?B?YUlTY3UzM3JIOGR6cy94T25oUkc5TUlBbktnTmp1YWRVWXJobENjNnhYbnlx?=
 =?utf-8?B?TVRYMGZpT0VtRlhOd1Jnc2h2dzliSWtxMG1TWnlGSkZ2REczQmdKWllkRVNz?=
 =?utf-8?B?alh0NXJwKys3blRQczlJWGlPekRSVElReVB3L2tGcEFYb0RETGtOQ1dsZVpC?=
 =?utf-8?B?WkZZRVQ3OC9HODVZeWpjYW1melhWQUt3WXg3MDgvSXpVUlZxRWdBVGUxNXBP?=
 =?utf-8?B?NjhpVkRyQk81YUJrRGhEQ0pTY0pVRE9tcFdEdVl6T0RKZHg5dldQKzFTNldL?=
 =?utf-8?B?U1JxaFNvN05UV3RPcVNrVDF2ZGVUcHVtSGNSR0pZcHVGM2pURURaTjA2dTFx?=
 =?utf-8?B?TEZ6djU2eUpDaXlEdUxNR1kwNU1qc3Q0YkZUL3JZZlVWOGxDYjhXbi9uQTJj?=
 =?utf-8?B?U0xQdzY1ZllLMEk1cGdpa3ZoWUg2azBEMjdsYk1UV2NoZU9WZGc2N2RjWmlN?=
 =?utf-8?B?Q3liWDZvZHdLZHNjb3ZKcVJPK3Z1QlV6ZVV4ZDBJN3dMZDhXdnhsZkRCeHVQ?=
 =?utf-8?B?SVluZExzM2dzcDc0M0FFK3Q3WjVoQnFNcnIyQThtVmEvbmdYYm5WRDI1ZGth?=
 =?utf-8?B?M2NLVm1xZmdWL21qSnNBdkxwVWFrd0wwbTdybDAySDZyOXU2R3hjMlJEeFVq?=
 =?utf-8?B?M29LcktVRmFCc1FWRVlSYytqQ3N4a0JzOGNQN3RTeG8zY1c3K3Fhcnk2cHdR?=
 =?utf-8?B?ZGhQZ0ZDVVBEblZBdnhTclplRDN1ZHNRM0pkaXhYejlsR1NOVmxZZ0JzMktm?=
 =?utf-8?B?MklxVE04dGduWTNqQ212eVNRYVk4TmFYSzNwWTFDNG91eWVNSUdjaW9wVi9r?=
 =?utf-8?B?bUJYZnVkZjZqNDV0ZmptNk5lMm5lRGkvTEErVE9NU3VXRmlUd1lWOVRhOXhr?=
 =?utf-8?B?YzVVUXgrd0RxVlFWNG9RQW5EWGw5di9qdXF2K1dJVHR4Lzd1ekx3U1BSQm9j?=
 =?utf-8?B?bG9rU2hZSWVINFJicmNKOHk1c3FsQXEzcDVxeENiUFlzeGExcUo2Q00yMFJ0?=
 =?utf-8?B?eS9iblN3YzMyTFh6US93YU15OXFieTdTYng4ZWsvTEdYNmlRcWJDZWFRVUo1?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bd9722-8220-4264-0a4e-08d9f29bae4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 05:01:10.6901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vaJaW9PFz8F6XdSx9wdtjtnwjvwqWw6BsqIZEa7/ljj65nq5CdwtzXVu1w3Phme3LoYCrmUxYqQQcqoBiauhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2304
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEphbnVhcnkgMTEsIDIwMjIgMTI6MzUgQU0NCj4gDQo+IFBhZ2UgdGFibGVzIGFyZSB1c2VkIGZv
ciB0d28gcHVycG9zZXMgYWZ0ZXIgYWxsb2NhdGlvbjogVGhleSBlaXRoZXINCj4gc3RhcnQgb3V0
IGFsbCBlbXB0eSwgb3IgdGhleSBnZXQgZmlsbGVkIHRvIHJlcGxhY2UgYSBzdXBlcnBhZ2UuDQo+
IFN1YnNlcXVlbnRseSwgdG8gcmVwbGFjZSBhbGwgZW1wdHkgb3IgZnVsbHkgY29udGlndW91cyBw
YWdlIHRhYmxlcywNCj4gY29udGlndW91cyBzdWItcmVnaW9ucyB3aWxsIGJlIHJlY29yZGVkIHdp
dGhpbiBpbmRpdmlkdWFsIHBhZ2UgdGFibGVzLg0KPiBJbnN0YWxsIHRoZSBpbml0aWFsIHNldCBv
ZiBtYXJrZXJzIGltbWVkaWF0ZWx5IGFmdGVyIGFsbG9jYXRpb24uIE1ha2UNCj4gc3VyZSB0byBy
ZXRhaW4gdGhlc2UgbWFya2VycyB3aGVuIGZ1cnRoZXIgcG9wdWxhdGluZyBhIHBhZ2UgdGFibGUg
aW4NCj4gcHJlcGFyYXRpb24gZm9yIGl0IHRvIHJlcGxhY2UgYSBzdXBlcnBhZ2UuDQo+IA0KPiBU
aGUgbWFya2VycyBhcmUgc2ltcGx5IDQtYml0IGZpZWxkcyBob2xkaW5nIHRoZSBvcmRlciB2YWx1
ZSBvZg0KPiBjb250aWd1b3VzIGVudHJpZXMuIFRvIGRlbW9uc3RyYXRlIHRoaXMsIGlmIGEgcGFn
ZSB0YWJsZSBoYWQganVzdCAxNg0KPiBlbnRyaWVzLCB0aGlzIHdvdWxkIGJlIHRoZSBpbml0aWFs
IChmdWxseSBjb250aWd1b3VzKSBzZXQgb2YgbWFya2VyczoNCj4gDQo+IGluZGV4ICAwIDEgMiAz
IDQgNSA2IDcgOCA5IEEgQiBDIEQgRSBGDQo+IG1hcmtlciA0IDAgMSAwIDIgMCAxIDAgMyAwIDEg
MCAyIDAgMSAwDQo+IA0KPiAiQ29udGlndW91cyIgaGVyZSBtZWFucyBub3Qgb25seSBwcmVzZW50
IGVudHJpZXMgd2l0aCBzdWNjZXNzaXZlbHkNCj4gaW5jcmVhc2luZyBNRk5zLCBlYWNoIG9uZSBz
dWl0YWJseSBhbGlnbmVkIGZvciBpdHMgc2xvdCwgYnV0IGFsc28gYQ0KPiByZXNwZWN0aXZlIG51
bWJlciBvZiBhbGwgbm9uLXByZXNlbnQgZW50cmllcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPiwgd2l0aCBhIG5pdDoNCg0KPiBAQCAtNDc4LDcgKzQ3OCwy
OCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICppb21tdV9hbGxvY19wZ3RhYmxlKHN0DQo+ICAgICAgICAg
IHJldHVybiBOVUxMOw0KPiANCj4gICAgICBwID0gX19tYXBfZG9tYWluX3BhZ2UocGcpOw0KPiAt
ICAgIGNsZWFyX3BhZ2UocCk7DQo+ICsNCj4gKyAgICBpZiAoIGNvbnRpZ19tYXNrICkNCj4gKyAg
ICB7DQo+ICsgICAgICAgIHVuc2lnbmVkIGludCBpLCBzaGlmdCA9IGZpbmRfZmlyc3Rfc2V0X2Jp
dChjb250aWdfbWFzayk7DQo+ICsNCj4gKyAgICAgICAgQVNTRVJUKCgoUEFHRV9TSElGVCAtIDMp
ICYgKGNvbnRpZ19tYXNrID4+IHNoaWZ0KSkgPT0gUEFHRV9TSElGVCAtIDMpOw0KPiArDQo+ICsg
ICAgICAgIHBbMF0gPSAoUEFHRV9TSElGVCAtIDN1bGwpIDw8IHNoaWZ0Ow0KPiArICAgICAgICBw
WzFdID0gMDsNCj4gKyAgICAgICAgcFsyXSA9IDF1bGwgPDwgc2hpZnQ7DQo+ICsgICAgICAgIHBb
M10gPSAwOw0KPiArDQo+ICsgICAgICAgIGZvciAoIGkgPSA0OyBpIDwgUEFHRV9TSVpFIC8gODsg
aSArPSA0ICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgcFtpICsgMF0gPSAoZmluZF9m
aXJzdF9zZXRfYml0KGkpICsgMHVsbCkgPDwgc2hpZnQ7DQo+ICsgICAgICAgICAgICBwW2kgKyAx
XSA9IDA7DQo+ICsgICAgICAgICAgICBwW2kgKyAyXSA9IDF1bGwgPDwgc2hpZnQ7DQo+ICsgICAg
ICAgICAgICBwW2kgKyAzXSA9IDA7DQo+ICsgICAgICAgIH0NCg0Kc29tZSBjb21tZW50IHNpbWls
YXIgdG8gd2hhdCBjb21taXQgbXNnIGRlc2NyaWJlcyBjYW4gaW1wcm92ZQ0KdGhlIHJlYWRhYmls
aXR5IGhlcmUuDQoNClRoYW5rcw0KS2V2aW4NCg==

