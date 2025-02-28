Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701A1A49116
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 06:46:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898489.1307029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tntAz-0008WG-UN; Fri, 28 Feb 2025 05:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898489.1307029; Fri, 28 Feb 2025 05:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tntAz-0008Uk-R3; Fri, 28 Feb 2025 05:44:45 +0000
Received: by outflank-mailman (input) for mailman id 898489;
 Fri, 28 Feb 2025 05:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZ8u=VT=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tntAy-0008Ue-9y
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 05:44:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2414::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b22285d-f597-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 06:44:42 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 05:44:38 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 05:44:38 +0000
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
X-Inumbo-ID: 1b22285d-f597-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKN5pGIaL+fsux/KlqojIY5NK9NMA4PrT+r8pOSHIeOExv5mJUQ9zcPd3Rb+B14/dn0V8GTE64MdeEzsb2eN6aYNlbLhpLa4qJZr8UB8t40KRmhACxsTN769t5EbamdBx/Bzc13LeWkE4YEKfINIaU5LljhliK5YgqPAB7AUP+nWYFXhZQh4r+PMC9ItpOxkpitztq/okhrbbcfT9g1tltbxBrg/4mgzBZSKZxpXYP/hwxpBpgqOBNIzOOCPMaQU5cBgXnS8PN/uPpt/QE3AkzsttQHlbroqwdl49ZnPgc7CrkzVSYdVjYRF8dpu5mv/yLInICIMnEQ7pHfoTHLlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5ERapvum6qmbkUi3HIMCx2BBLcnkgyZps5FT0mt9Xc=;
 b=IdEekYrjEw0pnyRkeQtz6tbqoLpT3jjYSGBJvnAxPSZKZaT97Ec9cJB5ccmbKdlx9DuFYRmmLe2a+5G2B71443dQTHdRR24jzb8WlcUmrrdR7AwTd1T3bj1EypGqmiCI0vflwRNqn4jg3aPf3NH71nYH3Akj8wbj6OCirNWGiLmLeIMXPe81s/UdZxgpa8QcTw0kWUNL1pqDjQGbw9qACqOJHax5UiFb4wUG+AyaZcrKMHYgFmJTxFy7L2UxxFH7fYSUfNeC2H9h0M6UVQn0TdXz+9c14rehh7VLyYK+lSnen7qVIdZ7WXl9mL1UKALsq6VWxd5vru33NA5YmEgR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5ERapvum6qmbkUi3HIMCx2BBLcnkgyZps5FT0mt9Xc=;
 b=qjvIqHN6vEapJ4YIY2JQYsnRmWrXI3XaYgUgFSqxC7i56ANjfcfwZQ7n5uiuwab/F1dcfOX/CB8tW2pX3lFcGYcR62pVvIM+lydtKH3WY98nsk7P5vO8DRJJBCqf2CHHOymyHxpDXDETyc2OL/x6XCI8Z3oFKwwqqMJNpdtEaqA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 08/11] xen/cpufreq: abstract Energy Performance
 Preference value
Thread-Topic: [PATCH v2 08/11] xen/cpufreq: abstract Energy Performance
 Preference value
Thread-Index: AQHbeHHTT0A5AjlJV0KOUczrpRbaiLNZ4FiAgAJ1zwA=
Date: Fri, 28 Feb 2025 05:44:38 +0000
Message-ID:
 <DM4PR12MB84513AC33B0DD9A2CD4C8913E1CC2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-9-Penny.Zheng@amd.com>
 <1dda12bb-f4ca-442b-972d-2e5b1edf82d7@suse.com>
