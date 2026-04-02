Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC76IfxZzmkxnAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:58:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9344388B05
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 13:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271763.1559812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Gh9-0006fm-7s; Thu, 02 Apr 2026 11:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271763.1559812; Thu, 02 Apr 2026 11:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Gh9-0006cn-4K; Thu, 02 Apr 2026 11:58:43 +0000
Received: by outflank-mailman (input) for mailman id 1271763;
 Thu, 02 Apr 2026 11:58:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8Gh7-0006ch-BF
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:58:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Gh6-008pgi-Nl
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:58:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce59e8-bab6-0a2a0a5309dd-0a2a4501982e-20
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:58:40 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce59f0-6fc9-0a2a45010019-d155dd32f097-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 13:58:40 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d23305225so379660f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 04:58:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c50a7sm8025973f8f.15.2026.04.02.04.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 04:58:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1775131120; x=1775735920; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ph6lv5enDlnHnphb3TeTozu2i8QavBSGqx7LJLVqtag=;
        b=bHGVD+HuKsPA5f+Ws0chMDlQsOcIgSep8VuRiHTM1NBPiAR5HUhzId6KlGW74p/noR
         v0TleSsslSn9NKMXeEk1JPCQAj5j1HYX0eydQYSFgUHP3vQ1mc5LW51uA8CIqOEL9irZ
         YA+YXf+PzTjONaudBwmb7R3V+Qk+IMcyflbxRescr5+P48R8ZBFOkHEkQgvnoKo50TR1
         0J7QgWunjxULYkVihk4OLrzoh1c270m6YZrN8JmWEN6gqTYCHOttfWSOHkvW20wJHqxN
         gfV5/4NPIEYnP7JD3VYP0axLvyRDAtQ09QhTyxsiMU/AZNn/DE2FI8euWDHbrd51SEEq
         x8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131120; x=1775735920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph6lv5enDlnHnphb3TeTozu2i8QavBSGqx7LJLVqtag=;
        b=mWU5gzgX3YiLl1sUAOxGw6EGNo3oPJpJrbLwBR2g9Uo4Oneb2RpDQ8gnw/CGUpEiC9
         w89l/p94FmBFMa9OIlmA+yFaxFpH8UL6YhBIKcN4WcIZekpPPpMkLSKhwAxxcMw9Q7md
         6GyvI0MjYdtoeAj5HE1nF9UBe21LlLGcuoOpDenXSUiyVak+D0x8GDCNiovMzczItYA1
         SuS9h8qIJdRBeAOn9+l5mQi6Hggx8xqc4jF3Lw3meG0qipWexzlRh5+84wg5QqrMxktS
         GZqpQZpUyIN4DjguUtgZZ3CtulI7cj7rag+Xwngu53RFpzVPRfEMPHbe2CbiMsh//dgU
         MlEA==
X-Forwarded-Encrypted: i=1; AJvYcCUbij5OuwPZkEJ2aHfSheCS9sh+AhDaxUGctiTzFoRtWguCofmNd2zN//AGxPedq5/IieDBr6Ql2+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMUZlO0AVjzCF/6TjVm+A6tri0zkzm9ERLD29oOtfOV9gOVtcL
	vus7wu/MHw32fBLS8hOU4cScyKonpj96IUbCgKEu6gEpsavGkGrAAaYMxqugKpOJXQ==
X-Gm-Gg: AeBDievpFjs28u9jbdZBSeE4fzqHweSI6QPa7NMxn22oQnMP10ULVhTgSfVZCmc+iwa
	EtvG+fVFddr5S+Zgz4DqYDLZgpKLv9CvTKqlsNq4q0E0YVuX61UxZPnc5zzq/IqCP/FwFCAmuUk
	utERx9NyICQ/I4djU50w8TNy74C8qQFZgO9XuJOtgF5RmgTykoGhnin8eP6RYDsnnlEDT1zRPUI
	QrEb/6SyIDlcH770LKhxHv/9XN/l/Q7Jr5fnla8dQPBAWN5jB046oDrsV6FBGsyNgObNGR3mxMU
	DkJzghmpkZ1v/GV76/US65iQykU+Mlt4nLmqy4gtC5AaB6NJewi6F3/h2NdZPQ14Y/kEWSYu3Xy
	hxu2xSoVVvHDq0j2tegt9SCAcA+AhwuLZQ2h9FJzsfwcXungqGQOA77P8Iv/4ornzigxait9JlP
	x90YI/Q25lBd59rCLMy6NH4qqYS0JuaSOh15fgxx/30BJyR6UdvvXZ7kHxHJsylldSfTuml10yR
	OoVukWeIuMi27w=
X-Received: by 2002:a05:6000:18a8:b0:43c:f90b:5663 with SMTP id ffacd0b85a97d-43d150d7563mr13187395f8f.37.1775131119896;
        Thu, 02 Apr 2026 04:58:39 -0700 (PDT)
