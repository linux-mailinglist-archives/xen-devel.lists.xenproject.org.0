Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNQ6ELuvjWmz5wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:47:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA6312CAC0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 11:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228653.1534789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTro-0006Y4-0p; Thu, 12 Feb 2026 10:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228653.1534789; Thu, 12 Feb 2026 10:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqTrn-0006Wd-U6; Thu, 12 Feb 2026 10:24:11 +0000
Received: by outflank-mailman (input) for mailman id 1228653;
 Thu, 12 Feb 2026 10:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqTrl-0006WV-OU
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 10:24:09 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6deba8d-07fc-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 11:24:08 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso25941995e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 02:24:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836cd7af87sm16973005e9.1.2026.02.12.02.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 02:24:07 -0800 (PST)
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
X-Inumbo-ID: f6deba8d-07fc-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770891847; x=1771496647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e04RPgEbBdiebFGDneJyTDWrjfgBLMwlPZQ6/CCKWmw=;
        b=VIV7F4tLuy4kt925xb6pf6OriBu4ZQa7JxJp6hXHcqKNkWm4nb5qJmzyINVGHiJFP/
         49huFlfhblxcYRzmDG3VvtawepJOSbAa6xQ3B/TSI6Ve3dDGD9dNIkeaY1na721hJpkP
         oFqw+iwi379WtlVo0g+xW75EeMU32C4QDhNzLh/z9eFy19UxDgEH1bnUI3xE4yyZOSqU
         TBqaOj+RdDRqHwd0ICm7II5PhQHvyw1fqJFLr3eYHAoiNip1GBrzEBXST5jK4Mz6Odzi
         W/AxtzI2VtP4Ca9IvOP+9L5IvJ7sXAGyokvb9J21be4YyKjPNxuKhWM7O3NVgjmrMMgP
         3/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770891847; x=1771496647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e04RPgEbBdiebFGDneJyTDWrjfgBLMwlPZQ6/CCKWmw=;
        b=QOUVZ9AVY6qTgBQzAowb3c6kDyr06iJylSROOL2f2xpvFh39nyJ5iKFMr+4g7W97Da
         EL24JE/dsMHvjx2pcScefMzOuiSpDVI5qj81wQTZfcOqqhvyAwOhcVQHDLyz73qQgm30
         9OnHo8DA+kpZUAz/3dGKrIFAULjWZDcxdy9HrYqnWGYaZNHFLq08I1zkET8xLRrmCLCe
         vrAIL3exWW9NnH56CWVnhOIQawyVjtyOGTB1iDkcGN8ifPaeqyILQXVaG11szGKhHNRD
         UdebHARo+rnmpXjaeq74EzoaGndL7K0FeFJkuWR1eiCT1aOKv8g1jp6SLNXsxwO2v+Xx
         Pplw==
X-Forwarded-Encrypted: i=1; AJvYcCVwZQjCabGafHJN26hpAM/HCkAstGdPE3Aq2LFo/hvzOuLcUMmkxuz6pONCeWQXz3kY0i6YwlHTGh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDFdyjPwJL8eP4qS7vZFeDrTefu+qKcxzFv/6EAsiX6cEexxKV
	jag6o/KbJdDsYzcN/4WFj+apo2EbWDFr6DIlDQRwiyYC7O4JuvL4n6jHtkXaDiEI+g==
X-Gm-Gg: AZuq6aL/DsEbk4oeul+VPImWZlozh9Sq64HnTY4K5O13uZTjSwpmHlCr2IXeLFZG0kR
	V/X+/7G7pmQgJys1nZzGNWFmqmjZmpRScmaOISdgOz9AbzlB9X/04ExxzzIZs60bPbJ/KgKcysf
	F4j6lSp0R0Di91JcK+V2UObGPt9t61iV3meD39ma1l6B4UzIG/tsKG+S1jR1ADRQjAZ+u5d72zz
	TEQGDeq3l5Y+c1Y36DESUs1f8D9uu6EuNYB7o5Oy4Ws6xwjZelcIPgQ2W6+w0ZNCEG5Ccn48Tnn
	R6svIbSih/ZKZEWtPA/5/frxf4ddi4Fdughd7wkzJpNMStz6KvlZd0qy8f92SQp2+5Zcf5Ke75P
	GWRHYiXNF/wUFdnJV/rFmMGhpnI3rnDBOzCamQQHslNLikf41kL9r1mhfZFRk9QlZoIpwHd56mV
	IraOr+yRkdZU0vURyMKXkJRZakcwmSDZ3lOGp9n914QjwkkGSZ5zGdLgx0L3pKcIAFZTF5nyjKv
	Y01Xtt5qQAZyRY=
X-Received: by 2002:a05:600c:c174:b0:483:3380:ca11 with SMTP id 5b1f17b1804b1-4836717eba9mr22623355e9.33.1770891847559;
        Thu, 12 Feb 2026 02:24:07 -0800 (PST)
