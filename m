Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60442ADC6F4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 11:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018033.1394938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRSvY-0005wt-OG; Tue, 17 Jun 2025 09:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018033.1394938; Tue, 17 Jun 2025 09:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRSvY-0005vS-LK; Tue, 17 Jun 2025 09:48:24 +0000
Received: by outflank-mailman (input) for mailman id 1018033;
 Tue, 17 Jun 2025 09:48:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRSvX-0005v6-QT
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 09:48:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 344acc4d-4b60-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 11:48:21 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so5593868f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 02:48:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900b0683sm8651549b3a.130.2025.06.17.02.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:48:20 -0700 (PDT)
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
X-Inumbo-ID: 344acc4d-4b60-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750153701; x=1750758501; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ikxvVEdP9tQdIuc4q/UjfxjrPXG9GPPrznF6OIrLP/E=;
        b=eQ+M4dsXEw3HSnNpFsuWM4gxprZvCH1ViLswYKjkimWWpG+s42ONBa70tcJQGygWU7
         gSTEo62tdy/z/au4Ka3QZa6Zoffs/iWJLPj/9VffodTRQH5yiai0bFYDsj3ajTmCUkqL
         yVYysoJ9AyPzdl1hpibGIyQsLtHdyOaQO6CpcVjq9rwUbZwLY5ZqDoIM9MHbnFRBlstx
         QKliAZobG9tRt0uwsXuGrBC9vpvp12YDYcR3bvl1rrlXKhkwPjK1nmBv5BUP+VMDq2/y
         BBhe0iRBoCGwo1UCFartdP9uqrxznTFhMqEBJCv71LSVYJTTnF0ALkn7CYEaarXjeDUT
         n8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153701; x=1750758501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikxvVEdP9tQdIuc4q/UjfxjrPXG9GPPrznF6OIrLP/E=;
        b=lgaY3ie2m39kB3qiFE+m+8zlnmBBRmNEkYSda4xsmFA/NmM9oiOfDoLcNIoVjBh5p8
         RMBf8zoNpxZMcPoq8sxcZN7SCpOA2BIv+W7724nNk2Nnxj2ZubXNNXQsByryu3VupXpd
         xHzkaB8EZH5k4XOS/kSoioWCjTA5h+tO92aZkD5Ey3M69KKDSvhASo4tHbbwmm/6+th/
         7/ZlX2Uk5WdHSzrdGK7mvpKJDIeeAqFMm9Q1Kceyq8O+pwx+awn4mNzuRgRYCrukq+yr
         9V0cBdA9U2quPSXJJrygLg+T0o+DebwNpliqUS9qvFrdnM+EZDE+GzXKjZNPcrQVfdan
         vseg==
X-Forwarded-Encrypted: i=1; AJvYcCU+H5NP4Hw2a5P5ke6aryR/fXO30EOji1ifKSTYIJpzL0uBvA4ZlkupsA5FK/fJk1NmKWcQQqHyhcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWyZPZ9WzYTCeGxxYdmgpQG3w0a4uURiVgKNxZRdGw2uVIjD+X
	WBcwalHe8ozqdVjq0Nk1pVBXarcOn8HCUKgZAe6HJj4FyfMpydZgTojrH4Aknq0M9A==
X-Gm-Gg: ASbGncuFhjLz8c2EzA3iWOq0Ynm2crxhV6iu5vBqCsYX7MDk/KAeqkkiXmmGYMj4Xm4
	LOMG8TLPXIkEecJc7NxNig1RtxTUmrCoIjucOEGkqRxaSndH1K0ZPIIbqH3qis12B0UZ8uIjqvi
	w2BtzXUOsTTdclQ1dLcTofMIc2TcRkAghPiTRUFOiW0IRWh6mO/zxvPtH+aYMBOKe+Aaw1yU1Ec
	gQod999YK8uMvLOdCg3oywhdTPfTGpXgoR/4e2syRk8rSc0bJJEFB3ypS3YKroDDHr78T7+ZYB4
	LBXmqqclwcPjSqOb+lZ4W4oMfqn+NHIp9L53QKBgu3zAHnPHVnDZRCrVL7f2MIEUktLEMDV47PI
	kN5qlHtUaLnZFSaNVitGQiXOAtpOVu+cof2GDnU1V1GVRigk=
X-Google-Smtp-Source: AGHT+IHBaiZ7pnGrNmDhm4DHvqZaWV3zskMW5sJ9LSmLPX/DH9KNPNKoUus2TPmUySqpGc3NIRH0xA==
X-Received: by 2002:a05:6000:2c13:b0:3a4:ef36:1f4d with SMTP id ffacd0b85a97d-3a5723a4c09mr10845553f8f.38.1750153700916;
        Tue, 17 Jun 2025 02:48:20 -0700 (PDT)
Message-ID: <1ac74dd3-e0c5-43e5-9eed-c1a2cc17d068@suse.com>
Date: Tue, 17 Jun 2025 11:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/console: introduce domain_console struct
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250617012713.57074-1-dmukhin@ford.com>
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
In-Reply-To: <20250617012713.57074-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 03:27, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce domain_console for grouping data structures used for integrating
> domain's diagnostic console with Xen's console driver.
> 
> Group all pbuf-related data structures under domain_console. Rename the moved
> fields to plain .buf, .idx and .lock names, since all uses of the fields are
> touched.
> 
> Bump the domain console buffer size to the closest power of 2 (256) and
> rename the symbol to DOMAIN_CONSOLE_BUF_SIZE.
> 
> Move d->console->buf management under CONFIG_VERBOSE_DEBUG when the
> HYPERCALL_console_io handler is enabled.

