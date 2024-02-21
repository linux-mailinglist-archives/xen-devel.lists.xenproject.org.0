Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9611785DCE6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 14:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684050.1063710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcn7N-0001AV-3V; Wed, 21 Feb 2024 13:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684050.1063710; Wed, 21 Feb 2024 13:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcn7N-00017k-0j; Wed, 21 Feb 2024 13:58:37 +0000
Received: by outflank-mailman (input) for mailman id 684050;
 Wed, 21 Feb 2024 13:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOnV=J6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rcn7L-00017e-8o
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 13:58:35 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4beb73af-d0c1-11ee-8a53-1f161083a0e0;
 Wed, 21 Feb 2024 14:58:33 +0100 (CET)
Received: from BN9PR03CA0711.namprd03.prod.outlook.com (2603:10b6:408:ef::26)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Wed, 21 Feb
 2024 13:58:29 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::41) by BN9PR03CA0711.outlook.office365.com
 (2603:10b6:408:ef::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.41 via Frontend
 Transport; Wed, 21 Feb 2024 13:58:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 21 Feb 2024 13:58:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 07:58:27 -0600
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 21 Feb 2024 07:58:26 -0600
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
X-Inumbo-ID: 4beb73af-d0c1-11ee-8a53-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAF9PYEi0uN3wGf2YI5U+isAWoDhpDIm+VM+W6fPQLNMSf53ldXUTUqD93Kfd5XykYjtA0EvlXIIxZzdunrpYqmczJQBUqIQqVld2IwB/ExRI4EoARCTnd+l0qrJUxkPDIgLjbxhoZS0+czavWcABjlJlARGs2HJy4YuIvPWcFRP6sevCZAxvF1dD/t0IJ8choJPQNMCRXu/fTyAZY2YDK6fzozJ5EgTe8R1Hohc0OGpf9bwjFEjWjrIZ6VMVrqsdCRsfMdntc624lxKhicDZtZi5Wavyx9DoksSMBS/qvTj9UYkmGwYFxkWwlcYOT3Vo2ZZ+d4tiDsdY7V2T/KrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgWEbqC/1v7O6VAUqDSFOH2ByYy2Epr0gQSCvExcFtU=;
 b=MWSXsHtOZmmRRSisUMfV2nAWiHDmIgJUVvvu3+PJ4tz8Jv0x8JZinTibg8sBfElM+5Ij9SFGUvFqQShdqHRluOM7pHFXmYX0TZyEKcUKVFYpEWvDtp/6i8KAWQlC8GJXDauPu2gPcIWGT6JUpeVau8CAkaVxL7GG0f3lwev+ACCMr8xJu9qXupdonM1OOIiiCt2ZMij5cDrnR/hjRvae32AA4S4ySWElKCpd+lor6N9Uaq8P/vvQ9B1efatE3QyQ8uIdDIhVg+ULRnwOZF94FIKQQhK8hHymlFPb+HQh5TYcg5HKS+I8PtNQyWIshlShU6FN9vr9VF8SVvFP8xIg0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgWEbqC/1v7O6VAUqDSFOH2ByYy2Epr0gQSCvExcFtU=;
 b=u1M+N2p1EsHw7ouclZrGwRHEvHu5yOpXs7d+D1wxe3gSv14fPWFwTUdVrVNdZN0s/LimfM8YpM1MBvEaZK2BY0bxPy+njbDYxHQdLexpu6L8JX3ust6vnyKscjIh25V8I8H9YudyEkGhI8WmwfCEYNvo1EPQRf+DQJgAcwsG5+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <32d9736e-965a-451f-9227-f774c20df215@amd.com>
Date: Wed, 21 Feb 2024 14:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v5 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
 <20240220121743.3680715-2-ayan.kumar.halder@amd.com>
 <e3a8ce5d-841e-4ff1-8d23-48de822972ef@suse.com>
 <5f526deb-7376-4c34-85d1-d22b1b14d90e@amd.com>
 <e7c4b08f-724a-4419-977a-caa1342c47eb@suse.com>
 <62e047c5-a913-410d-9b24-e9a26d555d78@amd.com>
 <10e8a485-61b7-4c9d-930f-975e25e8ec45@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <10e8a485-61b7-4c9d-930f-975e25e8ec45@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 420bcb25-32b7-4c8d-3fa7-08dc32e52e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XcRAhjFb1GTzwhVdx4E4uIGXy0EtBzzo0qE+JMcsktBjJBn+6aezMC/Qgam9DTTvnHVnP3YsxC+PyP9ZRaPvD+rW3fG4WJR6mFb2hQHOjKXR+r4F+Xel+PkTwoaYT3q4RH7d/THe6R66PGxIrj0gOxQWB8OQ+i2sR3rcM5mQ6SLbtiZ9bL3mhiuVC9OyDp2Gt8+purUnSjx0eB3T9fLLBWZIG3w8m/PPwdFBa9RQCIuhNJgJBRkkd3okmJQ95qy9zNxDrp+BXEkHHwWFbK5XMcvbR876NaaBBwOachfIythNNhapHtIhsK2B4L9cgocEpIr34ktiec4NMvq0UUb02jIFFzoLlqpwmgrhS+x2BPwON7GOm+5fCP9Eha6Wg72MbJcMgIU9+RJ8z3Uo1+cSoCG6kHzcbQRO0BzWM+0eYrOgqbk69lTyBqCWxVdhtoy+8pB7ID0TRQaII35odPOb33Kp3OFyRGBkGXgum+kN2K4npl5KPG1+kggopV6F9qNR0eGx+ahyuYT+v5xFLkaatZ5OVguLWOLpqPTjyJB7pX+19nsJ2MfUV1i3NCRv/kD/JQOXdo1JJYYBmAtq4ejzrhcGC5XYVWfSvwWY0znjPC4xsgjcf9iMNxS28PGYLIq0ChD45QsSdwVQ5NjNLLpzcQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 13:58:28.3702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420bcb25-32b7-4c8d-3fa7-08dc32e52e39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446



On 21/02/2024 13:20, Julien Grall wrote:
> 
> 
> On 21/02/2024 11:33, Ayan Kumar Halder wrote:
>> Hi Jan,
>>
>> On 21/02/2024 07:09, Jan Beulich wrote:
>>> On 20.02.2024 16:22, Ayan Kumar Halder wrote:
>>>> On 20/02/2024 12:33, Jan Beulich wrote:
>>>>> On 20.02.2024 13:17, Ayan Kumar Halder wrote:
>>>>>> --- a/SUPPORT.md
>>>>>> +++ b/SUPPORT.md
>>>>>> @@ -101,6 +101,18 @@ Extension to the GICv3 interrupt controller to
>>>>>> support MSI.
>>>>>>        Status: Experimental
>>>>>> +### ARM/Partial Emulation
>>>>>> +
>>>>>> +Enable partial emulation of registers, otherwise considered
>>>>>> unimplemented,
>>>>>> +that would normally trigger a fault injection.
>>>>>> +
>>>>>> +    Status: Supported, with caveats
>>>>>> +
>>>>>> +Bugs allowing the userspace to attack the guest OS will not be
>>>>>> considered
>>>>>> +security vulnerabilities.
>>>>>> +
>>>>>> +Bugs that could compromise Xen will be considered security
>>>>>> vulnerabilities.
>>>>> ... the odd statement regarding in-guest vulnerabilities that might be
>>>>> introduced. I see only two ways of treating this as supported: Either
>>>>> you simply refuse emulation when the access is from user space,
>>>> I am wondering how do we enforce that.
>>>>
>>>> Let me try to understand this with the current implementation of partial
>>>> emulation for system registers.
>>>>
>>>> 1. DBGDTRTX_EL0 :- I understand that EL0 access to this register will
>>>> cause a trap to EL2. The reason being MDCR_EL2.TDA == 1.
>>>>
>>>> In that case, if we refuse emulation then an undef exception is injected
>>>> to the guest (this is the behavior as of today even without this patch).
>>>>
>>>> So, are you saying that the undef exception is to be injected to the
>>>> user space process. This may be possible for Arm64 guests
>>>> (inject_undef64_exception() needs to be changed).
>>> No, injection is always to the guest, not to a specific entity within the
>>> guest. That ought to be the same on bare hardware: An exception when
>>> raised has an architecturally defined entry point for handling. That'll
>>> typically be kernel code. The handler then figures out whether the source
>>> of the exception was in user or kernel mode. For user mode code, the
>>> kernel may or may not try to handle the exception and then continue the
>>> user mode process. If it can't or doesn't want to handle it, it'll raise
>>> (in UNIX terms) a signal to the process. That signal, in turn, may or may
>>> not be fatal to the process. But such an exception from user mode should
>>> never be fatal to the guest as a whole.
>> Thanks for explaining it so well.
>>>
>>>> However for Arm32 guests, this may not be possible as the mode changes
>>>> to PSR_MODE_UND.
>>> I'm afraid my Arm foo isn't good enough to understand this. On the
>>> surface
>>> it looks to violate above outlined principle.
>>>
>>>> Let me know if I understood you correctly.
>>>>
>>>>> or you
>>>>> support that mode of emulation as much as that of kernel space
>>>>> accesses.
>>>> Do you mean we support partial emulation only for traps from EL1 mode ?
>>> Possibly.
>>
>> Now, I understand you. We will allow partial_emulation only from kernel
>> mode.
>>
>> So we need to do sth :-
>>
>> if ( 'partial_emulation == true' && '!regs_mode_is_user(regs)' )
>>
>> {
>>
>>       /* partial_emulation logic */
>>
>> }
>>
>> I am ok with this.
> 
> The helpers take a min_el. So you can have simpler code and set the
> value to 1 (rather than 0 today).
> 
>>
>> And the updates message will be
>>
>> ### ARM/Partial Emulation
>>
>> Enable partial emulation of registers, otherwise considered unimplemented,
>> that would normally trigger a fault injection.
>>
>>      Status: Supported, with caveats
>>
>> Partial emulation for traps from userspace is not allowed.
> 
> I am not sure how this helps...
>>
>> Bugs that could compromise Xen will be considered security vulnerabilities.
> 
> ... you are still implying that any userland breaching the kernel will
> not be supported because of a bug.
> 
> But, I don't see how preventing the userland to access a register will
> help. In theory you could have a register that can only be accessed by
> EL1 but has an impact to EL0.
> 
> By definition, it means that we don't faithfully follow the Arm Arm and
> anything can happen. Which is why I wanted to exclude security support
> from userland and kernel.
> 
> I think the current registers are low risk. But I am under the
> impression that you may wan to add more partial emulation. So we need to
> make some sort of statement that doesn't put any burden to the security
> team for future registers.
> 
> An option would be to explicitly list the registers in SUPPORT.md. As I
> mentioned above, I think the registers you currently emulate are
> low-risk to introduce a security bug. So I would be ok to fully security
> support them. This would need to be re-assessed for new registers.
> 
> I am open to other suggestions.
+1. Providing partial emulation support only for kernel mode where the Arm ARM allows for user mode
access is confusing and would require excessive number of comments to back up the implementation.
While it might be ok for DCC, imposing such limit on all the future use cases sounds too severe.

I think the following would be ok:

Status: Supported, with caveats

Only the following system registers are security supported:
 - ...

~Michal


