Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHiQKv9Bc2mWtwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 10:40:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109FA7386C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 10:40:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212095.1523408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjDdv-0003pJ-Cm; Fri, 23 Jan 2026 09:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212095.1523408; Fri, 23 Jan 2026 09:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjDdv-0003mD-96; Fri, 23 Jan 2026 09:39:51 +0000
Received: by outflank-mailman (input) for mailman id 1212095;
 Fri, 23 Jan 2026 09:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vjDdt-0003m7-U8
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 09:39:49 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 750ce90a-f83f-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 10:39:48 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47ee4539adfso21379815e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jan 2026 01:39:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804f5ad4c1sm13564285e9.12.2026.01.23.01.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 01:39:46 -0800 (PST)
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
X-Inumbo-ID: 750ce90a-f83f-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769161187; x=1769765987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=14qnw9e2RNgm4SDgwK2PAZovv873Z+Z1se6MygmX4Vg=;
        b=MB67WgE53ypxS3tttU1ubFWRSy7EzSkr+tRyWz8NL4GisvbU9jP/M8+EXVoiSPC/ZR
         bxERpcoAoEhIvvT/CxMD8FX1AgOxSj8OTY7l4FI8/ZD5gdXvQ7/3EIkeL0FZAl8ZnoWy
         zp4VUFqzZ4TrZ7SdF/pqqrFVi3yvhXGPuwv91gAJ6qHIv2QpBZ1/l1dYfGyJNKTJscUI
         rR8LFmphQiI3EMlR2DH4NlJv7ZTr5/1e9Lbyp/BfPM/qnYZ30kfD3N0bDzZ0zGvRFvdc
         iiz6B/WZso6HIf0HnXatPL5srrqeKlvTG7F6jXe236wMCe0H3zmNNQOxBshFi2cOFEGa
         QGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161187; x=1769765987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14qnw9e2RNgm4SDgwK2PAZovv873Z+Z1se6MygmX4Vg=;
        b=MA0hvin2r0ZghPbjnWKx+x7kKFW7q1ijBPiBaNJAdeiQMp6hVIciyuJ1VlF8p92Ukv
         oq38pJ7tLahrhPY5m/zPF3y7D8rSRqk1d2NFXriOyb2oAglKNjnXebM060v+e2eyQWdF
         xOS9mlUFETTzkDWT6y0YHHvzFZ0/Pk/9TLQ/O/oQJSZNw8nIEEZsZCDCBpOjzDSZnafg
         U6Ws0nlJImx2ZaddZ6iw9RRtDPHvz8znzLnxp/TkXiGewUdee5OTMEbaZKtytQNJXflk
         rug4vPQs5SiVgrR/7l1W0KZVlrTcwyb+hgFdtwgRlmPr9+fR+PnJLFrBJg5d6RbrD1rR
         CRzg==
X-Forwarded-Encrypted: i=1; AJvYcCUcyu8Cj1CGYrAYrw0DKBIdgcgdas7lGuRG/V1X836DUl5fpFyAqiym+sRRgGyhKZqix1E9P6ptKc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdT0K+7sAgLovjFCyuC/zWgOXubCIw29LHYsrFyYQn04XGD18+
	jIQ7uD4FDoiht1JIEh3zyWj8Y9LhAwrIHAmVx7c/2qvIrVT0rpkx8myjA2O/9NPgeg==
