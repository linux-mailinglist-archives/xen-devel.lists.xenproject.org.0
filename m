Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFj2MX89d2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:10:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4B86760
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213476.1523946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJXb-0008LY-9M; Mon, 26 Jan 2026 10:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213476.1523946; Mon, 26 Jan 2026 10:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJXb-0008JW-6K; Mon, 26 Jan 2026 10:09:51 +0000
Received: by outflank-mailman (input) for mailman id 1213476;
 Mon, 26 Jan 2026 10:09:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkJXa-0008JQ-6H
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:09:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24ff8a24-fa9f-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 11:09:47 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee0291921so36328665e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 02:09:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e7156dsm29809206f8f.20.2026.01.26.02.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:09:46 -0800 (PST)
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
X-Inumbo-ID: 24ff8a24-fa9f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769422187; x=1770026987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+tMxil3n/dDtqPLPd/LZ4u8X3d1Gfks7WP6WFRww7js=;
        b=RuDJAyuZJBiWRppFVhuRiy18kcw4jCeQvz5InSHhdlHh+XOKhza7NnZ3rm5jEOnEhE
         0t+fJu1v4/oiFAIK1UKgmGCxWKUqDP4b4+F65IrYg1yP2y4CB8TtT2C4FYm3sLP1hSPh
         lhBtLI3LDjCL11f0R/auDQBMnTODFwFn9BVRYQjqGmiOnc1+zI7CJqc7pnwEbMTESL0c
         yFG48QTCeyqLPxj16Y2GWKoj/0m6CdfknPN29/kORxqMPEbvo4Qw02vk0H9zgivwsFZ6
         1rPNErhdYc+qqo9ZrVM+Lxm+DajWfiZ1D5kojueF5DhNNPAabpJxTmOCKDCukZEjpIkY
         CzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422187; x=1770026987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tMxil3n/dDtqPLPd/LZ4u8X3d1Gfks7WP6WFRww7js=;
        b=ZA4us6rSdUeQe5XBY4lsK8LPtdjf4ZbrFP8hV1wKjFxBUrBi1dAGESewypfinDn2v5
         1UBuhre8jJL2UgDRHYKohgQ4NT4Bdk0w0lfIHmGn8a07IDCJPouf8RjJbTsNA42+lXLH
         UIx+6olMEZMj+JStY9Mzw6EeQCg8sraCLZrz+/lTj8Yw7ss11OQ49jf/ggd3l+h4SfgV
         9bMdU7jgDvu3y+cIZK5wE2/ynEu5waSv6vrSPn0JL3zOeF3y4XC0yiIHOWVhv7gofIYf
         gdlijjl4gVPVygRBBjUy3IZMcIxUKUPGdoPR+rinoH1ApY2HihK+adk+trX2C1gIb8b5
         ghFA==
X-Forwarded-Encrypted: i=1; AJvYcCUWkWnLZFY1vrKOiMu6S9I8/uey6QBvXZF2BNRuU7be/vmpoDhO7BLAOY5D9x0foiKBxrSerQyxN1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8Wn2RNh30o5ZGmK6kLlwDva5VPRx1LOCrZmSX9s/4CnCOEImg
	ohV0ZhVL1l2bE5k0gzgGt/Oi2OnHJCwcbirbxx1rUp1SICpWzS2mflz20oBxaDX38g==
X-Gm-Gg: AZuq6aK0jjs1I/vT3heS0nW2mH2GwWweb9ZBHjtJ4hKDnaCyrz2Q1wm52rrrMvlCZbU
	pB4j1uAaOKth61gR+8dtUqw42fighpzlUYcP/N1U+vEcAKf8JjRdSLamyIJ6aGmORsYXN3puWHd
	0HvFFGfevmcR8XBhg4C1gtyiH7Z9M0uxrzQlxvQ8ZgtwnioWL4ziDb+g8W3Fleh9bfNpKNz9wrJ
	Ypoo/x6rGUGWC0D3xTwm0x6cRo6UJUgf6fwHOQFJdcPv5c29yY2wUaQK/OaoRpfAWJbZK90CSFR
	Hp1NdeAxBV2SdVeSo/PCI0CmPo+hLzOREfuW/TJYiyfnDgEj8HKZc7WeDHigcZup7MlYkx/rQS/
	jGZIe7+cAiRGqnmxmoEKPmy81qY3lcjMI3qiPZzjjPETRjE/EqucxZIsp2Bcw1zjE5/tLnkEpQL
	P1BU3UHNyhRzXyl2rvVe+XMSB6daxAsRQM2AlLshcGdsGJIggfCPzAuZNsXel9
X-Received: by 2002:a05:600c:4f4b:b0:47e:e78a:c834 with SMTP id 5b1f17b1804b1-4805d06685fmr68581695e9.34.1769422186771;
        Mon, 26 Jan 2026 02:09:46 -0800 (PST)
