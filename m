Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5761ACC9B8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004602.1384340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMT6d-0002Pv-Fi; Tue, 03 Jun 2025 14:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004602.1384340; Tue, 03 Jun 2025 14:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMT6d-0002Nk-Cq; Tue, 03 Jun 2025 14:59:11 +0000
Received: by outflank-mailman (input) for mailman id 1004602;
 Tue, 03 Jun 2025 14:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMT6c-0002Ne-18
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:59:10 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2405::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bd8e97f-408b-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:59:08 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB7331.namprd12.prod.outlook.com (2603:10b6:510:20e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 14:59:04 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 14:59:03 +0000
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
X-Inumbo-ID: 4bd8e97f-408b-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZ6AtuHzaMqLbEKSCIjOh7uOXVeSUJhYb7ymOUxDg+LjnHmZhjHG+n0ar4vztMX8Wft9c537Dj8TPKP8XPOffe+bqkIuq/D9LXyLsdqoVX3FJG59EG9Yk7z4ifCBjGpxdaIkNQjWoJV5FVneNVZzu7gwfMaFmiPcQcMZ+MFhvZy2kiV487/ICPt15tnzxUTfJLajE8B4d8iBHPqifkwT9R1B1si4ALeikgKLHSo+AK0PYA/inI6QVfO1TlvNh20egpiAb2IqLZCH5rOPcnmPZ2BmLhS/fE2kgw/+w6JtHU6rBBuRqAroYbR71iry2uidAlfHZ4+25+q7LO2rdiKeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZumHIjBi/UCD0syGquwVwzUx23wes+j9/Sllq/MIZX4=;
 b=W1qi8VE6M5GwhNwXJyfMxwMaCINEBCF1JapwQcJuKgyYR8EAWZ+9OON1JgxMssGtFReRUC4YLLn5PhMHCbmBhmCmfLbG8oCXtQE5QNXY6drw0uGUcYH7JwOl0r4a5qhhPlVF5WzudnslKAkBm3ztSy+DRnj9RL0GJQ61fAnsyPCsJnVWK0ytzWStRYmOdvUIApEqT+UjleSL5QB2DXlQWBJqUaHc2A8WqSB5pkiN1vIC8bObA2Wi1Z3qbdjkSDJDmhzyHeia1wCEdVRWXfCTbQQMdHTD8ZjOeskUdKBDGTBBPk2DjxfobWisvhZsv6ZwBPRkKEJR00SdwACbOi4qhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZumHIjBi/UCD0syGquwVwzUx23wes+j9/Sllq/MIZX4=;
 b=HlT9hHrm4S6/nt5IynPZDS23Au7bTL3Vrz1qrBAZxYc0/8rGZqyii2lRSgNWwYvAgqmC+Fn53LwOewTqeamRclsN3DEOiFSak4icUNthQED6gwqHW0khlho2n4xrWzVlkfVVB7NoT/5WPOtfZnccVU/QXUvsnswSNNkRvoUEP78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f59b9b81-7507-4a4d-8754-11360797f31a@amd.com>
Date: Tue, 3 Jun 2025 16:58:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] device-tree: Move Arm's static-memory feature to
 common
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250603100329.149851-1-michal.orzel@amd.com>
 <20250603100329.149851-4-michal.orzel@amd.com>
 <f77ff27a-d6c8-4d18-9e90-4fcba693d7d8@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f77ff27a-d6c8-4d18-9e90-4fcba693d7d8@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0192.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 254b9726-fcfe-46dd-7fe1-08dda2af2e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHAvd0lZZkg0cUNWRHRnSVd4RkNVSk4rc05jNS85bnB5ZXhkMHJVRUJQNXFy?=
 =?utf-8?B?NWN5K2NmbFd3UUR6WCsrZjdsSGkzbWZaaThYbk5oZUhGelJBOWszQjZXNkUv?=
 =?utf-8?B?SnRhNHluK2pzME5NRW85MXJtL1ZWM3RxSUZGRTFlbVZ1WGJxOEN0dVJmQUhM?=
 =?utf-8?B?SG03d3cySjNPMU5OZkphS1VtMnhNQlhqRGRoWVZ5eTdITHlVL2RBVUVmbmhX?=
 =?utf-8?B?dDhKdk5HWWljRGkvWE1lT1dvYUkzdVZKL0hrRWs1V1lGbzkvV0s3d0xMNzlK?=
 =?utf-8?B?OG9Scno4S1ZIWjcvNVFnTDdRbGo1WEsrMFBxbDRRdHBxRkdaYjdUNnB1SlM5?=
 =?utf-8?B?V3dRSENvSWdLenFTS1hMc0htZG4xZXJ1cDFsWVphSyszcTUrRjFiTDBWTk5C?=
 =?utf-8?B?dUxqZHMwZFZ2TVhubWExNE1UU1BEVHpqOEU4NHBHbHlMVXA4RVdacjVIQTg3?=
 =?utf-8?B?T0I2WHRaMU81NHMwenVnVFZ6T3ZYbzA1U0hvRXNZRnp1TTQ0dS9URDdnYTZV?=
 =?utf-8?B?OHc0ZDRUNWt1MnY4azUzQXVxMUlKK2p6SW4yNzBRdXlkaXloRHoxakF3UEsx?=
 =?utf-8?B?TldjNGtQeldVMTdLMlFxVHZaQTRjVytWUnhGSTZjck04Yk43QjNtN1VYWmlT?=
 =?utf-8?B?RDNocFJlUEswMzE3MS9qcy9CN1diQVZLZ2h0cHlVaDZPejFyUkt6R3k1VFEx?=
 =?utf-8?B?aHJHRDBoZTRIcWtKUDJXVW1GL2RNZTR6S3JSMVg0enA4aEJaSHdubWJ6V1Ro?=
 =?utf-8?B?dldTTkxSTXA0YzExWURqbVdSSjBRbHUvZXNwUnU0NWpZS3JnVjQzbEVrMG8v?=
 =?utf-8?B?ek1hdFdSb1hRYWh4RVlhdWtVRmR3WkJKWkwzQ2kzc2RmY1Y5WUZBelROTHp6?=
 =?utf-8?B?TXFiSFBNU2NVLzZNQXpyT00wRlJETU5HWDBGVjJvbVRnYkY4SGIrU3BYYlUv?=
 =?utf-8?B?blZDZDBQR24xNStVTTRxdEdzYjBnQyt4V2ZmMU5zK1pJMUdlTUlmL2c3aC94?=
 =?utf-8?B?NVJxWFBIKysyUDV2M0pVMzdYZWYySVd1bEI3ZFZPTjZDbUNaSjZVZExDZW1B?=
 =?utf-8?B?Tk0ybkdleS9zQVJ1bHRVdkxiMzBVRzV5Rk5ESVlLNmpEWnk3TGlzY2FEZnZp?=
 =?utf-8?B?cGFXMklERzN3SmFwaXpLR0t4REdtbnlRRzUyQTA4OGs3bU52QnByYjh5QVg4?=
 =?utf-8?B?MG5LUjNoNlpiaHQ0UVJzRzBRcVhYbzhYTGJpRDNMbzVUU2ZTNE5QV1VLZkVB?=
 =?utf-8?B?U2tEMzEySkRUYkRWd1ZtWkpYOWZta3F0ai93QmtjeW4yaFBpWFoyWnQ5LzlL?=
 =?utf-8?B?OGFNTE43NnJvaFJ6TWNsQTlYdFAyajFLSUdsUVkvSFVKbmF6T2ZJdEZ4ZUxK?=
 =?utf-8?B?Skc0aFRkRnRkREtJYXo5SCtnNDZDUks1MVJsc0p4cTcycTZGdEkxdW0vYWpm?=
 =?utf-8?B?VXh0cEo3WEdhV0lZak9NWXQxWTRhRHlNZ3g2RDJGMDJGcWgvK0p6S3hpY2d5?=
 =?utf-8?B?Z2FSTFl1dHFEYitHbkZURWhkMmFLQWVPejZiUnZ3bFN4Zm1PT0UyVXhadXEw?=
 =?utf-8?B?VFkrVHRwWTZHZnBBUzV6ZDUyTVAxL2FjdEhLY2ViWlFvWGNLQlJadmhWNUxN?=
 =?utf-8?B?em1HajNmckRMamJkSWVVc3R0bnAzaXIwMVdZZTVKdGNKUmYzMnpsaGVTTk5u?=
 =?utf-8?B?c3M0QmdpUEpXUitVOVhkSDQvcU9Sd3E3Yk5tRVZMWUFBenRkalMzcXZPSS9N?=
 =?utf-8?B?VzJWV0RVaE9pM2F6THJzVk1sZXNMNGRzOHFHbVd5L1BvQTVQdUx6LzlKZ2lP?=
 =?utf-8?B?T0ZSR0h4Z0hsMFVHRGZTM1NENzhmNEVhd2JvYWQxclF2a3BxNWxVck1WR1Uw?=
 =?utf-8?B?Vm5wU3d2VlBiZm5oMVQwQS9rNlVXdWZNeGN4K2JVejVWKzFuZWJ1VGNtSCth?=
 =?utf-8?Q?MnTVXAPZe50=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjF2Z09kYlcwOUl4YkVPSmpycllCWmtJMWd1V3liUWtDMnAxaGo4bjBQVnhC?=
 =?utf-8?B?cllmS1FHOGExRElCSFY1NUpIT1VXQWp4cUVNalJaZ283RFFWa05rRVNRS1Nl?=
 =?utf-8?B?ZysvY3FXZDRZNW5DRkxyVXBjc3JiajFGcjVnVU04SERSbzhYNFd6c2g3alNo?=
 =?utf-8?B?S0pVZEFMN0pBa2tOSHdTZm4xa3NZOGRuUEZBZ2hsMVBoT0lSV0RTZ1kyTmEr?=
 =?utf-8?B?NWlaeDlJNm1xYUZaZDJKRVBuWjEyWnYzTkZBUGpJeXRSMGhZNERRc0d1VHVh?=
 =?utf-8?B?TWtOYSt2U1N5dlFTMVU3eWpkL3JrZ0NhREpyOWtPWHBqMFN3Yk0xNWdJUWRp?=
 =?utf-8?B?Wk9wMnM2NnM1YTlmN0JJKzhLQWdWa0drdERCT1JJU3BSODZrSyttWFJoaTRL?=
 =?utf-8?B?cTBLS3RFdnBCL1lDODYrVitScWFWNENFZTg5SzMvL3I0T2RzQmtZdkhTSitW?=
 =?utf-8?B?NGczUTVCZzUxYTVscjI1TElsM2VTOW5KeWRFOGtvWUZNcGJSVUhIWEt6TGc4?=
 =?utf-8?B?cVZyd2tBdEdpMTV6UEFHb3N0V0RYcEVXUmoxaEh3MlN4Vk4zNTYvYzRXeEdv?=
 =?utf-8?B?WE5aL3FxTkdjbmdkdHNXVVI5VCt4Z3AxV29sRWxMb2JyMWhNeHMxQlFiaTNE?=
 =?utf-8?B?QkRRL3M4MWJaSFVpTmF0REV2ODM4ekdKQjcrK21vSDAzZkhvbUN6YlZ3QVR3?=
 =?utf-8?B?aldPWTFRS2x6OEM3SEJFRkdoMjlZbnovQXBoTHN0QUFIN3F2VHpYeVE1STNh?=
 =?utf-8?B?azMrYWg1WUdGc1ZKNkFmWjdoU1M3YTl1OFdHZENlV1JEaU9jbDFoSmpVeWRU?=
 =?utf-8?B?Ni9VM0ZxRnc5a3JZSnNMT1VHYnlLVzJscGdIV1pTUm1lSnl5eldBWFljQWFC?=
 =?utf-8?B?MUs3VmJMN1FBT01TRXB3Rk1FZ21Gakp5b0RNclErNkNqTzNGNlVCa3BtSTFT?=
 =?utf-8?B?cmFWWWxub0NNcHdVWGMyMFhuSzRHSjZSOGtOeG5VNUZWNkRTaEV1Q2JkTFVz?=
 =?utf-8?B?SmQ2T1RCUlFiY0U0YlJFVWcxNWpRNXZtS08xcFlOa0RwaHZ5ZGY0UmwyWHhV?=
 =?utf-8?B?WHZhZzJUMnlNNnUxNUpxWGdrdzNobHFneGtzbWlqbWExUC8rekx2VUZQc3hk?=
 =?utf-8?B?bDNHOHc4VGRBUGNyMk1ZT1lGWEpNcGJ1MTNTL3plMnpmdTJrcUFTSjdEeEFM?=
 =?utf-8?B?WmJIbVRBblNmQ0VnZzVsYTJsdkVPMm83cXpHS1lyWTdqUWxvWXVRRFVjM25m?=
 =?utf-8?B?eVkyU3pMZ1NxeGhob09GenJGWmowa1IveDBJYnRic1FZUys3eE8zdnJRaU1Y?=
 =?utf-8?B?UlgrSUVtT3dxV2x2d0tIUlVoRTZBM0IxSUdGa05GWGJEVHJFYnViNXJQdHFB?=
 =?utf-8?B?czd5RTR6TFZ3M2xJLzJaVEpzemQxNXdIbmxhQy9HME81T1FYWkRhOFNoQjBT?=
 =?utf-8?B?eEQ5QjFYd3NwbFZhdTd0VkxMQVZjckh3WnpwcTdCc0ttMWZ2dGNOT2lEbjJM?=
 =?utf-8?B?M0Y1MkZDdDZZZWF5dnY3ZjU1aDZtUEZtR1Y2ZFZBZG5QUS9aWmpZM2QwcFIw?=
 =?utf-8?B?cTZmN2pLU3NZUDZtMFFPRWZMWTBCZGt6ekt1OW5paFg2a2cyeVlHaUVETTcv?=
 =?utf-8?B?cHRLTzl1S21aOGVTL0JrSTQ0MFVHQ0syUDJoUngwckRqTndYTUZxaUZKTUFW?=
 =?utf-8?B?TkpoMlk4UGk5RFNCT1dXSXM4YTRGVEd2ZWZQVEJqYk5oMUIreWtkdWRrN1BX?=
 =?utf-8?B?MGVzQUZoTDQ3U2tBci9qZzZKcEdTK1RRQnBvRyt6R0pUd1lub2JXeTdMMEo0?=
 =?utf-8?B?WTlrSEFtUFUyMlYrUjFUU1dKZUlhT0huMGcyaUwyTitVZWluWktTbzhoNXVK?=
 =?utf-8?B?bERQQ0k4ZXNUQS9VdTVVTE8xaHBOWEdUaHVwS2tZdzZTQUlXTkcwY0tlM2Jl?=
 =?utf-8?B?eE01R29ETEJYeU5haVFOOXhWaUs2RUY3M1NtRkZwdmw4SnVXRVVZbzdGcGRm?=
 =?utf-8?B?S2IyK2xMTkNSdDFTS290bmZyMU12WEQrQnJuZ3hhWXA1WnhZeE8wSW5rbmhl?=
 =?utf-8?B?LzIvVHBUZ05aL3J6MTBpNEJoZ1loaDZ0UnI2TmZidmx2eTVwU1ZYa1A1S3BK?=
 =?utf-8?Q?ilDo7BvUVPgDhj75LN1wpKGZR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254b9726-fcfe-46dd-7fe1-08dda2af2e4b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:59:03.8399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QD6wkKZktzj3yHeM8rdmp3fhFLFi9ak8Mz2RE2pcO7ChBWJ78PY3pVHLLt3PO84h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7331



