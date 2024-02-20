Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C585B691
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 10:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683337.1062800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcM35-0001Mt-KE; Tue, 20 Feb 2024 09:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683337.1062800; Tue, 20 Feb 2024 09:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcM35-0001KT-HP; Tue, 20 Feb 2024 09:04:23 +0000
Received: by outflank-mailman (input) for mailman id 683337;
 Tue, 20 Feb 2024 09:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00X/=J5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rcM33-0001KN-U4
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 09:04:21 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061e304c-cfcf-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 10:04:17 +0100 (CET)
Received: from DS7PR03CA0034.namprd03.prod.outlook.com (2603:10b6:5:3b5::9) by
 CY8PR12MB7339.namprd12.prod.outlook.com (2603:10b6:930:51::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.20; Tue, 20 Feb 2024 09:04:14 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:3b5:cafe::f8) by DS7PR03CA0034.outlook.office365.com
 (2603:10b6:5:3b5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Tue, 20 Feb 2024 09:04:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 09:04:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 03:04:09 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 20 Feb 2024 03:04:08 -0600
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
X-Inumbo-ID: 061e304c-cfcf-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tz4ugxHzcmNESCrYdRPAzWsLwc8EQzOePtAbn/ZJpJ04NTANNnXjfZJ7mBfmyAUiSqruJuHk8zBR9epyQsmdGOlLT3bXJe6oMfYNHc2fOz9hPnxw9WDqUwLUPS+u+J7WF9bhMeKy4CxgNdI+BZ5/5kX71ZDd1VixRzhIQ6ogqU9YZfWTqkB63+JyfU9scI9r7zKf92aO4MSItO0CNssh+NtqyUmZAa8iO4dJYxm/OZwHnj9pEUkw/de1JwOx/8s6Dv+Hy4kp2G3pYxEjl7UzCaqDd5p1qXUgBO1ACipvb6SXXzZNVzdaybOBSHl7dYZkyTlsdfaGpjRglglDCNNIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAyCeHGxDJVhPOYZpA+eOHF1amqsieMhyIA/Llp+P6E=;
 b=LwVNYsB7hskSvC7hLjl+xOsj6vXjtc4ql7uVWW4eMe28+5azR4gWkhogNaV1XdcuSartRHC1Y2sis7w46XJBdXE6K4mzih1LfTaYTG2fZSnDPc8W2Q6ZZtRBiV6fV03XUjwiWjQPRffd8HvqlZSPJ0oP4GqIBDB+/0qeKWO2e6vwwrvLAdQiLSnB7N2ZeuMBHmWl25gEPK40HYoCvCRmqz3PnlihoqijxqoSOMhhet52d89RamquI/giuDGbCA2KlpZjsPgA+MFqkBwbWwRFs8NpO4Mgqzbdqn0debVcI0+jB1zTaHDiFZa3GHynr6a3q2QOLT5hg5Pqqxj8rfZHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAyCeHGxDJVhPOYZpA+eOHF1amqsieMhyIA/Llp+P6E=;
 b=nSTbvokvhQQ4Ui+VFNCyPr6Lg9n0DsQ9z++pDr471vBXmiQRb8bHrzANhSw1gOkL7UL4+pVwyTzvZx0epqIXNFeqW/J/1VOg1LpVvYK+exL/igcdSWEu4nRu9YICMw8SuwSu+utvYDeCbt+WRpXb9lowI1taSQwO7xg2wlieGcM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f075513b-877a-42ea-beb2-0eccd64d3ef1@amd.com>
Date: Tue, 20 Feb 2024 10:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<luca.fancellu@arm.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-3-ayan.kumar.halder@amd.com>
 <0c4e4a40-7327-4377-bfdd-82e69bc838ae@xen.org>
 <7098c9ab-7008-4a49-92d4-6cd201b1490e@amd.com>
 <9d1a545c-a93e-4f8e-bc76-0b5676fa01ea@amd.com>
 <aaeca1c4-8898-400f-a608-6ef758ed9d96@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <aaeca1c4-8898-400f-a608-6ef758ed9d96@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CY8PR12MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e6e208-2d20-40f8-6389-08dc31f2e90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dF+03IJYXmGxz4cm5sEeiJZI+ha36E9NIeirbP9S1zYA1l3QoRiq9QiJLPgounfvsDgWVsvI6gTbzsW9eZ3JfLpLVteTZKCx/PaOoInR0G+Tkp74QpQT5jKtWDHa4admCDwI2Ky9g49uSHk8IVMpEXQP+rZc/p6EQZlF+K28vGBG5j2rIkUeZDUzDkQ08CUwTDNDRvkILnptDR3V15fozwr4iYFce3hmGZW8JJ/MwbFVUth9ikKlmCT96IvjFi5J483NxOfBzmHrLP3RJj5utkyHV7Ik5qR7Vc7hgChXZSCLiFGN42beLiGmIQ+mPWCB6yfS3KW9rip922qggwP6akhn4mwrLFXVLfAe7PHV1LD6kEq5Vtbxey3yL87oOXP4Pcnu+SdEDqrh7az1ZTA646gtJftM0oXqnr20JNYx6wgcka0FvGT1J7w7syZ9y5j1dvqRQoOChqJ+Ci05DkU6Y07pMy/qpDFemRWVl2opdUk4UKx/1Q7XJXOaNeewU7WENxw2hUoCu3h5No2Gb8HjOHQA2odS2NHwn6wSdcPyrY8a2/qARFKad0dC9e1V66yLZB3AObUvXupygjeB9d4YBCcDREKWp32THBRPhpHG5J02bxeFY72W6zaKOXa0y6S4Fi3TXnEinATIbn2qXVr/V/H+UeQBxZ+Qp1vjXArDnrM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 09:04:14.0933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e6e208-2d20-40f8-6389-08dc31f2e90f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7339

Hi Julien,

On 19/02/2024 19:48, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 19/02/2024 15:43, Michal Orzel wrote:
> 
>> On 19/02/2024 15:45, Ayan Kumar Halder wrote:
>>>
>>> On 06/02/2024 19:05, Julien Grall wrote:
>>>> Hi Ayan,
>>> Hi Julien/Michal,
>>>>
>>>> On 31/01/2024 12:10, Ayan Kumar Halder wrote:
>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>
>>>>> Currently, if user enables HVC_DCC config option in Linux, it invokes
>>>>> access
>>>>> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64,
>>>>> DBGDTRTXINT on
>>>>> arm32). As these registers are not emulated, Xen injects an undefined
>>>>> exception to the guest and Linux crashes.
>>>>>
>>>>> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
>>>>> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as
>>>>> TXfull.
>>>>>
>>>>> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
>>>>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
>>>>>
>>>>> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
>>>>> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
>>>>> hvc_dcc_check(),
>>>>> and returns -ENODEV in case TXfull bit is still set after writing a test
>>>>> character. This way we prevent the guest from making use of HVC DCC as a
>>>>> console.
>>>>>
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>> Changes from
>>>>>
>>>>> v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving
>>>>> the OS any
>>>>> indication that the RX buffer is full and is waiting to be read.
>>>>>
>>>>> 2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at
>>>>> EL0 only.
>>>>>
>>>>> 3. Fixed the commit message and inline code comments.
>>>>>
>>>>> v2 :- 1. Split the patch into two (separate patches for arm64 and
>>>>> arm32).
>>>>> 2. Removed the "fail" label.
>>>>> 3. Fixed the commit message.
>>>>>
>>>>> v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether
>>>>> partial_emulation_enabled is true or not.
>>>>>
>>>>> 2. If partial_emulation_enabled is false, then access to
>>>>> HSR_SYSREG_DBGDTR_EL0,
>>>>> HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception.
>>>>>
>>>>>    xen/arch/arm/arm64/vsysreg.c         | 28 ++++++++++++++++++++++++----
>>>>>    xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
>>>>>    2 files changed, 27 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>>>>> index b5d54c569b..94f0a6c384 100644
>>>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>>>> @@ -159,9 +159,6 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>>         *
>>>>>         * Unhandled:
>>>>>         *    MDCCINT_EL1
>>>>> -     *    DBGDTR_EL0
>>>>> -     *    DBGDTRRX_EL0
>>>>> -     *    DBGDTRTX_EL0
>>>>>         *    OSDTRRX_EL1
>>>>>         *    OSDTRTX_EL1
>>>>>         *    OSECCR_EL1
>>>>> @@ -173,10 +170,32 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>>            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>>>        case HSR_SYSREG_MDCCSR_EL0:
>>>>>            /*
>>>>> +         * Xen doesn't expose a real (or emulated) Debug
>>>>> Communications Channel
>>>>> +         * (DCC) to a domain. Yet the Arm ARM implies this is not an
>>>>> optional
>>>>> +         * feature. So some domains may start to probe it. For
>>>>> instance, the
>>>>> +         * HVC_DCC driver in Linux (since f377775dc083 and at least
>>>>> up to v6.7),
>>>>> +         * will try to write some characters and check if the
>>>>> transmit buffer
>>>>> +         * has emptied.
>>>>> +         *
>>>>> +         * By setting TX status bit (only if partial emulation is
>>>>> enabled) to
>>>>> +         * indicate the transmit buffer is full, we would hint the
>>>>> OS that the
>>>>> +         * DCC is probably not working.
>>>>> +         *
>>>>> +         * Bit 29: TX full
>>>>> +         *
>>>>>             * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We
>>>>> emulate that
>>>>>             * register as RAZ/WI above. So RO at both EL0 and EL1.
>>>>
>>>> The sentence "we emulate that register as ..." seems to be stale?
>> I can see that you tried to handle Julien remark here. But I disagree. This statement
>> is not stale. It explains that because MDSCR_EL1 is RAZ/WI, MDCCSR_EL0 is RO at both
>> EL0 and EL1. This patch does not change this behavior.
> 
> Indeed. I misread the comment. So what I wrote can be ignored here.
> 
>>
>>>>
>>>>>             */
>>>>> -        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>>>>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read,
>>>>> hsr, 0,
>>>>> +                                  partial_emulation ? (1U << 29) : 0);
>>>>> +
>>>>> +    case HSR_SYSREG_DBGDTR_EL0:
>>>>> +    /* DBGDTR[TR]X_EL0 share the same encoding */
>>>>> +    case HSR_SYSREG_DBGDTRTX_EL0:
>>>>> +        if ( !partial_emulation )
>>>>> +            goto fail;
>>>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
>>>>
>>>> AFAICT, all the emulation helpers have an explanation why we are using
>>>> them. But here this is not the case. Can you add one?
>>> This and..
>>>>
>>>>> +
>>>>>        HSR_SYSREG_DBG_CASES(DBGBVR):
>>>>>        HSR_SYSREG_DBG_CASES(DBGBCR):
>>>>>        HSR_SYSREG_DBG_CASES(DBGWVR):
>>>>> @@ -394,6 +413,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>>         * And all other unknown registers.
>>>>>         */
>>>>>        default:
>>>>> + fail:
>>>>
>>>> AFAICT, this would violate MISRA 15.3 [1]. We didn't seem to have yet
>>>> (?) accepted the rule, but I don't see we would not given I feel this
>>>> is similar to what Rule 16.2 is trying to prevent and we accepted it.
>>>>
>>>> I think case, I move all the code within default outside. And then
>>>> call "goto fail" from the default label.
>>>
>>> I am not sure if I have interpreted this correctly.
>>>
>>> Is it ok if you can take a look at the attached patch and let me know if
>>> the explaination and the code change looks sane ?
>> Looking at the attached patch and fail handling, I don't think it is what Julien meant.
>> In the default case you should jump to fail that would be defined outside of switch clause.
>>
>> Something like:
>>      default:
>>          goto fail;
>>      }
>>
>>      regs->pc += 4;
>>      return;
>>
>> fail:
>>      gdprintk...
> 
> +1.
> 
>>
>> When it comes to explanation for HSR_SYSREG_DBGDTRTX_EL0, I will let Julien to provide a comment he believes is right.
>> To me, it feels strange to repeat almost the same information as for MDCCSR_EL0.
> 
> It is not clear to me whether you are objecting of adding a comment or
> whether you would be ok with a comment that is not duplicating.
Adding a comment is always welcome. I was against duplication.

@Ayan:
Move a paragraph starting with "Xen doesn't expose" above case HSR_SYSREG_MDCCSR_EL0 and leave rest as is.
For HSR_SYSREG_DBGDTRTX_EL0, add sth like:

Emulate as RAZ/WI (only if partial emulation is enabled) to prevent injecting undefined exception.
Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that register as RAZ/WI.

~Michal

