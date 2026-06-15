Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jkpYKRccMGpHNwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:36:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD90687C2E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:36:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=HXt3T03K;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338417.1599449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ9MT-0005Bc-KJ; Mon, 15 Jun 2026 15:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338417.1599449; Mon, 15 Jun 2026 15:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ9MT-00059G-HZ; Mon, 15 Jun 2026 15:36:29 +0000
Received: by outflank-mailman (input) for mailman id 1338417;
 Mon, 15 Jun 2026 15:36:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZ9MR-00059A-Ed
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:36:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ9MQ-002M2E-Bz
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:36:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a301bfa-2eae-0a2a0a5409dd-0a2a4507cd5e-2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:36:26 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a301bfa-229c-0a2a45070019-d155802df0b0-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:36:26 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-491609cdd8fso16957885e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:36:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922f9cd140sm1633355e9.0.2026.06.15.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 08:36:24 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781537785; x=1782142585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WQBHaevgBAaT29lBBS8xknWKa8na0j/Kg2/5JeoSVYQ=;
        b=HXt3T03KdPefCMi/6D0tsO0t64H8Jxh8gsZ+/Q6QZX3PCry772BI22BKaAFtufel0C
         dCMr3Gact1chD1HyR00Vz584y2+puW21PSqy5NGaEyyO8VYnr1FAeoVS16O8lfCvh4Bk
         cj45g2BFTp1rsC1h0jEdPOlnoYf/sRsCb39gzLdaU4eI5NMwL07w4SG50XtlK4kIA8iP
         Ax2RwzznzFtFZq87Zwxm39mOgrmwq/N7NryT3/ucuo848ugwBwLe8j4J7tdWbe9Du83+
         ZhM328w4dpjOnfedPTRTmM4xdlwCP8cT5/E0usTJWMrhc4cj1tUsahUAgzzrdSVJOafJ
         HHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781537785; x=1782142585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQBHaevgBAaT29lBBS8xknWKa8na0j/Kg2/5JeoSVYQ=;
        b=Wp+nhn/4MjJhTU0RDPqtHPQ66Nr+Ai3FGFkuKMT8vWPIoXlKqwvLrtLgBOVPR3u02z
         UPJb709/uJXXtWCleHXlvAvDnf6sGZ4KwYbPfCJIZro+zEy675Dw0wWfV++6yzozzoYm
         lMMp7i35RIuao0cV/HF9fKSLGLOjBzoS4wg/nXhRb+cany/BK3GwIjw1bF6Qqnur0fhS
         EgNCUKJFV/HJ2Tc+1LDKr2MwziGTxPgzUxvx736K2n3CZNQurpRy93Bmpke7OpDxNrtq
         aKY/PjqEGueklhFMKbGQZ9vMM4MozVB7QbLGeDar47yr60ambewq5rdec4w0Rplu+VVc
         X7Aw==
X-Forwarded-Encrypted: i=1; AFNElJ++XwRMy9dkulUb2iWTsFXitPXLwH92n48JewYNr+kLqgqU2pJjVra8g6BhdfgP0z7o066EIsXGlBA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJw4SPUOLfLla1QZf5lFFNZei7geSUXH+mEis/9BDwVPi+Ycam
	+nGNfPe0vFDZFkDXZTjmuZs/u+iy0Tq8z1QV+E1ut887fH0g01ObEZuYfTc+xp4Auw==
X-Gm-Gg: Acq92OHLjo1JjamTeVu/m2wAqILIidUKFCrSjg7SYKh9b9wXdY41Sm7FKaitB9PgTTl
	0nxkqjZ437ekUfcN4u25GgPVWwEoAoECXD+JK0yNgENdh54TdPclRp0YETXLoXyFumxnWUrPkgM
	CI0/Xexgob6pIFzDsmlH00dYDE3+1IhATdIidk8N0+lfXzyBACPTq3ZqZq1nn8rl91zKk3wV17I
	x+0m/HGEoWVk/MfQ6TDk+mun3pO/rrST4cX+xKpr/WXzhpUt7ztTxLPvR/uMm28uvfCgUTEHpFf
	Wk+9ltMy102Mi1/IvghQAn8sByM5IXA/8MXX4oQfgoPa+KA8listyfQlp8Zh/0AffYk1yIoveQ3
	FDdjHtXassYNhvm2CtKQBKAjbdHXHy8qbFh3y0qtgINPVO2XdJXU40wBj5VntqQlzQcf+zpUl+r
	VIOrszsWVr+GOWy8ksAMjnhYMp/RFMsdONFeCaAddx19N6CUU93Cy8BNyqZ7BH4LRKafNAXHWhT
	BRhy1+ZQpRk9KM=