Message-ID: <9a68c272-1c76-4f1f-89ff-ff86d5181bcc@suse.com>
Date: Mon, 26 Jan 2026 11:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: dump GPRs and CSRs on unexpected traps
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0b57db49d40b336429dd4fd63faf18f6bb17ac1a.1769179393.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0b57db49d40b336429dd4fd63faf18f6bb17ac1a.1769179393.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3BA4B86760
X-Rspamd-Action: no action

On 26.01.2026 09:38, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -99,12 +99,81 @@ static const char *decode_cause(unsigned long cause)
>      return decode_trap_cause(cause);
>  }
>  
> +static void dump_general_regs(const struct cpu_user_regs *regs)
> +{
> +#define GPR_LIST \
> +    X(regs, ra, " ") X(regs, sp, "\n") \
> +    X(regs, gp, " ") X(regs, tp, "\n") \
> +    X(regs, t0, " ") X(regs, t1, "\n") \
> +    X(regs, t2, " ") X(regs, s0, "\n") \
> +    X(regs, s1, " ") X(regs, a0, "\n") \
> +    X(regs, a1, " ") X(regs, a2, "\n") \
> +    X(regs, a3, " ") X(regs, a4, "\n") \
> +    X(regs, a5, " ") X(regs, a6, "\n") \
> +    X(regs, a7, " ") X(regs, s2, "\n") \
> +    X(regs, s3, " ") X(regs, s4, "\n") \
> +    X(regs, s5, " ") X(regs, s6, "\n") \
> +    X(regs, s7, " ") X(regs, s8, "\n") \
> +    X(regs, s9, " ") X(regs, s10, "\n") \
> +    X(regs, s11, " ") X(regs, t3, "\n") \
> +    X(regs, t4, " ") X(regs, t4, "\n")
> +
> +#define X(regs, name, delim) \
> +    printk("\t %-4s: %016lx" delim, #name, (regs)->name);

No semicolon here please; that should be supplied at the use sites of
such a macro.

As to the format string: If past the leading tab you want an extra
padding blank, why not "\t%-5s ..."? Question however is why this deep
indentation is wanted in the first place. I'd suggest to omit the tab
in particular.

> +    GPR_LIST

What use is this macro? All it does is hamper readability, by requiring
the line-continuation backslashes in its definition.

> +#undef X
> +#undef GPR_LIST
> +}
> +
> +static void dump_csrs(unsigned long cause)
> +{
> +#define CSR_LIST \
> +    X(stvec, CSR_STVEC, " ") X(vstvec, CSR_VSTVEC, "\n") \
> +    X(sepc, CSR_SEPC, " ") X(vsepc, CSR_VSEPC, "\n") \
> +    X(stval, CSR_STVAL, " ") X(vstval, CSR_VSTVAL, "\n") \
> +    X(status, CSR_SSTATUS, " ") X(vsstatus, CSR_VSSTATUS, "\n") \
> +    X(satp, CSR_SATP, "\n") \
> +    X(scause, CSR_SCAUSE, " [%s]\n", \
> +      decode_cause(v)) \
> +    X(vscause, CSR_VSCAUSE, " [%s]\n\n", \
> +      decode_cause(v)) \

Anything that can help save space (as indicated, output may go to a limited size
screen) should imo be leveraged. IOW better no double newline here, nor ...

> +    X(hstatus, CSR_HSTATUS, " [%s%s%s%s%s%s ]\n", \
> +      (v & HSTATUS_VTSR) ? " VTSR" : "", \
> +      (v & HSTATUS_VTVM) ? " VTVM" : "", \
> +      (v & HSTATUS_HU)   ? " HU"   : "", \
> +      (v & HSTATUS_SPVP) ? " SPVP" : "", \
> +      (v & HSTATUS_SPV)  ? " SPV"  : "", \
> +      (v & HSTATUS_GVA)  ? " GVA"  : "") \
> +    X(hgatp, CSR_HGATP, "\n") \
> +    X(htval, CSR_HTVAL, "\n") \
> +    X(htinst, CSR_HTINST, "\n") \
> +    X(hedeleg, CSR_HEDELEG, "\n") \
> +    X(hideleg, CSR_HIDELEG, "\n") \
> +    X(hstateen0, CSR_HSTATEEN0, "\n\n")

... here. In this latter case it's questionable anyway, as apparently you
have this here to separate from the GPRs being logged subsequently. Just
that right here you don't know whether your caller actually means to do
so.

As to grouping: How about further putting hedeleg and hideleg on a single
line? Maybe also htval and htinst?

> +#define X(name, csr, fmt, ...) \
> +do { \
> +    unsigned long v = csr_read(csr); \
> +    printk("\t %-10s: %016lx" fmt, #name, v, ##__VA_ARGS__); \
> +} while (0);
> +
> +    CSR_LIST

Same remarks here as above. The issue is actually worse here, as CSR_LIST
uses "v" which it isn't passed.

Jan