X-Gm-Gg: AZuq6aI9iClt6OhFlSuM+BTjrEoRorP8OUEuPJ7AgBVyaGhCOwv4qi9AX7F9fvHpwpz
	PBrz48IaYYuVCI/QuJLWjHk2VDD3g6upEbD0DLzMlLnm47N3vcxS4QG0Ot0l+MX0IF2CW3/SGEt
	0t6JJ7hlbbJrKbS5BGNmlTMAirDGf2w8Zixgt0euVU1ZqFFRxXh/3eFwR84gnaiW6tCBrrknBNC
	/+BSt2cyhGxbKBu6EMw5W0VHyqKBzrPyILdIispRu7WKs8600NHHDwi0e9oBMSjgczSZ2yi4zmu
	pqSWpOOcXFgDoRmWAE2bfyDxqGkxn4m6+BfWvt75fKyucH81PtbcEiNQn6qW4/D/S6j6sGHeUzZ
	1wNtaa5S/XCkDBsddfLDbxr1NFZzRp6zbvoL7aVrkUrRoRduM9+Rc/+1amY3ru5WOIs3T10R77+
	dtF06d5z8wAGdzQ5R0enxJP8oQ24mQUbUNA74AnecL7qcpQLPp1CyMn+aEr7rdydDMCyxc5rtwJ
	OM=
X-Received: by 2002:a05:600c:608a:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-4804c947d6amr42700665e9.7.1769161186853;
        Fri, 23 Jan 2026 01:39:46 -0800 (PST)
Message-ID: <5aafd748-96fb-444a-b297-96b5cca86b2d@suse.com>
Date: Fri, 23 Jan 2026 10:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: dump GPRS and CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <f6f7ec863e92ade433f23ae0061391d2ef731f41.1768579139.git.oleksii.kurochko@gmail.com>
 <843ba134-099c-49a1-8561-5e364b630bc8@suse.com>
 <dac2520a-ba66-4514-b03f-04ea8b440913@gmail.com>
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
In-Reply-To: <dac2520a-ba66-4514-b03f-04ea8b440913@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.928];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 109FA7386C
X-Rspamd-Action: no action

