Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78440896558
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 09:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700324.1093281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruhc-0005n9-3V; Wed, 03 Apr 2024 07:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700324.1093281; Wed, 03 Apr 2024 07:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruhc-0005lK-0x; Wed, 03 Apr 2024 07:06:32 +0000
Received: by outflank-mailman (input) for mailman id 700324;
 Wed, 03 Apr 2024 07:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rruha-0005lE-Sm
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 07:06:30 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0e3cfa6-f188-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 09:06:28 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41569f1896dso17153085e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 00:06:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c139600b004148d7b889asm23738954wmf.8.2024.04.03.00.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 00:06:27 -0700 (PDT)
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
X-Inumbo-ID: b0e3cfa6-f188-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712127988; x=1712732788; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IgozsyAWNQWkxwzyx5s9x4dde7if6pY86JHv3Q/QFpo=;
        b=VLJ0ER8/IumWMHcYfWlg3hW/Cv8Vj38trV2p1a2Gr1ztEuKqEW0JA99q2593TiCsG9
         3FE7u2P+YMnLQVpto1lunbboSf5zaNu3VUIAf7lCVrcONrMFqVDUe+v3E1pMCU50BCOw
         FuU4ezPRo/ix27smSXaYRnPHsriORZ+9RB4aMXzDuU2AgSwKy09XYUDqo0sPLtLx6ZXx
         5UrkE0t60XISgyikPgj5dtS6RAOWR0Hc7PzEUaAkf24nGQ5/yIdkqp06Ld2OrmePXQk4
         sBfMgxdaMR2qVtC4ofTta3egnNxse8zaSi7alfx7DrsfFVAbj+Kuq5nKmMCllBLAa56G
         Oyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712127988; x=1712732788;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgozsyAWNQWkxwzyx5s9x4dde7if6pY86JHv3Q/QFpo=;
        b=gRgACls4vLR7kYtaTGpMAZAbiMsH/PVtbHTqwWLPeNjoXMjr2ksX5JJTxegUjKa++c
         +an9KD8MVMpqwej7LV7GncHx2lnC4DjMR42vkPbfDBzxDjqmpu17i0tge5/Qj+d8b5Xi
         gKdAhX+XM9xolu+PJmWawjDCqvEGLwHnoTqrCV4zpBr+WTXPm1WN6xITgZo7udegyMCM
         ZzlDVpU7VO3Kan6x86tm7JCL/V/QynARN+/oOFxlacXn1aQ9OjR4WTzlAKCKq+vwDMkF
         6+XjgPALp76APxJamiCZ1UyhwRnmlVD+7S3i1KMFgjBwPCcw6NWRmMG3bFrbCys/eVSn
         cJSA==
X-Forwarded-Encrypted: i=1; AJvYcCVSXej4olR7AqkV/+A2P2OGYpJRtsenijPjuLu3z0vUdQUFr76axyRIorTQ6u9KkLSW7PgwTN5dpFbj45MIW3OO8e76BeD+HgO60mYE1Qw=
X-Gm-Message-State: AOJu0Yxdu2whkxuATweuIJsmVXZjEoJNX3cr0uEfOUyVu/56BB9XeDwn
	5Vahea43z5gV9QKtkj+/uysnHfA1CRRN5Qakxt3VDY0LQxlgxAc4I2y3KNnpYQ==
X-Google-Smtp-Source: AGHT+IE/j+ktN2JCUyNcIT00TK6qNNSFdkGRfF30DfNUz3HMOvHo9ZoCOg5EWjOeRH6OmNCVZDfUmQ==
X-Received: by 2002:a05:600c:3514:b0:413:3160:840f with SMTP id h20-20020a05600c351400b004133160840fmr10352088wmq.0.1712127987699;
        Wed, 03 Apr 2024 00:06:27 -0700 (PDT)
Message-ID: <23612847-e364-47cc-a1ca-a571431a3996@suse.com>
Date: Wed, 3 Apr 2024 09:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] vsprintf: address violations of MISRA C:2012 Rule
 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <b1f2dc6467571090f882ce7c0611db13a8c63555.1712042178.git.federico.serafini@bugseng.com>
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
In-Reply-To: <b1f2dc6467571090f882ce7c0611db13a8c63555.1712042178.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2024 09:22, Federico Serafini wrote:
> MISRA C:2012 Rule 16.3 states: "An unconditional `break' statement
> shall terminate every switch-clause".
> 
> Add break statement to address violations of the rule or add
> pseudo-keyword fallthrough to meet the requirements to deviate it.

While the latter half of the sentence properly describes the latter
two of the hunks, the former half doesn't match the former two hunks
at all:

> --- a/xen/common/vsprintf.c
> +++ b/xen/common/vsprintf.c
> @@ -377,7 +377,7 @@ static char *pointer(char *str, const char *end, const char **fmt_ptr,
>              str = number(str, end, hex_buffer[i], 16, 2, -1, ZEROPAD);
>  
>              if ( ++i == field_width )
> -                return str;
> +                break;

This "break" is inside for(), not switch().

> @@ -386,6 +386,8 @@ static char *pointer(char *str, const char *end, const char **fmt_ptr,
>                  ++str;
>              }
>          }
> +
> +        return str;
>      }

And this "return" is what now "delimits" case 'h' of the switch(). The
original situation therefore was that the for() could not be exited by
other than the "return" inside. The supposedly missing "break" in that
arrangement would have been "unreachable code", i.e. violate another
rule. Hence the (undescribed) further re-arrangement.

Jan

