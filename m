Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBdlEpckumk3SAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 05:05:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3492B5A5D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 05:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256287.1550977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2i9B-0003dr-PI; Wed, 18 Mar 2026 04:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256287.1550977; Wed, 18 Mar 2026 04:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2i9B-0003cI-Ma; Wed, 18 Mar 2026 04:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1256287;
 Wed, 18 Mar 2026 04:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6/lf=BS=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w2i99-0003cC-85
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 04:04:40 +0000
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92175009-227f-11f1-b164-2bf370ae4941;
 Wed, 18 Mar 2026 05:04:37 +0100 (CET)
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fbFYk0CbGz1BFSt
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2026 12:03:38 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.19.162.197])
 by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fbFSC5sDgzpTMG;
 Wed, 18 Mar 2026 11:58:51 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id 19BFD40569;
 Wed, 18 Mar 2026 12:04:15 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Mar 2026 12:04:14 +0800
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
X-Inumbo-ID: 92175009-227f-11f1-b164-2bf370ae4941
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XZKg5HSzqw961TE78Y1nHw4DDOpQ3KVITP3+xW3FZMU=;
	b=tgKSLKH3FRXeuZflU+YmXS6o6Nivgvm0hUbiV+64ojQwdlRuj748sRRNImMTKVJ0zSqQ4mFD9
	vyWfROqFApjH8PJl/yObRR3ZUwmsw9hG0AiTaunIlNM5kOdnbqS/nXO8pxQZ0gDOyc2ERqq/FSD
	tUkS7f1ubwBj8AMZrIXLpUM=
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XZKg5HSzqw961TE78Y1nHw4DDOpQ3KVITP3+xW3FZMU=;
	b=tgKSLKH3FRXeuZflU+YmXS6o6Nivgvm0hUbiV+64ojQwdlRuj748sRRNImMTKVJ0zSqQ4mFD9
	vyWfROqFApjH8PJl/yObRR3ZUwmsw9hG0AiTaunIlNM5kOdnbqS/nXO8pxQZ0gDOyc2ERqq/FSD
	tUkS7f1ubwBj8AMZrIXLpUM=
Message-ID: <0744ee77-78ee-4e3d-9f0d-e8fe44be1c28@huawei.com>
Date: Wed, 18 Mar 2026 12:04:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] ACPI: Refactor get_acpi_id_for_cpu() to
 acpi_get_cpu_uid() on non-x86
From: fengchengwen <fengchengwen@huawei.com>
To: Jeremy Linton <jeremy.linton@arm.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>
CC: <punit.agrawal@oss.qualcomm.com>, <guohanjun@huawei.com>,
	<suzuki.poulose@arm.com>, <ryan.roberts@arm.com>, <chenl311@chinatelecom.cn>,
	<masahiroy@kernel.org>, <wangyuquan1236@phytium.com.cn>,
	<anshuman.khandual@arm.com>, <heinrich.schuchardt@canonical.com>,
	<Eric.VanTassell@amd.com>, <jonathan.cameron@huawei.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <linux-pci@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <xen-devel@lists.xenproject.org>,
	<linux-acpi@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20260313022144.40942-1-fengchengwen@huawei.com>
 <20260313022144.40942-2-fengchengwen@huawei.com>
 <e4b0aefa-7108-47b4-ad5d-d62d385b8f33@arm.com>
 <c9eb7f53-db46-4229-b9ef-8faa1138aca7@huawei.com>
Content-Language: en-US
In-Reply-To: <c9eb7f53-db46-4229-b9ef-8faa1138aca7@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jeremy.linton@arm.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:jonathan.cameron@huawei.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:email,huawei.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9F3492B5A5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sorry to self-reply

