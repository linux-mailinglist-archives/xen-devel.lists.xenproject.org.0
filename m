Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8685A7B1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 16:43:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683008.1062313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5nc-0003O7-FK; Mon, 19 Feb 2024 15:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683008.1062313; Mon, 19 Feb 2024 15:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5nc-0003LC-Bi; Mon, 19 Feb 2024 15:43:20 +0000
Received: by outflank-mailman (input) for mailman id 683008;
 Mon, 19 Feb 2024 15:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k0rs=J4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rc5na-0003L1-UB
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 15:43:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e88::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 992d3d62-cf3d-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 16:43:17 +0100 (CET)
Received: from DS7PR05CA0034.namprd05.prod.outlook.com (2603:10b6:8:2f::35) by
 LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.19; Mon, 19 Feb 2024 15:43:13 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:8:2f:cafe::24) by DS7PR05CA0034.outlook.office365.com
 (2603:10b6:8:2f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14 via Frontend
 Transport; Mon, 19 Feb 2024 15:43:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 15:43:12 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 09:43:12 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 07:43:12 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 19 Feb 2024 09:43:10 -0600
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
X-Inumbo-ID: 992d3d62-cf3d-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTtoowCLLtAMqBhclrd5zWj3ZP+iqIWR6062yh7OCcS7WjCX2/ZucjFqxyiXXkjJx2WhMuTdLzKkfTcdqFwUrxkWV8YYWtW293L8DcSZRXpyJNKAYjzfj5UuiZS5gx41vgYuYsY4ALU37b79feUN6mu+bxXeqEwQpc2txSOuYOpv6qJzqiwAHv3gnzMqWBRU9VH5UoaUuoViDAjXqLnOwYzP09kavKpCsQKqIxCvN3Y+fEJUUOYeMufTyTnfHYHvkaBnwhPvmp3mIZAlDTpHhBRz6uRaBi06tlJ1Ux6SnksS4IZ2BESqQfLEzDbzEUHg83rG4Ou9dIRmXC9bk/E1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AR3nOagl3W0nxyDpSoQSjtwekC9dWEe27HlkS/0Fmz4=;
 b=e5zguS/EJw3DwOPRXZvPRuD0gnpmTn6uG/MTtfjnqkdMDpxMocxKvWZwly3S5OetxeCQY6aBUGnV8cegeDWh1kjDiwtKnsAj7CtWSTuVyCo66P5uZa9TgfmHxDALvYFC+ym/7JOHi+1Y/P9Hf28m/xC1jxGZB2acJOf4Zq2853g2HYuPuSTL2FsAJBSA2dUfUSk/+OMWSR1Vs26891kgeIf9wNwozytbbrGIXT5THi7W/y8gTB3euajFLe8S/BeO6tML7Ks+bqKfKWNydpiwimNVTzrcOl9iKoDm1Pd7Ul+T5z6+rPpw3DveuWgVR34JRRPuHEOOjrDabjsyXzfeUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AR3nOagl3W0nxyDpSoQSjtwekC9dWEe27HlkS/0Fmz4=;
 b=mJnHlbKmAQoSl+0URSbS+bcFTxUvYAipmNT7kArOsEtL3j3Kj2HdPepOmroPd3FaaMXFeDqOpTYNNbyb/hVDf1QR+kYwY5HHb7jQq+bogcf+9g2JsFHRrfVp3B2WDGyVNGcMx+bwTgHjJNcTwQcpy1C/zmHhPkmLMKv1bluC+8M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9d1a545c-a93e-4f8e-bc76-0b5676fa01ea@amd.com>
Date: Mon, 19 Feb 2024 16:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Julien Grall <julien@xen.org>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<luca.fancellu@arm.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-3-ayan.kumar.halder@amd.com>
 <0c4e4a40-7327-4377-bfdd-82e69bc838ae@xen.org>
 <7098c9ab-7008-4a49-92d4-6cd201b1490e@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7098c9ab-7008-4a49-92d4-6cd201b1490e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 532aada3-af9e-4db7-ca87-08dc31617b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+V0e6vuXII1+xijbeu/6riYkEoWvuJ0QPJCUw3AuyySnSdFbkXlmqm6J5RnWQOx3cmYmDLqM7wjzD0iClG+3NiscijYgR0ab/ClRw4G67uo/aItMOrVVs3KUYhgOQ9zarQo+/ITcgVaya81cdmuMoop2J/pUrl1SdAOwLrQvRoIRVEtRglIkg06bMAeIhgkBTdkPsOIJUCzu2jgioPDMDk9tmel++3I/23VvqjwsKQaCLN80WPC9vi8TlrGv1khQ9sejZ4mkCSTyvkHwGdNnAcrj/VE+EA8XqWon1JLtuJXlFX+AF1b2y877qmjMj5lzhLNJfnCkuiPZmDMK84IwVhjtaJLxbQG8HjQlEwvIlI3e0lCCme63ieDkmLeg1sa3fIs5o2lX5/LpB8EkRJgwWjQT8KgcqS4yNir+hJnroqUdtor+ilYRIl9nBuQPE8TKpmNNpPK0rU4J3bSRrx0F6HHR2O9QurSDR/+eGz6eTMIwvpfdsOSEw4W5twRzniwcdmMkcLnmTuo4av//i4YvJMwkxLV787UXrhtzj6vL1qhVJ2sFJ6GEBcDl2sOvEUZAf5f1PnEkv3aH+sEh6PMc5EAtWHuCe7yqW/jPvlRcb+71lLojy22JQXZlGegt/mmGIIzhJbJWnmLMDxgMK30/Pb9SX5Vjs+y/nYeolHaAhEg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 15:43:12.9679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532aada3-af9e-4db7-ca87-08dc31617b58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728

Hi Ayan,

On 19/02/2024 15:45, Ayan Kumar Halder wrote:
> 
> On 06/02/2024 19:05, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien/Michal,
>>
>> On 31/01/2024 12:10, Ayan Kumar Halder wrote:
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>
>>> Currently, if user enables HVC_DCC config option in Linux, it invokes 
>>> access
>>> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, 
>>> DBGDTRTXINT on
>>> arm32). As these registers are not emulated, Xen injects an undefined
>>> exception to the guest and Linux crashes.
>>>
>>> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
>>> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as 
>>> TXfull.
>>>
>>> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
>>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
>>>
>>> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
>>> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> 
>>> hvc_dcc_check(),
>>> and returns -ENODEV in case TXfull bit is still set after writing a test
>>> character. This way we prevent the guest from making use of HVC DCC as a
>>> console.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from
>>>
>>> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving 
>>> the OS any
>>> indication that the RX buffer is full and is waiting to be read.
>>>
>>> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at 
>>> EL0 only.
>>>
>>> 3. Fixed the commit message and inline code comments.
>>>
>>> v2 :- 1. Split the patch into two (separate patches for arm64 and 
>>> arm32).
>>> 2. Removed the "fail" label.
>>> 3. Fixed the commit message.
>>>
>>> v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether
>>> partial_emulation_enabled is true or not.
>>>
>>> 2. If partial_emulation_enabled is false, then access to 
>>> HSR_SYSREG_DBGDTR_EL0,
>>> HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception.
>>>
>>>   xen/arch/arm/arm64/vsysreg.c         | 28 ++++++++++++++++++++++++----
>>>   xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>>>   2 files changed, 27 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>>> index b5d54c569b..94f0a6c384 100644
>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>> @@ -159,9 +159,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>        *
>>>        * Unhandled:
>>>        *    MDCCINT_EL1
>>> -     *    DBGDTR_EL0
>>> -     *    DBGDTRRX_EL0
>>> -     *    DBGDTRTX_EL0
>>>        *    OSDTRRX_EL1
>>>        *    OSDTRTX_EL1
>>>        *    OSECCR_EL1
>>> @@ -173,10 +170,32 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>           return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>       case HSR_SYSREG_MDCCSR_EL0:
>>>           /*
>>> +         * Xen doesn't expose a real (or emulated) Debug 
>>> Communications Channel
>>> +         * (DCC) to a domain. Yet the Arm ARM implies this is not an 
>>> optional
>>> +         * feature. So some domains may start to probe it. For 
>>> instance, the
>>> +         * HVC_DCC driver in Linux (since f377775dc083 and at least 
>>> up to v6.7),
>>> +         * will try to write some characters and check if the 
>>> transmit buffer
>>> +         * has emptied.
>>> +         *
>>> +         * By setting TX status bit (only if partial emulation is 
>>> enabled) to
>>> +         * indicate the transmit buffer is full, we would hint the 
>>> OS that the
>>> +         * DCC is probably not working.
>>> +         *
>>> +         * Bit 29: TX full
>>> +         *
>>>            * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We 
>>> emulate that
>>>            * register as RAZ/WI above. So RO at both EL0 and EL1.
>>
>> The sentence "we emulate that register as ..." seems to be stale?
I can see that you tried to handle Julien remark here. But I disagree. This statement
is not stale. It explains that because MDSCR_EL1 is RAZ/WI, MDCCSR_EL0 is RO at both
EL0 and EL1. This patch does not change this behavior.

>>
>>>            */
>>> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, 
>>> hsr, 0,
>>> +                                  partial_emulation ? (1U << 29) : 0);
>>> +
>>> +    case HSR_SYSREG_DBGDTR_EL0:
>>> +    /* DBGDTR[TR]X_EL0 share the same encoding */
>>> +    case HSR_SYSREG_DBGDTRTX_EL0:
>>> +        if ( !partial_emulation )
>>> +            goto fail;
>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>>
>> AFAICT, all the emulation helpers have an explanation why we are using 
>> them. But here this is not the case. Can you add one?
> This and..
>>
>>> +
>>>       HSR_SYSREG_DBG_CASES(DBGBVR):
>>>       HSR_SYSREG_DBG_CASES(DBGBCR):
>>>       HSR_SYSREG_DBG_CASES(DBGWVR):
>>> @@ -394,6 +413,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>        * And all other unknown registers.
>>>        */
>>>       default:
>>> + fail:
>>
>> AFAICT, this would violate MISRA 15.3 [1]. We didn't seem to have yet 
>> (?) accepted the rule, but I don't see we would not given I feel this 
>> is similar to what Rule 16.2 is trying to prevent and we accepted it.
>>
>> I think case, I move all the code within default outside. And then 
>> call "goto fail" from the default label.
> 
> I am not sure if I have interpreted this correctly.
> 
> Is it ok if you can take a look at the attached patch and let me know if 
> the explaination and the code change looks sane ?
Looking at the attached patch and fail handling, I don't think it is what Julien meant.
In the default case you should jump to fail that would be defined outside of switch clause.

Something like:
    default:
        goto fail;
    }

    regs->pc += 4;
    return;

fail:
    gdprintk...

When it comes to explanation for HSR_SYSREG_DBGDTRTX_EL0, I will let Julien to provide a comment he believes is right.
To me, it feels strange to repeat almost the same information as for MDCCSR_EL0.

~Michal

