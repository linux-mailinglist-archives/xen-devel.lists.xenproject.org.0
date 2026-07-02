Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HMcnEUkORmqWIQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 09:07:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0C6F4048
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 09:07:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=AKbG5dqw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351276.1608497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfBVh-0007fD-Qa; Thu, 02 Jul 2026 07:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351276.1608497; Thu, 02 Jul 2026 07:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfBVh-0007cu-NU; Thu, 02 Jul 2026 07:06:57 +0000
Received: by outflank-mailman (input) for mailman id 1351276;
 Thu, 02 Jul 2026 07:06:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfBVf-0007cn-DG
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 07:06:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfBVe-004g8K-5Z
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:06:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a460dff-2eae-0a2a0a5409dd-0a2a450ad4fc-26
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:06:54 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a460e0d-e40e-0a2a450a0019-d155dd2dc8dd-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:06:54 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-475417f010dso933938f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 00:06:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dcf59sm6614748f8f.34.2026.07.02.00.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 00:06:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1782976013; x=1783580813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JIa3ZtQnmr5bzh3sgHLJgVuJFtyf3ipj2ua5AIkulis=;
        b=AKbG5dqwVnWcVDI3EixT0QRt2O1aPtA6Pe+lnUKP3vBUJrlCV/ocv7EX52XZesdOOg
         fPTy75ha7wTL+15c8wHOCmzwFkdDd49s1RZwzTE+jyjfb9nodFJu9507yQ3WKVwyWYiV
         TeiWMGoskf2W1jdAbQSiZNO/Jwzm1z/ufIgPoBEbgyDZBwMj+uNxDmUbuZrN4Ho5TbJj
         4J7jBPd24FhMjf7jKD6OgoNSUW6PBdxb5lHY3qshpiNejhrIvYYR4fVMuiKpE3v4wWkR
         6zGcU8n3CtvYH1VoWAMyfqpKP81NlUbKRLolEFflXAW69Hx4377zO4Hp2aH3SfNO8E7k
         yWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782976013; x=1783580813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIa3ZtQnmr5bzh3sgHLJgVuJFtyf3ipj2ua5AIkulis=;
        b=Q2BUAaJMRIf93wqA0JWeko4AGwW9Jw6BXaVXwlPRGKT9hgtL6SsgSgpvXkt1ToAvza
         KXoLUYknYlmJbwALi3Pv4/zK7saA/4kPVRZdi+eXE+57VO1j8LEYpQSQd9xYxw7om/z9
         ATdRK+2t56o0k61KiiRwZQz5SzeDX6/utNEGFAgRSeYzMTjkUzfHJtXlczZJGYylOBNt
         7Dj+hOgmw00eS8DvuH/6pNHffEWfKm/96xNEu2Kt8ziWC8AU1drE3U8FvJcr0PEqp4AQ
         vQMj9NT80gvvTo6tgCFVe+PS4io08t14wdYt3Am0kvjmWCiMbQcD1Nki9+ZziCYTu7X6
         Q8hQ==
X-Forwarded-Encrypted: i=1; AHgh+RpX9dg+O0wWbGJfKZ8qaMX+5oIdrO4NYczMLQCHNW3WvSsiRJKxeeM5sYiHjI/z222yfNQE2SN60B4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA9Ivum01bbRGBS9+OA3a9f1XrmSYe9Ayacrn8BGUdqC7LIwBJ
	5toHpJ/H5sRwcZHGTEregS97gJfV10FPVBpoT/m56YugWPQc47Y4TPwOvOEVK9pFAw==
X-Gm-Gg: AfdE7ckAyn7YqKhg1AtZjPBk8RtqHz/HgAed6A6OEhw2cKkpufwJFRtVei9YjtYoBJh
	XX6i9b0rAA/64zR0hb6l5bJYLhbuoN/XC0Lat/U1+oieOjloU/iH1zZ345PBTcBmVJU3prsVSd4
	QBX8JXnfxxd/vKrUYAlwCcqlwlmDEoZrAyBvld3W0P3GqbQWUYe/Cp9LR1Oejy4KjG3NAFdUqaC
	xYmvrKgqE4U1V/l7VORo6Od8YOitR6ZjmARqrz5kD03pfcCHIRBu9Ew15DNDc6lrtc+cfiVp2XP
	EZeel7Jmw5Zo96Tip4qs6uHMsX/TtlsO8U6RZD9AgEK6gZOAedGbio2C7ZcKnKpBf1gxjwNDidx
	VdRHntKma3b/W3vRa7Am7LxURQ8Xnk8vS4M10Mi3F5VGfq6oyUcKlQ63MCS1BZIF1EEu0h+qj2I
	bYADvCytaPuTQfF4nYeMVkw91EL2S55XfQb0ZlJs2EqMtH1xzK9SdH9SvKTB7NSPpObkMEPMBsW
	dV4bjF+HvFvZUg=
