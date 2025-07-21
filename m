Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB1B0C3EE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 14:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051466.1419794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpQe-0002wG-KV; Mon, 21 Jul 2025 12:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051466.1419794; Mon, 21 Jul 2025 12:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpQe-0002t9-Gu; Mon, 21 Jul 2025 12:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1051466;
 Mon, 21 Jul 2025 12:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2o=2C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1udpQc-0002t3-OE
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 12:15:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:2417::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 660fe5f9-662c-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 14:15:33 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA3PR12MB8763.namprd12.prod.outlook.com (2603:10b6:806:312::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:15:28 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 12:15:28 +0000
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
X-Inumbo-ID: 660fe5f9-662c-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PH7C7Ox6Z5whsjgUSM+2UNi6KYNQrLV2PQgb97xruxzFZqqmw0YFDr+dkEvmy1JxBTD/r9eSQQm38CAi0tnYNSHyQeB8FmpxjEL2aqVYueV5yOIWhI2SGCGljVGRIgd4FrWsTTAYZe5wl604V7zJG5WRO/1lfOLTWJ94d73l7wQPtcn9kS5+if8dxi3Z41yrqYn8rCYyncP1rMD5SH5nK7sURv9WzlpdP3zz59RNe0t0qMGBUC2LQ6/0w7TVuW5xBVCI462HDlEDlnDsPGE6FGsSCKGsRdaxrF38Npj4Eistv9kkaRCsjp5huQLXr6remgfBJknHQ62xG7t/9a898w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jxjSTH+wZRl4K72n38Im6VX/JPY+dcWX2ws3XKWh0Q=;
 b=gCnsGUrkHL7l3Zdf5DW+0F87RIY/ra8OMIs30kgBq/RAC9Kzc97g2Tpa6lI9WUlqD5spD61oT/yaB1052ZkOef7psKB+hUNT0heoLpta9r7/9/Upusih2Ynpw5dtaCjfpCvh/NBs6dvThUTfryCvsw8yrtjNUxk+or+ncohayNQoCBpMIYkUYh5ff9knYp9FbDjLVFXtNgA5yNVT6DBO3TgjzBPM8dT9+cVC0w2xJ+t8Zb2ImjHLZSBEzyiNEcLzVJYaRWzhmshPhYSUm5oO52icETb2GwtDaPIYV6sjM37oe0M46YNKCVS1SPFswuZYsDE9glNBaMnoQ+oVw6iC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jxjSTH+wZRl4K72n38Im6VX/JPY+dcWX2ws3XKWh0Q=;
 b=g9I4gFikjymlYJ13B1VygxAzhuv/o+RzVIj116LH6E1zlhJgGd010QjfpBsI4r5rzd2LfAPYW424yVsgT776YX/xXi4kr0KH3APT5rqCNTY8Wley+JqPucwkT5MfCXP1hAlhgqSp6k7VWPOaFRLtjDjDOQPnUpwq+IlnnbEkwBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <eef51d39-7d4c-4248-923b-d8ffe0f1ee9a@amd.com>
Date: Mon, 21 Jul 2025 14:15:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/efi: Do not pass dummy pointer for empty property
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250721090713.414324-1-frediano.ziglio@cloud.com>
 <20250721090713.414324-4-frediano.ziglio@cloud.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250721090713.414324-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA3PR12MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a61dd5-15e5-47bf-c1bf-08ddc850478d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTc2UzRTYStjMVA0TU52SFRrZGR1MUNSbE95cGtRd2lLYmdlMjBzb2xRV0F5?=
 =?utf-8?B?UCt3MUczSFVSOE1NTlcrRFJRVno4cXhBQ1krd1pqKzBYdlJlV2lrUDgrcFJm?=
 =?utf-8?B?alRhc2pob3d0S1h1RVN1b3JQQkZxWWtlamVEUzFObFdQcGlxd0kvNkpvd1Ay?=
 =?utf-8?B?STdiS2pLNkNHQUxTdTZlRkVNUDN6TGlCTTJZb2t6QnBhRlVEbkNqSHg5TytS?=
 =?utf-8?B?MDZpYkxZejU5N2xhcDNXTFBFS0pzcUtIWWlLeTRJVUYwK3hGN0pEVUxZb3p4?=
 =?utf-8?B?NFNnYVdESllQNjR6dVBPbkV3TmNzNEM0YmdVVHFEdG5mRmhYa3p1ZTgrV1c0?=
 =?utf-8?B?SDB3TXlCN1JvSXhmWFM5UXZJeHQ2TUM4V2ZKeVJNYmgrcEl6Y3VPWDdESzRL?=
 =?utf-8?B?dWpETkJiaFFkVllBZjZsTFhaaDV0S1Ixb3JJZEs4dEhlcVNxcjJlTHFhakdF?=
 =?utf-8?B?c3pkSFI2S1VkRFkvcXAvSlFxUzRMSFV1cHFjK1FvSTF5TzVDMnNxUU1kTnpO?=
 =?utf-8?B?d214NXlPY0FaMkMwOVFRQjRXbEJuTFZFdC9FYmVxUmRyN3JFSnd6blZPTlpm?=
 =?utf-8?B?SHpJSzZKOXZXMmkySXVXVnlXYjFINWlWTWZlbFRhVTBIK1NBU0xvUEpON2l4?=
 =?utf-8?B?eXRBVHhYZVZzbDB1ZnU3TWc0eVFxTW15TkcyQ1g5UU90c0RpcURTaVZOT21N?=
 =?utf-8?B?bG1PTWRNc2k3dUlTWVpTejljdFVYSmtIcFVhNDZNU0MwL2dORlpxcTZZVXkz?=
 =?utf-8?B?QzJjZllmK0tJM25CZU5mVTRrRXJVN0d3ZllYYkdUbWpMK2pYcnU3K0VpcjFp?=
 =?utf-8?B?MmJNL29EZW4rVm16RGdXLzZEc0RtK2x1RTRiU1Y4VVRhRnlhMVdDZzBVNFZK?=
 =?utf-8?B?aE5zdmtkUk1tUUlQQVA1dlk0UEpWeFlTcUI5YUVJUnI3MWQ2V0tidzRwUHJw?=
 =?utf-8?B?MTRZbzlmRjdaL29iYW1ZbUEzeDVLVUNnTXBoUmoxSUlpZm9GZGdtMHV6MEZQ?=
 =?utf-8?B?YnZDQ0hBU2VBMDd1aGVsWDNxeE5keW5qZlRxTTRackdlT2xDRHJISmdXb1FC?=
 =?utf-8?B?dVNucFFGVDdQN2lHWm12Q2l4cHRKRmdoclVzbDRtemJmK09HQ2Y4eGhaZEN0?=
 =?utf-8?B?MnJuTUNtTnlzQXl6clpTTzRTSWdHQm8yS3diZGdFbnNIeklxcUtKbXJZR00y?=
 =?utf-8?B?dE1CNnlpcmF0SUtaOXRENGp1ZjY1M2NTNHd2WkMzQVNVZnB5K1ZSTGhEUTVL?=
 =?utf-8?B?VmRPWmVEOHRnNE0rNGExMjVNZnNQKzVCcm5BZ2xjMXJtNU80WWViQWlLUjBD?=
 =?utf-8?B?c0tYQ2p5ODYrd1dqekVGbmEzc1FGbHQ1T0g0SS81Z09QaU0xVE5hUkk1RllP?=
 =?utf-8?B?VkZBdzRwTG9tWXlURjJuOVZQNWphdFE4QVBrR1NTWXVGNDM3UzhNR09TUG8z?=
 =?utf-8?B?dVNzM0NieVRQbzNadGVpMjZ2bE01L0Nna1dlbFJ5cU8wQ0o3cU95R1hLM1hS?=
 =?utf-8?B?dFIzcWRkTXRrZFB2eHBIY0NpS2xWdENZRzU2Q3FaSURNWkxvdjhjbWJqclFm?=
 =?utf-8?B?TTErVEVzbmlWYWorRWdKM3RpVVZQOWJ1RkVvNVlQQnN4QWtDNndDeVJjcHNQ?=
 =?utf-8?B?WFNiQzdRdkpwUmtTWTdRQnZCYnNreit6T3VYbGN5QlV0QVBydTNXVGRmZElJ?=
 =?utf-8?B?bDhsSHRuZk9kQ0tZMXBheE5YbGRrc2hUSXlIeUVtcTJUN2pKdkpqakdSWEFD?=
 =?utf-8?B?VlZPMVVKZjVWVXNzRmFoWDR5ODF6cUxKb3N1MTJCc2NxUE9LOFdFQVE4cHNP?=
 =?utf-8?B?dE9oc3FiQ0N5TUhlcHpTMllWWCtNV3JLLzR6ZDBsMWc0ZW83NE10MXozV3gr?=
 =?utf-8?B?SVZlV01tQWVtZ21Rdk5jcmRreHBhMjAwQnM1WjhSSHVXV3YwemJVMllJOTFR?=
 =?utf-8?Q?ldct7lIuxdw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0xDb3lTVHI3cjdMdzZXazR4TlVpNlpTOGxMa0lmazVaQW40dmpDVWc5Zy83?=
 =?utf-8?B?TFg5NHJwK1pLZVNvVDRqS2hxR2NJYmNmWCt0VDdNemFJY1grZlIrckFXOHFP?=
 =?utf-8?B?YUt1U1VQanI3OEVyZzZkdUNaekpKNG1SM0x4dmc5OWQxWFVxZDg0Qm5WTHdu?=
 =?utf-8?B?Um1EUjRDdUl1UGY3STVTYW9YdExkS1FBS1JzUjFOSldmaVF2WjBUMC85MHk4?=
 =?utf-8?B?UGlIZEc4VURLenBtbUw3RERjaURpcTY4bWpNK0xVWXRtVWpzRHlTRlVPSkJt?=
 =?utf-8?B?VkJad1ltU2t2YTJGNWFqN0N5V25nUFc4SDVhSGwwZ3FuemxObG9nSEdlMnI5?=
 =?utf-8?B?RWxWaUFjZWdQMXArdjA4Tklxd1M0c2h6RGEyUlg1L3h6S2VHbjFKZFc5VUZp?=
 =?utf-8?B?M2dWRnYwQndjTmZleHJTbC9tbDdraGdTVDRsZzdiemxOZnFFczBvME4vR1pS?=
 =?utf-8?B?TWNpZkx4cFJ2cmpyYTZxT25vT3hpSUNFKzJtekRSVEUzcVQ3aFdIaFZhRzNu?=
 =?utf-8?B?cXRSQUFJVVBrWXR1WURvSUI5ZTZEOWxRSzg0RTlEcmRjUHRIVFZsbGZxK0dO?=
 =?utf-8?B?akEzdnNsSnFOOFFrYWdOTnE5RERVVkE5YUx6Skx5RVN5em9FZWVPL1J2c1Fk?=
 =?utf-8?B?RVZRVG1oY0REK1RaVzFkaDh5WUFSbXFjRTlQMDVKdy8wOU0rYjRIbjRxYzlk?=
 =?utf-8?B?S1N0Q0VaRzRUdlVNN2FyYlR4L3lQTUliamxyU3IzVCtXZ1pmdm9qOWtJVFU4?=
 =?utf-8?B?dWY1YkZ1Wk1vRFZERllhZVduc0o2MGxkRkhqamR2NXIybFBFL1c1MXBVUGtS?=
 =?utf-8?B?V1I4S1hqWFhGWnplZ1JEWjdTVkxYeWdsaml1OElTZ3pMU0l2Wld6WVpnTWNR?=
 =?utf-8?B?Yk9uSEpCZ2tRUVE0TTRHN2pPOGJ1akVzY3RTOEkyYmJXcmdEb0dMQ09nTHFi?=
 =?utf-8?B?Ly9EcFJmNG5pWlJENkREU2JBbU5KL1dSWENjMDFoWWJWeHFDdDFKajNrM3c3?=
 =?utf-8?B?bzdMSWV6M1dMYnR6djBoVG1uL01yUTJrOUM3MUN5UEszQ2o0S3VzclZYVjFC?=
 =?utf-8?B?M25keWtZb2NMNTlsZmMxVzdUazdsZklPaDVqYllNcjZyNWZucHJIcVNzWDdG?=
 =?utf-8?B?ZVVYWnN1c21obklhWEY1QnZacnQvVnhoQ1R1L1d3NC9oeVdvTzNJTndhdlZ6?=
 =?utf-8?B?ejI1YVJvNm01TmJ5cmxpUG5PWmtZU3FSVERPRi85N3VoU29PZmpHd0wrMUFF?=
 =?utf-8?B?ZnlKQTVuTDJDQ0xDbVFIMnNncis2UTlFM2tpL09XVDZNWlk3cDBQTXRyaUJJ?=
 =?utf-8?B?d0RlVGZ0Q1lSQ2RTSHFoNnpVYTdaWDE1Mmx6VzRmcWVVSXpRLzNYcUQyQmli?=
 =?utf-8?B?bFpYb3NwN1E3ZjRPRDRFeXM4THppZU1pWFpEM0FlWnByZHJYN2YrcTZGOHVK?=
 =?utf-8?B?d0owRFF6cDAxaTA1SDNBbXJKVlZhcjNJZm4zVVI4eUt5MTIzQkFBTkR1SER6?=
 =?utf-8?B?NW1JNGpLMjc4UDNqM01XVGNhMHo4TzIwZkQxQUNoc21Felh0WGJOSllDYkcy?=
 =?utf-8?B?R3VtOEE4VDZNMVExY1BiUVVtMDlCNnZadThZbW1SdUt6QitFT2I2dlgrU0Vr?=
 =?utf-8?B?azRubUpCV2JoeW5rQXhzVmQ2dUJwa05malVUUzNxcGFJQ0d0TzZMVFo1bmlO?=
 =?utf-8?B?RHhlQzFtajB1NUNUd2lHQ0x3YitKWkJKWXhqM2tYWHpYazE3alFGejB4TE5Y?=
 =?utf-8?B?QkF1UHAxa1dDMHEyTjNQeHFEZEVIakYyMDRYM1pNRVR0SXlGUGVmVFBneU9o?=
 =?utf-8?B?Y3V2M3Vua01wL3ZWc0RzOFk4Nkk4SS9ZTVFBVW1MeDBvZTlORGptTzkvWldM?=
 =?utf-8?B?N2ZZWVJzZHgrdzZlSjQ1OGdRYm54dkoraFVvcUgra2tXejRrTjFZZE9qZFNU?=
 =?utf-8?B?NUw3c0dEYzR6L3hibXlYSnhOd2prRmNLTkJpaDk1TFoybFl3eFFCL2tvOGVC?=
 =?utf-8?B?QWVlazZJN2Zyd3c2V1VVMGthbU9Ed3hPeU9qd0cwVklQN3lsdFA5d0FPeXZH?=
 =?utf-8?B?eElWc2p6N0tEZmNqVmRPTW4yd1lKa0hjUW5RV3U0SVN0dVR2N0JsN3dGakFu?=
 =?utf-8?Q?LPFs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a61dd5-15e5-47bf-c1bf-08ddc850478d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:15:28.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8JSpHN7jtCfFGN1xJUflrzc6X6UWQhonS7efcv/zMwXBJzm/QNRzMiURrfdX01b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8763



On 21/07/2025 11:07, Frediano Ziglio wrote:
> There's no need to pass a buffer, the property is empty.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


