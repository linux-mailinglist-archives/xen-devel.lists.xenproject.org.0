Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kQLmKyeJQmpp9QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:03:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E407D6DC692
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:03:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=L7Pmksf1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347693.1605522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDVJ-0006GM-Ql; Mon, 29 Jun 2026 15:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347693.1605522; Mon, 29 Jun 2026 15:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDVJ-0006Db-NZ; Mon, 29 Jun 2026 15:02:33 +0000
Received: by outflank-mailman (input) for mailman id 1347693;
 Mon, 29 Jun 2026 15:02:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weDVI-0006DV-4P
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:02:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDVG-000ZYB-NH
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:02:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4288fa-2eae-0a2a0a5409dd-0a2a4505bcfe-42
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:02:30 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428906-3cb2-0a2a45050019-d1558034bde7-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:02:30 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493a440bc10so11536345e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:02:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493a4cc6659sm160269415e9.13.2026.06.29.08.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 08:02:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1782745350; x=1783350150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0NmtpXITKwQaE0u3dR0+KuQ2KYopuzzwKwWqvfFcYD4=;
        b=L7Pmksf1pWUxIPMqGUSGWl8J4nBQUXGESpiLKgVxmfwhGsyZq9I+OUS+mrL7cInMBS
         XyYZi7aCBBqZNm1QVIJysqoO941mD0Ruu4clqgUZ5N2p+lXf02/Q9muIDPh1mAUET6A+
         kCA3XY5Jq6X5YV/BemjfrzCGkew68Mx089t/r562fq2FBNoK2iKtp8oc02XcA62MEEyQ
         Nl42JkOYPl41XesH9YthfzQ+y/mKZUDd1ERlFxnVwTFwE/+Tf0EOVNHOPQ9WlXPwg83i
         SViYhgpKeQx/4hINsWp0+UyJ0unDifNpqF1PMix1Aj8qrFmQrz8s0/MOE6VLTpiiiic1
         GiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745350; x=1783350150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NmtpXITKwQaE0u3dR0+KuQ2KYopuzzwKwWqvfFcYD4=;
        b=OrKdq+J5L8T+sQNoCEhPEsbnbvVRctbXDKqC65sYK58ilpM69XLcLrLldcEoN+eFgf
         BUav5kIGP3jOqaSG0dIYQmcN5war6JVv7CrfgGUEfbUWjhIhvdvHFpPa3/d1DdDoniN+
         zYlLFz09da804llxDdy1YiiWCqIEK4x2eYiNez0E1RQ1u/Xc1EXKnIlkE3AprEJJt1Yu
         yujLZBT0NZgYqT8ONkspG/blcSMoB9LwHKY0wEghqYZ9tiW0uWJE1s6lg/XvNA8X1BMc
         Mtv2bPKNKp20X5LA4xGcPH2tKsrGx+C77ETPvTf48XO7MEZlUXU6PPF05oDuXD4T0vjq
         bIIg==
X-Forwarded-Encrypted: i=1; AFNElJ/8zX4ZOS6idNtXETPx49MHbtLyNHmjXYB5onRlIb7BaQBYpCQkE5Ac9644WH13zYYIrzpzAsZH3OY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyK27UyrlA3p4f7iH/Zt0xST4w8ofUSsmQYOITHflQXulaDTRtZ
	5CJK+gHEj3nDI6dUvp1I5mRoNSxsZZ/zfblReiDBtIk4pdezt6DJidSUqk8LswMAZQ==
X-Gm-Gg: AfdE7cnCRfV4yvb0AvmRJZUQgRykph3kjfsWzyvPw4hyLw5+An8HZ9STmruVopYkD0v
	qN912COWTM9JxBdOUEqClCMq5HzDGkP5vd7vzWLuYS3RMIl0OzyWQii+4PSH9hqlWHrS7hjtQyK
	eCglWlv/RdsgVjlOgGxaMqiVC+PyFeN1Z7rGzM6iFceFeU1QZhWKQqwPhg0obNVIvym4pplfgVI
	XXa6WAK0sc2sXxUj5L6CyQUJfpY2IYZTuQs/iE7awmxWSZy4rYYg0dxVmvQ5xYUd/okkR5GQwSI
	Tcn/HGY52BfIrCG1u708EtSAmDo3EVWh/w8knegrRPC3tIWnQ49s49BaZVr/paTxomzkq9Yt1+S
	Y8gn1UVGbbD9Y+z1Ph6AKCM3bZCEOBgXt3zgx5Ym/o4+M3wKrWEMkBFFYkRTuqM+5YZhKEFQRII
	pehJzZHmOyYfhi30Tp9vKSXJ3gyd0ZYvPEtfglZF6LNzzfp/TFn4iV/VLkUq7caKi2qyxWe6Zs8
	eOHRWNRdiPNkbw=
