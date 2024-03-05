Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F78711F1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 01:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688551.1072820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhIyp-00005g-De; Tue, 05 Mar 2024 00:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688551.1072820; Tue, 05 Mar 2024 00:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhIyp-0008Uu-Aa; Tue, 05 Mar 2024 00:48:27 +0000
Received: by outflank-mailman (input) for mailman id 688551;
 Tue, 05 Mar 2024 00:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=41xS=KL=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1rhIyn-0008Um-Th
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 00:48:26 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10a8f7d8-da8a-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 01:48:23 +0100 (CET)
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 16:48:21 -0800
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 16:48:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 16:48:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 16:48:19 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 16:48:16 -0800
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 00:48:05 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::39d:5a9c:c9f5:c327]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::39d:5a9c:c9f5:c327%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 00:48:05 +0000
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
X-Inumbo-ID: 10a8f7d8-da8a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709599704; x=1741135704;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rxDH0q8yuC/kgo4baYZFlz6wgNJvXRfO1fIst9UQQZ8=;
  b=VelIXN5fHYewZv6iRwC4sqYqu+BYrOvSy6CYvfl9V9NqoJtd6H4bAtjs
   OPl8dRtuotxr54GayTX95ast4OGCSh9HGWkzUG/880HO17nfJRvLC58d2
   Kw5JodEWiyioqJUhFCbadRYTppXbPV/fCE/xRRTblhg0CQ6N+HxjLlBWa
   UnIlCJ2gDj5zsPkIPs9XFl9+Wcr3m8/zh38i10ndG0aJ3urtbS9cNNwxd
   uD9qxO4PMW6MUCEs9u5JMAUkFvXDXkYTGbiEaaIiLucwV4PYgYnz3Scms
   qaq42YUOQxNaY4qsfBCh1CIKDeaJ5vY/MjAxI9jIlyhB3EYQ5plSjPDy2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4005157"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4005157"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9025911"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhZl/tHOphDTDiNED4pqxXIn9e2qyvIPFrRVk/pnTyk+KIlHYJhbXOLHReSbXjHYsH+WxY1tVVJw6soAhEfanGRlnhg7Oe3HVGgUyWLZctxyWWcAQU2aUcpkrM1dE/0Wqs6mhBoWkByKHB7MWRC6+a11q1fN2+ijU1G9KrvXbwj+QAw0925T+YlRpGigA2Mi9M2NnZQwogfahcRN2ZHK2yIb/TwqGeqSMGL8epzA6paPFi/jQHJmqTUBWm/wgUleE/OyojaTLOcvKzHWujJ+TV4aCgZ/+tk1z9o0D9PUFIvlZMDsucUA5ZxUiKcObWEezxyER4EzLlPdQ0Rgrr/vfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxDH0q8yuC/kgo4baYZFlz6wgNJvXRfO1fIst9UQQZ8=;
 b=NzZJZi+XOvUhIYHi4+k0xBr1rUAHTCTy8zLqwf/kww3hDRQkOFZDWkBlMfsZB2IS8yQDK5eL14N0IRgeqoLtHzx4G5nt6s1oUGT2WWBMeRBv/hjokPS8al+08uXkmFjoxLEcKUr0IuqDypG9JpdyAYffYlEft7ieyWDGDL3BGoURFqvkuWjbZ3UkhaBRQsPCpY0O8gsR898WPoFs60Y1ZPtTEaTZ1sH2BbeLiocJCe14HQZEPmKG45NN4p5CcrWJVPFU0lXBuWzZori24tujnzAEE8mX23xXhMy6vTypGpYMK0Vc4NlieygA+alJiDs0saVOtne0YPe6czCovUiQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH] MAINTAINERS: drop AMD SVM and Intel VT-x sections
