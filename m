Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE14806A0B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648982.1013157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnYV-0002aB-7Q; Wed, 06 Dec 2023 08:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648982.1013157; Wed, 06 Dec 2023 08:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnYV-0002Wx-3q; Wed, 06 Dec 2023 08:46:55 +0000
Received: by outflank-mailman (input) for mailman id 648982;
 Wed, 06 Dec 2023 08:46:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAnYT-0002Wj-R0
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:46:53 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 000b48fe-9414-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 09:46:51 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-40c19467a63so5133585e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:46:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c4f8a00b0040b4b2a15ebsm21051888wmq.28.2023.12.06.00.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:46:50 -0800 (PST)
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
X-Inumbo-ID: 000b48fe-9414-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701852411; x=1702457211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUdAFjZQ+8xpF21yy+dYas4Fg+4I2AZxMuS+an0Ea/I=;
        b=YIzsBzfPxULIaM2ukmDu37bs0d1o0fqZVV1yloUBbRrYBfABO6SVGqGyGKkzKZIfvF
         SFGHkS+8lB0EGZNg0LbD5UeN7Yk206gvTECp/LmhDcFVDb3xtM+JE06AnJqelqLUWT6+
         61cBZqiv1eo6UsoYPqE8OZmlPvlGZ6dvEl7tSgaHvsgBaOvioWPqKzE53bP7JgJwMRNy
         IpSicHoW8myIuFUJpehOGQ/Mjx5Q8MKNy4P0GHi1f3BsjP730XKn3+n6eDIncnM7xGXh
         IRF5MXGUeCm/Ko29jXs7toqwJdHnzMjWrlWbGiCX93BgFmm2rr4HqkjfPJ1vHyIutqUa
         Ykzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701852411; x=1702457211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUdAFjZQ+8xpF21yy+dYas4Fg+4I2AZxMuS+an0Ea/I=;
        b=jrN022b9o99WLbXvl85OZ2lFYpZrUMS6kUmGFecGmKaRgrjPPoxc5wUURLy4Ea/ScF
         Hl/agr4pp+39bozEFISEvp5nUp5Z3HnuEhlc6mXxopHRc9vt1lszh1AjQ+Oo0YYMrYQg
         1Y1bV2FCEf8xmFRQV3fclTlZKf+hyhJ8SnejsmoTcSgTAGXr5SDazT11psqo9X3sSKny
         zjiJ2X9gPJdTWI6ko8nFwrzG8t6/z22NypPLuBOBqF5sLtYfH9/l7PVNNBdYtX2M1IiE
         EVDpOVAbuoHYmnYrR9xhRXSeILu/rR2l+pI095VlB2l6VnXrBpvptyHjIrGjT6bHCjYE
         w6bQ==
X-Gm-Message-State: AOJu0Yxe3idFB/dTo6uY4prO9V0nbO9AlV10ihavdRilqHINz2tCYnOO
	1sz+YsHrnY2ZM7DeRlDjqwO8
X-Google-Smtp-Source: AGHT+IFcnAud9UKchgun9HIFGpeOaoqt1UHJLPNtInfF1/6J0va/eFkvCWksa0JjyGn0IsCGI9cPjQ==
X-Received: by 2002:a05:600c:1c01:b0:40c:1421:ae89 with SMTP id j1-20020a05600c1c0100b0040c1421ae89mr345491wms.121.1701852411188;
        Wed, 06 Dec 2023 00:46:51 -0800 (PST)
Message-ID: <96711b23-9dd9-4029-aaea-a3e755c4bd3e@suse.com>
Date: Wed, 6 Dec 2023 09:46:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, xen-devel@lists.xenproject.org
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-3-jgross@suse.com>
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
In-Reply-To: <20231206071039.24435-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 08:10, Juergen Gross wrote:
> Instead of defining get_unaligned() and put_unaligned() in a way that
> is only supporting architectures allowing unaligned accesses, use the
> same approach as the Linux kernel and let the compiler do the
> decision how to generate the code for probably unaligned data accesses.
> 
> Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
> the Linux kernel.
> 
> The generated code has been checked to be the same on x86.
> 
> Modify the Linux variant to not use underscore prefixed identifiers,
> avoid unneeded parentheses and drop the 24-bit accessors.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 803f4e1eab7a
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless ...

> @@ -15,67 +7,82 @@
>  #include <asm/byteorder.h>
>  #endif
>  
> -#define get_unaligned(p) (*(p))
> -#define put_unaligned(val, p) (*(p) = (val))
> +/*
> + * This is the most generic implementation of unaligned accesses
> + * and should work almost anywhere.
> + */
> +
> +#define get_unaligned_t_(type, ptr) ({					\

..., do we need the trailing underscores here in addition to the already
sufficiently clear _t suffixes? (Leaving aside that ..._t generally is to
denote types, not macros or functions.)

Jan

