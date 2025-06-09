Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997FAD1A7A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 11:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010188.1388344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYls-0001W9-ER; Mon, 09 Jun 2025 09:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010188.1388344; Mon, 09 Jun 2025 09:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYls-0001Tg-Bd; Mon, 09 Jun 2025 09:26:24 +0000
Received: by outflank-mailman (input) for mailman id 1010188;
 Mon, 09 Jun 2025 09:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Wg0=YY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uOYlq-0001Ta-Sl
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 09:26:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:200a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca77354c-4513-11f0-a304-13f23c93f187;
 Mon, 09 Jun 2025 11:26:16 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB7348.namprd12.prod.outlook.com (2603:10b6:806:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.42; Mon, 9 Jun
 2025 09:26:12 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Mon, 9 Jun 2025
 09:26:12 +0000
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
X-Inumbo-ID: ca77354c-4513-11f0-a304-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itZGYKydCxLsj91fsdbpDTaVnfvz2s3kAKFfcrg7ziNeq2xa8SQLrcveWNshroGKHNO3q3BrdVR8GTE37ql/Y+nz3KzyQd308i8uyMjCh6OUJprUKYuETklP/U5hiNH9YGsPciUX/4htoIDV6P03xgFzrJj3kwscVItqb/FumAKGgP4KMvWOphDuMpzsrt8bQUxxK2mnP9eCQYOvP4jrcHPQakp/HLZJZCJDzqwnrYvy/27J31I5hM1WLsl4PK/PPgc4Kmi2dU4WMKq0KkfQp1h0A7Lxkle09Eq1d/phStxiRMYYb3LtsoMzEflF2Pxrq55yEusghMKrZ92sKoGegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV9V3ctW159g3ohB/uFFvqGu9vNhT1RlXvnJwzbTsho=;
 b=EIPSVLOxaGpriUplQHQBAnTRZQm/60pw2+NQp3SxqgGZz8CTtEzWOs/i7AqA+w/6BxdeVYr4bKT+JoodYTI7cpk543cnX2fO4jUHE9VChsUThcjYQHzBj+4nv8/9M/bummW0xQrigj4Tkt3aX/66NDNopJfTWqhk8Bd4ZkAOjTnZ5qCpAw3tbtmLbiSVk9LVsaRrZsbEG9doHHxzeihAsfXX/C3b+k4lyCpLo/xddu+TWGuBG3x2Djn7ARy1riqzs+9WB74vjr59zYQsvvhhyTUhikYk7qIuaPg7mWRiKSwp+M57G7w5Ak5ioSsN+kn+Vt5MFzPI0o8O28vZa+O1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV9V3ctW159g3ohB/uFFvqGu9vNhT1RlXvnJwzbTsho=;
 b=fRNTD3pJSOldhLNy8JrTbWomPTpOCzrJ53JwF/tiNnzHudVUBuAYVa/Gt7xSkcGL8Vso2GxLfvAnVdcdtnVx2QB1kQ3CInpH1FtZ4WIjmuwdLJitAYWii/bBL6Qv6WpeQ3VM6nqsdDiBHvbluyeAwY30CuAzVdRwfCdf6ROSw0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <56199c5f-77f8-4861-a09f-610dbcca8e7f@amd.com>
Date: Mon, 9 Jun 2025 10:26:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm/mpu: Provide access to the MPU region from the
 C code
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-4-ayan.kumar.halder@amd.com>
 <CD168290-30D8-4EF1-8F89-95EE597E6C54@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <CD168290-30D8-4EF1-8F89-95EE597E6C54@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: a8566431-0e27-4815-b4cf-08dda737ace4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzdYenlBQmNHTmhyUURzTlBydUhvRE9zR01wb3dDWW1LL2U0MWNaUnl0LzF3?=
 =?utf-8?B?NHYvR3NaOU5IeWVEbkZwcmZBK2NWbTBwSi96Vis3R2VCcVcxdE5KN2c5SVIz?=
 =?utf-8?B?RlA1UHpHVkF4VnZpSVJaT21BdXBXbmFGRU1OZm5hZUd5bTdLbEFUUU1XQmNX?=
 =?utf-8?B?WkFoZkx3T0NVckxhZmx5SEtBa2FsMGxNRjJsbCt1THg4WEp5ZGhtWVNRVWR2?=
 =?utf-8?B?YU1qYTRTbWREK3RmVlFkOHdTV2dlSjgyejZ5cDBONjJ0T3E0Z3FGSHFDUTI3?=
 =?utf-8?B?SUxyRkQ1dmMrcERXS240TnI1M2ZwS0hpV1p2ZDJmaXVQN05Zc1dLck45UXNh?=
 =?utf-8?B?VTBSKzlxbi90bjBYVXNEWHVEREJ2RnpNcm9vb05IejRXazg5ZlF6NEZYQ0Zr?=
 =?utf-8?B?bVR1Vmw2MFp2L1FWNUxaVUI4ZWtnY3ZwSTNhTzZubUNMcENOYnVQa0l1SnUz?=
 =?utf-8?B?ZDFFVU0yQStDUXp3anU3WVJJY3pBRlp6Sjl0QlNpTmZsS0JiUnhYOUNkaFJT?=
 =?utf-8?B?M21vRUhQWkhFcVVWZEpIR3FtQzRKL3ZCeHVuTGJPcTRCSHhXS2FKRURjZWRM?=
 =?utf-8?B?aG56OUdlcThzZ1BUOU1oZ1d3TXMrZmRNVHNLREJRcEtjNjZGMGRmcmRjY0tl?=
 =?utf-8?B?bDMxQkR5cTIwWmwydVdueWlKaWJyYUFBc2k5TjVoODNTTFBrRXIraDdBYnNx?=
 =?utf-8?B?a3lpZnNuNGFQWkQrRGVwTHhhWGo3Z3A3UUZoR0Z0ellxMlNVRmo1VklTTjRa?=
 =?utf-8?B?RHpWYkJhT0pqNDVyNE03WG9NYnpLdzdYWDVkQUkvWUdieHJKWHMzMzVZQzIv?=
 =?utf-8?B?emVRUHZvR3NrNlN2WEI5SDNNRk9CbTRZZVJTTVNRYTZDVjJWMTJmUjlGelhX?=
 =?utf-8?B?V1dQRndUK05vbEREamQxV1hWbDBlRFVIYmFOSUZnRzZUYjY2dC9zM3pDenFj?=
 =?utf-8?B?S3JyNkV1eElQLzVoMUFybURBelFKYzJSemsycnFTdGVWZkRUZlJhczEwUldB?=
 =?utf-8?B?VE0vanZWdHRmOGFnYlNxWkNTNXRVSWxvekgzbFNPUmYxUTdRa3R0akpta1VM?=
 =?utf-8?B?MHJySFlIcVZtbDdRZmwvOStDRUkvUmtXczBncnNKUzM1cTNlbThrcjVXUE5Y?=
 =?utf-8?B?eld6YVpXQVBKTUJCclExM0VrUGNVak5PdVJYR1Fvamh1U1ZpQVZueFpkWFhG?=
 =?utf-8?B?NFZTUEo2cyszc2RTN2pxeXNUTWxRazBqYnE3b1c4NnN0d29kR0RsN2x1Rkhy?=
 =?utf-8?B?UkxXcjIwN1hMMzEzYXJmS29SOGtVbVFhSmNoeDJWZVlyY3ZCY1ZVbWNXRW1V?=
 =?utf-8?B?Q00wajIxRWJ4NDZwbUFhK2JSUjE4VldBMi9yTXR6QWR3YWI2czgza2pmaTV3?=
 =?utf-8?B?OVZhZm5QQXZyMG1vNUF1dHEvSG5xNmhNUVBWdnFKNlJROW5aRnc2eUJtMWtO?=
 =?utf-8?B?bm50amFsZHUwUnNNSE5lUVVmNUlRTXorR1o3QUIzTFRpNThKZlVQTFFTa1Vl?=
 =?utf-8?B?QUh5Y045UVVidGpzcWxTV0o0S0lpN04zcy9sZEhpWHBRWnJyUUlUS2dqOWdr?=
 =?utf-8?B?dVdNSjBUc1BIRFNCSGtSZGJLeHBZaFhMT1ArYnZ4YTc3R1Z0VFJEejQrdERz?=
 =?utf-8?B?WkdFcUZSeHFKUk10dlJJcnJPaVoxQ1IxVmIrejZDRlZIdk5pMzhtZ0Y0dkVE?=
 =?utf-8?B?djRZaVA5WDBIOEhGR05Wd2s5V0R4M1prOTF4VUN2VzJCNnNMY21TanNOdmJW?=
 =?utf-8?B?OGpZeEZhdFlkL2Qxa0Z4R0UraEl0NlRVSkNkbk9UK2M3YkJWWXpNYk50Y1Va?=
 =?utf-8?B?UFEwaElIMGJNL2s0VG5rRDI4SFJ4aW9US2NWUE5PSys3L093R2tKbGRqb3Fi?=
 =?utf-8?B?Tmk3TWVuM2MxUWJ4VkJLMXBKNUdSM2M4Yi9DMlRoNG5nbjQ3ZnBZNEZlOWN4?=
 =?utf-8?Q?kfp6QLcUdN0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0p2R3E4d3VQOW9UcTVXOXNDWUZqMzg4OVBNOFEzaDVqYkpmS1djM3M2YXps?=
 =?utf-8?B?RTU4UVRaUys0ajFmaEd0YlBvcG5kZktrQmEzZkc2RHF4NjhvckxkN0tSb1Bt?=
 =?utf-8?B?YStvU0lrT0tpcngrNldoMFB1czA5Q2l1c1ljU0hMNmswWkMzQ3I5c2UrK1Vx?=
 =?utf-8?B?aVNOYlV0RFlINUYrd2syUjU3bm5RN01ZZVlXMWRzYzBETWhkQWVpZ20zQkwy?=
 =?utf-8?B?K3BPaGcycThJNERPSm4ydzExcFlPSFlUU2pMdUNVRVJTTGd4R0RUbGI3NDRt?=
 =?utf-8?B?RWJhdm1zamtrY1QvbDgzV1BoUmhXUnJ2Z09TKy9GY040czIxVjF1UVpDS0Nu?=
 =?utf-8?B?UFh4NStGdEw0MjBWZ0p0Q1JwVFVhdlcyd0RzWEFib0t5UHpMc0VJZzJ0dFl1?=
 =?utf-8?B?aFFJVlhEMGVHTkttSU1IU3R3cXNqSWpqV0twdnlsVHlrNFI0dVJqcnFveEN0?=
 =?utf-8?B?ZUROQ3VZS2JxRmhNRFlnSnkxald6N01LUEVRZXp1cUE5RTJUd2docjhrODJW?=
 =?utf-8?B?V2pFVEgzSWIvdW4rM3ZqSGI5Vy9sUHpjbXNFOG53VUZpVDBNbEpHcG51eDlq?=
 =?utf-8?B?M3Y3cFV6N3FseFJLUTFOVGNpRmhNeXVRR3cxUWZhL0s0clMrdnBiaTE4dDlu?=
 =?utf-8?B?eGFqVnVDT1owMFU3cStoNHAyL3Y3WFRzc2MvR3NQNVRxaGVyZ2tFTzJteGF2?=
 =?utf-8?B?QzA0U1hsR01ORHRRVFVaQ0tkcEl0dDAvZjJvbHlIYXI3dzhZUmU5MGdIdWVW?=
 =?utf-8?B?cHpNYjFNbTFsek4vZUdDWSthZ25wenB1ZFNIWEl0ZTdkMlBhNzlCYThiZmdm?=
 =?utf-8?B?Uk00bnJ1dE1HbE8yMEV5clhQZ0lZd2RPaFhPRlJlUmdkczFySlJJUWJsTW9I?=
 =?utf-8?B?aFoxdUNqTzVNUFY0emthOG01WHg5dVVuSHhFY3hJN3JrZUVib3lZQXlZT0dl?=
 =?utf-8?B?V3l1SUJ6ODdudFdQajNDWHN0V2hsK0dDQkVsb25FTTBXSzZPU00vbktUbk1C?=
 =?utf-8?B?bE9yV1pMMWc2U29ocEZKODY5K2YrNUtuY3JDNFJScDFxaEN1emRCRDBhcUlT?=
 =?utf-8?B?Z3hTUFpoWjQwSG16V2xJNUJLQVU0b3VIZno1WE16WFR1bGI3MXd0UmhramJp?=
 =?utf-8?B?Y2UrWUNXZGtKek5TMS9qMWwvZjlkSVJEa0lEdllxQ25IVlQ5VGdHQm1WRFdm?=
 =?utf-8?B?NmJDeEFWUkh3VERqRTdSRHF3TXVTd1JFQW1RY0FQS1JLRE9xM0hZYWE1dE40?=
 =?utf-8?B?dXVua09NdTAzL3FMN3pSVWxxOXZ5b1BEY1pkdmtYbXkxeUdJQkF3bUZOdGl5?=
 =?utf-8?B?dWFqVTF0cTNqY2JwWURIdk1LVEtkNC9wRHdQME56TUJPQ3pMenVyUXRHWnor?=
 =?utf-8?B?YzJObzAyNmYvaFg0N0doeDNmUHZsWW80cVlSM3JiMjRwZUVvSHFJTDJLQkFX?=
 =?utf-8?B?MjdEVW1pb2x0VmVIT3Fta0tLakMvemtqaGVsckN0S0IzazNBZDVtdU9sMTJi?=
 =?utf-8?B?bWRwOG1ibVYyNHlaZ0xTUit2ZEtyUmxBVGdlTU4rZGp5M2g4VjVpeGRQekhN?=
 =?utf-8?B?TlpqZVRTOEtuVjhsM0pXZ2FXNUkzR3RpT2JWS0ZmS1J5YkkyaFpoUVI5ZG1p?=
 =?utf-8?B?eU5KU3RIeE14VFFCeHA3ckNYb3hRbVYybUMyMzYwMkxNT0trRTMwcWdwcHJI?=
 =?utf-8?B?R0VKc3dBanNYd2lvQS92NVhLbk9GampTS3VBQ1o0SU5wVmpTQys0dXorNmdh?=
 =?utf-8?B?Z3R5YjU1dUFkSkc5aDZMZHpoVUxvd2VFWHl3alIrTUpsbDVKcUlMcTNJOHZE?=
 =?utf-8?B?Q2RlMEJpdGM5Vm90TGFSbUhsVDFKbEtxY1BXOGQxdmFtZXgxcUIycSt2T1FJ?=
 =?utf-8?B?ZFR0VVN4TjlqTmp1aS9ocXdFWWVkWTN0bUpKR1VCZ0NraDNGV2txQWJ6akdi?=
 =?utf-8?B?UDNGREorLzdSMXh0YnNZVk5OWllJaXFGTVJwK3hWcDRudlB0UFJTb1I0SkFw?=
 =?utf-8?B?WkJpa1U3UXk2b3JmR1h4S09iSGtxRnJENzBGTU94ajdINzNsTGJrSEt6ZlN5?=
 =?utf-8?B?SXcwdituemdsMjRlVEVCMmc5aXlXbGp5bVpnK2UyU04xeFFKZ0c3NmNhamhU?=
 =?utf-8?Q?9zAz4bgtXSfKn/zCD3YKoc3L/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8566431-0e27-4815-b4cf-08dda737ace4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:26:12.4816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lp++kSBTSOU3gptNaNtffilRonpLA7yAMsdY/DECf7vkgA0Bzii9yvrI4G3rl/Mo0l6obPR28jP+EIkD2Ehwtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7348


On 09/06/2025 09:37, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
> If I understand correctly Armv8-R AArch32 supports up to 255 regions, so I would expect ...
>
>> /*
>>   * Armv8-R supports direct access and indirect access to the MPU regions through
>>   * registers:
>> @@ -85,6 +87,7 @@ static void __init __maybe_unused build_assertions(void)
>>   */
>> static void prepare_selector(uint8_t *sel)
>> {
>> +#ifdef CONFIG_ARM_64
>>      uint8_t cur_sel = *sel;
>>
>>      /*
>> @@ -98,7 +101,8 @@ static void prepare_selector(uint8_t *sel)
>>          WRITE_SYSREG(cur_sel, PRSELR_EL2);
>>          isb();
>>      }
>> -    *sel &= 0xFU;
>> +    *sel = *sel & 0xFU;
>> +#endif
> something here to check if the selector is 0-31 or not and:
>
> - set the selector to 0 if set is 0-31
> - set the selector to 32-255 if sel > 32

yes, good catch. I was initially thinking of supporting only the first 
32 regions for arm32. So, it would BUG() for region numbered 32 onwards.

I can expand the patch to support all the 255 regions.

>
> And ...
>
>
>> }
>>
>> void read_protection_region(pr_t *pr_read, uint8_t sel)
>> @@ -123,6 +127,24 @@ void read_protection_region(pr_t *pr_read, uint8_t sel)
>>          GENERATE_READ_PR_REG_CASE(13, pr_read);
>>          GENERATE_READ_PR_REG_CASE(14, pr_read);
>>          GENERATE_READ_PR_REG_CASE(15, pr_read);
>> +#ifdef CONFIG_ARM_32
>> +        GENERATE_READ_PR_REG_CASE(16, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(17, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(18, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(19, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(20, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(21, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(22, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(23, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(24, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(25, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(26, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(27, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(28, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(29, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(30, pr_read);
>> +        GENERATE_READ_PR_REG_CASE(31, pr_read);
>> +#endif
>>      default:
> have something here for Arm32 to access the regions 32-255
>
>
>>          BUG(); /* Can't happen */
>>          break;
>> @@ -151,6 +173,24 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
>>          GENERATE_WRITE_PR_REG_CASE(13, pr_write);
>>          GENERATE_WRITE_PR_REG_CASE(14, pr_write);
>>          GENERATE_WRITE_PR_REG_CASE(15, pr_write);
>> +#ifdef CONFIG_ARM_32
>> +        GENERATE_WRITE_PR_REG_CASE(16, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(17, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(18, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(19, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(20, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(21, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(22, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(23, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(24, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(25, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(26, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(27, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(28, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(29, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(30, pr_write);
>> +        GENERATE_WRITE_PR_REG_CASE(31, pr_write);
>> +#endif
>>      default:
> also here have something for Arm32 to access the regions 32-255
>
>>          BUG(); /* Can't happen */
>>          break;
>
> Please let me know your thoughts.

Ack

- Ayan

>
> Cheers,
> Luca
>
>

