Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489558B3042
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712427.1113115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Exr-0006kv-Ca; Fri, 26 Apr 2024 06:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712427.1113115; Fri, 26 Apr 2024 06:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Exr-0006iW-9w; Fri, 26 Apr 2024 06:21:43 +0000
Received: by outflank-mailman (input) for mailman id 712427;
 Fri, 26 Apr 2024 06:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0Exq-0006iQ-EL
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:21:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e1013d5-0395-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 08:21:39 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5200202c1bso227239866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 23:21:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r18-20020a17090638d200b00a589ce6803asm2390184ejd.110.2024.04.25.23.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:21:39 -0700 (PDT)
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
X-Inumbo-ID: 3e1013d5-0395-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714112499; x=1714717299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bo945Wr2gNWf2DfoA1ZrSWqPXlV9nyZIWtCd2IcaRmE=;
        b=X4gOhGLwvaovJuqy/S/4mb272LHUIbrGaYVNjjgmFZKegFAqcw18a8Li0DO/zWWKnA
         Ndb0RuBsgWWo2whfrN7zlofQ80vyCplaTBde2WPL0JWqXKrMhu94nQqrHxZMyF8bAzw/
         gTeRSZjScoELVQfrDnZLkT4kUluuE5TY1rVMvJ8MU9tGu3wsdGwKJ7CG7FxSgF6FFGFB
         efhHGTZHA4YsdTZXTtyw7TLrplcADoQ1unixbrCYgiISZ32rL69yVxoLnNKN+9Ed6OpI
         jptsajOpCHH7vKTrDlqEZC//bMdBk506pNbruaImPAwHYMreLyqgrO0Ya2XVVvjBHiSQ
         9mLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714112499; x=1714717299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bo945Wr2gNWf2DfoA1ZrSWqPXlV9nyZIWtCd2IcaRmE=;
        b=e0gApiaRb5oeKKZzD4CtFARbbNTa9zNdlyT3HgAdQxxfvPV7Yl3pJu/2zM3Rh6hM/e
         y5GivHlbslLZkPhI0WPReMwYDKoV80PwD71qgw3GaxnnxmmdGWuDIaLVxz7ZqhoCWKkO
         ZqkuXWvLZsTorDexGTKUFVZnRsvR6x2X0oXClR9VyTBZrg5S35N1gC1Qf8e0CbtSXrCa
         nkTkSeHcMBD19FWcjv/w7Nm2lUPuxjD7ZXZsyjZOMg8xX17dRnw9Wk1vtH0x8ZPHUC97
         48mqqbM5JRy7HiKOO9zIsGwG7EdqmhjNOV+jLL1aWeu9Q3QSnpywp7YyBmAmRLrIyApQ
         zTNA==
X-Forwarded-Encrypted: i=1; AJvYcCUCNuDJRCllGPu+NbvNlOWyYbg/0cSYnJzVM+KQwJ/YT8hYS8cTHhjxYkSs5621XKlS/2kkKCjvBtl264wNtj6dtw0GOQuzANNXsSmIP9A=
X-Gm-Message-State: AOJu0YwP0yrEqkKO/0m/uzN05SV3eH8JGCgJDAw0KYt/k02FK+M819I5
	DPB4B8c1KpZM55rXnbiCKKXkW9ZtPhXTfAJ3EZpLVUlk8b384X2TOcGUWg2ZtA==
X-Google-Smtp-Source: AGHT+IFACrloN1Qq+3GQc2oY6ksw+9+7a74lUcf5JNiu1wAhf+TOxf/TWrDxnwuuK9tJrKx9kbRYog==
X-Received: by 2002:a17:906:e87:b0:a58:8786:5ab9 with SMTP id p7-20020a1709060e8700b00a5887865ab9mr1939679ejf.26.1714112499286;
        Thu, 25 Apr 2024 23:21:39 -0700 (PDT)
Message-ID: <3af4f1c7-9059-436b-9449-94bd7aad9eed@suse.com>
Date: Fri, 26 Apr 2024 08:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-3-xin.wang2@amd.com>
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
In-Reply-To: <20240426031455.579637-3-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 05:14, Henry Wang wrote:
> --- a/xen/include/public/hvm/params.h
> +++ b/xen/include/public/hvm/params.h
> @@ -76,6 +76,7 @@
>   */
>  #define HVM_PARAM_STORE_PFN    1
>  #define HVM_PARAM_STORE_EVTCHN 2
> +#define HVM_PARAM_MAGIC_BASE_PFN    3
>  
>  #define HVM_PARAM_IOREQ_PFN    5

Considering all adjacent values are used, it is overwhelmingly likely that
3 was once used, too. Such re-use needs to be done carefully. Since you
need this for Arm only, that's likely okay, but doesn't go without (a)
saying and (b) considering the possible future case of dom0less becoming
arch-agnostic, or hyperlaunch wanting to extend the scope. Plus (c) imo
this also needs at least a comment, maybe even an #ifdef, seeing how x86-
focused most of the rest of this header is.

Jan

