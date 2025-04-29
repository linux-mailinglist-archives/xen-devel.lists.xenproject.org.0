Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5AAA0D0D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 15:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972595.1360883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kjb-00087X-NR; Tue, 29 Apr 2025 13:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972595.1360883; Tue, 29 Apr 2025 13:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kjb-00085p-Kn; Tue, 29 Apr 2025 13:10:51 +0000
Received: by outflank-mailman (input) for mailman id 972595;
 Tue, 29 Apr 2025 13:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9kjZ-00085j-GM
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 13:10:49 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ce43d65-24fb-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 15:10:46 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso9659149a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 06:10:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7013ff81dsm7686083a12.24.2025.04.29.06.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 06:10:45 -0700 (PDT)
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
X-Inumbo-ID: 5ce43d65-24fb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745932247; x=1746537047; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vhiXa34i5am0/ckDfFZ5pXKyzhzsKyHciVl03tIEtEU=;
        b=JrOjgdH8E0ik5o6S1Hlaos+rUE5rzmRVa+iQQ+/WSQP/ToyB7CSLV8pfLvyThD2M7H
         nLHUz5OIPFoRI+ucH9TkSQAUnAEsNHDaz/O4xmN7gcu3oM9TJr+rqBW+g9eFe7+uS5BE
         osY/Zm7mwTh3ZQxFo847r0WovKm0hPgnGbtqYb6Pfk+CFF9ZiohMj3Z9xGqFjercgGHe
         QzeFw6BUiAVeoaky00Me3BRE5Ht02M+uYj/p/1Xcc6+zPkhStaOhEYIamCZdqYPqvK5m
         fFXkAQcEhYGsk8rTOAX6XhFAKFm8WyBvtPblaAejH8zi+akwVV4DIpCh0HjQg4SxntX0
         JYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932247; x=1746537047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhiXa34i5am0/ckDfFZ5pXKyzhzsKyHciVl03tIEtEU=;
        b=ps7IL7AZ2mbxg4BAzngl9Ptyom+SIRAeDyp8wfvdY71bvsDnjOTZ0Ysr+2+SCyFXY3
         +rHItuAJHfoJGTkDzHde8ST2rvIvvHFIjNK4SVi7uSJE7zECg3ys3x37fYLZFo+XPXyx
         UV/cBf2l9StWDSlBNxHfeooTQvvE7QELoxpxwughugliENJsz8rVU8IFPgZLQkr3w6zY
         7vfLGurxDMK7gEyFFL2ly+D0ThHRctqN3XXENDXyvseiZqiFGGGlWPzmiIvnxrXtTkJi
         9TqXl7/ppd8CurMtektaJD+c52DAKjOm7eHnfN0JAO9tSGrTh4zTWto20S9a+H9sfIOM
         xPOw==
X-Forwarded-Encrypted: i=1; AJvYcCXIkvmqIdS/siqsDlNueDu0g6rVmUIsl+TE/VZ8xcLeLWqJ8cBy/WqW4QlzuwaasesAjhsSGYIbxJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZ6miZyDmhVxU/mX/hcSrd2rEl/+UVi/SLe5XuCRDcV3i940S3
	gkgU/3hX0bfYlczU8KN/u37/0iZMiK2QVuim0K/ewxzkEOFJ4SO2yolyXF0FGw==
X-Gm-Gg: ASbGncsGgBki9RICoo9a169NYir4xJrx2gSk16Z6hBiUITrI1NMu7jmzqBywqNDWpXj
	qY3f9fyZzkghTHHd6gsY6xK2FXsd/rvjoN4YI3swwXWTowhmTxZY+Ao1K6bRi9mgT2Biqm14rgn
	YJPcAj0lLWFs9aOX6hQok8mGlv0DNhuAktjNX3Oa7GgjJcTGJdY+gfPHn8m2g/lYAdrzPoh3mGT
	gtTQWW4EHcEyklVbmyaTybzh7j24/t9yInluldIvOfiQhmByAvxjpKxWT79W3MgLyfX6MPFrQ71
	xZZ13oq58wrPdZo7iN7xGE5DWxXWLYX3A71zt3pSOGCkKfBRvpHpLCUhMXXY6hlKslmG/Uq9XEP
	j+eO6TLmRwcwJxG3cy8uDdv++Sw==
X-Google-Smtp-Source: AGHT+IEoiBKCQ5m9yKiWdqnURwOvhgutiOoLHzKtkb1zoUisSBOLaLlP74+tC1ZFfsF8gLZOYD/Pxg==
X-Received: by 2002:a05:6402:350c:b0:5f7:eb1e:7f25 with SMTP id 4fb4d7f45d1cf-5f83b0c3d7fmr2249811a12.12.1745932246616;
        Tue, 29 Apr 2025 06:10:46 -0700 (PDT)
Message-ID: <a51b8c02-c32a-42fd-a0e9-d617efbf9c36@suse.com>
Date: Tue, 29 Apr 2025 15:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/15] xen/cpufreq: disable px statistic info in
 amd-cppc mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> We need to bypass construction of px statistic info in
> cpufreq_statistic_init() for amd-cppc mode, as P-states is not necessary there.

Is it really "need"? What goes wrong if we went through this initialization?
For now it feels more like an optimization to me, i.e. "want". Also ...

> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -98,6 +98,9 @@ int cpufreq_statistic_init(unsigned int cpu)
>      if ( !pmpt )
>          return -EINVAL;
>  
> +    if ( !(pmpt->init & XEN_PX_INIT) )
> +        return 0;
> +
>      spin_lock(cpufreq_statistic_lock);
>  
>      pxpt = per_cpu(cpufreq_statistic_data, cpu);

... you're specifically not bypassing the spin_lock_init(), for a good reason.
With respective clarification in the description:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

