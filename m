Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGc6Ilo2sWlqsgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:31:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F1260856
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 10:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250919.1548256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Fu4-0000sD-GZ; Wed, 11 Mar 2026 09:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250919.1548256; Wed, 11 Mar 2026 09:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0Fu4-0000pC-Da; Wed, 11 Mar 2026 09:30:56 +0000
Received: by outflank-mailman (input) for mailman id 1250919;
 Wed, 11 Mar 2026 09:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0Fu2-0000p6-Ql
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 09:30:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffe58b4a-1d2c-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 10:30:53 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4853fd7b59aso18613675e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 02:30:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854ad5416bsm30948735e9.1.2026.03.11.02.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 02:30:52 -0700 (PDT)
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
X-Inumbo-ID: ffe58b4a-1d2c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773221453; x=1773826253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FtsqVf6QKhpBEQjy6xK9B7TwWQyycFUwXYMJkg6Me0A=;
        b=UPCWk73r8TbAodFO5hlhjcDDhQ6wjIIbWJZYtUw98x6Tz8IbOyntw8OQlWLhKiKpSq
         +X2ZIQKo2vLZWdcVRiTEuep2ajcSzFVUzr6WZUjJ9HxsUA5mc5zG7qxRYUGu8xvC1/N4
         8fM3hHImOuIBdyCBf+sAUtRHRqaDQjLszpgyawiDWiCBOIgZLdRepIGnz0luvwzQ0bdU
         mh+yLVzNuMj6tXnGXy7Uo5U3cNLIQfVboeEJaZjHes0Ff+Bzpf3j7AemXQ0FZu4weUpi
         BV7/1oBfFA+aY+dzvGsG3egRun3K5LbE5Cid9RRP28Qbl00MTRUWmxN2ykgPKi0STNcZ
         BdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773221453; x=1773826253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtsqVf6QKhpBEQjy6xK9B7TwWQyycFUwXYMJkg6Me0A=;
        b=nMevP+O8IhA1HupmKO+MBh4QQjuRtMylT2c1x/gMir1Oi1SUtUl8zuPa9wpsrkXund
         T8SY23+lL9+znMxLubToStz7u0ZItJGWCiEr49/lbkgEhI7zC2Hu7kOA5WDLGApvL4HS
         OwiYYK13qB5fx6TG+ggDqkEqnxARbVFwHhYRGSgaL1SiTp5fnymE3sk4G5bGw7t2+R15
         6ZRuMqqrjfYtgFYkR/aKZtuYQu9eknx0u1neWz+aYnRyf7emUjwCejPzWnS5qDHf//cC
         8qh2RNv458EmfXK1/T+jvbJQw+zWkvBueFHFc+Tnj3BkZBhL+RogFfIccYdh1b8/Reim
         lOWw==
X-Forwarded-Encrypted: i=1; AJvYcCX/8mpr/KAu5KcdOwMIztkss7BM8vLFwwdNQmy1jWpm7rsWkdeFEOmmfqvC91friOaqgTFd5Gi4fl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvzQow522nThFyTT2NEjoKWWr7O265IUsxzu9ANN3rBrEbofR6
	13JNCNGLhvLx4UaX1pWrs6HlsmGWpb8UEhWQuYtUIKBZX6fBpneS2iXrmK1SilC2pQ==
X-Gm-Gg: ATEYQzwJK7f24i8Xo4g1RyWq5AtAa0N4vfgaWTpXhzB2PL3XA2l+fvb2nl8qk9DgEnz
	6q3DeGmSfdKIewtGepXL1yfZiRiPzloY15IQMefvnOnuLpnBRtK8G+ByQweL9DIz27iYMQBw490
	kvd4oFHwM9E+6YUqhB0LDKyYvmOcnHFOmI5TucFlNc9SII3i0EcsZGYuNx9mDt2etOvJue6iYlP
	jqeXJyphvEepca+zekqk6l22FDq383MOBeQZfravCK77DQsm6VcMFMf0/Gos4ttIWDfdEVfShZR
	KbDrZq2QslGq+tsEQu9v+ttRuzLgAxJWJ5yDWYS/PPGynbSyjOFRBd18E3zAQ7qQBfMN/6xs2st
	BR4SfB195Kl9DAShw3Hs3mu9k31OCAqs3wc4XnufZtt1Nv4f5youvnUxthf3GTShFhV637PV77f
	pvcprST/GrhMuNozsa+7ztdmDXrR7rrUMuWyttNGPHAv4n5bhHkpVcv+MlkNlIihSNIoxeR6WOx
	sVhW5fiRc+nCNk=
