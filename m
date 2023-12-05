Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00509804DD5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 10:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647500.1010673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rARjj-0004Lm-S9; Tue, 05 Dec 2023 09:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647500.1010673; Tue, 05 Dec 2023 09:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rARjj-0004JP-PP; Tue, 05 Dec 2023 09:29:03 +0000
Received: by outflank-mailman (input) for mailman id 647500;
 Tue, 05 Dec 2023 09:29:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibAO=HQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rARji-0004JI-8E
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 09:29:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e88::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b736df63-9350-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 10:28:58 +0100 (CET)
Received: from BL0PR0102CA0013.prod.exchangelabs.com (2603:10b6:207:18::26) by
 SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 09:28:56 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::5a) by BL0PR0102CA0013.outlook.office365.com
 (2603:10b6:207:18::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 09:28:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 09:28:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 03:28:49 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 03:28:26 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 5 Dec 2023 03:28:24 -0600
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
X-Inumbo-ID: b736df63-9350-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cONGvRPHnyBpBCvvll0wc2MW15pL2VkCN0Kt+t+TL8/1JtdXYvhUx16P5fU8TAavJ0zhTeJCgbLjwrRBJaLtO2Kc4B4dCX1gd+0E1Sx02QKAEW6ZQBu6S+f1ZY77we/zQQ+AkU/9x/aclao4RJPPl8AMuSbnT07KF++txeQd3OO5svTmzmUCct1TnM2cRokVeYdrvS+0Yj6cg0VUKYx9MW++mJ4CgY+SqbPutDUOoXTKccEO40Da2gz24BsZI7VfrAZPZnCHQide8PQyMFuVzemf/UCdrGKmBGh0Z7EucDolYtFxbtuWvYwmztkHsTdODd/rVtxjnhzaAk3iDpgNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq/eWD7ZR+Cw6TfOCj2wmsrt2b/CaEMZES+ozWudqqc=;
 b=oTvWk6tRu4e1fm1k/dmgy/JOvggsA+1aUOAOtj7qj/b9hBHVo8Fk6KirzZ/qoXP+1YSAgOoOLN9BtO+RaocqUAFbyz5S9HLBSKe9leuIUbsWftmfEHv3CNpYTn4B807JHmlkU+69tduBTa3QWZmYXmdSHe0DUJ7B4+pfDNO9WZ+jNYf/YnJKWvIJGNA96EWYj4mQ5n9cgcisMXwE6ByXtAosyOuNISg3WlFpxoH92JnXqUi4IBVGUeEN/XO6Hblo3EFS09i4M5p8kg6duZECAZaV29IEyLVL9EsrCRzCWIgYcdwTalXmuhwvLXpYp1nR9g3IY+UWwGR2Y2dnQD9a8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dq/eWD7ZR+Cw6TfOCj2wmsrt2b/CaEMZES+ozWudqqc=;
 b=bWuE9Ryk2lEGCa0VHg3IGyQdXMYgeRRErK+RdjsHuFZtAzNd5MDz+1Z+olQVWn6TdXnsxmUVvK2jtT5Sre7scOellbRE6QHWyFT6zEUmZkUuqi2yrwrPDfgTVFYjmHsAsx8iLV4zsoDGSUzchuWJs2bEO5xPbA+XImLQdkCouEw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
Date: Tue, 5 Dec 2023 10:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<stefano.stabellini@amd.com>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>
CC: <xen-devel@lists.xenproject.org>
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
 <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
 <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SA0PR12MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fa365c-3e38-4e60-8824-08dbf5749a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RLXMm4PFZxzCALMiPbfB4F2e83ZLWN46OF7QpRuUn8rEC7eQdZLEuiYxoI7La1ja9W4rY4ZCRSO5X5KuOv2cejivfpmkeRyXsQ5goSU3Smfw61k8LWKsMgYDh4hIUhL+L5++5I9N7s8m+KyplFmf9byioFHi/U3Em4XzPbc6JoL1GxYoYw/BZg/vAzXJrIAsxMUCDCavA2pwaDyTR33KEY2YUKQ9ztubHnmwytsu9qOssKMb5IENU8MwaaV2HAb/dIS9lQ6pCLoM9wXVCg2M4mMlj/VGDKfh1eizvtbeB4BiKHTka+huF6oMk6oxY+eoi92H7lqygewKn8M9XiNsBL9Fb4zl9syBsrOj+QwcU1HBN3gstZcN4xW+9fgrcwVobc+4FDSvn0aQ/TXgAMvxJ4OL9br1f6P3CGI7GiVrt/aoPLNFpj+2oUVa9/AkVyYZm9DUmRNfo55MODFbDcp88YbR7JPnPIpDBYathlhdDkCtmwNMeXaAzEN6QtuBF3cbq+XPIdMy9MoLkcoLT7PEgXb3ijt+nqRys5rXmTR7tIt6kwQPP3APT3ozoKi09dS+DUSIxpnAaYUpZNn2G3B/o2b/Zmew8JCB5c6DILVkzJPY30VM470ErNkUFjFaYJSCnPxxBwGWNseOU3WVwYYzpz4p7paVbr71ifzxjBvMZkvDexMZfapuc9BghOPRoz0J0sQdnCIdPHNbL/Ju4Gr0jZZ8FUh8LRZoBtrY+emovi7+djj6mwzlS9J7pZZh6ChNbE91RE2z75fXGzjLCifk4O83CqWvt527xLWmAhjgdMxVxa5vDVVrUpxK4wVIutQQuELpdmSq340m+1lV7L1r2euetXFUdVVtXWzvIts+dCbyfjc8IQXJt6TVjlsZhCju
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230173577357003)(230273577357003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(26005)(40480700001)(82740400003)(81166007)(356005)(83380400001)(336012)(426003)(36756003)(36860700001)(47076005)(53546011)(41300700001)(2616005)(31686004)(6666004)(40460700003)(2906002)(31696002)(86362001)(44832011)(16576012)(70206006)(70586007)(110136005)(5660300002)(316002)(8936002)(478600001)(8676002)(4326008)(2101003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 09:28:55.3397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fa365c-3e38-4e60-8824-08dbf5749a22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7091

Hi Julien,

On 04/12/2023 20:55, Julien Grall wrote:
> 
> 
> On 04/12/2023 13:02, Ayan Kumar Halder wrote:
>>
>> On 04/12/2023 10:31, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 01/12/2023 18:50, Ayan Kumar Halder wrote:
>>>> Currently if user enables HVC_DCC config option in Linux, it invokes
>>>> access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
>>>> DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
>>>> an undefined exception to the guest. And Linux crashes.
>>>
>>> I am missing some data points here to be able to say whether I would
>>> be ok with emulating the registers. So some questions:
>>>   * As you wrote below, HVC_DCC will return -ENODEV after this
>>> emulation. So may I ask what's the use case to enable it? (e.g. is
>>> there a distro turning this on?)
>>
>> I am not aware of any distro using (or not using) this feature. This
>> issue came to light during our internal testing, when HVC_DCC was
>> enabled to use the debug console. When Linux runs without Xen, then we
>> could observe the logs on the debug console. When Linux was running as a
>> VM, it crashed.
>>
>> My intention here was to do the bare minimum emulation so that the crash
>> could be avoided.
> This reminds me a bit the discussion around "xen/arm64: Decode ldr/str
> post increment operations". I don't want Xen to contain half-backed
> emulation just to please an OS in certain configuration that doesn't
> seem to be often used.
> 
> Also, AFAICT, KVM is in the same situation...
Well, KVM is not in the same situation. It emulates all DCC regs as RAZ/WI, so there
will be no fault on an attempt to access the DCC.

In general, I think that if a register is not optional and does not depend on other register
to be checked first (e.g. a feature/control register we emulate), which implies that it is fully ok for a guest to
access it directly - we should at least try to do something not to crash a guest.

I agree that this feature is not widely used. In fact I can only find it implemented in Linux and U-BOOT
and the issue I found in DBGDSCRINT (no access from EL0, even though we emulate REXT.UDCCdis as 0) only
proves that. At the same time, it does not cost us much to add this trivial support.

> 
> Given this is internal testing, have you considered to ask them to
> disable HVC_DCC?
> 
>>
>>>  * Linux is writing to the registers unconditionally, but is the spec
>>> mandating the implementation of the registers? (I couldn't find either
>>> way)
>>
>>  From ARM DDI 0487I.a ID081822, H1.2, External debug,
>>
>> "The Debug Communications Channel, DCC, passes data between the PE and
>> the debugger:
>>
>> — The DCC includes the data transfer registers, DTRRX and DTRTX, and
>> associated flow-control flags.
>>
>> — Although the DCC is an essential part of Debug state operation, it can
>> also be used in Non-debug state."
>>
>>  From this I infer that the spec mandates the implementation of these
>> registers. IOW, these registers should always be present in any Arm
>> compliant SoC.
>>
>>>  * When was this check introduced in Linux? Did it ever changed?
>>>
>> This check was introduced in the following commit
>>
>> "commit f377775dc083506e2fd7739d8615971c46b5246e
>> Author: Rob Herring <rob.herring@calxeda.com>
>> Date:   Tue Sep 24 21:05:58 2013 -0500
>>
>>      TTY: hvc_dcc: probe for a JTAG connection before registering
>>
>>      Enabling the ARM DCC console and using without a JTAG connection will
>>      simply hang the system. Since distros like to turn on all options,
>> this
>>      is a reoccurring problem to debug. We can do better by checking if
>>      anything is attached and handling characters. There is no way to probe
>>      this, so send a newline and check that it is handled.
>> "
> 
> I think this is the part I was missing from the commit message. I have
> proposed some wording below.
> 
>>
>> As of today, this check hasn't changed.
>>
>>>>
>>>> We wish to avoid this crash by adding a "partial" emulation. DBGDTR_EL0
>>>> is emulated as TXfull | RXfull.
>>>
>>> Skimming through the Arm Arm, I see that TXfull and Rxfull indicates
>>> that both buffers are full but it doesn't explicitly say this means
>>> the feature is not available.
>> We are not saying that the feature is not available. Rather ...
>>>
>>> I understand this is what Linux checks, but if we want to partially
>>> emulate the registers in Xen, then I'd like us to make sure this is
>>> backed by the Arm Arm rather than based on Linux implementation (which
>>> can change at any point).
>>>
>>>> Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0
>>>> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"
>>>> Also D17.3.7 DBGDTRRX_EL0,
>>>> " If RXfull is set to 1, return the last value written to DTRRX."
>>>>
>>>> Thus, any OS is expected to read DBGDTR_EL0 and check for TXfull
>>>> before using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
>>>> hvc_dcc_check() , it returns -ENODEV. In this way, we are preventing
>>>> the guest to be aborted.
>>>
>>> See above, what guarantees us that Linux will not change this behavior
>>> in the future?
>>
>> If I understand "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"
>> correctly, it seems that Arm ARM expects OS to check for TXfull.
>>
>> If the condition is true, it should return some error.
>>
>> Let me know if I misunderstood this.
> 
> You understand the Arm spec correcly. I think we are disagreeing on the
> wording and whether we should accept basic emulation (see above).
> 
> I would like more opinion on that.
> 
> [...]
> 
>>>> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
>>>> index 39aeda9dab..3f1276f96e 100644
>>>> --- a/xen/arch/arm/vcpreg.c
>>>> +++ b/xen/arch/arm/vcpreg.c
>>>> @@ -548,20 +548,37 @@ void do_cp14_32(struct cpu_user_regs *regs,
>>>> const union hsr hsr)
>>>>           break;
>>>>       }
>>>>   -    case HSR_CPREG32(DBGDSCRINT):
>>>> +    case HSR_CPREG32(DBGDSCREXT):
>>>> +    {
>>>>           /*
>>>> -         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
>>>> -         * is set to 0, which we emulated below.
>>>> +         * Bit 29: TX full, bit 30: RX full
>>>> +         * Given that we emulate DCC registers as RAZ/WI, doing the
>>>> same for
>>>> +         * DBGDSCRint would cause a guest to continue using the DCC
>>>> despite no
>>>> +         * real effect. Setting the TX/RX status bits should result
>>>> in a probe
>>>> +         * fail (based on Linux behavior).
>>> If you want to mention Linux then you need to be a bit more specific
>>> because Linux can change at any point. So you at least want to specify
>>> the Linux version and place in the code.
>>>
>>> So this doesn't get stale as soon as the HVC_DCC driver changes.
>>
>> (based on Linux behavior since f377775dc083).
> 
> Base on the discussion above, I would like to suggest the following:
> 
> Xen doesn't expose a real (or emulated) Debug Communications Channel
> (DCC) to a domain. Yet the Arm Arm implies this is not an optional
> feature. So some domains may start to probe it. For instance, the
> HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
> will try to write some characters and check if the transmit buffer has
> emptied. By setting TX status bit to indicate the transmit buffer is
> full. This we would hint the OS that the DCC is probably not working.
> 
> This would give enough information for the reader to know what's going
> and how you emulate.
> 
> Also, while writing the proposed comment, I wonder why we need to set
> RX? Wouldn't this potentially indicate to the OS that there are some
> data to read?
You're right. No need for that.

~Michal

