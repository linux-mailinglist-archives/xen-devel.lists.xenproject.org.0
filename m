Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1980A5EF28
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:10:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911613.1318021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseaW-0007Mp-5h; Thu, 13 Mar 2025 09:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911613.1318021; Thu, 13 Mar 2025 09:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseaW-0007Kd-2W; Thu, 13 Mar 2025 09:10:48 +0000
Received: by outflank-mailman (input) for mailman id 911613;
 Thu, 13 Mar 2025 09:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tseaU-0007K2-N1
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:10:46 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b8b184d-ffeb-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 10:10:45 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso4085515e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:10:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b7185sm13681145e9.12.2025.03.13.02.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 02:10:43 -0700 (PDT)
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
X-Inumbo-ID: 0b8b184d-ffeb-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741857044; x=1742461844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=53CzS23HEyiVmdNxXajEdr4I3hBXvBaw7lUMEh9hCLc=;
        b=GzYZlwSkC/F4zKd6FvqO7RtzfPjEgH/ub9JuT/ENwjSkgyHeQ3k8SJWVtBC/AdgHq7
         Jbi60oA3HJXHxNIDZ09m2XtTr/nirE5q/8rM58c8jjyZysydkPkFBGzTHVv9RTgf5azg
         9jv2FwYA1tc+wgH8dgFl23NaNQVYUYvNR77h4YR2fEM1xp8Ez6gIVk1pqisYx/aPxETK
         Wiz+Ffy/q6+UjrUlYP1unW5/DTeR2+40XajFPNc7i+HG3wnWx6YLcmO1j9PwgfqBO2Ut
         9RsUFdGJeBNqMmINqfad3mBxGs1CgnOSx2PTsE2IHmDAQ8myC1Rd50sj3hcikRmm2zUK
         PVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857044; x=1742461844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53CzS23HEyiVmdNxXajEdr4I3hBXvBaw7lUMEh9hCLc=;
        b=h4s3bN1Ym8qCCgE8bpdic2VfiXLPU5LNgAagNCxuGCIldakKlwVJYKfHVOvd1VtR/x
         IJWMPA6R8N2pHuZ0kfkKpeOuO1WhIIZ1ll0yazuUOUu2dOKba+VPtdntGwNNKwXhDXBz
         9FCr2E2kwtfbxvoQZW0gHctyWgO7ZdiTyA5VDd0VVnEog3ZrEQeblzHizw1Y/TsfyRdF
         9QiZZOvZp3Oyk8Ra3KAVT0pBbKDbDdhlP6QZyCn5h8sbObO1WKt1FydUjlPj5lxnt45H
         1VTQXbibrh0D/IPGBn2+0NwxseVH+MoHn00Xz4Nbl0uR47Ef081sxJVQoYMnBQ176b8e
         hFEw==
X-Forwarded-Encrypted: i=1; AJvYcCVRMTm2TyNFSZIlXNF8CIdcgrtdlhG8P+QsCgfwFB6YKWLV0purEqqQNPTbTUfd5vI2RKef8hc5YUA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMuMnq7B98Nc58FjR/KiAHJYYXVP5tCTSx13Q3rku6z3XEuPR5
	I/bGQGKrCFumWgnZObGJw3dmC3GUWL63dRh72KcxZ6v2FbsnWuk4zi3VECdVNA==
X-Gm-Gg: ASbGnctT7jFFzo0c9Zd/HruyXMGKGRJMmPS87hLEAh9OMy3tFvdH7p9AiWYOqkhYFjG
	RYsp2S6JAbAlP4V2aRo4naOnbBeLgIND+4FOIU3jhD0KDrNR7k9FeK/JDwddlBZxrK/SuDZzr6/
	2GwM9fgpwp6yuDkF+8TOOd1PXtlHPkSzMVSm0SO2D9daUlXR9gyZFKTuJfTOf5ClxZeWg/oHvP2
	i04kRuAcQuM4hfEqsmb/FRMmHIQyD5lNeGTsN/6xObIgxhskz/xHyhH9q5mkWLehqlQ6U9oCPUF
	FYc/JzAKfhTXKEbm/rej/8TQa9Mgcaf3ZeQz+s4o4iOaIdssh8ITVWBhJZ69PPq48O7jfMaWkVn
	9AjiITPkY1y9zN96Pe8nf/A8VQDNuYw==
X-Google-Smtp-Source: AGHT+IF6BflA9qxMOFdmDZBHAYFPhi5CLPjGHxU/NCogm/DP398xiPljFKcW+ZlJy98+uB9+QLM4Ew==
X-Received: by 2002:a05:600c:1d03:b0:43c:eacc:9d68 with SMTP id 5b1f17b1804b1-43ceacca125mr143132025e9.20.1741857044449;
        Thu, 13 Mar 2025 02:10:44 -0700 (PDT)
Message-ID: <7d7accbc-3985-44f1-b931-f4965ac97da5@suse.com>
Date: Thu, 13 Mar 2025 10:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] xen/elfstructs: Include xen/types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250312174513.4075066-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 18:45, Andrew Cooper wrote:
> elfstructs.h needs the stdint.h types.

But then why do you include xen/types.h rather than just xen/stdint.h there?
Instead I guess ...

> --- a/xen/include/xen/elfstructs.h
> +++ b/xen/include/xen/elfstructs.h
> @@ -26,6 +26,11 @@
>   * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>   */
>  
> +/* Outside of Xen, the includer must provide stdint.h or equivalent. */
> +#ifdef __XEN__
> +#include <xen/types.h>
> +#endif

#else
#include <stdint.h>

would make sense to add at the same time then.

Jan