Message-ID: <276d4b09-bf67-423e-b824-467405c5866d@suse.com>
Date: Thu, 12 Feb 2026 11:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <ced640968434a67c150eff90437f83d3b460a36c.1770650552.git.oleksii.kurochko@gmail.com>
 <d73424e2-84f4-497b-a1f4-f3eea5cdeeb3@suse.com>
 <f012a5f5-7526-4d41-b8eb-6f1208991b71@gmail.com>
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
In-Reply-To: <f012a5f5-7526-4d41-b8eb-6f1208991b71@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9BA6312CAC0
X-Rspamd-Action: no action

On 12.02.2026 10:37, Oleksii Kurochko wrote:
> On 2/11/26 3:16 PM, Jan Beulich wrote:
>> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>>> Based on Linux kernel v6.16.0.
>>> Note that smp_wmb() is used instead of smp_mb__before_atomic() as what
>>> we want to guarantee that if a bit in irqs_pending_mask is obversable
>>> that the correspondent bit in irqs_pending is observable too.
>> And the counterpart of this barrier is the one encoded implicitly in
>> xchg()? Could do with making more explicit, e.g. by way of adding a
>> code comment there.
> 
> I thought it would be clear from the paragraph below where xchng_acquire()
> is mentioned. I'll update the comment to make it more explicit.

I'm confused. The (bogus) mentioning of xchg_acquire() is in the patch
description, whereas I suggested a code comment.

>>> @@ -124,3 +125,72 @@ void arch_vcpu_destroy(struct vcpu *v)
>>>   {
>>>       vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE);
>>>   }
>>> +
>>> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
>>> +{
>>> +    /*
>>> +     * We only allow VS-mode software, timer, and external
>>> +     * interrupts when irq is one of the local interrupts
>>> +     * defined by RISC-V privilege specification.
>>> +     */
>> What is "when irq is one ..." intended to be telling me? There's no ...
>>
>>> +    if ( irq != IRQ_VS_SOFT &&
>>> +         irq != IRQ_VS_TIMER &&
>>> +         irq != IRQ_VS_EXT )
>>> +        return -EINVAL;
>> ... corresponding code (anymore), afaict.
> 
> That part should be removed, there is no any sense for it anymore.
> 
>> Further, who are the prospected callers of this function and its sibling
>> below? If they're all internal (i.e. not reachable via hypercalls or
>> emulation on behalf of the guest), this may want to be assertions.
> 
> Considering your further reply:
>    Having seen a use in patch 08, I should clarify the "reachable" part here:
>    It's not the "reachable" alone, but whether the guest has control over the
>    "irq" value passed. For the example in patch 08 this isn't the case.
> 
> I think I did not fully understand the part about “the guest has control over
> the ‘irq’ value passed”, but at the moment I do not have any plans for the guest
> to pass the irq value directly. (Do you have any examples where it should be
> needed?).

No, I don't. This is all for you to sort out.

>>> --- a/xen/arch/riscv/include/asm/domain.h
>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>> @@ -54,6 +54,25 @@ struct arch_vcpu {
>>>       register_t henvcfg;
>>>       register_t hideleg;
>>>       register_t hstateen0;
>>> +    register_t hvip;
>>> +
>>> +    register_t vsie;
>>> +
>>> +    /*
>>> +     * VCPU interrupts
>>> +     *
>>> +     * We have a lockless approach for tracking pending VCPU interrupts
>>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>>> +     * in irqs_pending. Our approach is modeled around multiple producer
>>> +     * and single consumer problem where the consumer is the VCPU itself.
>>> +     *
>>> +     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
>>> +     * on RV32 host.
>>> +     */
>>> +#define RISCV_VCPU_NR_IRQS 64
>> What is this 64 deriving from? IOW - can it be some kind of expression,
>> helping the reader?
> 
> Originally it derives from the width of mideleg, mie, mvien, mvip, and mip (and
> their counterpars for other modes) what means that RV32 will have no more then
> 32 local interrutps, but considering that RISC-V AIA spec tells ...:
> 
>    Table 2.1 lists both the CSRs added for machine level and existing machine-level
>    CSRs whose size is changed by the Advanced Interrupt Architecture. Existing CSRs
>    mie, mip, and mideleg are widended to 64 bits to support a total of 64 interrupt
>    causes.
>    For RV32, the high-half CSRs listed in the table allow access to the upper 32
>    bits of registers mideleg, mie, mvien, mvip, and mip. The Advanced Interrupt
>    Architecture requires that these high-half CSRs exist for RV32, but the bits they
>    access may all be merely read-only zeros.
> 
> ... that for RV32 it was widened to 64, so 64 appears here. I haven't used some AIA
> specific name for constant 64 as in case if AIA isn't used it is more then enough
> to cover PLIC case, for example.

Thing is that with RV128 in mind I wonder whether 64 is correct, or whether it
e.g. wants to be max(BITS_PER_LONG, 64).

Jan

