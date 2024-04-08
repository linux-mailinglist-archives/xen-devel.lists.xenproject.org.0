Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F689BBA8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 11:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701862.1096430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlIi-00017j-Vd; Mon, 08 Apr 2024 09:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701862.1096430; Mon, 08 Apr 2024 09:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtlIi-00015J-SY; Mon, 08 Apr 2024 09:28:28 +0000
Received: by outflank-mailman (input) for mailman id 701862;
 Mon, 08 Apr 2024 09:28:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtlIg-000158-MQ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 09:28:26 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5987b689-f58a-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 11:28:25 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4165d03308fso9175635e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 02:28:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b004162d0676cdsm12605718wmb.29.2024.04.08.02.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 02:28:24 -0700 (PDT)
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
X-Inumbo-ID: 5987b689-f58a-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712568505; x=1713173305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i73I1Wy1Si6XRd0XgIXGZkJPTYKcQCOUQ58Myi+AbAc=;
        b=NmZblHLkHyvN+Qe8kZpS543EeMY1H/n/uNogJ/FhzXFg1TEbml38Q1gHoYEK6qbszv
         Q+5hhy/227phvohvu8L/yM3UO9dcia7N1NJShG95xRnxHzjlqfp5OzC4tmd4vrL99Nru
         Uz7IlhLDtjCVSBQNK04ZDxmlsq+03c3rBW7knM4Jc3Yewq88g4R6yCrFOFmccYx6PB2X
         iCusylcyGfAUVGyUzRcvB34aCS3SZWoaTGtuQHgAg9dMeTOBA72yZBYpkc1UInwEauUs
         MRSriYlAeG99l7kzkJLI9bARK619+NxznDgEcOaPyKY4Zy/KPnVUHjh7cM9Hk8Pd7i7U
         P0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568505; x=1713173305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i73I1Wy1Si6XRd0XgIXGZkJPTYKcQCOUQ58Myi+AbAc=;
        b=sAAspiu2FpwMttWhTI0K8TqNkRH98SmdTQqkgHy5Tm+5P5/pY/xAikHFZfXKB6V9Vz
         9Y7Y3BOOe+7b/QiN8v345c3sHbK5ALgkCHuTTx0lAFOstdZKwIim5EqjaQegQ13jnwl3
         y1CcuKox/7JVUKxf3KSr0g9TIRBTndqqeOWpcycsPlCphTRhDQGdg0p/Hly9WWCC78RL
         sNUx5rD2sWibViJ9zyLDSkna1G8xv4FsS7vySaaZg9FSJVZGPmFvpIw+V5ga6r29Hf3V
         YPRp/vBvZnF8ku39AASrGcq6a7Te7tS2CwjEKRaj2z+QjZSoU8N7RMXhkFWzrHjAh2L2
         ZHxA==
X-Forwarded-Encrypted: i=1; AJvYcCVzJxkPtDp3Q1jhitwtdEQOnwQZDe9raggcscAzrgdJQsq5O27wR46k8ZOA1Ky69LWlX6b5LXi3mS2PLe4z2tdrdC6lGQyX3xv4jTlHhA8=
X-Gm-Message-State: AOJu0Yx2sDLuUIVVLy2l+YmX1TVsoIWJ/Hdi/+33JVOUWlRbpqcXwghm
	OBg0LZIr3b4wD7GDqasylGzifLadEZxqbFnaA67I5/CPh31akoA18FBuAAw0bA==
X-Google-Smtp-Source: AGHT+IGTkDzFvjZfA57bIvdvJp8SFr6scXkqLgsF2CBpJWsp99RLezmgDG2bziihEqWFp6RvuN5/sw==
X-Received: by 2002:a05:600c:4ed2:b0:415:6d1d:603e with SMTP id g18-20020a05600c4ed200b004156d1d603emr8878493wmq.37.1712568504962;
        Mon, 08 Apr 2024 02:28:24 -0700 (PDT)
Message-ID: <ca067cc8-534d-463f-9c37-dcc6e8c40f06@suse.com>
Date: Mon, 8 Apr 2024 11:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86: Use getopt to handle command line args
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-5-fouad.hilly@cloud.com>
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
In-Reply-To: <20240405121128.260493-5-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 14:11, Fouad Hilly wrote:
> @@ -82,9 +86,16 @@ static void show_curr_cpu(FILE *f)
>  int main(int argc, char *argv[])
>  {
>      int fd, ret;
> -    char *filename, *buf;
> +    char *filename = NULL, *buf;

Why?

>      size_t len;
>      struct stat st;
> +    int opt;
> +
> +    const static struct option options[] = {

Nit: Canonically "static" comes first and all type information is kept
together.

> +        {"help", no_argument, NULL, 'h'},
> +        {"show-cpu-info", no_argument, NULL, 's'},
> +        {NULL, no_argument, NULL, 0}
> +    };
>  
>      xch = xc_interface_open(NULL, NULL, 0);
>      if ( xch == NULL )
> @@ -94,20 +105,33 @@ int main(int argc, char *argv[])
>          exit(1);
>      }
>  
> -    if ( argc < 2 )
> +    if ( argc != 2 )
> +        goto ext_err;
> +
> +    while ( (opt = getopt_long(argc, argv, "hs:", options, NULL)) != -1 )
>      {
> -        usage(argv[0]);
> -        show_curr_cpu(stderr);
> -        exit(2);
> +        switch (opt)
> +        {
> +            case 'h':
> +                usage(argv[0]);
> +                exit(EXIT_SUCCESS);
> +            case 's':
> +                if ( argc > 2 )
> +                    goto ext_err;

This looks redundant with the earlier check that you adjust above.

> +                show_curr_cpu(stdout);
> +                exit(EXIT_SUCCESS);
> +            default:
> +                goto ext_err;
> +        }

Nit: Case labels want indenting the same as the immediately enclosing braces.

>      }
>  
> -    if ( !strcmp(argv[1], "show-cpu-info") )
> +    filename = argv[1];
> +    if ( filename == NULL )

Can this really happen when argc == 2?

>      {
> -        show_curr_cpu(stdout);
> -        return 0;
> +        printf("File name error\n");
> +        goto ext_err;
>      }
>  
> -    filename = argv[1];
>      fd = open(filename, O_RDONLY);
>      if ( fd < 0 )
>      {
> @@ -149,4 +173,9 @@ int main(int argc, char *argv[])
>      close(fd);
>  
>      return 0;
> +
> +ext_err:

Labels indented by at least on blank please.

Jan

