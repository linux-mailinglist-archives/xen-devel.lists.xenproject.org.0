Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E345B11D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 02:24:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229984.397625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mph0k-0000DG-OU; Wed, 24 Nov 2021 01:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229984.397625; Wed, 24 Nov 2021 01:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mph0k-0000BK-K9; Wed, 24 Nov 2021 01:23:46 +0000
Received: by outflank-mailman (input) for mailman id 229984;
 Wed, 24 Nov 2021 01:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/oH=QL=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1mph0i-00082u-SO
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 01:23:44 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 282375ab-4cc5-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 02:23:43 +0100 (CET)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 17:23:40 -0800
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 23 Nov 2021 17:23:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 23 Nov 2021 17:23:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 23 Nov 2021 17:23:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 23 Nov 2021 17:23:33 -0800
Received: from BL1PR11MB5429.namprd11.prod.outlook.com (2603:10b6:208:30b::13)
 by MN2PR11MB4400.namprd11.prod.outlook.com (2603:10b6:208:18c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 24 Nov
 2021 01:23:32 +0000
Received: from BL1PR11MB5429.namprd11.prod.outlook.com
 ([fe80::9061:212b:2fb5:41d0]) by BL1PR11MB5429.namprd11.prod.outlook.com
 ([fe80::9061:212b:2fb5:41d0%9]) with mapi id 15.20.4690.030; Wed, 24 Nov 2021
 01:23:32 +0000
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
X-Inumbo-ID: 282375ab-4cc5-11ec-a9d2-d9f7a1cc8784
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="234997316"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="234997316"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; 
   d="scan'208";a="553635846"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avMY7VpRYXsNqzLEl92zzMMGT9PMW9si5shQNSrXa/mvVnr1EcRtrGDRFPj7UntS5FxkGGSn1gk5XhCDNIyuHBctncEq9GRvjm1m3fiQNeMGQT5qedkKVMEcN/Jb1DWqdYGA54GZghVF3aWrggftHY8EIhjUCbY2Wu8pKorN7pWzdyZI3jtoa27agcUQkpK31cn/15yOTJ/ZC1S73GP4tq6lMwi+yMcFwWIqLLytOjanKJblAbfJ4V10W2saY1HZ/mRm2JQtmtDqCG2IBYq+OnKOYEAHlUxNQ+T7R0cAQ02lfZHc5oLhR6/D7UDq0e7rqwCflZrTJUI/SV+5gZslig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnGpOOW9MY3UKObvDa0TpCDhi/memOjYMSQ/gF8TW3c=;
 b=CWyM3+ND56oli6CYJLlNulVtmmLm3FN2I53DzuD2qQzMvj+VnlekSqtNQ13WGmtPa24bpbnhOZFgVnpeJKmfFjHifs/yQY1SRdTrM6Ru9HPNfEafKAwr3Lzp5zg3II6/JOx2TrSZJG1YsTbQZ5XhqEIPV6MbMLFFUBHC3Ly+3ervvlWWC7M14LLPjL3DMo4eNxl0615y9Vb02HQstqKtKpV5siodrWT41gdxR69jeCJHwwOCc9AKXJrkyEVaKizjJKR2XqHhxwhwALY5EeUCZYRYSadK5rAYohzL8epB6J8ibQgnmJgU7LStChOuLkRAEB4OEcxwVHsTaj2vfdnPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnGpOOW9MY3UKObvDa0TpCDhi/memOjYMSQ/gF8TW3c=;
 b=fxoyS2iMvzhUNnA/THIcZ0f0mUOEu470tFpR9rjpwrIF6t3eba4geYVXB5DWPy41pP84jzTK3eF/e1GQJA2gs0idLyla/eYEDIMMPGJsY+X8V83LVUbPAH8OgzGB1Bv+AW9xtqCeiD7/uUG2U8g2OcRqgSrBNGSShhgUJrYxKMQ=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/3] VT-d: correct off-by-1 in fault register range check
