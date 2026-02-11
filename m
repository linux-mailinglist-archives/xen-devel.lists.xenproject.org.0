Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOywGMo0jGmNjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 08:50:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9D121F1C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 08:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227016.1533351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq4yw-0005ah-Mf; Wed, 11 Feb 2026 07:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227016.1533351; Wed, 11 Feb 2026 07:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq4yw-0005Ye-Js; Wed, 11 Feb 2026 07:49:54 +0000
Received: by outflank-mailman (input) for mailman id 1227016;
 Wed, 11 Feb 2026 07:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq4yv-0005YY-Gr
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 07:49:53 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f62d9f9-071e-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 08:49:52 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so62770105e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 23:49:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d482480sm127769205e9.0.2026.02.10.23.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 23:49:50 -0800 (PST)
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
X-Inumbo-ID: 3f62d9f9-071e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770796191; x=1771400991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lJvCSMhHMkgd1TQ3KoQiUVH//7ztu4XOKSFT1sB6xJg=;
        b=NgpDpC83Z3llIIj6RJlJjpmIO0z5sgAsgE5Z0Ul7TvZGEELxSW5nX6+7ajymByGz95
         WRGhIAmuojc3DdV95lTydXnJ684WeAluv1laB8I44tcrILpdr7WiRGgP6r4QBgRf9EAy
         QT1BsuUc3UkoZTKtG1MNs+kMhrpYyWfuNZfBxLZJNaLg23xcO33qsfa6VxPpfFDljGmP
         965UolRYVVaUisikmp7G1d5A88mLozIGcHEdKhSd9ek67tYu/lmTwctRHkc5RiLjWdYu
         9lyU3kWJtMrDRWdA5fUQCMi5P7uIFEyAeEuXG5Q1E+L8sJd4rNUQxFpjQyTUNSpqBish
         nSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770796191; x=1771400991;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJvCSMhHMkgd1TQ3KoQiUVH//7ztu4XOKSFT1sB6xJg=;
        b=nagcMuw75yZh+iTV22NODXCQ8FEEr5b2vVtO8XZLccFA5djXpsXCs8/myBCt9jJblY
         znPfeBB+/u8V1bxkt8Xpi9PneybBeb8Nc7anxu8++UTh8P0LSpDp4Z87/PyGxTuauUjS
         ZX4QL9MEPfLRpF3oyrssCd86oMOIXcftJEJOlbEKuX30VDTWhBYsHlftT5eEvkW8rIzy
         5Ig6L8Nw4kiyMU4d3QeHckzFYIT+AWMJBcYKSyZoJYw3Fd1x0NIlh6CxU+zgJQmM+2x9
         pS8KmTAm2jTSMq5gUnf37CEjkcxm8mm5W+LNJKneWG317RGDrGvK5//5ogSJT27WWbCQ
         Vehw==
X-Forwarded-Encrypted: i=1; AJvYcCVSWOAmPvmXh4SwSX0fMX9uMZgfYX6BrK83DdUtjKyzymGdohV0kG2u+xNuYV6P3tFd701AslRlgnc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1k+mWL4EBS5uSFDB/dy0BxHTmc2Bdwft4a8FqPI72QszJKhPy
	pFZQLK7BOIcbMCyPUsbxS9SQwYSccQsSGT+B1XS1iJxdwK90lEDXzkfS0YiGzkYTYQ==
X-Gm-Gg: AZuq6aIUet/tNibyxlE0wEpAZ06f6N/uqY9UyB4tpJFZr8fvXJQOjK5dW8zCq5EIs7/
	Pc6UHPlAupnKVrPZok4/+8bOzzpJVLyvJU/Q68FiQ/Xw394VpaY7Zf5NZDQapy9Pztpm0FU1yai
	REqpVTZYp9AOnjCYQAoO9BisEvU7mcKcqV1mmV0Na9uPz4HDocK6+VhYiHCdQHuWJXyD4tEW1ws
	65BaSEvI1OzyoHKlsn244OTcOFgfJbTyyAmRCraxqXSJmKsvZmGuLAfa1yrL70yx5IiXmxSs+gr
	doXI+ivaXjYx72QrgZUvgLO/A5fyhUxj47wcoSjmt7toUm2H0g1Hk48ag/8ZVlQJCe8jts10V5Z
	yoH2BYfdsz9xADdlB+kt5be38xS4TtShGQ4Z9aAhm8qXJLbLKGt+eKvGL2fkd6sI/pzFyF4I81+
	eprLGhNDP5yEq4psgFOQNoLzhqf8Pa67AzIDbaDqLhk06a8bX3qOZpt3rb9T6PzWydtNJ23R+7z
	p7IYWhu3zmzSlE=
