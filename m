Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED253951AEC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 14:34:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777121.1187312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDCi-0003ni-8f; Wed, 14 Aug 2024 12:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777121.1187312; Wed, 14 Aug 2024 12:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seDCi-0003ks-5z; Wed, 14 Aug 2024 12:34:16 +0000
Received: by outflank-mailman (input) for mailman id 777121;
 Wed, 14 Aug 2024 12:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hw+B=PN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1seDCg-0003kS-Jn
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 12:34:14 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2412::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81ace692-5a39-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 14:34:12 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 12:34:04 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 12:34:04 +0000
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
X-Inumbo-ID: 81ace692-5a39-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG/F8oEy17Y6uSk0Oy/6tOwr/k8EC0d6zP364o4j+SRrzuESOczn4ttbOZgrjHEIDHe7ZbtYuZ/yOQkHZh4815RcZVxC8Hk9DUk+ggfn68n1zthlPhsrulw5+BOL21lGkh83WuioeZxgM4cnhciWUsZHaUAo4P4XgibHW80ouhQmPOFLpda1AKOGlPuFiiFdXwuWfo6IJ6PZEalkiSAMOmVygZCx/94ixhBBaubwxl7uzItNnxp/ZCiIBE/aIOBdcoSwEN2iiL/NIIbrooDza+ej+zZnTvQdHZiauiLHLbOLFgxceV0W5tcRZvin/y74n0pOtRYhhQJ+TK5/XGTl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5snA7ZoC6kSUKdod4jCSgSuYwWX4lWrMbduH3a0BNQ=;
 b=cY2zO5pX/pKeSB9YXMZMA+M06Wikc+dad5xOGnn1BZmYpRujrEewqNxSLJOv785eZeF+5PDNUkOdl68Vx6uB8i2yb70Rilb7I7vIP1jgMGEuKsx3UBDBZDG3UCCvAG54/zEWITTdHKRaMHYkEErCzJxnPL3vw+GF5PDdomqc8AuGBSYDVTg/PQb1we7vf8kGFCIqZFseRHBWTpLFGZzZU2oJBCxSQRLEB4KWEfipcdm75wkRwx+qoPOv6JH0owACZU2k/5ZldFGo2Ave+s7D0ATXtOagDiTWVSUpa+WVmumB5Vwl8tBdwRVGVAz9EjB4c2BsKoktv9MRGMaU/7rT2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5snA7ZoC6kSUKdod4jCSgSuYwWX4lWrMbduH3a0BNQ=;
 b=iDG1QQ6fvtxuUddUs8J+v+qKNWpkasvUMmHgaH0QVoRFB8Aq9h/12WmpSkng/iLT+p/sOd+RZaD4TzO98dWQebl4fwV+wFmbX843s/l3pW6RnsmHSoTfA/mQ9Omh9ue64jy7bTeFj2PqzNYRABi/rvb0R6MwZMg9aVW6h+xtbJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
