Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446F9426E5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 08:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768240.1179008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ2sa-0002Ow-LH; Wed, 31 Jul 2024 06:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768240.1179008; Wed, 31 Jul 2024 06:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ2sa-0002MG-IJ; Wed, 31 Jul 2024 06:32:08 +0000
Received: by outflank-mailman (input) for mailman id 768240;
 Wed, 31 Jul 2024 06:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ2sZ-0002MA-8d
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 06:32:07 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a72d72b-4f06-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 08:32:05 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so8111247e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 23:32:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9ef91sm725867466b.183.2024.07.30.23.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 23:32:04 -0700 (PDT)
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
X-Inumbo-ID: 9a72d72b-4f06-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722407524; x=1723012324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1GSKa4f7XN86eBIV5WX+6+lIGbwbj1hfTVZhfLjj3KE=;
        b=guhB5A1yX6mHV0jU3cxe+uErqreW+c36QxpBDO/gkJxPBR+DzjG8blqMaYxMJTIJmY
         IV42Y1T9NX88nOsraZ1QbW1EPxrWegRUssuns9fOCNactAp4mUznXoOF/5PhnoGsBCCD
         u2YwYX2N657+f/3TAwhEB5EVOC/GsO9nav54P+TuJndLZIbAo1Hr0BuSnMTydUvrfJwj
         5s+04t/wRe3WlCxNCEae0gCX/rq6ulMrQGqgrWGlpd0QFNMEEHpntLrPKpDoZoIJQPv/
         t8anOGd+Qbv8x/S4Sh7cvjvGNnpTlXmGtof29eBtXW06BplJSYyjUyq8Am3YKE7BcjgF
         04jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722407524; x=1723012324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GSKa4f7XN86eBIV5WX+6+lIGbwbj1hfTVZhfLjj3KE=;
        b=Ts1Kn3VFJ4ynMZGp+RTThJ/22qA+GVuagHSmN6GN7FSmE2RQYhakqHhWovwiI0I78V
         fimDLGDI/tcWVkmOAwHXEnXrfIB7HxNgVIvrdpmye4rDxgMUUF9ykLKIgkv8e0XYlAli
         jb8pR45kvZWqHm9PnQVgVRxBpcst5FfUIkQ+2bpWFfw7b1Iy6d8phuci9+bLaqCyyv1Q
         Mlbd/iDuYJeDhcfqUiWJPUS0H6X18y0wgSg5yngvl3yrmJdXCN30BgcMJFudB/7U6LAN
         sENVwE3NBLtlCrPRgh4OexAQguHhfPJEamTjZPK82XxFQkNkhNG0aS6qjLXtWOsIS6f9
         yA0A==
X-Forwarded-Encrypted: i=1; AJvYcCXax7iyVN0Nyk7zUEpCHqbLOFObmpdzH+WwnVjPSz2smyd74MN+Phs2wUND7LHEebjQ5DAvOwqRarcaWa4A/MwoKTGGN6mgVht0Fqjcms8=
X-Gm-Message-State: AOJu0YycaKnscRtuW5k22RfTCRcjIC3yHk+xwT/q6peN3l/+ERWANEJq
	vA9jsB1hgDv7fsMUkL26JlX1ckh1Wfd+OcpNPM1DQT7j3pyKlfqhKYGhAbeH/DbvnuOr1HfRbwk
	=
X-Google-Smtp-Source: AGHT+IECMvpSA2Nyszr3un5OB4MbrF+mBEBQnrLSh5NP640+6p0DdOpbbl36uDZ5TV23tE2z9tjj8g==
X-Received: by 2002:a05:6512:2527:b0:530:ac41:4cb with SMTP id 2adb3069b0e04-530ac410765mr3989736e87.3.1722407524364;
        Tue, 30 Jul 2024 23:32:04 -0700 (PDT)
Message-ID: <5e5cc6b2-cdf3-4670-a2dc-2e23dc22d520@suse.com>
Date: Wed, 31 Jul 2024 08:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/dom0: fix restoring %cr3 and the mapcache
 override on PV build error
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-2-roger.pau@citrix.com>
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
In-Reply-To: <20240730152855.48745-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 17:28, Roger Pau Monne wrote:
> One of the error paths in the PV dom0 builder section that runs on the guest
> page-tables wasn't restoring the Xen value of %cr3, neither removing the
> mapcache override.

s/neither/nor/ ?

> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -825,6 +825,8 @@ int __init dom0_construct_pv(struct domain *d,
>      rc = elf_load_binary(&elf);
>      if ( rc < 0 )
>      {
> +        mapcache_override_current(NULL);
> +        switch_cr3_cr4(current->arch.cr3, read_cr4());
>          printk("Failed to load the kernel binary\n");
>          goto out;
>      }

Just below here we have

    bootstrap_map(NULL);

This too is wanted in the error case aiui. Happy to move it up immediately
ahead of the if() while committing, so long as you agree. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

