Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E879987A17
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 22:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805876.1217109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stv99-0003Sq-Pa; Thu, 26 Sep 2024 20:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805876.1217109; Thu, 26 Sep 2024 20:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stv99-0003QO-MZ; Thu, 26 Sep 2024 20:31:31 +0000
Received: by outflank-mailman (input) for mailman id 805876;
 Thu, 26 Sep 2024 20:31:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGJI=QY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1stv97-0003QI-LO
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 20:31:29 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2413::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4daad642-7c46-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 22:31:26 +0200 (CEST)
Received: from SJ0PR05CA0138.namprd05.prod.outlook.com (2603:10b6:a03:33d::23)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Thu, 26 Sep
 2024 20:31:21 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::71) by SJ0PR05CA0138.outlook.office365.com
 (2603:10b6:a03:33d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18 via Frontend
 Transport; Thu, 26 Sep 2024 20:31:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024 20:31:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 15:30:06 -0500
Received: from [172.18.112.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 26 Sep 2024 15:29:52 -0500
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
X-Inumbo-ID: 4daad642-7c46-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLO6FIlb72n7zU7GEuNN4xQ5tMO1aurRVYOQuQqEzJz94pbN0vAvjevjUaigLCWvOIUhZPzh0SMB/WFlpG2DlHmmo4DDAmPp0qtDWoeiSbvIEXNc0KWaOXwirvzWEbKNr9qVKDhDNOD/KamqcKMXQ7FOvAkv+td5fUvytMqcA/OqoB05OfdJLBPXL06AnurAzdq+EpX8Isq/3vf7OjGjOhzfg/Uth6lwO/Q1peifK8ovtfeINfvi0zbL6M26gzHtZ3iw5mEnbaXeiyTgx6687p/9erpTPQ/k+Zkl8v6wuNCeQxgZt18rZbSymLyjjIolTYESuzAV+ZOpbRbOvwGWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T8JIBd7rq5lswK9R4woRdCqL5SsqEyTDaVhyz0YUtc=;
 b=Rou5+F/judTOqiH9sBY/vvog/awJQITeTvrdIPzIdMMIr3lv7sq5z/kTBM9r5JbBZQpPZPuohe6UDE1N4LQwuY4MrrU+fQPaBOJjOTvi9FlS4oeKHJ2A5adZxV03Xid2XrPOavTVF3CeX7h1zdimXswiSFqnjrHKb57Ccq2TZ7BBZ6xqe1leabIycEnPYo1A6G1xvBn9pMZAUeThd0p6q6exLUBoL1k6cKgTM/ojC2lWkaCh6V0W+TOoH9CVqPQ6GXKzDtHmD36Pa6/zw0Lp7i/eV5FohrW2/YVDuI7wvgH/+1Vk8v+Y/J2QjbsIKTcWPqqsTJjiIvRe77h5AyZjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T8JIBd7rq5lswK9R4woRdCqL5SsqEyTDaVhyz0YUtc=;
 b=nvD5nDbiMclEAbmfxKrB4KrSacgNyYNSogtxEKXdbvTKFSxP1mSPZ61H3/vT4COq5ASarzHi7EAzmna8YrZiR2UC7yIKMPY47Yb160LpZNqRva0J5O3XshVpvsnISnhcTNQ3dlO/1hBmNx3BCYOMyfrVoMnR0DbIw8ItKY5vJQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <06f800e1-f0b1-4040-83f8-7c026ca17268@amd.com>
Date: Thu, 26 Sep 2024 16:29:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/pvh: Call C code via the kernel virtual mapping
To: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>
CC: <linux-kernel@vger.kernel.org>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240926104113.80146-7-ardb+git@google.com>
 <20240926104113.80146-8-ardb+git@google.com>
 <CAMj1kXGQhj4RK=Ks_WD59hG1FzX=vsEkugDEW1tmzJzjahrB4g@mail.gmail.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <CAMj1kXGQhj4RK=Ks_WD59hG1FzX=vsEkugDEW1tmzJzjahrB4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|MN2PR12MB4061:EE_
X-MS-Office365-Filtering-Correlation-Id: b22733ce-00da-450a-c5f0-08dcde6a2ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1E2MHZyTFdWOXQzbDBmWVMvb25kbGVTUzZaVzhIUnVMWWRoRExkaFJBdGhv?=
 =?utf-8?B?N21xem9xWEUvSmdGU25veTVaUDZGRUxXeUZjWERvalc3L1JBb01zN1pKdzFr?=
 =?utf-8?B?clBodzNGemR2V3l3NkxMdXVrLzF1OU03NmN5K1dUSTFINldOQ1VsblFjeUlz?=
 =?utf-8?B?aU5NR2V1Z25YQzFoUlhnSzZ0RDBVeVp4QWY0bGhrSVlqRFQrNVZkNTVHNU1G?=
 =?utf-8?B?SGhqaVFqQ1N5WkR0RVdBbW93OEpVTDUveHlKdXhQZCtXUzlxL2d2OGVDUCs4?=
 =?utf-8?B?aUFFK1IzWGFIZmxSd3JlRk1tUjZKVDRTaGZLZ2xqTW5uOU1taTVoUURMV1p6?=
 =?utf-8?B?bGdPZHZkUm9ReE51c05HaDFiWGlqczQ0SHpvNmJhNStoSHlVbnhwRGFQU0NK?=
 =?utf-8?B?SzJjdnVjRDJ1STY3QllIV0Jzd3pOeWlqb1dGTHdNRC82dWN0UnNEWHNNYmVN?=
 =?utf-8?B?V0Y5Rkt4VnJyOHhhUEMvQ1hNdDhrMXMxWWIwSHhUU1dCNmJUVXlSWHZiTG1D?=
 =?utf-8?B?bWYydWhrcUVZazBqVGVTUlNtWFNrTnIra0JqeXRMT1gxeVVBWnlZSkM1TVZu?=
 =?utf-8?B?VWhEQ3psVkp6bzNSVVNWb3EvdVdkT3Z4ZThNVm9tL0FwK1lnVGI3ZndMMzYx?=
 =?utf-8?B?aUpncmFYOHorUGx1VDVxc1JXc1ZYaWhBVG5IdUU3T2tJemgxZ2dMYkVXd1pJ?=
 =?utf-8?B?d1ZsbEtvNVBHMGlJK3dJby9aM0I1MmlUU0ZRUllyR1ZZNlFqZjV0ZWU5ZEEv?=
 =?utf-8?B?K29OUHJ0RGdNNkhyaTFGZVd0K2E3Ui9DcGhZS0I2QWVCVVMzaEphRndxVldi?=
 =?utf-8?B?WitRWFVNclk4cVJLa0s5bFNZTzljYzNxems5NmhUcjRsVGY5VjV3MTZMZ3JF?=
 =?utf-8?B?SVMvSGRlSzR4SnBiWURBUU94OUg2b2tRUHQzSXB6Nk9adnlVMXNsU0NqclRN?=
 =?utf-8?B?Y0lZSmhTK3NNV3pva3BwQjNaZkF6QWp1Znk1U29Cd00xVmtCNDRUWFB6ekky?=
 =?utf-8?B?UjBUTVRzUDRIWVhmSzVqWkJaTGxERmk2OW1GV042TzBEOEhBbEM1NWxwNks0?=
 =?utf-8?B?NFh6VUlkZmRoejRQODQyTDAwWnFFUzVCVy9Jcmp2Q0hFcHQ4bFJweTBUb2h6?=
 =?utf-8?B?c3dGZ0lSYlM1WmNXc0RPN1NWMS8yOEorUVZpZnVsOFVERUU3UlBmQnFtaW5Q?=
 =?utf-8?B?M2FxR29rSmxqODAyR3lVRFNhMnJmRHlod24vNTJ5WXkvVDQ3MmROWGUrQ0dw?=
 =?utf-8?B?OU94NDRqNG5DN3VrUzFkK0RKR3U4bUY3Y2dpZ1Z0MkF2bXBvSmVXektXRnV0?=
 =?utf-8?B?MXgxK3owaWJIeDJtVzM3SkZmem90QXhMeVZIZ2wwR0lEakphZ21hZ1RacjlM?=
 =?utf-8?B?YllFRmYzSXNrN0F5WU1EN0NvejlRZitJMUczUmdSN3U4bTAvWEVHSDlFdlFr?=
 =?utf-8?B?NWJremRlQnlwTXNHRjZSNzF4eTNja3VpQ3U1bUNIR1ZMOWtrT0d4RDVrL3Ru?=
 =?utf-8?B?cTJMM0Q4aFZBTjk2RmU5TWVURENBM1B4UkNYTzdMQlRpTkt0N0NhRlNPazJN?=
 =?utf-8?B?dWlvcFcvNndiNWtLZHRBUlZtSUNZdCtaLy9CQTR2TXREbVF4VEczVjdJQzQr?=
 =?utf-8?B?WTRwYlo5bHFyUmFYN21sWThqQitsSDB6am15S2RiM3ZRN08xc2pMVm05THNZ?=
 =?utf-8?B?WHJmcm5SV0hXR1BhOWhIQXIrT3k4bi9QY2x6Mkl4aU41aWlGRk5zNUducS9E?=
 =?utf-8?B?bnRpbVVnYzNBUGdWeVhtMWd2Z3dKQVh2azlnN0xrZWdvblRGbkh0aXRMMStP?=
 =?utf-8?B?dS80WEJWMFRXMjFXMktyS3pSdW5kRmNBdm05S0hEV1BCYUNKNWg4aHJrM1dj?=
 =?utf-8?B?T1lpdzBxSjFrNXBvSHlzMEdUc2s5am41MVNIbG5mbFNlNHIxbDRGTXBIdnh0?=
 =?utf-8?Q?yQ5/R8GyRH8fnmrY5MTjVhavYXOonlzl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 20:31:20.8237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b22733ce-00da-450a-c5f0-08dcde6a2ea0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061

On 2024-09-26 06:55, Ard Biesheuvel wrote:
> On Thu, 26 Sept 2024 at 12:41, Ard Biesheuvel <ardb+git@google.com> wrote:
>>
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Calling C code via a different mapping than it was linked at is
>> problematic, because the compiler assumes that RIP-relative and absolute
>> symbol references are interchangeable. GCC in particular may use
>> RIP-relative per-CPU variable references even when not using -fpic.
>>
>> So call xen_prepare_pvh() via its kernel virtual mapping on x86_64, so
>> that those RIP-relative references produce the correct values. This
>> matches the pre-existing behavior for i386, which also invokes
>> xen_prepare_pvh() via the kernel virtual mapping before invoking
>> startup_32 with paging disabled again.
>>
>> Fixes: 7243b93345f7 ("xen/pvh: Bootstrap PVH guest")
>> Tested-by: Jason Andryuk <jason.andryuk@amd.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>   arch/x86/platform/pvh/head.S | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
>> index 64fca49cd88f..98ddd552885a 100644
>> --- a/arch/x86/platform/pvh/head.S
>> +++ b/arch/x86/platform/pvh/head.S
>> @@ -172,7 +172,13 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
>>          movq %rbp, %rbx
>>          subq $_pa(pvh_start_xen), %rbx
>>          movq %rbx, phys_base(%rip)
>> -       call xen_prepare_pvh
>> +
>> +       /* Call xen_prepare_pvh() via the kernel virtual mapping */
>> +       leaq xen_prepare_pvh(%rip), %rax
> 
> Just realized that we probably need
> 
> +       subq phys_base(%rip), %rax

Yes, this is necessary when phys_base is non-0.  I intended to test a 
non-0 case yesterday, but it turns out I didn't.  Re-testing, I have 
confirmed this subq is necessary.

Thanks,
Jason

