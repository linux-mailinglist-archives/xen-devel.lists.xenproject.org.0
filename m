Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7941ADF1AC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 17:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019297.1396112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuzV-0005Ne-BX; Wed, 18 Jun 2025 15:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019297.1396112; Wed, 18 Jun 2025 15:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuzV-0005LM-8h; Wed, 18 Jun 2025 15:46:21 +0000
Received: by outflank-mailman (input) for mailman id 1019297;
 Wed, 18 Jun 2025 15:46:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRuzT-0005LG-QX
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 15:46:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f4d4351-4c5b-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 17:46:17 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a54836cb7fso5065652f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 08:46:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea8d1asm101510285ad.162.2025.06.18.08.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 08:46:16 -0700 (PDT)
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
X-Inumbo-ID: 5f4d4351-4c5b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750261577; x=1750866377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mgGsg0NF5xME51m1y9/GzQbL7VFIrVp17bR5IjcRPl4=;
        b=CiTn6j2B37aCJnkTdNcuKW4EzJg0l4mdtro1jzfpDNw8fG8AgJmFflwpnIoM08mFEa
         sBVynD1pkN3N9TdZ9yyXdgeHjkWSpOOTYTdqfDoNvV+71AUch0cFOi4d4rOiG1HHrIll
         3h/fZIGO+G3n1/An7ac1lywCYpP4gScHQ3KwPv0ZcqXKx6RbzCdxUJCg6VEF81KEScy9
         NgHPpH1lSsjkchWINrDzfeOgQxZ1/P6mCjawwS09JnR9itnzhb/UcxqoFhrXPGxL3Ywi
         /Hh58/iPXHA5N5c5ipHnX1rSifXsTAJksCqPP7d1tb0H4yeETzvtCjKSx79wJSodQKmH
         DycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750261577; x=1750866377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgGsg0NF5xME51m1y9/GzQbL7VFIrVp17bR5IjcRPl4=;
        b=TFrE3DThr+Gz8pZq9uGhouSZp3COjq/whBd1HTfbpjAKDa1ofjZJF4rLJysQ4bLe1w
         dJYe1kjAPfMHnI6gC5XVUPGVjmPE+VlF/2EeR77INdBgxSPllByHzjUDxztMPB/NYD87
         Mhss9XnzSimiBgLDKXXGvUFgu/qgQjg/rhGRxvq1Ub+zFvEiMCpv3SIcEvDy8ji+EXuS
         RiTcEzsJK7HJjUqDsz/s43DOnzP1QZTzaL0JodpZ/GnAnFcPzz4iSFaOns7MNHf+2eq7
         bPsGdpHEE98LKtW1USXC8wKyRcoRLWZ29emNChdNkilnREqWxEOlTEngCa8oV+RYO6+3
         zcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7VI1xBu48zv5+cM+E549wmD5MttON7PIFX7uMnxRvmBLwt+n0ihgtMnoXiNGLsnOWorNtysHhG5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyckHasFTJnspE0orAlqSvWSNJzJ9ZFffdB2M7EcVcZIJnFjuwE
	cMmdk8hA5hTHlSk0HrF+4QO7YXK/WhUtV5o2nPIyaMdASI1KFyAsGhTEyOKn8aJ2UQ==
X-Gm-Gg: ASbGnctR4OXKI7O+N28pdfm3qLo5jQ8wFN5QfCfcNlkecWKSqNpT8xyHxSnRLOP+s8z
	Dy/TY0/6tzeLUn2uprVApisGxq7du0hZWhcOD+Hs0c4atvB7xCT9L/I5dmuAnyrbq6kPWaPMLor
	IMctWAiBqMUbMdyAqAWsAbMA+zq1eXuNhZYagYRuk6BOlVw+fEGLUGtEpMx4cA+OAGH01GVttuk
	ZzVwmp/xq1MBCpiJ9LD11FfE58Z3XIFWZgBM/Eg7gydMMV5KfT0E5Uv8nWs9uF+JZhBPKz7TZlI
	DCACw8yEwa9IAKgQTKTw7M3IeJpGdlfd0lBV/Pn85eBjpS4k8Kzk6AdnqxXyyR8lk+HCpIiLFvj
	6DwZFlyfcNT39yEDBE0qWtXanuIETh0D/e8i76Sl8yyX/7Cc=
X-Google-Smtp-Source: AGHT+IE30eTrRhlGS98vnFpMbEQjgpopzdRsWKWpqz7bxJeUOi+sm+cdZlygVAU/cjHjhBtIwpDQTA==
X-Received: by 2002:a05:6000:2182:b0:3a5:8a68:b815 with SMTP id ffacd0b85a97d-3a58a68bb82mr5537217f8f.46.1750261576768;
        Wed, 18 Jun 2025 08:46:16 -0700 (PDT)
Message-ID: <d747fd23-9ac3-49d2-8a5e-699290cef3f4@suse.com>
Date: Wed, 18 Jun 2025 17:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] xen/riscv: introduce guest domain's VMID
 allocation and manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <abbf1c30c485d4baae25d4c1fb26942f60015403.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> Implementation is based on Arm code with some minor changes:
>  - Re-define INVALID_VMID.
>  - Re-define MAX_VMID.
>  - Add TLB flushing when VMID is re-used.
> 
> Also, as a part of this path structure p2m_domain is introduced with
> vmid member inside it. It is necessary for VMID management functions.
> 
> Add a bitmap-based allocator to manage VMID space, supporting up to 127
> VMIDs on RV32 and 16,383 on RV64 platforms, in accordance with the
> architecture's hgatp VMID field (RV32 - 7 bit long, others - 14 bit long).
> 
> Reserve the highest VMID as INVALID_VMID to ensure it's not reused.

