Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHJUO7nyeWnT1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:27:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B145A05CB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215498.1525673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3hx-0000or-EH; Wed, 28 Jan 2026 11:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215498.1525673; Wed, 28 Jan 2026 11:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3hx-0000n9-BR; Wed, 28 Jan 2026 11:27:37 +0000
Received: by outflank-mailman (input) for mailman id 1215498;
 Wed, 28 Jan 2026 11:27:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl3hv-0000n3-Pz
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:27:35 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fd4df47-fc3c-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:27:21 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so56131315e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 03:27:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806d98c8desm45854915e9.3.2026.01.28.03.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 03:27:20 -0800 (PST)
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
X-Inumbo-ID: 4fd4df47-fc3c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769599641; x=1770204441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVpOSUXzCiwxMHX5M5St66mv0ViHigMh18IDOvqmHVI=;
        b=FIROVEFnhtT6NwgiYIL7cWgZtnJzGewy0qGyY1uLxoLQI/DWgQtgZ1+f7aIQk/pbhH
         lKV/KpuXAXYm8XVPvvuI/Asnr2OPjRqf/2DUq9fd8LqQQWb3HmS17o6kg6Rj5dzlC2G/
         RBTfuO1NsJyqmtZriJvpsk7ck99nyN27IvYlCo29gXK2H/Yg70rJfeLlStwdtyS1XOno
         iZXLfCiB6pqY+hCg5T5iTGIuEHq0z/7XdSUuVhljAJ30tuKryQjWiwapGmZAbsz+gE6P
         MoF3ueoYe2ly9VVX7425e09Qyc/aOxnYn8Fhb8XC+v341+WXoNh6pGv6jvIT/w/El6bR
         5Bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599641; x=1770204441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVpOSUXzCiwxMHX5M5St66mv0ViHigMh18IDOvqmHVI=;
        b=aLcZuBCTMksQFp3GCswMb/2Rc9pHNHyrqXsSi5EWJMLG5im0hzT7UCOUrphziG/pSp
         F2/K6Lv74imZv4Ctjj/8ufnbfOJI21rfOmy9NO5n1EwdlIelfUnC1ZDVZiboe2XjHMrw
         u3TndaukQaA3+d1YXytMZ65qVCN0WhYIUYHa9d8XAmhnO7VSy2r1SJTL50vKvvUI6mIo
         iXGoF44jEs1/i4qVjGIcLpST099BMMoBgMRIw1KGhkWtf5eJaghcuN+X0FxOykiKnMpe
         AeLfI5kF1XUS+Yx3m1owmzssoXYTF9QpdjdPH23tJABfLvmSF8G2+ivw+FiaojhEZGBY
         MmDw==
X-Forwarded-Encrypted: i=1; AJvYcCXvgpGUO0+Pnc/wioeZERX2J72YvaYp4oA7t3EwEUgfRVoiI8pFoKIHsl9zYEdsR0Pvzs/dPt7au1c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSGrdh8pQ0i6o2LHWVTmqxCT84d97t3d8MewObSmLRYSY+I0mW
	AJYWz7zSgX2pMe/h2Vf4cR8voRUAUtkdRE/lz656rL3Ny8jZiX12oovldP8bClnunQ==
X-Gm-Gg: AZuq6aL9DOGY2dnXVIg1tqd+NyOmC/zenSmTq1dSG94MRxCJrD1grv7A0G8gIOrcDNs
	gRs737R1oy2muEzrmyBm+8uwLkobHMnK005s5n8Kdb0uwz7+r4eeDJnc6rVp5XbIQuN2kjPw313
	edw/oD8n9/LVEIFVruDx7YYV8EWS3YmjSDulLkTttvbZHgaM1TW4MvBF1RDP1OIXjxvgLu2pEJ7
	24o9OhiS0yglcMY96FRAMCMcbGGacjUzXtkxU3J/YwPtexemlrWaXlzejgtWCWcxMXTStiz1/5y
	etp2XuvaFdXAZeOcCqmoy9nemQ8BvGWB/rhLX8eVpkOkJ7Wq4r/E1NDY9uB5gW6zFfQPUP3gwoa
	YpEDgevxayv4o+OxyuKm8IaEfrLYEDyoVC4bj35de2BjS4XS984zkR6vgH5baNtsmZBRY0zdKl1
	kxZbVrcHDigeDQK67bun2S+xiuu54W+zpptACM56I/DbDEBg3u91hhn8NdfYrj32WNkGCTlM6mf
	Bw=
X-Received: by 2002:a05:600c:4689:b0:480:6941:d38b with SMTP id 5b1f17b1804b1-48069c92bd8mr61871195e9.30.1769599641029;
        Wed, 28 Jan 2026 03:27:21 -0800 (PST)