X-Received: by 2002:a05:600c:a404:b0:485:4bd1:4c64 with SMTP id 5b1f17b1804b1-4854bd14edamr22523395e9.31.1773221452944;
        Wed, 11 Mar 2026 02:30:52 -0700 (PDT)
Message-ID: <f5b74658-3a5f-47ac-8eaa-3f7fbf431a32@suse.com>
Date: Wed, 11 Mar 2026 10:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
 <20260213114232.42996-3-alejandro.garciavallejo@amd.com>
 <813d3fc9-170a-4f25-872a-3688946c236d@suse.com>
 <DGZUFMGSILDF.3ES3YACXM6AG4@amd.com>
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
In-Reply-To: <DGZUFMGSILDF.3ES3YACXM6AG4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DF8F1260856
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 11.03.2026 10:25, Alejandro Vallejo wrote:
> On Wed Mar 11, 2026 at 9:35 AM CET, Jan Beulich wrote:
>> On 13.02.2026 12:42, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -3832,69 +3832,47 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
>>>      return X86EMUL_OKAY;
>>>  }
>>>  
>>> -static bool cf_check is_cross_vendor(
>>> -    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
>>> -{
>>> -    switch ( ctxt->opcode )
>>> -    {
>>> -    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
>>> -    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
>>> -    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
>>> -        return true;
>>> -    }
>>> -
>>> -    return false;
>>> -}
>>> -
>>>  void hvm_ud_intercept(struct cpu_user_regs *regs)
>>>  {
>>>      struct vcpu *cur = current;
>>> -    bool should_emulate =
>>> -        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
>>>      struct hvm_emulate_ctxt ctxt;
>>> +    const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
>>> +    uint32_t walk = PFEC_insn_fetch;
>>> +    unsigned long addr;
>>> +    char sig[5]; /* ud2; .ascii "xen" */
>>>  
>>> -    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
>>> +    if ( !opt_hvm_fep )
>>> +        goto reinject;
>>
>> Is this possible at all, i.e. shouldn't there be ASSERT_UNREACHABLE() in
>> addition if already the check is kept?
> 
> It isn't.
> 
> v2 used to BUG_ON() at VMEXIT when !HVM_FEP and compile out this handler
> altogether, but Andrew was unhappy with it because he uses it occasionally and
> it'd be more of a PITA to undo the removal or force a HVM_FEP-enabled hypervisor
> for the #UD handler to be present at all.
> 
> I have no strong views on the ASSERT. It's not expected to happen, but I don't
> expect the existing conditions to change either, and if they do that will warrant
> a change in the handler too. 
> 
> If you want it I can add it, but if we're not killing the handler in release I
> don't think it's very helpful to assert/bug_on.

I see two options: Drop the if() or add ASSERT_UNREACHABLE() to its body.

>>> -    if ( opt_hvm_fep )
>>> -    {
>>> -        const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
>>> -        uint32_t walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
>>> -                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
>>
>> Why is this initializer not retained?
> 
> It is, it's just that the diff is terrible. An unfortunate side effect of the
> removal of the braces. The scope collapsing forces it on top of the function,
> before the emulation context is initialised.
> 
> It's set up in steps. walk is unconditionally initialised as isnsn_fetch, and
> later (after emulate_init_once()), OR'd with PFEC_user_mode for DPL == 3. See...
> 
>>
>>> -        unsigned long addr;
>>> -        char sig[5]; /* ud2; .ascii "xen" */
>>> -
>>> -        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
>>> -                                        sizeof(sig), hvm_access_insn_fetch,
>>> -                                        cs, &addr) &&
>>> -             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>>> -                                         walk, NULL) == HVMTRANS_okay) &&
>>> -             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
>>> -        {
>>> -            regs->rip += sizeof(sig);
>>> -            regs->eflags &= ~X86_EFLAGS_RF;
>>> +    hvm_emulate_init_once(&ctxt, NULL, regs);
>>>  
>>> -            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
>>> -            if ( !(hvm_long_mode_active(cur) && cs->l) )
>>> -                regs->rip = (uint32_t)regs->rip;
>>> +    if ( ctxt.seg_reg[x86_seg_ss].dpl == 3 )
>>> +        walk |= PFEC_user_mode;
> 
> ... here.

But that's the point of my question: Why did you split it? All you mean to
do is re-indentation.

Jan

