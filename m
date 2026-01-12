Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E940FD11BB1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:09:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199933.1515963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfErb-0002yU-BW; Mon, 12 Jan 2026 10:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199933.1515963; Mon, 12 Jan 2026 10:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfErb-0002xH-8o; Mon, 12 Jan 2026 10:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1199933;
 Mon, 12 Jan 2026 10:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfErZ-0002xB-QC
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:09:29 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c53f3176-ef9e-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 11:09:24 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so3477016f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 02:09:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16f4sm38680118f8f.11.2026.01.12.02.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 02:09:23 -0800 (PST)
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
X-Inumbo-ID: c53f3176-ef9e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768212564; x=1768817364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RyUWjuReO2HT3zEu/zgDiLMwqzTVZVcSD9+UUhBsXOw=;
        b=Poq2hMBq/PfSaEC9gJB70fZfsb/jOrz7s0em8vmVr0u3SHcxbh1soCq5GkUM8SsiW6
         3DvrzJNb9AbcbWqE+6wB9yx9yPVDVrpTx+YB8W+JLuCipSlQkPNyAUm+OXpcMBLxbJxQ
         kTqRPApWI4maf01MQ94WFEISng+/S5RRc7y9keR7UR8sfql1onoJi3agxJq4G4doLzbK
         j5VC7F3UjpfKwfjcVXLeIghvWTUpaSqQzTSmjmfqux5abLRAkw6ao84n8+7hRSygNz+0
         pyOawfOGo88ywWUc0a1uUNsN3k0HEFeVPQc/pjM6gKqmJ7K94L0PdxRKwmpaS3y7OmEb
         Vr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212564; x=1768817364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyUWjuReO2HT3zEu/zgDiLMwqzTVZVcSD9+UUhBsXOw=;
        b=NkEad/e7qFkc5VwajxTGbCjaN3tg38SzmZbcs8ItkvkTkPwXiBAMJ2DaFVQzz404vx
         ntj+Afos3Lpszm7rVIv4KqM/OiB5y8wUgZKGN5nv78yX5s/PsJ0YGLf0H6Z1OgTA95qv
         NSc9C4kvJqzufbKCMpBwTQ+f5KBBfsoVfjAHIymA/aJy7PVjCHunJorPu29Ws8YTamfj
         2J4xY+EoHbxgH/V2zqLNmaiF0lx9MHEePLJrtp4SBGlqbb/8WU1j63sERzezYTdPkUV2
         kapz9OtwFJsJNAeV051xVtlqVfvKBObuvpMRs7l3Ps2vYgqI5LRHXX3U5SFDBsAlcw/V
         XNZg==
X-Gm-Message-State: AOJu0Yz0ut0NL14W3FR1ecCKYzPdXiZohXcSkQq7w7HGuRLMsb/Fg4+P
	n7Zit9xYHcRwzNVP1WjGOXXzHJgjfyyLjxMp2EY4vrXGXeqyngTxyPwBsjL4R1LGOw==
X-Gm-Gg: AY/fxX7380dv9Ko8V+/4mS9eGZPQz8F+9+vCXST4QokxIl2ro80rLjZYKVQHwYNawl4
	NcFcHyK9AK2Gzj9rvlJxVKhmPyR1lvov43WIO6bnrR1yzT94/lsO57FX+/uryKfYzHtPJY6s1MY
	EU34YvdUaL2fNxHsVXbfpdQpyaVE4s+Ba3DzqAWf10ST02cHMqO/RY23pkwY7oqqun6Gi3HX6S7
	paD1p3fxfUH93mMW6sBUyxMrNGMndpFVjZoA8NHPRY16qT7w5QeXEGWfQAhcauaNmllgxqE+2cT
	n9ZdZMQyF+4m+OhcU3hI4/mDIaHUvqxBkmIPiUsZDXZVlnLex+sn6LsQGfAr+ZTm7aauWvUKulc
	SL5BicM1OiUA8UZTIlAKrnxaKNxceojWZEz4oqssrTLs7lilgp24hhjbwo8Wcc4uwbOIV/3Q3kr
	vXwwOuo4WaOVBfgblAvGbSmLWusheI1Os3qmM5C5P0pLfIM6J+MZhP7gN9XSLouMbicl3ojeJEH
	qM=
X-Google-Smtp-Source: AGHT+IGs/FOAMa8Kt6DANF8r7+CzagRCuMnNn3oAAs7Ac712feB4rHr5MRbvOl4vfdEdf1n3FdEM9A==
X-Received: by 2002:a05:600c:c8a:b0:479:3a88:de5e with SMTP id 5b1f17b1804b1-47d84b4a079mr179227465e9.37.1768212563643;
        Mon, 12 Jan 2026 02:09:23 -0800 (PST)
Message-ID: <f42d65a1-09ad-4745-af10-62a1fff4d2a0@suse.com>
Date: Mon, 12 Jan 2026 11:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] console/consoleio: account for xen serial input
 focus during write
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20251204233211.980862-1-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2601091435130.992863@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601091435130.992863@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2026 23:35, Stefano Stabellini wrote:
> I independently wrote this patch which also supports console reads.
> Sorry about the mixed messages.
> 
> ---
> 
> 
> xen/console: handle multiple domains using console_io hypercalls
> 
> Allow multiple dom0less domains to use the console_io hypercalls to
> print to the console. Handle them in a similar way to vpl011: only the
> domain which has focus can read from the console. All domains can write
> to the console but the ones without focus have a prefix. In this case
> the prefix is applied by using guest_printk instead of printk or
> console_puts which is what the original code was already doing.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/drivers/char/console.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index dcc31170f2..826bee3848 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -729,6 +729,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>      unsigned int flags = opt_console_to_ring
>                           ? CONSOLE_ALL : CONSOLE_DEFAULT;
>      struct domain *cd = current->domain;
> +    struct domain *input;
>  
>      while ( count > 0 )
>      {
> @@ -741,17 +742,26 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          if ( copy_from_guest(kbuf, buffer, kcount) )
>              return -EFAULT;
>  
> -        if ( is_hardware_domain(cd) )
> +        input = console_get_domain();
> +        if (input && cd == input)

Nit: Style (losing blanks).

>          {
> +            if ( cd->pbuf_idx )
> +            {
> +                cd->pbuf[cd->pbuf_idx] = '\0';
> +                console_send(cd->pbuf, cd->pbuf_idx + 1, flags);
> +                cd->pbuf_idx = 0;
> +            }

What is pbuf_idx? I can't find any such field in present staging. With that it
is also unclear what is actually being done here.

In any event I don't think you want to print/send the trailing nul char that
you insert. With that (and with console_send() taking the length anyway) it's
further unclear why the nul needs inserting in the first place (and thus, as
it looks, risking a buffer overrun).

> @@ -793,6 +803,7 @@ long do_console_io(
>  {
>      long rc;
>      unsigned int idx, len;
> +    struct domain *d;
>  
>      rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
>      if ( rc )
> @@ -813,6 +824,13 @@ long do_console_io(
>          if ( count > INT_MAX )
>              break;
>  
> +        d = console_get_domain();
> +        if ( d != current->domain )
> +        {
> +            console_put_domain(d);



> +            return 0;
> +        }
> +
>          rc = 0;
>          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
>          {
> @@ -824,12 +842,14 @@ long do_console_io(
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
>      default:
>          rc = -ENOSYS;

Hmm, this looks insufficient to me. Unconsumed input at the point focus switches
should not blindly go to the next domain. It was intended for what was the focus
at the time of typing.

Jan

