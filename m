Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jNXoILO+KmpTwAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 15:57:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7E1672809
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 15:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nr8NRH9x;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1335562.1597748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXftq-0004DW-No; Thu, 11 Jun 2026 13:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335562.1597748; Thu, 11 Jun 2026 13:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXftq-0004Bh-Jy; Thu, 11 Jun 2026 13:56:50 +0000
Received: by outflank-mailman (input) for mailman id 1335562;
 Thu, 11 Jun 2026 13:56:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wXftp-0004BL-3q
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 13:56:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXfto-00D1NM-9y
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:56:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2abe96-2eae-0a2a0a5409dd-0a2a4507b33a-18
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:56:48 +0200
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2abea0-229c-0a2a45070019-d155d032ad90-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:56:48 +0200
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-68d23396ed3so14333219a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 06:56:48 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e65868049sm10854668a12.24.2026.06.11.06.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 06:56:46 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781186208; x=1781791008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHP74RHtJAMJj+Qu4dTQooUNBbVls9nJuCfXbi3DdN8=;
        b=nr8NRH9xIPx16Zn4anWwqgl/e1goOs4Um0uvKrlb0P9iOkjCwwLLrxfzHOOAxvClrZ
         Lrs7SRmMF2Ns985+/3hNyTwgQGlrZG27g4e7DYC17ROxwVSSlsa8aZIkEdWOg5oFs+kY
         vBL9UlSWeYys0TZIaVpCeL7Y1Tx8IQfIA5CglQ7Ql4KlF97MIENsv5TqsKZvViDohL2S
         j1sTEupTvLOXgkvGFq9U3cXZU1AA4b7XOwLPdK/Hwe7m34Q9l21eNl96/sU0Ecotycu8
         nIQ+nQNNKKpwAG9QEpfuQOncNlKTRHxVtylZsLkrZ3G+OwvHF6sQgLq9MB1sO2xwgyBe
         mCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186208; x=1781791008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHP74RHtJAMJj+Qu4dTQooUNBbVls9nJuCfXbi3DdN8=;
        b=SKbJY3ufhOc7l88sdX+Gn+qY5JB/WhKRcpaZLMVWMfz+c4WELEvgV8j7L+2xB+sZZ8
         NWhWIva5egNRy1t7pBQZzbOLx8gv5yRdwPioq3EiW33GXFQrsge7np3w6WISV6KHqVZ9
         qFBP6cGRO8mcrP7USDBJidf3tsc8nJybmnZM2xQgJC/1iDwiYuQASXFe6Ad6Q8x9gXOa
         VGSOubtAovUfCUHy1UPZHV+3bl9woHx3DLN+Ziy0TV0reNVrqPIu+RQc5qKi02y+3g+l
         jBvVDzw62Kv87VN/FRcu+RsYhYINzYyI8pG4569V5pi4czuf1ZHN7kyweshASTjJ5coi
         arHw==
X-Forwarded-Encrypted: i=1; AFNElJ8WlvZFxdQxdG6soqv6MYdcDOsPeuinP+1CdvfnFzBrgnccNQWbwq7QnuWOb4Gkdkdm9Rpkau8KUOo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl9rmXcOhZ29ZmZJ8A4ciRFIdV8tUTWfUr5mqw1i20gO7pMJfm
	ZXQ2SC1cJidKbnZ+F4/eGh0U0IFR7e5MKKqdDeQCCWiQQ+nuFeT1vumn
X-Gm-Gg: Acq92OHU5Q7/RdNhnqF0QGmdWXnMhtjmN1pGsnM+x2DTKUm/VId6h2FQRL1hi0pN4OY
	DRURcX+WYeyswIIAE5kxqSlg6MaMsAXD7K6DHTzJfliuq5JCePDq5Tt2BzCdutWQ9AO9RGZf+Uj
	My86f8YeVb+ls04XD43Rw60Bp6BaUZsuCOp6g0RmZv/FNHXSZlmO0arKRSwLsERs4mdgoM+UrmN
	dJvlmLvRTdO5Ux6zArkjBNZi2u+Jcp7MBT5xoalxJbkyM5eTu6pqxVW/T3XkLW9FPGVfcMQtXZ3
	VEEt4OUzo0laRgTdpKl9poo+ADw1femyQviHnwhXax5qXjDiAyydMtrX1zsLHj8BzfsNedA1c5M
	dBqW/0f1IpD4zzbqtsuJB404+Gv5AbKB52mXOLUUoDX/0GyAtjBxS4mU4aNY/lxYUxxg9Z3Awne
	4RQjdlEdrQ4y3tio9lGfsaPhUidweOCNcTCeP+WM6AKW035195LVOoxRTANtqH68up5+HEex77b
	3J07YoeW3TpQW3qXFo1ENOMPeQ=