On 23.01.2026 10:09, Oleksii Kurochko wrote:
> On 1/19/26 9:34 AM, Jan Beulich wrote:
>> On 16.01.2026 17:16, Oleksii Kurochko wrote:
>>> Provide more context on the exception state when an unexpected
>>> exception occurs by dumping various Supervisor, Virtual Supervisor
>>> and Hypervisor CSRs, and GPRs pertaining to the trap.
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in v2
>>>   - Address coments about print_csr() macros and dump_csrs().
>>>   - Add dumping of GPRs pertaining to the trap.
>>> ---
>>>   xen/arch/riscv/traps.c | 82 ++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 82 insertions(+)
>>>
>>> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
>>> index e9c967786312..4e0df698552f 100644
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -17,6 +17,13 @@
>>>   #include <asm/traps.h>
>>>   #include <asm/vsbi.h>
>>>   
>>> +#define print_csr(csr) \
>>> +    printk("\t" #csr ": %016lx\n", csr_read(csr));
>> This prints the CSR_ prefix of the internally used constants. Is this useful
>> (rather than extra clutter)?
> 
> No, the prefix isn't really useful. It was printed so only because all CSRs registers
> defintions start on CSR_*.
> 
>>   Unlike for the GPRs this also prints the register
>> names in upper case. That may be fine, or may not be.
> 
> I will follow then like it is written in RISC-V spec for consistency.
> 
> 
>>   The values printed also
>> won't align, which may make reading more difficult.
> 
> Do you expect the similar alignment like for GPRs?

"similar" is ambiguous here. I'd expect whatever alignment helps readability.

>>> +#define print_gprs(regs, reg1, reg2) \
>>> +    printk("\t%-7s: %016lx %-7s: %016lx\n", \
>>> +           #reg1, (regs)->reg1, #reg2, (regs)->reg2)
>> Yes, two per line is certainly helpful. Why not also for some of the CSRs.
> 
> It is less clear how it would be better to group them. I thought about
> CSR_STVEC: ....    CSR_VSTVEC: ....
> CSR_STTATUS: ...   CSR_VSSTATUS: ....
> 
> So group them in S-mode mode register and VS-mode register.

That's an option. Don't know how this would end looking like all together.

>>> @@ -99,12 +106,87 @@ static const char *decode_cause(unsigned long cause)
>>>       return decode_trap_cause(cause);
>>>   }
>>>   
>>> +static void dump_general_regs(const struct cpu_user_regs *regs)
>>> +{
>>> +    printk("\nDumping GPRs...\n");
>> Register names alone will be meaningful enough? Be mindful of serial line
>> bandwidth as well as screen resolution.
> 
> Agree, we could drop this print. (Then probably the same could be for Supervisor CSRs
> and Virtual Supervisor CSRs, etc as it is clear based on the name which one CSR it
> is)

Of course I also meant to cover the other, similar ones, yes.

>>> +    print_gprs(regs, ra, sp);
>>> +    print_gprs(regs, gp, tp);
>>> +    print_gprs(regs, t0, t1);
>>> +    print_gprs(regs, t2, s0);
>>> +    print_gprs(regs, s1, a0);
>>> +    print_gprs(regs, a1, a2);
>>> +    print_gprs(regs, a3, a4);
>>> +    print_gprs(regs, a5, a6);
>>> +    print_gprs(regs, a7, s2);
>>> +    print_gprs(regs, s3, s4);
>>> +    print_gprs(regs, s5, s6);
>>> +    print_gprs(regs, s7, s8);
>>> +    print_gprs(regs, s9, s10);
>>> +    print_gprs(regs, s11, t3);
>>> +    print_gprs(regs, t4, t5);
>>> +    print_gprs(regs, t6, sepc);
>>> +    print_gprs(regs, sstatus, hstatus);
>> The last three aren't GPRs. Why would they be logged here? (All three also
>> being logged in dump_csrs() would further require some disambiguation in
>> the output, for people to not need to go look at the source code every
>> time.)
> 
> Agree, that it would be better to print it with the CSRs. It was print here
> only as they are in the same structure with GPRs.
> 
>>> +}
>>> +
>>> +static void dump_csrs(unsigned long cause)
>>> +{
>>> +    unsigned long hstatus;
>>> +
>>> +    printk("\nDumping CSRs...\n");
>>> +
>>> +    printk("Supervisor CSRs\n");
>>> +    print_csr(CSR_STVEC);
>>> +    print_csr(CSR_SATP);
>>> +    print_csr(CSR_SEPC);
>>> +
>>> +    hstatus = csr_read(CSR_HSTATUS);
>>> +
>>> +    printk("\tCSR_STVAL: %016lx%s\n", csr_read(CSR_STVAL),
>>> +           (hstatus & HSTATUS_GVA) ? ", (guest virtual address)" : "");
>>> +
>>> +    printk("\tCSR_SCAUSE: %016lx\n", cause);
>>> +    printk("\t\tDescription: %s\n", decode_cause(cause));
>>> +    print_csr(CSR_SSTATUS);
>>> +
>>> +    printk("\nVirtual Supervisor CSRs\n");
>>> +    print_csr(CSR_VSTVEC);
>>> +    print_csr(CSR_VSATP);
>>> +    print_csr(CSR_VSEPC);
>>> +    print_csr(CSR_VSTVAL);
>>> +    cause = csr_read(CSR_VSCAUSE);
>>> +    printk("\tCSR_VSCAUSE: %016lx\n", cause);
>>> +    printk("\t\tDescription: %s\n", decode_cause(cause));
>>> +    print_csr(CSR_VSSTATUS);
>> As before, imo justification is wanted (in the description) for logging
>> VS* values.
> 
> It is hard to describe in general why they could be needed. The best I can
> come up is:
>    Dump VS* CSRs to provide full guest exception context. When handling traps originating
>    from VS-mode, host CSRs alone do not describe the fault; VSCAUSE, VSEPC, VSTVAL, and
>    related state are required to diagnose guest crashes and hypervisor misconfiguration,
>    and to correlate host-side handling with guest-visible exceptions.
> 
> Does it good enough justification?

I think diagnosing guest crashes doesn't belong here. An unexpected trap is
entirely different from a guest crash. Hypervisor misconfig I might buy, just
that I don't (yet?) see the connection to the three particular registers you
name in the suggested text. (As mentioned before, this may simply be because
of my lack of a proper global picture of RISC-V.)

Jan

