Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHaKO5co52mI4wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:34:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3D9437A8B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288402.1568675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5cy-0000HX-Cc; Tue, 21 Apr 2026 07:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288402.1568675; Tue, 21 Apr 2026 07:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5cy-0000Ew-9f; Tue, 21 Apr 2026 07:34:36 +0000
Received: by outflank-mailman (input) for mailman id 1288402;
 Tue, 21 Apr 2026 07:34:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF5cw-0000Eq-VU
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:34:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5cw-00FyXS-C1
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:34:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e72881-bab6-0a2a0a5309dd-0a2a450b9d60-38
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:34:34 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e72889-212f-0a2a450b0019-d155802ac858-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:34:34 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso16983445e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 00:34:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4890009e759sm274514365e9.6.2026.04.21.00.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 00:34:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776756873; x=1777361673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf1n57p6tPYWLEbgVNH/z/KLvsxhxbyMFKXGuN9mwCE=;
        b=FQg5SJ2oVmQLGc969dHZ6pbeQq3wQr3K/dDpds5Ou5BDECn+/fsAtVnehmyqsKv+y6
         pBANiPZKV7v+iXOc/a1AKuNpHL34sO6Ew7Y5MdO8ApOItRgR7dIVrghp5al9kExEAPFu
         NMyoJLPm4+OUNg+hZDRW2AKt59sdCIz+O1s/KXA392l08Bhz0M9YVx/eQXngaXmOFMOa
         oLrAqLOXF2s/4MUTQ+VAk95GwIXQgJRBMlZBsD+X2BZL26RhrK57KwsDseaUHayHyPxJ
         quMDKPZHojvkEv04e8CV80bL+9SiEtDKqcgLZDziVh6KjmTY/0WpRgXBazfVN3JZj0B8
         z+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756873; x=1777361673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gf1n57p6tPYWLEbgVNH/z/KLvsxhxbyMFKXGuN9mwCE=;
        b=ZtTqmdCAPI66+WD1AXSdqcYq7IkQE/2P4vVy1Sf6c8VDd9nASLMquJv4WaFHudqUW4
         FJWWDEctpYl+YuhgsOwXQxfK8r/z3YBbHWB/CUbQrBF+A50QkpWsXHP3t1ZOqSPF1iQ/
         TBXXoKTj1qz3dKsqMrXaZT4uxDT7uofRvlOSVQumBLIXkchOU3RGD/u/ZQx81nN1urtF
         XH7ZH13IJ2OotNQ5sbhFnJWixcsuS0yOXwvJK2hlUwBlTwWr6W5n26JKE4A2z+b1gttW
         DJx3jjogU3No4QkpB4S/dIAdWLNSqluotKy5Oj0x4KyBoNn3F2yB8kxNO2axXnR2gWG3
         KcnA==
X-Gm-Message-State: AOJu0YxgrWGPkxci/KhzIXFHOQidH4HdiMVGpdJqJu8p4FK5ro3MAzak
	qvB6nsxfpQ1O8vYF7vZF0/eF0pd/KE2iywBwNFk1lw0KYAMFESDQuPuibxwBGeqPdA==
X-Gm-Gg: AeBDievHrVb72X5wdzcM3oPXfCDDbtddlvlk/BH44DZYlIaS79hrzjeCRAcmysjlpYj
	+mGcoJBYlmd/OwBk1ZKhvE51MrmxsYH5iCmMGYkAIk9b/qU3B75QwdP2drkK1xEVSgCmfMpoUzP
	XdXvcDNfev8/xEn2iwaHC1/iygIV+R77YNsayqU8nhfd5mYiR6Oun6ZJM+GaxHz5rALLw5R4SAE
	5uuHcieBVrGZGebzVZ8sSBwIq3cuspHf+L+jkEfaUCjRChUNXKyoyz+nf9nbCO0ciE5RAcqMZNc
	4U2WLLhzn9FCfe+sqoe4aWFAyLLxSPECkbeKWdFuQyQRjoccAcxrYccewacHpw1IiM29Byt+6zl
	/amV4cYdM6iTJZUrdoJNgUTNl+XRBxCbnRaMOvuMQ0RvZtKb551GZlLKMyg06BUO4howX66iqNk
	RlBwLKso6SzQpGQdQQVrsksmxIZDycp4bUh0LYoD4aKFHjwTWItbK66wz3i5TUTgH5N4+bVRsvo
	kereoSu3MOP6I6k5c8H1ahYIg==
