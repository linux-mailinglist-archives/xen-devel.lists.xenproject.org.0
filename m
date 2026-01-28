Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GXhBmfmeWl60wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:35:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CC79F8AE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215365.1525564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl2t5-0005Zx-4g; Wed, 28 Jan 2026 10:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215365.1525564; Wed, 28 Jan 2026 10:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl2t5-0005XN-1G; Wed, 28 Jan 2026 10:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1215365;
 Wed, 28 Jan 2026 10:35:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3TT=AB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vl2t3-0005XH-IC
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 10:35:01 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff322505-fc34-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 11:35:00 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so3990999f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 02:35:00 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee057sm6773824f8f.15.2026.01.28.02.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 02:34:58 -0800 (PST)
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
X-Inumbo-ID: ff322505-fc34-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769596499; x=1770201299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6p4KLNtrIoQOZgguwVAKGNaQYwTU5U2QKElDIc3N6E=;
        b=TvlLnF6Sj3+Iw564eLVe+elc9n/5b6hX9Vt62qnAN0WtPVR+8XY1xOJ/GjJ8zcZWRI
         23JjLHEOrw6GugsjshBChEIF3ZwT9eVGRKoTsLkOXFD8qJ6xEkUAPFmENwwpMc661McG
         I/X5xflFKmKFS3EkREW4EHwnZNaAFZvklxf50o0DjZTc6PkvdiZNZw4KfoHsb46JwPGu
         GxgLPWqfjKH68ypp+dGzJ7WDRNMYEBLH5xrS9w5Q4k2pEQkyRUjYgtmz7ekfweZTpENc
         o/yW2u7R0jm318eLWoCaZDVNhoBYpMCNrOouZrKH/J8syXHd1JGLGbSVpfYCORXOaeHf
         dSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596499; x=1770201299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6p4KLNtrIoQOZgguwVAKGNaQYwTU5U2QKElDIc3N6E=;
        b=aPLzqHm7SlCb8kTF+piAi2sGs1hmE8FrR+yyuxaixHkFRi6JO+pejIpHToh6kH/A1T
         3mXrSBgaihomtJSiGFpSmXdJYGqcMWESdBL/B6dbUdq/hSbOFrnDvwkqxtxdX4oydh6p
         pY8xUgqtqMlLOunfnobRP++71uKgJ6pvvTqulB1RQgWEdN82SxoJk3mIRNOan1sdykRM
         K44Smb7Z5iPZ0Eeg/gKM6Rfchqirv3TjSHOej5bsQeYL424LtDa/y52B37u+StGhikmU
         Jk2FNuvuh+yBRa3ycz3r0TrB3Fhadx4T3ivRx8huucv5RWBwos3ayZTVO9bAq2DOsVGv
         6h3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjggS8cIGWl6HIDC9V90FjRw+DfRtQydWYD9VvjkhnbvKoWDZdMfv4iXTZ3vPZTZBEWJqcRU25yHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/Wnahe5TcMqfUBH5ui/WVcg8gs6/3persHQcNA0Bcs6L6fdse
	tx/P1LOFqPLDt0aCEuz586hW2KcZWOqpdEK9I1FUZY2OLMkjur6M1SuW
X-Gm-Gg: AZuq6aKZWKwdCLTBt4hTrvm1ZX7PQY6ou3CS1q1hgi9VOdOTaBx+0sVrET1ArWW46dn
	6v8boawKzGQ0v4FFSKM7NMDRIjMfSWm4p5isT4eaT8gLu9//JlEmEvRvMLRVGUUk6fbG34Py07+
	8WkQ7dz110JZ9fXvGuQHWnbl8aViU9HNsV4lb4NoqLZyTefUK5ZKTeh/i9q8ZttrstzlrUTBCVx
	LhXdR7o9H5KT0Jm8IfkywNmwfXlfQkEN/t1JelwubYntrhDK867hd/vava2lSu94srtQ5q1oRWp
	4YPgsfbMUkwujgXPLX9dN5MbLksBGKppY5ZPdEm0XYxrMoLiDVUX+aNZ1ZVeOzMxohPEYZnP5Dn
	/gzrTChgxjcDq1pmb3hKOlTGuxymCOgRTKX10Qt00USthfIjmyAzSnF6r8sEY2wBdWhI6VQKkX5
	dJXRODycj8We+/rkKkn+deqLGiVouWhg9N0wOhyo9u1QztbAawXfEgr7UjQ4Tj4rk=
X-Received: by 2002:a05:6000:4022:b0:435:9ce0:f93c with SMTP id ffacd0b85a97d-435dd1c7ab4mr7793448f8f.62.1769596499163;
        Wed, 28 Jan 2026 02:34:59 -0800 (PST)
Message-ID: <a2f80fd1-0a6b-4ed4-9d19-bb052fc18228@gmail.com>
Date: Wed, 28 Jan 2026 11:34:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Jan Beulich <jbeulich@suse.com>
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <debe7d0f-b1a5-4f45-a73d-0a84d136f9c0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 69CC79F8AE
X-Rspamd-Action: no action


