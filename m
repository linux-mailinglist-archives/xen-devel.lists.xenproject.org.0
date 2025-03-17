Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12265A65825
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:33:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917479.1322388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDOk-0003RC-Ak; Mon, 17 Mar 2025 16:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917479.1322388; Mon, 17 Mar 2025 16:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDOk-0003PV-7F; Mon, 17 Mar 2025 16:33:06 +0000
Received: by outflank-mailman (input) for mailman id 917479;
 Mon, 17 Mar 2025 16:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuDOj-0003PP-NS
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:33:05 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f7df372-034d-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:33:03 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so14808275e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:33:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm15664227f8f.31.2025.03.17.09.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:33:02 -0700 (PDT)
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
X-Inumbo-ID: 7f7df372-034d-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742229183; x=1742833983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UUPIuXbgojsFkfSS33DanfFpA4pcf9t302qVRhBlNTM=;
        b=Kt/LZ8HLGaLUMOTSGPG5MRuzShxyaZQrfc9/tKG+TTLJmjYzrOCh182n4KUsk4FYmE
         AVRAoxwsP/0O1JzN5WCPIZlWN/RK95bkAe/QXQWpueJkgZHNOs/qa/Ad2OHQ7jFF30ys
         GursTIwtb6eGmbkw6o4o0ZVfVJF8LomS5pVcmrpgy2HUIQrt6yLuJB6c5hQ0uhuLY8F1
         S9wca1Gv9Ov7FE+1MWfaebkPojLQSEi99fC+PfUzlsBLGFzb/Ho1JW4rC1eptEJMuW6h
         olLPNj96bxjw+WffsBsII9pYcFdh9tQosm09P8BCyDp9kmccxkzuAKwoDSMa4YBc4czn
         jJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742229183; x=1742833983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUPIuXbgojsFkfSS33DanfFpA4pcf9t302qVRhBlNTM=;
        b=WGm+FaRGUQEMrOrgW/kiF/wcFsbX0AUfF2ibgViD07S0a96+7fP/Zz4+6RN5u6mbeU
         Wn/ZNPBndq1ql5x59Dx/ExeHsfV5h7/h6oLHiOiSQBN0tiHYgCAJYtaf3JfqygfEI16X
         8UDxPxIWl4tQCHM897ULrNl5XezwVk9tx88zWWxvhfLe/NL10AO09xsS8dXKSreEh8GS
         Txnh1sYS0Tk35qDRTzLbb5jJuJhh6nrvWDvDhSUk5HCjq/vqQJx3lYJq+p6F3TNg+WrL
         +I5WtFwikwCiw2cprYlraR8BSWDX7M0bX0Ets1cAdhTVJeNNt/V4OVygFrosYk4DMhmF
         ToXg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2bFIrbyJNLLaDMw+dHvzPS4BuOpnTczbORCfTRRK5UTy1MvaZaLRpRdCcRK5z/R9DJZxZdoVUpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxY4YJ5J8LBrYjSyeXnc60sCOEhC1P6TUqmYGCAFi65CNkAS1U2
	2YdjXNmQ89ZhUBffPEYR9Cnw/lwRjOgsYLSWa+d6liPyas1nNG77r7j72f/kSw==
X-Gm-Gg: ASbGnctTqT+jmY5xgpkNMLH0ZKcqJ8sYfjQB/Qus9vh2YCjzsOQEPbhvIbvMUpm3T0+
	1WyHqiv9tKUxoDAtEoMaTwkpeCW7KVyiqj9UKLQ2vLVgL1LZsDu05xQ7YzQoAFqqdDu4XeggFBk
	nYkm5l9guQGgi3ml8YMGTCI6yhonU2z5GrANJlqKbzVV/5eblCveyCKwE4BfbutEpraOnRYLSZd
	+dbHAdqSDV9TTpT5KUrswReei1TdMpolgOEK+4GEUs1p5BfevdK540r9/yjAmfNL2hp3Ft0/HJv
	p+f10QszinO8c2MUsw8LaoEZCNLuoOpwe4MxrHeZV0wUB1cvmbG/6yiR+gq5m+tBIi7wht9DtDB
	k7avpVFS7MVbDUb+kjV85rE5JyHlnQw==
X-Google-Smtp-Source: AGHT+IHvPIU7Z8bN+5O8SVljaet3pPrYhJpDisTZUeG/+u+xT4lMaC1SPiJvrJxcaPDyDbCrVJtNFw==
X-Received: by 2002:adf:a35e:0:b0:391:3aaf:1d5d with SMTP id ffacd0b85a97d-3971dbe8060mr12234133f8f.27.1742229183044;
        Mon, 17 Mar 2025 09:33:03 -0700 (PDT)
Message-ID: <314dee7c-1ee0-484a-921b-279617258325@suse.com>
Date: Mon, 17 Mar 2025 17:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] xen/memory: Mask XENMEMF_node() to 8 bits
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-2-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250314172502.53498-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 18:24, Alejandro Vallejo wrote:
> As it is, it's incredibly easy for a buggy call to XENMEMF_node() to
> unintentionally overflow into bit 17 and beyond. Prevent it by masking,
> just like MEMF_* does.

Yet then ...

> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -32,8 +32,9 @@
>  #define XENMEMF_address_bits(x)     (x)
>  #define XENMEMF_get_address_bits(x) ((x) & 0xffu)
>  /* NUMA node to allocate from. */
> -#define XENMEMF_node(x)     (((x) + 1) << 8)
> -#define XENMEMF_get_node(x) ((((x) >> 8) - 1) & 0xffu)
> +#define XENMEMF_node_mask   (0xffu)
> +#define XENMEMF_node(n)     ((((n) + 1) & XENMEMF_node_mask) << 8)

... this still won't have the intended effect: Rather than spilling into
higher bits (with a certain chance of causing an error) you now truncate
the node number, thus making the misbehavior almost certainly silent.
Further, if you do this for the node, why not also for the address bits?
(Rhetorical question; I don't really want you to do that.)

Jan

> +#define XENMEMF_get_node(f) ((((f) >> 8) - 1) & XENMEMF_node_mask)
>  /* Flag to populate physmap with populate-on-demand entries */
>  #define XENMEMF_populate_on_demand (1<<16)
>  /* Flag to request allocation only from the node specified */