Thread-Topic: [PATCH] MAINTAINERS: drop AMD SVM and Intel VT-x sections
Thread-Index: AQHabhY7yQbpZrz4nkSVm3UgsuStHbEoUIEA
Date: Tue, 5 Mar 2024 00:48:05 +0000
Message-ID: <BN9PR11MB5276C8E222D83BDAECDD08118C222@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <ff10dd86-6894-434f-b2cc-9407a83a3487@suse.com>
In-Reply-To: <ff10dd86-6894-434f-b2cc-9407a83a3487@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CY8PR11MB7034:EE_
x-ms-office365-filtering-correlation-id: 7ddaa7fb-6b7e-42ae-a959-08dc3cadeb29
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R/ZbCMJP4j/M6c1S7noXSyES0hHFptvnf/r47BqBrOJ/ZVZ/LyJUyptdnAplHI7UBqBGG7bz1TuW6bQEfKOLZ3zHEEkKqW+lCKX9eBIqFrno8RBu5ChamYPTPPD5FzV9SSd0JQSEzPQbb45Cizu/zIY7JlICnZgEaJN3Pk/3k7dQ16knpeaWAdH51KD+5aZy1J3G+NGAlMxLT0KMp7+f93qqz2Sd5JFeBftk0Wygf5+QgouH4TEk1liw9/nNThCtnQBlwpcQrmFY/QBKpRo9nUYe8eBz+MxKklKmN+3+ntGf1rlT5hIEKlJK9J4heVunz3iQewkAaREs7YWGWZXea/gkw6+t2S8O9CdoFOviSZZP7S3BsPjbxICQJLq2LApJhxDD7IIuOEu0tcspk0TQRkht9hppPt4hyZutlfyQ450yh/vAeHLSKjN1zFEiTomHKZcp77J0A3vFP7Sg982coJLKxF2tRI7JdT+SoDq7c1kvjgS0Ph2ZXJ9dj0+V9YdIOiYed1c4e8wEEgLCFKDv4gQ1L2YRJzfL6RPelem1NT8Y+pjfNT3S9yctTp5id+Ro+218UOgpPqtca2BohixV2yTG8S0yjXZA5FLtQirEC8ehSkuKKPZ2WcgpuwZqn2XGXXoHAC5qOmU5S/n4S65rcUzmNd4taLeLG4P83rci+Pp7LdnObMBioNnvDr8gqtVTJuZryG3UppHfGLfooEax1bI53QghyST8RAw80+l9mBI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEVzSHJaSVJkbXBxY3hRWkFnN2VrWlgyb0FGUGtsR0FHVjBIdUhPaGNSdWYv?=
 =?utf-8?B?N0ZsQlFjNzFscy82R0I2dVhuL0lpUkJpZTdGMEw3MmNzSm1FaFlPSVJWT2s2?=
 =?utf-8?B?akh6V0N5OW5XdG42MnpySnFxUXBQZHFJak1Kd0szUGVjSUE3T3gxY3BkRXVR?=
 =?utf-8?B?VUNJa3Y0bGF2Q0dvVkZWWEFTbVNCRUs2em5XNllGUmxmZUdHWUl3ZXJ2Tzhq?=
 =?utf-8?B?N3VqaUxYQnN0TFB5VTNMTW5SVnJmN3dJK1BWanVDVGt5dkpLWnhnSUU3WmFz?=
 =?utf-8?B?TmNqRUdsNTR2ZHV2ejU0SVM3dHpzc2J3aVkvOXNHZEhudEJ6QjEzanlBMWcz?=
 =?utf-8?B?K2lQM25kUUF0YnF5WDY1ZWpVUU0wS1NWWGZHdUNwdnZwSWFhb28veUp5a3VT?=
 =?utf-8?B?M2cxc3krd1RnSE84WWZWK0ZaTjdXUklLeHZZeVZrOC94aURPTjhwNGNuVjB6?=
 =?utf-8?B?dzhvT21icjAvNDdjMDFlbWhHWHpnOVVINWVvSHh5VjZtS0JrWU9uVFd6d2lB?=
 =?utf-8?B?L0ZxSjB3R1FVd1RJWGNxQXJXVkthUXV2ZE42Mms2NkVydktSRTVxQ3FEY1Bj?=
 =?utf-8?B?RXRPa3M5cWttSThLQUNjeVdTRXJDRldCL0VMMjlsTVdKUW0zS1NzelBsQ0du?=
 =?utf-8?B?MHFScDduRmR0K3JybytXb0VhRVJEOVNTY2g0YnpERlhJZGtWbHdlMC82UVFa?=
 =?utf-8?B?d3dqNlYvR0NHYW81dUdMa3RPMHF0Rm0zZjhWa01zOEdlQk5oY0tDK092ZzN2?=
 =?utf-8?B?czV4REJPRmtrRVpxK3RsdU1mbzhBZzJuOUdWb0k1WmNYNUdCcDZzL3I4VnpG?=
 =?utf-8?B?ejVBbzY3MjJ4ejRjSEdWN3JyaUkzcTA1VmRjZVVFdVk1Lzc3Z3NUdlhyWHFp?=
 =?utf-8?B?UlFGRGZUR3NqYStabzREYzJqcmNkcXBSUEc2QmJxcTBWZDFHNmQyUEN6TGpx?=
 =?utf-8?B?RVNGRDA2aFkrdnd2QjdkVXZwZmZuUnR6QU9WQk5PQmpsSnlXQjI4UHpNL3NH?=
 =?utf-8?B?a01BclNjQ29zd0ZrYXVJaGVad1U2SnV4SU5pQkxDOHRIaUtlcDhjaS9XMHRB?=
 =?utf-8?B?a0dMWkJ0Vm00czJFSDI1djhWVk9tLzhaSDMrazZ2Q1ZkTC9SZlB3K3Ewd2or?=
 =?utf-8?B?RXpYa3FJU0lDWG80dmVXN29ZK2lGSlN6bytmb2pnM2VoMHVOT2tOUUhieml1?=
 =?utf-8?B?ci9LeU1STzg4YU5yTmFYQVNxWkRiZ053eXBtdkJxaDcrd2Q0WG1jNXhyTGda?=
 =?utf-8?B?aDRlemtXNEpibjdiWENhZ1lkT2l6ak5yc2lyY1RrYUw2WisyOFBoZEVWbVFr?=
 =?utf-8?B?QTF1Ti9nVGJjV2U1dERMWVU2bkZwM2xlYUVLRk9JWERYKy9hMHJVQjZyY0sx?=
 =?utf-8?B?R3hKMG02M0N0MVZ1TGt6bEVMOUpTSFRTeUs1RzJPOE1CdVRZQVhIb0lxWWQ5?=
 =?utf-8?B?cEprYlFxK0ovMXVxbnR4c1ZrWU1jZFFCWGlkVXZSNU1aa1ZrZmJGZWhSSWdw?=
 =?utf-8?B?U1dKRGlyTUN1ODFyQ1Q5eGVMMVdGWWpsMkZISzN0ckxmMGxlR2F5U212NHhE?=
 =?utf-8?B?SVlMcXZ4bXBRY0lzaEZaMW85N21VbnlmbzlpNEdaRU84a0QvN0Q4NndlWFds?=
 =?utf-8?B?cUNlQ0F5amd2VnIvVU14NnlaYVU3WHMraFJOLzNLc2srNlJYd081aXFReGVE?=
 =?utf-8?B?ZDJFMHZ1RUhnVSt3NmE2bkJJRVR3N0ltWHE4a1pZY0YwR3VGZ0ovMzVLRCtR?=
 =?utf-8?B?ZjRDYUhJVDJqTzk4WlRIUytYaUlJRkp3QTdKSFVaMGVFK2NkSjR3TGlZSVJZ?=
 =?utf-8?B?eE5NZXZvNXNSZ3U5Qjl1OHljZjlJQzNtTnRXUmVjRFVGSnhtcWZOYVZqL1R5?=
 =?utf-8?B?R05PUWM2ZTdHRk5jL0YzUFFoSWlLd2JBd0RWaXVpbXEzN2V5VTIzcEVNeTRO?=
 =?utf-8?B?QWs0NGU3d3NiYWE5V2Y5R21lVW5PY1RidHBQRk1CVllKQXErQUtsL2Z3SC9G?=
 =?utf-8?B?UURpRDVESGRuNXdMWi8yUVJ1MFpkVGxUVlNPbDJhUlE0SWlrR05tYzFaZmU5?=
 =?utf-8?B?WmcrUWtmKzNVWTR1UnMvRTFtYlVuSURsekNvTFJXZm00aHMwamxoRHdBaHFs?=
 =?utf-8?Q?P+cd/dMu9JBlFfyw8uDogHTcX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddaa7fb-6b7e-42ae-a959-08dc3cadeb29
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 00:48:05.1532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pq4nHYfAee2X7A1PE6RGKJbmawXsxILf8q1HuxKV8TPz63vitkL34liGItTtz48HqX1ohEiRJIw2GgeBF16/3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
TWFyY2ggNCwgMjAyNCA1OjI4IFBNDQo+IA0KPiBXZSdkIGxpa2UgdG8gdGhhbmsgdGhlIFZULXgg
bWFpbnRhaW5lcnMgZm9yIHRoZWlyIHBhc3QgY29udHJpYnV0aW9ucywNCj4gd2hpbGUgYXQgdGhl
IHNhbWUgdGltZSB3ZSdkIGxpa2UgdG8gcmVmbGVjdCByZWFsaXR5IGFzIGl0IGhhcyBiZWVuIGZv
cg0KPiBxdWl0ZSBzb21lIHRpbWUuIEhhdmUgVlQteCBtYWludGFpbmVyc2hpcCAoYW5kIGZvciBz
eW1tZXRyeSBhbHNvIEFNRA0KPiBTVk0ncykgZmFsbCBiYWNrIHRvIGdlbmVyYWwgeDg2Lg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCg0K
QWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0K

