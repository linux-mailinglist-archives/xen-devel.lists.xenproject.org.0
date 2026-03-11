Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KFdCJAlsWkOrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:19:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308A25EF20
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 09:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250822.1548176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0EmW-0003SO-Nu; Wed, 11 Mar 2026 08:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250822.1548176; Wed, 11 Mar 2026 08:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0EmW-0003Px-KV; Wed, 11 Mar 2026 08:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1250822;
 Wed, 11 Mar 2026 08:19:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0EmV-0003Pp-9d
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 08:19:03 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5129a28-1d22-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 09:19:00 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso7417045f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 01:19:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f821d095sm4857322f8f.32.2026.03.11.01.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 01:18:59 -0700 (PDT)
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
X-Inumbo-ID: f5129a28-1d22-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773217140; x=1773821940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O6sc8H1H+f5MSSkuQGhURBScH13uJ0hgfCYgp5q5ld4=;
        b=KnSsPwFTrGfgyeDAa7/si7Hgd1gvV6Z7aA4rRGmtfGrqRcCLVl2vS43oZ5bks8n+O8
         qKDqPLsTIxOY2vCnjj4HsqnulIBQCqFQrKiQQKh/IOj7Eiak7LHH/dSXNNskC7hQn1sf
         dJAV/l3v1zAHUrh10cIZ+N83hOkJEoq+2Ucer2codVfDVvD1uBuGZ87fsCXb1yfo/uS0
         srYoaAdYiARybGSiCFMp4VigwCkpNLoaJQR5KIa+EHZ/4limnab6l2dJZQf62k/PdcI6
         /XdX82v0gGT3UvKwDvP1fNcunVkUOaf5PxYA9pjvScGJdIJHeUI3gu7/wVj4Ed5Zplto
         Wm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217140; x=1773821940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6sc8H1H+f5MSSkuQGhURBScH13uJ0hgfCYgp5q5ld4=;
        b=elZzJn2G6AXU1BO1Lnkhe9475ataM9T9ES8NKQJ7ymuGAIGBVFp1fNGPXPupYIR7/P
         XGc5PNxx1Q5RZKoboFInl4pLYUiQ8ckh7yt/2TI5GpPgrTvZ/28NUZZRyF/SA22paLrT
         W2YHL9mM/Q7cHVSPsRXujX9RwRWZFER1FLTIvAZ40Db9q2suxO7z0BtpwZx3ZDcDwe/E
         eui8SWTyRiKMXtyfL/4WOCMj8wEy169IWaAUvVO7/RkOCJ7b6lpco/sZDu4Ae/UrjU1p
         5by6hN629UcG4pAPKzz+AgKAfYipqUbABpkP7XToAgAq2O4TsIcBimXyJqoYJxaCFUhy
         4ELA==
X-Forwarded-Encrypted: i=1; AJvYcCWUkLPRI8IyPhfRu7nW6qfa60i/pnTzcWtpTmJIMEnF9y0VD38eqqWTKGbpU3u5dN8g1pofy3zgxBs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw431vCLXHX7lr1h+WKH6WVcm8riLJH2/IuKOx3T2fdxQ+oFh17
	PnYa5RapE129bb03fk0aW2oNGwRbrpIu0kI2O+dboudvEl78lCVqAYBExeEiqH5sHQ==
X-Gm-Gg: ATEYQzys/ochPqNa7UPri7wjsB3vfduBK2xckOqGEIHCjrPQrfqb63uKVi8w7fbNOcZ
	8cY0/uplTCQxfS1u88PNZ/7HnHvzTKQrLOoS6yYBN7cV7hhYVr20FbRFwIbOmEKsfcgHgjV/gQf
	nfLLUi6T2mDJiTv+QsWS6WufKxSZyeEo5z7EVS8SoCKJyowm20RKpWlzzPDVN+QZIGh1BBbvGCi
	+35sPbWlaSBi0PxMmGoWgaDI19DaBxGSNOpIsqh0RkhblWvACVjGUDAJmtYywWQ/vW4TufutmYK
	gggD22PkhTiVcDR7QpM0qUrRyeEKICH1+qoUHyf9nvyfdb6YPfspB4sTJwPjxzXqjG2gQttBnBz
	Jsj0FmrKUPuz1O+QwU0bk8x02ZGTkqckR2G4rl301P73YQaSTZOf6DCy0LEfOEezBaJfMRjAhZj
	2hNtgO0mPTI46NriNoim+KqSn3EhvsRyla/KvozO5zjOQnzUMZxhsJBUALp7SQBw+wAv+0T7s8e
	IHMwMDgCXNKvks=
