Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACA7AA148A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 19:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972951.1361208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9oZV-0006wR-Oa; Tue, 29 Apr 2025 17:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972951.1361208; Tue, 29 Apr 2025 17:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9oZV-0006uU-Lk; Tue, 29 Apr 2025 17:16:41 +0000
Received: by outflank-mailman (input) for mailman id 972951;
 Tue, 29 Apr 2025 17:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r0hc=XP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u9oZU-0006uO-GU
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 17:16:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f403:2413::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5642e4c-251d-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 19:16:38 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 17:16:33 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 17:16:33 +0000
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
X-Inumbo-ID: b5642e4c-251d-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjXqffX47x0cR9/0zhqO8xF0WDxsz504TyIr4P45dI0IUKquo56+zVagrwmQWX9URN58tIqKPZYQ5pugSjjK6TFk8/WljvVyt0iLNhXEKfILd+WgtMXiLrpLJFMq316SLAL+K8QG+HVsKTHGqvNkC2VtweMgc7rLEYPovdjToxbJEx0cSZKxvvv9tkqOaLq/oyWPDsPslL5xmXK7HF5r5BIYcHSrHAchnkFuclRYP/GqqCfTbjdBmQqlg38K/cwgdSQ3Ky//H++CBaU1zuKR60C43BqPcvEhW26aB8jDQJdtteWI/1WF3z/rHDJaOaPmDRVuR3YDY1uLe9SB4/0sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63kJw4oF/LT199qHv25YNJCi12qShmLJayBJ08PrzUE=;
 b=E47Kf+O0W20RJtNhyyh3omxZo8yjgsow0Fj67/sAqNHVXDPsEY0bekyZqAiNa6eO9mjEMsRltV4qGyEuowJJBGIjdpG+6K6hJiAvDhyk9QPQJaFO1BqUDIukfnkooQwaBZeX11QsGGFPSXG8YRPFN+9F9phv9tThUx8gxWeiVKKbD7jPK3wCyADa0I0C0ikZgmA8t6oi7TOkL8VtBQcbM6U8xWXZUNPqsteKlhR/FvMDdIixyR7nxvCqwFY30jcaU+WGrraR83YDv2QErEf8V10P8XdonD0jqxDyIrfbUw7AdxqkthIo84jX3T2YYiT/frOfRPbuwimQJN2LhetgaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63kJw4oF/LT199qHv25YNJCi12qShmLJayBJ08PrzUE=;
 b=Mo3LrtGv1zPJKc6+dDSmvYHPeJa+WdUILzVVBSIg/seuKBgnr0ItRvCsKnQAWuEdwkoP98tKAal2ul1IMqHP2ji16VImglwlb9bQVYfAPnBJFxZBc54BwIVCgyjG1OdLYWMyOBkqMpadxCjEckhYaBadRTGXDFc5dp5rSTSGCwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2cfb5c97-4885-4a24-b77c-5953d9cb6245@amd.com>
