Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87DB75933C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 12:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565753.884220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4Zb-0006eD-Ly; Wed, 19 Jul 2023 10:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565753.884220; Wed, 19 Jul 2023 10:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4Zb-0006cU-I0; Wed, 19 Jul 2023 10:38:23 +0000
Received: by outflank-mailman (input) for mailman id 565753;
 Wed, 19 Jul 2023 10:38:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bnZ=DF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qM4ZZ-00068b-KA
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 10:38:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 614b3663-2620-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 12:38:21 +0200 (CEST)
Received: from [192.168.1.101] (unknown [37.163.72.116])
 by support.bugseng.com (Postfix) with ESMTPSA id B82114EE0C89;
 Wed, 19 Jul 2023 12:38:19 +0200 (CEST)
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
X-Inumbo-ID: 614b3663-2620-11ee-b23a-6b7b168915f2
Message-ID: <c4534f8a-d479-dbcc-ddb1-81eb00b074a2@bugseng.com>
Date: Wed, 19 Jul 2023 12:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] x86/HVM: address violations of MISRA C:2012 Rules 8.2
 and 8.3
Content-Language: en-US, it
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <7c89ac0fe44dbd1ba1436a91024efebf2794db40.1689761143.git.federico.serafini@bugseng.com>
 <e0b03fd7-0487-3328-b532-2950c3b1e34b@citrix.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <e0b03fd7-0487-3328-b532-2950c3b1e34b@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/07/23 12:23, Andrew Cooper wrote:
> On 19/07/2023 11:07 am, Federico Serafini wrote:
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 57363c2ae1..8f19a79f6f 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -319,7 +319,7 @@ static bool pat_valid(uint64_t val)
>>       return !(any_gt_7 | any_2_or_3);
>>   }
>>   
>> -int hvm_set_guest_pat(struct vcpu *v, uint64_t guest_pat)
>> +int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)
> 
> If there's a u64 vs uint64_t mismatch (or others for that matter),
> resolve in the way of the stdint types.  That way you're correcting in
> the direction of the Xen coding style, rather than away from it.

Changing the type in the declaration from u64 to uint64_t
touching hvm.h will lead to inconsistencies with adjacent declarations.
In such cases, should I propagate the change to the adjacent ones
as well?

>> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
>> index 43245e13de..eb9c416307 100644
>> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
>> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
>> @@ -42,7 +42,7 @@ int cf_check nsvm_vcpu_initialise(struct vcpu *v);
>>   int cf_check nsvm_vcpu_reset(struct vcpu *v);
>>   int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
>>   int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
>> -                                    const struct x86_event *event);
>> +                                    const struct x86_event *trap);
> 
> This needs to stay as event.  Trap is a related technical term, and
> incorrect to use here.  (Yes, the implementation of
> nsvm_vcpu_vmexit_event() is wrong.)

Ok.
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
>> index 3c37f522b9..7943e287cf 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>>       int (*msr_write_intercept)(unsigned int msr, uint64_t msr_content);
>>       void (*handle_cd)(struct vcpu *v, unsigned long value);
>>       void (*set_info_guest)(struct vcpu *v);
>> -    void (*set_rdtsc_exiting)(struct vcpu *v, bool_t);
>> -    void (*set_descriptor_access_exiting)(struct vcpu *v, bool);
>> +    void (*set_rdtsc_exiting)(struct vcpu *v, bool_t enable);
> 
> In this case, we want to swap to bool as well as giving a name in the
> prototype.

Ok.

> xen.git/xen$ git grep -w bool_t | wc -l
> 441
> 
> I'm seriously tempted just to do a bulk fix of bool_t to get it over and
> done with...
> 
> ~Andrew

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

