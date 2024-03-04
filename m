Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FB86FB26
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 08:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688176.1072064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh39g-00084f-5V; Mon, 04 Mar 2024 07:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688176.1072064; Mon, 04 Mar 2024 07:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh39g-000825-1l; Mon, 04 Mar 2024 07:54:36 +0000
Received: by outflank-mailman (input) for mailman id 688176;
 Mon, 04 Mar 2024 07:54:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh39f-0007wA-43
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 07:54:35 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70d03263-d9fc-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 08:54:34 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so5441846a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 03 Mar 2024 23:54:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tk2-20020a170907c28200b00a43ab3e38d6sm4435519ejc.114.2024.03.03.23.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 23:54:33 -0800 (PST)
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
X-Inumbo-ID: 70d03263-d9fc-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709538874; x=1710143674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n6Xe6TSFwCM/FbYS0Pn+JdVLdIVUR0H4ODheVTgzqo0=;
        b=J+qpvfbwggut4yMGZ9qpOT+VjUWnY3Nv1phcpRsNgtrGMO4G1/GGX5FmeLRIZlnJ+D
         WLnG1+6lFhRWOd9cpNHvaKCgkQreNgsjVN6t4Cbb0IRzRbzoX3gD1x115i8g4TfQlulK
         KfEgY1FBpu1hJmXS9Kww0/7DphJNdNDgFOLd2L+A85Z3v0N9JP8o0XxfjfvRgGwaZo7/
         2GQKuUhtH6aE516Ecdqz73acdXw7sglEbY8nY1wqxatVUqfQJtjj6puHGOxdUvY4PJ11
         X8I20WrhVCd8Ackfn4v8jczqRmjnmMIXNDtamZ+EayPpajiYDnWUN4+t4BwevyOnJvKI
         2Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709538874; x=1710143674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Xe6TSFwCM/FbYS0Pn+JdVLdIVUR0H4ODheVTgzqo0=;
        b=WcfVwaO6pUeFtr+vOpY4KcFWKiOHSIC1ojKGQMx+z1GP8S+/MXO/aQeWSFoqOn3qid
         b1Z+YEF4ZbjnKyOOdqptW0DmlOMfup99x2HZ8SmensjWCZBkCbQRjOzDZWYoRxXPtSvQ
         f7MqvsqTYqjiHc74nCioZN2fzoQT9xQcKnq1K/58jrPcYQ5OkRU7xnnvqPTEFXD/DUO+
         zCtgQbmK5lqGfABNBNJNbeQZlKO7CptdfmUVAYfkY+6nOXkNNcdxxd/T+XNHnao/5/vg
         lxzqZGiy84euITj02F+J6M/sHcDxi9AmGJKPKw7r1+7ZGVQMuOXqW9IVwe+ec2Jgv26i
         isYA==
X-Forwarded-Encrypted: i=1; AJvYcCV0YcN4MOhX07SJBUHN8exWv5m0IfzC7AyyFZ9PufuBOykz2esF6BbzGHIdT3pUeAdvptd0AqIMVmtU8sQgX3GO7v96GMWbMXax59+oM3A=
X-Gm-Message-State: AOJu0YwIjGnXMikwThuRvO1SCFUgAoA2nwF6Zs7YU18Lo1lGmAS/CPrH
	XMIpt/X3fgDqgEnV7hUFwTyQs4RTA8LaI6D3cVd2zea6wHgVptCbEUQ3rPtK+rSGXOah59q85xE
	=
X-Google-Smtp-Source: AGHT+IGiWOnaglXIDuGoAPVaXOU8F+IpL/UBdUY5zRzd3zs2ZFOGmXpDCyu8B0HcZOiv023N/foclg==
X-Received: by 2002:a17:906:d9c7:b0:a44:5a3d:7884 with SMTP id qk7-20020a170906d9c700b00a445a3d7884mr5351178ejb.3.1709538873870;
        Sun, 03 Mar 2024 23:54:33 -0800 (PST)
Message-ID: <6796aeba-52a2-426b-94e5-1852946dce98@suse.com>
Date: Mon, 4 Mar 2024 08:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: re-implement get_page_light() using an atomic
 increment
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240301124228.56123-1-roger.pau@citrix.com>
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
In-Reply-To: <20240301124228.56123-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.03.2024 13:42, Roger Pau Monne wrote:
> The current usage of a cmpxchg loop to increase the value of page count is not
> optimal on amd64, as there's already an instruction to do an atomic add to a
> 64bit integer.
> 
> Switch the code in get_page_light() to use an atomic increment, as that avoids
> a loop construct.  This slightly changes the order of the checks, as current
> code will crash before modifying the page count_info if the conditions are not
> correct, while with the proposed change the crash will happen immediately
> after having carried the counter increase.  Since we are crashing anyway, I
> don't believe the re-ordering to have any meaningful impact.

While I consider this argument fine for ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2580,16 +2580,10 @@ bool get_page(struct page_info *page, const struct domain *domain)
>   */
>  static void get_page_light(struct page_info *page)
>  {
> -    unsigned long x, nx, y = page->count_info;
> +    unsigned long old_pgc = arch_fetch_and_add(&page->count_info, 1);
>  
> -    do {
> -        x  = y;
> -        nx = x + 1;
> -        BUG_ON(!(x & PGC_count_mask)); /* Not allocated? */

... this check, I'm afraid ...

> -        BUG_ON(!(nx & PGC_count_mask)); /* Overflow? */

... this is a problem unless we discount the possibility of an overflow
happening in practice: If an overflow was detected only after the fact,
there would be a window in time where privilege escalation was still
possible from another CPU. IOW at the very least the description will
need extending further. Personally I wouldn't chance it and leave this
as a loop.

Jan

