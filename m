Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC2766185
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 03:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571309.894854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPCiJ-0005xB-I2; Fri, 28 Jul 2023 01:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571309.894854; Fri, 28 Jul 2023 01:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPCiJ-0005ts-Bi; Fri, 28 Jul 2023 01:56:19 +0000
Received: by outflank-mailman (input) for mailman id 571309;
 Fri, 28 Jul 2023 01:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5zQa=DO=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1qPCiH-0005tl-No
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 01:56:18 +0000
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec8eed93-2ce9-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 03:56:12 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 18:56:09 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 18:56:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 18:56:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 18:56:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 18:56:08 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 01:56:06 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8b87:d7d:f095:e3f9]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8b87:d7d:f095:e3f9%6]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 01:56:06 +0000
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
X-Inumbo-ID: ec8eed93-2ce9-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690509372; x=1722045372;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tHLFkaFfEuzPmItb1hF8WoC77OiTAzumSDkgZHm2CqA=;
  b=kaB9ytT+rKxfvF/kuC6HcxVTwEdOMx3D+d/Z+f36WhSjIooMb7oAPtje
   ALLJxH1IAFqgBMF4e1U8/LrRs2uwN6EXAf57UqQZV1RuvFrteyxK0n6mE
   hWZ3Ui2znBnSJrMcJK/dsZQSKlXodjJqrzlJSJNB7g9WWLhXR12pX4wBu
   7o5umJ2/jaOGE8S59o2RXlG4Qj9JCFZya8+u5Laiom9R9e2Q64FD+Oz2E
   fg3j2HON/ekpNhOFoIp7f7s1wXN8dPd5VzVXv5Pxc6X3ciywd5cG8Hi9l
   q1YgUENsx7yd/KRrrzd03/ENZNZ2fANajqyae/67tIpwzt+nVTGF/UvcN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399420014"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="399420014"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901047371"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="901047371"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXGigQLMuG9GzXIX2U0cCgzTXiEfpdFJnS1aWNRgJbntJoltAOo1BtnrcaaMaG+8ZRZ3PZz6FjhB/2G6nFp6Yqt4Bu8sdhKpJ11CHVo2YVLyRNl1NUnDXTuQ34/MwF2mJKHcfL0NhojVeLaQMyKfGAK0ir5DKcMNGwnM8xH5C/PvF2queOKbJzK/oLsC3uUxxoNCVy4zrLOd96JOr0/XtgNtcbuFSmxg6SyWOKVWM4XqmGts8EIeZxxFV3b/+eesAMF7CMave2977jsMXQ5igN+KkwWpn1qasj19h504zIbZ1h9bC37SijYaYTLQYKMci2jvmhC7ZMiIElod4mwsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHLFkaFfEuzPmItb1hF8WoC77OiTAzumSDkgZHm2CqA=;
 b=B5QSsUhrLVpKkxVWkJmdJl9Aiqwp/qoputzfSWc7Mo9wg/oO90TxnvwmudwCjspct+D5kjpGZsHfkfxrhBqyx0xjC65El15pEoj7VUh+Hb0lPBBEDSLR2sTzEIdNvFVQgrnfHepU2/ZsdpJ1ZCvkUjosdd1OVfVr9gDNkn2VYM19DAP/rhEK2GUeAEIvYP24E5ObnOPP7q3GciXdJMnjZFsazQpi1hpBLh2rAem9Hcl9yCTK3/4Y8smuavVMBKxRpuZ1PbpP1Nr1w8yIM+ct+tjCUoZOWXAwdyT9wqOAMFOThxFvoqbspMOLzfmRcoIZ1Y4foeYRQrWPnaZod6O0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v3 3/4] iommu/vtd: rename io_apic_read_remap_rte() local
 variable
Thread-Topic: [PATCH v3 3/4] iommu/vtd: rename io_apic_read_remap_rte() local
 variable
Thread-Index: AQHZv8CNKV9fhB5waEiLQIrydqL0pq/Obb1w
Date: Fri, 28 Jul 2023 01:56:06 +0000
Message-ID: <BN9PR11MB5276EB03801301AF26A3FC408C06A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230726125508.78704-1-roger.pau@citrix.com>
 <20230726125508.78704-4-roger.pau@citrix.com>
