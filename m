Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDBFA20F05
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878695.1288888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcolG-0002V8-D2; Tue, 28 Jan 2025 16:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878695.1288888; Tue, 28 Jan 2025 16:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcolG-0002Su-8m; Tue, 28 Jan 2025 16:48:26 +0000
Received: by outflank-mailman (input) for mailman id 878695;
 Tue, 28 Jan 2025 16:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcolF-0002So-DD
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:48:25 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b06cc1d0-dd97-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 17:48:24 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aab925654d9so1147973666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:48:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fc4aasm811547266b.159.2025.01.28.08.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 08:48:23 -0800 (PST)
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
X-Inumbo-ID: b06cc1d0-dd97-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738082904; x=1738687704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K5WdeAugfw1zLhTjqfKX13AAha5zDWO0+XALTcJYz8g=;
        b=bW3p3LpaTnzItH68XuW6Mt+Sddmzn7f/eAMc+TQstTuMnf/WD4Q/yZAncLWoLRGYko
         e+hi75tK3JijM9C9DuSIIkzosRrsWAn1nBT4KGO8Z9YguWEdJsQjQoFVHwQ71qDPbULJ
         oEGSigDmdjAUOq7dvQEnaRz1Ka3fyeGjqdcF2g/nbicia3A2paBC7HjpyValb/BxKxIS
         ND8Ni2+/b9rdMl5Jr33Xo7Rc8HOwlQK1mgilDwmqhfxrLB+Uzx9ZN8DK0l/0RcS5hZii
         dSWlSXdV4p0wWSENYEeQPQcMoGTIHr61CNAkiwtyixy0T7kHXORw/5q11fK357jWyoCm
         2nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082904; x=1738687704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5WdeAugfw1zLhTjqfKX13AAha5zDWO0+XALTcJYz8g=;
        b=D/0GYAfKZ50neDvcjcxGcc9Klotpl7pNJcDpih2dkhwDrkBnrGVNwQSc6J54en/hDK
         ZyEbjcO1HwPgNTxxmj3or35LQKu4jKDLn0ZXRG+a5nvdmW6Dgt/t6HSlluJYr8Y62X6z
         4FY16dQHoAE85ToDdMzc/+4jpxHk0KD3WRPW2+Q4yyOcqUCl4m5V5qvY/Isp3+qnXSSx
         oOdN4NBQV/vmHeubveZlmGKdI3lnkpHTYA/Dkg05EGuQJXLkf2VwOIp9INALSMZflvep
         2w8ezk6/hwIEWTH8q1m5jS2q87rQQ7gRH81pWwA6RiWRMxLnby6IqH+yIb3tHvlWGBJY
         nTJA==
X-Forwarded-Encrypted: i=1; AJvYcCX3wn9yYRuUU1HKAPDtNuwk9YnsDAxqAy4neDeWWkOYKr/mCMhX31x1f6cOqeqV6LHXPAS5xcnguRo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwghSz3drn+nFahA6SxZW4UciWoKwfO033PnZ2dgp3bCEUKTbw5
	DnTQvh4Y51bKv8iC1aNbvatWRalgEnG5aQV/w+J0PzNXXToXo715U9X1wOP0Ew==
X-Gm-Gg: ASbGncuQuUp9haWbu1pST9TQN9prwTmXOWA+utEhO1V4ZyH8anYuQcEqLRN4bHpiPc1
	DKH0QP5RaIrIQPc1C8Uba5VMxEI5cDnKmFhLA+pUjUwcVA+idLDMMQIGKCBjSg+KcE/PGrmI6eo
	+4QmhGCRvhmFmjCv3s8jvS+4OV8JGBUSP3p9lIR+pAHjN7kG4a2GCyJcxcRxZG8CkrgoSToCrX6
	LaVAWSj1tPIjN5hayXPWjaND0D0n8v/70YmaEiZOyWWQhFDpS+kli9/TwhVbWUIoJjMnj5QAQfy
	jMRQcfZZnr33Ub7y1rKD5QNT+azfpAaUUmGMV139Ya7qkToiczffAwL1aKXuda7SZKjzLYUqvL+
	NeMQouExkqdk=
