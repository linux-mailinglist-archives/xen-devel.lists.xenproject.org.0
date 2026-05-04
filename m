Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOL7I/Kr+GnHxgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:23:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC84BF461
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299966.1574524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuCk-0003NE-NQ; Mon, 04 May 2026 14:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299966.1574524; Mon, 04 May 2026 14:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuCk-0003LB-KL; Mon, 04 May 2026 14:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1299966;
 Mon, 04 May 2026 14:23:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJuCj-0003L5-9m
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:23:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJuCi-00GTJl-FK
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:23:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8abd6-2eae-0a2a0a5409dd-0a2a4503b8cc-20
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:23:24 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8abdc-672d-0a2a45030019-d155802eac0c-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:23:24 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso30583025e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:23:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eb75fc1sm286878635e9.7.2026.05.04.07.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:23:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1777904604; x=1778509404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u3m/qInxC49xlMZSE9dc97iQE9ZpWisKeFNR3YNzlUo=;
        b=GQynzwNovqeGY1cLCwGizidS1LWOJhgLmlsOieeJjTpwpA3BJqjJaw97zUNg71ZCSB
         zvEuv1SqEErVVfKe52ITxQSb2JJuVMcSRqGnmJmRajit3WDc8BdD0tDwSyBFRvFiOhvh
         1DSqnd8z3Oq0s9K9x4U3DatZEoKgYPCSD7XU74PHpzYoaP4JERNxC18lV0Jcb2IpNtql
         uOle6nsN0l6p7X5+3Ws7zDrrJiAGBX7QksYCihwMWQHkPqG2mdRSIVhZJwBoEn0Qw1mr
         Lu2E63O8d3RZSKUlsmAKq0CY8WABdZiBT9cq746blxTT/XiroT1urdHuaAom/qP1s8tA
         tSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904604; x=1778509404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3m/qInxC49xlMZSE9dc97iQE9ZpWisKeFNR3YNzlUo=;
        b=dN6XfAwqvbogjrgC+DfLKYdcBnEkBxjAjfKQkSU3ndTGnAAuFKW9FYhIdmA+rxOtc+
         CaqBgvMnLvkrkOlpFY/u4iSEROtn63PxKjUxPn33iA39O7HEvN8ZkFGFVOWAORLRSZqs
         Fph7UrnNdSVJn6kw7Qnbh5OAUA7Bu2b8rfmd6QvMsCtd3yYGtkPn0EHPU5JrIMQFnjeX
         oV935luxv0uACoDaxxnSD186bwdaMHPqFffp5gbB+3Y4qC38nXA/R3oIpjo8qdP7hk/D
         DP29ii1SHPfng5fLJAKJzODTXSAV8fAQLfCHeY17yJfeg/IvGblijdfrbJ0p6Uxuxufx
         tKxw==
X-Forwarded-Encrypted: i=1; AFNElJ9bDZIn//pC0VI0Y42F6CSK9YZKHrHOTBG2u80u6j0i8f35hRVZXv7uU3+WIhPOBTApIGrqah1FcPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHVYjzh2lIsC1tH7sNJqUPer29BToe3fD4Dq3o5atjRpBl3rRN
	Afw6E2Mj5j2i3co2d8ICafoOWE19mTp+jkDEQaRe4M/EUpt9mVzqNcq3YfL4fuuncA==
X-Gm-Gg: AeBDietHGItGTl99v9Wf0J9Ytb6CIO+/H9Wh1O1Q8yXhX6WFwLLPdJqsmDXyjE5YgCd
	II1K+QwbnwHuJzvo7bfZlz8jsZwfaRkI0hIEHzNZ2IQr1TizyytLWFgN83CTkrFfcbXnmG4lN2l
	68Y1+M4r10yhiTZ86yBuuXHyxpxPVzM1wsYx75PkcFLPVk6diib9kIPS4MxOQIglaAuptzzy7Zr
	a0Ry+qyz9IepKpjnMsNO5pJffBXYSviGXt7nMhdJRu+MjwD1X37li/U+WSZCuOlNzbKv0Pv1IOz
	ilZJs55m8xJuotZsrhKjBikQ4XvEZOGjhKciI8+eY4+liy1cTFviSnxadi7T7l69/XfdUv9v+Gc
	7mD5QIpmSLPQHw2zZu6wiIaYoDDt4nbM84BGHzi6wEzTInhCHaI9+d4FGMjPgMSQhCXhPWSJQt3
	frlJPAPIhZm3s0HJBHM+m1EvHAHliV/Itlqks9aFh680B64Yy+YRzgAi9A1ZQHB25IuHh4voFV7
	5AzH0xnz4CqDAA8oAegy1f75g==
