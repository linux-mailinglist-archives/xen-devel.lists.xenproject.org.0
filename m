Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E40A5CA71
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908677.1315798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2CQ-000887-A2; Tue, 11 Mar 2025 16:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908677.1315798; Tue, 11 Mar 2025 16:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts2CQ-00086G-5K; Tue, 11 Mar 2025 16:11:22 +0000
Received: by outflank-mailman (input) for mailman id 908677;
 Tue, 11 Mar 2025 16:11:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0SOU=V6=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ts2CO-0007gU-Be
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 16:11:20 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 753d54e2-fe93-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 17:11:15 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB7617.eurprd03.prod.outlook.com (2603:10a6:102:1d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 16:11:13 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 16:11:13 +0000
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
X-Inumbo-ID: 753d54e2-fe93-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgRUhXU2T6P6C6sHx70BBwdjBPUrH+TNAaCM+izVP2wuiL9iw2dXmFKS4waJsubT1yb8XY9GDW3ZVuDjcTm9FGFTBi9fPvlzhznkv8hUX9ttZV1NPDxVGyu3B4qARkCw04XZTxEGUZxAjvts4rzdqZwWYXdnETOewvR/Si2vnMAmJAjIiP1yQFVP+/ZEFJcG8GFYXYD6sDD8eJbWThpRusHwh2xvNo3VJdO276GEAOgS8zLqS/px37ZYxVTuCDEgzt/RrIkn9T6cXDJp/NaO0/Ii/NMC3MrzadSaEIQ/lYmNZKnfYJrBfy78UUOOclb6VxUIPeYJ8ni/TAr2l+j+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/Rpomn/r+Ds019ajq2ernrgn2VW5Z5LjCdgBh5Xzu8=;
 b=hgSoWxSm5hTRD7MLHSPYH99lRwzIc5ZTqkpJBCMigdGMR+DIbUUAgPdwhjnA3iP+Z3VD+tqCsx6tWA3dnpYqZXJy/g9Lu7Xe4Gxq6izK0hC4f9FrbzTz/lIrjZMBZH7V/KvsRvhA5vS1T21QxkenCqMfpwRL9XRwdhZADv2f9oqZ5vOXsgSrHR4jE06cy737nhNhVSZUnnp7dwKjaowrkGe9kcxD0QWxSZfUy/beodldCZoxiSm28R1ZyOtjejGOQM7upatbh7bXAw824utQXin+sH9UHE4icqU8UpJBQKZ7qcEiVLDeYPlEAmCsw6uSiFHx2Ruvb//GkQq1ta/BTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/Rpomn/r+Ds019ajq2ernrgn2VW5Z5LjCdgBh5Xzu8=;
 b=hlDmPWlLgEkxWklsGJ9No5pSQKGpiHYmy+3ogUk4ftRfIgxCKTbsXT1eyGT/lExdX8uVA+kmyf2CTXC/Ib4nVLwgj002QRtABytduEUA74Aa4AWInmZ8Gp+uF4KEegkm+/N2IKeO7AE5DDmPRBQrneQkdYCIpZrR85VKB8KEf50VbbZdG0IcOV1reUddj96dSfSf93E/BJVrfNxM4LeAWA3+ldPoQ4AizmlEjMoPPBbHerKYMeIcO6pznoIj3KccNjmLRHDCk/aGKevBWlHABYTGMhWBg4fDJrkMe3F3NTKv2aEU8YNGzr7h7VUFGnGakSA+lxe2WvIYHXXjGvB+mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <49e28768-3b9e-42da-922b-64b0bf8dec34@epam.com>
Date: Tue, 11 Mar 2025 18:11:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/iocap.h: add documentation
To: Jan Beulich <jbeulich@suse.com>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250224113828.151794-1-grygorii_strashko@epam.com>
 <83d5d612-2f6a-430a-8aee-4738f43204e0@suse.com>
 <d7fe19f2-f8ac-497a-833e-44a04e1ca4c7@epam.com>
 <60eff646-724f-4ff9-9dde-3a7f9a1da66a@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <60eff646-724f-4ff9-9dde-3a7f9a1da66a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAXPR03MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2cd462-3be7-4c65-811f-08dd60b7580e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tk5JVHVxeExkTGYwL0oyKzlJa2t4SklVMjFOREFtTjhRbHl3MHZhT05rRkhB?=
 =?utf-8?B?U1JnQmJpRVl3Ryt1QmRyQmd5TzI1WmJrUGdMMFNtNFVIWC9PeDliVnpGWWQx?=
 =?utf-8?B?NDUvbzlzRWxSSk9TKzZMemExbTNPc3FYaHgwM1lkMTZrQXU0S2piWFNVMEgx?=
 =?utf-8?B?ZXk0Q1JKZzdoTStVV3haZWl6UVhma010MCsxOUlHNTJKc2dET2tVYXBoc01S?=
 =?utf-8?B?dlhOSDlySjRLenkxQityRHQ4WTJjSkp1ZEdQRTVnVlBXWjhJcnptNzFuWnVp?=
 =?utf-8?B?NEhteTBmd01ZaUhvWmdmc3M3d2lwM0hKR1JXbWZjL3FIYXc4cDlhd1dVNmV4?=
 =?utf-8?B?WU55THloS05nSmNzNEZZZElLU3BDU1h0UWhjcHovZmFXZHZkTzZYYUd2YlZt?=
 =?utf-8?B?QmYvQWVFVWdEQ1hvODNZR01nSnkyR1h2V3hUdDlsRkxnamJ1Nk5ZckM2dE5o?=
 =?utf-8?B?bzh3eXpXWnZsL295aVorRk02UTJ3d2FWMEFuMTFNeUoxczJqVEZXcGdaVWpI?=
 =?utf-8?B?bW1hZ1Y2SHNIK0QvL2NWNGxtM3ZsRjJ5Y3lpREFMeFQzWWE5Ym1LSDYwSVpv?=
 =?utf-8?B?NTR3RTlMeUtEMzBzdTJxWUtUT09tMERkUXNKZFRqbE5KTTcwNnpnOGpaWXYv?=
 =?utf-8?B?QVZ2RVd5WVcyeUNtVnlPWUMvSTZjRUc5UWtlaDQ4bzYvTEtnSnhPNDVGaG5i?=
 =?utf-8?B?ZWhlNGpmZlhvZDFJRVZvLzBXdFRkQlFsbkRMZkJzVEM3ZW43bElpUVdtUDNO?=
 =?utf-8?B?aWJranNSazl2ck1QOTl6QTJjS21VMnZ1WkxYV0wzNURTM21Zeit0T0FSRGRR?=
 =?utf-8?B?Z1ZjV0g0U3JGNlY5SDU5eWQzTEp0NGl0cjFYelVJQU1LZWlCTmxKVytzN3Bz?=
 =?utf-8?B?MzVlNThWNjZRU0pXQ2R6dUlKZENvRWZla3FKMFpFcnBEbnF3bFNCUUtOOVg1?=
 =?utf-8?B?TGZQemNBUGlScm9pMmtkMTRLRXhnc2Y2ZVhiaEhSKzNaY0VYbmttNjFEYkhO?=
 =?utf-8?B?NmYzbktEdHlHZmg3YzMrUk1FWFhoS0JzaTdpUW04b01NNXdMNFRwdDR0NGxF?=
 =?utf-8?B?NkdOc3dxNFo1aVFVKy9lbjhkcXdhRzZTUnV4ckQ2aklNNzdKNjJZSkpoaDVO?=
 =?utf-8?B?enpVTEc3VHE3NHV1TVNaRFJYNForemxUQmtma2haNDQxNURpZ1F3NUw0aXVm?=
 =?utf-8?B?ZFlzdVpZd0pUdk50NFVYaWxWT3J5a004MC9mTzk3WEdUUSttcFlzQldJbXl2?=
 =?utf-8?B?cklBUEhjcXQ3bnNvMjQ4ZTc5aC90aEd1ZkpLbVo0NFlvMW1VcDIrTUhUVFIy?=
 =?utf-8?B?MXJhaHFPakEyUkRiRUY0YnBtbk1UVWs1clJsSTZJb1dXQkVja01jMDArNTdJ?=
 =?utf-8?B?ZTNTWTdlZE4xSU5lT3dOWFJITHBpampkdWZxWndiT3ZnNDgzRkhDaHlRRkVD?=
 =?utf-8?B?d1h1Z1NYQktrNW5WNUltWnRxREluTjZzOWlwT2djbG5VQU1YeFpCRHdqbFJJ?=
 =?utf-8?B?UWNHU2lTakpvbmFpL0hMTWt4TDFibXBKYWYxU0grZUZUbUtjNEM2Yldsalk2?=
 =?utf-8?B?UGo3UWNhN2ZSdmZGekNIUms5YWpKRk9yYjY2K0daOXo2QkR3Sy90OWRhd1B0?=
 =?utf-8?B?WHVQVDhyVDVydG1nR3JZNm5HREt2R25YUkI2bzYySjRVcnhTR2hTcFFtU2l0?=
 =?utf-8?B?TGFxZmovbnJ4bEJJdDNPZWNmZEhQMkJvVHozVm92MzNsRUJyOTk2TVF2RVgy?=
 =?utf-8?B?Tnc2T3hXdmhNM0xwVzNjOXQrbUs0Tk9qaFQ0Siszb201MmN6NU96WU5FUk5l?=
 =?utf-8?B?ZVFkQmtmeENMQVF3Zk9ZVlNacFBqWFQ2YnNoeTNKazVJRWJwd1FWMkhweXNO?=
 =?utf-8?Q?KssihsJhtf4+u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkQ5RHNLUE9oTWU2Y2NnWGpVWDJ5UGVSN2N0djEzWnRkdkh5cWxDNmQ2VHlp?=
 =?utf-8?B?cm8wSUE0Mit1N01YRldUOUN4ZlIwKzhLK3VRZnNGbHdQWDRWcTg3UzdxQkZj?=
 =?utf-8?B?MW9aOC9nWm8vN1FFVWRjYjVPUHNaNEt1SzVzbllWcmZhV1gxcUlOejhJcVVO?=
 =?utf-8?B?cnh3OTRndGhPbmdCMmdkRGdNKzBobXhoQVdQYzZQNldMM0RxUlBKTDNyaDJE?=
 =?utf-8?B?RzBWODVZTGRlUTZIeTMwTXJJUEdpSmE2YWxxNDE1MzIzQVJxVExDb3o1MTNw?=
 =?utf-8?B?MUUzOWNacnNSWWlJTHVDWDZFZHZ6UjhIRGFOVlNFdDk0RVBBazJ6eU1JNmpW?=
 =?utf-8?B?T0pMQmVlRXlPVlM5TGNYaHB4Nklrb3diNmtTaTVHazEwc2pSV3dmN05iMCtG?=
 =?utf-8?B?VnpRY25qcU9OaEt1cWlwRGRvUUJXc2ZTQ0ZEejUyMkdoUlk3dHd3K1hRS3Rk?=
 =?utf-8?B?dzJicldJS1YvWjNNakJpanNzNnpOU0pFdm1JcDdLSFB2L2ZoVTZ6dVpianlr?=
 =?utf-8?B?OWNFUUtsVHROMTBUN3IySU1TV2hPVUxDRGZ1c00zMldNRUpwQW40SWhtUVR5?=
 =?utf-8?B?OWFsMEE4UHNUNzdBQVV2MUtiZDV6WU5URFc1eTg0cFZISVZHd1B0N25RNmxF?=
 =?utf-8?B?T3dhU1NuZUxtNThsb0JDMmZDY2tXSytNUktzSjAxdTlYMHh5akIxVEI5cGhT?=
 =?utf-8?B?bHgvZS8rUldiYkoxcUlvVmR2UWt4ZWJIbkFZRi9jRDhVQUFnZHlHeGwyTVRK?=
 =?utf-8?B?TUVMTkRZSm5MQ3M0WVRKeGIwU0krRXNZdEZjamdFQzMyMFFQVXA5UWN4eGNu?=
 =?utf-8?B?QmNMcnhrcFphZG9TOVU3aTY0MVgzQyt4U3BVRFZYcUl1RFJmcTJqcXFBeGNT?=
 =?utf-8?B?QS82dmMwcWhBME5JQjFHWG10aUZRbUtpNXo4c1AydVN2dm5HekczbUsxN3Nr?=
 =?utf-8?B?bnNobXRyUXBqdG1IMHdoY3E0aEtkUENOQ1E4cHF1OGI2aWpWdStFaW1lWTN1?=
 =?utf-8?B?TjZzcXJDckFzNU9ZVU1ONmtHZnlXdlU4S2RWcmNpSWI2bG9CZjlwS0I3T3U4?=
 =?utf-8?B?eXQ2dlpCYUQrSTlGWHdCZ3hCM0Q0Q1kwaEJtR1BENWdYOHpFQXpRa3FLZ3hO?=
 =?utf-8?B?amwrMCtvMDBBeFJldExnSDFrcG91ME5GRDBmSGg1YUhmOEV2KzRRNkNUVStO?=
 =?utf-8?B?VTJHcW1IRG1CcnFvQjNoTzlLWjZ0Mjc0UTlHR3N3ZXBjOWt1QksxREllTXFz?=
 =?utf-8?B?TXJIcmtVZWNrbjZxTFMrVXlISlRxUVlrck1Va1I5WnREeHRKNit5QlBFMEJj?=
 =?utf-8?B?WTRxU1ZHNWJ4ek1pVEdWVk1vcUxnSFplc0l3eVVyMW5PeVE4cEZrbnFjUEpl?=
 =?utf-8?B?alZIWDRKRUJmN1RId3BocG95OVZVbUIydm1EbVNlNU9EMUJ1V3kxY2w0TEhJ?=
 =?utf-8?B?TkVaZHVyNXlwcmt3QlUxaG1UY1Z3R1hLMnYwWmNwc1BVRXVvUGtrVytqZnJP?=
 =?utf-8?B?Y3grUktTWkJmSFV4WmxTTWlJL3lzWjR6QWxqck9RL1Uxa3F6TmppOVh1V1dj?=
 =?utf-8?B?L1dUTUZSaEx6Tk5uQldvakdpWFd6OGJ6ODJJWmpETGhaeW5Xa3R6aW50TVMr?=
 =?utf-8?B?OXU4L0EvZmFuZFg3bGxlV1FmYk52My93NXJBelJsQ2ZBOFQ0UjRIWElOWGx5?=
 =?utf-8?B?aFhNengxakw0aFhtQVcwL25lTjJxeStIOWRmRWJDQ291NzJOQkxTV2NrbmFs?=
 =?utf-8?B?OVd2WitsVXNreldwekhqWWdTQ1F3RHEwVnl2eGhiTmZ5TmJTMHRkRW9PNnhM?=
 =?utf-8?B?Q2Nod1RYUEI2OTBMam1ESEpKMW96ckYxUkNEWkJQMEM2Y3YwbEJ2NTR4cE5m?=
 =?utf-8?B?TFRZQWo4RUpwUWdQOUdmSkk1RzlPbEJGamtURUpWYUdRNXBsdVVCVUFOMWtD?=
 =?utf-8?B?bVdYYnN2QTFWNFZtZUFaWk9OSExUdUpMS3p4V0lyUFZTdWhZSERuY1FkNW5y?=
 =?utf-8?B?M2EveHVoZ0hmSGkyc2o2Q3NZYUd2WFNyVW5vdXVuclRzTW1GTlE5dXRkR3FK?=
 =?utf-8?B?aHpOM0NvR3NEay9FSWx6MWNydGtQbU82Q2pIY2FMcm5GbzJycVdJSlRqUlRw?=
 =?utf-8?B?Y1d0c3RpQzhuQk1UUXMwVFhpUmNQWkJkbHdWT1lqdjRKSzV6WjlsQzJPQmcw?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2cd462-3be7-4c65-811f-08dd60b7580e
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 16:11:13.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRZYGf0LsHHQF3cfaASUZ8Vvwg+qQMzqF1Dlxn+p4pARR8Eu6O88khQcBxsd8VWYS8XKDumN7c1aYKe7DdLO0i52/5Gh/9XiDwjmnoWQU3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7617


Hi Jan,

On 11.03.25 17:35, Jan Beulich wrote:
> On 11.03.2025 15:53, Grygorii Strashko wrote:
>> On 05.03.25 12:37, Jan Beulich wrote:
>>> On 24.02.2025 12:38, Grygorii Strashko wrote:
>>>> Change rangeset parameters to "start, last" as proposed in [1],
>>>> and add documentation for public interface.
>>>>
>>>> No functional changes.
>>>>
>>>> [1] https://patchwork.kernel.org/comment/26251962/
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> To be honest, this is getting too verbose for my taste. I also don't think
>>> title and description fit together: One says the main thing the patch does
>>> is add doc, the other says the main thing is the parameter renaming. When
>>> then there's at least one further parameter which is also renamed, despite
>>> not fitting the description.
>>
>> I can update subject and commit message and resend.
> 
> This would address the latter part of my comment, but ...
> 
>> Or you want me to drop some parts?
> 
> ... only this would address the former part.

I'm very sorry, but I feel very much confused about your above comment :(

So I'd be appreciated if You can provide some clarification here.

1) you do not want API documentation at all?
2) you want API documentation, but only for some API?
3) you are not satisfied with documentation style?

In case 3, how do you want it to be look like? Could you point on any .h or function in Xen,
to inherit the doc style?

Here I've followed doxygen style (like in xen/include/xen/vmap.h for example)
Before proceeding I've checked CODING_STYLE and other headers as well and saw that
there is no generic style for code documentation.

Best regards,
-grygorii

