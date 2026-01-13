Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5CD17CEF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 10:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201324.1516982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfb8d-0000qO-7d; Tue, 13 Jan 2026 09:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201324.1516982; Tue, 13 Jan 2026 09:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfb8d-0000nf-4o; Tue, 13 Jan 2026 09:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1201324;
 Tue, 13 Jan 2026 09:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfb8b-0000nZ-Ap
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 09:56:33 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 228a69c1-f066-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 10:56:30 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so4212251f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 01:56:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e1adbsm43770271f8f.17.2026.01.13.01.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 01:56:29 -0800 (PST)
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
X-Inumbo-ID: 228a69c1-f066-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768298190; x=1768902990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uV6nfva8JBAZ5PG8F0nf4vcX0Xle/KSnoVk9aMOcdBs=;
        b=E9p+rGS6Dcnjy4jbKSa6QKNZy7IZMXPl4eFP8bCB17wkLxz/GFAhI++FVDHqiB2RE6
         JEYMnL4VEubUk9aP1fPuea/oJggyJS7cnNHBRsMf8/4NMld4Q58b/ExjfZTSZnjdmUhh
         LDkIjn40mGrHh8oSzTnxP73FBCD/7mT61mc2LHAxocFdgTYOjy1e2+utACuolbnEzUVA
         SCa8xbTxy9kMtziVFy+uhwcebn8e3Y4OtF0tCKabGInS+cSZRVBMucuNNkVfiz2zdBjt
         1yKYLK2gpm2JvDfC2n0+Y0i1eD3346AzFV3o48QCKLletDWkOblCEplhsxaXxcL5lVia
         nMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768298190; x=1768902990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV6nfva8JBAZ5PG8F0nf4vcX0Xle/KSnoVk9aMOcdBs=;
        b=Btr4iw8RhUa33e0/d9DL/K3Emx/T+Y/zab84L+8j2b09q6C6so/43LMXKqpR9sZM5R
         9dTgH/wa/WGUS5gh5mxauy/6z3z7N7sAN2F0Jbj8zUvpT5uYW+V1SVbPGvXumQWqRnE5
         O7+UYConfceuz9jgc5Z20CBPDBRB/jeLP9Yc+sPEKYX9KS5+a9OLzD4Tcrk+iIUe7G6V
         crQ+DQHblMltXzs21QSbgjaLsG8qH0sxwwY7z3FvS+2N+DiTFs5elEXzagvt7cW5P+Cb
         JAftDfZPib1RkvmQyGPkLsDkX+CWsLkPd8iYE0Mv/2Tnne7oiWJEt5f+MK/jXrSg5oxz
         9EMw==
X-Forwarded-Encrypted: i=1; AJvYcCXHsHL/bdzAJExJ0Cz9Y8WTqW30qvc8QDnxtQKwUd9EP1+gUvg1ciOHXgmdcfpcNHpQd3SKPp4b6vw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcnkdoVFar1oV/1e4mO/dVOye2gKN2idgfuVu871DI2I9rj20v
	EMJsjKPAAfATisysx46PW5fO2/FDOLC9v6n1Wjw752Yv6b91T3j8A8T5UIMP7etoSA==
X-Gm-Gg: AY/fxX6rckoWkanAKEAAEwyBquqHxA9j7E9j6EUllKz1hi81q5lIB20FJGZW81p4d5A
	r+7/xxoEyNs77iuXBpGcRmASDFht7Eee1ikGFkRxIqSJLxx+o0S4F9+u9VdzPvzlAqHHL2+otrv
	qAxPVGnipp3/Akti2QYuNcpD/jt3nLLkQozloN8mTVFiQ7jJmKbjbgj1Y63bVSd7Epc3CfvZgTZ
	bQry4nSYkjrqPhrXTH3zF6fxau1r/baitUmesMUoDw1rwlJSL4RrLY9gsjorCFaQdQZhS5dj53Z
	9l2SrkaizbW+UWQLgkUiSLMC0Gz6wHWegoNDUJcRni1w3Tn7Al3cDpOKDKj/Jad0NGWSk2nQ7QL
	mrIi5MoZmlugibFBFjud+RPQ5k+4cVY/gUEkgsoLF6wHOpZiHd97c776VmGkPGPDhqSmQTf1k6O
	OoTwzLIXJcwuQaAD0jOt4RoiCsQwJ0efnU60j6n2KyXdyp2VG/J8L3NTCZ9XGalyqCIfkX0aKtd
	ko=
