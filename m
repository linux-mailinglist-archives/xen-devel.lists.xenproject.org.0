Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YKABG/NQOWoIqgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:12:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60976B09F8
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:12:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YHKaqknX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343877.1603089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgK6-0003vF-4N; Mon, 22 Jun 2026 15:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343877.1603089; Mon, 22 Jun 2026 15:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbgK6-0003sb-1I; Mon, 22 Jun 2026 15:12:30 +0000
Received: by outflank-mailman (input) for mailman id 1343877;
 Mon, 22 Jun 2026 15:12:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wbgK4-0003sV-HE
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:12:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbgK3-006gUH-UM
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:12:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3950db-bab6-0a2a0a5309dd-0a2a4503b8de-0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:12:27 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3950db-a3da-0a2a45030019-d155dd34c03f-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:12:27 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45eea68dd6fso2256715f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 08:12:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46667221de7sm26244717f8f.33.2026.06.22.08.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 08:12:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1782141147; x=1782745947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ze57UfTGEoefrFoI2eYHHdFQ9Jw1MvyZeMlW+rf6QNI=;
        b=YHKaqknXSUy72VuFE6bOSgjjrpQVOpEhVQPl6+veEJgRnX3FkRHVcoh2s/jOhvNbCY
         iozPh9Dw4NJOuMBadY0jNvLpGtXuDkUwJ5Ttz6Er9Qr2k7qjrFCArpnyAC7fkAspAejT
         nCP/p5MkzMTuZPnarDmTcdi009DSHr15crkxlNUZvwaXq7szvdn4xD8iwyYksGIWr+VX
         V1gP1NnXByW8L72JqPSfdgWPWoC90UAcL/TPizRNW0u+tGLYbGnrG2LMPSX7VpnFwWwN
         qu7DtZnlbE8O/Wt0zkKO+slOUyUTGI6Jik6xZPNkLXpB9uH8AfEEHsLDRMR61TxbdB27
         KwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141147; x=1782745947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ze57UfTGEoefrFoI2eYHHdFQ9Jw1MvyZeMlW+rf6QNI=;
        b=ZVp9ub/xLU9j96grq9KGVhw3jrF5eVD/UMRPUIjkwYS5LLKdC4oejfL0umbbWDKNRX
         rQI66NNV5COjjfKJ56lIbLcZaEBBjw6YPguQL3hcmeyMmapfEtra1RDwuRsGI9M9Zdhp
         8DTI1QndGPCxbEnCGMDoxWVOeMuFDTkKRrC+M/DxRk0dDXilUngU5t2rqZ3hrZD5gh3X
         92Q239o+L39TfMlrQwJkWTewOsMKx2+McEpip+K29jVwP6uP629B69QaiIvoG89jIHZV
         Xz4IwePW81KobT9ddh81l9GGi41VZOf+PrBuHBnurvFSJTGI7p7QYPrUuOCoYEi19w4U
         Ub9g==
X-Forwarded-Encrypted: i=1; AHgh+RoBmNZLnWneMjSrmDJzuuGzjP0bNidh4VOpGPfwNCpA5bUnQroNr3QANRG3dNkMcyAjR1eWYGpYERM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwcUIcHApHuL6e0vWFYBe24Zvm+nxTr9Vat62RUl55G1PIClIO
	zRncP0uMO0rtHLlfOqDNsCix9sHix6WlnDyo9nuiFmNBboYO1oQlUWJ2VTwKOoBQDw==
X-Gm-Gg: AfdE7clP5Pkl2BbjiDn5yMdRQ+1hzFwJmCaCb6/l5+reD8prrF+8lGbyNJvxri6x2d9
	BRbbx9SG2zu2uDocIPr5yxV0QZcCvvWnBwwBAFtskKgSmrrR0H+XDcQojJY05nbnEeIDX0rxBk5
	ZmdOvdscJDbsOAA4KGCH72H0ChLY2w8/BJno5bfezOhue2gVpPWpoYYec5bnIynW/wy+MHxq+Yj
	X1pko44HqGN/ZgryrCnU3ISXboDYrVOZqB2f4veHUhGFVc87OxcCoLmPdcQmp78LQxGM8dizE3I
	s8kVVhmszrCxmQfpcWNDh+IGOcduYX8b+C8hb40MjLdOkI8rZbrkkYv1rVSbOL0yPUBrrFHQB2U
	BzcRQybKyPe3yMdSo8fOc52dFlviEwgfO8uuRAT8yjh1K+D0mQ6AoBP9bFlTn+YCRsNVF/UmsfX
	rwTAoqg7waODgit1ZdWs+n9RRjP5MEDUfC7oRRHS+RDSGS6SpkE29LI7uQDgrIgP5os9Z0levak
	jTf
X-Received: by 2002:a05:6000:290e:b0:460:67b7:54f1 with SMTP id ffacd0b85a97d-465705e2948mr22292123f8f.42.1782141146662;
        Mon, 22 Jun 2026 08:12:26 -0700 (PDT)
