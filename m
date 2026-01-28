Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D9cIkwwemlq3wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:50:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B6A4899
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 16:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215863.1525968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7nm-00060v-IH; Wed, 28 Jan 2026 15:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215863.1525968; Wed, 28 Jan 2026 15:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl7nm-0005yI-FH; Wed, 28 Jan 2026 15:49:54 +0000
Received: by outflank-mailman (input) for mailman id 1215863;
 Wed, 28 Jan 2026 15:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3TT=AB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vl7nl-0005yC-1z
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 15:49:53 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb86ef58-fc60-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 16:49:51 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so67859115e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 07:49:51 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce58sm7693821f8f.20.2026.01.28.07.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 07:49:50 -0800 (PST)
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
X-Inumbo-ID: fb86ef58-fc60-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769615391; x=1770220191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4acLcQyeBBYunHIzgAqhUJQOZRSSVeSsjrl5szfzrZg=;
        b=iyc0t/6VdfbkLhqL8Z09ZbmQs+8IR2CLDB8mfgMYD4RvBXPinDUQbfHle06eZqE1XL
         KgGYggJvxDL27VlqqNvD5ytHgh1aTz0CwZq5QuiXknqC52DNOFr483k0xd76vDfG7v1j
         A2zQwQxRILqkjPasopI/t0coFfaBhuSWJKdR2JQNiiH9mYZ73wvie2Mz9hkphS52yuF7
         /CK11qKUalegO5CCkRLPsVOUeaAIt9DGCCzILyksYlaYlEw7XNYr5KwQWl1emj/gqymX
         ANk9hqSXv4ODE1yIpIoey8ZZoXGPLF4gAqMSvY2FDK33JPvBWIo6FdGq+NF0FRP6MNnd
         QSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615391; x=1770220191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4acLcQyeBBYunHIzgAqhUJQOZRSSVeSsjrl5szfzrZg=;
        b=AdJ+qvbxsOif45jV1Tv/ggOaQohlXABp12Qqyf2D+6QD8PoFBEQuq7VpQ6Q5PqF0BG
         ZctkZ3cK0Cvldtdhl4iVT+jcgJ7dZa99tgTKpmhE6xgRxSLi4TsZdVm9F31YGQXHpGRE
         OhKLgO0QXoRzNcgn0ubvzm6ouE7jbg0Y1EpAQEg1XPpmzqkpiGjPsmeXRu4DxS1meJ5P
         M0CV6Buk6ksWz9T5ykrohGu1nwJwvn9rlaISkPM7JWyPfioDu1kKib7qwOhkOzBK7Wvr
         dSqWMLWYlB8xttNPjySclqVIEzZmuEGeCBS3R1iM/lOCTptMxxzYyGBnIM3Lnr6E0OHx
         Kdfg==
X-Forwarded-Encrypted: i=1; AJvYcCXFjdc7UIzF/euKCfQOVmNzKVkcvEePQu5H7b1mcvD+7gL+4c1mdkBCl7BXJZ0PDom//CNdE0BivLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVclNceM+bZAf1j7wJkjVgygEzO+yI39FjMXKYduOKY5xwnM1K
	r0LF87SnJgHYrNTbKi79JP5EoBaKdfRqHVi2FB+Qdz6Dfbsu350oUfum
X-Gm-Gg: AZuq6aJzgtjKlE/L5R8wQWGWoEeqr1y+6DzhwY+zGhFYiO4S1NqvtySYayysSJGH793
	lnDZHZEBEfIY9E40D3u6oZv9kpBQemPuxtrBZ5tTHzhqDG6AxFl/eNT/GL2vKhvhL9IRIjvlx56
	dxePIyKVsOaaThUS+bUBn0dWcVmek+ptaO/qn2r0o80Ancp1UbDPPV8JFO2Pr4xgak3lqQHbgP3
	hlRw+INltWrT0QUPLGEiCJlRjLmxo60+RNq310/9RMBqe6ogLP+UXZFgrVntypsml0CPJfWyAdK
	FR+Rb08uXf4M1W9xE7Un5gncFYyhHArrokgSKwU9flprZJwNKyRjMFvSEVm3ZKfJyKIC49jm4N7
	45tcV+LqcWlWlMzEuJUDs11BjlHUL7B3q7mzDIcHqVVjZfTge9+8z+BAeZ6+Az7bB9Gy813IZeg
	OHImQyvo+ZrGvypxPd3CjvI+UGFDtHj/nCEJLmq7PxlVdTv/Zz9amXSt/jHkKlBfA=