Message-ID: <46b4e715-3b4d-457e-885c-2c3b4d9e5165@suse.com>
Date: Wed, 28 Jan 2026 12:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <27ab0f8eb6fd6ecef1eeefa4a05e4fe1f43acbbe.1769427484.git.oleksii.kurochko@gmail.com>
 <cf8f345c-185c-4b6f-aad2-7ac1b67fc018@suse.com>
 <debe7d0f-b1a5-4f45-a73d-0a84d136f9c0@suse.com>
 <a2f80fd1-0a6b-4ed4-9d19-bb052fc18228@gmail.com>
 <88edf7a2-c5f1-41fd-9ceb-8cc0c345b7e6@gmail.com>
 <132efa57-bd11-47b9-b3c8-0c09589f70b2@suse.com>
 <8ec02eba-3271-45ce-8157-0d444ed9da62@gmail.com>
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
In-Reply-To: <8ec02eba-3271-45ce-8157-0d444ed9da62@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4B145A05CB
X-Rspamd-Action: no action

On 28.01.2026 12:22, Oleksii Kurochko wrote:
> 
> On 1/28/26 12:08 PM, Jan Beulich wrote:
>> On 28.01.2026 12:01, Oleksii Kurochko wrote:
>>> On 1/28/26 11:34 AM, Oleksii Kurochko wrote:
>>>> On 1/27/26 10:27 AM, Jan Beulich wrote:
>>>>> On 27.01.2026 10:14, Jan Beulich wrote:
>>>>>> On 26.01.2026 12:43, Oleksii Kurochko wrote:
>>>>>>> Provide additional context when an unexpected exception occurs by
>>>>>>> dumping
>>>>>>> the relevant Supervisor, Virtual Supervisor (VS), and Hypervisor CSRs,
>>>>>>> along with the general-purpose registers associated with the trap.
>>>>>>>
>>>>>>> Dumping VS-mode CSRs in addition to host CSRs is beneficial when
>>>>>>> analysing
>>>>>>> VS-mode traps. VSCAUSE, VSEPC, VSTVAL, and related VS state are
>>>>>>> required to
>>>>>>> properly diagnose unexpected guest traps and potential hypervisor
>>>>>>> misconfiguration.
>>>>>>> For example, on an illegal-instruction exception the hardware may
>>>>>>> record
>>>>>>> the faulting instruction in VSTVAL. If VSTVAL is zero, VSEPC should
>>>>>>> always
>>>>>>> be inspected, and can be used together with objdump to identify the
>>>>>>> faulting instruction. Dumping VSCAUSE is also useful when the guest
>>>>>>> does
>>>>>>> not report it, or when the hypervisor redirects a trap to the guest
>>>>>>> using
>>>>>>> VSCAUSE, VSTATUS, and VSTVEC, allowing verification that a
>>>>>>> subsequent trap
>>>>>>> is not caused by incorrect VS state.
>>>>>>>
>>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>> Hmm, wait, there's another anomaly:
>>>>>
>>>>>> I still have a question though, which can be addressed incrementally.
>>>>>>
>>>>>>> --- a/xen/arch/riscv/traps.c
>>>>>>> +++ b/xen/arch/riscv/traps.c
>>>>>>> @@ -99,12 +99,70 @@ static const char *decode_cause(unsigned long
>>>>>>> cause)
>>>>>>>        return decode_trap_cause(cause);
>>>>>>>    }
>>>>>>>    +static void dump_general_regs(const struct cpu_user_regs *regs)
>>>>>>> +{
>>>>>>> +#define X(regs, name, delim) \
>>>>>>> +    printk("%-4s: %016lx" delim, #name, (regs)->name)
>>>>>>> +
>>>>>>> +    X(regs, ra, " "); X(regs, sp, "\n");
>>>>>>> +    X(regs, gp, " "); X(regs, tp, "\n");
>>>>>>> +    X(regs, t0, " "); X(regs, t1, "\n");
>>>>>>> +    X(regs, t2, " "); X(regs, s0, "\n");
>>>>>>> +    X(regs, s1, " "); X(regs, a0, "\n");
>>>>>>> +    X(regs, a1, " "); X(regs, a2, "\n");
>>>>>>> +    X(regs, a3, " "); X(regs, a4, "\n");
>>>>>>> +    X(regs, a5, " "); X(regs, a6, "\n");
>>>>>>> +    X(regs, a7, " "); X(regs, s2, "\n");
>>>>>>> +    X(regs, s3, " "); X(regs, s4, "\n");
>>>>>>> +    X(regs, s5, " "); X(regs, s6, "\n");
>>>>>>> +    X(regs, s7, " "); X(regs, s8, "\n");
>>>>>>> +    X(regs, s9, " "); X(regs, s10, "\n");
>>>>>>> +    X(regs, s11, " "); X(regs, t3, "\n");
>>>>>>> +    X(regs, t4, " "); X(regs, t5, "\n");
>>>>>>> +    X(regs, t6, " "); X(regs, sepc, "\n");
>>>>>> Does this sepc value differ from ...
>>>>>>
>>>>>>> +static void dump_csrs(unsigned long cause)
>>>>> What is this function parameter for?
>>>>>
>>>>>>> +{
>>>>>>> +#define X(name, csr, fmt, ...) \
>>>>>>> +    v = csr_read(csr); \
>>>>>>> +    printk("%-10s: %016lx" fmt, #name, v, ##__VA_ARGS__)
>>>>>>> +
>>>>>>> +    unsigned long v;
>>>>>>> +
>>>>>>> +    X(htval, CSR_HTVAL, " ");  X(htinst, CSR_HTINST, "\n");
>>>>>>> +    X(hedeleg, CSR_HEDELEG, " "); X(hideleg, CSR_HIDELEG, "\n");
>>>>>>> +    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n",
>>>>>>> +      (v & HSTATUS_VTSR) ? " VTSR" : "",
>>>>>>> +      (v & HSTATUS_VTVM) ? " VTVM" : "",
>>>>>>> +      (v & HSTATUS_HU)   ? " HU"   : "",
>>>>>>> +      (v & HSTATUS_SPVP) ? " SPVP" : "",
>>>>>>> +      (v & HSTATUS_SPV)  ? " SPV"  : "",
>>>>>>> +      (v & HSTATUS_GVA)  ? " GVA"  : "");
>>>>>>> +    X(hgatp, CSR_HGATP, "\n");
>>>>>>> +    X(hstateen0, CSR_HSTATEEN0, "\n");
>>>>>>> +    X(stvec, CSR_STVEC, " "); X(vstvec, CSR_VSTVEC, "\n");
>>>>>>> +    X(sepc, CSR_SEPC, " "); X(vsepc, CSR_VSEPC, "\n");
>>>>>> ... the one logged here? Nothing changes the register between entry
>>>>>> into the hypervisor and coming here?
>>>>> Down below here you have
>>>>>
>>>>>       X(scause, CSR_SCAUSE, " [%s]\n", decode_cause(v));
>>>>>
>>>>> which actually (largely) duplicates what do_unexpected_trap() has
>>>>> already
>>>>> logged.
>>>> Missed that, then it would be better to remove this duplication and leave
>>>> only printing of CSR_SCAUSE in dump_csrs().
>>>>
>>>>>    If dump_csrs() gained other uses, the dumping of scause likely is
>>>>> wanted, but then likely no scause value would be available to pass
>>>>> in? So
>>>>> maybe its dumping actually wants to be conditional (and the parameter
>>>>> wants to be a boolean)?
>>>> Good point. Honestly speaking, I don't know if it will be any other
>>>> usages
>>>> except this one. But to keep things generic I think it is good idea to
>>>> add conditional dumping of scause.
>>> As an alternative, we could simply remove the dump_csrs() argument and always
>>> print SCAUSE. When running in hypervisor mode, SCAUSE should contain the reason
>>> for the trap. Even it is lets say just hypercall and not something faulty, it
>>> will contain "Environment call from S-mode" what looks okay to be printed.
>>>
>>> I tend to prefer this approach slightly. What do you think?
>> It means that it'll be logged twice for an unexpected trap. As said, I can
>> only recommend to limit the volume of the output in such situations, as
>> sometimes all people may be able to get you is screenshots.
> 
> It will be logged once, basically, mu suggestion is:
> 
> -static void dump_csrs(unsigned long cause)
> +static void dump_csrs(void)
>   {
>   #define X(name, csr, fmt, ...) \
>       v = csr_read(csr); \
> @@ -156,11 +156,7 @@ static void dump_csrs(unsigned long cause)
>   
>   static void do_unexpected_trap(const struct cpu_user_regs *regs)
>   {
> -    unsigned long cause = csr_read(CSR_SCAUSE);
> -
> -    printk("Unhandled exception: %s\n", decode_cause(cause));
> -
> -    dump_csrs(cause);
> +    dump_csrs();
>       dump_general_regs(regs);

And the fact that it was an unhandled exception then isn't logged explicitly
anymore? Perhaps dump_csrs() then should have a const char * parameter, which
here you would pass "Unhandled exception" for.

Jan