X-Google-Smtp-Source: AGHT+IFKcoSrZF/TOHLWTTIGAqV+4mH4gauL+MSjCK70Hg7n7K38mI3aiRuclcGFw1PMkg3oilCeMg==
X-Received: by 2002:a17:907:72d0:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-ab38b1e1dfcmr4683129366b.4.1738082903675;
        Tue, 28 Jan 2025 08:48:23 -0800 (PST)
Message-ID: <be8e6ec3-30d1-4d20-88a8-07698cc630fe@suse.com>
Date: Tue, 28 Jan 2025 17:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/24] xen/console: introduce console_write()
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-16-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-16-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -40,6 +40,11 @@
>  #include <asm/guest.h>
>  #endif
>  
> +/* Console flags. */
> +enum {
> +    CONSOLE_RING    = BIT(0, U),
> +};

These aren't console flags, but flags passed to the new console_write().
The comment wants adjusting accordingly, and I guess the enum would also
best move immediately ahead of the function.

> @@ -636,6 +641,16 @@ static void cf_check notify_dom0_con_ring(void *unused)
>  static DECLARE_SOFTIRQ_TASKLET(notify_dom0_con_ring_tasklet,
>                                 notify_dom0_con_ring, NULL);
>  
> +static bool console_locks_busted;
> +
> +static void conring_write(const char *str, size_t len)
> +{
> +    conring_puts(str, len);
> +
> +    if ( !console_locks_busted )
> +        tasklet_schedule(&notify_dom0_con_ring_tasklet);
> +}

This doesn't really need to be a separate function, does it?

> @@ -644,8 +659,47 @@ static inline void xen_console_write_debug_port(const char *buf, size_t len)
>                     : "=&S" (tmp), "=&c" (tmp)
>                     : "0" (buf), "1" (len), "d" (XEN_HVM_DEBUGCONS_IOPORT) );
>  }
> +
> +static void xen_console_write(const char *str, size_t len)
> +{
> +    if ( xen_guest )
> +        xen_hypercall_console_write(str, len);
> +    else
> +        xen_console_write_debug_port(str, len);
> +}

Nor does this, I suppose. The more that the sole call to here ...

>  #endif
>  
> +/*
> + * Write characters to console.
> + *
> + * That will handle all possible scenarios working w/ console
> + * - serial console;
> + * - VGA console (x86 only);
> + * - __HYPERVISOR_console_io hypercall (x86 only);
> + * - debug I/O port (x86 only);
> + * - PV console.
> + */
> +static void console_write(const char *str, size_t len, unsigned int flags)
> +{
> +    ASSERT(rspin_is_locked(&console_lock));
> +
> +    console_serial_puts(str, len);
> +    video_puts(str, len);
> +
> +#ifdef CONFIG_X86
> +    if ( opt_console_xen )
> +        xen_console_write(str, len);
> +#endif

... continues to sit in an #ifdef.

> @@ -666,28 +720,8 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>  
>          if ( is_hardware_domain(cd) )
>          {
> -            /* Use direct console output as it could be interactive */

This comment looks like being removed with no replacement? Why?

>              nrspin_lock_irq(&console_lock);
> -
> -            console_serial_puts(kbuf, kcount);
> -            video_puts(kbuf, kcount);
> -
> -#ifdef CONFIG_X86
> -            if ( opt_console_xen )
> -            {
> -                if ( xen_guest )
> -                    xen_hypercall_console_write(kbuf, kcount);
> -                else
> -                    xen_console_write_debug_port(kbuf, kcount);
> -            }
> -#endif
> -
> -            if ( opt_console_to_ring )
> -            {
> -                conring_puts(kbuf, kcount);
> -                tasklet_schedule(&notify_dom0_con_ring_tasklet);
> -            }
> -
> +            console_write(kbuf, kcount, !!opt_console_to_ring);

Here you assume CONSOLE_RING is bit 0. Please don't create such (then
also un-annotated) implicit dependencies.

> @@ -788,33 +822,6 @@ long do_console_io(
>   * *****************************************************
>   */
>  
> -static bool console_locks_busted;
> -
> -static void __putstr(const char *str)
> -{

Please note the comment up from here, the tail of which is visible in
context. I wonder whether the new function wouldn't better live here,
then also reducing the diff quite a bit. Requiring a forward decl
for this to work isn't very nice, but a reasonable price to pay, I
think.

Jan

