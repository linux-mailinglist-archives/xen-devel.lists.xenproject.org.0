Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8F63EC0A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 10:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450376.707597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0faX-0005jq-KM; Thu, 01 Dec 2022 09:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450376.707597; Thu, 01 Dec 2022 09:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0faX-0005h9-GU; Thu, 01 Dec 2022 09:10:37 +0000
Received: by outflank-mailman (input) for mailman id 450376;
 Thu, 01 Dec 2022 09:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66xT=37=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p0faV-0005er-Al
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 09:10:35 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe59::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01cd4ea8-7158-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 10:10:33 +0100 (CET)
Received: from BN9PR03CA0187.namprd03.prod.outlook.com (2603:10b6:408:f9::12)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 09:10:30 +0000
Received: from BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::ff) by BN9PR03CA0187.outlook.office365.com
 (2603:10b6:408:f9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Thu, 1 Dec 2022 09:10:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT108.mail.protection.outlook.com (10.13.176.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Thu, 1 Dec 2022 09:10:29 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 03:10:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 01:10:17 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 03:10:16 -0600
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
X-Inumbo-ID: 01cd4ea8-7158-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndNlp4UL34LkXN8PF10bbSI4SYb57Yib8iC7loD6NTtfz+T5YCnT+16jyJprmgW8zrV3Gcgr2imUagHpZ8yKx1ETcgYUY0dX99lRVYtca+qni4iXV1ZKu3gp7OnzXlmPRZvG/LPmjPzkHZfrdnVybTPOIVdwSjQyXOGmTt+2xw16WTrqrF92qJLYoRdUERrSCeKXG/aFdoYJLLxLqA22NZP69xJtTce+KIZovVK6ZNf/9H2GepY8nja6HP7L1Ab1jKVioKxIlDtoUnQJL8eh0FbqBJ5LXURpM6R7ErqqzqmpLRfUrZKNY8877E3djOrBrxJXEOgINbBx5fx7EJHlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsVM1/Md94QjCFGiTDWsD9Dynj8x8KgCk6F9T9tMLx8=;
 b=QUNPVulO2uz2Azz2iJ2dJJRe4cOhC3wb+lfouXSPgvzJuIvJSTATeavv2lLuvBlKf9BSmKz72GE+XScKVnoEKnFlz7mvUewqcihWjX3bQHYUXYtc8HNeltWgsDo+Z4is292ZkX6KE5XCmrleIouTeJWy2Gz2Y+wWljiOCbRu9c6JjmC8H3VuJceeiUhEo8UuRzL2nE5VlJhXcOJnAblMWoPDDbse6qHdUFNt3KYxSucQHOnjJv/ug5tGBKrhgoq1tP2MQTqvhQ/JXRchkEzTKhygnIQ6DWnjTnaFgIHvcCCih4JL8cNDrZJ0ZCYHPheUj1ZSOGR5pqV5AfslckTfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsVM1/Md94QjCFGiTDWsD9Dynj8x8KgCk6F9T9tMLx8=;
 b=ycSghpwMuqNXWUUa8KSgOBmio5DBbYnasmIdWWRb8/PI9vo/9GMkqnXteyt9WlkuM+ANIZc/Jx2geUTIdJsdVivN8iTDZQndliHwA4evBGb9oi6AiLl5xC8+f1tMZCMx4rGr3/WF/ikG1fOd8XjJrT24MRhBmGrfrLVOiUh4CwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <caf1c78f-6631-ea9a-57f2-881d5870a769@amd.com>
Date: Thu, 1 Dec 2022 10:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/2] xen/arm: vpl011: emulate non-SBSA registers as
 WI/RAZ
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jiamei Xie <jiamei.xie@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20221201080400.1842558-1-jiamei.xie@arm.com>
 <20221201080400.1842558-2-jiamei.xie@arm.com>
 <f51dbcc1-e7b3-c5c9-f603-73c9013d8b2f@amd.com>
 <8680c25a-bfac-d0b7-e2e6-a9264f8a7221@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8680c25a-bfac-d0b7-e2e6-a9264f8a7221@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT108:EE_|DS7PR12MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bf6008-f7e8-48ca-08f7-08dad37be494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5O1lRe2dz91kll9OHyW0bByxeSoO+BpWIJFzz0hpykLKF/vRYuyG9LbHHd7y6wENh3S02+mo0i/11RRjfCrIDM+gXvRkM7BUp1r17EUztIj73KmKk69Xo9kL5KAL0Xj1P6IvnvKuYsfb2Um4wH28LsW9HvSVUuAUEXCgzEayAblEd4pl9uHIUZzjbbaZMRsso6FL9dAbnzCudwdGLfgeO231zgDmWGtU62fNy1aKPg9BK5gxOsG+iFCjmk6+ezUZfhl+VUbdENK8PBVx35iQrJbN/Jm9wjmL69i6UHLSUTgeAj38094Bo93cqYHE+r1cfhXLHOwaJEh4j2EZHRqfKNSnotdsV2HuhBKAXUrzD7NBhCpOw1qxo/Jo400pLln3lOVFnKBbov50krDB+ASb89YHqGhhnrSLXUorHgpJdhnYbMTYX17xQEb+hQBAITGRf3JNIc0C1Y1dNvnNbV7dXC4QW3v7wxFr3VdQyBIyRX78rUAo4j3Kb1S+EwaCWrwYxnRqVTTLPTClNwqoht0SLKCSUHjqjYuyJ+pL4Ul9oFp/4Ms50guH1VokxpoFTDT9aoSJ0vvX92P9/545jwLIUZAw1fXSxshZjI++MRpFTBBY1iVy1epqlX+qp3Z/8DHNVasomtdZWuRq7IET4h5TZSA+jG0kpVznuMSaFx3aMQ1keLTvVa8NP0ion0uSj893btVn3ktxN2aMooTNOVmC5BJygIYhzD7sXEEZE4xgsbaeKUVe5ceCgcH6/g5iOeCzIGhpj4bEyO4FUh9xYc6nGuaLN/mFtvMJR1VI0p+mJbClioH9Y4uiY1lxzSA2IY+mrZv6/1enJJugUfWaWAnU/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(426003)(47076005)(31696002)(70206006)(316002)(86362001)(83380400001)(36860700001)(44832011)(966005)(81166007)(82740400003)(2906002)(356005)(41300700001)(40460700003)(82310400005)(5660300002)(8936002)(40480700001)(336012)(4326008)(53546011)(26005)(186003)(478600001)(2616005)(70586007)(54906003)(16576012)(45080400002)(110136005)(8676002)(36756003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 09:10:29.5066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bf6008-f7e8-48ca-08f7-08dad37be494
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984

Hi Julien,

On 01/12/2022 09:52, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 01/12/2022 09:42, Michal Orzel wrote:
>> On 01/12/2022 09:03, Jiamei Xie wrote:
>>>
>>>
>>> When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y",
>>> Linux SBSA PL011 driver will access PL011 DMACR register in some
>>> functions. As chapter "B Generic UART" in "ARM Server Base System
>>> Architecture"[1] documentation describes, SBSA UART doesn't support
>>> DMA. In current code, when the kernel tries to access DMACR register,
>>> Xen will inject a data abort:
>>> Unhandled fault at 0xffffffc00944d048
>>> Mem abort info:
>>>    ESR = 0x96000000
>>>    EC = 0x25: DABT (current EL), IL = 32 bits
>>>    SET = 0, FnV = 0
>>>    EA = 0, S1PTW = 0
>>>    FSC = 0x00: ttbr address size fault
>>> Data abort info:
>>>    ISV = 0, ISS = 0x00000000
>>>    CM = 0, WnR = 0
>>> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
>>> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
>>> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
>>> ...
>>> Call trace:
>>>   pl011_stop_rx+0x70/0x80
>>>   tty_port_shutdown+0x7c/0xb4
>>>   tty_port_close+0x60/0xcc
>>>   uart_close+0x34/0x8c
>>>   tty_release+0x144/0x4c0
>>>   __fput+0x78/0x220
>>>   ____fput+0x1c/0x30
>>>   task_work_run+0x88/0xc0
>>>   do_notify_resume+0x8d0/0x123c
>>>   el0_svc+0xa8/0xc0
>>>   el0t_64_sync_handler+0xa4/0x130
>>>   el0t_64_sync+0x1a0/0x1a4
>>> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
>>> ---[ end trace 83dd93df15c3216f ]---
>>> note: bootlogd[132] exited with preempt_count 1
>>> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
>>>
>>> As discussed in [2], this commit makes the access to non-SBSA registers
>>> RAZ/WI as an improvement.
>>>
>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdeveloper.arm.com%2Fdocumentation%2Fden0094%2Fc%2F%3Flang%3Den&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C84567fc1ef8b4a0b314e08dad3796005%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638054815513527676%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=5Sa0xLx%2Bje0bxXssHrNz7tnV8QmbTD0FvjeenlsLGaw%3D&amp;reserved=0
>>> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2Falpine.DEB.2.22.394.2211161552420.4020%40ubuntu-linux-20-04-desktop%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C84567fc1ef8b4a0b314e08dad3796005%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638054815513527676%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=AjAaBk1N2amRLW4CKrAlqqbAvxi1SUWZwZDpOf6%2FgfU%3D&amp;reserved=0
>>>
>>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
>> The patch looks good, so:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> However, because your series is about vpl011 refinement, I spotted two things
>> (this does not necessarily needs to be done by you).
>>
>>> ---
>>> v3 -> v4
>>> - remove the size check for unknown registers in the SBSA UART
>>> - remove lock in read_as_zero
>>> v2 -> v3
>>> - emulate non-SBSA registers as WI/RAZ in default case
>>> - update commit message
>>> v1 -> v2
>>> - print a message using XENLOG_G_DEBUG when it's write-ignore
>>> ---
>>>   xen/arch/arm/vpl011.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
>>> index 43522d48fd..f4a5621fab 100644
>>> --- a/xen/arch/arm/vpl011.c
>>> +++ b/xen/arch/arm/vpl011.c
>>> @@ -414,11 +414,15 @@ static int vpl011_mmio_read(struct vcpu *v,
>>>       default:
>>>           gprintk(XENLOG_ERR, "vpl011: unhandled read r%d offset %#08x\n",
>> This is an emulated UART MMIO handler, so instead XENLOG_ERR, we should use XENLOG_G_ERR
>> to indicate gust error and not Xen error.
> 
> That's already the case because the code is using gprintk() which will
> append XENLOG_GUEST to the log level and also print the current vCPU.
Ups. I did not notice g prefix in front of printk by accident.
So we're all good in this case.

> 
> Otherwise this would have been considered a security issue because
> XENLOG_ERR is not ratelimited the same way as XENLOG_G_ERR by default.
> 
> Cheers,
> 
> --
> Julien Grall

~Michal