X-Received: by 2002:a05:600c:34c5:b0:47d:885d:d2ff with SMTP id 5b1f17b1804b1-4835b96ecf7mr20333155e9.29.1770796191414;
        Tue, 10 Feb 2026 23:49:51 -0800 (PST)
Message-ID: <a660d245-0c63-409c-8609-ba767fff9e65@suse.com>
Date: Wed, 11 Feb 2026 08:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/16] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
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
 <cfb2bd81ca9c43f29f5d77a918e1da7a8c55318e.1770650552.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cfb2bd81ca9c43f29f5d77a918e1da7a8c55318e.1770650552.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: C7D9D121F1C
X-Rspamd-Action: no action

On 09.02.2026 17:52, Oleksii Kurochko wrote:
> Some hypervisor CSRs expose optional functionality and may not implement
> all architectural bits. Writing unsupported bits can either be ignored
> or raise an exception depending on the platform.
> 
> Detect the set of writable bits for selected hypervisor CSRs at boot and
> store the resulting masks for later use. This allows safely programming
> these CSRs during vCPU context switching and avoids relying on hardcoded
> architectural assumptions.
> 
> Note that csr_set() is used instead of csr_write() to write all ones to
> the mask, as the CSRRS instruction, according to the RISC-V specification,
> sets only those bits that are writable:
>     Any bit that is high in rs1 will cause the corresponding bit to be set
>     in the CSR, if that CSR bit is writable.
> In contrast, the CSRRW instruction does not take CSR bit writability into
> account, which could lead to unintended side effects when writing all ones
> to a CSR.

Hmm, I wonder in how far the wording there is precise. In a subsequent
paragraph there is:

"For both CSRRS and CSRRC, if rs1=x0, then the instruction will not write
 to the CSR at all, and so shall not cause any of the side effects that
 might otherwise occur on a CSR write, nor raise illegal-instruction
 exceptions on accesses to read-only CSRs."

To me, a read-only CSR is a CSR with all bits read-only. With this
interpretation, the two statements conflict with one another. Is this
interpretation ruled out somewhere?

> Masks are calculated at the moment only for hdeleg, henvcfg, hideleg,

Nit: First one is hedeleg.

> hstateen0 registers as only them are going to be used in the follow up
> patch.
> 
> If the Smstateen extension is not implemented, hstateen0 cannot be read
> because the register is considered non-existent. Instructions that attempt
> to access a CSR that is not implemented or not visible in the current mode
> are reserved and will raise an illegal-instruction exception.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - New patch.
> 
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -32,6 +32,8 @@
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> +struct csr_masks __ro_after_init csr_masks;

setup.c would be nice to only have __init functions and __initdata data.
Really up to now that's the case, and I wonder why the makefile doesn't
leverage this by using setup.init.o in place of setup.o. This variable
would likely better live elsewhere anyway, imo: Somewhere it's actually
(going to be) used.

> @@ -70,6 +72,28 @@ static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
>      return fdt;
>  }
>  
> +void __init init_csr_masks(void)
> +{
> +    register_t old;
> +
> +#define X(csr, field) \
> +        old = csr_read(CSR_##csr); \
> +        csr_set(CSR_##csr, ULONG_MAX); \
> +        csr_masks.field = csr_read(CSR_##csr); \
> +        csr_write(CSR_##csr, old)

See my remark on the earlier patch regarding locally used macros. You
shouldn't ...

> +    X(HEDELEG, hedeleg);
> +    X(HENVCFG, henvcfg);
> +    X(HIDELEG, hideleg);
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +    {
> +        X(HSTATEEN0, hstateen0);
> +    }

... be required to put braces here. (Then I'd further recommend to make "old"
local to the macro's scope.)

I'm also inclined to recommend to avoid an inflation of X() macros. Give
each such macro a somewhat sensible (yet still short) name. This way you'll
avoid Misra rule 5.4 ("Macro identifiers shall be distinct") concerns, in
combination with rule 20.5 ("#undef should not be used"). Note that we
didn't accept the latter rule, hence why I'm only saying "concerns", not
"violations".

Jan