X-Received: by 2002:a05:600c:458a:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-48069c0fdafmr65782685e9.4.1769615390914;
        Wed, 28 Jan 2026 07:49:50 -0800 (PST)
Message-ID: <85332b14-60c5-46da-9d3b-ddf2e34f9a59@gmail.com>
Date: Wed, 28 Jan 2026 16:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d0fddb38c11e1ab5659ef981e770a2a850ef8ac7.1769602563.git.oleksii.kurochko@gmail.com>
 <b5cdfbe3-63d2-4fa0-8956-2f371e0e7a36@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b5cdfbe3-63d2-4fa0-8956-2f371e0e7a36@suse.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E43B6A4899
X-Rspamd-Action: no action


On 1/28/26 4:17 PM, Jan Beulich wrote:
> On 28.01.2026 13:53, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -99,11 +99,65 @@ static const char *decode_cause(unsigned long cause)
>>       return decode_trap_cause(cause);
>>   }
>>   
>> -static void do_unexpected_trap(const struct cpu_user_regs *regs)
>> +static void dump_general_regs(const struct cpu_user_regs *regs)
>>   {
>> -    unsigned long cause = csr_read(CSR_SCAUSE);
>> +#define X(regs, name, delim) \
>> +    printk("%-4s: %016lx" delim, #name, (regs)->name)
>> +
>> +    X(regs, ra, " "); X(regs, sp, "\n");
>> +    X(regs, gp, " "); X(regs, tp, "\n");
>> +    X(regs, t0, " "); X(regs, t1, "\n");
>> +    X(regs, t2, " "); X(regs, s0, "\n");
>> +    X(regs, s1, " "); X(regs, a0, "\n");
>> +    X(regs, a1, " "); X(regs, a2, "\n");
>> +    X(regs, a3, " "); X(regs, a4, "\n");
>> +    X(regs, a5, " "); X(regs, a6, "\n");
>> +    X(regs, a7, " "); X(regs, s2, "\n");
>> +    X(regs, s3, " "); X(regs, s4, "\n");
>> +    X(regs, s5, " "); X(regs, s6, "\n");
>> +    X(regs, s7, " "); X(regs, s8, "\n");
>> +    X(regs, s9, " "); X(regs, s10, "\n");
>> +    X(regs, s11, " "); X(regs, t3, "\n");
>> +    X(regs, t4, " "); X(regs, t5, "\n");
>> +    X(regs, t6, " ");
> DYM "\n" here?

Oh, right, it should be "\n".

>
>> +#undef X
>> +}
>> +
>> +static void dump_csrs(const char *ctx)
>> +{
>> +#define X(name, csr, fmt, ...) \
>> +    v = csr_read(csr); \
>> +    printk("%-10s: %016lx" fmt, #name, v, ##__VA_ARGS__)
>> +
>> +    unsigned long v;
>> +
>> +    X(htval, CSR_HTVAL, " ");  X(htinst, CSR_HTINST, "\n");
>> +    X(hedeleg, CSR_HEDELEG, " "); X(hideleg, CSR_HIDELEG, "\n");
>> +    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n",
>> +      (v & HSTATUS_VTSR) ? " VTSR" : "",
>> +      (v & HSTATUS_VTVM) ? " VTVM" : "",
>> +      (v & HSTATUS_HU)   ? " HU"   : "",
>> +      (v & HSTATUS_SPVP) ? " SPVP" : "",
>> +      (v & HSTATUS_SPV)  ? " SPV"  : "",
>> +      (v & HSTATUS_GVA)  ? " GVA"  : "");
>> +    X(hgatp, CSR_HGATP, "\n");
>> +    X(hstateen0, CSR_HSTATEEN0, "\n");
>> +    X(stvec, CSR_STVEC, " "); X(vstvec, CSR_VSTVEC, "\n");
>> +    X(sepc, CSR_SEPC, " "); X(vsepc, CSR_VSEPC, "\n");
>> +    X(stval, CSR_STVAL, " "); X(vstval, CSR_VSTVAL, "\n");
>> +    X(status, CSR_SSTATUS, " "); X(vsstatus, CSR_VSSTATUS, "\n");
>> +    X(satp, CSR_SATP, "\n");
>> +    X(scause, CSR_SCAUSE, " %s[%s]\n", ctx, decode_cause(v));
> For it, in particular the "ctx" string, to stand out, perhaps this wants moving
> first in the function?

I would be grateful for this.

>
> With the adjustments (happy to carry out while committing, so long as you agree):
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks a lot.

~ Oleksii


