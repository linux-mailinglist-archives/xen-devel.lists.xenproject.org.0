Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK9iB4GJpWmWDQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 13:58:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7654E1D94E7
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 13:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244243.1543690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx2q3-0004sX-7P; Mon, 02 Mar 2026 12:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244243.1543690; Mon, 02 Mar 2026 12:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx2q3-0004q4-4d; Mon, 02 Mar 2026 12:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1244243;
 Mon, 02 Mar 2026 12:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx2q1-0004py-UV
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 12:57:29 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dbe07b9-1637-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 13:57:27 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439b6d9c981so686029f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 04:57:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b4175fd2sm11373336f8f.14.2026.03.02.04.57.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 04:57:26 -0800 (PST)
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
X-Inumbo-ID: 5dbe07b9-1637-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772456247; x=1773061047; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A4sw1FqBMT7nXxPURsGhVu+Kxp3Tqh0F1/FVVl4vg/s=;
        b=R8wr9T6qkWH35/X6Ret9N3t8KCWDW0CPwmZpTtyCnsIs3VmaPjJLbkiWOvUCnVh6Js
         fwLVqFFx8025POlCn5jkJhDXrmEThRuO4eUMfFEPQDb+UER12pl4csmPD84g/mqPRDkP
         MaB/zKQ8qLirIyK6P4chXDe5DUJl2JvXzhYemzgUh4ThgGC3cnLP0RqqefU4renniRnT
         WHpWBTcymfo+fpuyv5tD/V6T8Nv7MKU/m2la5Kmqz3aqJVUy9ST9Fd6rkRhQ0pMhTzoj
         rpFadWEA8Ocj2GscdNmOZEakuUNxc/ENqbJXt1vkMtOqkzS0vuPRiRzVkX8JLJnhCtFL
         AlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456247; x=1773061047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4sw1FqBMT7nXxPURsGhVu+Kxp3Tqh0F1/FVVl4vg/s=;
        b=PPYRD90DAgmxvTYWfld7do+dCZYafzgSPlRo0Jynfxf31bJlmR2DNNo2g/m5tGyKQN
         jSSeXbJ7pnfdtGnGfkO5jW5vWLxazKQDelXEs7l5kgzA7GwfYXpas2x4Mg+KiH4ScfIL
         RxeRLrFxaaHzfsx0pCcAJUzKJFs3ODtt+Tb4C+fpgumOms4VH5Lrl0VPyAw9fpwfiSRY
         PLCNBCbNYDmWcJnENXKXHoYpV4VapIIXBXDMGxsCz6GTZCfXmUfj747T2jMlz/R+VIY+
         +XfKB1eVI0Jqwjbdg7mYMU5s84bmQMDd/lEb8KKdHYNsB1ekF2Xq/m4KPPp904t3eNBo
         eHhA==
X-Forwarded-Encrypted: i=1; AJvYcCX5j4TX29SjS6G2OjY03Bbnzwo3hifndnoZjQRtbLC9TGvdEyVgK86z3Gov2C6s2/QJnC4mGA47vJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyI1ho3wq6tz+8/Z6bOzLUuabXjXeD17O9el6uPZ3/p//RRcsyg
	bYc0mnST+KgR7XdQOnVcZ1B5N45pmc050WV7o675qeTUMqJY15Qp4ERflwQCjVN+SbT1wkaLAh6
	18v0=
X-Gm-Gg: ATEYQzxPDbpzJVi2ur8ZCaI2QucdBXmAf/akQ1lKj0m021Lw68PcQIS9EjkZxLbjNXG
	MeAwHF0N4PAiNo3lcu7DWO/lyhJ7BwMlLdkFpSDnkL+wzmTevP1DUtMg2PHd8w7RpeFG0rDDs+/
	YFtZu5Did6TtuBn+HngBJsoW6kEDe5l0cQfJ/QAA08Xr4ZHRHnEHwnSyuofWqoBW6USdZN6zZdL
	5UXTTwuBBaT0EOntaAPXNuqzPF3oUi5lwpZWFIuuFpMNxjY3BUx4uCszwawN6xKj+M3Rmvdyzpc
	O3gRc0+kmMUy0/O5bL1Olr2O4fjqzZTqeAo3FKFKDBYKAiAiJD+1kP10j1PFyb5hjDDy27KMdxF
	Wln/9qaRw0rEWo3NP90N9/5mDXk8hqLF2shRKRowxRDaV+1/4HiRmOLXuJMwFODpMSxybIj6IYU
	Q8K7hslajRRaHvp3pQEsoJb4Tpu7UKqwiX0a02pC41TFC9fAjjmC8+5hvtDzmSO0cHNWsQgUUGd
	NRBcix6HR5TtWc=
