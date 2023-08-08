Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B9C774FA2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 02:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580595.908931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTWc2-00056l-0e; Tue, 08 Aug 2023 23:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580595.908931; Tue, 08 Aug 2023 23:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTWc1-000552-U0; Tue, 08 Aug 2023 23:59:41 +0000
Received: by outflank-mailman (input) for mailman id 580595;
 Tue, 08 Aug 2023 23:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7Ml=DZ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qTWbz-00054w-MT
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 23:59:39 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa2066b-3647-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 01:59:36 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691539168302242.3678362872048;
 Tue, 8 Aug 2023 16:59:28 -0700 (PDT)
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
X-Inumbo-ID: 9fa2066b-3647-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1691539169; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E97/EQ4Rd/ItcjCrL9baRh8iy1jdUfPcjAYrphTDuSppIPSIHZdmennI8yA5RTuH8/NrJk13eXmO7KLQMfLJcUeDQ+vh6YVZUtnsw/CxfXVADXCVwR24ahX9QFwHuJtcEm7pHW6sqiNr8U1XoR4NR/n1yj6UZuj5GunXSOjULfk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691539169; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=b7arqanQZaKrseLp8T3E5x22B2H7nmPRA4KWnM7oBUo=; 
	b=PXSE+j55WkuaAiU5vqA2xHecWxUSl918r/GctxvbCtSqF9tsHjDJ1k7KkoLoxXX+/lGxhk/FWc9lVJPcVPCN/NI1ToB3S6NeA85UeCESouGZkyWvMsQghYsnaa0NMnLdS5mUqj7iMyZUDjemHHEfSh65yyeAYPcUTwa3GezgIQM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691539169;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=b7arqanQZaKrseLp8T3E5x22B2H7nmPRA4KWnM7oBUo=;
	b=GChef75QLMo+fqpJY/F7pTWyK7WEO+Z98V6szlB0fb8J7xIjrK5/ecc63Jxdorzo
	2Dy7uTEHfC3EA/nDZMPM95nqthv5qvyPEPjgKKrMF5I1byu3QIi9h1mlI/xwFPGYoMH
	iu6KyhpegGwCr46VELlKRujbSv19Hf/t0UGgwiIk=
Message-ID: <331ee5de-3c90-2e3f-ef1c-914a2cbf14cf@apertussolutions.com>
Date: Tue, 8 Aug 2023 19:59:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 5/6] capabilities: add dom0 cpu faulting disable
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-6-dpsmith@apertussolutions.com>
 <93750d64-07b3-2a92-4851-bcd5bda9a0a5@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <93750d64-07b3-2a92-4851-bcd5bda9a0a5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/8/23 11:30, Jan Beulich wrote:
