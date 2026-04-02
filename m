Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL2LBdULzmmnkgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:25:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC9384704
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271100.1559393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BUB-0001Ej-Eg; Thu, 02 Apr 2026 06:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271100.1559393; Thu, 02 Apr 2026 06:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BUB-0001DF-Ao; Thu, 02 Apr 2026 06:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1271100;
 Thu, 02 Apr 2026 06:24:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8BUA-0001D9-10
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 06:24:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8BU7-003rfY-On
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:24:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce0bb9-2eae-0a2a0a5409dd-0a2a4506c406-0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:24:57 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce0bb9-0df0-0a2a45060019-d1558032c5c9-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:24:57 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso3862715e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 23:24:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c8852a5sm138753715e9.9.2026.04.01.23.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 23:24:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1775111097; x=1775715897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KYjlo8eTh1e3f7SUAmu5caQMG1Fwh+iun7Ol8ixjQvw=;
        b=DNdW34uJAEAGG5x29sxLnCUUqO/QBMtB+/1x0p/qYcj26OZ7jlGehsKLUHNfJqIhzI
         ESlMgslyuFSYchKs8U4w9GXhby52kzkmOzEIKsKq/o0hrxj+Lrx3A7fr9k6t5boqvnMU
         WV+MiQJp+B/Rme15QfE40JbopjZtBd7Xam37iW41dVvkEs16U3QLiVngkhPmR1YxlJzd
         Qra14NH61zAnUF5PSK08JSWLMeVWhJR+Os1LT4UMswNUXp65lZiOEtqCjNAinRb/lyCK
         VmmkIaPzv5vufGPHUdtM5lGWxQosF34uEWlhmyfMS5wpaBVFp6GJpdTxII52A6pki2p9
         112g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775111097; x=1775715897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYjlo8eTh1e3f7SUAmu5caQMG1Fwh+iun7Ol8ixjQvw=;
        b=chIC+JuqqWNhc8VLlUQ3t+JUKeDZL2TB37988yJFxPSf3H7xFqaqQLjW+vBsGwfM2i
         9bcEy+gyhMtpqIu0FmvRSq4o8sSOwsxEDn4Gk9MvvSliMg/bgGTgYrn5IlN764XnRdoN
         Y86O3Gv9q/iftqO8SiNi/6SCD9soC8+Tn4xaCnhEVQnwq1w7kFFEZ8UkECYIcm72gQYS
         hxMmCueB+1TeUBri3FTL/6w+VJIuJ2EXz/JCQwK+6D0txuTfGdD5CERAjAgFJ4f8Y3mC
         5/ek1Y9AUOD1U3ufSvZEfBvQS5HQkXFb9kHPQAZcs7LdKiOm+MUB+pd219xkE1j/wIxy
         XmnA==
X-Forwarded-Encrypted: i=1; AJvYcCWvKsXmaE5iLsEn2pLXSODC8lgeWRBee7mr5QLIyKaqfp3j/geFcPQU2oJAh5HXiX38sq64r61lDHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzeqy82L/Xo115mahJEYyCZWaKLWBKwOihDTAQHsnrIg5gbfbVM
	Qkx9ymQqpIlF3AqzmxCIXqsTKxzAurDxr3HMlz4oNXTBX18v5Zi98/nTYlEdjCh5ow==
X-Gm-Gg: ATEYQzycvc/mrOMbcQ164UnmbBP5T8TCMR708MRYtsUdxOJEw3Sdw1B7uY0Nq6SeaXJ
	TBv2XQjyOupmmeg0khGLbi0f1AoE0GvLKsv3oobMSF/v4NQ8mJPUYU1YnSHqhhaYcgyteUWQC3L
	qb3HK4rZxFtBZPwthvQ3TxrLM7HZhme3n2GPgegKi7MzNTbtTq8smAhO/lfDIHiMuOByJ14x+zC
	riJ2aw6ZTs5MztbcPcImXqRwESYDZ7VYSOv4fncJhe7rSTDFiy37ZERUkL75gV4QKLSl4+0d5aq
	iqsb9EJUjyvUIoKH3OKhURCGTUcru1LHb2etsTaXICrutsKI6EG2vbTHXhRrMGvukIw67YolW4L
	ra5bDcY2lH1wJFWh3h8Zapukor2DI4IHqeWpMLJafse6QFQTmXRJGgtzmmE/aEcEfkU5nnUfgYm
	pKr8TA70+hy/K1P7c0n9ueh2zpAJZ62AW2KuQWtUNUeH0y23UBmPcbi/3O/eQ4Fc5dOJTF7N4H2
	QCZPmN2moOwyiE=