X-Received: by 2002:a05:6000:1acc:b0:439:ef03:e0b7 with SMTP id ffacd0b85a97d-439f821ba49mr3269474f8f.27.1773217139684;
        Wed, 11 Mar 2026 01:18:59 -0700 (PDT)
Message-ID: <7340581a-51a3-43b2-b180-c2de37bda4b1@suse.com>
Date: Wed, 11 Mar 2026 09:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/27] xen/riscv: Implement ARCH_PAGING_MEMPOOL
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <887d914aa0ddb1884c19c9567d4633ecaf810066.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <887d914aa0ddb1884c19c9567d4633ecaf810066.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7308A25EF20
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
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
X-Rspamd-Action: no action

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> The p2m_freelist is used to allocate pages for the P2M, but to initialize
> this list, domain_p2m_set_allocation() might be called.
> This function is invoked in construct_domU() within the common Dom0less
> code, and providing an implementation of domain_p2m_set_allocation() when
> CONFIG_ARCH_PAGING_MEMPOOL=y is appropriate for RISC-V.

With this wording it is odd to see ...

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -1,5 +1,6 @@
>  config RISCV
>  	def_bool y
> +	select ARCH_PAGING_MEMPOOL

... this. You really want to settle on whether it is selected unconditionally
or not. Also for the code below, where ...

> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -10,7 +10,7 @@ obj-y += irq.o
>  obj-y += kernel.o
>  obj-y += mm.o
>  obj-y += p2m.o
> -obj-y += paging.o
> +obj-$(CONFIG_ARCH_PAGING_MEMPOOL) += paging.o
>  obj-y += pt.o
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += sbi.o

... this change and any #ifdef-ary further down aren't needed unless the
select became conditional. (Plus with the change above things likely wouldn't
even build if ARCH_PAGING_MEMPOOL could be off under certain conditions.)

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1568,3 +1568,34 @@ struct page_info *get_page_from_gfn(struct domain *d, unsigned long gfn,
>  
>      return page;
>  }
> +
> +#ifdef CONFIG_ARCH_PAGING_MEMPOOL
> +
> +int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
> +{
> +    unsigned long pages = PFN_DOWN(size);
> +    bool preempted = false;
> +    int rc;
> +
> +    if ( (size & ~PAGE_MASK) || /* Non page-sized request? */
> +         pages != PFN_DOWN(size) ) /* 32-bit overflow? */
> +        return -EINVAL;

Can't this be had with just

    if ( ((paddr_t)pages << PAGE_SHIFT) != size )
        return -EINVAL;

(and perhaps utilizing pfn_to_paddr(), even if it's not a PFN we're dealing
with here)?

> +    spin_lock(&d->arch.paging.lock);
> +    rc = p2m_set_allocation(d, pages, &preempted);
> +    spin_unlock(&d->arch.paging.lock);
> +
> +    ASSERT(preempted == (rc == -ERESTART));

This actually suggests that (once again) Arm code perhaps shouldn't have been
copied verbatim: There shouldn't be a need for the "preempted" state to be
returned back in two distinct ways.

> +    return rc;
> +}
> +
> +/* Return the size of the pool, in bytes. */
> +int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
> +{
> +    *size = (uint64_t)ACCESS_ONCE(d->arch.paging.total_pages) << PAGE_SHIFT;

As per above, maybe use pfn_to_paddr()?

Jan