This, if at all, needs to be a separate change (with its own justification).
I for one don't think VERBOSE_DEBUG is intended to control any kind of guest
output.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -559,7 +559,6 @@ void hvm_do_resume(struct vcpu *v)
>  static int cf_check hvm_print_line(
>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>  {
> -    struct domain *cd = current->domain;
>      char c = *val;
>  
>      ASSERT(bytes == 1 && port == XEN_HVM_DEBUGCONS_IOPORT);
> @@ -570,17 +569,24 @@ static int cf_check hvm_print_line(
>  
>      if ( !is_console_printable(c) )
>          return X86EMUL_OKAY;

After this "return" ...

> -
> -    spin_lock(&cd->pbuf_lock);
> -    if ( c != '\n' )
> -        cd->pbuf[cd->pbuf_idx++] = c;
> -    if ( (cd->pbuf_idx == (DOMAIN_PBUF_SIZE - 1)) || (c == '\n') )
> +#ifdef CONFIG_VERBOSE_DEBUG
> +    else

... there's no point to have "else" here.

>      {
> -        cd->pbuf[cd->pbuf_idx] = '\0';
> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> -        cd->pbuf_idx = 0;
> +        struct domain *cd = current->domain;

We normally name such a variable d. It also looks as if this could be pointer-
to-const.

> +        struct domain_console *cons = cd->console;
> +
> +        spin_lock(&cons->lock);
> +        if ( c != '\n' )
> +            cons->buf[cons->idx++] = c;
> +        if ( (cons->idx == (DOMAIN_CONSOLE_BUF_SIZE - 1)) || (c == '\n') )
> +        {
> +            cons->buf[cons->idx] = '\0';
> +            guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
> +            cons->idx = 0;
> +        }
> +        spin_unlock(&cons->lock);
>      }
> -    spin_unlock(&cd->pbuf_lock);
> +#endif

None of the re-indentation is really warranted here (and will likely go away
anyway once the #ifdef is dropped).

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
>      BUG_ON(!d->is_dying);
>      BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
>  
> -    xfree(d->pbuf);
> +    xfree(d->console);
>  
>      argo_destroy(d);
>  
> @@ -800,6 +800,11 @@ struct domain *domain_create(domid_t domid,
>      if ( (d = alloc_domain_struct()) == NULL )
>          return ERR_PTR(-ENOMEM);
>  
> +    err = -ENOMEM;
> +    d->console = xvzalloc(typeof(*d->console));
> +    if ( !d->console )
> +        goto fail;

This definitely need to move down some, at least ...

>      /* Sort out our idea of is_system_domain(). */
>      d->domain_id = domid;
>      d->unique_id = get_unique_id();

... past here. There absolutely must not be struct domain instances be
passed around (see e.g. the call to sched_destroy_domain()) without the
domain ID set. It's hard to see ...

> @@ -862,7 +867,9 @@ struct domain *domain_create(domid_t domid,
>      spin_lock_init(&d->shutdown_lock);
>      d->shutdown_code = SHUTDOWN_CODE_INVALID;
>  
> -    spin_lock_init(&d->pbuf_lock);
> +#ifdef CONFIG_VERBOSE_DEBUG
> +    spin_lock_init(&d->console->lock);
> +#endif

.. why here or ...

> @@ -955,11 +962,6 @@ struct domain *domain_create(domid_t domid,
>      if ( (err = argo_init(d)) != 0 )
>          goto fail;
>  
> -    err = -ENOMEM;
> -    d->pbuf = xzalloc_array(char, DOMAIN_PBUF_SIZE);
> -    if ( !d->pbuf )
> -        goto fail;

... even here wouldn't be early enough anyway.

And btw - where did this buffer allocation move? I don't see anywhere
that d->console->buf would now be initialized. (However, see below.)

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -371,6 +371,22 @@ struct evtchn_port_ops;
>  
>  #define MAX_NR_IOREQ_SERVERS 8
>  
> +/* Arbitrary value; must be a multiple of the cacheline size. */
> +#define DOMAIN_CONSOLE_BUF_SIZE 256

Where does the relationship with cache line size come from? What if
Xen was to run on hardware (whichever arch) with 512-byte cache lines?

> +/* Domain console settings. */
> +struct domain_console {
> +#ifdef CONFIG_VERBOSE_DEBUG
> +    /* hvm_print_line() and guest_console_write() logging. */
> +    char *buf;

To avoid the need to do yet another separate allocation, how about ...

> +    unsigned int idx;
> +    spinlock_t lock;
> +#endif /* CONFIG_VERBOSE_DEBUG */
> +
> +    /* Permission to take ownership of the physical console input. */
> +    bool input_allowed;

    char buf[DOMAIN_CONSOLE_BUF_SIZE];

Ultimately this would allow the buffer size to be e.g. command line
controlled (if so desired), by then simply converting to a flexible
array member.

Jan

