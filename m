Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LPTBCdFxmmgIAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 09:51:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF10341519
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 09:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265209.1556238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w62u7-0005mX-8m; Fri, 27 Mar 2026 08:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265209.1556238; Fri, 27 Mar 2026 08:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w62u7-0005k7-5M; Fri, 27 Mar 2026 08:50:55 +0000
Received: by outflank-mailman (input) for mailman id 1265209;
 Fri, 27 Mar 2026 08:50:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w62u5-0005k1-Fn
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 08:50:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w62u4-00583o-RB
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 09:50:52 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c644df-5cb7-0a2a0a5109dd-0a2a450c9176-26
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 09:50:52 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c644ec-f93d-0a2a450c0019-d1558029e93b-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 09:50:52 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-486fba7ce4cso18963795e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 01:50:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48725fd18b7sm13173765e9.13.2026.03.27.01.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 01:50:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1774601452; x=1775206252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wuAQ4Bxx/ykp94+TYpISvvtOEOUswdYHZTQGuqAiPb4=;
        b=M1yDmIQRO7nYHn08M4MYjL4Rzgjau8HPV7wS96BQ7Kjvii5O4/6qte2b3ge4Ik/Mdp
         /5WrufgT2yjimaljHLCdt+NpqF3RKqrM68Ugm1SqMZcNeKcgfUF1wnjMj74pZUAGbJKZ
         exoMbIpnDhTrnqt7qyOxGFh9hvOYxlMBQLqCidgqJ0RcT30lErM4shxH8FkNf34ionOY
         R+0LDZo3quMfMDxltYspl6W7HC1Kj0SK30rFZqSzk2K+wsoB/KACzz/zTO0YZmZLCtC4
         uQC6fV70oTTs3YJgw7cIlcofUZvyoGRwQFzaaQ45h6PbD4kOG8HMi9wazTR8BKvSh3pB
         k4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774601452; x=1775206252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuAQ4Bxx/ykp94+TYpISvvtOEOUswdYHZTQGuqAiPb4=;
        b=dN0Iga2DidB3TQ86Nt4ZIvUreaMQSNF5XL/ex0C5nOul53zy3putMpHYCkCplBtITb
         Egxg5YNk5iFJ/uQnlPnG7mDaewem6uO3btry9ATlzLhFaq4GQb5Tt1gcsMhgFHV927If
         OJbdEijgE9J1GxSyB1CJvw/LwsltW/IHp3jGeOgKXjgAJK8htmJ7DyDRx54lP2oIZCSF
         4xbNlv9pZvkWTzulTTjE5GPnvbINrQamHwDgF3AcBG0Dko/gV0acv0/RKD/iH+Pc96PH
         GSxSwcshUR9wbCFzNUUx/4PyDeReHsdiSHpdgqd0b806i9hVmsgNt74t6wrYEtvZn4ur
         8s3A==
X-Forwarded-Encrypted: i=1; AJvYcCVAHFfe++ipUB0VQ1QrGj9t4tdSCbsFVbE9HnlgBpS90ROSspT26/1KxjEEfdbet9i36Z+Y319fPDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxvf8bPfjl/cq8+Es6DUOPMEWOJWQ1Qsrw0wU6nkd5EFUbzGmml
	NaNXzqQYtH3jALdQ/b6HHODnLCjlHP/b0L9H8/PSttiXEGFZbfeAJyT2d1Gpr48+PQ==
X-Gm-Gg: ATEYQzz2HLyvN0ygBgyvSyuNt29Ov2tKowSd23EQ552iJyNj/0uX2CatyHVbonRwS/y
	l2hL6Ijjaz/1BWV7hOARziN4aWK4t/+gHq5PUeTLO7UPe/u4AcerIs/s06hRxx0frWMopsCm0cK
	j0rMuo0D65k47gy3wlKeDpcTgbjCD4HJNEBQ2CGTJOqhUSqDi4vX77ZuzQtxPf1yLYDckApRg+i
	GftWYTQysiUOjn3yq1qYCyTq0bcMW23eQ8uACWai7CfTeJ7DK5Y7QFNO7Lwz3rQEfq2cGRX3hUi
	Q8kAHl/ROwf03pmFRSh/givr09BuHK0KoscHHNyp6fMlz+PbzpECqkmMeWbJj21jP+Lxjt6uNVF
	8GsXW5wDDqjUkdvKUswVVzfCHsab52yXb3Do74h5Cl1ZNtg8yVuGYvqWei9Lq9kkSntxjl/Kvhs
	0d5Ik8xBSmzqF7iZ7PraxXIwqALs6sC+YHHRHYHM4Hj6g6b+cO7NxL67U6JmelGK41cGn7PIcIy
	qp0fNcuTOcTig4=
X-Received: by 2002:a05:600c:c493:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48727ef16f4mr24811555e9.25.1774601451990;
        Fri, 27 Mar 2026 01:50:51 -0700 (PDT)