X-Received: by 2002:a05:600c:540f:b0:492:62d9:4e57 with SMTP id 5b1f17b1804b1-493b827dee8mr1031455e9.2.1782745349786;
        Mon, 29 Jun 2026 08:02:29 -0700 (PDT)
Message-ID: <c6f63b4b-1237-4992-bf83-07569d2e6339@suse.com>
Date: Mon, 29 Jun 2026 17:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/25] xen/riscv: introduce minimal virtual APLIC
 (vAPLIC) infrastructure
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
 <61603c1548b7c685fb92e1b687445fc1b6a95c35.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <61603c1548b7c685fb92e1b687445fc1b6a95c35.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782745350-1610C2B8-00DA6664/0/0
X-purgate-type: clean
X-purgate-size: 2936
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
X-Rspamd-Queue-Id: E407D6DC692

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> Changes in v4:
>  - Change subject of the commit.
>  - s/APLIC_DOMAINCFG_RO80/APLIC_DOMAINCFG_RO + added a comment above definition.
>  - Drop unnessary blank lines.

Did you? What about ...

> --- a/xen/arch/riscv/include/asm/aplic.h
> +++ b/xen/arch/riscv/include/asm/aplic.h
> @@ -15,6 +15,9 @@
>  
>  #include <asm/imsic.h>
>  
> +
> +/* domaincfg bits 31:24 are read-only 0x80 */
> +#define APLIC_DOMAINCFG_RO      (0x80U << 24)
>  #define APLIC_DOMAINCFG_IE      BIT(8, U)
>  #define APLIC_DOMAINCFG_DM      BIT(2, U)

... the one you pointlessly add here?

> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -15,6 +15,7 @@ enum intc_version {
>  struct cpu_user_regs;
>  struct irq_desc;
>  struct kernel_info;
> +struct vcpu;
>  
>  struct intc_info {
>      enum intc_version hw_version;
> @@ -51,8 +52,17 @@ struct vintc_init_ops {
>      int (*make_domu_dt_node)(struct kernel_info *kinfo);
>  };
>  
> +struct vintc_ops {
> +    /* Initialize some vINTC-related stuff for a vCPU */
> +    int (*vcpu_init)(struct vcpu *v);
> +
> +    /* Deinitialize some vINTC-related stuff for a vCPU */
> +    void (*vcpu_deinit)(struct vcpu *v);
> +};
> +
>  struct vintc {
>      const struct vintc_init_ops *init_ops;
> +    const struct vintc_ops *ops;
>  };

I may have asked before: Why two distinct structures, next to each other
(and without any comment guiding what is to go where)? Plus you only set
...

> --- /dev/null
> +++ b/xen/arch/riscv/vaplic.c
> @@ -0,0 +1,63 @@
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
> +static int cf_check vaplic_init(struct vcpu *v)
> +{
> +    return vcpu_imsic_init(v);
> +}
> +
> +static void cf_check vaplic_deinit(struct vcpu *v)
> +{
> +    return vcpu_imsic_deinit(v);
> +}
> +
> +static const struct vintc_ops vintc_ops = {
> +    .vcpu_init = vaplic_init,
> +    .vcpu_deinit = vaplic_deinit,
> +};
> +
> +int domain_vaplic_init(struct domain *d)
> +{
> +    struct vaplic *vaplic = xvzalloc(struct vaplic);
> +
> +    if ( !vaplic )
> +        return -ENOMEM;
> +
> +    d->arch.vintc = &vaplic->vintc;
> +    d->arch.vintc->ops = &vintc_ops;
> +
> +    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
> +                             APLIC_DOMAINCFG_RO;
> +
> +    return 0;
> +}

... ->ops here, leaving ->init_ops at NULL (prone to a deref that'll crash).

Jan

