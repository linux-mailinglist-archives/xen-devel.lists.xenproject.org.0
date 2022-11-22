Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D358633FEF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447215.703168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV10-0006Ws-UJ; Tue, 22 Nov 2022 15:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447215.703168; Tue, 22 Nov 2022 15:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV10-0006UH-Qm; Tue, 22 Nov 2022 15:16:50 +0000
Received: by outflank-mailman (input) for mailman id 447215;
 Tue, 22 Nov 2022 15:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ldZr=3W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oxV0z-0006UB-M3
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:16:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e88::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae0a864f-6a78-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 16:16:47 +0100 (CET)
Received: from BN9PR03CA0382.namprd03.prod.outlook.com (2603:10b6:408:f7::27)
 by BL1PR12MB5094.namprd12.prod.outlook.com (2603:10b6:208:312::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 15:16:44 +0000
Received: from BN8NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::12) by BN9PR03CA0382.outlook.office365.com
 (2603:10b6:408:f7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Tue, 22 Nov 2022 15:16:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT082.mail.protection.outlook.com (10.13.176.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 15:16:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 22 Nov
 2022 09:16:39 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 22 Nov 2022 09:16:37 -0600
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
X-Inumbo-ID: ae0a864f-6a78-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcLgF+QZ+zMsHWy5mdmowE8w6uT3fDkWYQC9pDNd/j+R+aO6SLWOLuBjaAiHAJR+bCy4WndbSyg6SV/SXscFNGqzlojRXU69zISOgC9PBSmwGxRoVRNYjOCmQM3EDS2w5wBLmeC3e9Jyba2QEmFjntBpV+ZYrwFOqTYYCEl33JER/j+sxqHBp9MGOyQxPy9QuFzp31Axuxaam87VbDxG+E0hrj9flwB2zRHaLgu9jStnZIBI5tls+18IZXL43LiRqneld678jp3G5MC3ryRHQ8Zn01p4QB/cHpxjdtiFgIWEQvjyXPfqzyhTl7H8jBZexe5EGm4MqS3Ic+wToqs2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge3y2Uo4Im8rI8BNj4uo4AEBY7/rK0L2lA5DH7qLKXs=;
 b=Mf5M1KO6SJNiV8yrU0lD3MRbzb1xUzixhYzlgPZxcHJQ3PNKItipz0g85DOzJMrnirGiVNsxv/ORPC0/A1UcWOhfOwSkd1Hjk199xLkaWD1BfT7uCbI1zVnqmtfaUvHRqpsP6Hi82Ak6abNVLs9t/V6CE4S8kfBcGjI+cNQhIkWc/wkYo3eFuLTVfixuFWNS9p3bUMg5j9LDSUDURFOQBmcAIN/lWxiLb+ZeD+WPlN0cH692mhh46IOS8lhCPoaLSsFhMwHf0KHit98k6kCRksn2mlrcLujLxyfJdVfNDmVLFvg0gTEtut0Eo84v/1cVvxr0tOwyM+SO/Hi+onkKGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge3y2Uo4Im8rI8BNj4uo4AEBY7/rK0L2lA5DH7qLKXs=;
 b=CX5vp5pt5jH+uVECvZIxw9/TdB5IMYI1QJCc/svVTQdYVL1O82KjBymcs+eEurYrqY2MIfwYY8jM6euTDN9uCFMqdwt2jKa2U+NrFYUQo+adgVQJZ9wKr0vgxOje+S9Ov4+wURzBhrindh4gIEaqm8Xp+0XrSXOnRBlaszCDJD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1f0d8171-a56e-a7a2-e5c2-0d8d09ee0a1b@amd.com>
Date: Tue, 22 Nov 2022 16:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] xen/arm: vpl011: Make access to DMACR write-ignore
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jiamei Xie <jiamei.xie@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20221122054644.1092173-1-jiamei.xie@arm.com>
 <a38b9ebf-c5da-8648-183d-eb5fbb5b22f3@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <a38b9ebf-c5da-8648-183d-eb5fbb5b22f3@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT082:EE_|BL1PR12MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ca38bb-2c7e-4a9e-2b2a-08dacc9c90dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8TwjO0G7sgi+/IwrQJpL+XbeAWnRV4s84pOiDVY0wfpcL5qeu9N7kem8GHhaVBdZ5xrfC48JKQJ2lFGRhZD+jK+4QPGSYHwyOqZ1l0WjUaEPswIphIpyV6qDTPXWhx4QGvRY1JoBPBFz3S831NZ6IMqeI0Njyo1QMTm40t5NXdvz0CRDKoo/r7tY5dCbDmxQTkZ0rT7/4zhqeAjSzhrGdpgARNXy1OTx5T4Ph5lGGVePL/g8CtNAHGJwzS/t/tfUOaAzaFNexV8PB/Dr158c/eljyTucKuUYNvYzJVVgD34arGFNEHKM76IH4Ci7Mh3mQc4O+uX9rGuywSCmaaztunUd2BaOSTdm04EXX3hnFL2xyf+/yur7ZAzv0BLY6MdvSxbBJC1Ksu3V97qwOsu6T4pbek+s1QboLRPqvS3pvZo+7s1yh17IWx/15JLQulQtrWjkPXaebxVPMyFg5/GsmZRy2t+S7ro+7+m5LDqBsrQhzRZaLqf7x/fNAqHSGompK7t7FZftibwKiiQSM6ptpOM03+kVbxJNR/P7qsxzC5qCHn5pfhiJgZfptza4hrO0frZMqWoMbF0dQtL0Va7pBQpXF7RUocY7FJCLyCHr4muEv7aYWYUblz8kWLNBH+IbAOBtQP/X5CGVYrqd9/KI62yLlojYr8ZgM+NYiH1hySlgn+zeNULFPIUtVP/mmiwfc/93cGHMh8Yrf47f2wjFRHAC5l/m+rnTxHgzBA83ewvCudjq308dA9EfcoBRorObAftooXCIIrmKDFSAKe4WP+/+mS8eLHMy8WaA0HDGu/q0SuxwmKXndlPItVbREmRIVY4zWI8wQFJBCdGgoqKTuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(426003)(47076005)(2616005)(336012)(356005)(53546011)(83380400001)(82740400003)(40460700003)(81166007)(186003)(36860700001)(40480700001)(2906002)(26005)(44832011)(5660300002)(16576012)(45080400002)(82310400005)(54906003)(966005)(70586007)(8676002)(478600001)(316002)(8936002)(70206006)(41300700001)(4326008)(110136005)(36756003)(86362001)(31696002)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 15:16:44.3412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ca38bb-2c7e-4a9e-2b2a-08dacc9c90dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5094

Hi,

On 22/11/2022 13:25, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 22/11/2022 05:46, Jiamei Xie wrote:
>> When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=y",
>> Linux SBSA PL011 driver will access PL011 DMACR register in some
>> functions. As chapter "B Generic UART" in "ARM Server Base System
>> Architecture"[1] documentation describes, SBSA UART doesn't support
>> DMA. In current code, when the kernel tries to access DMACR register,
>> Xen will inject a data abort:
>> Unhandled fault at 0xffffffc00944d048
>> Mem abort info:
>>    ESR = 0x96000000
>>    EC = 0x25: DABT (current EL), IL = 32 bits
>>    SET = 0, FnV = 0
>>    EA = 0, S1PTW = 0
>>    FSC = 0x00: ttbr address size fault
>> Data abort info:
>>    ISV = 0, ISS = 0x00000000
>>    CM = 0, WnR = 0
>> swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000020e2e000
>> [ffffffc00944d048] pgd=100000003ffff803, p4d=100000003ffff803, pud=100000003ffff803, pmd=100000003fffa803, pte=006800009c090f13
>> Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
>> ...
>> Call trace:
>>   pl011_stop_rx+0x70/0x80
>>   tty_port_shutdown+0x7c/0xb4
>>   tty_port_close+0x60/0xcc
>>   uart_close+0x34/0x8c
>>   tty_release+0x144/0x4c0
>>   __fput+0x78/0x220
>>   ____fput+0x1c/0x30
>>   task_work_run+0x88/0xc0
>>   do_notify_resume+0x8d0/0x123c
>>   el0_svc+0xa8/0xc0
>>   el0t_64_sync_handler+0xa4/0x130
>>   el0t_64_sync+0x1a0/0x1a4
>> Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
>> ---[ end trace 83dd93df15c3216f ]---
>> note: bootlogd[132] exited with preempt_count 1
>> /etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
>>
>> As discussed in [2], this commit makes the access to DMACR register
>> write-ignore as an improvement.
> 
> Didn't we agree to emulate all non-SBSA registers as WI? IOW, the
> default case should contain a 'goto write_ignore' rather return 0.
+ we also agreed on emulating the reads to non spec compliant registers as RAZ.

> 
>>
>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdeveloper.arm.com%2Fdocumentation%2Fden0094%2Fc%2F%3Flang%3Den&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C1065702b4fd2457cdbf808dacc84b45a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047167600786580%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=W1dbakw6lkGkv4ydElIi%2Ba7uT7e7Pt5dB3vDtYpP%2FqQ%3D&amp;reserved=0
>> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2Falpine.DEB.2.22.394.2211161552420.4020%40ubuntu-linux-20-04-desktop%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C1065702b4fd2457cdbf808dacc84b45a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638047167600786580%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=O4zxuI3HqRA1bdraGcVVY8vV0HGbqOI3nFa%2FciC1cGQ%3D&amp;reserved=0
>>
>> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
>> ---
>>   xen/arch/arm/vpl011.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
>> index 43522d48fd..e97fe3ebe7 100644
>> --- a/xen/arch/arm/vpl011.c
>> +++ b/xen/arch/arm/vpl011.c
>> @@ -463,6 +463,10 @@ static int vpl011_mmio_write(struct vcpu *v,
>>       case FR:
>>       case RIS:
>>       case MIS:
>> +    case DMACR:
>> +        printk(XENLOG_G_DEBUG
>> +               "vpl011: WI on register offset %#08x\n",
>> +               vpl011_reg);
> 
> IMHO, this message should be printed just after the write_ignore label.
> 
>>           goto write_ignore;
>>
>>       case IMSC:
> 
> Cheers,
> 
> --
> Julien Grall
> 

~Michal