Message-ID: <424912f9-5a2d-4c68-a25e-8fd5547011c6@suse.com>
Date: Mon, 22 Jun 2026 17:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/23] xen/riscv: generate IMSIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <18938bb8845fa91315e320f88d17147592aba51c.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <18938bb8845fa91315e320f88d17147592aba51c.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782141147-64FCED84-0479C5B8/10/73395122804
X-purgate-type: spam
X-purgate-size: 5749
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C60976B09F8

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> Guests using the IMSIC interrupt controller require a corresponding
> Device Tree description.
> 
> Add support for generating an IMSIC node when building the guest DT.
> This allows guests to discover and use the IMSIC interrupt controller.
> 
> The value choosen for GUEST_IMSIC_S_BASE is an address which is typically
> used for IMSIC and QEMU.
> 
> DT-building functions are marked __init because domain creation happens at
> boot time, before the init sections are freed. In a typical deployment
> libxl creates the interrupt controller node in userspace and hands the
> complete FDT to Xen, so these functions are only called during early
> domain construction.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
>  - s/__ro_after_init/__read_mostly for guest_num_msis.
>  - Use IMSIC_MAX_ID as default for guest_num_msis instead of imsic_cfg.nr_ids.
>  - Drop base_addr local variable in guest_imsic_make_reg_property(); use
>    GUEST_IMSIC_S_BASE directly and introduce size to avoid spelling
>    IMSIC_MMIO_PAGE_SZ * d->max_vcpus twice.
>  - Change irq_ext type from uint32_t * to __be32 * in
>    guest_imsic_set_interrupt_extended_prop().
>  - Move phandle declaration into the loop body.
>  - Extend commit message to explain why __init is used for DT-building
>    functions: libxl creates the interrupt controller node before handing
>    the FDT to Xen, so these functions are only invoked during boot-time
>    domain construction.
>  - Re-order patch before APLIC DT node creation patch.
>  - Update commit message.
> ---
> Changes in v2:
>  - s/imsic_make_reg_property/guest_imsic_make_reg_property.
>  - s/imsic_set_interrupt_extended_prop/guest_imsic_set_interrupt_extended_prop.
>  - Use initalizer for regs[] array in imsic_make_reg_property().
>  - Move buf[] insde the for() loop.
>  - Correct check of returned phandle.
>  - Drop local variable len.
>  - /s/XVFREE/xvfree in imsic_set_interrupt_extended_prop().
>  - Drop initializer for local variable data.
>  - s/uint32_t/unsinged int for pos and cpu in imsic_set_interrupt_extended_prop().
>  - Drop next_phandle as it is now in common code.
>  - Introduce vcpu_imsic_deinit.
>  - Refactor vimsic_make_domu_dt_node() to avoid usage of host IMSIC dt node.
> ---
> ---
>  ...asic-VGEIN-management-for-AIA-guests.patch | 273 ++++++++++++++++++

What is this doing here?

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -13,8 +13,12 @@
>  #include <xen/const.h>
>  #include <xen/cpumask.h>
>  #include <xen/device_tree.h>
> +#include <xen/domain.h>
>  #include <xen/errno.h>
> +#include <xen/fdt-domain-build.h>
> +#include <xen/fdt-kernel.h>
>  #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/macros.h>
>  #include <xen/sched.h>
>  #include <xen/smp.h>
> @@ -36,6 +40,11 @@ static struct imsic_config imsic_cfg = {
>      .lock = SPIN_LOCK_UNLOCKED,
>  };
>  
> +static unsigned int __read_mostly guest_num_msis;

This being host dependent and hence the same for all guests likely also
warrants a comment.

> @@ -521,3 +535,121 @@ int __init imsic_init(const struct dt_device_node *node)
>  
>      return rc;
>  }
> +
> +static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
> +{
> +    paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
> +    __be32 regs[4] = {
> +        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
> +        cpu_to_be32(GUEST_IMSIC_S_BASE),
> +        cpu_to_be32(size >> 32),
> +        cpu_to_be32(size),
> +    };
> +
> +    return fdt_property(fdt, "reg", regs, sizeof(regs));
> +}
> +
> +static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
> +                                                          void *fdt)
> +{
> +    unsigned int cpu, pos = 0;
> +    __be32 *irq_ext;
> +    int res;
> +
> +    irq_ext = xvzalloc_array(__be32, d->max_vcpus * 2);
> +    if ( !irq_ext )
> +        return -ENOMEM;
> +
> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
> +    {
> +        char buf[64];
> +        uint32_t phandle;
> +
> +        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
> +        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
> +
> +        if ( !phandle )
> +        {
> +            res = -ENODEV;
> +            goto out;
> +        }
> +
> +        irq_ext[pos++] = cpu_to_be32(phandle);
> +        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);
> +    }
> +
> +    res = fdt_property(fdt, "interrupts-extended", irq_ext,
> +                       d->max_vcpus * 2 * sizeof(*irq_ext));
> +
> + out:
> +    xvfree(irq_ext);
> +
> +    return res;
> +}
> +
> +int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
> +                                    unsigned int *phandle)
> +{
> +    int res;
> +    void *fdt = kinfo->fdt;
> +    char vimsic_name[128];

Isn't this excessive? You need space for ...

> +    unsigned int vimsic_phandle;
> +    unsigned int num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);
> +
> +    res = snprintf(vimsic_name, sizeof(vimsic_name), "/soc/imsic@%lx",

... up to 11 + 16 + 1 characters. So 32 will do, to make it a "nice" number.

> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -3,6 +3,8 @@
>  
>  #include <public/xen.h>
>  
> +#define GUEST_IMSIC_S_BASE __ULL(0x28000000)

May I remind you of my request to not leave entirely arbitrary (and seemingly
random) numbers uncommented?

Jan