X-Received: by 2002:a05:600c:3546:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48a554663d4mr27267625e9.15.1776756873390;
        Tue, 21 Apr 2026 00:34:33 -0700 (PDT)
Message-ID: <18030a33-5280-4c15-ae72-159ba2a25018@suse.com>
Date: Tue, 21 Apr 2026 09:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuidle: split the max_cstate variable
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <4b89f640-046a-49c1-95f1-947d98135e5b@suse.com>
 <aeZQ3FcNl_EsPTdE@macbook.local>
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
In-Reply-To: <aeZQ3FcNl_EsPTdE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776756874-246B7F3B-CFC83654/0/0
X-purgate-type: clean
X-purgate-size: 6729
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5C3D9437A8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.04.2026 18:14, Roger Pau Monné wrote:
> On Wed, Apr 08, 2026 at 01:34:43PM +0200, Jan Beulich wrote:
>> @@ -690,18 +694,18 @@ static void cf_check acpi_processor_idle
>>      u32 exp = 0, pred = 0;
>>      u32 irq_traced[4] = { 0 };
>>  
>> -    if ( max_cstate > 0 && power &&
>> +    if ( max_cstate() > 0 && power &&
>>           (next_state = cpuidle_current_governor->select(power)) > 0 )
>>      {
>>          unsigned int max_state = sched_has_urgent_vcpu() ? ACPI_STATE_C1
>> -                                                         : max_cstate;
>> +                                                         : max_cstate();
>>  
>>          do {
>>              cx = &power->states[next_state];
>>          } while ( (cx->type > max_state ||
>>                     cx->entry_method == ACPI_CSTATE_EM_NONE ||
>>                     (cx->entry_method == ACPI_CSTATE_EM_FFH &&
>> -                    cx->type == max_cstate &&
>> +                    cx->type == max_allowed_cstate &&
> 
> I'm afraid I'm missing why this uses max_allowed_cstate instead of
> max_state.

max_allowed_cstate is what needs using along with ...

>>                      (cx->address & MWAIT_SUBSTATE_MASK) > max_csubstate)) &&

... max_csubstate, as both are driven by the "max_cstate=" command line
option. Renaming max_csubstate to max_allowed_csubstate would be an
option, but would incure yet more churn.

>> --- a/xen/arch/x86/cpu/mwait-idle.c
>> +++ b/xen/arch/x86/cpu/mwait-idle.c
>> @@ -1045,15 +1045,16 @@ static void cf_check mwait_idle(void)
>>  	u64 before, after;
>>  	u32 exp = 0, pred = 0, irq_traced[4] = { 0 };
>>  
>> -	if (max_cstate > 0 && power &&
>> +	if (max_cstate() > 0 && power &&
>>  	    (next_state = cpuidle_current_governor->select(power)) > 0) {
>>  		unsigned int max_state = sched_has_urgent_vcpu() ? ACPI_STATE_C1
>> -								 : max_cstate;
>> +								 : max_cstate();
>>  
>>  		do {
>>  			cx = &power->states[next_state];
>> -		} while ((cx->type > max_state || (cx->type == max_cstate &&
>> -			  MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
>> +		} while ((cx->type > max_state ||
>> +                          (cx->type == max_allowed_cstate &&
> 
> Indentation is weird for the above line IMO, you should use hard 3
> tabs plus spaces afterwards, like the surrounding indentation?

Ouch, indeed.

>> +			   MWAIT_HINT2SUBSTATE(cx->address) > max_csubstate)) &&
>>  			 --next_state);
>>  		if (!next_state)
>>  			cx = NULL;
> 
> Seeing max_cstate() is used in multiple places here, you might want to
> introduce a local max_cstate variable?

Except that Misra doesn't like such naming, and any other name would feel
odd to use.

>> --- a/xen/include/xen/acpi.h
>> +++ b/xen/include/xen/acpi.h
>> @@ -142,30 +142,33 @@ int acpi_gsi_to_irq (u32 gsi, unsigned i
>>  
>>  #ifdef	CONFIG_ACPI_CSTATE
>>  /*
>> - * max_cstate sets the highest legal C-state.
>> - * max_cstate = 0: C0 okay, but not C1
>> - * max_cstate = 1: C1 okay, but not C2
>> - * max_cstate = 2: C2 okay, but not C3 etc.
>> -
>> - * max_csubstate sets the highest legal C-state sub-state. Only applies to the
>> - * highest legal C-state.
>> - * max_cstate = 1, max_csubstate = 0 ==> C0, C1 okay, but not C1E
>> - * max_cstate = 1, max_csubstate = 1 ==> C0, C1 and C1E okay, but not C2
>> - * max_cstate = 2, max_csubstate = 0 ==> C0, C1, C1E, C2 okay, but not C3
>> - * max_cstate = 2, max_csubstate = 1 ==> C0, C1, C1E, C2 okay, but not C3
>> + * max_{allowed,usable}_cstate sets the highest allowed / usable C-state, where
>> + * "allowed" is command line / sysctl based.
> 
> Hm, this is a bit misleading, because max_usable_cstate is also
> command line based (plus system errata).  What about:
> 
> "max_{allowed,usable}_cstate sets the highest allowed / usable C-state.
> max_usable_cstate can only be set from the command line, while
> max_allowed_cstate can be set from both command line and systcl."

Well. While I think I get your point, what I'm trying to get across is that
max_usable_cstate is internally controlled (bounded by command line setting
of max_allowed_cstate, but possibly forced lower than that internally). So
maybe

"max_{allowed,usable}_cstate sets the highest allowed / usable C-state.
 max_usable_cstate, while affected by the command line, is internally driven,
 whereas max_allowed_cstate can be set from both command line and systcl."

?

>> + * max_*_cstate = 0: C0 okay, but not C1
>> + * max_*_cstate = 1: C1 okay, but not C2
>> + * max_*_cstate = 2: C2 okay, but not C3 etc.
>> + *
>> + * max_csubstate sets the highest allowed C-state sub-state. Only applies to
>> + * the highest allowed C-state.
>> + * max_allowed_cstate = 1, max_csubstate = 0 ==> C0, C1 okay, but not C1E
>> + * max_allowed_cstate = 1, max_csubstate = 1 ==> C0, C1 and C1E okay, but not C2
>> + * max_allowed_cstate = 2, max_csubstate = 0 ==> C0, C1, C1E, C2 okay, but not C3
>> + * max_allowed_cstate = 2, max_csubstate = 1 ==> C0, C1, C1E, C2 okay, but not C3
>>   */
>>  
>> -extern unsigned int max_cstate;
>> +extern unsigned int max_usable_cstate;
>> +extern unsigned int max_allowed_cstate;
>>  extern unsigned int max_csubstate;
>>  
>> +#define max_cstate() min(max_usable_cstate, max_allowed_cstate)
> 
> I would be tempted to drop the ending parenthesis so that you don't
> need to adjust callers, but that's likely misleading, as then it would
> need to be uppercase MAX_CSTATE.

I deliberately want to have the parentheses, to make sure all uses of
max_cstate (without the parentheses) have been covered (by converting in
whatever appropriate way). Which extends to possible backports. In a
subsequent, not to be backported commit we could drop them again if so
desired.

>>  static inline unsigned int acpi_get_cstate_limit(void)
>>  {
>> -	return max_cstate;
>> +	return max_allowed_cstate;
>>  }
>>  static inline void acpi_set_cstate_limit(unsigned int new_limit)
>>  {
>> -	max_cstate = new_limit;
>> -	return;
>> +	max_allowed_cstate = new_limit;
> 
> Do we want to check the new limit doesn't exceed max_usable_cstate and
> return -ERANGE or similar on failure?
> 
> After this change it's a bit weird to silently ignore invalid values
> IMO.

I disagree. Those values may be valid, just not usable (i.e. they are
still a valid upper bound, but we'd never go as high up). If people wanted
to use the same settings across their fleet, undue (and confusing) errors
might result on some of their systems if we did as you suggest. Plus we
have always accepted arbitrarily large (and hence entirely meaningless)
values anyway.

Jan

