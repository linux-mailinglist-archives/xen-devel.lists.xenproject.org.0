Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB59DFDAF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 10:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846465.1261630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI33H-0000qx-3b; Mon, 02 Dec 2024 09:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846465.1261630; Mon, 02 Dec 2024 09:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI33H-0000p4-0m; Mon, 02 Dec 2024 09:49:11 +0000
Received: by outflank-mailman (input) for mailman id 846465;
 Mon, 02 Dec 2024 09:49:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI33F-0000oy-CR
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 09:49:09 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab399091-b092-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 10:49:05 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso682402766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 01:49:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c195bsm489707066b.1.2024.12.02.01.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 01:49:04 -0800 (PST)
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
X-Inumbo-ID: ab399091-b092-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFiMzk5MDkxLWIwOTItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTMyOTQ1Ljc3OTU3OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733132945; x=1733737745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2WuL8BGgzlV0OtH+XWvK2eVFhlKFA5J+gVnjKDUTz7M=;
        b=EpPSY1aLWJu9rNhh76C1txx3KHwuE8uVBqkpzW+QjRvTx3VllfB4T7OZVx4i023CF0
         Hx3YNb/9LwwAZXt/PYDxwTi9AqXHGeXzeqdgfFDJB2S6j/iB/DZRVVi+r4iA19wBUg9J
         E+tzEKv3iw3dU+hTeXZ3+f3HJu/uwIGI+6+hijt6TeDNahS88rcGrYP3WLyeUxlSZ2E4
         5cRNF+jGAGOvOq00teyveGFwLTIjJN50aIZk+et/l5CsAPZyTdETvUA1krbXJkDMHXt7
         K9+/lB60ipep7RZq4ZS8yh6tjdkC8fhgMN3VcEw/2vfRiutGy24576aT5aqJG2+1a2va
         R9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132945; x=1733737745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WuL8BGgzlV0OtH+XWvK2eVFhlKFA5J+gVnjKDUTz7M=;
        b=GNCyq79peGU95HBPeqAGv95WrUf7Qmw/gtoUSX4Iu988xUI69qIo4UP+gU64Y07oLw
         Pq424H1nkjOgsFBphOY0CgKwPaNMS1VdsxQQE2qJsWt18WLSm07Pxle5H2IVppkgdcMq
         1NHaXtZalvDhMF677rNAido6CwDaCTTNxJXkeEc30XHRaUDS3VzAlPoZKoUZkUs9O/jQ
         iswx6CBGbxdzQLz/EOwROsz/cczbjizxhCHQmerJ2LVuBXDek/kCxMzvnUPh+yeX/NLN
         Oi3x3m/UjIfalOBFRCxQpLEgAfy2kq20zfygT2c1OsK9igKMJSOE1IYRfgdQbpVnat79
         aw+w==
X-Forwarded-Encrypted: i=1; AJvYcCWyAiRoiguT0DQMRnZRDyOlX9p/aTuRqZS0WZIgUl7vJQNe+hJ3SOBeftKFvBNSZoAZlrIRiImekto=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymiBIia+K2y93Dr9Pi2bF7lpYLLRzQAgOBcuiAv5AqLsh480GH
	ddkwFoSSmqh2nz8Yb0VNjj7WK0Lb5DZT90+r/1h75KyehR4TAkqg8DMAhg4XTA==
X-Gm-Gg: ASbGncuaKMfTU2qGbmOMoGZ1AmQS7v8EsdQ2OEZNpzxb354X+AotV5Xf8HnrZOb3rIj
	yKjn8pNuFlf0ega7y6nI4PrWeM0qrYTQPnLrX7sS0c7QLA5qbCdKCLYE7lFGwDZOOO/iQbsYiSt
	lTooZkFVbO8nju8QaYy5Id5qIkc0AFTZPWv9OgBj4a2q8suASiiXkaBesor6BepigMAnlN3w+1W
	ZpSMoZyJnBgeQETpIff6s8M20kN+x/UetH0uiLUHD+Evtm9LY+2EEu9vLNiZ74V5EIa0Em6XkjL
	nKpo09heGjU9mn2RUgOUMqScxNU4bjcXZ/I=
X-Google-Smtp-Source: AGHT+IHsXCuH4g/AxQVzKRcDoQNXR5BhPAPXcfYjlftkeFCxsf/6NwqQWcDyiCZ//dQ1LRM9Znq9Fg==
X-Received: by 2002:a17:907:7748:b0:aa5:7d7e:7b7b with SMTP id a640c23a62f3a-aa580f1d7e4mr1761104966b.24.1733132945225;
        Mon, 02 Dec 2024 01:49:05 -0800 (PST)
Message-ID: <43ce0519-5717-4d59-922d-10dc2c663747@suse.com>
Date: Mon, 2 Dec 2024 10:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-4-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -644,9 +644,11 @@ static bool __init check_and_adjust_load_address(
>  }
>  
>  static int __init pvh_load_kernel(
> -    struct domain *d, struct boot_module *image, struct boot_module *initrd,
> -    paddr_t *entry, paddr_t *start_info_addr)
> +    struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
>  {
> +    struct domain *d = bd->d;
> +    struct boot_module *image = bd->kernel;
> +    struct boot_module *initrd = bd->ramdisk;
>      void *image_base = bootstrap_map_bm(image);
>      void *image_start = image_base + image->headroom;
>      unsigned long image_len = image->size;
> @@ -1304,14 +1306,12 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>  int __init dom0_construct_pvh(struct boot_domain *bd)
>  {
>      paddr_t entry, start_info;
> -    struct boot_module *image = bd->kernel;
> -    struct boot_module *initrd = bd->ramdisk;
>      struct domain *d = bd->d;
>      int rc;
>  
>      printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
>  
> -    if ( image == NULL )
> +    if ( bd->kernel == NULL )
>          panic("Missing kernel boot module for %pd construction\n", d);
>  
>      if ( is_hardware_domain(d) )
> @@ -1351,7 +1351,7 @@ int __init dom0_construct_pvh(struct boot_domain *bd)
>          return rc;
>      }
>  
> -    rc = pvh_load_kernel(d, image, initrd, &entry, &start_info);
> +    rc = pvh_load_kernel(bd, &entry, &start_info);
>      if ( rc )
>      {
>          printk("Failed to load Dom0 kernel\n");

None of this looks command line related - do these changes rather belong into
patch 1?

Jan

