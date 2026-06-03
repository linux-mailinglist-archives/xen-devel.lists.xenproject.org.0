Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id phSdNvk5IGp0ywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:28:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446B8638918
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:28:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CUR90Gnu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326586.1592003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmZU-0005Ls-FS; Wed, 03 Jun 2026 14:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326586.1592003; Wed, 03 Jun 2026 14:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmZU-0005JP-Bc; Wed, 03 Jun 2026 14:27:52 +0000
Received: by outflank-mailman (input) for mailman id 1326586;
 Wed, 03 Jun 2026 14:27:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUmZT-0005JJ-A9
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:27:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmZS-0073ug-N4
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:27:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2039e2-e002-0a2a0a5209dd-0a2a450695e0-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:27:50 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2039e6-7371-0a2a45060019-d155dd2fd05c-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:27:50 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so4227137f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:27:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm8492883f8f.36.2026.06.03.07.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 07:27:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1780496870; x=1781101670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PskSbrUCnmHESNWYUNpNeSr6enLDZQdnwF1ihtcUwDc=;
        b=CUR90Gnuvrv6AIfcuACFF3rFoJ7TXE/75KyVjx+d8rpmZ6O512HhgMLhVpt1Jj/UbF
         xtVkc5gubex/r1vAbY2QZ1j9M7WFrtcR4jAKO+Jr3xtNu0T42/Q9xn3hG/22xME/4V9t
         BUDwSINj7/N5XyPl30Qp1GH5cgyLQw4MnlrASBt/jhAOMQKkcsllUl6agwZtjgVxXNWa
         4QdrXK7nkLQaqpkfGGK/BFihDfvrgv1/fik3ePZAnzy5N1FCNmRu+TQtvag4P+KpbhDD
         uSoFL04bDvTXuRCf8KMNnrX+NCWPI/VXnN1UH36FmFuKeivNq/729GftIiIQfdIbWXpv
         cbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496870; x=1781101670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PskSbrUCnmHESNWYUNpNeSr6enLDZQdnwF1ihtcUwDc=;
        b=o1gVQ798l/i7xZUK0mrzktE2In6l0FIULCiU+5cwNSYq2eD/2Lp9Le0wEZCU6R10M7
         tt1Zaqa0Up7S4VADAa+G3zeiMMCMkpxc41z/tztoQXxy/y2OYVB2pMir6aa3bQVtkp5E
         nk/nnYCYiIQ72wYeDH42SlC9eUolgJCLntH6PmLpNHu+7bk9iWa+Eu20AOtuP+KPxRie
         1Sw4BjKdUCvJA+4Szc0O5i9zF82KaiEWAN/GlAYkUIjOXRWNis6pDh/sccyS2i7iy+sf
         2iKba61FwBgval4T/svelwfnEE7rC14D4awsJUQ94spb+S3s25rt3+FU+Hc1NsB0Ruzn
         ap3A==
X-Gm-Message-State: AOJu0YyhxgBKCTgWswluxbFrstf7pO2wBoEz0bBuTRBBlzNucQmnCHOM
	UW7sBBDV7AvEeFLEKKxpIeexpbKXha1pOEmuDsN+EEN0TpJ7D7BVzmEqhLZLxo2cBg==
X-Gm-Gg: Acq92OGqLjgNcKII0zj4tn1sL0aEMBYynQdy02o3YYp+waLNIULOpqPoMtsOjc2Zh+2
	zpf9xkUiStgJSAqHQyMwBeGUVLmgBvVO4R5blwX3xR38s0/84rnNXCKd522wseZBgokvb7zD3u3
	YFKEKiOGQT3m2pExG0F0T2nG+FSYjVfev/BxDcrkbsCnsfb7MN32DvQ4Va1VDHnsNsMTW/YJdd1
	PESei6E+zm1gRNlsZW2O6NR65lYDLuefyDwvbTOZrBBYnhUQeVBhhSSi2iFD0Ko+PgEu558ldUu
	wm/JhbBZ2C+H2QtNEMtRppnc1f+NZ8wa7oq3lUI7aB/D8D++h6rvUgqhR+HQ23E8ljz9j2m0emi
	ehYcfg2ltzf+ONBUWJ8fImx827ObtxpwUKiOUfS4aOV0aBkxmcu2FsJYsnMYSK6Aig9wH9Noolk
	rt7uu62JRuzD+S34+L5Ceom+Y5SKfttkUKCQIxKEdu8b69P7t4s/9UbaIBqjpRX+aLCgYz/j/gc
	7p6g0wh/uu4U0KpywVx0NPMmA==
X-Received: by 2002:a5d:64c9:0:b0:45e:a314:ce0c with SMTP id ffacd0b85a97d-460218aae0cmr5574675f8f.1.1780496869859;
        Wed, 03 Jun 2026 07:27:49 -0700 (PDT)
Message-ID: <40e127c4-98da-41d7-b7a7-6298553d2f7d@suse.com>
Date: Wed, 3 Jun 2026 16:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
 <ah26nl95MgqhPPAi@macbook.local>
 <5cdfca65-50f8-487a-a146-86e1a68f459c@amd.com>
 <ah5_0vvipY2Wch-x@macbook.local>
 <cf275fef-27fb-4d73-bbc8-9a75c1836608@amd.com>
 <aiA3T2DvE0v6uwoC@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aiA3T2DvE0v6uwoC@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780496870-86369D75-61544CF5/0/0
