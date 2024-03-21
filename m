Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB54F88578F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 11:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696316.1087146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrK-0003I0-Md; Thu, 21 Mar 2024 10:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696316.1087146; Thu, 21 Mar 2024 10:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnFrK-0003GT-Jv; Thu, 21 Mar 2024 10:41:18 +0000
Received: by outflank-mailman (input) for mailman id 696316;
 Thu, 21 Mar 2024 10:41:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnFrI-0003GL-CA
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 10:41:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ac267ac-e76f-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 11:41:15 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a46de423039so47841166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 03:41:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q1-20020a056402040100b00568d762cb5asm4702737edv.35.2024.03.21.03.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 03:41:14 -0700 (PDT)
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
X-Inumbo-ID: 8ac267ac-e76f-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711017674; x=1711622474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQwUxv85k60jx5TCPnj8y+/xwbLQvv8der3jLm2oF+Y=;
        b=Hni+ZtQPjrAYGqw1YlRNvDFrPneEMkBkTOK/KsDXg+ovmgN1oKvBxwTQsUYhYTEgUz
         oHgVEuGOHwpdVgUV8tpEV7nl1WjFnlTyhzUPCu6jo65TUX4USoQmirdTle6IB1a8cGMp
         kCtp9XOqs+xRUBdsLHxYDC1GKg/TptxbNyn0mTlVOHVd390HBomu2MngmbBD1VOCln72
         zrvNg0eywWoB9r2SDkZr101wzZ+0nYmIytv2SCMPq6aEvIYDg82wsPCEEWx2NYByC8tB
         k+IMDzCWfdDBTtjzkHk/hPSbDkExUhqKkojkrhttzl2lhE/JfYkALzKoxoFXHqe9wYGI
         sNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711017674; x=1711622474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQwUxv85k60jx5TCPnj8y+/xwbLQvv8der3jLm2oF+Y=;
        b=UOrAMSwxldnK6TE8JywT2AeUWbyfIgr6DCIm4JhjGhKYoHHacf2jL3AxjAiQLSr2+I
         cr12VhBUs7SPiBsDk3s91vBtS44tRoWojr6EzWHnIAw8VA/rI9akCqOpVR/RIRE9BR4t
         MoZ8LJZ3X1snMUhubF8UQ/cDkAJSn6SjxochWyBabyJM07ZNa9Sqp/a2q/YadzqX7lQc
         9UhCvXy4RGvywx1k6HfVeuJaHgd4OIcsohrpAyBg10tswPmNmeh+jtS483b0ke3dOuki
         1oUFFulgEGr84mbz8TBXvmgnt7CrDeC2rV3xgD/1kNOWwH8CTS7z4uRfMjXQvXfecuAs
         XGCA==
X-Forwarded-Encrypted: i=1; AJvYcCV29qKffdKYX+71lMG09Ikdwn+5ScBDOXSKXcG9KA4eq5OsuxMopRju4Uc1Rv857Zddzsb2NTcJsekNSgM2vOVAO4DIt8iecwUrjdJBP1M=
X-Gm-Message-State: AOJu0YxRQ1VpB/58c90fOn+mB/9gvqKIVhk8EdNCA86r1vdJTnRBUBpT
	mlKWq7IBFH2JgXAtTbjl3uv9v9aDUd5wy1aUfn2LvdwuqyNLIqo/vbj8BCRzoQ==
X-Google-Smtp-Source: AGHT+IGZvCNiVLqj8Et8fkvJhc/PjrGXQecbgdGxoAnjv2w2ewK6Xlgi0OwgbRSMmlufRyMvGQLbXw==
X-Received: by 2002:a50:bae3:0:b0:56b:986b:b4e7 with SMTP id x90-20020a50bae3000000b0056b986bb4e7mr1502013ede.27.1711017674526;
        Thu, 21 Mar 2024 03:41:14 -0700 (PDT)
Message-ID: <6a9ab81f-451f-46bd-a875-b30eddc9a716@suse.com>
Date: Thu, 21 Mar 2024 11:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/3] AMD-Vi: Disable IOMMU if cx16 isn't supported
Content-Language: en-US
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1711016106.git.teddy.astie@vates.tech>
 <9c825255af5d3973b29c85cb6856c67b69aa0e4a.1711016106.git.teddy.astie@vates.tech>
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
In-Reply-To: <9c825255af5d3973b29c85cb6856c67b69aa0e4a.1711016106.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 11:28, Teddy Astie wrote:
> No hardware has VT-d support while not having cx16 support, consider disabling IOMMU in this case to avoid potentially buggy code.

VT-d? That's Intel, not AMD. Also alongside bare hardware you also want to
not completely leave out Xen running virtualized itself.

As a nit, please limit description lines to 80 chars.

> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -312,6 +312,12 @@ static int __init cf_check iov_detect(void)
>          return -ENODEV;
>      }
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
> +        return -ENOSYS;

ENOSYS has a dedicated purpose and hence doesn't fit here. If no better
suitable error code can be identified, ENODEV is perhaps what ought to be
used.

I'd also like to note that while this says 2/3, I can't spot any other
part of such a 3-patch series anywhere. However, in particular
https://lists.xen.org/archives/html/xen-devel/2024-03/threads.html looks
to be lagging anyway.

Further please note that maintainership recently has changed some; please
make sure you use up-to-date information for composing the Cc: list.

Jan

