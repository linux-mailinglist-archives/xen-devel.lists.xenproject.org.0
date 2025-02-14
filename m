Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36984A35841
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:55:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888496.1297853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqXG-0006Y6-HC; Fri, 14 Feb 2025 07:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888496.1297853; Fri, 14 Feb 2025 07:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqXG-0006VP-EK; Fri, 14 Feb 2025 07:54:54 +0000
Received: by outflank-mailman (input) for mailman id 888496;
 Fri, 14 Feb 2025 07:54:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiqXE-0006VJ-GS
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:54:52 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f84b4b08-eaa8-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:54:51 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so3093613a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:54:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1b4ed9sm2451513a12.10.2025.02.13.23.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:54:50 -0800 (PST)
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
X-Inumbo-ID: f84b4b08-eaa8-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739519691; x=1740124491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MxJ6+hrC5aQmR09kOzZCFeCaUAqDNEI/voafl5ZNDq0=;
        b=RoE6j35CUj6t5Fgj/11CcjUA4r5R+OZCC+MipoLcI73l0r5wrwI2Dn+nBTp7W1ZCd4
         S7Ng3tO/3pqcSx6EMzxQMs+Gub4bIHf/HxlHx9kG4ZKNBuCHZCrNduR9kXIZLQHxJcl/
         AsnxMK+aSXCkw8KEpGIIzJv+vSwqF5R3PgSoer/q3LgXVUWMTGcB2cVl6GM1+VvEXhyh
         2uW29vCIM8eChD0/mtYCN7aSENpKGIPPkZJWBUPLMf1WFUt4A8XKmxhTdowb50FTpiBD
         ygbY4vXTajIRqN04kgS9T9+VxvoC5XTujxcq3KpURVDXVD5PywOkvKYMyyRRpCTEJig6
         m23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739519691; x=1740124491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxJ6+hrC5aQmR09kOzZCFeCaUAqDNEI/voafl5ZNDq0=;
        b=D0Gqspqz2TQ7BzV8Wja8GJFAvhENm7bw9RCCVlS+BSNdNQH6FSMXJVfSxHORbzuvgR
         eFwQDQ9tn+FDiFxfL08dmhOmmRo1yiuIpcslaFIzJrPHnZ1alNa7yIozxpWTTSh6+iqU
         /SiK3zlevMKzQplzliSGEKcWPACqFAE6aCQELzuQ8hpdvCmcwGradLS7JdetFo7poEEb
         XLYf2Ma8rcK0WNU2pfj2Ai/DlEP9+8eXAt0KZLngrqyTjgH7NphHUHV+2J8rqFClqhGq
         BKWCXNIOxf6ZmjpjPKiyn4Kx1/9mr6z4KLIl0I0357i2lIQgvQZmmI7csqWKSUESIhFZ
         4iEw==
X-Forwarded-Encrypted: i=1; AJvYcCV91pL/XFr8hw7qDfdMT5UVjT4vj6579N6yYF69H+XklvFGL966Cz3mY7fvz/EOui7n5rT7nxh9OK0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxozGHmX1n2RlATOdBErdsh5JRq/gq7fFrxeASR70q4IVXoFgOq
	+C6CAUjFAxjkSockzhnaeys5bVUBTt5ai6qsvphiyTZ65WH3worjDNb0LbsVAQ==
X-Gm-Gg: ASbGncvE+psq6SgeHnMKRcV9G6AJwOTVshS2j7pwp8L9DxRmLQkkeJlX4CPIjzP3wqP
	3/dhjyhpq5SbdCQgwI9r2/N2TDwsCHWoCBpo0bXso+IJDkZYmrequuzZwYuPr0wLL+igJg5tPdW
	31NhxirEFkxJfZNP2D4+yxW87LdhyuBXEC3xF8KzLnayol8u8zBfUS50qYry0nJZFwBQhObSuqN
	J1UKggjR6s28OgeYo6uRTn6Q6HOVxZHblwhO9OcUgmUFXU1VTk1RxLEfHQyR/w7yXx30dmyAwjR
	fjgjwG1L2E8owXIHD2+lBJdj6kl4Oh5OQyN+i+CsZ960UUaTj8OSD0jvhIrVrHCKhSqRYjdIYxh
	m
X-Google-Smtp-Source: AGHT+IFLAGy2BJDVCcw8ebgQtDZaEtXXQbaQmGuWF88SRPB9HI2zO8bx5sIkijYts5jAt8lh0sKadA==
X-Received: by 2002:a05:6402:34d2:b0:5dc:a44f:6ec4 with SMTP id 4fb4d7f45d1cf-5dec9e7baf8mr5668034a12.13.1739519690844;
        Thu, 13 Feb 2025 23:54:50 -0800 (PST)
Message-ID: <e80d6139-b918-4830-9db9-aac297446e7e@suse.com>
Date: Fri, 14 Feb 2025 08:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/console: print Xen version via keyhandler
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250213214054.1745501-1-dmukhin@ford.com>
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
In-Reply-To: <20250213214054.1745501-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 22:41, dmkhn@proton.me wrote:
> Add Xen version printout to 'h' keyhandler output.
> 
> That is useful for debugging systems that have been left intact for a long
> time.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - moved new function declarations to xen/lib.h
> - dropped xen_ prefix in new functions
> ---
>  xen/common/keyhandler.c    |  4 ++++
>  xen/common/version.c       | 20 ++++++++++++++++++--
>  xen/drivers/char/console.c |  8 +++-----
>  xen/include/xen/lib.h      |  3 +++
>  4 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 6ea54838d4..0bb842ec00 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -129,6 +129,10 @@ static void cf_check show_handlers(unsigned char key)
>      unsigned int i;
>  
>      printk("'%c' pressed -> showing installed handlers\n", key);
> +
> +    print_version();
> +    print_build_id();
> +
>      for ( i = 0; i < ARRAY_SIZE(key_table); i++ )
>          if ( key_table[i].fn )
>              printk(" key '%c' (ascii '%02x') => %s\n",
> diff --git a/xen/common/version.c b/xen/common/version.c
> index bc3714b45f..8672d5544e 100644
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -210,9 +210,25 @@ void __init xen_build_init(void)
>          }
>      }
>  #endif /* CONFIG_X86 */
> -    if ( !rc )
> -        printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
>  }
> +
> +void print_version(void)
> +{
> +    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> +           xen_major_version(), xen_minor_version(), xen_extra_version(),
> +           xen_compile_by(), xen_compile_domain(), xen_compiler(),
> +           xen_build_info(), xen_compile_date());
> +
> +    printk("Latest ChangeSet: %s\n", xen_changeset());
> +}
> +
> +void print_build_id(void)
> +{
> +    BUG_ON(!build_id_p);
> +    BUG_ON(!build_id_len);

Technically one of the two would likely suffice, if we need such checks
at all. Question is why you added them. After all ...

> +    printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);

... this isn't supposed to malfunction when passed a NULL pointer (with
zero length). If it can malfunction, it wants fixing there imo. And that
extends to the case of non-zero length as well: Any extensions to %p
that we add would better retain the basic property of %p printing when
NULL is passed as argument. (I'm sorry for not paying enough attention
to this on v2 already.)

(Later) Oh, actually these BUG_ON() are both wrong. They would trigger
when building with a build-id-incapable linker. See the detection logic
in the top level Makefile (search for XEN_HAS_BUILD_ID). To retain
original behavior you will want to make the printk() conditional upon
e.g. build_id_len being non-zero.

Jan

