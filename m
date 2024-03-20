Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F03A8814CD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696010.1086493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmy4s-0008LZ-2v; Wed, 20 Mar 2024 15:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696010.1086493; Wed, 20 Mar 2024 15:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmy4r-0008JM-VV; Wed, 20 Mar 2024 15:42:05 +0000
Received: by outflank-mailman (input) for mailman id 696010;
 Wed, 20 Mar 2024 15:42:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmy4q-0008JC-Ub
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:42:04 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65d1cb2a-e6d0-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 16:42:03 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56b8e4f38a2so3187020a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:42:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h6-20020a1709060f4600b00a468be342bfsm6185503ejj.136.2024.03.20.08.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 08:42:02 -0700 (PDT)
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
X-Inumbo-ID: 65d1cb2a-e6d0-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710949323; x=1711554123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbwI7wpXLk3zANzvhdPkPLuSuz1KVcG4KeWWJSNch8k=;
        b=XtgQaTxnUJcaoXQMtomi9mkZHwePBiKTthLb/LJDi+eTPjle0Ef9HeGXddTQjOLGgE
         c/V4LJPxn94fX+RjSnxNSa9qiCX4FjmwQJ4oTZIvSYTD8k5UM1b3BSP65pLVZOrkWOPL
         DNqRRITUXfa457FOxbaOnjj/0fw8AZuXa4XClMgfZ/hKR+1XVr8ZY+Aj1GFCQN59Gou6
         awC7YqiO2Pz8AMB5twY39dDp1hYKskvFKgJQYOUUHVdIOToPl7vR6ruryEwuY0eSi3Xl
         g2eL7tQnrfkFajnVEvi7Ev+CqvYOO7FUn07xSBRp0e/NxixG5dMJZHcKTbRgnG4Sej61
         5u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710949323; x=1711554123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbwI7wpXLk3zANzvhdPkPLuSuz1KVcG4KeWWJSNch8k=;
        b=G94fSNxH42iaz91IF5msE9VOxw5Nr+wO5MLUvxGt3fvs/sWqeveWtx/eWK5jQY8tIF
         3vm0ra2BEneSkMvn9kulHIjt5p4PSUDbMHe4xJ8LHRO/PEySziUyHDOKzIK+TrsJMgdQ
         hpHGB6fjn93DsCtGSCn3P8t4x2OyFcf8y2KrwEESP+B5+ZlKuG6PoaDMKUhsN/B6fsk7
         9UE8QMnk9lYDzxS1eif0KCf3C7INT3XyD7fbJ6C7IjykZu4r/Rn6Zm1DsoQEbwLbFph7
         vhytGP3VoHgw85+2MuvT6s5FEujt8hkyZAArj99lg7S1LGD13HSdvQxOHbIYeEmvMFx8
         17DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGuU7ZUR7bDXeYiCL1jOkxH/8aKKUxWCCELpu6rxYgQiqkZk33MOXYATwlTzG7K5wCO1PRihmPzhb60trdflXe9Ld0MJmE+p96HnVdrjQ=
X-Gm-Message-State: AOJu0Yxu8k64czPsvoMEnXl/ScetT+FGzrMuHAaQj4CCyu0dwCakGTG6
	g2Ryd/Hc4qE5Uo3DEbrnxCs0YM33ef17Ky5gYNfTK9w4ZsahtU6/Ie+7AxJEWA==
X-Google-Smtp-Source: AGHT+IFBRSI7o5yP8EJ/68uDpNtxpyEhTm1yrWvIbgXoozKtKOfQptqYzmH9TP3fogHqV61kUtqKcQ==
X-Received: by 2002:a17:906:6d59:b0:a46:e595:f357 with SMTP id a25-20020a1709066d5900b00a46e595f357mr3247536ejt.9.1710949322734;
        Wed, 20 Mar 2024 08:42:02 -0700 (PDT)
Message-ID: <a4d36c0f-d3a3-4d64-a62e-b631a4ece9a8@suse.com>
Date: Wed, 20 Mar 2024 16:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/20] xen/bitops: put __ffs() and ffz() into linux
 compatible header
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <8bc35da4a9fd44d2dcf9677dcc99334eb7142581.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8bc35da4a9fd44d2dcf9677dcc99334eb7142581.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> --- a/xen/lib/find-next-bit.c
> +++ b/xen/lib/find-next-bit.c
> @@ -9,6 +9,7 @@
>   * 2 of the License, or (at your option) any later version.
>   */
>  #include <xen/bitops.h>
> +#include <xen/linux-compat.h>
>  
>  #include <asm/byteorder.h>

Hmm, no, a library source would better not include this header. Surely
the ffz() can be taken care of locally here?

Jan

