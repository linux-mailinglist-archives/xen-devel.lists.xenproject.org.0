Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOK9MtQgD2rQGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:12:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAE35A80CB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315331.1585135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ544-0007oE-MI; Thu, 21 May 2026 15:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315331.1585135; Thu, 21 May 2026 15:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ544-0007mI-Ir; Thu, 21 May 2026 15:12:00 +0000
Received: by outflank-mailman (input) for mailman id 1315331;
 Thu, 21 May 2026 15:11:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ543-0007mC-KN
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:11:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ543-0033VJ-1A
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:11:59 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f20a4-bab6-0a2a0a5309dd-0a2a4503e41e-22
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:11:58 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f20be-672d-0a2a45030019-d155dd33dd17-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:11:58 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-44a74032ff8so4609418f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:11:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa9366besm4275317f8f.31.2026.05.21.08.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:11:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1779376318; x=1779981118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LvYMlyj7vPTLBC16LbNCX8zaavejg+1Spx5ikv9lC9Y=;
        b=LqPlMul5PkKrubVfvH7Cfl/k6Enc91nCH4rOmM2aXLhfCPlB7izoV0dOnC1he9bur/
         zPiKwX6A6vbNzQzGlktwmy54SQqJRuLeAzuBbRQ9qywNwirN5bjN7QQMdutIK2JZlDt+
         /nMmIWoxaNZODqcv7orrGiqDCqVOulbttBdajo5ouDgCgj5qfIBzDxleNutBf4W540QT
         8pvYHAEdMVJXKzK/JLzqnnjJOUY/egPdBHBlSMCrdMg9gp0oahRR0q1zCSA0bZt1V1A2
         ZYYr3rej21Afz9ZinX+rZpbmMNa01L2JIc/DIPcFKdQ5eFXjZKol+6keb/7hE6OHFfi9
         9baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376318; x=1779981118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvYMlyj7vPTLBC16LbNCX8zaavejg+1Spx5ikv9lC9Y=;
        b=Apv3JzyE7kmWkqYZxL9p+O/XEhRgKxLJAy78CtkWUxMa39XcfQaSVm/+a9qxe0+4LP
         c93Ub69y0lmcp+Kch5Z0AYCbZ5lhZEWtkNLC4wuz/0/0glEIcuAHGgzsoshXBbAQGaY4
         Gf77uSVhX9rtkN/t5PW0J1HkeG/ooNyqcfFJvuKyZqv6p/dj7umN5Q1BiAFSca2Ry4Mt
         c/KD7IUACwBrP7YpCCIs//g5cxCjEnR3e2lDg9p1DWn4nmbkqX2myzX05iOuh3tpmAji
         YMKedVp8pDfp9BiF1XB6vftBoeWQUfbadkqpYIGfXoKOSjjFDjko26eGRYm9sOFNShzO
         qfjA==
X-Forwarded-Encrypted: i=1; AFNElJ+BB8/sWx5ZRh8byUuQGvC46Qh750jLoJY0CfKZgOf/7haJvHy4ZomdbKWbjNZufp0TAV+8s1kUCbg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeRndQN3IcO9D1hkaWabv5XwShwR8SZ9W51mhpILlFZsahJE6N
	uLg1PsPz7CvAKjBKYywPBPFrANQpkbP/ez3YVsRlyN9ITejb9yMsD3H5K3A2BLQzkQ==
X-Gm-Gg: Acq92OFSdTE0+M7J9j05+Da7fD/LxBQLCLI0VnlQ0WG3xxdD67a6CkA1IUBWd4FMpnh
	W5Kzo8FrIM8TUflG17QzjUkXDBUpe860XWyImpr5kCG/RRNmUlMzXGFmuXjiOoJJw1FSX1plVMK
	ae0ZFyVvDr061+Tph9Jkg6rHyvHhveqEgYmV+DWqyxFZ8/7e0Ho4uvYkvpesUnDP8gX6dXoAZ0j
	XfyqfACtY/7CPdgqInq6lUsbyrr0xGFU8FCOWwTlct+pFOQ/XDcG6pegNN2V6xBG9AT/83OSI/P
	6QpfwRliRyZaZGMatC4pmz4ai6WpmrTTRAoJdjy6gJJ94e7KzZyBSJ/5M6MquNxcZYITHNRipPA
	Zk+L1yXSKjAcr4imHKLV0k6dIlzt2Xgi3aIqBcLD355+eWxyTtQrDwYAjTOrRDildYWQf4VnW3S
	AN0BK59ruu0orI+qRJ4t1DnSOAvgpeHsX9Adk3aMI4yCvgf9weSxAvQZtqdgZD8ZQWvhYnP55u6
	t4f0XgRVJlQlr8=
X-Received: by 2002:a5d:5f09:0:b0:43d:1dfe:350a with SMTP id ffacd0b85a97d-45ea3ef2bccmr5325516f8f.22.1779376318225;
        Thu, 21 May 2026 08:11:58 -0700 (PDT)
