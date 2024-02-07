Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA784CAB7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 13:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677511.1054118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXh2E-000365-AP; Wed, 07 Feb 2024 12:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677511.1054118; Wed, 07 Feb 2024 12:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXh2E-00033y-7O; Wed, 07 Feb 2024 12:28:14 +0000
Received: by outflank-mailman (input) for mailman id 677511;
 Wed, 07 Feb 2024 12:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQwS=JQ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rXh2C-00033m-PP
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 12:28:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b6dba7b-c5b4-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 13:28:11 +0100 (CET)
Received: from [192.168.1.140] (unknown [81.56.166.244])
 by support.bugseng.com (Postfix) with ESMTPSA id C7B3A4EE0738;
 Wed,  7 Feb 2024 13:28:10 +0100 (CET)
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
X-Inumbo-ID: 5b6dba7b-c5b4-11ee-8a49-1f161083a0e0
Message-ID: <f4525632-5874-48f3-8b75-49c328433c43@bugseng.com>
Date: Wed, 7 Feb 2024 13:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 3/4] xen/x86: address violations of MISRA C:2012
 Rule 13.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <16bb514ac0a5fe0d6e9a2c95279a8200ff4495c6.1706886631.git.simone.ballarin@bugseng.com>
 <b23ffbf2-e1b1-42f5-b0ea-9f0889a5a7af@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <b23ffbf2-e1b1-42f5-b0ea-9f0889a5a7af@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/24 14:13, Jan Beulich wrote:
> On 02.02.2024 16:16, Simone Ballarin wrote:
>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>
>> This patch moves expressions with side-effects into new variables before
>> the initializer lists.
>>
>> No functional changes.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> To be honest, I don't like this. It's more code for no gain. Really its
> hampering clarity imo. I'm willing to be convinced otherwise, but for
> now this gets a nack from me.
> 
> As an aside, ...
> 
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -2559,9 +2559,12 @@ integer_param("max_gsi_irqs", max_gsi_irqs);
>>   
>>   static __init bool bad_ioapic_register(unsigned int idx)
>>   {
>> -    union IO_APIC_reg_00 reg_00 = { .raw = io_apic_read(idx, 0) };
>> -    union IO_APIC_reg_01 reg_01 = { .raw = io_apic_read(idx, 1) };
>> -    union IO_APIC_reg_02 reg_02 = { .raw = io_apic_read(idx, 2) };
>> +    uint32_t reg_00_raw = io_apic_read(idx, 0);
>> +    uint32_t reg_01_raw = io_apic_read(idx, 1);
>> +    uint32_t reg_02_raw = io_apic_read(idx, 2);

I'll propose a deviation for these single item initializers.

> 
> ... while you properly use uint32_t here, ...
> 
>> +    union IO_APIC_reg_00 reg_00 = { .raw = reg_00_raw };
>> +    union IO_APIC_reg_01 reg_01 = { .raw = reg_01_raw };
>> +    union IO_APIC_reg_02 reg_02 = { .raw = reg_02_raw };
>>   
>>       if ( reg_00.raw == -1 && reg_01.raw == -1 && reg_02.raw == -1 )
>>       {
>> --- a/xen/arch/x86/mpparse.c
>> +++ b/xen/arch/x86/mpparse.c
>> @@ -798,11 +798,12 @@ void __init mp_register_lapic_address (
>>   
>>   int mp_register_lapic(u32 id, bool enabled, bool hotplug)
>>   {
>> +	u32 apic = apic_read(APIC_LVR);> 
> ... why the being-phased-out u32 here?
> 

It was just to be coherent with the type of id.
I will use uint32_t in the next submission.

> Jan
> 
>>   	struct mpc_config_processor processor = {
>>   		.mpc_type = MP_PROCESSOR,
>>   		/* Note: We don't fill in fields not consumed anywhere. */
>>   		.mpc_apicid = id,
>> -		.mpc_apicver = GET_APIC_VERSION(apic_read(APIC_LVR)),
>> +		.mpc_apicver = GET_APIC_VERSION(apic),
>>   		.mpc_cpuflag = (enabled ? CPU_ENABLED : 0) |
>>   			       (id == boot_cpu_physical_apicid ?
>>   				CPU_BOOTPROCESSOR : 0),
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -885,13 +885,14 @@ static struct domain *__init create_dom0(const module_t *image,
>>   {
>>       static char __initdata cmdline[MAX_GUEST_CMDLINE];
>>   
>> +    unsigned int max_vcpus = dom0_max_vcpus();
>>       struct xen_domctl_createdomain dom0_cfg = {
>>           .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>>           .max_evtchn_port = -1,
>>           .max_grant_frames = -1,
>>           .max_maptrack_frames = -1,
>>           .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>> -        .max_vcpus = dom0_max_vcpus(),
>> +        .max_vcpus = max_vcpus,
>>           .arch = {
>>               .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
>>           },
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