In-Reply-To: <20230726125508.78704-4-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB7411:EE_
x-ms-office365-filtering-correlation-id: f15d0854-f79c-4d7a-b06b-08db8f0dce54
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KDN0pBZplakVjvvX3Eluo6osxYaqDdLEpVgnNoz7oYgHgsklGxQVkVisWZn7PDR9fR0peb/+ptX5EFrur4jYn86ZhOdyK7DDQHZtnKsF4io+jWkvWSOEMoJzd2Q3VAxpKNqJe4crcc0X4Vr9RDGsIEyngh2mCIWQ/mCAeI8PwYJ4RsKR/gBoGhE1bTTsyH8V17Zj/NXMmFEJVvcBMrd2A6a5klIbIFDjJ33B1P/FLyIFLVkEcNtZFwYi+t095Alhl85q7o7uFK21Dung6T0a3rxzByTRpzoon9rcvPJA9SgeM+TSK0fQaaUHsVhfi6QXrD/Ae9eMY63HDlkIPGo8IVd7XNzqA98hjt6XO9TXu3qpONHdb2kN/Z7b8JGHwreKfYUrz7cuyxUXXywjkviZtLIcd5aaaxgYaQHv1ctgWbg+iVKcrPaGoZAogbHLdgyJ4T4ZetavAnozYXabNSZRVIzcRZMX78v4wC4u+W5b0SA7pfDl8koASdewbOp4+gm7ipkgIe5SJAzcohUFHB2DPgSjiQyUZFZSO3+ZZB8FTZSTUIANXLR2bYcrKLtQninBYjkKp5W7f7kMaA7jhQetExgeVMgudzE/YS5ScVNQbHQJ+WHdIlj2izW0AaTS5Lbn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199021)(5660300002)(41300700001)(26005)(9686003)(71200400001)(478600001)(38100700002)(86362001)(4326008)(8936002)(8676002)(316002)(76116006)(66476007)(66446008)(66556008)(66946007)(6506007)(186003)(33656002)(64756008)(122000001)(2906002)(110136005)(7696005)(83380400001)(52536014)(82960400001)(38070700005)(55016003)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RndicFI1M3NhUTVYdzdla2NkNk54NWduSTBKRkJmbUdPVzZEUStjVTNWUjZx?=
 =?utf-8?B?bERndW1PR1B1Rno3bDhpM1JtbWs1QnozMm1QZUlGNHg3Y0dOc2txZWlKVU9L?=
 =?utf-8?B?N0w1aWJabWp5aTRqVTk5MU12Qkt3V1JxaWlFVW5iYSs0OGJpc3FpR2hFV1Fk?=
 =?utf-8?B?blFPMW1JQ1NQVnhyaHE0RHVNVFZQdzBiWFNaZVVuR1pQRkNzcGE0MkNWRTdn?=
 =?utf-8?B?Sm5CTWJobmdkNWNOTThEOTlxS0F0dDA4THRycWxIMWJ2ZFhNbW1RTTA3cUlo?=
 =?utf-8?B?WG5zRUtGQUZBTXlwYk9hc2JGZ0F2RXVmWm5HZ3pPTnhkQ1RXanNJaytzYnpW?=
 =?utf-8?B?VkxJMFlUSmdrL3VuZ1ZDWmw1eFhJWjRmRFh2V2tqc2djNG5ha1F0cVN0Z0pT?=
 =?utf-8?B?SXJhOWZSWjlyRURaQzNVcEtWN016cy9BdHA1MVQ0TTQxcWFPdjNWL2I5aVEw?=
 =?utf-8?B?SlIxYWpVZTZnQ2wvY2hRdENkNUs1WFpNS0Y0cm9Jb1c1dkl4UXVDeE4vZ0Vr?=
 =?utf-8?B?OHVWUk5lcG5pdjZSbVJ6YmJVMzNncG9qMXh3b3NHR0ZSNE05bHVLbUljb1gz?=
 =?utf-8?B?Sk1obmJWbkRhcnFrVGpNZGNxTmw0RmxoMVZ0VllraVRpL1dEQ1VqZkNrRXY2?=
 =?utf-8?B?M3V1eGJNc1dyeVB2dmhDTStmQVdJbFk1ZnRWRHJKb0Zxd1dWYTZwOGgvTTNk?=
 =?utf-8?B?RHpQNGpNYWFtdUhraW9nSTRKY04vT0sxa2MyeUJta3h3UUZVRGpzSVNmczBG?=
 =?utf-8?B?TDl5Znp1dDYzbXBOclV4MU5pemwzNVJWeHQ5SVJiWnBLcDJ2ZjBhSFUvMmhU?=
 =?utf-8?B?M251Q2JqdjFLRXV3UDJmbTFIbmFYMGY2OUpCeUZPOXlZYzREajhWU0lBVFJu?=
 =?utf-8?B?WWhEOWM0YWJhTHlHbTdnUDlORUFpLytZWStaUEN2Y3c2Z3RESVZPWkVnVmNS?=
 =?utf-8?B?ZURwVGxlSG9WZWk5OHc0YmpZWS9BK0NzRHd0WklXNjFSK2VkdlZtb1NQcXds?=
 =?utf-8?B?TmtYemc5ZSs4UWpqMHN0WW40OUZIeDZRVUVoMGREanVyT3c4dS9FRmtTc2VD?=
 =?utf-8?B?ZnYzMmRLWFhqL1YxaGJ4WWRBY3lPL1YxMms2b3pKcm15OE9wcmpScTQwT01E?=
 =?utf-8?B?WnJBNlJ1MXRsK0YzZjQvWXBTTEtiNEx2aWhuL3lFVkFMR2I2ZE5EeWNkS1or?=
 =?utf-8?B?dWNKdTdyUmdyL2hIcVVCRWx1Y2FRSGp4bFhHN0JFL09NSlZZL09kdTBrQjYr?=
 =?utf-8?B?YTVoeWdveU12QmdQUFJlNW5aZy9jVlNEMU1SYkRzTlVaZmM2SjJZUjh5MXhK?=
 =?utf-8?B?T2ZaelAzdnE3UGR0eFVmMFM1SFhWWUdpVk5iVi9KNFh2ZXZyM25TRzZKQ0N3?=
 =?utf-8?B?NTU3MzJHc3BBU3FDTjZMV1RXNUFZd3FJdjhKUUx5V0F6aXU4WGQ2dTA1QmNJ?=
 =?utf-8?B?N3dsQzVScG1tL2Jkc3M5K3dMc0NkNUJveDAvN0VwcW9ZRDhBR1VxVDA0M0Rz?=
 =?utf-8?B?SFIycmsydlBTcmN1T3ZxNElCQUNvNERwWnJvQmdiRmttVldrM1FSYzFOS01Q?=
 =?utf-8?B?Ykd0bXl0WEhnTk12WHNXQlNpU0p1eGl6dU1Ld1FsQ2xkUTEzYTlqTE1XUHVp?=
 =?utf-8?B?dUlxN3c3bUV5YjUyYVhXZGFCaGFMUUt5MnU1TnJuUEp5N09veTM3azg5ZzVn?=
 =?utf-8?B?YlVVRXBJQVhsSThCQWJwYzlpcmwxeXRwSEErd0pyb3RBSDJjTXh0dHpXQWpu?=
 =?utf-8?B?RXRJMGxXSVpUSHRpdlNndnQ2QXJyK0g5MEh6dDlNTzBSaytRcWN4b2pnT09a?=
 =?utf-8?B?bHpQMmd2Zi9pMVZUT3ZWUHdkZHJ4ajNGQThjSDZEMUQ3S0xSZ3FZS2ZBSTVw?=
 =?utf-8?B?MVRYbUNmQnZVUDl1TnRtREkxS0Npc1FheERVSnVVeHBzWGM5RWRMUjR4VWJk?=
 =?utf-8?B?T3dGQ2drNFZKNDd4UEtrekZwNU1nc1cyZWhIZ1VORGcrclFlZ1lDZWlvZjQr?=
 =?utf-8?B?QlVQdmcwSjJsQVVubUxCYW9vODRWQUFURUpHY0MxQVFpdkFBamg5aUcrUzh0?=
 =?utf-8?B?VnNCUS9WR1lnbDRuRGJvSHVXTVJ0QmFFWThUY2VNTjRDbVVYM0dKWGxSMjgz?=
 =?utf-8?Q?ZvLCKw4A7PcA0/z1WxCHfZno3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15d0854-f79c-4d7a-b06b-08db8f0dce54
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 01:56:06.2031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JbclT4J70ybDhF8ArrlBdhB/TzqsLk+/umJMY+V4utbcvNUKhIQqRHGVe/BGbMREPqr2XxuV9jCIgkX8eeq4kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
X-OriginatorOrg: intel.com

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEp1bHkgMjYsIDIwMjMgODo1NSBQTQ0KPiANCj4gUHJlcGFyYXRvcnkgY2hhbmdl
IHRvIHVuaWZ5IHRoZSBJTy1BUElDIHBpbiB2YXJpYWJsZSBuYW1lIGJldHdlZW4NCj4gaW9fYXBp
Y19yZWFkX3JlbWFwX3J0ZSgpIGFuZCBhbWRfaW9tbXVfaW9hcGljX3VwZGF0ZV9pcmUoKSwgc28g
dGhhdA0KPiB0aGUgbG9jYWwgdmFyaWFibGUgY2FuIGJlIG1hZGUgYSBmdW5jdGlvbiBwYXJhbWV0
ZXIgd2l0aCB0aGUgc2FtZSBuYW1lDQo+IGFjcm9zcyB2ZW5kb3JzLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2Vk
LWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCg==

