Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10EFA6DAD9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925493.1328368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhXS-00014a-CO; Mon, 24 Mar 2025 13:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925493.1328368; Mon, 24 Mar 2025 13:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhXS-00012k-8R; Mon, 24 Mar 2025 13:08:22 +0000
Received: by outflank-mailman (input) for mailman id 925493;
 Mon, 24 Mar 2025 13:08:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t537=WL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1twhXQ-00012c-QK
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:08:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2412::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cede0f6-08b1-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 14:08:18 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB8933.namprd12.prod.outlook.com (2603:10b6:610:17a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:08:14 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 13:08:14 +0000
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
X-Inumbo-ID: 0cede0f6-08b1-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1sYiAN3foOskASPauoQ1hWFGLj0j4hMoG4EClbGHuYFq0ozX13Or6xl//VnV9A57OpQFlPoS3Tp2g9j54qSBjomS8ArmcHXcjDazho2LFUhBXoTrFKw2OMgfPUFp7Myifg1LEnsLD+xVowYyxt6L8V9PiUqTeCYtC5NSjJs6S+wI+JZcxbagqrEqLd4N4TX3IAVRskbi7FHC3+wMWEPAvJ4aTSPZ43iiOizACEXa3TOwLqpYbWxBTJq7vkETMaNAIlleTPOnvmGVTFF/Fb7H/xNAiBytj0hqnLYq6ALvWiisfkLJ4a/c30T986KMPy+90uaRLyTIdTdNjUrWDVc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXc6orBNkhZcnAy16THafOsuMvnW/PRO1pBpbcDUpAU=;
 b=BrPw5wF0xgxxyQoQk/C4HC25pgZxDSJzSs2718cEmmhMEl6jsk0wJISGNEsJ7TqwkmwAWOi5pPFV9hqohp1eLJb8Bh1qmwje9sj+3O6g/767nugbYB0m4qfCPW1DJ5J32GBDS8l69zvH5841WZic4Zfdjlj1/Ek3WiV4NjAJnyb/vQ87CR5z/ivBl46fyxF1XwSAQQMA00tSVxVgV8KIN2hMQqLcDZRRGZRRZMgroA3z/wzs5rvQ//PfG9HnSy7a+VH6HNZrR895Ev3a7S4acHLj+eTVGCpQS8PGhqz5Qxb6kBoSH0ELf3VveceSXBHhBbQSQVe/S6ihe9hY833Ckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXc6orBNkhZcnAy16THafOsuMvnW/PRO1pBpbcDUpAU=;
 b=N9ZwKpiTJHlkwFKHiGA8XgJ3HHdHmV/MBDfamE4C4mbUmoEK2OhuWuw27K1r3t0Euq+tjYWiPKU8zbuVmGo02TE2X3iVXg2VLLD23bsPtuiCmkQOM/UK0CqbVMB7DBFsnNjof9+Ag4F2SswTftdl6UGOV16aVIqTSAEoWTvqHks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <17608388-b900-45d2-bb74-8eec04ab1f76@amd.com>
Date: Mon, 24 Mar 2025 14:08:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250318090013.100823-1-michal.orzel@amd.com>
 <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: f878fdb5-6760-48bf-af2f-08dd6ad4efcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmpnTHZ1RGx4dDBUb1FRNmhKR1ZuTWxKZEJoWGFxNzlCTHlwYTFmaEoxNnJ6?=
 =?utf-8?B?MENWT0tZeHAraWUxemIvcldvbnU0K0k1bTdCS3lRaVNOei9VVTczYnFLWDF5?=
 =?utf-8?B?QVNrUE1DdXR2RmlYNFBCUVBWRmFGcnBvMzlRSWwxOExPV1kvNVo5OThPRE5t?=
 =?utf-8?B?NjVZVWR5WGt5Zk1NRTFGUDhOQjlhYWhnRDFFQ2tKMXZDeThuQWxkZzVsVjJy?=
 =?utf-8?B?eFdUVTY5T2xaRTNhSlZCZlBWQS91Q3FPT3F6cGFZL3U0RkR4bUEvVUkyNXpB?=
 =?utf-8?B?Q2lyWFE0RmR4cnBIazNBY0xKU2NHZG9TUnlXdC9jZys4bzYzeXFmNnQwRnFD?=
 =?utf-8?B?QnpCd2dBMnRhYkxsNFllR1laV3BSdmxzRE1sSy9TV3hXS0VWb21PTGRrc3NF?=
 =?utf-8?B?cm9SWFpnWjFMdGhNMzNmRjlCdE9QQ3M3cDI1dmNXTUpYWE16VzExcXRlOU1Y?=
 =?utf-8?B?RC91eHFIakY1b0VQMzhOZkJrWXpVOU1ScUxYNWpvOWppcjVhU0t6TVhDRmZj?=
 =?utf-8?B?VTQvbk1URkFZcUF6OUIzT2dtU3pMNnI4NHM1MU5KNzAyZ3lTcW81cnBwYmpi?=
 =?utf-8?B?L3dZLzUxSUZpaGYxNzM4STllanVHTEN5QmMrRktOUDd1dzdiNG1hTlJNZTVs?=
 =?utf-8?B?RSt4dkR0YWlmQkJDY05oc3ZNUlowVFBZSXRCRldVcWkvOXp1TDZod25TQ3cy?=
 =?utf-8?B?VmpVbHBmdjNGNkNvYmV5MzAzRFloVkwyV2NIN1VpMDk2S0RBUXBFeDd1WkxH?=
 =?utf-8?B?aGE5OFNsRmJRQ0NEM2x6bU5aVCtnMUZheEVGbEVaeGMzYjUxTmVFeHBRZExD?=
 =?utf-8?B?a1BiMzVqTzNwMWp4Y0hKUlg4WUpZcFlQMks3SVVYakRrTlFtWENRQktlN0Jp?=
 =?utf-8?B?VThwMm8rR29zNUdTcFJwQ1ZUa2s2N1dQeUFWVnRXZkdzdDJ2TUVDR0RXZUdC?=
 =?utf-8?B?VyttZExpOHI4SW1ISnhtbFhNVy9Xd0RsV3duVVorVlZRVlp0dTRpRnl0OU5L?=
 =?utf-8?B?eStjUjFPR210TEc2N0QzWi9WcytxakFERXg3alZVNjNzcGx5YmEzdE5OYjh1?=
 =?utf-8?B?YVNzMTBrYkQySHlHTlI0N3hiOC80cklNTnVLU3pQKzAwcGNjdzh0cWxsS3hu?=
 =?utf-8?B?TGR0bVplcEtpQ3BoSkNEbmJTU0ZvUExScTVKL2haU3NiOVNWME1MaE1IVW5P?=
 =?utf-8?B?dDFNek9OdXRNdTRBTS9XdGRjamNOaTBWbFF0b1V6OEd6aUJWWStaTGl3bzZz?=
 =?utf-8?B?MmlOMkpMcnBSL21HdjBTUTJndTF1dkFLd0x1cGFlYW1mNVYxL1J5OHZKNDVr?=
 =?utf-8?B?My9ZMnFYTFh6amk3b1JEN2dXVy9Ub3lGd0hzR3prOTRSNUp1OUVzWWNPQ25X?=
 =?utf-8?B?NVEreHBHQW9LclFFSFRRYjFNcm1STlVaOWE5UTRvYUVwSSszZldVNWo0SzZv?=
 =?utf-8?B?T1I5MXlyWWdZTkFQRFRvRlZEa0ZWOE5ZTkdrY0N5blFFaVp3cjNNNlZRdmFw?=
 =?utf-8?B?c2J4Tmd2V2hMN3l3VmR0N2o0cnJYY0U4YW5GdWhHTHllSFhUOUduSzNSWjlX?=
 =?utf-8?B?WmEvSERiemlzOTJkZytKOUYwZGhYRXgvb0Z1dWR4SnZWQ3ZITWZiL09vMElw?=
 =?utf-8?B?M1ZsZHY2ZTNvV29ETjl0SEtDL3pzR0xiTVlhdzZEc1doVHNHdDRwT3NsZzFX?=
 =?utf-8?B?a1dOT3hHQ0UwTkR1V29iSFJ6OG9xRkQrUGVCclFjQ3IwRDVKL0VGaWd0czc4?=
 =?utf-8?B?RG5EZXJoY2hRK3pTQVdsazNYTndNbm9OTy95OGJpZTVYQkZEc1kzNi8yUGlI?=
 =?utf-8?B?bGlNQTdPVUdxYk9UdHFSc0pzS1dzL2JHejRBMGcwS2p1Mm5tazkycDduSWI0?=
 =?utf-8?Q?qVCGIxzjAL8Zt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUZpMWlMOGZna1BtZWlEM1FKR1hTSDVNcTdUQnJPclVGYTJWR3FPLzlUNHVw?=
 =?utf-8?B?ck05SW1WZkhtN2ZCK0JheXhSdWM0cDEwVUFueWVIZWVtSUpodFJOUUYrY2xZ?=
 =?utf-8?B?aUl0QVNuY3JNVnB6U2RoNUxlMzJ1NnpncGNGd1dhdGNmN3dwQXk4ZzBINThZ?=
 =?utf-8?B?aUdTdWtyRlJtOUVkQWcyTDNUVnFLT0xtaHFlMjRSTkRKZmVBQjVvUWtBNGYz?=
 =?utf-8?B?QUFQcmg0ZGlPUW91S3BMSEJGbkZPMyt1cHpTUnVobDlhZ3BSMkJlQ1lRK1Nz?=
 =?utf-8?B?QlpBNkU0N0pTUmk2d0ZjRXprRThVdXdlRGxFVFlCd2dEOUNYQXVVT0FJaG45?=
 =?utf-8?B?bjRmdk9SK0FmMjVQTzJPaVF6R1UzbGcxWlNxOHNxSk54cjJzM1JkYzVWSlh1?=
 =?utf-8?B?ejQ2WkxqRE9YdllhR2thZmptbldoRURFZWk1NFJLemhYU3NMSE9mRmVDckh4?=
 =?utf-8?B?SGtIdEI2M3p0RnZkWGdCdldPR0dqNUw4eVNPdW9oakRSb0RMTXBEclpXT2Ri?=
 =?utf-8?B?T3lCcVdYWFZlQXpIQnliZDR2bUs5LzlLYnRQVFk4ZmlWV1BlUitXTWdDOHh3?=
 =?utf-8?B?ZVM5bVV1T1ZPV0RUZnFpaXJBMlBVMG9ydHRQN3FYQm80SHZGS3lNeEZDZUpR?=
 =?utf-8?B?cm9ZdkNNOHZnRnpnWHdkd3JTNzFEQzJEb3dsUExVVFNacjN4UUorc0E1Q3ox?=
 =?utf-8?B?cXRkd2E0Y2NyTjRIMHltbXM3d1RVMzVQV0lOTSttMDUreUdTTGJlY3JoeDJQ?=
 =?utf-8?B?T0sxckN2MWptN3BHemRwL3EzRUYrK2xwRmV3ZzQ2L1lETklMZ0NJRTBJRWR6?=
 =?utf-8?B?dGJocE0vSzZENWd1bzQ1MHZ4QThwRzE2VzRLcWN1ZTFJYWljemtEU1djQXNP?=
 =?utf-8?B?eEtBaDlzS0pFUEpPRHFiRW9BYUdzNXk3d3JicjE2RWpOa3E3amg3NXJVK0ow?=
 =?utf-8?B?WUJYaDJhdUM5cXZOTFo1aWx3ZGdKY1hDdDExUVRvZTcwRThzQXc2ampCWUNT?=
 =?utf-8?B?ZmZmRDhjTlFSN1VRUkxhdVk4UE9jSUdHZytpbFRsaU9Pb0Y4bnVzS3BVWHJS?=
 =?utf-8?B?VDY3RC9kaDVsbWVpZTF0YjdUd3hFNWwvZXUvZmt3a2dGdWxzZVhudytBS3JO?=
 =?utf-8?B?WkcrYVBON1Z6SFVDcGowV0VVN3JsS0ZVWTlZMStBUGI5VWNGOHlKSi9rQmRq?=
 =?utf-8?B?SW1zN29nS3lzVzYzMjVRN0FQWUxqMStISzBRS2JMLytqUmVOT0Y2V0o3Q2Jo?=
 =?utf-8?B?MnAxYlZBbDNwdTRIR3dQa1N5bnUrdTdlVDlIdlpTRi9SZFJLR0dXTk9VNzYz?=
 =?utf-8?B?MDVqTmN3NEtneENGdFRSeVhZOHgvMTR1NjBVVEo4bVBuVFBUR2IrMDFkc1lj?=
 =?utf-8?B?Rjh5V3RBY0V2NXJWOGplTHRhVGdGeFBQQUdmVXgrUldQVnpQQTBFWGI1MHNa?=
 =?utf-8?B?OFZJTmNUaDRtbnlTb3hORXRXajlGRUVldmtjRGRRVkFyT211eVcyZkFOSGFT?=
 =?utf-8?B?UE05UkQzbWZHVzczODNRZHNSQXNIdVZUZFRYaGNyUlRtRnJxUjZad2hTZzB5?=
 =?utf-8?B?MEpzVkUxV2M3cXpCak9GcmpTaHI3czVxNVpIaEV3b29oVTVOVERBRElxcUhi?=
 =?utf-8?B?TDNTaGhFK3AzMGp2bEtLaDM2V09kTjcrZGJSQ1NXaVJQRWoybkpBWWdYdVN2?=
 =?utf-8?B?aEtNVy90NnlHMmt4bzhDbHVPNHhETmdqVUNpUnl0bzVGZGxvRTNpbzFJUXdq?=
 =?utf-8?B?NTZSa0dPcHJNSkJ3N0RZRkhJajZvKzluY3NqSG5JRVc4RHg4WXJZQjYzbjZM?=
 =?utf-8?B?ZDFsK2o4ZXpRS0VmQmF2eTlxNjdIOXlzMURXUjNNL2hMYmZuRWNpazdZRzd2?=
 =?utf-8?B?QW9MamJTZWdWNzczbXdzcUhVS0h6UHF6ZGdoRmRUYkFESVJmZUpKOE96RHk3?=
 =?utf-8?B?R1RTZDJuRTJDeXR1UmxxcVVZOFlTUm9rcDlKMCtzNlhpaTdCS2xmZ29XeDR5?=
 =?utf-8?B?QUhndSt0K3ZvTkpEU0VtMHJENXB2MVVkalR1ZVZjWDJEN2dHd0hHbE1TcHFz?=
 =?utf-8?B?d04vRVgrTmFyelRxZEpoZzNxdHFxdzl1eDg2UGNTQ0Z5MDhicmpOMXhrVFV4?=
 =?utf-8?Q?zFDA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f878fdb5-6760-48bf-af2f-08dd6ad4efcf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 13:08:14.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PASzjdcHqa2SySDlH0EIwdTeFE9/BjLbeVWrhzvmeUzHukBg67NMQqBK+XGi0BVZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8933



On 19/03/2025 15:01, Alejandro Vallejo wrote:
> 
> 
> On Tue Mar 18, 2025 at 9:00 AM GMT, Michal Orzel wrote:
>> We are missing a way to detect whether a user provided a value for
>> nr_spis equal to 0 or did not provide any value (default is also 0) which
>> can cause issues when calculated nr_spis is > 0 and the value from domain
>> config is 0. Fix it by setting default value for nr_spis to UINT32_MAX
>> (max supported nr of SPIs is 960 anyway).
>>
>> Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_spis value")
>> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  tools/libs/light/libxl_arm.c     | 7 ++++---
>>  tools/libs/light/libxl_types.idl | 2 +-
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 2d895408cac3..5bb5bac61def 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>                                        libxl_domain_config *d_config,
>>                                        struct xen_domctl_createdomain *config)
>>  {
>> -    uint32_t nr_spis = 0;
>> +    uint32_t nr_spis = 0, cfg_nr_spis = d_config->b_info.arch_arm.nr_spis;
>>      unsigned int i;
>>      uint32_t vuart_irq, virtio_irq = 0;
>>      bool vuart_enabled = false, virtio_enabled = false;
>> @@ -181,13 +181,14 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>>
>>      LOG(DEBUG, "Configure the domain");
>>
>> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
>> +    /* We use UINT32_MAX to denote if a user provided a value or not */
>> +    if ((cfg_nr_spis != UINT32_MAX) && (nr_spis > cfg_nr_spis)) {
>>          LOG(ERROR, "Provided nr_spis value is too small (minimum required %u)\n",
>>              nr_spis);
>>          return ERROR_FAIL;
>>      }
>>
>> -    config->arch.nr_spis = max(nr_spis, d_config->b_info.arch_arm.nr_spis);
>> +    config->arch.nr_spis = (cfg_nr_spis != UINT32_MAX) ? cfg_nr_spis : nr_spis;
>>      LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>>
>>      switch (d_config->b_info.arch_arm.gic_version) {
>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
>> index bd4b8721ff19..129c00ce929c 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -723,7 +723,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
>>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>                                 ("vuart", libxl_vuart_type),
>>                                 ("sve_vl", libxl_sve_type),
>> -                               ("nr_spis", uint32),
>> +                               ("nr_spis", uint32, {'init_val': 'UINT32_MAX'}),
>>                                ])),
>>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>                                ])),
> 
> Doesn't this regenerate the golang bindings?
FYI, it does not. The bindings are already there for NrSpis and default value is
does not result in a change (for verification I checked max_grant_frames that
uses LIBXL_MAX_GRANT_DEFAULT).

~Michal


