Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B0296378A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 03:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785351.1194812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjTiZ-00031b-Tv; Thu, 29 Aug 2024 01:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785351.1194812; Thu, 29 Aug 2024 01:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjTiZ-0002yZ-QE; Thu, 29 Aug 2024 01:12:55 +0000
Received: by outflank-mailman (input) for mailman id 785351;
 Thu, 29 Aug 2024 01:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N580=P4=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sjTiY-0002yT-Cz
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 01:12:54 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0436680-65a3-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 03:12:53 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 01:12:49 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%5]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 01:12:49 +0000
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
X-Inumbo-ID: d0436680-65a3-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg66WHJuH3lFr4odXsW/JUXJw/I8rVy3vRfCUd0w4J8ttuPN8Jo6w2CBZ/D6uFeKxwWpjMkm1hudffORO66AyrxmxTZ9gTeiA5mjZ5LDUtThsxrY/rScXnY5XqnHricIwl7LlktmAoR2ZAlBW2a4yvOEXu0ZniYByLigdi+RzubqRy0YEikkx8MinUHcSr3xtq6oTGkByqd0UiPlDQ/ZIwoK7xenmNcL+Rb4dMjiCK8w2GjXm803hvH1wit0G6vgqHXuhDCnbxG5EFcSLIU4mZdRx4LC2Z8hvEh5RUmzG7D+YuN3Cf5iIX8WSJrMGo1LLfjHWhYev8j7iARFeUN3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrIrLs/kUauWM077ChCd602fJVbM6WoSGrQ0TaHlR+0=;
 b=NWaa97XntQeOUo2nEN/2sHzvwg+L201KThXFM1d/e+Wzn/884da/Uh1WezKzsXO0LvaaUUCJyqixDIsrEbmI4FkzFnvifuMCpl0WuJXcYSlxXkhyckxnmUeev8iQKR3XkWLdE0u740AnRJTyfONi219e3x11qVd3TE63jymWUfoJuzjtf1ArLB/bvVvlvWV9V1xQEqFp5GXRACsLEmzU7jwLxB2rvLqTSdj+3g4uGLZWptDQwjM+JCQSBQaD1sKEuNTR0bbuZn9PWdJ8q1NJQH48OKrdVbQleFfudrI5pIg+fIa4Z6JfRjVMCGPWZRznWXv0NWANyKybVNgugamLAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrIrLs/kUauWM077ChCd602fJVbM6WoSGrQ0TaHlR+0=;
 b=mXFamvGzz+y2mU4lV71gEcLz1hBzlX9ReOOEYqT3MaWk6kgOP54X0WohzhN2kcwXycU0REzMGu6xxS/GTh/Afdg5DKKCLK7L0B5qGU8S2nEbFeqequFQRzOliBwPxSepLhKOv+sTKiDOs8Fuy667DZ5wgAK5349lhdftH4Up5m0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b2ffadd6-8a72-43e5-b4df-7291d535141c@amd.com>