On 3/18/2026 10:02 AM, fengchengwen wrote:
> Hi,
> 
> On 3/18/2026 5:38 AM, Jeremy Linton wrote:
>> Hi,
>>
>> Lets try this again, since the last one looks like it got caught in the moderation system and wasn't quite right anyway.
>>
>> On 3/12/26 9:21 PM, Chengwen Feng wrote:
>>> Unify CPU ACPI ID retrieval interface across architectures by
>>> refactoring get_acpi_id_for_cpu() to acpi_get_cpu_uid() on
>>> arm64/riscv/loongarch:
>>> - Add input parameter validation
>>> - Adjust interface to int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
>>>    (old: u32 get_acpi_id_for_cpu(unsigned int cpu), no input check)
>>>
>>> This refactoring (not a pure rename) enhances interface robustness while
>>> preparing for consistent ACPI Processor UID retrieval across all
>>> ACPI-enabled platforms. Valid inputs retain original behavior.
>>>
>>> Note: Move the ARM64-specific get_cpu_for_acpi_id() implementation to
>>>        arch/arm64/kernel/acpi_numa.c to fix compilation errors from
>>>        circular header dependencies introduced by the rename.
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> ---
>>>   arch/arm64/include/asm/acpi.h      | 16 +---------
>>>   arch/arm64/kernel/acpi.c           | 16 ++++++++++
>>>   arch/arm64/kernel/acpi_numa.c      | 14 +++++++++
>>>   arch/loongarch/include/asm/acpi.h  |  5 ---
>>>   arch/loongarch/kernel/acpi.c       |  9 ++++++
>>>   arch/riscv/include/asm/acpi.h      |  4 ---
>>>   arch/riscv/kernel/acpi.c           | 16 ++++++++++
>>>   arch/riscv/kernel/acpi_numa.c      |  9 ++++--
>>>   drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
>>>   drivers/acpi/riscv/rhct.c          |  7 ++++-
>>>   drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>>>   include/linux/acpi.h               | 13 ++++++++
>>>   12 files changed, 122 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
>>> index c07a58b96329..106a08556cbf 100644
>>> --- a/arch/arm64/include/asm/acpi.h
>>> +++ b/arch/arm64/include/asm/acpi.h
>>> @@ -114,22 +114,8 @@ static inline bool acpi_has_cpu_in_madt(void)
>>>   }
>>>     struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu);
>>> -static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
>>> -{
>>> -    return    acpi_cpu_get_madt_gicc(cpu)->uid;
>>> -}
>>> -
>>> -static inline int get_cpu_for_acpi_id(u32 uid)
>>> -{
>>> -    int cpu;
>>> -
>>> -    for (cpu = 0; cpu < nr_cpu_ids; cpu++)
>>> -        if (acpi_cpu_get_madt_gicc(cpu) &&
>>> -            uid == get_acpi_id_for_cpu(cpu))
>>> -            return cpu;
>>>   -    return -EINVAL;
>>> -}
>>> +int get_cpu_for_acpi_id(u32 uid);
>>>     static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>>>   void __init acpi_init_cpus(void);
>>> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
>>> index af90128cfed5..f3866606fc46 100644
>>> --- a/arch/arm64/kernel/acpi.c
>>> +++ b/arch/arm64/kernel/acpi.c
>>> @@ -458,3 +458,19 @@ int acpi_unmap_cpu(int cpu)
>>>   }
>>>   EXPORT_SYMBOL(acpi_unmap_cpu);
>>>   #endif /* CONFIG_ACPI_HOTPLUG_CPU */
>>> +
>>> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
>>> +{
>>> +    struct acpi_madt_generic_interrupt *gicc;
>>> +
>>> +    if (cpu >= nr_cpu_ids)
>>> +        return -EINVAL;
>> If this actually happens, its probably useful to know it with a pr_warn/pr_warn_once.> +
> 
> The function maybe called from userspace which on later roadmap, so I prefer not add
> warning or error here.
> BTW: the function will return -EINVAL, so caller could know the case.
> 
>>> +    gicc = acpi_cpu_get_madt_gicc(cpu);
>>> +    if (!gicc)
>> I think this check is redundant because we can't have logical cpu's that aren't in the cpu_possible() list, which on arm64 doesn't AFAIK have holes. In the past this might have made sense if we weren't maintaining a copy of the gicc structure from the MADT for each core.> +        return -ENODEV;
> 
> This commit will backport to stable branch at least 6.6. So I think it's OK to keep it.
> 
>>> +
>>> +    *uid = gicc->uid;
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
>>> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
>>> index 2465f291c7e1..41d1e46a4338 100644
>>> --- a/arch/arm64/kernel/acpi_numa.c
>>> +++ b/arch/arm64/kernel/acpi_numa.c
>>> @@ -34,6 +34,20 @@ int __init acpi_numa_get_nid(unsigned int cpu)
>>>       return acpi_early_node_map[cpu];
>>>   }
>>>   +int get_cpu_for_acpi_id(u32 uid)
>>> +{
>>> +    u32 cpu_uid;
>>> +    int ret;
>>> +
>>> +    for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
>>> +        ret = acpi_get_cpu_uid(cpu, &cpu_uid);
>> This might have been a simplification, but since we are basically doing a for_each_possible_cpu(cpu) and every possible cpu will have a GICC entry before it becomes 'possible' there will be a UID, so all the error checking AFAIK, is impossible here.> +        if (ret == 0 && uid == cpu_uid)
> 
> I prefer to keep the current impl, as it may catch future error.
> 
>>> +            return cpu;
>>> +    }
>>> +
>>> +    return -EINVAL;
>>> +}
>>> +
>> I also moved this below acpi_get_cpu_uid() in acpi.c and I don't see the a forward error issue you mentioned. It seems to me that they should be kept close to each other since they are basically inverses of each other.
> 
> As long as you ensure that it is not placed in asm/acpi.h, that's fine.
> So it's OK to move this function to acpi.c
> 
> But I just checked the callers of this function again and found that there are
> all in acpi_numa.c, so I will now add the static keyword to this function and
> make it an internal function.

I just found drivers/irqchip/irq-gic-v3.c has a call for get_cpu_for_acpi_id,
so We should not marking as static.

According to your advise, I moved it in acpi.c in v8.

Thanks

> 
> Thanks
> 
>>
> 


