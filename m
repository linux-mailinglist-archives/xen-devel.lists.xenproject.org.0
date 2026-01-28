Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKcxIPHkeWl60wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:29:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4529F76D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215344.1525544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl2me-0003XH-8x; Wed, 28 Jan 2026 10:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215344.1525544; Wed, 28 Jan 2026 10:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl2me-0003UL-5c; Wed, 28 Jan 2026 10:28:24 +0000
Received: by outflank-mailman (input) for mailman id 1215344;
 Wed, 28 Jan 2026 10:28:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3TT=AB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vl2mc-0003UF-Fh
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 10:28:22 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f7e82f-fc34-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 11:28:20 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so3962255f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 02:28:20 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1353ac2sm6226895f8f.38.2026.01.28.02.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 02:28:19 -0800 (PST)
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
X-Inumbo-ID: 10f7e82f-fc34-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769596100; x=1770200900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6wFVRpPscyB9+c8KRg4316MWvHqo0AwSXFaSjSoKG4=;
        b=Gd54N1TeMEolGE71gEZ9f+jq/+M+OwMpPCvpOLNwzmLlkiSEzKGkcjP2qcEByG52Ao
         5LlHX9kf/8zIMNWgQY831aTVv9dIgx1rm6RGU2WjO+uWfiN4sDDMQ0U3UZPt8RAVNAEG
         hd47Mwyzq2FVCXb64eDXaqbm/u+xIUeudS0sSdnAuLS6y3TZdPs92HzQB4Rdnj3drKC3
         2HJktj95UqnASWAsuMu4lJPDL33tUIe6+EyA7yWGd5FIxPJtjCPULFxAJpyO2Y/WzVhm
         YJsJMeTL1iZ2x1pCm9WLxbBt6ia03nX8+RFKtajDRO82x+qsZRejtuW5iSXecu2tvoce
         u/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596100; x=1770200900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6wFVRpPscyB9+c8KRg4316MWvHqo0AwSXFaSjSoKG4=;
        b=V3SLR4ICPbi83/FMUZ2oXbEKNsfZFlDXe/ghadPCk1+fogyyRMuwNEFjw71Hwh/PlZ
         u3wU/Kd4C5WpzFXSLGUWcLhjVrc0RMq6KzT5NN7jPTOzyPm389/QHsdDD1cF72emXWRF
         qjuc5TcXMbF3YYFi98F63qg1apienAwmFuZP51opNOmZ/wp8J+3zLQG35cVbH5X1cIHJ
         +F8Mj9VyDyy4nstKPn9Wl9iAY2ctnzpHgdxcfc6FM8uHPCm4t9r22xVq9CUb3b/05ERi
         xp5QQsyNz1l0ZuZ0xY15YtzA8uonQmt2waMeGw8gYOCCSWRZEw56h8aeIkMItED5I9Pl
         VmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1FRv9jPlxtFBa6zfgT9JlEqf/hq9enxBWaBSf6T7Kh51Tsp4Mbv1F9I0FvgVQuortgIrDEXalBJw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQqIWPH50gWHkNcxKPDoX3Wz/uIEhd9OvkKzf6kOA5FaojvR+H
	nGJCqq9tuv13PguDvbDXqkCUkNnX3qBJl4efMz7Zdi08a4lXjdzkGRB6
X-Gm-Gg: AZuq6aI+JbltYM0s1WigfzVTEb/G82ThiXAbRYM1KsbDNmTLQZ6xCdABjOCINlijaXo
	nFE8CMrbSOc0rkcQJ7K88pCCez1ZzYuHkxFV0EsHlL7tcQZpklmu10Co/qz6xJZfMxobopCHi9B
	BBCLhjTUTfrBJSUyOQ1JImygAWMvdvDnQfCd9wMJO+nkDjag73q1tLY7eZgtXHOO3EuEdeGmScY
	Rz1CID3OnQn5yTEhwJvb5iwJHqNU7MVqeqVn6dNk8HhWRjHPhfLeYUiJl67LeEFcKN7FfDq758A
	pWx310OrrnSwx0VqH+g9JjUnIDH4DFsLULA2M8qqLzgLOtXd33K+dd6wzOflQasSvzEXzX4Oy/h
	Xg0lPNJ1TI6WQrcDUhWJ2urYhKaJCLBwe6ExFQ8vw2su9LcupISPuQ9ud9clNSlP4ctr0jNAHkz
	i3lvht3OK7Q1NtLL0c4WR5fF5m0WS53CfrXvYiCsHLjlP0kHu8ucWOIPjfHtKFHoM=
X-Received: by 2002:a05:6000:4023:b0:431:a33:d87c with SMTP id ffacd0b85a97d-435dd02da7dmr7337199f8f.11.1769596099484;
        Wed, 28 Jan 2026 02:28:19 -0800 (PST)
Message-ID: <dfc6522b-3cfc-4108-a785-ccb3bbdb419d@gmail.com>
Date: Wed, 28 Jan 2026 11:28:18 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cf8f345c-185c-4b6f-aad2-7ac1b67fc018@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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
X-Rspamd-Queue-Id: DB4529F76D
X-Rspamd-Action: no action


On 1/27/26 10:14 AM, Jan Beulich wrote:
> On 26.01.2026 12:43, Oleksii Kurochko wrote:
>> Provide additional context when an unexpected exception occurs by dumping
>> the relevant Supervisor, Virtual Supervisor (VS), and Hypervisor CSRs,
>> along with the general-purpose registers associated with the trap.
>>
>> Dumping VS-mode CSRs in addition to host CSRs is beneficial when analysing
>> VS-mode traps. VSCAUSE, VSEPC, VSTVAL, and related VS state are required to
>> properly diagnose unexpected guest traps and potential hypervisor
>> misconfiguration.
>> For example, on an illegal-instruction exception the hardware may record
>> the faulting instruction in VSTVAL. If VSTVAL is zero, VSEPC should always
>> be inspected, and can be used together with objdump to identify the
>> faulting instruction. Dumping VSCAUSE is also useful when the guest does
>> not report it, or when the hypervisor redirects a trap to the guest using
>> VSCAUSE, VSTATUS, and VSTVEC, allowing verification that a subsequent trap
>> is not caused by incorrect VS state.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> I still have a question though, which can be addressed incrementally.
>
>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -99,12 +99,70 @@ static const char *decode_cause(unsigned long cause)
>>       return decode_trap_cause(cause);
>>   }
>>   
>> +static void dump_general_regs(const struct cpu_user_regs *regs)
>> +{
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
>> +    X(regs, t6, " "); X(regs, sepc, "\n");
> Does this sepc value differ from ...
>
>> +static void dump_csrs(unsigned long cause)
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
> ... the one logged here? Nothing changes the register between entry
> into the hypervisor and coming here?

You are right, the value will be the same. Lets drop printing of SEPC
from GPRS and leave only the printing of SEPC in dump_csrs().

~ Oleksii