Date: Wed, 28 Aug 2024 18:12:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] automation: update xilinx tests to use expect
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
References: <fbda01cf915786ac7d51f9dc98489eed088a0433.1724719426.git.victorm.lira@amd.com>
 <alpine.DEB.2.22.394.2408281718580.53815@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2408281718580.53815@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0116.namprd04.prod.outlook.com
 (2603:10b6:408:ec::31) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eeb298f-be8a-4474-07b0-08dcc7c7b28d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWRiTGlDdUxUZU1LUWJuWXFMU0ZsZUVTOHFTVzNqb1VRb211YUMraDFOZmZG?=
 =?utf-8?B?WkhVaDk2ZVh3a0FLYm04U01qNWdiUnRSUG53aUNRYlN0emhyTTJEOVVFTDhT?=
 =?utf-8?B?cG10NFA5OWpvei9wY1psYndXWXFoK0JVRlFOa3JRUDlBMDExR0h4UzFnVlZx?=
 =?utf-8?B?ZnY3M0p3aEFhRVV3UzBqUGZrRncxTUFDUU9KMEhQOWNibzVqZVRkNDkveXBl?=
 =?utf-8?B?TmRKMEM4VGpwU1cvTWxWaTJKVjNrcVZVYWhLeWVUNmduazF1TnZ5ZVI2dUlr?=
 =?utf-8?B?WGhIUVZaT2dlRUNPVWVNYkhyUWxzMmRsVFpSbzNveVc2ellDamJwcUJwMWRZ?=
 =?utf-8?B?TkZEaDBQRm91UG9sY21IRzFDL2tQSlZ3TzVEVEhMM25OKzdkNUpxbEdkQVpE?=
 =?utf-8?B?cVYrazhuQ1ZnWlJzOTNkRjUxMENxNXE4UnEwTDlNUXUzVnRTZlZlWmFOT0ti?=
 =?utf-8?B?Z256N0VGWFJlZFpMUDZOY1VsS0NzOElHcmpmYmgvS25uMjNTejFzcVZxL3hj?=
 =?utf-8?B?NkJRcGoxbFJ3bEVSWDZWekh5b1JQTXBSTi8zVVdCYkRrRHNxcTRlcElwcTIx?=
 =?utf-8?B?VDBJYW5BNkRhVW5mMm1vRW5pTExYSUFIOFk4eXc4bk9UUW14ejFtTEVHcTRa?=
 =?utf-8?B?SzFSbkdlWis3dFQ0RS80aDJvcDBOQ1RGVWV1UGpVWG1PNDJ1dVFkSVJPQURC?=
 =?utf-8?B?dWRoQ3RheEZzei96WUNERDFtQ2ZKNzc4RTFVQ3ROdjlLcjBLcTRLSEFKV1ZY?=
 =?utf-8?B?c3pLT08xOStTVEVFR3U2eGdBQmdkV0xHWUV0UW45bEkwZ2oyaHc3Q0Z5MHB6?=
 =?utf-8?B?VWwxSC91aUllZ2FqSjVmRnUrVFMzMVlKYWV2a0h1UEpSQnBmTVJOTnUxNng5?=
 =?utf-8?B?a2lBSW1aNVplV3BXYnFlUVpzd3J3WFNlM2h1S1hrandmK2h5RzdJVUNuMFNi?=
 =?utf-8?B?emZKNTh2ajh5TVJOUzZhb3lMemVvcmtWUHdqUXNNWlVCWURJenBndmhLMWVm?=
 =?utf-8?B?Q3JXY1Y1U1M2SU0yTUhvSmZuRG0yYjI5c0wvRVkvQk01aFg0bVI0TkxGNDEz?=
 =?utf-8?B?MG5uOVdLUStTSk81ajNxWmsrODRlcWFsRjJWNUd6S2cwSXlvMzJ4d2dSN3JQ?=
 =?utf-8?B?Rm15cXBTckp4MGVkekFIS2Frb1JjdUtLdnBsdTJoVXJCQVpnZ3FPcEI0bkxw?=
 =?utf-8?B?cHVlWGpZMUprZGszREIyeUpiRTZoa1ZLNVlaWklHK1JJK2N5clBMWHU1MFFh?=
 =?utf-8?B?YTc1bWhnRVdhcHNDOXpraGJQUDEyWHh0MTZ0MTMwYUhwQXk0aklmQkYvOVJ4?=
 =?utf-8?B?bElndk9vUVI2ZkNrZ1JMblpaVjdwb0ZDS2pjT0hma20vd3BmbzE3MkgvM240?=
 =?utf-8?B?bFg5emNiVHU4dFdTWUlnSUdPS0hyZElXK1FRZnhQVVQ2Yk5wYkQ4WUVRaUJT?=
 =?utf-8?B?M2NjdkF3TEdmUktockZ1QzljU2lkRVRsc3h1THQ5eElDa2ZPaU5lSDBneW0y?=
 =?utf-8?B?ekxOYVA4MjNWdCt5RjBqN283OTVnNHFlaWliNUVzRzBRNHk2ZjZ1N1F5cUJO?=
 =?utf-8?B?OG1PY213TERtaTRnY2NSMUgvaTdxdVVMWURZSEtBVHdIOGRWTzQ5TUg1anY1?=
 =?utf-8?B?dzQrRGtESk1Dd1ZwQUpHZVBhTEJUclN2S1llM00xRklqOURaSE53dkRzdTZN?=
 =?utf-8?B?cVE4TDE4L2I2cTdMNTRNMlFnUWNQSURLTVZnNDN1L2duRXlWNWV6aFllNHlq?=
 =?utf-8?B?Wkg3cUNnVUlLdUFFTGs2dHY0ci9VYm1HaE0vQmFhamFTYmZ1QklwU29PYXcw?=
 =?utf-8?B?SHBvekxOc3F6Rnk0MUZSZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmQ1NXkxN0FRV0V2RWhaUXNkQmsza09UZFJrSUNNY1h2N1BLME5jUnp5RUl5?=
 =?utf-8?B?VmRHdTJydHljWW5hdjRmd0xrU3gvTlZrQUZSL1E2RU1mQlBRWUI1VUVDYmNt?=
 =?utf-8?B?aGFsM2JNQnpJSGxTNnp5aUlJUTFNUHZrSEEvV0FnTFNTb3VKZWRZcDdzQmhj?=
 =?utf-8?B?UnRjcjZqSGw3dXVRYWtjY2pVVk43WmdDdTB5dVo0T1pxOFRwdHp3R25EQnRa?=
 =?utf-8?B?c1Q4SnB5a0p5eG1NdXQ5RVZpTmFBMW5kTHZTZnE1TU9YQzNhR0YydXczbTZT?=
 =?utf-8?B?UHl4RXczUkVuWDl3N29RY0VIdnRjNStqRU8rTnRwMzZkTk1JTDJSNXFDaC9a?=
 =?utf-8?B?d3pzdmMydkJUWS9vdEhBU1hZczdCdTh3d0xVelNjR1BEWk5LZUhkdTQvMFVI?=
 =?utf-8?B?elk5MEtQTTMzM3FoalZ6QkJTMXYwYWtZc1UvY29Na3VVS1Jqd2cvVmZ2NFRo?=
 =?utf-8?B?Szd5SVhzRFAyNkUyWlZncnpmK3hpVUpJUVBxSUpkMHU0ZHMvbzNFNmR4V0lV?=
 =?utf-8?B?ay9VcnBacUFKbFd2TUxoeHJtempRL0NWekJva2dqemdIaG5SaExOUE9vNVl0?=
 =?utf-8?B?MjZRc0Ntbko3M0t6SjVCSHdtbFA2Y2tRR1J6MnNBL1lwQjRPdzB6THUxSTRD?=
 =?utf-8?B?M1QzRzNpL3FsT0sydzVaQ0hNUW5IblJEbTQ1ODBiSVhwT2ZCS3RiMWo1eEVr?=
 =?utf-8?B?aXlkTlNHaEZlTUFhRmRYTWtaWjM1ZlJzMDBSazN2Y3loVUpOZTV6MlVZWTNX?=
 =?utf-8?B?RU54RG8wb29MeSsyaG5sYk50ZGlseExGZEFLelJNbmxKVGlHMDRJWTZnUFgy?=
 =?utf-8?B?eFVVditFRFQ3Qlh4YWhPTytpRG1VWEFLeUZBaHQxMU5zRWJBUUwyVU9Ucjlv?=
 =?utf-8?B?K1duQzU1MDdKTXk4UFpHV3NRQWxYY3BCUmpUQm1pcWJqelZBNWoxanFsTzgz?=
 =?utf-8?B?OWx5V254TkpxRytzbkM4Z2pKVEtVOUxmSlFYcUl0YWV1V3lhRGlMTnA2bmNr?=
 =?utf-8?B?ZjltMlp2SnJlYVRBTTFQMmJNMmUwenozc0ZCYWZxZ1pqSDVmeFVZN1NVa0lX?=
 =?utf-8?B?bllBaE4rd0tFRURNNXErV3JiTkpIaDh6UytBUGdadDdtSStuYmlrbkJqc0NW?=
 =?utf-8?B?ZndVNStaRUJyYWVzTWpvYVEvNlBtYTM0MFlBczNmTGdQUWkxSVA1TXhJYmM2?=
 =?utf-8?B?ejQ2T1grclJSWE0wbWd4MnJDZy9pQzVFTTFHY1htQ0tVZU9ua0krUndIS1Uz?=
 =?utf-8?B?TStrV3ZGcmg4eVlidFNuZTdQRWVLa2hkbzJVMi82SDlHU0g1UEVjVU5wcVFL?=
 =?utf-8?B?ZmRxNFpOMmJQaU95V0c5YnRoWmRwVVhId29kQzdEdndybXB4TFROcEx2bUpR?=
 =?utf-8?B?TGg3NExaa2ZrVHhWa2R3d3VZaFRSR3cwZVQ2L1RJWEI2SlJObm5lRGhEUXdO?=
 =?utf-8?B?RlVGcTNqQXYyUkdIOURIN2krdnM5K2lNL0x3aWZOTFhsSVAva0Z6V2dnci9I?=
 =?utf-8?B?VHZuWHluTG14VnpiOEpBQmxQakVpYWFXazFNWnhiTkJodkx2T05XSkFsekcw?=
 =?utf-8?B?TElWTHZEVCt2czlMcGlGVVN2MWlvQU4zSzdHMEFpVUliNHVWaDVMWTZ3Q2t1?=
 =?utf-8?B?VkprL2c4ZjcwZVl2aFlqMXVlRmd3WEE4a2FUMWNxellqSHlzSGRpVGdzYWhn?=
 =?utf-8?B?ODJnKysyK3FGNlpSWFdFY2xxZE91N1ZTSGU2MitaY21pZ1Z3NTl3c1RKcHBG?=
 =?utf-8?B?TGNKK0piODQwTHVFTExLTVVCZCtZbW5xY2xqQnpvOXV0Myt6SnBRaWRyVkdw?=
 =?utf-8?B?SElnQjJTKzR1T3pMbHFBOEZNRlBobHFtaEM4YW1ua3I4S3FmMlpEUUVudU9a?=
 =?utf-8?B?VjFMeFYwdGtVU1Fma1dWV2x6UWtpblNxUHVwUUJaeXlRZGhJTnBRVndKWGVF?=
 =?utf-8?B?TjlsbW5MMTNYZnJlb0JJZnJKb2VsTGpMeU94YnoySi9RaHFnRmNlbXVjb1ds?=
 =?utf-8?B?eTA3dnkzczBiRGttZFFicjRkYTh4MiswSWxmdks3aWg3TDV6NGljRE5BVHBE?=
 =?utf-8?B?QS9UTkl0V2o4RnFyRUJYVmhnNGdOb0NIZXJGcm1JdEx0Y2ZGbmZIaVc1c3dQ?=
 =?utf-8?Q?ys02tnDfBonuU9TBNCrjYS+F4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eeb298f-be8a-4474-07b0-08dcc7c7b28d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 01:12:48.9278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBoQHE9Q9sG5mhbuDZCDK6vFm9Lguyi2CfV1cXAHhmtmK8Qp025UeA3FZSL2Uis69YOucb90o++NXfgt7a6A4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191