Thread-Topic: [PATCH 2/3] VT-d: correct off-by-1 in fault register range check
Thread-Index: AQHX4G+tcPZ6n1ych0OjZ1PkPCH9PKwR4tgQ
Date: Wed, 24 Nov 2021 01:23:32 +0000
Message-ID: <BL1PR11MB54291EC9078C0D7CB486FA4E8C619@BL1PR11MB5429.namprd11.prod.outlook.com>
References: <54e38a20-5281-2ab3-8513-3506ab66dbe8@suse.com>
 <c3627c85-916a-40eb-9601-9aba87eaf8ad@suse.com>
In-Reply-To: <c3627c85-916a-40eb-9601-9aba87eaf8ad@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af190403-64a6-4a68-95a8-08d9aee907b5
x-ms-traffictypediagnostic: MN2PR11MB4400:
x-microsoft-antispam-prvs: <MN2PR11MB440060A6A7A80F07230548178C619@MN2PR11MB4400.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BKWCYxeoKvLnlfeSAgAQvL60CUc4i0yBXEvqNemT7svKrF/q9pAqn7gtDOr+kLOjidE9No/pnY90whW1uh8LD9lPVB5ld38w/dIv2FAGnQSHKelJgyKRjoElsc15T/duN1k3pm+WoZgKtVZx/I+KF7oNgrXR944saMSKABzvzaO4THSzsVXpRvawxPQZrQ14LgXWifHWHxvCWV44EsO+Edksa4QOPWWGfONvOZ14XjLfPcZghnp7jXeaLQidmlQQtbfuZM16Qr0wDs0lHOFQg2BlznE5OlpkMNipmVprGxEj77uoZyO4FL29scnun8xWuAj7DOrE7DciTti6uuKXrZoqO3wCtysziOqlo/3BKyUB2P1rFdyWLN7hssaZg5efji2V6RpPBIg2VqLIgFUuoZjYEGzMz8sPMmZYrvHnuNLF3Zj0kc7MBOfq+vXWFC3kSxlU7O34l7Fdw7k10UYixFGLIc7KAjDYdOfHmFmntUVGi0ECDcEI64wuDC21Zyp43EhGI9um1pXbgPpYFmTiCu7KWejFVkvAKypLSczwjbuTAPtRkRNNg6xqUC0rLTv2jBcYbl2VkbRGuXVLFLqHiuyp6a40J3cMyVjRoVPEyvUWKZx+eha6A3Z/GyV4jCL2I2jzA0kJ2IgRHfUvw1YJr3vKWrPSIz/eyrG/Qjr6YUCYPQyFBddkjiJ/wekkGYxkdU2h2IvqaYtdbe0TE8d/lg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5429.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7696005)(38070700005)(8676002)(26005)(8936002)(110136005)(33656002)(86362001)(6506007)(82960400001)(186003)(38100700002)(64756008)(66556008)(66476007)(2906002)(9686003)(71200400001)(316002)(55016003)(66946007)(122000001)(66446008)(508600001)(4744005)(5660300002)(76116006)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFVZdVpwcFZ3cFdRa25zdXlLbUVzRHphMWNwUUVxNHo2VTVKaTd1alBsWFFv?=
 =?utf-8?B?KytYMGE4RklwdjllbGphVHFpYWlSblFIem1QblcwMzVCRjUyYm1yZTdlQlBi?=
 =?utf-8?B?cTlHVEUwNm8wTDJFUUgxYmNiN3R5TWRtTWZYYXR3UlVvSnArUE1mNnQwTWQx?=
 =?utf-8?B?eFlJU1gvdDFVM2MvbnBBUWZuc1lOb3VwbTMyRUJqNjV4aU1uY0lndjFETVRW?=
 =?utf-8?B?eldEWDBqK0ZzRTBlRWJDa3dYakhxVHA5eVBobE9jc1RScW5QVTBoUXRJMVpm?=
 =?utf-8?B?V1BEcG9XUlA1aXduSThyNmg5dVY3ME1yMEdnSGEweGVHejJ1L1FTa1pPZVdI?=
 =?utf-8?B?c1dtNU81OG9hSk9saTJJMHdFMG93K0VtUGN4VmU2THZOakpzbThMTStRS0tO?=
 =?utf-8?B?N0RVRmloNjFNdjBuR21mRjJ1UUJwdklnRTlsQ2R2bHpnbHQ5TmFlbnFRNVlv?=
 =?utf-8?B?aVhFMXR4Zks2QkJRQUhST29taU9sWVhObVgrVXZqYU4xT0JzUCtLYnR5RDJX?=
 =?utf-8?B?ZnlTU0VMWCtjb3E2TmNOVm5YVDE0NEgvdGdBaE1Pa2JwUVJEK1paVnAxaS9i?=
 =?utf-8?B?MCtoVnFEbWhsb3F3Z09PWnRxZHJRb2FPcm5HTCtnTlJLUUIzT29rZFZUK0o1?=
 =?utf-8?B?VkJqK1ZqeFZqYnhGbVRDUjFWUGZxSWdVSmw3WVNFWVhGN0pFdE50UU9SbDRC?=
 =?utf-8?B?c2xlZFRhQ3hqdHp3NCtMYmNyYlJ3UWFPUW1tcjVjZk9ZVkxmUlBvNXZzb0oz?=
 =?utf-8?B?bUNFYjZPc3pwa2V5S251TjQ1UWsrbmhZUmtmOVlORCsxdGdqc25abnloVWZa?=
 =?utf-8?B?V1hPSm5BNkl1NnZIT1djdXEwbVlXSG9PRlpCWm5CQjltNWRBMS9NQ3V6RUJh?=
 =?utf-8?B?MWV3L0dtWDJXYkRSeE03VlpxajJTQzdWL0p2a2ZiZTkrcytjRHR2ZUVqZE8x?=
 =?utf-8?B?YytEVmM1SXlYaDFERG1ZeGdHWUg3U2JVcFgxWCsxYnZQZWNRWmMwQVpmQ3I3?=
 =?utf-8?B?cENTdW5LNFRlZzRRb0gwWnA1VUIwS3dHRU1BeFRhTmIyL3ZBR0p1cm43eTBt?=
 =?utf-8?B?b1RCekdLazUxZHBocGxyZzhFKzZ2Yk1mVE5Hc3lQL3ordmplR3pGeE0wZmV3?=
 =?utf-8?B?RDVHRmpOMGRScmNsOW85QmhPNUEvYm1EWCtsM3RkUVEzcUVCc0tQanlyQnAx?=
 =?utf-8?B?azVaN0pBNWx3SGpVekEzZ2NTa3VGcURmcUNIVmd4K0UyL0FVTlVyMVZuZnpN?=
 =?utf-8?B?VjBXSm5oMGk5dXNvTkVmRlhMT2FSemtPaldrQjFMWVhkUDYyWGJkUlQ4Mjkv?=
 =?utf-8?B?aFhxSDZUYUxzcmdLZG1VaThpNUZMQU5EeThRVVNPTVIrNkhxanNSUGQvREpQ?=
 =?utf-8?B?V0oxU3Vzck9pY3pkVy9JMFdzanhGUW1uYnowR1lUbGd3YkZFdlJackJlUDhW?=
 =?utf-8?B?MG5JcUhpdFh1WEpVVkwrQnFxcWxuckdzc1hLVmdjcE82QTRPQlZ3U1RlTkRH?=
 =?utf-8?B?TUV2cGtka09Dc0JGYkxqbExJOUVlbVZYS1kzZk9rRXFhL0dhSWNNQUVEaDBB?=
 =?utf-8?B?enhUZDBoZkZBRzZ6d1ExYWFFNG5Id3Y2MzFKeXg0cytTM3N1TGZuK3VUVksz?=
 =?utf-8?B?NHE4L0xBRWNMb1ZrUnNKS0t6TE4zNk9oVkllMlBoK3NxeVlaS3NBak4xeVlW?=
 =?utf-8?B?TDRwZXk1RHcrcFkrd0d3N0xzRjQ3UnJPajhaMjU0NC9NSUd1cys1ZVM4N1h6?=
 =?utf-8?B?bWxkdTdXUkVnRDFUVE53NlVkQW9MT21HOFVHOGlQQ0pzSFVLNkNJa0g1WEFw?=
 =?utf-8?B?ZTRPU1kzWHNhRERhZlliSnJCSVFWSXFtWkUrREwvNktsRG5zM1dZSlJwdmF0?=
 =?utf-8?B?VmgvdndwRTBmOU1QZ3FuM0t4aG8zYk8zOFdiZktpUWhIQjZlWDE1OTFVOVJR?=
 =?utf-8?B?M3VpL3BwOWQ4WmNka1RpYnVkV2pTZzF5ZXFvb3E3Mng5ZkQ2LzFMWjdpMlZE?=
 =?utf-8?B?Q2QxTTQwVTRDUHd6TnhBOU9Cem43bXFXb2FjTlBRU0hFZ0s1U0p1S2dBT0lN?=
 =?utf-8?B?ZmwzcVAzTm9PRkNNN1EyRStPdkF5Ti9uNE0yL09LRlNDV2dFUWgvQnpodUNy?=
 =?utf-8?B?M1owWTNSZXN2dlhrbmtnUmhvMHk0WGgraHdkSzdibkYxWmh0cWZpM29kNnVB?=
 =?utf-8?Q?Cew1SnST6VDPXQBZZiz/UFA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5429.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af190403-64a6-4a68-95a8-08d9aee907b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 01:23:32.8235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55Xjpa+qVEmQDe0NYL+MZicrmIL0OlXVpw/UdK/uvc3a+LSDuDt8uxjt/j/u137654CZjSsoplixw0XEwWGYGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4400
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE5vdmVtYmVyIDIzLCAyMDIxIDk6NDAgUE0NCj4gDQo+IEFsbCBvdXIgcHJlc2VudCBpbXBsZW1l
bnRhdGlvbiByZXF1aXJlcyBpcyB0aGF0IHRoZSByYW5nZSBmdWxseSBmaXRzDQo+IGluIGEgc2lu
Z2xlIHBhZ2UuIE5vIG5lZWQgdG8gZXhjbHVkZSB0aGUgY2FzZSBvZiB0aGUgbGFzdCByZWdpc3Rl
cg0KPiBleHRlbmRpbmcgcmlnaHQgdG8gdGhlIGVuZCBvZiB0aGF0IHBhZ2UuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5
OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg0KPiANCj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMNCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvdnRkL2lvbW11LmMNCj4gQEAgLTEyMjksNyArMTIyOSw3IEBAIGludCBfX2luaXQgaW9t
bXVfYWxsb2Moc3RydWN0IGFjcGlfZHJoZF8NCj4gICAgICBxdWlya19pb21tdV9jYXBzKGlvbW11
KTsNCj4gDQo+ICAgICAgaWYgKCBjYXBfZmF1bHRfcmVnX29mZnNldChpb21tdS0+Y2FwKSArDQo+
IC0gICAgICAgICBjYXBfbnVtX2ZhdWx0X3JlZ3MoaW9tbXUtPmNhcCkgKiBQUklNQVJZX0ZBVUxU
X1JFR19MRU4gPj0NCj4gUEFHRV9TSVpFIHx8DQo+ICsgICAgICAgICBjYXBfbnVtX2ZhdWx0X3Jl
Z3MoaW9tbXUtPmNhcCkgKiBQUklNQVJZX0ZBVUxUX1JFR19MRU4gPg0KPiBQQUdFX1NJWkUgfHwN
Cj4gICAgICAgICAgIGVjYXBfaW90bGJfb2Zmc2V0KGlvbW11LT5lY2FwKSA+PSBQQUdFX1NJWkUg
KQ0KPiAgICAgIHsNCj4gICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgVlREUFJFRklYICJJT01N
VTogdW5zdXBwb3J0ZWRcbiIpOw0KDQo=

