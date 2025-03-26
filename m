Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0483DA716B9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 13:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927749.1330475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txPv0-0006Ad-Br; Wed, 26 Mar 2025 12:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927749.1330475; Wed, 26 Mar 2025 12:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txPv0-00067n-8q; Wed, 26 Mar 2025 12:31:38 +0000
Received: by outflank-mailman (input) for mailman id 927749;
 Wed, 26 Mar 2025 12:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+/s=WN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1txPuy-00067h-Vg
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 12:31:37 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2406::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e7e88dd-0a3e-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 13:31:31 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH2PR12MB4328.namprd12.prod.outlook.com (2603:10b6:610:a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 12:31:27 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 12:31:27 +0000
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
X-Inumbo-ID: 3e7e88dd-0a3e-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMxlLQtIz3eVP+lESzISuwUf+daBUnY6w9fJF236vBo9+7rahVZPFULRfiZCdle2gsxgOwGO3Lh26wy5uwZRS3rwXyDZ5uH6tLWYNHI4eES65gHnINtAL9Ge7/9O8HH3dO20KoLP06ema0oue4QFxN9k772KndYPojxPlTNnPyfmdvzjFWSA4ahSo+Go5vpKc7MnzBYxqBPKg4brEmgvzUWmNGI0YgrQFmxNl8XkMMUiEGZ3pcdZ1lX9brl2ngoDyS+r2F0VRYtJvEaxHMRtA+lGWMjLW1FmVlY7dDoV6z0CFbsAnx5wa6Vof8EqoWg6ZofWLw5DNzUxEPqhix4K5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfL8jnVKx5+vsYAZViNXjAxCFHt8eI7qo0pMEXpVYow=;
 b=uEFrKg5RpU4xNkeFSFhbHfbepqFv7tKXO8AnRjpGxkQN0L8wWu8NxkDyh/ku2SwknT3hcUoHQRDocwy4GR7EcVlGakDrTArALj2PksSyODb+nZ9pp6d7ZzfZqX1X+u0248Zn7zQSi4NUAQs2MGfvV4YKYlaL1+RimpuQZ1vZ4OotXXtUOFORSbg2JItuL4DvrM3jVAMiE5zNvWHVhdLvodUyLxMKdZWwwCCuuhYCrBH/D5oyT3droitwXkpnbnne/MqKTlLgona8Xr92ZQiN+2JMp9HLFTXQPbMc+78WWQ7i282QddUCDghkrbwU9BQWUt2el3gY8csvq4lqwB3eJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfL8jnVKx5+vsYAZViNXjAxCFHt8eI7qo0pMEXpVYow=;
 b=UAnXGQ0o2ZfF+Uus8tahTxc+r/afS9M6T1FpsSCzdK8FwsO0uH9K+LRwAGJYZWIZho1qfW7coSnxUb5xoT3G7z4gEWOHw1JXi/yM6mPHRqjF2m8Xr7ud8Ym47JRLVJ0VznSFrWkdaZoG//x7kV/bTsmV/Sjpgrta+IlZMqx0Ojs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ac07651e-bf5b-4cf3-94f6-47c32cd1d24c@amd.com>
Date: Wed, 26 Mar 2025 13:31:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm/domctl: correct XEN_DOMCTL_vuart_op error return
 value
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <fa6d6ca6-d133-4a9e-9da4-42b0c0b50437@suse.com>
 <9e60173d-ec9b-4a76-8299-7d0e492f4407@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <9e60173d-ec9b-4a76-8299-7d0e492f4407@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH2PR12MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: aa259233-440a-4ccd-497a-08dd6c622118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlhSdkFFVTk0d2lLaFI3M1pLNnl5Znc1Y0N3OFFRWndhK3c4M3ZtdCsyLzkr?=
 =?utf-8?B?eThCbWJNQVdlSkNuRXVJWmdiaFZGN25ZOEhtbVNQbzRYUElKcWpPZHBIVkpU?=
 =?utf-8?B?RTFrMXdqN3Y4emFKc2RZMlR3RkNJNmROOWFZYTNsZzZhZW1aSkZ3ajZhY0hy?=
 =?utf-8?B?SW5yUVk5OFBmOTM4VDMwcU1VNE1tUVpqaytpdURlSkVWd2RKenF0aUFqaTlw?=
 =?utf-8?B?eGNJdmwrUURoeGh6dmM0T1FqU2dhdlFOeU1oWWl4cHpTNXRFVDh2d2Z6eldI?=
 =?utf-8?B?N2FldFR6ZWtKUFFlZmlBRWJLdk1PNk04NStmOFYwMEdmNzJOUXQ5UVZwa2ZC?=
 =?utf-8?B?WGFEVUtiY2xIN1h4U1p5eTlCNjgxRVhoSk44bWllOTBOS2orOUllVVR6ZVdB?=
 =?utf-8?B?R3NNaFpiSmN4OHhzaVhmV21tNTZVSG9xS0RHV05WNVFReWdQSmZaTlI5Q2Y4?=
 =?utf-8?B?TEkvYTVVWWhGR3hwcGlqKytRSnBaYXhuTnhJUGRxY0ZzM0xJUDJxallyWG9Z?=
 =?utf-8?B?Q25sMWsyMDJibm1sK1FOdUd4RjBzTGI2UVVMazdhb2ovZ0pMUngwWGtnbnht?=
 =?utf-8?B?VWF3N1NUUTVZRUFiKzAvYzl5b0h0dFZBVUtHMHUvc0FSaGNqRWl5UlArRmQ0?=
 =?utf-8?B?eDVkMk1oZUNzOHdIdUhuYUxlZng4aG9vVTIxYkNMZEU4N3Z6dWZuUmJidDlu?=
 =?utf-8?B?c24yY1BaWGEwSXB5ays1RGk5UjdleUNxZWZRRE1HQVQ2RWFSL1ViTjNOOG9i?=
 =?utf-8?B?cGd1eTRNZklMWWVtT3NaalFBTEM0UDlWVDNaQjFJMHB4bjFSS2ptMVFwUmpN?=
 =?utf-8?B?Q3FPazJqd1NhZG13Ym12M2wvQVdnMDNYMzZvT2czZU9JL1ZLZ0hDRzFGc0JP?=
 =?utf-8?B?djFwVHkwRDUwc2FzL2liKzhSR2VXQ0ZhaDlVaW8rVTE5Uk9yaHJrckkzVW9n?=
 =?utf-8?B?eUpuZTlMNmRoc3FkU2VBZ1Uwa0VTZmdxT0F5TGpYVFUycENOWExaSVNlc1g4?=
 =?utf-8?B?NklscHkxcllvRncyNVdERXI0NmlxRjFZMk82aGxPUEJTVXhaV2s0U2dkY211?=
 =?utf-8?B?WWp2emZxaEVVNjlkYWlSN2ZZb3Rub1NUencrR0RTOE12Snpjd29iRHZyTmxF?=
 =?utf-8?B?VVRsMmNLVHRySm5hSUo2cHA1MzllQmYydUZvalI0djdqQmUzSVNsVStxTERF?=
 =?utf-8?B?d2xSMS8xc1dBR2NkRmlySWVrU0h6RGFZdWdFdVlIMUUyZzNMSkR4OHpkR0c0?=
 =?utf-8?B?OFJTTloxSUFVa1FKNGM3QTNVS2xCM25rZzJtelgxMjVqQTdPY01Ia3VQbzNN?=
 =?utf-8?B?RCtDb09GNmRldzFLMDlpQW50S3ZUK0NQVDFra3ZtS25LN0ZFek12Z29vM0ZS?=
 =?utf-8?B?T2hSYzFkNXkvT2ZIVzQ5VWIzZXRhMVNvSDFGVTFJQksvKys2dVNiZFdOQ1RX?=
 =?utf-8?B?Q2N1b2EvVGd1QmgyUEhzb1BVblZGSkgvemhYMVdVZjhONkdKS0dud0l0bXg4?=
 =?utf-8?B?UXpLVmhvcjRIeUNRMkU4L0k1dXZQOHBZbElGZ0ZLMXVXVWcrYVZtWm1DcWdu?=
 =?utf-8?B?RTFReCttY1JVZ2Z4eVowUFVZRlhKNUllVStMN3ZGSHZmM3hzVHEra2VPaHFz?=
 =?utf-8?B?WFJVOFF1aTkzZmxFSGFHamNsRDdPUjF2YlkrbDBLSk1Iamk1NTdvN0ZpT3dx?=
 =?utf-8?B?TjNjbkRqQ2VLQUY5WVVDS0V1SEYzd2pjanN1VkNKY1p1b1dFMU1vR1NGVS9X?=
 =?utf-8?B?VUpNRXpGV2V0SEJmOXlUdWJpWUN5T0dJZktlRTBVMlVBdnkvcUFyQjVDTlpP?=
 =?utf-8?B?Zytad3AwMlo1SHJGbTJZeS9YQUJiZjc0N1M1K0FXZGdiMUtYcndRVkxiZXor?=
 =?utf-8?Q?EK5L3JbFUBso5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3BhdEJQQVdvR2ZqMTkwS3lZOVh2ZkU2ekNjRmR3c1h2MDF1NGY1WVJsWXBX?=
 =?utf-8?B?RndCSVRJYmlFdjIySGxYY3FEMTlCUWRFd3NhZlpTa0FwOFE1enFTWDZFWnVo?=
 =?utf-8?B?elY1MzRvNXV2L3lIZlhXbWkwR3VBdmdVUmRscmV1SVpRSEgvR1VtNmdBNTVh?=
 =?utf-8?B?cXphVFkzQm9kQzE3VGpzZTc3NzIwSzZ3V21mUEJZZVM0L0dRaXFVTmNLY2Ez?=
 =?utf-8?B?QnpjaEx4NGZ5cG0zck53bmlkcURxVVJSMU1GM3NwcmVtQmRYU3daYzVxN1hr?=
 =?utf-8?B?SVRNOU8zRWdIZk8wcmZzNjZhblRnVGI5WWcyQ3RVakN1SStEekF5ZGhaSW5o?=
 =?utf-8?B?aWwyVU1wT0F2NE93dSt2QkZFR1VGaU13V0k0dUgyYThEM3NyaTJqalRrdFhH?=
 =?utf-8?B?MDdabDFTaUt5aXhucFBPVmtYZGFVRndGQ3RBQWY3REFuQ1Z0SU5jbmc3VXdE?=
 =?utf-8?B?ZVZMd3lqQlpDdXdMZ0pFak4yTzkxRDdnSTNqRFpUUW9tcnVuZjZUbkJKWUYw?=
 =?utf-8?B?MmFzZTlIMUR4MFQydkY1bzI0VGkrb2Rwa2srTWFvV2J6bmQ5YUZiZWl5T1lH?=
 =?utf-8?B?dVBMQXRDaXJ5RDEwZ1E1M3JuNkQ2SFRwb1llU29SNmxkZUlqQnFGT1hCeDE2?=
 =?utf-8?B?OFRuaVJVWnF5Z3dXYzZESXdpRmp1NXRBZlRIV040WDZVRjBJMjBubWMrZkdP?=
 =?utf-8?B?UCtRaTFZL3A4bHhqWkNQZjlWR1pEZlc2ZUVyMllsM0t0Qk1MTmdLbytjZGVa?=
 =?utf-8?B?NmxwUHlhdVhiS09Yd1hPQlRUdkdHR2VsMFZFejRsL0RmMnJ2ZnRWNWlFVlBT?=
 =?utf-8?B?U2cxUTNHUVljMjdjd01BYloxU25UUFZUdVRuQ1kzdVc4dDNKNCtSSlRCcTJs?=
 =?utf-8?B?WjlETTVjQ3JCZktjSHVDYmR0QlZzbU1SZ0xQZEkyR3pDQTVJNks4TC9jeFpt?=
 =?utf-8?B?a1IxZ3dPQlUyQ1p4RjZHOVQ5YVVCUXNLV0NoQ0dGc2JDRFRFT1BTSlU0QU5h?=
 =?utf-8?B?bjJLc04wVy9mRUxra1ovcmV5UVdqRG8rQ1p0bmZuU2JJNDAvMFlwdy9qZlRI?=
 =?utf-8?B?OE9nbHBoQ1ZOTEtYUitidnpYcGZvSEN3OWdwejVEUUl5QlBobHpBd1cwMFUv?=
 =?utf-8?B?WFJNMEZwSWlLaHRZc29CMjZlZFd4SHBYVVc2V1pOTlZseHVCREJpWFozVDM2?=
 =?utf-8?B?d1c5M1JEZEsrK3pyNlVnZXUzOEFuV2Y4aDd0VlJRSVJma1hQTmFMMUdQcmxB?=
 =?utf-8?B?VVdYbWJCRk5OTGYraXc5Z0hzSnpRMjVETUlwQ0E4ZGtRR1BJMWNiT3RaMkVI?=
 =?utf-8?B?ejNSSzFORVh2MVR6TGtLSW1iREZJMElMQlpVVjM5S2VPVGNZU29nTnRPOTU1?=
 =?utf-8?B?SHFxdTMvT096RHVCM01CRWQrb3czcnBkcHNxK3Q4ekhrUWJIQlllMFFRSVJu?=
 =?utf-8?B?SThtd2JJMDBUc1RYVmlIelg1Q0daR1dZKzZpWFFaUlR2aEFhQk1ydTkyUHZk?=
 =?utf-8?B?bzgxOTRoYUVjVUVONERRSDF1bGRtamxYaEJwa0dwM3BxQWNjaEtNWi9Delhy?=
 =?utf-8?B?WlBlZzAyc0ZEVnBORlNTYk9RUkx2U3JKMCt0Umhaejg5SmZrc1JvckJlZVR4?=
 =?utf-8?B?RDE4ZUNaS3YvL2R0VHNKWlB0UHpKYzlrQzBueDlob2lHd2JFenFrVXlHL0hK?=
 =?utf-8?B?L2lnUmtuRVFYZ3d1WDAvdWxHTllNNUxVZXhIN2RiRTNHeHdvR1hsMUFhb1Jm?=
 =?utf-8?B?WE1XR3ZPTjdXR3NqZmc4ZUUvTWdPUWRUd0Z3Wno2T3ZjbUZDZTJhZ1EvUk5D?=
 =?utf-8?B?ckx3Y0VETEl2aDR5Ry9VRzcwbEU1ckdwaFg4ZUhoUm9jMFkyYUlZeDZiTlBr?=
 =?utf-8?B?MFl6NlFsMlpBRnlDVDZKaW93S1JSTU9kSmdzMHkvOTA4TjdCM0NYMEdXbW9m?=
 =?utf-8?B?bDYrdmRRUktxTHpQWWxnbSthb0Y2VmowMC91ZUJmS1htUVRIRDkxRGEydHdp?=
 =?utf-8?B?S3I0azZMYWxCZjBJSVBpUEJ4Z25Dd0RaUVh5VC9YcmxaeW9GZFQ2Y1Fnendm?=
 =?utf-8?B?TzRwUnpXNEo3QjVnbkZ1VHJWQ25mdC9VZy9sbjE4cllyL2VkWUdPVys5UjZ1?=
 =?utf-8?Q?nzAulJ9Er/mfRARAzquLKg/Qb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa259233-440a-4ccd-497a-08dd6c622118
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 12:31:27.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKN890fkhkd9HrKtCXu4lrSxCxe+Rpno0A2I1A/aL2MUbmL8FVvX+55Zq2GQGGsA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4328



On 26/03/2025 12:41, Andrew Cooper wrote:
> 
> 
> On 26/03/2025 11:39 am, Jan Beulich wrote:
>> copy_to_guest() returns the number of bytes not copied; that's not what
>> the function should return to its caller though. Convert to returning
>> -EFAULT instead.
>>
>> Fixes: 86039f2e8c20 ("xen/arm: vpl011: Add a new domctl API to initialize vpl011")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