X-Received: by 2002:a05:6000:4687:b0:474:6a5b:861d with SMTP id ffacd0b85a97d-47759568499mr5060699f8f.45.1782976013421;
        Thu, 02 Jul 2026 00:06:53 -0700 (PDT)
Message-ID: <2a524220-72a8-422d-8571-f5111b090c1d@suse.com>
Date: Thu, 2 Jul 2026 09:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: set up host policy earlier
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6dccae5f-fe09-4f35-9e4a-7a38fb21e8d1@suse.com>
 <53018bb5-0ad4-449e-adda-6b2d94a0935e@citrix.com>
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
In-Reply-To: <53018bb5-0ad4-449e-adda-6b2d94a0935e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1782976014-3C07ADDE-7DF6AF92/0/0
X-purgate-type: clean
X-purgate-size: 3113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AA0C6F4048

On 01.07.2026 17:21, Andrew Cooper wrote:
> On 07/04/2026 7:46 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -586,6 +586,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
>>  	}
>>  
>>  	/* Now the feature flags better reflect actual CPU features! */
>> +	if (c == &boot_cpu_data)
>> +		calculate_host_policy();
> 
> calculate_host_cpu_policy() now it's not local to cpu-policy.c

Sure.

>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -359,7 +359,7 @@ void calculate_raw_cpu_policy(void)
>>      /* Was already added by probe_cpuid_faulting() */
>>  }
>>  
>> -static void __init calculate_host_policy(void)
>> +void __init calculate_host_policy(void)
>>  {
>>      struct cpu_policy *p = &host_cpu_policy;
>>      unsigned int max_extd_leaf;
>> @@ -904,6 +904,7 @@ static void __init calculate_hvm_def_pol
>>  
>>  void __init init_guest_cpu_policies(void)
>>  {
>> +    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() uses. */
>>      calculate_host_policy();
> 
> I'm sorry, but no.  The cleanup work to CPUID handling is in an attempt
> to purge this antipattern.

And it's not meant to stay here, once that cleanup work has further
progressed. We did discuss this on one of the recent calls. I'm happy
to ...

> Double-initialising data structures *is* the entire reason we have
> order-of-boot problems in the first place.  Having a structure which is
> initialised but wrong is itself wrong.

... go further, just that I don't think what you suggest below will
work.

> Really, I should insist on a revert of switching cpu_has_* to use
> host_policy.  It was not adequately tested and is not compatible with
> how Xen starts up.

You realize that there was no "switching cpu_has_* to use host_policy"?
There's no representation of leaf 6 in x86_capabilities[], and it
seemed awkward to introduce it when we're really moving to using the
policies.

> But as I expect you're going to object to that feedback, I'll tolerate
> setup_*_cpu_cap() keeping the host policy correct as they're called. 
> The easy option is to call x86_cpu_featureset_to_policy() each time. 

Except that this isn't going to be enough. It may not need to be all
of what calculate_host_policy() currently does, but at the very least
recalculate_xstate() will imo need calling. Yet any cpu_has_* used
there and changing value would also have a knock-on effect. Overall it
then looks less error prone to me to call calculate_host_cpu_policy()
from there (then very obviously eliminating the need for the call from
init_guest_cpu_policies()), accepting the slight extra overhead.

> The lower overhead option would be to have a table similar to
> cpu_user_regs_gpr_offsets[] and use that to locate the feature word in a
> policy object as it's being edited, although it's yet another thing to
> remember to keep in sync when adding new words.

As per above multiple feature words may be affected by a single change.
Hence I think this isn't an option.

Jan

