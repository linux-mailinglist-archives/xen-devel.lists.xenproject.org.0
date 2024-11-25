Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDCB9D8A65
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:32:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842956.1258617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFc0g-0005HY-BZ; Mon, 25 Nov 2024 16:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842956.1258617; Mon, 25 Nov 2024 16:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFc0g-0005FT-8z; Mon, 25 Nov 2024 16:32:26 +0000
Received: by outflank-mailman (input) for mailman id 842956;
 Mon, 25 Nov 2024 16:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFc0e-0005E4-N1
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:32:24 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d840d32a-ab4a-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 17:32:21 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso43076875e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 08:32:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349f9eca01sm42460805e9.29.2024.11.25.08.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 08:32:20 -0800 (PST)
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
X-Inumbo-ID: d840d32a-ab4a-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ4NDBkMzJhLWFiNGEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTUyMzQxLjc4Nzk2Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732552341; x=1733157141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+aUzzZ4EoRwBDIUqEAHn5XCekDXQD4QhemrWFLVbiKo=;
        b=KtJFMIGgqQ4azMdZ5Wwa7AwJ5Pkfh+gU90/thwCdu5dUFmNr64Kvb8GN6CFQCf2urw
         jJhZPvs3UUngH3qs/ZjQP29XFm07U90aQl71JPNjVQnFuDm6Fqk+NkVZqn8Pn6l/9hKS
         oNdTp1qrGFF8gWVAe8mY1RyMSLpLIbNdSEdgjXuWZiXHg+yeNoBGP5GPFvOUuHWRTX+w
         ntAsQlCIPs7uGb+Epg4nKcEcnUYD4KLbLxj0cHX1/unD+l4v8zeLfB8ZoDWiR6PhdB8+
         ZdVqqFl+giFY4l+/gWBkp0CaB8PIQ+faXUmE8iLfDNjoJlaHJLk5ffbqggtHgZdmNMmc
         +uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732552341; x=1733157141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aUzzZ4EoRwBDIUqEAHn5XCekDXQD4QhemrWFLVbiKo=;
        b=YZ0mjQBJbRr39/HbZ3iOHsu+ZtLiPY8ht5LViK5wepyaonJI0ZCs5PFjXl+PNlB7aG
         6kNQJqQQg5fgSgtB8h/Ju5YIODXavRDkVoFEKJiJjBbZYbMrjQAS2d/K5bR/OUOWng0h
         qOjKyVEW/REtcBF2IAx+C2m9ArpOwZ7H4WvSYLWVnryRqpErsbRBgEXMMQxdfozZ20t6
         Fc4AxDeFu0J9t9hhJjx5wM8uYDv6zeTiQPYJ9DdFkL/8u9vkUrTATjLSu4zkEIwu2mhG
         bRrln3SgnRkdnMP9gzXuZ7v6uaWC3dVLB6lpXuyAxDGtInJ+sEDr58Yh8gGeMUa+QqyB
         NOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL07KtqzzWB69xlJLMQDLWOHr6cZtVPZ9GjvWg8Iod1Be9AjduLl08zzOlIhPhlAu0HUDlPIJCnsI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQvAwdkNHL25x44haaWFvfYDleBixBuQSDddeuHjfu6iY9cqGs
	tthslUwbhSS57iDQ/BzUnrTaV3f6gzIWG6a+IsEqv1vkJ2/z92R/ZMXsval3mw==
X-Gm-Gg: ASbGncuO/s1+P8e8aDvlSNgspiKQKNuKTo3FSmS6EAi4nGK7g12q7I7xrJ3YYMcn70Q
	yulviDVRu5zbW5ywQ8VaGTOdBLhfZKj4RvVxhxf++pkD8454DWTKQwVZukND74N8nD97NL8OH4g
	BeJN/KKcR50zCZYnZoEYjqhA6fwE8pB4bWWEROSDRERivxWC4qe1jhQ2Si8TmlKnfMMaaf8oG0s
	T6C7ssXbfX1JTAQTrmLjG8Aqo2ZFWHdehdr306k+Ku2EPnZ7V6DH6Dwa9vSnvKtJwEweYmng6UZ
	aWK7MZSL6DLsGEfuJR+RGGxgKrmPnWTDrpk=
X-Google-Smtp-Source: AGHT+IE+KCSJIM7CGWuvjyTd8vVpl+/3Viv1CBrUzjlsjV3FBPZN+qI5xUGl0ONUEHv83d97j6bpHA==
X-Received: by 2002:a05:600c:3ac9:b0:431:537d:b3b4 with SMTP id 5b1f17b1804b1-433ce42548fmr114932625e9.11.1732552341158;
        Mon, 25 Nov 2024 08:32:21 -0800 (PST)
Message-ID: <ca91b717-47c3-4f92-af6a-cb740ef6e91d@suse.com>
Date: Mon, 25 Nov 2024 17:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
To: Luca Fancellu <luca.fancellu@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-5-luca.fancellu@arm.com>
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
In-Reply-To: <20241119085806.805142-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 09:58, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> If Xenheap is statically configured in Device Tree, its size is
> definite. So, the memory shall not be given back into static heap, like
> it's normally done in free_init_memory, etc, once the initialization
> is finished.

I'm somewhat confused by the use of "back" here? Isn't the change all
about init-time behavior, i.e. memory that's handed to the allocator for
the very first time? Else I may be misunderstanding something here, in
which case I'd like to ask for the description to be refined.

> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -132,7 +132,6 @@ struct bootinfo {
>  #ifdef CONFIG_STATIC_SHM
>      struct shared_meminfo shmem;
>  #endif
> -    bool static_heap;
>  };
>  
>  #ifdef CONFIG_ACPI
> @@ -157,6 +156,10 @@ struct bootinfo {
>  
>  extern struct bootinfo bootinfo;
>  
> +#ifdef CONFIG_STATIC_MEMORY
> +extern bool static_heap;
> +#endif

Just to double check Misra-wise: Is there a guarantee that this header will
always be included by page-alloc.c, so that the definition of the symbol
has an earlier declaration already visible? I ask because this header
doesn't look like one where symbols defined in page-alloc.c would normally
be declared. And I sincerely hope that this header isn't one of those that
end up being included virtually everywhere.

> @@ -206,4 +209,13 @@ static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
>  }
>  #endif
>  
> +static inline bool xen_is_using_staticheap(void)
> +{
> +#ifdef CONFIG_STATIC_MEMORY
> +    return static_heap;
> +#else
> +    return false;
> +#endif
> +}

As to naming: How about using_static_heap()? The xen_ prefix doesn't look to
be carrying any useful information, and the then remaining is_ prefix would
be largely redundant with "using". Plus there surely wants to be a separator
between "static" and "heap".

Jan