X-Received: by 2002:a05:6402:3226:b0:691:5124:45de with SMTP id 4fb4d7f45d1cf-6930e2c359dmr1529062a12.16.1781186207473;
        Thu, 11 Jun 2026 06:56:47 -0700 (PDT)
Message-ID: <aeed4ea8-c300-4c68-9dc5-2c7a41719505@gmail.com>
Date: Thu, 11 Jun 2026 15:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/x86: Change stub page allocation/free
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260611075342.58428-1-roger.pau@citrix.com>
 <1639ef93-4260-4a2b-bcfd-d39a059c1c56@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1639ef93-4260-4a2b-bcfd-d39a059c1c56@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781186208-0BD7FC48-742639B3/10/73395122804
X-purgate-type: spam
X-purgate-size: 8009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD7E1672809



On 6/11/26 1:38 PM, Andrew Cooper wrote:
> On 11/06/2026 8:53 am, Roger Pau Monne wrote:
>> From: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Today the inline tracking of the stub page is problematic.  0xcc is used to
>> indicate unused, but it is also a "clear value."  A !CONFIG_PV build with
>> smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free the
>> in-use stub page.  CPU0 or subsequent onlined CPUs can write to the re-used
>> page.
> 
> I'm pretty sure a CONFIG_PV build booted on a FRED enabled system will
> do the same.
> 
> This is the other case where we (now) forgo writing out the LSTAR/CSTAR
> stubs.
> 
>>
>> The new approach uses a global, CPU-indexed dynamically allocated array of
>> stub addresses.  However, to handle NUMA aware allocations, we cannot
>> allocate all the memory in advance because of the NUMA dependency.  Take
>> advantage of the fact that Xen will attempt to contiguously pack CPUs on
>> the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
>> same stubs page the previous CPU did if suitable.  Note the code would
>> still function properly even if CPUs from NUMA nodes are not contiguously
>> packed, it just consumes more memory.
>>
>> stub pages are no longer freed.  They remain referenced in the global
>> CPU-indexed array and are re-used if the CPU is re-onlined.
>>
>> stubs and node_stubs don't have an explicit lock.  During boot they are
>> accessed single threaded.  During runtime, &cpu_add_remove_lock serializes
>> access.
> 
> Is node_stubs stale?  Stub(s) should be capitalised at the start of the
> sentence.  In context, it's not clear that it's a variable name, and it
> doesn't need to be the literal variable name to convey the intended meaning.
> 
>>
>> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> There are other even more simple options here: for example Andrew proposed
>> to pack stubs contiguously in both the physical and the linear address
>> spaces, at the cost of possibly loosing the NUMA memory affinity between
>> the allocated page and the CPU using it.  We have decided to go for a more
>> conservative approach here, that keeps the same properties as the current
>> logic regarding NUMA memory affinity of the stub region.
> 
> Part of the suggestion was made in error, but there's a second aspect
> which I'll discuss at the end of the email.
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 4192edf635b6..cddf8806c877 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>   
>>       init_idle_domain();
>>   
>> -    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
>> -                                           &this_cpu(stubs).mfn);
>> -    BUG_ON(!this_cpu(stubs.addr));
>> +    init_bsp_stub();
> 
> Personally, I'd name this init_stubs().  It does work for more than just
> the BSP, and the bsp_* part is only really needed for clarity when
> there's a matching ap_* variant, which is not the case here.
> 
>>   
>>       bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
>>   
>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>> index d8fd71ffab37..3282392317f4 100644
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -641,41 +642,61 @@ static int do_boot_cpu(int apicid, int cpu)
>>       return rc;
>>   }
>>   
>> -#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
>> +/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
>> +static paddr_t *__ro_after_init stubs;
>>   
>> -unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
>> +static bool assign_stub_page(unsigned int cpu)
>>   {
>>       unsigned long stub_va;
>> -    struct page_info *pg;
>> +    paddr_t addr = stubs[cpu];
>>   
>> -    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
>> -
>> -    if ( *mfn )
>> -        pg = mfn_to_page(_mfn(*mfn));
>> -    else
>> +    if ( addr == INVALID_PADDR )
>>       {
>> -        nodeid_t node = cpu_to_node(cpu);
>> -        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
> 
> I think you need to retain this calculation of memflags.
> MEMF_node(NUMA_NO_NODE) doesn't work as expected.
> 
>> +        nodeid_t nid = cpu_to_node(cpu);
>>   
>> -        pg = alloc_domheap_page(NULL, memflags);
>> -        if ( !pg )
>> -            return 0;
>> +        /*
>> +         * Attempt to use the same page as the previous CPU if possible,
>> +         * otherwise allocate a new one.
>> +         */
>> +        if ( cpu && nid == cpu_to_node(cpu - 1) &&
>> +             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
>> +            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
>> +        else
>> +        {
>> +            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
>>   
>> -        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
> 
> You've dropped this memset() of the whole page to 0xcc.
> 
> As a consequence, the stubs for not-yet-onlined CPUs, or for gaps
> because of NUMA, are rubble yet mapped executably.
> 
>> +            if ( !pg )
>> +                return false;
>> +            addr = page_to_maddr(pg);
>> +        }
>> +        stubs[cpu] = addr;
>>       }
>>   
>>       stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
>> -    if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
>> +    if ( map_pages_to_xen(stub_va, maddr_to_mfn(addr), 1,
>>                             PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
>> -    {
>> -        if ( !*mfn )
>> -            free_domheap_page(pg);
>> -        stub_va = 0;
>> -    }
>> -    else if ( !*mfn )
>> -        *mfn = mfn_x(page_to_mfn(pg));
>> +        return false;
>>   
>> -    return stub_va;
>> +    per_cpu(stubs.mfn, cpu) = PFN_DOWN(addr);
>> +    per_cpu(stubs.addr, cpu) = stub_va + PAGE_OFFSET(addr);
>> +    return true;
>> +}
>> +
>> +void __init init_bsp_stub(void)
>> +{
>> +    const unsigned int num_cpus = num_present_cpus();
>> +    unsigned int i;
>> +
>> +    ASSERT(!stubs);
>> +    stubs = xvmalloc_array(typeof(*stubs), num_cpus);
>> +    if ( !stubs )
>> +        panic("Unable to allocate stub array");
>> +
>> +    for ( i = 0; i < num_cpus; i++ )
>> +        stubs[i] = INVALID_PADDR;
>> +
>> +    if ( !assign_stub_page(0) )
>> +        panic("Unable to initialize BSP stub region");
> 
> \n's for both panic messages.
> 
> With the above stuff addressed, I think this is looking ok, but
> definitely subject to Jason confirming it resolves his issue.  And for
> 4.22, that might even be sufficient to go in.

Release-Acked-by: Oleksii Kurochko <oleskii.kurochko@gmail.com>

Thanks.

~ Oleksii

> 
> The other thing I want to discuss is this:
> 
>>       stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
> 
> because it creates 32 virtual aliases of every stub.
> 
> AIUI, this was a hard requirement for the old freeing scheme, but the
> optimisation guides recommend against creating aliases like this.
> Besides microarchitectural tracking/safety effects, one consequence is
> that we end up with 31 aliases which have unsafe branches in them;
> disp32's depend on the linear address the code is executed at.
> 
> The ideal solution would be allocate VAs just like we allocate paddrs,
> and for the map_pages_to_xen() be beside the alloc_domheap_page(),
> rather than outside of INVALID_PADDR check.
> 
> This reduces the amount of VA space (and L1 pagetables) used by 32
> times, and removes the risk of accidentally using the wrong alias.
> 
> ~Andrew