Message-ID: <44cb3124-8972-4a0c-b785-64f2022f178b@suse.com>
Date: Thu, 2 Apr 2026 13:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/27] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
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
 <e8bcf5618a19fb44d4391410f2f67ffd98a96647.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e8bcf5618a19fb44d4391410f2f67ffd98a96647.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1775131120-16AF5185-DDCAC4BE/0/0
X-purgate-type: clean
X-purgate-size: 4906
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: E9344388B05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> @@ -47,6 +48,19 @@ struct intc_hw_operations {
>                              const struct dt_device_node *intc);
>  };
>  
> +struct vintc_ops {
> +    /* Initialize some vINTC-related stuff for a vCPU */
> +    int (*vcpu_init)(struct vcpu *vcpu);

v as the parameter name, to fit our convention? (Same below for the other
hook.)

> +    /* Check if a register is virtual interrupt controller MMIO */
> +    int (*is_access)(const struct vcpu *vcpu, const unsigned long addr);

What does "register" in the comment refer to. All I see is an address.
(The const will also want dropping from the parameter in this declaration.)

> +};
> +
> +struct vintc {
> +    const struct intc_info *info;

Isn't this referencing a physical INTC's structure? Why would the virtual
one's properties have to match that of the physical one?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/vaplic.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * xen/arch/riscv/vaplic.c
> + *
> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + */
> +
> +#ifndef ASM__RISCV__VAPLIC_H
> +#define ASM__RISCV__VAPLIC_H
> +
> +#include <xen/kernel.h>
> +#include <xen/types.h>
> +
> +#include <asm/intc.h>
> +
> +struct domain;
> +
> +#define to_vaplic(v) container_of(v, struct vaplic, base)

I'm confused here, maybe first of all because of the use of v. v is our
common identified for struct vcpu * instances. Using it in a macro like
this one suggests a struct vcpu * needs passing into the macro. Yet from
the two uses of the macro that doesn't look to be the case.

Perhaps best to have a struct domain * passed into here?

> +struct vaplic_regs {
> +    uint32_t domaincfg;
> +    uint32_t smsiaddrcfg;
> +    uint32_t smsiaddrcfgh;

The latter two aren't used, and generally I'd expect a h-suffixed field to
exist only for RV32. (The un-suffixed field then would need to be unsigned
long, of course.)

> +};
> +
> +struct vaplic {
> +    struct vintc base;

How does "base" fit with the type of the field?

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -6,6 +6,7 @@
>  #include <xen/init.h>
>  #include <xen/irq.h>
>  #include <xen/lib.h>
> +#include <xen/sched.h>
>  #include <xen/spinlock.h>

Why is this change needed all of the sudden?

> --- /dev/null
> +++ b/xen/arch/riscv/vaplic.c
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * xen/arch/riscv/vaplic.c
> + *
> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + * Copyright (c) Vates
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <asm/aia.h>
> +#include <asm/imsic.h>
> +#include <asm/intc.h>
> +#include <asm/vaplic.h>
> +
> +#include "aplic-priv.h"
> +
> +static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
> +{
> +    int rc = 0;
> +
> +    rc = vcpu_imsic_init(v);
> +    if ( rc )
> +        return rc;
> +
> +    imsic_set_guest_file_id(v, vgein_assign(v));

And vgein_assign() can't fail? (Rhetorical question - of course it can. That
function shouldn't assert that it can fine a valid ID.)

But then - aren't you limiting the number of vCPU-s a host can handle by the
number vgein IDs?

> +    return rc;
> +}
> +
> +static const struct vintc_ops vaplic_ops = {
> +    .vcpu_init = vcpu_vaplic_init,
> +};
> +
> +static struct vintc * __init vaplic_alloc(void)
> +{
> +    struct vaplic *v = NULL;

Onve again - why the initializer? In fact, ...

> +    v = xvzalloc(struct vaplic);

... this could be the initializer.

> +    if ( !v )
> +        return NULL;
> +
> +    return &v->base;
> +}

If you returned and ...

> +int __init domain_vaplic_init(struct domain *d)
> +{
> +    int ret = 0;
> +
> +    d->arch.vintc = vaplic_alloc();

... stored struct vaplic *, the slightly odd to_vaplic() macro wouldn't
be needed.

> +    if ( !d->arch.vintc )
> +    {
> +        ret = -ENOMEM;
> +        goto fail;

Nit: goto when simply return could be used.

> +    }
> +
> +    d->arch.vintc->ops = &vaplic_ops;

Are other kinds of ops structures going to appear? If not, why the extra
indirection?

> +    to_vaplic(d->arch.vintc)->regs.domaincfg =
> +        APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
> +
> + fail:
> +    return ret;
> +}
> +
> +void __init domain_vaplic_deinit(struct domain *d)
> +{
> +    struct vaplic *vaplic = to_vaplic(d->arch.vintc);
> +
> +    XVFREE(vaplic);

If this cleared the struct domain field, then yes. But the way it is, just
xvfree() will suffice. (Re-work following other remarks may want it to
become XVFREE() again, though.)

Jan


