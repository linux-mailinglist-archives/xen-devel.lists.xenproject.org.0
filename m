Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ejrrEx/DT2r1nwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:49:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635B733182
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 17:49:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Gja1L6cB;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358292.1612484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whr0F-0004Vo-8W; Thu, 09 Jul 2026 15:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358292.1612484; Thu, 09 Jul 2026 15:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whr0F-0004Tx-5d; Thu, 09 Jul 2026 15:49:31 +0000
Received: by outflank-mailman (input) for mailman id 1358292;
 Thu, 09 Jul 2026 15:49:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whr0D-0004Tr-Lk
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:49:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whr0C-00CEuh-VV
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 17:49:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4fc2fb-bab6-0a2a0a5309dd-0a2a450ca8b4-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:49:28 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a4fc308-e897-0a2a450c0019-d155dd36d0cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 17:49:28 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so5543f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:49:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6e4csm49818959f8f.10.2026.07.09.08.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 08:49:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1783612168; x=1784216968; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGObOz3CplQgODUQPRVB1PWFX44ylTCmoKuuwfrZ2f8=;
        b=Gja1L6cBZbRCh2SFHoIHFez+WWhy3AZGbRwdlkGVq0b5J0g54oBJuIT1plfbDvsj3R
         hiu2lRM6NfV3Y+0H8/xcvxwHUxUmmKZp/bOhVV22eFb/To7g4TGXk6EgeXEqzx/cpAFH
         gNT+B2Nsad7eGiVx6F0/HSi4iI6+zGhtJNBFJNhQgOOloPelGO6/XcOlUvvplmoNaVmD
         TpfPeinihg3pavImHYvYCIAcxCGxKUcBnKENOA7IiL6zO1kFUo34bJxwPJu9/NKx5Ir2
         ARV1xriRdyN9CWKNglugGv42cm/2xROaJRfSX9RLf1nwxFIx53+inucDCecCms5jZW4f
         k+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612168; x=1784216968;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGObOz3CplQgODUQPRVB1PWFX44ylTCmoKuuwfrZ2f8=;
        b=f9Y2uEGdG3VS8SbWnlBEkFdraCYRRA2y62SIqzbYjJ0+rW0FkQ6kyOurNjLaPhvU1d
         qzC7HiX5dHFzDgN2AtbhRvRSem9qvNiCpXcaz7IxfeCPTcMjH/vaU7NNJyZkOVbTASl9
         TZRI8XNUYTlrCQn4it+gNmqezmxbdTz6CvXMAaLR9bzzzjDfkX7SkNaYBbz1L5/LTmdY
         5z7tCrsiAbZhNkXXhRT71REuOaEWt8QZ5vAOJm2ctFkT23Px+/j0tJcWedJdVR2FwRng
         8HcYNZOeNzPWh4e8wvoDlQvxCL5l1QwnI6hzQQFdVcxSjLLaM5qjbdjUPf0eHAieJ1rc
         OasQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2PkhFD1nWQZ1nPYcoNE81i+qCHhLF2N7BauZ5gZqQ09rXQO7gAJpVl3ru9v1e38NqbevMgZsRxKM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypCpc6vWyfLNyGQX7f4+V7tJD5h9i3s6EEdiFQeZbiagVyt+Ww
	6TdNR+VRqgDp4iCgE7DkY6hZUkwkBinxaaad/lUli4YQoxbKzDpyMdRF1O1U5n6C+w==
X-Gm-Gg: AfdE7cmX45FLrvqV1DAyvu5MrJE1sW9+uI8C1RK4VZL0s+4myKpEy3J/L0BQbQkf0q2
	3WffIe/yV7oYOWRkiYfnESj7TfSSjiwhN/yPlvLFpxaiATxQbTM/9fHl1OygdG2kWueXv6SsRgV
	J9sRS2uz/rbYh8B/oEL6bgyOyuR5MuZN6Lhz9WSy0CeWi5IJfrF/q1d7xLzMaFiGELx2xsri3WO
	1tYliLiqVZCjwR+10Xp9GqEFbpDBp3JFdHipRXKnGk7h7iiC9qns1Qay0SoeDy19ZAuHH1Qx+by
	1RJ4AYWGOASHIxcarfyBTz42SdwSSH6Qh7IV7ZPwRs2xtFD8sxyocbVU1eLDB4rEiG8g8MzrCkm
	+jbkyedlvB2a+itkVBp89Remf1fX8BHlGnJEsEIZ8H6PG4YiO+Hw0jvf/gVa1K30C6mY6g3QZ7Q
	sTQoFyd4xwIqh46UvKZaGueLYvLAR4kQkMCo18INuIm6OD647i+k+1Vdptfe8rwmS105LT/LpzL
	JPY
X-Received: by 2002:a05:6000:25c2:b0:472:f8b5:aaca with SMTP id ffacd0b85a97d-47df074874bmr8490195f8f.15.1783612168159;
        Thu, 09 Jul 2026 08:49:28 -0700 (PDT)
Message-ID: <1649e30f-f470-40d9-a4a5-4189df18dd07@suse.com>
Date: Thu, 9 Jul 2026 17:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/26] xen/riscv: generate IMSIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <7af5bcc9ef818926f02244f5d566541da06a0a16.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7af5bcc9ef818926f02244f5d566541da06a0a16.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783612168-D4B7D6B2-61B84FF7/0/0
X-purgate-type: clean
X-purgate-size: 3966
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9635B733182

On 06.07.2026 17:58, Oleksii Kurochko wrote:
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
> @@ -34,6 +38,21 @@ static struct imsic_config imsic_cfg = {
>      .lock = SPIN_LOCK_UNLOCKED,
>  };
>  
> +/*
> + * Number of MSIs available to a guest. Determined by the host interrupt
> + * controller, so it is identical for every domain -- hence a single global
> + * rather than a per-domain value.
> + */
> +static unsigned int __ro_after_init guest_num_msis;
> +
> +#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
> +
> +/*
> + * Value is inspired by what QEMU is using for riscv,num-ids property for IMSIC
> + * node.
> + */
> +#define GUEST_IMSIC_MAX_MSIS 255

#define GUEST_IMSIC_MAX_MSIS 255U

to avoid ...

> @@ -285,6 +304,13 @@ static int imsic_parse_node(const struct dt_device_node *node,
>          return -ENOENT;
>      }
>  
> +    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
> +        guest_num_msis = tmp;
> +    else
> +        guest_num_msis = IMSIC_MAX_ID;
> +
> +    guest_num_msis = min(GUEST_IMSIC_MAX_MSIS + 0U, guest_num_msis);

... the "+ 0U" here?

As to the use of IMSIC_MAX_ID - why not use GUEST_IMSIC_MAX_MSIS right away?
Overall perhaps

    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
        guest_num_msis = min(GUEST_IMSIC_MAX_MSIS, tmp);
    else
        guest_num_msis = GUEST_IMSIC_MAX_MSIS;

?

> @@ -522,3 +548,119 @@ int __init imsic_init(const struct dt_device_node *node)
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
> +        snprintf(buf, ARRAY_SIZE(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
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
> +    char vimsic_name[32];
> +    unsigned int vimsic_phandle;
> +    res = snprintf(vimsic_name, sizeof(vimsic_name), "/soc/imsic@%lx",
> +                   GUEST_IMSIC_S_BASE);

Blank line please between declaration(s) and statement(s). Also the revlog
claims you switched to ARRAY_SIZE() everywhere, when really you didn't.

Jan

