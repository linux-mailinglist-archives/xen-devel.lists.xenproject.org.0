Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC918B30AA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712456.1113176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0FHN-000513-76; Fri, 26 Apr 2024 06:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712456.1113176; Fri, 26 Apr 2024 06:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0FHN-0004zN-3q; Fri, 26 Apr 2024 06:41:53 +0000
Received: by outflank-mailman (input) for mailman id 712456;
 Fri, 26 Apr 2024 06:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0FHL-0004zC-RV
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:41:51 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f54feda-0398-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 08:41:50 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so1726465a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 23:41:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i19-20020a50fc13000000b0056fed8e7817sm9511467edr.20.2024.04.25.23.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:41:49 -0700 (PDT)
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
X-Inumbo-ID: 0f54feda-0398-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714113709; x=1714718509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DyTkxo1RPeQEplaxKsE+2m7gwcJLY9E/t8hZiPE7NQ=;
        b=FQPnL7eyanES0PM/MMn1JU/7ZiJX2vklW5aUgpHaennFDMuE7Ox5V5EcQtUyL5yWhN
         hqY73Jeq0HVEchQzKNX5PvjjRhAe5QTTCZ/C0YSxuB1hpPXC1BFJ/74G1py0DY/0yHRM
         FXpk8OhpfzNdfAedgkzesiTeSJhEG/0EA9BkZ6LmXvR31rVARRqKatZAx00Ywoh7V06t
         IghgP04ldH6OvLmwLOU9V9rqsmBaIUWT5U++p0r+8P/tx9+0jlDRVtdZyGed/LJcuZIO
         pLUxLbs7dw/C+7iseiq07nHOKS6EYMAWs8RsrfrzAJmd6UOQaBvSlEQmpfXMxisBE2E0
         U9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714113709; x=1714718509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DyTkxo1RPeQEplaxKsE+2m7gwcJLY9E/t8hZiPE7NQ=;
        b=AVhOzf1k+PdZp+SwLOBa9Z4gNrC10AZtkqw3o4a43KLyG7rTRVU2EDu4KcO6JIqDqK
         GgvN4KaRFv54WidNrNRvkykG2mAwTlbJvjJ0gf0b/pbcP578RbjmeGxmfkjn2FfkhWgp
         pZ9NFWkf3f1VUWWXP4DiYCIGKFyQLqJtnS0xr1rnPQouNqGXmXt5XMeE3LIS6ZlPe6fm
         wDWFtFwSi82Tc93O1ryXHtBaQyn6mw4s0j8LpKvL1ObxT5+iEgWx9r7Uprvi1Gs/vXZW
         hOQ1NeubosrRn/z3+NJyHu/SSe4s3AWtXfmguZ4vEEsiTv59nYWNWaw78P66aReEgKz9
         T0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXWftbmXrIUlLLDSCxWyDTQabEqrn4tX9UHXku9VNozAn1004ABTx93+ONfVEKmDHNzoC3hZKzOBAv0dpB59C3BJRVW0J0zXEklAp7Fidc=
X-Gm-Message-State: AOJu0Yzj+LAvtIk5B3vUjWTuCt3myRWFYpX/G2uPnUClHD4mKunbpyLS
	t8q/DS7a6+3/LOPcdqFSqWbbrRM1SbQORLgSWkgVNvDtCRW6L3uHNyLHpKuFZw==
X-Google-Smtp-Source: AGHT+IGZrxDiLVHF26VnSdniwyj76/oxHnfTvNc1xiRHZK9Rp5loRPCokoMVHrOcVgbX/nh7sDRI6w==
X-Received: by 2002:a50:d496:0:b0:571:d380:95fd with SMTP id s22-20020a50d496000000b00571d38095fdmr965522edi.28.1714113709508;
        Thu, 25 Apr 2024 23:41:49 -0700 (PDT)
Message-ID: <a7dd1c1e-76b8-437e-bfbc-111a904ab861@suse.com>
Date: Fri, 26 Apr 2024 08:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] livepatch: introduce --force option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240424081957.34326-1-roger.pau@citrix.com>
 <20240424081957.34326-3-roger.pau@citrix.com>
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
In-Reply-To: <20240424081957.34326-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 10:19, Roger Pau Monne wrote:
> @@ -571,6 +575,19 @@ int main(int argc, char *argv[])
>          show_help();
>          return 0;
>      }
> +
> +    if ( strcmp("--force", argv[1]) )

I guess this missing ! or "== 0" is the reason for osstest reporting a
livepatch-run failure.

Jan

> +    {
> +        if ( argc <= 2 )
> +        {
> +            show_help();
> +            return EXIT_FAILURE;
> +        }
> +        force = true;
> +        argv++;
> +        argc--;
> +    }
> +
>      for ( i = 0; i < ARRAY_SIZE(main_options); i++ )
>          if (!strcmp(main_options[i].name, argv[1]))
>              break;