Message-ID: <b67bbdd7-e1dd-4a18-b552-1c90d6323ac9@suse.com>
Date: Fri, 27 Mar 2026 09:50:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/pv: Provide better SYSCALL backwards
 compatibility in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
 <20260325170208.1115832-3-andrew.cooper3@citrix.com>
 <059588cd-d73e-40a1-98b4-65be01957d41@suse.com>
 <08a02b65-92f5-4e78-8c34-38a22ae4d906@citrix.com>
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
In-Reply-To: <08a02b65-92f5-4e78-8c34-38a22ae4d906@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774601452-F5EB3734-33FFD780/0/0
X-purgate-type: clean
X-purgate-size: 3971
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6BF10341519
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 22:05, Andrew Cooper wrote:
> On 26/03/2026 9:14 am, Jan Beulich wrote:
>> On 25.03.2026 18:02, Andrew Cooper wrote:
>>> In FRED mode, the SYSCALL instruction does not modify %rcx/%r11.  Software
>>> using SYSCALL spills %rcx/%r11 around the invocation, which is why FRED not
>>> doing this goes largely unnoticed.
>>>
>>> However, consider the following migration scenario:
>>>
>>>  * VM suspends.  Hypercall, so SYSCALL, %rcx/%r11 left unmodified
>>>  * VM moves to a non-FRED system
>>>  * Xen resumes the VM with a real SYSRET instruction
>>>
>>> Instead of resuming at the instruction following the SYSCALL instruction, the
>>> VM is resumed at whatever dead value was in %rcx.
>> Would it? In restore_all_guest we load %r11 and %rcx from the stack
>> frame's EFLAGS and RIP fields. If we didn't, various other things wouldn't
>> work either.
> 
> Hmm.  I suppose so.  regs->rip/eflags is always going to be
> reconstructed properly for the records in the transmitted stream.
> 
> What will be wrong is the %rcx/%r11 put onto the guest stack.

Okay, this is addressed by ...

>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -2405,6 +2405,8 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>>>  
>>>              regs->ssx = l ? FLAT_KERNEL_SS   : FLAT_USER_SS32;
>>>              regs->csx = l ? FLAT_KERNEL_CS64 : FLAT_USER_CS32;
>>> +            regs->rcx = regs->rip;
>>> +            regs->r11 = regs->rflags;

... this change.

>> Don't you also need to set TRAP_syscall here, for the new code in
>> eretu_exit_to_guest to actually make a difference?
> 
> It is create_bounce_frame() which sets up TRAP_syscall.

Hmm, right. I was misled by {l,c}star_enter and sysenter_entry setting
the flag explicitly. That looks to be necessary only for the pv_hypercall()
path out of lstar_enter; everything else goes through create_bounce_frame().

>>  (There actually is
>> a paragraph about this in the comment out of context above, which then
>> may also want adjusting.)
>>
>> Further a question as to limiting overhead: Doing this on every SYSCALL
>> entry ...
>>
>>> @@ -26,7 +27,16 @@ FUNC(entry_FRED_R3, 4096)
>>>  END(entry_FRED_R3)
>>>  
>>>  FUNC(eretu_exit_to_guest)
>>> -        POP_GPRS
>>> +        /*
>>> +         * PV guests aren't aware of FRED.  If Xen in IDT mode would have used
>>> +         * a SYSRET instruction, preserve the legacy behaviour for %rcx/%r11
>>> +         */
>>> +        testb   $TRAP_syscall >> 8, UREGS_entry_vector + 1(%rsp)
>>> +
>>> +        POP_GPRS /* Preserves flags */
>>> +
>>> +        cmovnz  EFRAME_rip(%rsp), %rcx
>>> +        cmovnz  EFRAME_eflags(%rsp), %r11
>> ... and every exit-to-guest isn't very nice when concern is about just the
>> specific case of migrating FRED -> non-FRED. Couldn't we instead make the
>> adjustment when generating the save record for the register state of the
>> vCPU?
> 
> Ignoring migration for a moment, there are two further cases where
> things go wrong.  Consider a VM which logically does this:
> 
>     // user mode
>     SYSCALL
>     mov %rcx, dbg_syscall_was_here
> 
>     // kernel mode
> entry_SYSCALL:
>     ... setup stack
>     mov %rcx, UREGS_rip(%rsp)
> 
> 
> Both of these positions under FRED have unexpected content in %rcx/%r11.
> 
> In userspace it is common to spill %rcx/%r11 and restore them around
> SYSCALL, but that's not an ABI.  This is addressed by the hunk in
> entry_from_pv().

Right, and the eretu_exit_to_guest change mirrors what we do ahead of
SYSRET (or its conversion to IRET). While there are cases (for both
paths) where RESTORE_ALL / POP_GPRS would already have restored the
intended values, there are enough other cases where the value would
have changed.

Overall, however, I think that the patch description would want
altering, to cover more aspects (as discussed).

Jan