Date: Tue, 29 Apr 2025 18:16:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] arm/mpu: Provide a constructor for pr_t type
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-7-luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250429152057.2380536-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0358.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::21) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e124d2a-f40d-45c4-3d48-08dd874196dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW8zWHI5TDJBNk91SG9oTzdGVGNqWHdVOGdTVlM3ckpmbzBqWG9STllmdGlm?=
 =?utf-8?B?VmRtNkFueXRNaWhmdlNmanQzTUlRenUyVkFoT2ltdFdnOGxCL0xuU09PR0di?=
 =?utf-8?B?UDRQT3psZGd3ZmptYWU1dTdETHZQbEFSSUkyeWhOZmQzb1FuVmZ6Qzd6Qktu?=
 =?utf-8?B?YXg3eklWeXlSUzVXZklCREhWZ0M1NnJZU05Jc0pXRHFCYllaUHc4TlJQU0Fu?=
 =?utf-8?B?bk1lajRvQWVzVjNkS0VzMUFnQ3VOSUdwVU5wZzVsZEZ0Q0NWQXEzd2lZeFJI?=
 =?utf-8?B?azRPVU1vWC80ZHpmOXFCa3IwZW9YQUF1RW5OY0RvYXJuNDBETlEweVNUMzRF?=
 =?utf-8?B?dUZsVWZGZW9XcGRkbjcwZDhqWkpacHNyQ2o2MU05TXA1VjJZVittVm1TWUlL?=
 =?utf-8?B?bGxCTm9sUWMwM3FoWXJRYXJPNUFnRXNDRURReENMZHdDNmNVWVpIOTU3dVlY?=
 =?utf-8?B?azkxNit2M2toS01oK09aZGMzNXJrYlRwaHRmN3FtYW54NTFUcjhiZFlUMFFn?=
 =?utf-8?B?UmxnU2RmN3VvYndGRnJTV3FKbU1ZcUQrVmRhWTNPUXVUTi9kZklxU3RpRldT?=
 =?utf-8?B?S1FNTWNVeldBbEp4VlUyQ2N2Zkl1Nzdra0dXeGo3ell5S0VNT3hPc251NGlV?=
 =?utf-8?B?dzI0WUhoOTErd2pPQUxNSWFBSE53YjRUcGZkbHBrMkNkOEI2Q2l1ckZOZnlR?=
 =?utf-8?B?R09TY1RCbGVsU0k0WFRnczc2VzhDSjY0OURSaHNIYldhbjJyQTFLald3STVJ?=
 =?utf-8?B?cmtJN2FMMEd5MVBWU1VMV3BRNGpnZ2RBemcvSmhRcVZTeHNuZ1k2VjA1UCtH?=
 =?utf-8?B?L3Y0N0NKQUgvdG1tbXdIbEdDUElndldoOW5xR0lRdEV6cTUyU2hnRnJSaW85?=
 =?utf-8?B?ZkpXQ0ZZMXd3NHVWVVdIbDlaOEh2ckowWktSZUU3d085OFI3UXZlQkRRZThR?=
 =?utf-8?B?R1paNGVDV3VPaVhUVTlEdXBiNkRwRGwxS3hKSGpHRUlSRjM0UHp1QlZaNHY4?=
 =?utf-8?B?Y1NTbm85UzVVcEtYSGhGYVN2azlpN3lsemFlY1R5VmpoVm1qTXZsMUpBWWFz?=
 =?utf-8?B?ZEUxRDdaeVdtMFA5U1ZqYzZJeVdsTThyVDZqNVI2a01wOFgrWkxramRha0tt?=
 =?utf-8?B?OWJQS0U5ZHRmNXY3cFVJcFUzZlRyc050VkQ5ais4emsxbm9MYyt0S29lWWtj?=
 =?utf-8?B?RmZwZjl1L3E3d1ZYZGF3VlJPalVYalFQZTVxei9MZkFlUFYwbnJERFdCYzNC?=
 =?utf-8?B?ajdOR1N3TEpJVkxuamYyZGtzaEZwWTN4ZFRST2gzNEx1ek5oVlRCKzBBcHdn?=
 =?utf-8?B?K09pL09YN0dMYXliTmtBV0pra1BhWjRsY3plSUlIa2tqaEcxRTQ2R3ZnRzhx?=
 =?utf-8?B?eHlOdkFnMnJsUTNGYXhHdjRpUHBxZU5WYmkyRExuS25uamwwTU9nY2pQaGVr?=
 =?utf-8?B?aWg3Q2lhVW56bGtCeFpnSko2cWlKQ2l6NitwRVkxUHY0ZVFYMzdFamRCdStT?=
 =?utf-8?B?NTY2bFZ4TUVNaUNMbVNRQ0grVXQ2SkdGbHF3YVJyVjJvNVMzc2t4a21sOWFK?=
 =?utf-8?B?TGtDSXpoZzB2NUJ2ckpSRWlLem9JMVVra3U3QjdTT1lkRVEvanFWdEI3TUNa?=
 =?utf-8?B?blN5V1BuRFlBN0xkR2hNZm9pV0lWR081TVJzN3VSWEg4Y3RiS1JBSWVMR2lv?=
 =?utf-8?B?RnZtRDN6dnBJdzBPSXNYaWlTTm5BM2V0TFFvSHFsMUxWSkYxeVRXUitKQUFq?=
 =?utf-8?B?UlRLQ1Y1Ym9iMDlFc0tpMlZWdlpNdHdPZnFzSUt4N2VOczR4MnlxZWRJamdv?=
 =?utf-8?B?QThHVTB1cGNhdUZ2Ti94V1B4VkR3QjRkSjdxUU55OHJnR0k3TU9VVy8zK1VP?=
 =?utf-8?B?ZktkZ0t6Y2diaXlydFFIMlN0K1YxU256d0I0UTVxSCtlZFVTUjZ3QmpvMnZK?=
 =?utf-8?Q?88Vse9Adw0I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjFSTlZsYTRFWGVLc3ZqZFZnSmZ2T1ZDZjNIM1BiUVl0MFBxbWJBZ2x6b3hS?=
 =?utf-8?B?eDFpdGRWYVhpZFBiZzRPaEJqc0JUZUM4OU1hSkVUTzJhR1JtRWp5cEZ0bEZj?=
 =?utf-8?B?c2JHY2V3RmRBY0hLVFVENWxBT0t4WFkvTlI3ejFpb3dWV2pwU2wwOEowOS9T?=
 =?utf-8?B?Y3BXSkFZNkFRMjBGQUF5Qk1PTkFaWlVJMlZPVHpmODgyQUxLVzVvZTRQbXM2?=
 =?utf-8?B?WnhaZjJmeERLbnNmYkFZZENwN0o4bEdrQ0VhRzc2L2ZLNElnbmFaS21RR1lP?=
 =?utf-8?B?c0xHN3JkTktNTXd3Q0IvV01IZ1B4WkhaclNxTWEydjNoN0gvYkxVdkNucUl5?=
 =?utf-8?B?eUhTL3VtcjhrZS9YSkJ4aVpqVUhZT0JWcVRCQzIxbnl6OThqenpVbHR2a3ZD?=
 =?utf-8?B?MG83SVFya1FJNnB2aWFrSGVvR2Nvby9VUVF5SDROSVlYOG5hY05TSmJmZDd6?=
 =?utf-8?B?TGUxOE0zMG9nWVN3USszYTJMNVJYM044dERKRjNuTzRvS21obmpGN0RhaEM4?=
 =?utf-8?B?dGJlKzUrNnJ4R0RpQmZmcFVqS1lhVDdZY1hRMS8zeFd0YmpJalA5RklRTnU4?=
 =?utf-8?B?bTl3bGI3WWFzZWwzaTJBZFkrNEhVWDZjYzJYVzBkdStiTStjOGk3aTBmSVND?=
 =?utf-8?B?R1ZETEp3QTNQUUwzM25UN21yVTZwTUtmWXJPNERuY0tWeFhEMUtwcDlwZTAy?=
 =?utf-8?B?YkQ2WUY2UHRpdFZPckZ4SEx2MmdhdUE2ejltZTBRaVBnWGxxaUc2UUlueExJ?=
 =?utf-8?B?Mllka1RXeGQxME4xc1Uwa09ZSDBIS2U0Vno3OFc0OU5yQ1d5Rk1ldWlsckV1?=
 =?utf-8?B?cHZ6SFdSbVVuM0pndmVoWGFxUGZqanZkVVQ1REtSTXlKR0M5SS9GZ3JXQjcz?=
 =?utf-8?B?L0UyeDFKS254K0pFd1FJK3hJNFVPRWNDUVhmZ1FWL0pGYXlFRnRsa0xGb3ZC?=
 =?utf-8?B?N0UyZ0hyU0FkVkRHQmE0a09zQ0RVUzhJU2huRTFPZnA1RjlBQTBOUWpnRHQw?=
 =?utf-8?B?OGtiLzZMK1QyVUFFYld6Y1BUeWVqVDcrUEY0TVBCZ1plYWUvbFM5SHVybjRY?=
 =?utf-8?B?Qm96TUxwVUVDVmQ2OWZuMlFUZ3FmN3dxeEwxZVNIVEdPN3dVOFZnc3UyWmtj?=
 =?utf-8?B?OGlMbk1YcFE0UGQvSDZYTXQzaFBFRE4yQmJkRDI5QW53b01rY0Nna25VZmo2?=
 =?utf-8?B?bXRMZzZtN1ZRSGZsUTF1WFBHZE1wc1JkZnVrem1LUHIyTEFTZUhnUmtoeGRP?=
 =?utf-8?B?TUV5bVJwZ3MwWlIvNUlSVjZ4RW1CNDhiaCt2Z0hBem9XVktLTUJuay9KV2FX?=
 =?utf-8?B?NmpvUG5ncHN1cFRHVGZXK3hDRHNnZC9Ud2ZFcTBWeTJRWEFRbk5mbmFPQ0hr?=
 =?utf-8?B?QTBJUjhwSjk1UGRBV2JzL0pHVGVyZEJXNG9WSFlYYklIWERiV3lESENPRzlx?=
 =?utf-8?B?bjFQaENJdTc5MHp3bVpJdmJBc1pzQlhhcVBXYmxYQ0I2VG1BRDVORzhnOGlz?=
 =?utf-8?B?MXNxNlFhUHcxK3RCY3lwUjd4ZUxjWHpyV0NrSDVBZ05Dc3BHSnFBa1hxNnla?=
 =?utf-8?B?Q0l2OU1GYzhyVHYzbytMY3BQM1hmVFBtQnNZY2g3d1g3aDEwdFdpaFlUUmty?=
 =?utf-8?B?aFZPTWRjMEFBbndpalJGMzVXTWd6VjJmWmhhaTdBUUZJYjlZNWE5Y0MxNXFs?=
 =?utf-8?B?TFNySnV2cTBzOW43aERnNXRtNW5VVmRldFk3bmZkUnIzbkszZlpvbmxqNnN5?=
 =?utf-8?B?YVJocDhROTlCekZldWNnczlMV0ZCTjh0VkxOQ2JZZHdzZGNJbEp1R2U3bHpV?=
 =?utf-8?B?d0g2R1NISW9JcmU3bkQ3bUVZQlVubWFFM1U2ZU1VNks1MFR2bk01OWc0R1lm?=
 =?utf-8?B?YnU4K1pOZkZZY3Z5Y0NnbWhUNUNLa29hOWt2c21lQ1VtMDNmZjZjMkdycFRR?=
 =?utf-8?B?ODQ5OTZqRFFwVVBQN0c5R25tb1JzanhEdDdEUlV3WGJQVTNVTHltb2tCN2NP?=
 =?utf-8?B?UlNnTEJpeU5oZm1MWXB1LytTOENjcVhheTdaak51TWNCQUErem1idlZNd1pr?=
 =?utf-8?B?TGE5VGtyYXZDTjdnUjl3UldiZFh6YllJNWFwSE0rT2RRWXlRZEQra2UxRm9X?=
 =?utf-8?Q?OkGMEVtLc75niZE5Kc2UVTY2v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e124d2a-f40d-45c4-3d48-08dd874196dc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:16:33.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQ40iga/nglg9y0sZoudsXgsaex25HIW0LME0xzk7w/8rtM31buiySoz03CR2JwXHYzbhfW/Gh4oglwFLAEbHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230