> On 01.08.2023 22:20, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -164,48 +164,46 @@ static void set_cpuid_faulting(bool enable)
>>   
>>   void ctxt_switch_levelling(const struct vcpu *next)
>>   {
>> -	const struct domain *nextd = next ? next->domain : NULL;
>> -	bool enable_cpuid_faulting;
>> -
>> -	if (cpu_has_cpuid_faulting ||
>> -	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
>> -		/*
>> -		 * No need to alter the faulting setting if we are switching
>> -		 * to idle; it won't affect any code running in idle context.
>> -		 */
>> -		if (nextd && is_idle_domain(nextd))
>> -			return;
>> -		/*
>> -		 * We *should* be enabling faulting for PV control domains.
>> -		 *
>> -		 * The domain builder has now been updated to not depend on
>> -		 * seeing host CPUID values.  This makes it compatible with
>> -		 * PVH toolstack domains, and lets us enable faulting by
>> -		 * default for all PV domains.
>> -		 *
>> -		 * However, as PV control domains have never had faulting
>> -		 * enforced on them before, there might plausibly be other
>> -		 * dependenices on host CPUID data.  Therefore, we have left
>> -		 * an interim escape hatch in the form of
>> -		 * `dom0=no-cpuid-faulting` to restore the older behaviour.
>> -		 */
>> -		enable_cpuid_faulting = nextd && (opt_dom0_cpuid_faulting ||
>> -		                                  !is_control_domain(nextd) ||
>> -		                                  !is_pv_domain(nextd)) &&
>> -		                        (is_pv_domain(nextd) ||
>> -		                         next->arch.msrs->
>> -		                         misc_features_enables.cpuid_faulting);
>> -
>> -		if (cpu_has_cpuid_faulting)
>> -			set_cpuid_faulting(enable_cpuid_faulting);
>> -		else
>> -			amd_set_cpuid_user_dis(enable_cpuid_faulting);
>> -
>> -		return;
>> -	}
>> -
>> -	if (ctxt_switch_masking)
>> -		alternative_vcall(ctxt_switch_masking, next);
>> +    const struct domain *nextd = next ? next->domain : NULL;
>> +    bool enable_cpuid_faulting;
>> +
>> +    if ( cpu_has_cpuid_faulting ||
>> +         boot_cpu_has(X86_FEATURE_CPUID_USER_DIS) ) {
>> +        /*
>> +        * No need to alter the faulting setting if we are switching
>> +        * to idle; it won't affect any code running in idle context.
>> +        */
>> +        if (nextd && is_idle_domain(nextd))
>> +            return;
>> +        /*
>> +        * We *should* be enabling faulting for PV control domains.
>> +        *
>> +        * The domain builder has now been updated to not depend on
>> +        * seeing host CPUID values.  This makes it compatible with
>> +        * PVH toolstack domains, and lets us enable faulting by
>> +        * default for all PV domains.
>> +        *
>> +        * However, as PV control domains have never had faulting
>> +        * enforced on them before, there might plausibly be other
>> +        * dependenices on host CPUID data.  Therefore, we have left
>> +        * an interim escape hatch in the form of
>> +        * `dom0=no-cpuid-faulting` to restore the older behaviour.
>> +        */
>> +        enable_cpuid_faulting = nextd &&
>> +            domain_has_cap(nextd, CAP_DISABLE_CPU_FAULT) &&
>> +            (is_pv_domain(nextd) ||
>> +            next->arch.msrs->misc_features_enables.cpuid_faulting);
>> +
>> +        if (cpu_has_cpuid_faulting)
>> +            set_cpuid_faulting(enable_cpuid_faulting);
>> +        else
>> +            amd_set_cpuid_user_dis(enable_cpuid_faulting);
>> +
>> +        return;
>> +    }
>> +
>> +    if (ctxt_switch_masking)
>> +        alternative_vcall(ctxt_switch_masking, next);
>>   }
> 
> I don't think I can spot what exactly changes here. Please avoid re-
> indenting the entire function.

Oh, that was not intentional. I must have done a retab as that entire 
function is indented using hardtabs.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -907,6 +907,10 @@ static struct domain *__init create_dom0(const module_t *image,
>>   
>>       d->role |= ROLE_UNBOUNDED_DOMAIN;
>>   
>> +    if ( !opt_dom0_cpuid_faulting &&
>> +         !domain_set_cap(d, CAP_DISABLE_CPU_FAULT) )
>> +        printk(XENLOG_WARNING "failed to set CPU faulting on Dom %pd\n", d);
> 
> No "Dom" please when you use %pd. Also I don't think you mean "set". Plus
> we commonly use "%pd: xyz failed\n".

Ack on the "Dom" removal and "%pd:".

As for set, it failed to set the capability on the domain. You could say 
enable but that is nothing more than synonyms, not changing the meaning 
of the statement.

>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -472,7 +472,8 @@ struct domain
>>   #define ROLE_HARDWARE_DOMAIN   (1U<<2)
>>   #define ROLE_XENSTORE_DOMAIN   (1U<<3)
>>       uint8_t          role;
>> -#define CAP_CONSOLE_IO  (1U<<0)
>> +#define CAP_CONSOLE_IO         (1U<<0)
>> +#define CAP_DISABLE_CPU_FAULT  (1U<<1)
>>       uint8_t          capabilities;
>>       /* Is this guest being debugged by dom0? */
>>       bool             debugger_attached;
>> @@ -1160,6 +1161,11 @@ static always_inline bool domain_set_cap(
>>       case CAP_CONSOLE_IO:
>>           d->capabilities |= cap;
>>           break;
>> +    case CAP_DISABLE_CPU_FAULT:
>> +        /* Disabling cpu faulting is only allowed for a PV control domain. */
>> +        if ( is_pv_domain(d) && is_control_domain(d) )
>> +            d->capabilities |= cap;
>> +        break;
> 
> How do you express the x86-ness of this? Plus shouldn't this fail when
> either of the two conditions isn't met?

You are correct, since this moves an x86 capability out into common, it 
should be ifdef'ed for x86.

Correct me if I am wrong here, but in the original check it would 
evaluate that all three conditions to be true. All this change did is 
effectively move the last two conditions into domain_set_cap(). Thus 
storing the evaluation of the first two conditions during dom0 
capability setup for the result to later be evaluated during dom0 cpuid 
policy setup as it was done before.

v/r,
dps