In-Reply-To: <1dda12bb-f4ca-442b-972d-2e5b1edf82d7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=07b9423c-85a5-4340-9732-e4277e745d09;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-02-28T05:42:28Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SA1PR12MB7317:EE_
x-ms-office365-filtering-correlation-id: 5ad1b965-0d2d-492e-bcef-08dd57bafd47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b05PclMweWRLUmVzTDhGY2o4TTRON3o3cnRrZWV1WFIrSUpFK3NNVlJWakN1?=
 =?utf-8?B?MTZGNC94Ky9KUTFEWjhpNForRkZtNjIxcHFwNjdVVDNYdUhja2VaTnNldytw?=
 =?utf-8?B?MVlIamIxc0FvZFYydmxEVzZ2N3U1QWh3bktJLzRtaWFXTWZoUWNVTUU3Rlhi?=
 =?utf-8?B?YW5RTGhkZlo2VG9ub04xbmxZV3NXQzRNMGpaVW85ZGt0K0J3RzMxaExGdkhx?=
 =?utf-8?B?STlnV1FZZHNqNUp6V0Zlc292UVR3S0liSHlLV1VxUlh1aDhqUDRtMVJubnhI?=
 =?utf-8?B?L1h1bTFYUUF4VGhYMzNISlprdjJpc2M1Z3EwQmlyVVFjQzdkK3pJeEM3RlBz?=
 =?utf-8?B?VzNuTFYyZURZVVVveWhncHMvYnZqTmVVNXU4OXdHV25yeUV5RmNKRXllakJt?=
 =?utf-8?B?bUs3MW16ck51dndSSzdLemtyWnN1THQrWjFUOExBemJxSkhWcm9ETTNCcDBK?=
 =?utf-8?B?K3cvK3N3ckV0ckQwWVhZVENROGpxaEp1WmVVMnBySHFJeEtHbUd6YkNaMDJh?=
 =?utf-8?B?SjRYVHlzck4wQTFNWU5rWlJwOENVRHFzeWdsVzRsSG4zL01aRTlnUW9TbGU2?=
 =?utf-8?B?ZVZFREVOMVVnMUh5UDMxUVdjaDFUR2gwS2pTRk52WkxIcGRCOUV2TXkzZDlo?=
 =?utf-8?B?YzlJSjFFd3p6MFZUVHAvWkJVTnBtVmo4VTR6bTJ3U0RnbHI1MkdSWDRSZjJM?=
 =?utf-8?B?K01yeURQMDVpL29EbEt4Q3NuY2JZVFNabEtydjFaOGJkVmZxKytLLzE5Ry9z?=
 =?utf-8?B?WndPVTB3WXo4aXJlaEFORWlxOUZXdTZsdWlOVS9FUUM1bzJlUFlYS2RFMnND?=
 =?utf-8?B?SjFyMVh1dUNPZzQvL25FOS9ZSXlJOGVBWXZCZ0NxR0MwRUZlK0UzWDdUY3Ri?=
 =?utf-8?B?MjkwU3ROdGovVnAzc012bnNjQzhiakhVeVZUN08vSDZwdkxObEE1QmtEVGN0?=
 =?utf-8?B?WGVTRGZqb3I3V2lWTzNFWDZFMEFteEltMEpxNUpzTlhhQ2h1aXlSVWU2VjRv?=
 =?utf-8?B?MENwOWxtWUJmQnBvcUE4NTZuM0FyRE5nbHM0eEM2ZnBkN1JvbUpGd1JucWJH?=
 =?utf-8?B?aHNCYmg0TGRsMDA1L2w1SnFEdmpUWE9FYzQ5NmJOUEh4bG13VlBLV01raEVY?=
 =?utf-8?B?VGtyMCtiK01FUUFlWjAvekRMeXpOOW1hNW5vaGdhS09CS014aFNJK1YzNVo5?=
 =?utf-8?B?azQ3ZE1KdTZrZks0c0RTYytOSHl4bXl0VU5sY1FDRXI3RUJrSHpQclBMdHFJ?=
 =?utf-8?B?UHRLVlNXbmRUVElpaUYrY0haRy80WVJmYmNrVUlMNWNZQmt6NFljcmcvTUJK?=
 =?utf-8?B?bG45Y1NzaTg4MlZoeGx2a1RpM3FRNFNFNnhrY2FUM2lqbm9CTmpKRlduU3M1?=
 =?utf-8?B?ZS9lOWxrVHUwSXNoYjNtV2ZqemNZQkc2NU9yTjdZemRKblltazg3MDc5VDEz?=
 =?utf-8?B?SHBLS295S092SUpXY0lkUDlSUFRXOE55cVJVVGp3L1JMaUtXTkF4K0phcUFt?=
 =?utf-8?B?bURDY0M0MVJxcENoR1VFTWxyTS9TQ1pxZkRablpKTUJpU3hQUWtLMjlJc0t5?=
 =?utf-8?B?aFJkT1Q2bEsxaUppN2RUNUpDQ094V2k0U2Z6c3lMT3pXcnB1cy8wSEo1MnhV?=
 =?utf-8?B?YWswOW43a2U1UllIVHNnb0pJNWlvMmZxQTdJZ01uTnY2dld6WHdXakwxTXZ2?=
 =?utf-8?B?dTl3WEJvcjRRK2dqNHJwTzhlZm9iVWxBNWxNaWxoMjZmc1pzcFVvampkTzZt?=
 =?utf-8?B?dTU2Qis4Mzljc01KQWgyVlJGUXJJWjgzRkZJMFl1MTVLOCs1bEFpS2IrZ1JW?=
 =?utf-8?B?ZUJ6NGkwRW80aGpaVnRFekJOVHVNWW84K2RhVUlCaHByYk10YnUvdFQxc2pH?=
 =?utf-8?B?OTNpUVpTTmVsWXVOaW1MTDNVTFVWTFFDTEM4dUZyU3pHUlRrcVNmQmtibyts?=
 =?utf-8?Q?A+camKsSdvxeDtqea7ra+QuhpfpFMWYw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Snk1cFJGL1VzU1JCUkhSNk9ETkhIYmRvdUZ3MGx2dGtQdVorV0lHK3U0cXMz?=
 =?utf-8?B?VHk0ZU82eHFGb1FBb1h5TDg3bUc0WDg3Qzc5VkxuNVVLZ0NYK1ZUbTh4cmVX?=
 =?utf-8?B?aEZNT1dXWGdJWkoxRlNQajFXRC91Q2Y3U3N5VjhCL0FjdUs2NDlvYkluVDVR?=
 =?utf-8?B?NUlCS2xHYWJnN0hGckdhMFZQN2EvUml2TGFGdlZSNVhPM1NlaUR6WGF3QTV1?=
 =?utf-8?B?UmxZKzdIODlpTHpueXlEWjFQMHJZNXJHZFZlTU45UHRpd1dQT0s0REI1SXc4?=
 =?utf-8?B?dERHOUpjVDlPN3ZRWFhOSzB4bjRqRktSWmpRM1pUNjNuRnpIK0pFdXI3SWhz?=
 =?utf-8?B?NFgxaUhtZjZJR3NUNDQ3cWgzUkFXQk9nVWxiWkFNaEJ2WVJJQk9ZSW1ESi9Y?=
 =?utf-8?B?bkVCWW9pbTNVcVc5U1J0MkVjd2ZJOTNxdWF0RHdaUGtmUk9MVWMwcCtNc0pJ?=
 =?utf-8?B?OGdsdXFuNTlBbWlhQ2VtbWkyNnRhZExYdWQxdHQ2WW82VTM2QzczV3B0cGxv?=
 =?utf-8?B?ZFpwU05NZGtzTCtvMjBTRitxN09jWFErM0dpRU5xbGdKUmFqNXdsR2hNd05v?=
 =?utf-8?B?eW9PQU4rZmRoOS9vSllPR01ReTJLb0VJdHZxVUEzRnUwOEhKY004WUhBY3dZ?=
 =?utf-8?B?UHJyejJuaXBvaXNWM3BKWndtcVRnNTg2NDFGaktkaGhNbnlIS1NGd3N3dVBL?=
 =?utf-8?B?K2VnUGxBTjU3dEVyWG52ckZuK3VFSEMrUndleWNWS2N1L1ZYUGNoYWd0M09Q?=
 =?utf-8?B?cjc2VnRDTkI2eTE5NXErQ0VlazgvTDc3c3I4b25OODI5bWhpSjRlY0NtaWla?=
 =?utf-8?B?THV1WlNYMkcvc0F0VCtNSkpuZ0RCWkIrbDdnWE1kclpqWmo2MUlRdXZKNXlE?=
 =?utf-8?B?bEJKb2s2SFRNZUlFU1lOL0k0ejJiZWU4YkhaMG1OaFI5VmN5ZUxpaUFHVThp?=
 =?utf-8?B?Yy9QZzNuZ3ZhUWlmb1JUQXlwTE9xS2pIU1V1dGRLWHVOaVhmbVhKVFpvampz?=
 =?utf-8?B?emRndUtkS2ZsbXQvLzBuZnk3aENYWVJWdGVHbUFrVmprK041TzR3QlJuSHh4?=
 =?utf-8?B?VFY3a2ZKV21ySHl6bkdUdWZINWZVMzlyVE9YVUtZQXBZV0RkUGlNd2xFMjYx?=
 =?utf-8?B?MnZpWVFGU0JMWVdoaXgza1Fvd2tTQ2JNZEg1NVdhOUpNWDFyOStLdEFqS1BO?=
 =?utf-8?B?OVkvUW4rcGZrSmJxNkdaYjhRdG16dm1WTUdBd1NMR0oxV2YxTVZUblVEUG9G?=
 =?utf-8?B?UnBITG82N0svbEwwZG4ycnBaVTNjVWdGdnNZak9keGVudHJ0VWd3WlFsemlC?=
 =?utf-8?B?dHV6QjB0aFBQRmVZNmtsV1RSZlcxVFh5QkhYUG9Ic2xGbGxYcjZhNGE1MWVi?=
 =?utf-8?B?OWlZZ1daUEFTNTZESStmL2FNRkV4ay9jSzBSdllnbXZCdHB4eWJSQ2tGTG51?=
 =?utf-8?B?MHhDUjJUVTduNDhKc1FQSlFhU0t4UWRRekdMbmRRd1Q2M05hczdTT0srQ0VS?=
 =?utf-8?B?UGsrSkNpeW5mQ2xveGw0VXlvbEVYYlRLcEFPczlBazdVaE5jQUcxNFd6MTFF?=
 =?utf-8?B?R2tHNEFBZUpuRzRNK2dOY3dRRXBHVFJCaHNuajBCS1RhSGpwdTJuNjNFdW9p?=
 =?utf-8?B?RDBGRVBFemNMMFRxZi9jZ3kvTWxnN0YyM1ZWWkdZZmpuNmY1Z2diSDA0eFg0?=
 =?utf-8?B?WVNQS1pRRTl5Y2R1S3VtbFJTcVZVWTZwb2xjeDdmdm9zajJpd3FJVTkwbzc1?=
 =?utf-8?B?OTFNL0diRzhCTXJUbGZlbVhuY2VpN3pDMS8raVI1TjMzbzBtc0pUeG56ZnNJ?=
 =?utf-8?B?cXRmUkliNEVpVHJSSVVFV09CL3Y0SFBQeXJ2bnRydVhheGdFczhxUWthV2hm?=
 =?utf-8?B?TFV6dlVPZFpISjB2NENCQzlQSEhTS3lrM2gzNjBxeG1aaXJBMS8zZnBKYUQw?=
 =?utf-8?B?NDZNK2p5cldSRjZJckVyTXh2eE1PTnRiRWxwVjdocytzdE1HWGNCTVIvaXJq?=
 =?utf-8?B?cnIvYlA4OFM2Vm1QT3V4VVN0ODhod3lWdzRYV3FsK0NiSk9pU3lqdXVnalh0?=
 =?utf-8?B?TWM4S3V5WGROdXB6T0hlSmYyWmpSOE5DN1hCa25RZXFnY0UrdVlCZGM2QU8z?=
 =?utf-8?Q?GJxU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad1b965-0d2d-492e-bcef-08dd57bafd47
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 05:44:38.1060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ksAmUkV3TfKsYnMdQVdf8laIvZjUEcV7QSQ433dVmxodqYlNzJ5rCDDr83iRL28q2WviwhIktojiUtOqt2aSbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7317

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVh
cnkgMjcsIDIwMjUgMTI6MDggQU0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1k
LmNvbT4NCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcnl1aywgSmFz
b24NCj4gPEphc29uLkFuZHJ5dWtAYW1kLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyIDA4LzExXSB4ZW4vY3B1ZnJlcTogYWJzdHJhY3QgRW5lcmd5IFBlcmZvcm1hbmNlDQo+IFBy
ZWZlcmVuY2UgdmFsdWUNCj4NCj4gT24gMDYuMDIuMjAyNSAwOTozMiwgUGVubnkgWmhlbmcgd3Jv
dGU6DQo+ID4gSW50ZWwncyBod3AgRW5lcmd5IFBlcmZvcm1hbmNlIFByZWZlcmVuY2UgdmFsdWUg
aXMgY29tcGF0aWJsZSB3aXRoDQo+ID4gQ1BQQydzIEVuZXJneSBQZXJmb3JtYW5jZSBQcmVmZXJl
bmNlIHZhbHVlLCBzbyB0aGlzIGNvbW1pdCBhYnN0cmFjdHMNCj4gPiB0aGUgdmFsdWUgYW5kIHJl
LXBsYWNlIGl0IGluIGNvbW1vbiBoZWFkZXIgZmlsZSBjcHVmcmVxLmgsIHRvIGJlIHVzZWQNCj4g
PiBub3Qgb25seSBmb3IgaHdwIGluIHRoZSBmdXR1cmUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYW1kLmNvbT4NCj4NCj4gQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4NCj4gSWYgSSdtIG5vdCBtaXN0YWtlbiB0aGlz
IGlzIGluZGVwZW5kZW50IG9mIGVhcmxpZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIGFuZCBjb3Vs
ZA0KPiBoZW5jZSBnbyBpbiByaWdodCBhd2F5LiBQbGVhc2UgY29uZmlybSAob3Igb3RoZXJ3aXNl
KS4NCj4NCg0KWWVzLCBpdCBpcw0KDQo+IEphbg0KDQpNYW55IHRoYW5rcw0KUGVubnkNCg==

