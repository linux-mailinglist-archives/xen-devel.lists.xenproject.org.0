Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC890FDC3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 09:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744237.1151257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCFW-0003CD-1s; Thu, 20 Jun 2024 07:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744237.1151257; Thu, 20 Jun 2024 07:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCFV-00039E-Ul; Thu, 20 Jun 2024 07:30:25 +0000
Received: by outflank-mailman (input) for mailman id 744237;
 Thu, 20 Jun 2024 07:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKCFU-000398-EC
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 07:30:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f46b24f2-2ed6-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 09:30:23 +0200 (CEST)
Received: from [192.168.1.113] (93-36-220-117.ip62.fastwebnet.it
 [93.36.220.117])
 by support.bugseng.com (Postfix) with ESMTPSA id 3EF194EE0738;
 Thu, 20 Jun 2024 09:30:22 +0200 (CEST)
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
X-Inumbo-ID: f46b24f2-2ed6-11ef-90a3-e314d9c70b13
Message-ID: <2072bf59-f125-4789-be77-40ed3641aec4@bugseng.com>
Date: Thu, 20 Jun 2024 09:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen: add explicit comment to identify notifier
 patterns
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
References: <d814434bf73e341f5d35836fa7063a728f7b7de4.1718788908.git.federico.serafini@bugseng.com>
 <f7d46c15-ff85-4a6f-afd7-df18649726c8@xen.org>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <f7d46c15-ff85-4a6f-afd7-df18649726c8@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/06/24 13:17, Julien Grall wrote:
> Hi Federico,
> 
> On 19/06/2024 10:29, Federico Serafini wrote:
>> MISRA C Rule 16.4 states that every `switch' statement shall have a
>> `default' label" and a statement or a comment prior to the
>> terminating break statement.
>>
>> This patch addresses some violations of the rule related to the
>> "notifier pattern": a frequently-used pattern whereby only a few values
>> are handled by the switch statement and nothing should be done for
>> others (nothing to do in the default case).
>>
>> Note that for function mwait_idle_cpu_init() in
>> xen/arch/x86/cpu/mwait-idle.c the /* Notifier pattern. */ comment is
>> not added: differently from the other functions covered in this patch,
>> the default label has a return statement that does not violates Rule 
>> 16.4.
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>> Changes in v2:
>> as Jan pointed out, in the v1 some patterns were not explicitly 
>> identified
>> (https://lore.kernel.org/xen-devel/cad05a5c-e2d8-4e5d-af05-30ae6f959184@bugseng.com/).
>>
>> This version adds the /* Notifier pattern. */ to all the pattern 
>> present in
>> the Xen codebase except for mwait_idle_cpu_init().
>> ---
>>   xen/arch/arm/cpuerrata.c                     | 1 +
>>   xen/arch/arm/gic-v3-lpi.c                    | 4 ++++
>>   xen/arch/arm/gic.c                           | 1 +
>>   xen/arch/arm/irq.c                           | 4 ++++
>>   xen/arch/arm/mmu/p2m.c                       | 1 +
>>   xen/arch/arm/percpu.c                        | 1 +
>>   xen/arch/arm/smpboot.c                       | 1 +
>>   xen/arch/arm/time.c                          | 1 +
>>   xen/arch/arm/vgic-v3-its.c                   | 2 ++
>>   xen/arch/x86/acpi/cpu_idle.c                 | 4 ++++
>>   xen/arch/x86/cpu/mcheck/mce.c                | 4 ++++
>>   xen/arch/x86/cpu/mcheck/mce_intel.c          | 4 ++++
>>   xen/arch/x86/genapic/x2apic.c                | 3 +++
>>   xen/arch/x86/hvm/hvm.c                       | 1 +
>>   xen/arch/x86/nmi.c                           | 1 +
>>   xen/arch/x86/percpu.c                        | 3 +++
>>   xen/arch/x86/psr.c                           | 3 +++
>>   xen/arch/x86/smpboot.c                       | 3 +++
>>   xen/common/kexec.c                           | 1 +
>>   xen/common/rcupdate.c                        | 1 +
>>   xen/common/sched/core.c                      | 1 +
>>   xen/common/sched/cpupool.c                   | 1 +
>>   xen/common/spinlock.c                        | 1 +
>>   xen/common/tasklet.c                         | 1 +
>>   xen/common/timer.c                           | 1 +
>>   xen/drivers/cpufreq/cpufreq.c                | 1 +
>>   xen/drivers/cpufreq/cpufreq_misc_governors.c | 3 +++
>>   xen/drivers/passthrough/x86/hvm.c            | 3 +++
>>   xen/drivers/passthrough/x86/iommu.c          | 3 +++
>>   29 files changed, 59 insertions(+)
>>
>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>> index 2b7101ea25..69c30aecd8 100644
>> --- a/xen/arch/arm/cpuerrata.c
>> +++ b/xen/arch/arm/cpuerrata.c
>> @@ -730,6 +730,7 @@ static int cpu_errata_callback(struct 
>> notifier_block *nfb,
>>           rc = enable_nonboot_cpu_caps(arm_errata);
>>           break;
>>       default:
>> +        /* Notifier pattern. */
> Without looking at the commit message (which may not be trivial when 
> committed), it is not clear to me what this is supposed to mean. Will 
> there be a longer explanation in the MISRA doc? Should this be a SAF-* 
> comment?
> 
>>           break;
>>       }
>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>> index eb0a5535e4..4c2bd35403 100644
>> --- a/xen/arch/arm/gic-v3-lpi.c
>> +++ b/xen/arch/arm/gic-v3-lpi.c
>> @@ -389,6 +389,10 @@ static int cpu_callback(struct notifier_block 
>> *nfb, unsigned long action,
>>               printk(XENLOG_ERR "Unable to allocate the pendtable for 
>> CPU%lu\n",
>>                      cpu);
>>           break;
>> +
>> +    default:
>> +        /* Notifier pattern. */
>> +        break;
> 
> Skimming through v1, it was pointed out that gic-v3-lpi may miss some 
> cases.
> 
> Let me start with that I understand this patch is technically not 
> changing anything. However, it gives us an opportunity to check the 
> notifier pattern.
> 
> Has anyone done any proper investigation? If so, what was the outcome? 
> If not, have we identified someone to do it?
> 
> The same question will apply for place where you add "default".

Yes, I also think this could be an opportunity to check the pattern
but no one has yet been identified to do this.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

