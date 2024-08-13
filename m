Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDEE9507B2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 16:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776375.1186490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdsZz-0001mC-40; Tue, 13 Aug 2024 14:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776375.1186490; Tue, 13 Aug 2024 14:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdsZz-0001kg-13; Tue, 13 Aug 2024 14:32:55 +0000
Received: by outflank-mailman (input) for mailman id 776375;
 Tue, 13 Aug 2024 14:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdsZx-0001ka-Mc
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 14:32:53 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb9125c2-5980-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 16:32:51 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so92292366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 07:32:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f411bdc0sm74254166b.118.2024.08.13.07.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 07:32:50 -0700 (PDT)
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
X-Inumbo-ID: eb9125c2-5980-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723559571; x=1724164371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+jIfCnMul7T+8VekLcYK+HUC6tkq529KeTfF6Amox4=;
        b=LlSnu3rJrFJCNa5J8CqDUgoLZ0Cqpglfx6lQDIBKHh9eymr6pXZ5a754miwDXAOsga
         u3yDH69PJlEZ3PSbcksNLsZASv8jtN4Ms5zAa/VCLwNY9WJ5O82oXqZx4KcHUAKsV4Bv
         y+OPlwqvQXaiPIyC5yc+NagSMMFW5BRQyC/n1uAt6yoqrapnMCi8o+ldBx2nSdQKCYmp
         FduwsogIjWeTjX8Ho05ZPXbZ7LTQSDsmEQWBfbxhHn68VU8og3ymRzMuySs73Bk5yzxR
         kfc8Z/1hRRybSkEXULo3CLCpPSsZ+HtiEJtMlFerg6L6z8fWmHgHufTuo1tHa47liOhR
         Zhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723559571; x=1724164371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+jIfCnMul7T+8VekLcYK+HUC6tkq529KeTfF6Amox4=;
        b=gW645jrXHoY2Aav0gibdngaYknAfRdN6el1FsPdAikWO9W79jgx4gGPC28me8hJ1vt
         pJQ0PZ+tZUZ9X5BzNV74wWfplxl+p9x5nCJL8QRoaylUnqRcfPe4FOp5f79ARQeNMe17
         1stjMqjfO07HTsoEDHq1OpjRb5aJjD4KHLkz5LNBEd691YYDkVF0MAyQlU+3i00PnLfE
         4xgxm5N6P04Ao5xNLk7DW7VRKC0lclM3BhIwqwByh63ILyNPtTUr90Jgm96QOoIL6uSn
         f1pdEwVuDt8z41f2xyFEAL27f/qMD3dNDi9wtyHUyKWGspE4o7klwOSpC+YYIvlroKtB
         +DDA==
X-Forwarded-Encrypted: i=1; AJvYcCWbjg3UVUKnPSGXks8+1LIoOv9KPhIsQAgnQL6Bbo3inF/uYQ1diLE08ZZSr+RMNf4D3RoseWIERKP8vG6KUp52amkkj3HdPANAu6VFx2Y=
X-Gm-Message-State: AOJu0YwhYsSodaoy4Jhj3MMC8gAKcGpPp3Sikipxw9nbEbiZ56Lhie2b
	Zs3kcP1wz61sav/N3Q+5lYjEwWacS+UMRAtYr0sVewU7Uw6D4prrs+jmakk2Aw==
X-Google-Smtp-Source: AGHT+IHw67pHD1kmhjEOD75xGZJMRUJNpiGLniNKfCxcMKh9uDk0EivYwq3ZEBYC/fcEwu/2ih5sFw==
X-Received: by 2002:a17:907:efc8:b0:a80:7193:bd88 with SMTP id a640c23a62f3a-a80ed258a0fmr299388066b.36.1723559570943;
        Tue, 13 Aug 2024 07:32:50 -0700 (PDT)
Message-ID: <c83942d9-bb55-45c2-9a44-314266ce14c0@suse.com>
Date: Tue, 13 Aug 2024 16:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/fpu: Split fpu_setup_fpu() in three
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
 <20240813142119.29012-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240813142119.29012-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2024 16:21, Alejandro Vallejo wrote:
> It was trying to do too many things at once and there was no clear way of
> defining what it was meant to do. This commit splits the function in three.
> 
>   1. A function to return the FPU to power-on reset values.
>   2. A function to return the FPU to default values.
>   3. A x87/SSE state loader (equivalent to the old function when it took a data
>      pointer).
> 
> While at it, make sure the abridged tag is consistent with the manuals and
> start as 0xFF.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> v3:
>   * Adjust commit message, as the split is now in 3.
>   * Remove bulky comment, as the rationale for it turned out to be
>     unsubstantiated. I can't find proof in xen-devel of the stream
>     operating the way I claimed, and at that point having the comment
>     at all is pointless

So you deliberately removed the comment altogether, not just point 3 of it?

Jan