On 03/06/2025 15:28, Julien Grall wrote:
> Hi Michal,
> 
> On 03/06/2025 11:03, Michal Orzel wrote:
>> This feature is arch agnostic, thus move it to common.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> With one remark below:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> [...]
> 
>> diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/include/xen/static-memory.h
>> similarity index 93%
>> rename from xen/arch/arm/include/asm/static-memory.h
>> rename to xen/include/xen/static-memory.h
>> index a32a3c6553bc..e445aa80578c 100644
>> --- a/xen/arch/arm/include/asm/static-memory.h
>> +++ b/xen/include/xen/static-memory.h
>> @@ -1,13 +1,14 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> -#ifndef __ASM_STATIC_MEMORY_H_
>> -#define __ASM_STATIC_MEMORY_H_
>> +#ifndef XEN_STATIC_MEMORY_H
>> +#define XEN_STATIC_MEMORY_H
>>   
>>   #include <xen/fdt-kernel.h>
>> -#include <xen/pfn.h>
>>   
>>   #ifdef CONFIG_STATIC_MEMORY
>>   
>> +#include <xen/pfn.h>
> 
> This change looks a bit odd in the context of the patch. I guess this is 
> moved because the include should not be used if !CONFIG_STATIC_MEMORY? I 
> am fine if you want to keep it here. But it would be worth mentioning in 
> the commit message.
Yes, I did want to mention this change but clearly forgot. Will add (on commit).

~Michal