X-Received: by 2002:a05:600c:8903:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48a98894fe0mr109634555e9.13.1777904603806;
        Mon, 04 May 2026 07:23:23 -0700 (PDT)
Message-ID: <aec349c3-ae88-4b8c-940e-6d3fd9c115f8@suse.com>
Date: Mon, 4 May 2026 16:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] xen/riscv: rework G-stage mode handling
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <865ed71ece75e850cdcb47ce9157a668a46a4c4d.1777303844.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <865ed71ece75e850cdcb47ce9157a668a46a4c4d.1777303844.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1777904604-A1F7A938-A8522B78/0/0
X-purgate-type: clean
X-purgate-size: 6013
X-Rspamd-Queue-Id: 00FC84BF461
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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

On 28.04.2026 16:33, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/dom0less-build.c
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bootfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/init.h>
> +
> +#include <asm/p2m.h>
> +
> +int __init arch_parse_dom0less_node(struct dt_device_node *node,
> +                                    struct boot_domain *bd)
> +{
> +    const char *mmu_type;
> +    unsigned long bits;
> +    const char *end;
> +
> +    if ( dt_property_read_string(node, "mmu-type", &mmu_type) )
> +    {
> +        dprintk(XENLOG_WARNING, "mmu-type property is missing in guest domain "
> +                "node. %s will be used as fallback\n", max_gstage_mode->name);
> +
> +        bits = P2M_GFN_LEVEL_SHIFT(max_gstage_mode->paging_levels + 1);
> +
> +        goto out;
> +    }
> +
> +    if ( !strcasecmp(mmu_type, "riscv,none") )
> +    {
> +        dprintk(XENLOG_ERR, "Bare mode isn't supported by Xen\n");
> +
> +        return -EOPNOTSUPP;
> +    }
> +
> +    if ( strncasecmp(mmu_type, "riscv,sv", 8) )
> +    {
> +        dprintk(XENLOG_ERR, "mmu-type value \"%s\" is incorrect\n", mmu_type);
> +
> +        return -EINVAL;
> +    }
> +
> +    bits = simple_strtoul(mmu_type + 8, &end, 10);
> +    if ( (*end != '\0') || (end == mmu_type + 8) )
> +    {
> +        dprintk(XENLOG_ERR, "mmu-type value \"%s\" is incorrect\n", mmu_type);
> +
> +        return -EINVAL;
> +    }
> +
> + out:
> +    if ( bits > (UINT8_MAX - P2M_ROOT_EXTRA_BITS) )
> +    {
> +        dprintk(XENLOG_ERR, "gstage addr bits value overflows uint8\n");
> +
> +        return -EINVAL;
> +    }
> +    /*
> +     * The correct value of bits will be checked in p2m_init() by call of
> +     * find_gstage_mode_by_bits().
> +     *
> +     * As mmu-type property contains one of string:
> +     *  - riscv,sv32
> +     *  - riscv,sv39
> +     *  - riscv,sv48
> +     *  - riscv,sv57

Or about any other riscv,sv<N> with N up to somewhere around 250. I see
that ...

> +     * it is needed to add '+P2M_ROOT_EXTRA_BITS' as for G-stage mode GPAs
> +     * are extended by P2M_ROOT_EXTRA_BITS.
> +     */
> +    bd->create_cfg.arch.gstage_addr_bits = bits + P2M_ROOT_EXTRA_BITS;

... the value calculated here is later checked for validity, so it's
really only the comment which may want clarifying a little.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -45,12 +45,27 @@ struct p2m_pte_ctx {
>      unsigned int level;          /* Paging level at which the PTE resides. */
>  };
>  
> -static struct gstage_mode_desc __ro_after_init max_gstage_mode = {
> -    .mode = HGATP_MODE_OFF,
> -    .paging_levels = 0,
> -    .name = "Bare",
> +/* Values should be sorted by ->mode in this array */
> +static const struct gstage_mode_desc gstage_modes[] = {
> +    /*
> +     * Based on the RISC-V spec:
> +     *   Bare mode is always supported, regardless of SXLEN.
> +     *   When SXLEN=32, the only other valid setting for MODE is Sv32.
> +     *   When SXLEN=64, three paged virtual-memory schemes are defined:
> +     *   Sv39, Sv48, and Sv57.
> +     */
> +    { HGATP_MODE_OFF,    0, "none" },
> +#ifdef CONFIG_RISCV_32
> +    { HGATP_MODE_SV32X4, 1, "sv32" },
> +#else
> +    { HGATP_MODE_SV39X4, 2, "sv39" },
> +    { HGATP_MODE_SV48X4, 3, "sv48" },
> +    { HGATP_MODE_SV57X4, 4, "sv57" },
> +#endif
>  };
>  
> +const struct gstage_mode_desc * __ro_after_init max_gstage_mode = &gstage_modes[0];

Nit: Overlong line (and, strictly speaking, a stray blank after *).

> @@ -331,8 +324,35 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
>      return 0;
>  }
>  
> -int p2m_init(struct domain *d)
> +static const struct gstage_mode_desc *find_gstage_mode_by_bits(

Is "_by_bits" adding much value to the function name? Especially ...

> +    unsigned char gpa_bits)

... seeing that the parameter name is making things pretty clear?

> +int p2m_init(struct domain *d, const struct xen_domctl_createdomain *config)
>  {
> +    /*
> +     * TODO: This static is a temporary constraint: all guests must use the
> +     * same MMU mode because p2m_gpa_bits is not yet per-domain.
> +     * Drop this once per-domain p2m_gpa_bits is introduced.
> +     */
> +    static const struct gstage_mode_desc __ro_after_init *m = &gstage_modes[0];
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
>  
>      /*
> @@ -341,6 +361,33 @@ int p2m_init(struct domain *d)
>       */
>      p2m->domain = d;
>  
> +    if ( !config )
> +    {
> +        dprintk(XENLOG_ERR, "NULL config is passed\n");
> +        return -EINVAL;
> +    }
> +
> +    p2m->mode = find_gstage_mode_by_bits(config->arch.gstage_addr_bits);
> +
> +    if ( !p2m->mode )
> +    {
> +        dprintk(XENLOG_ERR,
> +                "Unsupported or unavailable gstage addr bits: %u\n",
> +                config->arch.gstage_addr_bits);
> +
> +        return -EINVAL;
> +    }
> +
> +    if ( m->mode == HGATP_MODE_OFF )
> +        m = p2m->mode;
> +
> +    if ( m->mode != p2m->mode->mode )

Since m always points into gstage_modes[], do you really need the extra
indirection to compare the two ->mode fields? You could simply compare
the pointers, couldn't you?

> --- a/xen/include/public/arch-riscv.h
> +++ b/xen/include/public/arch-riscv.h
> @@ -56,6 +56,11 @@ typedef struct vcpu_guest_context vcpu_guest_context_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  
>  struct xen_arch_domainconfig {
> +    /*
> +     * G-stage GPA address width in bits.
> +     * Valid values: 34 (sv32x4), 41 (sv39x4), 50 (sv48x4), 59 (sv57x4).
> +     */
> +    unsigned char gstage_addr_bits;

Fixed-width types only in the public interface please.

Also, isn't the field effectively describing the maximum width of a
guest (physical) address? In which case - simply gaddr_bits?

Jan