On 1/27/26 10:27 AM, Jan Beulich wrote:
> On 27.01.2026 10:14, Jan Beulich wrote:
>> On 26.01.2026 12:43, Oleksii Kurochko wrote:
>>> Provide additional context when an unexpected exception occurs by dumping
>>> the relevant Supervisor, Virtual Supervisor (VS), and Hypervisor CSRs,
>>> along with the general-purpose registers associated with the trap.
>>>
>>> Dumping VS-mode CSRs in addition to host CSRs is beneficial when analysing
>>> VS-mode traps. VSCAUSE, VSEPC, VSTVAL, and related VS state are required to
>>> properly diagnose unexpected guest traps and potential hypervisor
>>> misconfiguration.
>>> For example, on an illegal-instruction exception the hardware may record
>>> the faulting instruction in VSTVAL. If VSTVAL is zero, VSEPC should always
>>> be inspected, and can be used together with objdump to identify the
>>> faulting instruction. Dumping VSCAUSE is also useful when the guest does
>>> not report it, or when the hypervisor redirects a trap to the guest using
>>> VSCAUSE, VSTATUS, and VSTVEC, allowing verification that a subsequent trap
>>> is not caused by incorrect VS state.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> Hmm, wait, there's another anomaly:
>
>> I still have a question though, which can be addressed incrementally.
>>
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -99,12 +99,70 @@ static const char *decode_cause(unsigned long cause)
>>>       return decode_trap_cause(cause);
>>>   }
>>>   
>>> +static void dump_general_regs(const struct cpu_user_regs *regs)
>>> +{
>>> +#define X(regs, name, delim) \
>>> +    printk("%-4s: %016lx" delim, #name, (regs)->name)
>>> +
>>> +    X(regs, ra, " "); X(regs, sp, "\n");
>>> +    X(regs, gp, " "); X(regs, tp, "\n");
>>> +    X(regs, t0, " "); X(regs, t1, "\n");
>>> +    X(regs, t2, " "); X(regs, s0, "\n");
>>> +    X(regs, s1, " "); X(regs, a0, "\n");
>>> +    X(regs, a1, " "); X(regs, a2, "\n");
>>> +    X(regs, a3, " "); X(regs, a4, "\n");
>>> +    X(regs, a5, " "); X(regs, a6, "\n");
>>> +    X(regs, a7, " "); X(regs, s2, "\n");
>>> +    X(regs, s3, " "); X(regs, s4, "\n");
>>> +    X(regs, s5, " "); X(regs, s6, "\n");
>>> +    X(regs, s7, " "); X(regs, s8, "\n");
>>> +    X(regs, s9, " "); X(regs, s10, "\n");
>>> +    X(regs, s11, " "); X(regs, t3, "\n");
>>> +    X(regs, t4, " "); X(regs, t5, "\n");
>>> +    X(regs, t6, " "); X(regs, sepc, "\n");
>> Does this sepc value differ from ...
>>
>>> +static void dump_csrs(unsigned long cause)
> What is this function parameter for?
>
>>> +{
>>> +#define X(name, csr, fmt, ...) \
>>> +    v = csr_read(csr); \
>>> +    printk("%-10s: %016lx" fmt, #name, v, ##__VA_ARGS__)
>>> +
>>> +    unsigned long v;
>>> +
>>> +    X(htval, CSR_HTVAL, " ");  X(htinst, CSR_HTINST, "\n");
>>> +    X(hedeleg, CSR_HEDELEG, " "); X(hideleg, CSR_HIDELEG, "\n");
>>> +    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n",
>>> +      (v & HSTATUS_VTSR) ? " VTSR" : "",
>>> +      (v & HSTATUS_VTVM) ? " VTVM" : "",
>>> +      (v & HSTATUS_HU)   ? " HU"   : "",
>>> +      (v & HSTATUS_SPVP) ? " SPVP" : "",
>>> +      (v & HSTATUS_SPV)  ? " SPV"  : "",
>>> +      (v & HSTATUS_GVA)  ? " GVA"  : "");
>>> +    X(hgatp, CSR_HGATP, "\n");
>>> +    X(hstateen0, CSR_HSTATEEN0, "\n");
>>> +    X(stvec, CSR_STVEC, " "); X(vstvec, CSR_VSTVEC, "\n");
>>> +    X(sepc, CSR_SEPC, " "); X(vsepc, CSR_VSEPC, "\n");
>> ... the one logged here? Nothing changes the register between entry
>> into the hypervisor and coming here?
> Down below here you have
>
>      X(scause, CSR_SCAUSE, " [%s]\n", decode_cause(v));
>
> which actually (largely) duplicates what do_unexpected_trap() has already
> logged.

Missed that, then it would be better to remove this duplication and leave
only printing of CSR_SCAUSE in dump_csrs().

>   If dump_csrs() gained other uses, the dumping of scause likely is
> wanted, but then likely no scause value would be available to pass in? So
> maybe its dumping actually wants to be conditional (and the parameter
> wants to be a boolean)?

Good point. Honestly speaking, I don't know if it will be any other usages
except this one. But to keep things generic I think it is good idea to
add conditional dumping of scause.

I will update the patch and send new version.

Thanks.

~ Oleksii