X-Google-Smtp-Source: AGHT+IGh+2aY6/6oggXGNFiDMYVlrWtHoR9yuEh//1hJB9Ds8atlJjYtdn4Ez/WDsriILji5VlbB/g==
X-Received: by 2002:a05:6000:420a:b0:431:266:d132 with SMTP id ffacd0b85a97d-432c37a505bmr28735653f8f.46.1768298189927;
        Tue, 13 Jan 2026 01:56:29 -0800 (PST)
Message-ID: <3376e95d-8da5-4bc8-893f-4f9c84404a32@suse.com>
Date: Tue, 13 Jan 2026 10:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/console: handle multiple domains using console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: grygorii_strashko@epam.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601121728380.992863@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601121728380.992863@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2026 02:30, Stefano Stabellini wrote:
> Allow multiple dom0less domains to use the console_io hypercalls to
> print to the console. Handle them in a similar way to vpl011: only the
> domain which has focus can read from the console. All domains can write
> to the console but the ones without focus have a prefix. In this case
> the prefix is applied by using guest_printk instead of printk or
> console_puts which is what the original code was already doing.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - fix code style
> - pbuf_idx/idx after ada53067083e
> - don't add extra \0
> - clear input on console switch
> ---
>  xen/drivers/char/console.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 2bdb4d5fb4..6c7a6592c5 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -576,6 +576,8 @@ static void console_switch_input(void)
>              rcu_unlock_domain(d);
>  
>              console_rx = next_rx;
> +            /* don't let the next dom read the previous dom's unread data */

Nit: Comment style.

> +            serial_rx_cons = serial_rx_prod;
>              printk("*** Serial input to DOM%u", domid);

Imo the flushing of input needs to come after the printk(), as it's only
then that the user gets confirmation of the change.

As to flushing (rather than storing) leftover input: That's strictly an
improvement over v1, but imo unhelpful. I may not be willing to ack this
(still need to think about it some more), but at the very least this
somewhat odd behavior needs calling out (and perhaps also justifying) in
the description.

Further, did you think through the interaction with a racing
CONSOLEIO_read? Right now that's the only place where serial_rx_cons is
updated, and hence there was no issue with there being multiple reads
of the variable (perhaps unless a domain issued racing CONSOLEIO_read).
That changes now. I can't convince myself (yet) that's entirely safe,
and hence if it is that also wants discussing in the description.

> @@ -730,6 +732,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>      unsigned int flags = opt_console_to_ring
>                           ? CONSOLE_ALL : CONSOLE_DEFAULT;
>      struct domain *cd = current->domain;
> +    struct domain *input;
>  
>      while ( count > 0 )
>      {
> @@ -742,18 +745,28 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          if ( copy_from_guest(kbuf, buffer, kcount) )
>              return -EFAULT;
>  
> -        if ( is_hardware_domain(cd) )
> +        input = console_get_domain();
> +        if ( input && cd == input )
>          {
> +            struct domain_console *cons = cd->console;
> +
> +            if ( cons->idx )
> +            {
> +                console_send(cons->buf, cons->idx, flags);
> +                cons->idx = 0;
> +            }

I probably should have said so on v1 already: What is this about? There's
no comment and nothing in the description that I could associate with this
code.

And then - is this safe without holding cons->lock?

> @@ -815,6 +829,13 @@ long do_console_io(
>          if ( count > INT_MAX )
>              break;
>  
> +        d = console_get_domain();
> +        if ( d != current->domain )
> +        {
> +            console_put_domain(d);
> +            return 0;
> +        }

As of here d == current domain. Why are you holding onto ...

>          rc = 0;
>          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
>          {
> @@ -826,12 +847,14 @@ long do_console_io(
>                  len = count - rc;
>              if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
>              {
> +                console_put_domain(d);
>                  rc = -EFAULT;
>                  break;
>              }
>              rc += len;
>              serial_rx_cons += len;
>          }
> +        console_put_domain(d);
>          break;

... the domain for this long (requiring multiple console_put_domain()
invocations)? The current domain can't go away under your feet. Hence imo
a single (early) call will do.

Jan