Date: Wed, 14 Aug 2024 13:33:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b8d334-7a7e-4780-05bd-08dcbc5d61d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dENhMXYvT0hhSFN1dStVNkxudHhUQmNhTVY4TjFac1V3L3lOMXdPRVMxVkV2?=
 =?utf-8?B?ZEFXUUVWVGlLRHZBQk8xdk94eVZLSHZ0VVN1VFB5b3hSU3lEaDk5WTJGVzZF?=
 =?utf-8?B?eldXdFlYSjE4L3pjbmpudTE2WCtVbUVYQkdKYXlWOGY0YzZIcEZZa2dTMWZI?=
 =?utf-8?B?M0hSQzRXcXkreldoTnVPZU9vb3l4ek9vWHVDb1kvbFBVZFJuNG9iZXpJRlhW?=
 =?utf-8?B?ODdRcHhEVEg1L1JHT1h1cVVwY2JqWDVMaGxTMWs2RzV3c0Z2YklISWlrcXBC?=
 =?utf-8?B?WG5GLzVxVllrVUxYR2hqL2hnN2NESTJWSW9EMUxqdUR0bDNJZ1dVeFFnRVlY?=
 =?utf-8?B?YkhRa3FIb3VFNTJOU2pCWU9Zd2lwUlhYZXRDenBqT0ZQdUhMaGZwR21Pakp1?=
 =?utf-8?B?L2pydFg2Vmh0YmFydENvZHVyTTR0eVBJVmxXYUVzMFlFeWtESmVQZ0ozN05j?=
 =?utf-8?B?emgxZ1drNlVVczNqMlloZTJQVU11Mm4yVzI4V0hnTlhQdUNtbzVqVjNtS2Na?=
 =?utf-8?B?cDE0dzVCSmVoR2x0ZEpzSlhXL2ZOWUhSbnNpZGtQWVkzdE1ud2xGQ0pBampm?=
 =?utf-8?B?T0NWOVdpLzlqYXI3Q0hYbTJseFBZZGYzOXNlRlBGZHRyRnRPcytlN3pPYk1J?=
 =?utf-8?B?L1Y3b1hzNFVWWTJ1QVoxMzFXTXRoVGtWUzlXUlNlMFoyQU1JV0hxR3NRV2lk?=
 =?utf-8?B?bDdYS0wwb29NRXllT3hZbUdwLzBYRTVQNEVXZlU0eW9mc2xkbDcxRE1rbEE4?=
 =?utf-8?B?Q2RBbVNLYngxdkdQUG44WUZHYmV0VXMzUzlxemFJWTE1SjVSL0o1d2pNM1RT?=
 =?utf-8?B?OVlrSm5mc0FGTXNkdGF4Ymt1U0ErdUJ5MEVMeU5RWVh3VnN3dGJGMm5vVFI1?=
 =?utf-8?B?SHEza3RHdHBiY2ZweGp4ZVhiL0lUOVUyMHRRaFJtNHYyTTVlWjYwRnRxclZB?=
 =?utf-8?B?SlNTR2xqYitQdlpaWk1yWlhQSFJvT282aFZCMW5FcldvUmwvdnVaU090SExu?=
 =?utf-8?B?RUl6RC9kQy9LUnJNWFU1UzhoOWgvODFDeVB0MENURGw0bjMxMDVBaGk3Q2pp?=
 =?utf-8?B?Z1QwQ3BzSmR0RGhULzkzM29uSGNPeDJJL2p6U0dNa2V5VER2TTVYQjlnMTE0?=
 =?utf-8?B?QlljMDdIRUxUUVJ4RTVwTGNXb3k3WituOVEva29vT2dDaitDL0Eyb2diVC9X?=
 =?utf-8?B?NXlGT1dERVNwaDNlZUxyblo2dVVEQzdaUmdvTjBFaFZ6L05qSUNmZGplbitG?=
 =?utf-8?B?cUlibllWK1owQTZTL0ZLUGJzejdoelh4MjRUN2ZBdkFtL2dGTmgxZC9BTWVB?=
 =?utf-8?B?eUwycVVwbjNXU1pIQkdUSU83alpoaGZsL3IwY1g3YkdWaFlkVmdXMHd5dDBR?=
 =?utf-8?B?bmQyUXJibjFrdUx2VkJRVWZyMmgyZXhqVXFkTTJzd3VpYVg3RVc4YlZyVVhX?=
 =?utf-8?B?U1VSKzJkU3p4aVl6My9YQVppMmtLVmZicXcyeFZxbnpIVHFIT1lZcndxYzY3?=
 =?utf-8?B?ZXI2MnNheTZFWXAveU5xZDJsdE0rbExIV0M2ZVd3NytxaTR2VlhLMTNKV2N0?=
 =?utf-8?B?SG5aOWlEYU5sd0xJMnFwMW1jVXY5ZThMVm1BR3VPRlhNNFo4UWlNQVIzMjZG?=
 =?utf-8?B?WmRINGlhSFhITVc1TTdtcitkaTZtSm5hcDFjaUFRTG9teE5UMGRpVUk4R3hX?=
 =?utf-8?B?dzMyV2FVU3VSRDhUeUxnSngyMGZjS3BnUEwxTXpDelpwOTBPUmZhWWtjVyt0?=
 =?utf-8?Q?oI1olLHgyYdmJka47c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDNBTGhNdGpIQytrOHhCT1RzR05yRDVsaG1RT3VkNXEwNmVTWTNRNUNoOFg2?=
 =?utf-8?B?ckZYWHgxUEhPaGxMNzVWTHhUZ3dweFdGSmdCSnpuWmx3MC82L2tKRTNIRUln?=
 =?utf-8?B?N0hjdWN1VG9vOUh6YWVjR1pYeGNHTXdCcHZlc2ZFM3dQNnBGSE9ob1JLR3Ux?=
 =?utf-8?B?WVYrWENOYkdkNSthejR2UEY1bFd2bzJDaXQ3UU9OSXMwSjhpS1VRMCszQ1dM?=
 =?utf-8?B?ZmJnZ1BIRXh5UG5ueGJCbkJIVUJUTFJCT2RiOFl0b2R3U0lFa3VySGQrUzQ4?=
 =?utf-8?B?UVBWY2IwNHBXaEFuRDlTemtsQXEzZ0l2dk45Ymp6VGkrWG5Oc2VmbzZlSVVG?=
 =?utf-8?B?dFl6NFh2M0Y5RWxSU3RUU3lDOVdITzNpZHJaQnowT1NvTkp0YUVJelQwdEJY?=
 =?utf-8?B?bEVNclgyWkcxSzRJRmQwK0Z1U3luS2tWcVZ1Z0UxUXRoWXl6RE95cUZGRXAz?=
 =?utf-8?B?MGgxLzUwclE5cUpDNXZyUkYxZXB5RDc4Z1dhcjh3ZjQxaGNlOURMK1dVbnF1?=
 =?utf-8?B?Z1I1L0Y1Um5YeWtmc09PZk5ldWI4enJiNjIrd204VVY3MEJ2OUtQcUhNNktn?=
 =?utf-8?B?R1NqTiszQ3BoSThIcXN6L1pPV3pmbzZRN3doaHpPT2U4ZENzcmptdHM2SjVC?=
 =?utf-8?B?a0o0SVZWcWhxQXFUV0hlNkVvUm4wd01nZlJQVHJWam1jTTMxUnZ3Z2hicVh3?=
 =?utf-8?B?b0hXcjdrQ3pZOVN5SE80WXg1NFN5YVdhN2phNHNvSWNzMmlwR0hSbUl4WjNG?=
 =?utf-8?B?NS96eEpIVUttV29RSUJjMkNndk1Oak8vVkFxdyt2eGx5MFZWOEhyeVd4TkF5?=
 =?utf-8?B?aXlzemdHSVV2cm5XekdRczlpRmNIS002Q29OK2l5QkpOVjZyR2ZpUnpFN3Vp?=
 =?utf-8?B?N1FONEdqTUFkQ3lKSHRJYzBnR3FUcDBpWlFvU0FGbEY4KythbDNKYnU1VUta?=
 =?utf-8?B?dmdsMXBWaDk0OVdEWkJFc2dyclcrN29Yc2ZnUG45WnNOMUs1U2VCdE1iUFA1?=
 =?utf-8?B?QkhiUW5qWi9TbVh3T3BtZldEcDhRLzNCanYzZmt3Nk56bFJ1NWc3Zk5zbkdU?=
 =?utf-8?B?TWc3RXREUGROZ1l6OUFqTnpadTNHd3QxWlRRTVA1RjYvc09WbE51L1ArazRH?=
 =?utf-8?B?U2tNVXEyRTdlQWVnMDlWZUZhL25ydHptVlo0SFRRRGd4bDI4ZUZyZXlLS2Zw?=
 =?utf-8?B?TldzbkFLdHV0cUJUdW52V3NEcmh5YXRWNHo0czlqTVdLT2ZEdlc1NGtqalJo?=
 =?utf-8?B?M01JeFdKZCtTZDAyRzNvSTBBOUY2U2xMeW9ESHRWVDN1RW1Ed2l4OGZwNnpM?=
 =?utf-8?B?eHgrTldEajEyZTJrdW1lcDZTWXBiTG1TZVRhZWdEYmZkZzZWdTlsaWQzekF3?=
 =?utf-8?B?QXdNU0o1UUs3QUlYZENQTkdaUlFmQ0FVcHN2WGxoT2hPZU5laE5oU2ZTNkZl?=
 =?utf-8?B?L1JPSEtMOXJmOUl6VDFXaVFKdHJFYzFqZmh3L1ZrVDlsZVRidWZhdnkyR2h5?=
 =?utf-8?B?ZmtXTkRjYUo4NktzR1luamd2aWZlVGZLc3hHYXNGQjBlUnFEL0RIamZlVnN6?=
 =?utf-8?B?WjlCK2Q1QzRZUVI3Ry9mMnhmcHhPRjl2cWM3NE8wc1VMZ0FhVzZkOFFGcURj?=
 =?utf-8?B?ajNMQVFsQThLZ2swd05IVlcvVmlFdmtoM1pZdTY3T0s5M2lxK0xjNWFSUmRX?=
 =?utf-8?B?ZFgrNmhEVFU1NGw2QWNqRDVsSnh3MFBaUHJjeDBNZk9FdHJRR01uSHB2K2k3?=
 =?utf-8?B?L2RSTmpBWnV6UEZkU3YwNFRuYjIzUk5Rc2VvTmc0ODZVNTVJSVh6TkgzSmx0?=
 =?utf-8?B?RmVYbSt2b0ZtcG1jYXBWNEFWMUNXM1laQVJ5b3h5Yk5NZEkrYWo5ditvRmhU?=
 =?utf-8?B?QXBOa053MTZvQml2czVhYkl6YU90Um5GdWtZT1kxd1VPK050S3FDZHdvbGg4?=
 =?utf-8?B?RU1CVjRTdHZYYkJtWDlIMWVtVEt4SVJWTkdSNCtxSmNrSUJ5SUM1YXRHVDlW?=
 =?utf-8?B?MXBCY0VCeFZrejFhVG5QTWFxZk1xSTlFek1jWXlwQWxuLzgzQ1pmNlRNK0JP?=
 =?utf-8?B?TVVteWhmYnhMMTB1MkhaN0tZRHJleU90NHcvZ0JzYXN6ZUNWaEk5ZDN4YlFP?=
 =?utf-8?Q?sKzzLmSu4i+Z/z5xJw2Bx3Q/Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b8d334-7a7e-4780-05bd-08dcbc5d61d5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 12:34:04.1943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dd4tYomSRvFu0OMc6+Q/N981UVFyKmvg7bR/tzrOC+ZpjYDkXftWMGElf6E8nEcNGESnXX3ST49cQuYiBHm7tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