Hi Luca,

On 29/04/2025 16:20, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Provide a function that creates a pr_t object from a memory
> range and some attributes.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>   - update helper comments
>   - rename XN_EL2_ENABLED to PRBAR_EL2_XN_ENABLED
>   - protected pr_of_xenaddr() with #ifdef Arm64 until Arm32
>     can build with it
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h | 11 +++++
>   xen/arch/arm/include/asm/mpu.h       |  4 ++
>   xen/arch/arm/include/asm/mpu/mm.h    | 10 ++++
>   xen/arch/arm/mpu/mm.c                | 68 ++++++++++++++++++++++++++++
>   4 files changed, 93 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index b27fccd77550..39233b43a5aa 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -3,6 +3,17 @@
>   #ifndef __ARM_ARM64_MPU_H__
>   #define __ARM_ARM64_MPU_H__
>
> +/*
> + * Excute never.
> + * Stage 1 EL2 translation regime.
> + * XN[1] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + * Stage 2 EL1/EL0 translation regime.
> + * XN[0] determines whether execution of the instruction fetched from the MPU
> + * memory region is permitted.
> + */
> +#define PRBAR_EL2_XN_ENABLED  0x2
> +
>   #ifndef __ASSEMBLY__
>
>   /* Protection Region Base Address Register */
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 0e0a7f05ade9..7b82f10d336b 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -24,6 +24,10 @@
>   #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>   #define MAX_MPU_REGION_NR       255
>
> +/* Access permission attributes. */
> +/* Read/Write at EL2, No Access at EL1/EL0. */
> +#define AP_RW_EL2 0x0
> +
>   #ifndef __ASSEMBLY__
>
>   #ifdef CONFIG_ARM_64
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index e2235e568e81..296fe74c5d61 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -75,6 +75,16 @@ extern void read_protection_region(pr_t *pr_read, uint8_t sel);
>    */
>   extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
>
> +/*
> + * Creates a pr_t structure describing a protection region.
> + *
> + * @base: base address as base of the protection region.
> + * @limit: exclusive address as limit of the protection region.
> + * @attr: attribute index for the memory type.
> + * @return: pr_t structure describing a protection region.
> + */
> +extern pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned int attr_idx);
> +
>   #endif /* __ARM_MPU_MM_H__ */
>
>   /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 40ccf99adc94..2e0aeb486ff8 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -9,6 +9,7 @@
>   #include <xen/types.h>
>   #include <asm/mpu.h>
>   #include <asm/mpu/mm.h>
> +#include <asm/page.h>
>   #include <asm/sysregs.h>
>
>   struct page_info *frame_table;
> @@ -151,6 +152,73 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>           BUG(); /* Can't happen */
>       }
>   }
> +
> +pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned int attr_idx)
> +{
> +    prbar_t prbar;
> +    prlar_t prlar;
> +    pr_t region;
> +
> +    /* Build up value for PRBAR_EL2. */
> +    prbar = (prbar_t) {
> +        .reg = {
> +            .ap = AP_RW_EL2,      /* Read/Write at EL2, no access at EL1/EL0. */
> +            .xn = PRBAR_EL2_XN_ENABLED,   /* No need to execute outside .text */
> +        }};
> +
> +    switch ( attr_idx )
> +    {
> +    case MT_NORMAL_NC:
> +        /*
> +         * ARM ARM: Overlaying the shareability attribute (DDI
> +         * 0406C.b B3-1376 to 1377)
> +         *
> +         * A memory region with a resultant memory type attribute of normal,
> +         * and a resultant cacheability attribute of Inner non-cacheable,
> +         * outer non-cacheable, must have a resultant shareability attribute
> +         * of outer shareable, otherwise shareability is UNPREDICTABLE.
> +         *
> +         * On ARMv8 sharability is ignored and explicitly treated as outer
> +         * shareable for normal inner non-cacheable, outer non-cacheable.
> +         */
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    case MT_DEVICE_nGnRnE:
> +    case MT_DEVICE_nGnRE:
> +        /*
> +         * Shareability is ignored for non-normal memory, Outer is as
> +         * good as anything.
> +         *
> +         * On ARMv8 sharability is ignored and explicitly treated as outer
> +         * shareable for any device memory type.
> +         */
> +        prbar.reg.sh = LPAE_SH_OUTER;
> +        break;
> +    default:
> +        /* Xen mappings are SMP coherent */
> +        prbar.reg.sh = LPAE_SH_INNER;
> +    }
> +
> +    /* Build up value for PRLAR_EL2. */
> +    prlar = (prlar_t) {
> +        .reg = {
#ifdef CONFIG_ARM_64
> +            .ns = 0,        /* Hyp mode is in secure world */
#endif
> +            .ai = attr_idx,
> +            .en = 1,        /* Region enabled */
> +        }};
> +
> +    /* Build up MPU memory region. */
> +    region = (pr_t) {
> +        .prbar = prbar,
> +        .prlar = prlar,
> +    };
> +
> +    /* Set base address and limit address. */
> +    pr_set_base(&region, base);
> +    pr_set_limit(&region, limit);
> +
> +    return region;
> +}
>   #endif
>
>   void __init setup_mm(void)
> --
> 2.34.1
>
>
- Ayan

