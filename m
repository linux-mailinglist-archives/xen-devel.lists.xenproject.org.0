Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id twEsExqNQmpz9gkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:19:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CA6DC91C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:19:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ehYweZsv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347719.1605549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDli-0002PY-Iz; Mon, 29 Jun 2026 15:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347719.1605549; Mon, 29 Jun 2026 15:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDli-0002My-Fy; Mon, 29 Jun 2026 15:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1347719;
 Mon, 29 Jun 2026 15:19:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weDlg-0002Ms-SR
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:19:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDlf-002Vqi-EM
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:19:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428cf2-e002-0a2a0a5209dd-0a2a450b8bac-22
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:19:27 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428cff-ac48-0a2a450b0019-d155802dd509-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:19:27 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so24687545e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:19:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926c278ab2sm186226995e9.1.2026.06.29.08.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 08:19:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1782746367; x=1783351167; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aQdjR/S7XO8uEz53pGyYoRbaP17MSjlnOCH52Kcf5fk=;
        b=ehYweZsv3wWJqjO6FiGhcslfKDhnbdfd73BUsSqsG0xNAc5SpYWtwQk8UXniQZpXSF
         3tNJoV2hFhEMsRCu5bJgQzAj2KulK0Md2dMJexI1h7CMMQZ6WZIZk0EEwwzS41GIbsob
         MhPR6jOjyIFO6yFpQrUHJU0QoVK4SD3oAAxDosHHkfHpFwCpialJfIm8n8sAc9ESqNEA
         c38MHRZ2nBZtZc7NYN5I6XWwRezBAnGE44q3yJB2R7Yd28A6qUgyErUUOJKZfk7z+/e5
         JGgRyq+7kZ3k2Ml9gAviJV3fafvTJPmSphcO5gMOkBA9DM40eyVVZOhTNFaL25PZK5Ki
         Lsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746367; x=1783351167;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQdjR/S7XO8uEz53pGyYoRbaP17MSjlnOCH52Kcf5fk=;
        b=jZKwA+8T+pcRqpz5TE1pWG7BwtMjPoJ1SFWT2tperQ0+cxxkEmLr2Bs50j5VPzzlH3
         pxFYVaREFLDtapxdBWNjXmcGa/RrW2Ga5UBfH4wWxgUef6yOmqV6ArloMTtXijTFI77l
         3nH1EgoECGjPwymtyb2wnNMGB+pLJ7Q6mfR6/hxQjT26ustJhOO7oXIh9tr9WxFb7Tt6
         FEhJobGPdTL8QP0+Ua1j+1g52N5SBRJdv+p2biV5em5xolZ5CVxD3G7zDSXbcBQDKuV0
         FLvfH2T5VPLZ2M5LkyxUNdDHaKIZmkQ2GiDDKa5KTqBvbc7vtv6W4z4jF4+ZCCK6Hg8U
         iSZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n220M97y5b7mGSRPI0V1bmo5RBMZWtZspeH2gS6QoUuc6Ho4mIcP0RCO9o+R0HQt05EHWoQvQhOA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+pt6pnBlgOEJ0c/BujP6ojImBGWBXfldq81/+Wif56bi7ikOD
	mJhqK2d6GB7cAJWogQXOsOwwZq8WtdvpDY5On80CaKoxihmcleeZy3W7IRo3L+6P9Q==
X-Gm-Gg: AfdE7cnB8Of0oUCJq4CaoH/qKKWdZgJJN4P0uAeqAZDfQX3wO+WgoFpIY+4JCmbHjvh
	XjlHx9mRUUPu+UBjruNoYVapgbp/bH6dW3SQGcr26ua1m5osiimBUVWrVSejxXbbf3/Q7IVDRhL
	bjpOT6+eBpkWIoJ0JLomllQC0R00JEnykJBKp98XYF2YygoeEVDMF5YRWfYh/LphxzoF1sVw27C
	fwFq2N7bqZKB+wkPPYpBNPQcbpqVzM+y3uRxo/oT+d4M3L9JbT03J7cIH47GQxKZm+P7+kTMvB/
	kh9qBpX2/W/sujS5OZSBLg7vk0+Rcfhd6Lj6conRkPj8rU/7AJD2T7k8o7/VXaxpr1cYh9ggGJU
	ZQMSqcU+N0Q+SEnptT9cuyZAuf32kc8H/YoOSexoDbtAYaftwDrwDjKTlnwOOVdptcPlwkmvmS4
	+prtOqE4aYmUwhC9loRZzV2TDkxMxwGEswT9OH4Qtt9dWFkDvn0xXeY1+z53hi8W9WG5o/vOwFo
	k8p
X-Received: by 2002:a05:600c:310e:b0:493:b4cf:d37a with SMTP id 5b1f17b1804b1-493b827f60amr2494835e9.4.1782746366679;
        Mon, 29 Jun 2026 08:19:26 -0700 (PDT)
Message-ID: <77d3cf2c-3ed7-45f8-8e76-72520e71306b@suse.com>
Date: Mon, 29 Jun 2026 17:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/25] xen/riscv: generate IMSIC DT node for guest
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
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <424c223b97e9d27aa4ef4e05e2d5c8d0c426324c.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <424c223b97e9d27aa4ef4e05e2d5c8d0c426324c.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782746367-3912D220-D153B0C7/0/0
X-purgate-type: clean
X-purgate-size: 3732
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 976CA6DC91C

On 26.06.2026 17:46, Oleksii Kurochko wrote:
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
> @@ -34,6 +38,16 @@ static struct imsic_config imsic_cfg = {
>      .lock = SPIN_LOCK_UNLOCKED,
>  };
>  
> +/*
> + * Number of MSIs available to a guest. Determined by the host interrupt
> + * controller, so it is identical for every domain -- hence a single global
> + * rather than a per-domain value.
> + */
> +static unsigned int __read_mostly guest_num_msis;
> +
> +#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
> +#define GUEST_IMSIC_NUM_MSIS 255

Considering its use this isn't named correctly - it's not the number of MSIs
guests get to use.

> @@ -285,6 +299,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
>          return -ENOENT;
>      }
>  
> +    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
> +        guest_num_msis = tmp;
> +    else
> +        guest_num_msis = IMSIC_MAX_ID;

Why is guest_num_msis __read_mostly, not __ro_after_init? Merely because the
function here (wrongly) isn't __init?

> @@ -522,3 +541,121 @@ int __init imsic_init(const struct dt_device_node *node)
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

May I, btw, suggest you get into the habit of using ARRAY_SIZE() in favor of
sizeof() with snprintf()? That's because sizeof() isn't correct to use if
wide strings (and hence swnprintf()) come into play.

> +int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
> +                                    unsigned int *phandle)
> +{
> +    int res;
> +    void *fdt = kinfo->fdt;
> +    char vimsic_name[32];
> +    unsigned int vimsic_phandle;
> +    unsigned int num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);

As guest_num_msis (supposedly) doesn't change anymore after it was set, why
would this need calculating again for each call here? Can't you apply the
upper bound right in imsic_parse_node()?

> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -3,6 +3,12 @@
>  
>  #include <public/xen.h>
>  
> +/*
> + * Base address of the guest's supervisor-mode IMSIC. The value is the address
> + * typically used for IMSIC by QEMU.
> + */
> +#define GUEST_IMSIC_S_BASE _UL(0x28000000)

As you mention it explicitly: Is there also a user-mode IMSIC?

Jan