Why must that VMID not be (re)used? INVALID_VMID can be any value wider
than the hgatp.VMID field.

> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -6,6 +6,7 @@ obj-y += intc.o
>  obj-y += irq.o
>  obj-y += mm.o
>  obj-y += pt.o
> +obj-y += p2m.o

Nit: Numbers typically sort ahead of letters.

> --- /dev/null
> +++ b/xen/arch/riscv/p2m.c
> @@ -0,0 +1,115 @@
> +#include <xen/bitops.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/spinlock.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <asm/p2m.h>
> +#include <asm/sbi.h>
> +
> +static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
> +
> +/*
> + * hgatp's VMID field is 7 or 14 bits. RV64 may support 14-bit VMID.
> + * Using a bitmap here limits us to 127 (2^7 - 1) or 16383 (2^14 - 1)
> + * concurrent domains.

Which is pretty limiting especially in the RV32 case. Hence why we don't
assign a permanent ID to VMs on x86, but rather manage IDs per-CPU (note:
not per-vCPU).

> The bitmap space will be allocated dynamically
> + * based on whether 7 or 14 bit VMIDs are supported.
> + */
> +static unsigned long *vmid_mask;
> +static unsigned long *vmid_flushing_needed;
> +
> +/*
> + * -2 here because:
> + *    - -1 is needed to get the maximal possible VMID

I don't follow this part.

> + *    - -1 is reserved for beinng used as INVALID_VMID

Whereas for this part - see above.

> + */
> +#ifdef CONFIG_RISCV_32
> +#define MAX_VMID (BIT(7, U) - 2)
> +#else

Better "#elif defined(CONFIG_RISCV_64)"?

> +#define MAX_VMID (BIT(14, U) - 2)
> +#endif
> +
> +/* Reserve the max possible VMID to be INVALID. */
> +#define INVALID_VMID (MAX_VMID + 1)
> +
> +void p2m_vmid_allocator_init(void)

__init

> +{
> +    /*
> +     * Allocate space for vmid_mask and vmid_flushing_needed
> +     * based on INVALID_VMID as it is the max possible VMID which just
> +     * was reserved to be INVALID_VMID.
> +     */
> +    vmid_mask = xvzalloc_array(unsigned long, BITS_TO_LONGS(INVALID_VMID));
> +    vmid_flushing_needed =
> +        xvzalloc_array(unsigned long, BITS_TO_LONGS(INVALID_VMID));

These both want to use MAX_VMID + 1; there's no logical connection here to
INVALID_VMID.

Furthermore don't you first need to determine how many bits hgatp.VMID actually
implements? The 7 and 14 bits respectively are maximum values only, after all.

VMIDLEN being permitted to be 0, how would you run more than one VM (e.g. Dom0)
on such a system?

> +    if ( !vmid_mask || !vmid_flushing_needed )
> +        panic("Could not allocate VMID bitmap space or VMID flushing map\n");
> +
> +    set_bit(INVALID_VMID, vmid_mask);

If (see above) this is really needed, __set_bit() please.

> +}
> +
> +int p2m_alloc_vmid(struct domain *d)

Looks like this can be static? (p2m_free_vmid() has no caller at all, so
it's not clear what use it is going to be.)

> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    int rc, nr;

No need for the blank line between the (few) declarations?

> +    spin_lock(&vmid_alloc_lock);
> +
> +    nr = find_first_zero_bit(vmid_mask, MAX_VMID);

As per this nr wants to be unsigned int.

> +    ASSERT(nr != INVALID_VMID);
> +
> +    if ( nr == MAX_VMID )
> +    {
> +        rc = -EBUSY;
> +        printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", d->domain_id);

Please use %pd.

> +        goto out;
> +    }
> +
> +    set_bit(nr, vmid_mask);

Since you do this under lock, even here __set_bit() ought to be sufficient.

> +    if ( test_bit(p2m->vmid, vmid_flushing_needed) )
> +    {
> +        clear_bit(p2m->vmid, vmid_flushing_needed);

And __clear_bit() here, or yet better use __test_and_clear_bit() in the if().

> +        sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);

You're creating d; it cannot possibly have run on any CPU yet. IOW
d->dirty_cpumask will be reliably empty here. I think it would be hard to
avoid issuing the flush to all CPUs here in this scheme.

> +    }
> +
> +    p2m->vmid = nr;
> +
> +    rc = 0;
> +
> +out:

Nit: Style.

> +    spin_unlock(&vmid_alloc_lock);
> +    return rc;
> +}
> +
> +void p2m_free_vmid(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +    spin_lock(&vmid_alloc_lock);
> +
> +    if ( p2m->vmid != INVALID_VMID )
> +    {
> +        clear_bit(p2m->vmid, vmid_mask);
> +        set_bit(p2m->vmid, vmid_flushing_needed);

Does this scheme really avoid any flushes (except near when the system is
about to go down)?

As to choice of functions - see above.

> +    }
> +
> +    spin_unlock(&vmid_alloc_lock);
> +}
> +
> +int p2m_init(struct domain *d)
> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    int rc;
> +
> +    p2m->vmid = INVALID_VMID;

Given the absence of callers of p2m_free_vmid() it's also not clear what use
this is.

Jan