X-Received: by 2002:a05:600c:4594:b0:486:ffa3:55f with SMTP id 5b1f17b1804b1-488835d0f0cmr108092575e9.27.1775111096583;
        Wed, 01 Apr 2026 23:24:56 -0700 (PDT)
Message-ID: <a6c95e44-e324-493d-8e55-532223e56b17@suse.com>
Date: Thu, 2 Apr 2026 08:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/riscv: add exception table support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <dcf5786b4ec99edcec6554a338904c52f0c3b03f.1774863161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <dcf5786b4ec99edcec6554a338904c52f0c3b03f.1774863161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775111097-5D92A3D8-69493B11/0/0
X-purgate-type: clean
X-purgate-size: 2982
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 77AC9384704
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 21:04, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/extable.c
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <xen/bsearch.h>
> +#include <xen/lib.h>
> +#include <xen/livepatch.h>
> +#include <xen/sort.h>
> +#include <xen/virtual_region.h>
> +
> +#include <asm/extable.h>
> +#include <asm/processor.h>
> +
> +#define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field + (ptr)->field)
> +
> +static inline unsigned long ex_insn(const struct exception_table_entry *ex)
> +{
> +    return EX_FIELD(ex, insn);
> +}
> +
> +static inline unsigned long ex_fixup(const struct exception_table_entry *ex)
> +{
> +    return EX_FIELD(ex, fixup);
> +}
> +
> +static void __init cf_check swap_ex(void *a, void *b)
> +{
> +    struct exception_table_entry *x = a, *y = b, tmp;
> +    long delta = b - a;
> +
> +    tmp = *x;
> +    x->insn = y->insn + delta;
> +    y->insn = tmp.insn - delta;
> +
> +    x->fixup = y->fixup + delta;
> +    y->fixup = tmp.fixup - delta;
> +}
> +
> +static int cf_check cmp_ex(const void *a, const void *b)
> +{
> +    const unsigned long insn_a = ex_insn(a);
> +    const unsigned long insn_b = ex_insn(b);
> +
> +    /* avoid overflow */
> +    return (insn_a > insn_b) - (insn_a < insn_b);

What is the (slightly malformed) comment about? I don't see anything close
to possibly causing overflow here.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/extable.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ASM__RISCV__ASM_EXTABLE_H
> +#define ASM__RISCV__ASM_EXTABLE_H
> +
> +#ifdef __ASSEMBLER__
> +
> +#define ASM_EXTABLE(insn, fixup)    \
> +    .pushsection .ex_table, "a";    \
> +    .balign     4;                  \
> +    .long       ((insn) - .);       \
> +    .long       ((fixup) - .);      \

For readability's sake I'm generally advocating for having enough, but
not more parentheses than necessary. What's the purpose of the outer pair
here and ...

> +    .popsection;
> +
> +.macro asm_extable, insn, fixup
> +    ASM_EXTABLE(\insn, \fixup)
> +.endm
> +
> +#else /* __ASSEMBLER__ */
> +
> +#include <xen/stringify.h>
> +#include <xen/types.h>
> +
> +struct cpu_user_regs;
> +
> +#define ASM_EXTABLE(insn, fixup)        \
> +    ".pushsection .ex_table, \"a\"\n"   \
> +    ".balign    4\n"                    \
> +    ".long      ((" #insn ") - .)\n"    \
> +    ".long      ((" #fixup ") - .)\n"   \

... here?

I'm also uncertain about the use of .long (generally in RISC-V code, and
really also in some other architectures). Imo, considering suffixes used
in the instruction set (e.g. load/store insns or OP-32 ones in RV64) .word
may be the more expressive directive.

Preferably with the adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>
Happy to carry out while committing, provided you agree.

Jan

