Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0644D6B9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 13:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224745.388223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml9MX-0005PJ-4u; Thu, 11 Nov 2021 12:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224745.388223; Thu, 11 Nov 2021 12:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml9MX-0005Lv-1l; Thu, 11 Nov 2021 12:39:29 +0000
Received: by outflank-mailman (input) for mailman id 224745;
 Thu, 11 Nov 2021 12:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GNk8=P6=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1ml9MV-0005Lp-3R
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 12:39:27 +0000
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67882624-42ec-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 13:39:25 +0100 (CET)
Received: from [193.180.18.161] (port=36378 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <josef@oderland.se>)
 id 1ml9MS-00754Y-HK; Thu, 11 Nov 2021 13:39:24 +0100
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
X-Inumbo-ID: 67882624-42ec-11ec-a9d2-d9f7a1cc8784
Message-ID: <132343df-df01-6ab6-bdaf-cd1605028bfc@oderland.se>
Date: Thu, 11 Nov 2021 13:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: [PATCH] x86/smp: Factor out parts of native_smp_prepare_cpus()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, jgross@suse.com
References: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>
 <6a7edbff-e255-661d-c68f-c07b7519e421@oderland.se>
 <YYztW7bytZdvZFbN@hirez.programming.kicks-ass.net>
From: Josef Johansson <josef@oderland.se>
In-Reply-To: <YYztW7bytZdvZFbN@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - office.oderland.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oderland.se
X-Get-Message-Sender-Via: office.oderland.com: authenticated_id: josjoh@oderland.se
X-Authenticated-Sender: office.oderland.com: josjoh@oderland.se

On 11/11/21 11:15, Peter Zijlstra wrote:
> On Wed, Nov 10, 2021 at 10:52:09PM +0100, Josef Johansson wrote:
>> On 11/3/21 00:36, Boris Ostrovsky wrote:
>>> Commit 66558b730f25 ("sched: Add cluster scheduler level for x86")
>>> introduced cpu_l2c_shared_map mask which is expected to be initialized
>>> by smp_op.smp_prepare_cpus(). That commit only updated
>>> native_smp_prepare_cpus() version but not xen_pv_smp_prepare_cpus().
>>> As result Xen PV guests crash in set_cpu_sibling_map().
>>>
>>> While the new mask can be allocated in xen_pv_smp_prepare_cpus() one can
>>> see that both versions of smp_prepare_cpus ops share a number of common
>>> operations that can be factored out. So do that instead.
>>>
>>> Fixes: 66558b730f25 ("sched: Add cluster scheduler level for x86")
>>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> ---
>>>  arch/x86/include/asm/smp.h |  1 +
>>>  arch/x86/kernel/smpboot.c  | 19 +++++++++++++------
>>>  arch/x86/xen/smp_pv.c      | 11 ++---------
>>>  3 files changed, 16 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
>>> index 08b0e90623ad..81a0211a372d 100644
>>> --- a/arch/x86/include/asm/smp.h
>>> +++ b/arch/x86/include/asm/smp.h
>>> @@ -126,6 +126,7 @@ static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
>>>  
>>>  void cpu_disable_common(void);
>>>  void native_smp_prepare_boot_cpu(void);
>>> +void smp_prepare_cpus_common(void);
>>>  void native_smp_prepare_cpus(unsigned int max_cpus);
>>>  void calculate_max_logical_packages(void);
>>>  void native_smp_cpus_done(unsigned int max_cpus);
>>> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
>>> index 8241927addff..d7429198c22f 100644
>>> --- a/arch/x86/kernel/smpboot.c
>>> +++ b/arch/x86/kernel/smpboot.c
>>> @@ -1350,12 +1350,7 @@ static void __init smp_get_logical_apicid(void)
>>>  		cpu0_logical_apicid = GET_APIC_LOGICAL_ID(apic_read(APIC_LDR));
>>>  }
>>>  
>>> -/*
>>> - * Prepare for SMP bootup.
>>> - * @max_cpus: configured maximum number of CPUs, It is a legacy parameter
>>> - *            for common interface support.
>>> - */
>>> -void __init native_smp_prepare_cpus(unsigned int max_cpus)
>>> +void __init smp_prepare_cpus_common(void)
>>>  {
>>>  	unsigned int i;
>> Testing out this patch I got a warning that i is unused. Which it is,
>> since for_each_possible_cpu(i) is removed.
> Fixed. Can I add your Tested-by ?
Yes, I tested with tip.

Regards
Josef

