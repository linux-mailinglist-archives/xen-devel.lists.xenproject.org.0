Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E40889647B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 08:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700301.1093219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rru2N-0004rT-QY; Wed, 03 Apr 2024 06:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700301.1093219; Wed, 03 Apr 2024 06:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rru2N-0004pV-Mz; Wed, 03 Apr 2024 06:23:55 +0000
Received: by outflank-mailman (input) for mailman id 700301;
 Wed, 03 Apr 2024 06:23:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rru2M-0004pJ-FV
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 06:23:54 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc61a616-f182-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 08:23:50 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4156a2aeb43so20694645e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 23:23:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b0041493e21844sm23544947wmq.27.2024.04.02.23.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 23:23:49 -0700 (PDT)
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
X-Inumbo-ID: bc61a616-f182-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712125430; x=1712730230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eU4Kvxa6S2lNftq7OIqQb8wRacONrsh7tQKm0bDHwbE=;
        b=Rpts7wbEasp9lF7ic2jPZ6pGpunqMA+wkK30P2VHWdEykXX4hXfXzFuMOvxVQgXvDw
         V7g3VZVYQYr+oxUyD7YN4wW32n137ceAUizOE78wGwHNtljZK7+BIpY9lqog0aXYL/j0
         hjln/q4f5wwXwh/At+LNVGICCKxqnljfGji3jotOEmmLlQ4FJKnvrd3AWXmmc/n2eDsJ
         6tN4izqVtD+6ymsTFavj9lKmLc4HQQ4iKmkM5Lnxy19KKmF6BxhsfN2iwU1lKs6dAzbQ
         +T3NpkTYr3tmJ0/Fii0lIwh7dxtA9ymvwaW/hSc2vMHHu5JvEcOQtS7IZsDXKoMmb6Tb
         Ptiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712125430; x=1712730230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eU4Kvxa6S2lNftq7OIqQb8wRacONrsh7tQKm0bDHwbE=;
        b=iA8QvlZfTTB+48IM11v37EORaoA1AgtfWNl76Sr6w0jgQME07wOTl43iLCRHR6lYw+
         uKMsjt/hPOagR7d+QCrwRt7ZzCnMrgNli+69nvd3ngivMF8waTFVQ/N77YV6Ty2Weuqx
         DK4LAR+WaSinQPO/AzLM3/VaATJAM3+Qzb28EkFswTR+Qbk+vkLQmi9ml10mgfvQeAmm
         5Ntq8y5TGDjOMKaKs+pFOiC8yO+xSyflZx7uhGsoI+odDh/Q+ulh1WWgQif6Dl6Vs588
         pnTkIbwNGnQh0I7E1BK6kbcUu7Fn/BKlKf9wCUiAX5pkxH1xVtr2uRzyX28SUZ/EUUhw
         YSpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCgQBqBvjrQoJAqJwQsD4r4ai1UczRIrLfZHKHWr+y8eK4c5m+P43715mRLsvxueyt/i41+tA83QaO/pkJBUfwxbt6PwQGSlJyU7tA5bM=
X-Gm-Message-State: AOJu0YzYGgS/TZc3BZahBfHCgzF9GVL288QjHY1yeYZ24ri5aPqFP1RO
	LLfOI1SXNF0oa5LCi7D9YHSqiMSNupocbqUF9HUMNvx4gBd28tspaCh9VyC3og==
X-Google-Smtp-Source: AGHT+IFvx7H7X8Nynz+GB0ZmDp5803V4jeg/CzZkv1SkXtGlWrNw4ltzFmf/d1JbHeFrf1kfBL2k+A==
X-Received: by 2002:a05:600c:4688:b0:414:63c2:23cc with SMTP id p8-20020a05600c468800b0041463c223ccmr12960931wmo.2.1712125430022;
        Tue, 02 Apr 2024 23:23:50 -0700 (PDT)
Message-ID: <1776a07f-d4fc-4528-b6c4-bb0f2432524e@suse.com>
Date: Wed, 3 Apr 2024 08:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/7] xen/domctl: address a violation of MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <c730993f757afcaeb327e7fb8528b70b716cd5db.1712042178.git.federico.serafini@bugseng.com>
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
In-Reply-To: <c730993f757afcaeb327e7fb8528b70b716cd5db.1712042178.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2024 09:22, Federico Serafini wrote:
> Add break statement to address a violation of MISRA C:2012 Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause ").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