Message-ID: <45fb6481-ea0e-455e-a0cc-c5ba0caabdf7@suse.com>
Date: Thu, 21 May 2026 17:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/26] xen/riscv: add basic VGEIN management for AIA
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <61291bec7664e780f122ccf438091dfc1aba99e3.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <61291bec7664e780f122ccf438091dfc1aba99e3.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1779376318-38D73938-800B9F2B/0/0
X-purgate-type: clean
X-purgate-size: 5715
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 3AAE35A80CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aia.c
> +++ b/xen/arch/riscv/aia.c
> @@ -1,11 +1,33 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bitmap.h>
> +#include <xen/cpu.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/sections.h>
> +#include <xen/sched.h>
> +#include <xen/spinlock.h>
>  #include <xen/types.h>
> +#include <xen/xvmalloc.h>
>  
> +#include <asm/aia.h>
>  #include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +#include <asm/current.h>
> +
> +struct vgein_ctrl {
> +    unsigned long bmp;
> +    spinlock_t lock;
> +    struct vcpu **owners;
> +    /* The least-significant bits are implemented first, apart from bit 0 */
> +    unsigned int geilen;
> +};
> +
> +/*
> + * Bitmap for each physical cpus to detect which VS (guest)
> + * interrupt file id was used.
> + */
> +static DEFINE_PER_CPU(struct vgein_ctrl, vgein);

Why "Bitmap" in the comment?

> @@ -14,10 +36,132 @@ bool aia_usable(void)
>      return is_aia_usable;
>  }
>  
> +static int vgein_init(unsigned int cpu)
> +{
> +    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
> +
> +    csr_write(CSR_HGEIE, -1UL);
> +    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
> +    csr_write(CSR_HGEIE, 0);
> +
> +    printk("cpu%d.geilen=%u\n", cpu, vgein->geilen);

%u please with unsigned int.

> +    if ( !vgein->geilen )
> +        return -EOPNOTSUPP;
> +
> +    vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen);
> +    if ( !vgein->owners )
> +        return -ENOMEM;
> +
> +    spin_lock_init(&vgein->lock);
> +
> +    return 0;
> +}
> +
> +static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,
> +                        void *hcpu)
> +{
> +    unsigned int cpu = (unsigned long)hcpu;
> +    int rc = 0;
> +
> +    switch ( action )
> +    {
> +    case CPU_STARTING:
> +        rc = vgein_init(cpu);
> +        if ( rc )
> +            printk("AIA: failed to init vgein for CPU%un", cpu);

Looks like there's \ missing ahead of the trailing 'n'.

> +        break;
> +    }
> +
> +    return notifier_from_errno(rc);
> +}
> +
> +static struct notifier_block cpu_nfb = {
> +    .notifier_call = cpu_callback,
> +};
> +
>  void __init aia_init(void)
>  {
> +    int rc;
> +
>      if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
> +    {
> +        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
> +        return;
> +    }
> +
> +    if ( (rc = vgein_init(0)) )
> +    {
> +        dprintk(XENLOG_ERR, "vgein_init() failed with rc(%d)\n", rc);

Messages like this one, provided they're really needed, should be yet more
terse imo: "vgein_init() failed: %d\n".

>          return;
> +    }
>  
>      is_aia_usable = true;
> +
> +    register_cpu_notifier(&cpu_nfb);
> +}
> +
> +unsigned int vgein_assign(struct vcpu *v)
> +{
> +    unsigned int vgein_id;
> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
> +    unsigned long *bmp = &vgein->bmp;
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&vgein->lock, flags);
> +    /*
> +     * The vgein_id shouldn't be zero, as it will indicate that no guest
> +     * external interrupt source is selected for VS-level external interrupts
> +     * according to RISC-V priviliged spec:
> +     *   Hypervisor Status Register (hstatus) in RISC-V priviliged spec:
> +     *
> +     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
> +     *   a guest external interrupt source for VS-level external interrupts.
> +     *   VGEIN is a WLRL field that must be able to hold values between zero
> +     *   and the maximum guest external interrupt number (known as GEILEN),
> +     *   inclusive.
> +     *   When VGEIN=0, no guest external interrupt source is selected for
> +     *   VS-level external interrupts.
> +     *
> +     * So start to search from bit number 1.
> +     */
> +    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
> +
> +    if ( vgein_id > vgein->geilen )
> +        vgein_id = 0;
> +    else
> +        __set_bit(vgein_id, bmp);
> +
> +    spin_unlock_irqrestore(&vgein->lock, flags);
> +
> +#ifdef VGEIN_DEBUG
> +    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
> +           __func__, v, vgein_id, v->processor, *bmp);

%d vs unsigned int again (and then yet again further down).

> +#endif
> +
> +    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;

Is this needed when vgein_release() also does it?

> +    vcpu_guest_cpu_user_regs(v)->hstatus |=
> +        MASK_INSR(vgein_id, HSTATUS_VGEIN);
> +
> +    return vgein_id;
> +}
> +
> +void vgein_release(struct vcpu *v, unsigned int vgen_id)
> +{
> +    unsigned long flags;
> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
> +
> +    if ( !vgen_id )
> +        return;
> +
> +    spin_lock_irqsave(&vgein->lock, flags);
> +     __clear_bit(vgen_id, &vgein->bmp);
> +    spin_unlock_irqrestore(&vgein->lock, flags);
> +
> +#ifdef VGEIN_DEBUG
> +    gprintk(XENLOG_DEBUG, "%s: vgein_id(%u), xen_cpu%d_bmp=%#lx\n",
> +           __func__, vgen_id, v->processor, vgein->bmp);
> +#endif
> +
> +    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
>  }

Overall: How is one to review these two functions, when it's entirely
unclear where they're going to be called from? Among other aspects it
doesn't become clear what the behavior is going to be when
vgein_assign() doesn't find an available ID. I've therefore only
commented on mechanical aspects I noticed.

Jan