X-Received: by 2002:a05:600d:844f:20b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490ec4c3d2fmr144824025e9.12.1781537785297;
        Mon, 15 Jun 2026 08:36:25 -0700 (PDT)
Message-ID: <386f089a-9e68-428b-bdc4-0d36526f27fc@suse.com>
Date: Mon, 15 Jun 2026 17:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/26] xen/riscv: add initial dom0less infrastructure
 support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <0b52530fe7287ed8600b1877b573b5cd0168634a.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0b52530fe7287ed8600b1877b573b5cd0168634a.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1781537786-20B60C48-9D661B50/10/73395122804
X-purgate-type: spam
X-purgate-size: 3447
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,cardoe.com,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FD90687C2E

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> Enable dom0less support for RISC-V by selecting HAS_DOM0LESS and
> providing the minimal architecture hooks required by the common
> dom0less infrastructure.
> 
> Add stub implementations for architecture-specific helpers used when
> building domains from the device tree. These currently perform no
> additional work but allow the generic dom0less code to build and run
> on RISC-V.
> 
> Introduce max_init_domid as a runtime variable rather than a constant
> so that it can be updated during dom0less domain creation.
> 
> Provide missing helpers and definitions required by the domain
> construction code, including domain bitness helpers and the
> p2m_set_allocation() prototype.
> 
> Additionally define the guest magic memory region in the public
> RISC-V interface.
> 
> As HAS_DOM0LESS is selected for RISC-V now it could be a compilation
> issue if CONFIG_STATIC_MEMORY=y as guest_physmap_add_pages() isn't
> yet provided.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - Move declaration of p2m_set_allocation() to p2m-common.h.
>  - Add __initdata for max_init_domid and drop initalizer for it.
>  - Add CONFIG_STATIC_MEMORY=n to CI's randconfig to avoid
>    compilation error because of guest_physmap_add_pages()
>    isn't provided.

Yet another trap for people to fall into, and yet another item to clean
up before the port is really ready to use. Imo there want to be
HAS_STATIC_MEMORY, which RISC-V simply wouldn't select (for the time
being).

> --- a/xen/arch/riscv/dom0less-build.c
> +++ b/xen/arch/riscv/dom0less-build.c
> @@ -102,3 +102,9 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>  
>      return 0;
>  }
> +
> +int __init arch_handle_passthrough_prop(struct kernel_info *kinfo,
> +                                        struct dt_device_node *node)
> +{
> +    return 0;
> +}

No FIXME comment or anything alike? That is, nothing is going to be needed
here even once pass-through is supported?

> --- a/xen/arch/riscv/domain-build.c
> +++ b/xen/arch/riscv/domain-build.c
> @@ -158,9 +158,22 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>      return fdt_end_node(fdt);
>  }
>  
> +int __init construct_hwdom(struct kernel_info *kinfo,
> +                           const struct dt_device_node *node)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
>  int __init make_timer_node(const struct kernel_info *kinfo)
>  {
>      /* There is no need for timer node for RISC-V. */
>  
>      return 0;
>  }
> +
> +int __init make_hypervisor_node(struct domain *d,
> +                                const struct kernel_info *kinfo,
> +                                int addrcells, int sizecells)

The last two parameters being of plain int type is, I suppose, dictated
by DT code?

> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -24,4 +24,7 @@
>  #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>  #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>  
> +#define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
> +#define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)

Why xen_mk_ullong()? That's needed in the public headers only, iirc.

Also these are again two seemingly arbitrary numbers.

Jan

