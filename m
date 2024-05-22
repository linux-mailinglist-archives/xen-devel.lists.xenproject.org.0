Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285F08CBC9F
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 10:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727315.1131777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gyC-0003qy-UZ; Wed, 22 May 2024 08:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727315.1131777; Wed, 22 May 2024 08:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gyC-0003oB-RR; Wed, 22 May 2024 08:05:08 +0000
Received: by outflank-mailman (input) for mailman id 727315;
 Wed, 22 May 2024 08:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9gyB-0003o5-Ql
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 08:05:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00519e2e-1812-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 10:05:06 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57825ff689bso1717054a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 01:05:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea65e2sm17909588a12.19.2024.05.22.01.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 01:05:06 -0700 (PDT)
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
X-Inumbo-ID: 00519e2e-1812-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716365106; x=1716969906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0oWIspwXriEJHqp2br2tUh4rUaOxLFO8PrsC0tRtBIo=;
        b=LR8+uo9wM0a0Ub0qU/qfme4z9DvToYuTnMy+20fAPhV9h46g4JP6ArbmTBxFtzZaKJ
         TIJzlq6s+5cdLEQGWWR8KSAg7qtGVTS4bNhick0pS2LNqH3QmzYY15vUgZIHXyfY9Wn+
         oLW42sULap/Om+AxAV/FaT1DC8beASdyWzPRRbHLLeos9DNXZ4neWXwSvb5b6mXPnUm6
         L8BaNaxVtWpCMlNoPWIYlVKPZBOvuHhAMoQ2KNvN1i4MmbmL28p7YPU3Wf0HOfK4bcxR
         NsfxGsAN95ORhiPbEAz4n3C7V8GArnmGwKWzvTXRfS/dMua+Hj9k3xq1dZu2Tc1/fbwS
         7mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716365106; x=1716969906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oWIspwXriEJHqp2br2tUh4rUaOxLFO8PrsC0tRtBIo=;
        b=MFwPJ0Ypg5sAjsCjFnOO+KWfAyzJlpPSUGo/6eFusSNH/sPI2Xw7M1jrT/vWt3v/TA
         J+FHBd5h6pO+4EZo8o+zE9dpEnCDF0sCgTOjjm6l63ce8d4SCr1YOqx4hcRoUIZxwOf7
         ze0rqiCCPRb6hWbmx8PqZnmSMDJzINFNE3yYFHqNSUM2xx41QUiyvUInTu83LMN/16L1
         kgMgptF0HaZtigGe8UrMBRAflDBt0t/xc4wdA+4KU8fc6XYT69I8TgHWX9j1XDuyA5PS
         eh4tzNuHr9xwpIXj9PTzc/fNM4+a0goPJz8ZcOXVMC5x8L4qMWwCfWsgJKnnbns4K49K
         WERw==
X-Forwarded-Encrypted: i=1; AJvYcCUj3pZ8eVEV/5IbJYs777X7lz9H9XPQ+4qEUclz2pT0kJjvHsRMbZx9qlU80Npvj5qzcXG5psUO5rSYvcKUkHecQP+wi9EkfNwhOyH3R3U=
X-Gm-Message-State: AOJu0YzBF72y53mz2azBj9BUKT4SvDTueTf7ak+Et9tNm7fMC6QSyYxX
	41ddekj6e3IEeB8F0QWrf7eDGJojKAICEfZ1Qr+te6u7at864ePnF3PrcWfHZA==
X-Google-Smtp-Source: AGHT+IF/PreU14Xh9SXa+H0Ho1Li59vJe6rA4TV8PweRe4sPsb6aOujFKFJkm1oJ1pk4kFSTJAdiEw==
X-Received: by 2002:a50:9301:0:b0:573:1e9e:bb54 with SMTP id 4fb4d7f45d1cf-578329ec5a5mr717277a12.8.1716365106384;
        Wed, 22 May 2024 01:05:06 -0700 (PDT)
Message-ID: <0dbc701d-d8e6-4cbf-b7bf-27d9e05b5491@suse.com>
Date: Wed, 22 May 2024 10:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drivers/char: Use sub-page ro API to make just
 xhci dbc cap RO
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <7682bbf3a24045ae1fcbdf651a6dd8e609ec3a20.1716260066.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <7682bbf3a24045ae1fcbdf651a6dd8e609ec3a20.1716260066.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.05.2024 04:54, Marek Marczykowski-Górecki wrote:
> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1216,20 +1216,19 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
>          break;
>      }
>  #ifdef CONFIG_X86
> -    /*
> -     * This marks the whole page as R/O, which may include other registers
> -     * unrelated to DbC. Xen needs only DbC area protected, but it seems
> -     * Linux's XHCI driver (as of 5.18) works without writting to the whole
> -     * page, so keep it simple.
> -     */
> -    if ( rangeset_add_range(mmio_ro_ranges,
> -                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
> -                         uart->dbc.xhc_dbc_offset),
> -                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
> -                       uart->dbc.xhc_dbc_offset +
> -                sizeof(*uart->dbc.dbc_reg)) - 1) )
> -        printk(XENLOG_INFO
> -               "Error while adding MMIO range of device to mmio_ro_ranges\n");
> +    if ( subpage_mmio_ro_add(
> +             (uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
> +              uart->dbc.xhc_dbc_offset,
> +             sizeof(*uart->dbc.dbc_reg)) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Error while marking MMIO range of XHCI console as R/O, "
> +               "making the whole device R/O (share=no)\n");

Since you mention "share=no" here, wouldn't you then better also update the
respective struct field, even if (right now) there may be nothing subsequently
using that? Except that dbc_ensure_running() actually is looking at it, and
that's not an __init function.

> +        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
> +            printk(XENLOG_WARNING
> +                   "Failed to mark read-only %pp used for XHCI console\n",
> +                   &uart->dbc.sbdf);
> +    }
>  #endif
>  }

It's been a long time since v2 and the description doesn't say anything in
this regard: Is there a reason not to retain the rangeset addition alongside
the pci_ro_device() on the fallback path?

Jan