Hi Jan,

On 14/08/2024 12:35, Jan Beulich wrote:
> On 14.08.2024 12:55, Ayan Kumar Halder wrote:
>> Hi Jan,
>>
>> On 14/08/2024 07:37, Jan Beulich wrote:
>>> On 13.08.2024 19:13, Ayan Kumar Halder wrote:
>>>> From: Penny Zheng <penny.zheng@arm.com>
>>>>
>>>> Introduced CONFIG_VMAP which is selected by the architectures that use
>>>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>>>
>>>> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
>>>> with new memory attributes. Since this is highly dependent on virtual
>>>> address translation, we choose to fold VMAP in MMU system.
>>>>
>>>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>>>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>>>> depends on VMAP.
>>>>
>>>> HARDEN_BRANCH_PREDICTOR is now gated on HAS_VMAP as speculative
>>>> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
>>>> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.
>>> While I'm not an Arm expert and hence I'm likely missing aspects, I question
>>> the one (Spectre-BHB) vulnerability there to be sufficient to draw a
>>> conclusion towards the usefulness of branch hardening. I would advise
>>> against encoding such a connection in the Kconfig dependencies.
>> AFAIU, to address 'Spectre' like vulnerabilities 'branch hardening' was
>> added.
>>
>> See https://lore.kernel.org/all/E1fNadD-0000fz-9r@rmk-PC.armlinux.org.uk/
>>
>> And from
>> https://lists.linaro.org/archives/list/linux-stable-mirror@lists.linaro.org/message/F4MGL4WT2R7T54NLRDGKFRQNSXF3DZGD/
>>
>> Spectre is valid on MMU based systems.
> Since then various other issues / flavors were found. I've been focusing
> on the x86 side of things, but I'd be very surprised if some didn't
> affect other architectures as well.

We are talking about Arm here as "HARDEN_BRANCH_PREDICTOR" is specific 
to Arm.

https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability 
covers all the flavours and it does not include Cortex-R82 or R52.

It says the following :-

"Cortex-R cores typically use a closed software stack. In those 
environments, applications or processes are strictly controlled, and 
therefore not exploitable"

> Plus branch hardening can be a pre-
> cautionary measure, too, I think.

The first two Arm non MMU cores that we wish to support in the 
forthcoming series is Cortex-R82 and R52.

As seen in https://developer.arm.com/documentation/ka005109/latest/, it 
explicitly states the following about R82

The Cortex-R82 implements the faulting feature (FEAT_FPAC) but is not 
vulnerable. The Cortex-R82 behaves differently than vulnerable A-class 
CPUs when speculatively executing past an instruction that authenticates 
PAC, and that behavior does not allow the attack software to create the 
"oracle".

We can re-enable branch hardening if we know there is a valid non MMU 
Arm core which is vulnerable.

Let me know if you are ok with the rationale.

- Ayan

>
> Jan