X-Received: by 2002:a05:6000:2c06:b0:439:8559:98b with SMTP id ffacd0b85a97d-4399d97f826mr19942122f8f.9.1772456247038;
        Mon, 02 Mar 2026 04:57:27 -0800 (PST)
Message-ID: <f11e7bbc-3bb4-497a-a189-5e4d27e5aeb9@suse.com>
Date: Mon, 2 Mar 2026 13:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] x86/pv: Don't assume that INT $imm8 instructions
 are two bytes long
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-2-andrew.cooper3@citrix.com>
 <bf83838a-8401-4eb7-aea8-25ce59c9d492@suse.com>
 <c8013b73-de27-4354-9e45-da7d47c8b190@citrix.com>
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
In-Reply-To: <c8013b73-de27-4354-9e45-da7d47c8b190@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7654E1D94E7
X-Rspamd-Action: no action

On 02.03.2026 12:43, Andrew Cooper wrote:
> On 02/03/2026 11:03 am, Jan Beulich wrote:
>> On 28.02.2026 00:16, Andrew Cooper wrote:
>>> @@ -1401,6 +1402,53 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
>>>      return 0;
>>>  }
>>>  
>>> +/*
>>> + * Hardware already decoded the INT $N instruction and determinted that there
>>> + * was a DPL issue, hence the #GP.  Xen has already determined that the guest
>>> + * kernel has permitted this software interrupt.
>>> + *
>>> + * All that is needed is the instruction length, to turn the fault into a
>>> + * trap.  All errors are turned back into the original #GP, as that's the
>>> + * action that really happened.
>>> + */
>>> +void pv_emulate_sw_interrupt(struct cpu_user_regs *regs)
>>> +{
>>> +    struct vcpu *curr = current;
>>> +    struct domain *currd = curr->domain;
>>> +    struct priv_op_ctxt ctxt = {
>>> +        .ctxt.regs = regs,
>>> +        .ctxt.lma = !is_pv_32bit_domain(currd),
>> The difference may not be overly significant here, but 64-bit guests can run
>> 32-bit code, so setting .lma seems wrong in that case. As it ought to be
>> largely benign, perhaps to code could even be left as is, just with a comment
>> to clarify things?
> 
> LMA must be set for a 64bit guest.  Are you confusing it with %cs.l ?

Indeed I am, sorry.

>>> +    struct x86_emulate_state *state;
>>> +    uint8_t vector = regs->error_code >> 3;
>>> +    unsigned int len, ar;
>>> +
>>> +    if ( !pv_emul_read_descriptor(regs->cs, curr, &ctxt.cs.base,
>>> +                                  &ctxt.cs.limit, &ar, 1) ||
>>> +         !(ar & _SEGMENT_S) ||
>>> +         !(ar & _SEGMENT_P) ||
>>> +         !(ar & _SEGMENT_CODE) )
>>> +        goto error;
>>> +
>>> +    state = x86_decode_insn(&ctxt.ctxt, insn_fetch);
>>> +    if ( IS_ERR_OR_NULL(state) )
>>> +        goto error;
>>> +
>>> +    len = x86_insn_length(state, &ctxt.ctxt);
>>> +    x86_emulate_free_state(state);
>>> +
>>> +    /* Note: Checked slightly late to simplify 'state' handling. */
>>> +    if ( ctxt.ctxt.opcode != 0xcd /* INT $imm8 */ )
>>> +        goto error;
>>> +
>>> +    regs->rip += len;
>>> +    pv_inject_sw_interrupt(vector);
>>> +    return;
>>> +
>>> + error:
>>> +    pv_inject_hw_exception(X86_EXC_GP, regs->entry_vector);
>> DYM regs->error_code here?
> 
> Oh.  I'm sure I fixed this bug already.  I wonder where the fix got lost.
> 
> Yes, it should be regs->error_code.

Then (plus with my confusion above sorted)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

>>  Might it alternatively make sense to return a
>> boolean here, for ...
>>
>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -1379,8 +1379,7 @@ void do_general_protection(struct cpu_user_regs *regs)
>>>  
>>>          if ( permit_softint(TI_GET_DPL(ti), v, regs) )
>>>          {
>>> -            regs->rip += 2;
>>> -            pv_inject_sw_interrupt(vector);
>>> +            pv_emulate_sw_interrupt(regs);
>>>              return;
>> ... the return here to become conditional, leveraging the #GP injection at
>> the bottom of this function?
> 
> To make this bool, I need to insert a new label into the function.

Why would that be? Simply skipping the return and falling through will do,
afaics.

>  I
> considered that, but delayed it.  do_general_protection() wants a lot
> more cleaning up than just this, and proportionability is a concern.

Whatever you exactly mean with this.

Jan