X-purgate-type: clean
X-purgate-size: 5571
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 446B8638918

On 03.06.2026 16:16, Roger Pau Monné wrote:
> On Wed, Jun 03, 2026 at 10:03:53AM -0400, Jason Andryuk wrote:
>> On 2026-06-02 03:01, Roger Pau Monné wrote:
>>> On Mon, Jun 01, 2026 at 05:07:52PM -0400, Jason Andryuk wrote:
>>>> On 2026-06-01 13:00, Roger Pau Monné wrote:
>>>>> On Tue, May 26, 2026 at 04:31:14PM -0400, Jason Andryuk wrote:
>>>>>> A single stubs page is initialized with 0xcc and re-used, with multiple
>>>>>> CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
>>>>>> each stubs area is checked against 0xcc.  When all are set to 0xcc, the
>>>>>> page is freed.
>>>>>>
>>>>>> Booting a system with smt=0, CPU0 is initially setup, allocating the
>>>>>> stubs page and initializing to 0xcc.  When more CPUs are brought up,
>>>>>> CPU1 is initialized and then immediately brough offline as it is the
>>>>>> sibling of CPU0.  Since the page was initially memset with 0xcc,
>>>>>> cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
>>>>>> However, the page is still assigned to CPU0 and continues to be assigned
>>>>>> to other CPUs.
>>>>>>
>>>>>> Meanwhile the page can be reallocated, which can lead to misbehavior.
>>>>>> The particular instance was the stubs page re-used as a page table which
>>>>>> later faulted when the entry was all 0xcc.
>>>>>>
>>>>>> Change to initializing the page as 0xd6/STUB_BUF_FREE, and initializing
>>>>>> individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates unused, and
>>>>>> 0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
>>>>>> 0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
>>>>>> STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
>>>>>> partially used.
>>>>>>
>>>>>> 0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
>>>>>> use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
>>>>>> (e.g. 0xffff82d07fffe000) fails the is_active_kernel_text() check.  It
>>>>>> should be okay to use here.
>>>>>>
>>>>>> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
>>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>>> ---
>>>>>> It would be nice to use get_page()/put_page() to let count_info handle
>>>>>> reference counting, but they require an owning domain.
>>>>>>
>>>>>> The listed Fixes introduced the use of 0xcc, but the smt commit may have
>>>>>> made it more problematic.
>>>>>> Fixes: d8f974f1a646 ("x86: command line option to avoid use of secondary hyper-threads")
>>>>>
>>>>> Speaking with Andrew, we believe it might be easier to simply forego
>>>>> the freeing of the page, possibly something like:
>>>>>
>>>>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>>>>> index ff05955bae40..62c6cbf4b561 100644
>>>>> --- a/xen/arch/x86/smpboot.c
>>>>> +++ b/xen/arch/x86/smpboot.c
>>>>> @@ -990,19 +990,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>>>>>        {
>>>>>            mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
>>>>>            unsigned char *stub_page = map_domain_page(mfn);
>>>>> -        unsigned int i;
>>>>>            memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
>>>>> -        for ( i = 0; i < STUBS_PER_PAGE; ++i )
>>>>> -            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
>>>>> -                break;
>>>>>            unmap_domain_page(stub_page);
>>>>>            destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
>>>>>                                 (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
>>>>>            per_cpu(stubs.addr, cpu) = 0;
>>>>> -        per_cpu(stubs.mfn, cpu) = 0;
>>>>> -        if ( i == STUBS_PER_PAGE )
>>>>> -            free_domheap_page(mfn_to_page(mfn));
>>>>>        }
>>>>>        if ( IS_ENABLED(CONFIG_PV32) )
>>>
>>> I think I've made an oversight in the code above: if all 32 CPUs
>>> sharing the same stubs page are offlined, the reference to the stubs
>>> page is possibly lost (if CPUs are not parked) and a new stubs page
>>> would be allocated if any of those CPUs is brought back online, thus
>>> leaking the previous allocation.  The simplest way to solve this would
>>> be to introduce an array that indexes the stub pages, and replace the
>>> logic in cpu_smpboot_alloc() that figures out whether stubs.mfn is set
>>> for adjacent CPUs.
>>
>> Right, but I thought Andrew's point was that offlining 32 CPUs is
>> unrealistic, so don't even bother tracking.  If CPUs are offlined (and you
>> somehow keep running), you can leak the page.
> 
> I thin we should avoid freeing the page and ensure it's always reused,
> rather than possibly leaking it.  It's also possible there's a single
> trailing CPU using the last stubs page alone, and offlining and
> onlining it would trigger such a page leak, without requiring a block
> of 32 CPUs going offline.
> 
> Entering an ACPI sleep state causes all APs to be offlined (see the
> disable_nonboot_cpus() call in enter_state()), and it would be
> undesirable that putting a system to sleep causes page leaking.

Suspend is handled specially by some CPU notifier handlers, see in
particular common/percpu.c:cpu_percpu_callback(). That in particular
means that per-CPU data survives suspend/resume. Which may be possible
to leverage here to avoid a leak across S3 (and perhaps even across
the pretty similar parking), while still accepting a leak for "real"
CPU offlining. (Which isn't to say that avoiding leaks altogether
wouldn't be the most desirable goal.)

Jan