On 8/28/2024 5:25 PM, Stefano Stabellini wrote:
>>   xilinx-smoke-dom0-x86_64-gcc-debug:
>>     extends: .xilinx-x86_64
>> +  variables:
>> +    TEST_TIMEOUT: 500
> I think we need to add something similar for .xilinx-arm64
> The timeout should be set in test.yaml otherwise we'll default to 1500
I will add the missing variable.
>> t TEST_LOGFILE="smoke.serial"
>> +mkfifo console
>> +sed 's/\r\+$//' < console &
>> +./automation/scripts/console.exp > console
>> +TEST_RESULT=$?
>> +sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
>> +exit ${TEST_RESULT}
> Isn't this sufficient? Why do we need the fifo?
>
> export TEST_PASS_MSG="${PASS_MSG}"
> export TEST_CMD_START="cat ${SERIAL_DEV}"
> export TEST_LOGFILE="smoke.serial"
> ./automation/scripts/console.exp | sed 's/\r//'
> TEST_RESULT=$?
> sh /scratch/gitlab-runner/${TEST_BOARD}.sh 2
> exit ${TEST_RESULT}

In the line
	./automation/scripts/console.exp | sed 's/\r//'

The exit status gets set to that of "sed" instead of "console.exp", and it could
produce a false result. This was one way to achieve the result while avoiding bash-isms.


Victor


