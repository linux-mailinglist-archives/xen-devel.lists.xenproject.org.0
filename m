Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EEDC80EB7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:09:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171112.1496139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXG1-0006Lb-DN; Mon, 24 Nov 2025 14:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171112.1496139; Mon, 24 Nov 2025 14:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXG1-0006IU-AI; Mon, 24 Nov 2025 14:09:33 +0000
Received: by outflank-mailman (input) for mailman id 1171112;
 Mon, 24 Nov 2025 14:09:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNXG0-0006IO-Pm
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:09:32 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31a8797e-c93f-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 15:09:30 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so43338975e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 06:09:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf355933sm204587465e9.2.2025.11.24.06.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 06:09:29 -0800 (PST)
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
X-Inumbo-ID: 31a8797e-c93f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763993370; x=1764598170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=urPv6yEaucr2kDu/N+cWy7DIUBkfIijypwCbMj4VoGI=;
        b=Lmh/12bu+S3AiprlBNwdvLp3UUVEhnT9x3DZCaKPuK/xM0ao2IpIOIWGCHft7RL0FJ
         PTKQ+nERJakW9KcQ7TYR8UsmLqxpJWZO445BNEGFHMVikR5ZA8L+1aEESln2qboAO8k6
         pzuNyf+4QCsXEPpeVaNEq3XFft8STHyY+hL4KJykuYGy1PTfL2YI16Bd+43OZZU1Hbvp
         a5n9x72oDRqCnOJJLdD0VzWipwEe0+uMmtO0ptokYn4GaJbCgnruiaSpENiRLcjtOLRO
         I7QO4MUttbEk5sow2iAPXpNMDgXOuKaKfyOQjcNrgS7dhf1l8cci1pj3of8Mh9XKc0PX
         wb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763993370; x=1764598170;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urPv6yEaucr2kDu/N+cWy7DIUBkfIijypwCbMj4VoGI=;
        b=XnsEbN+bOzFr3XZfKIEvS1hdzaeCPx/VgFDfkG9B3okTxcZX3nNwwpVuQuLqaRReQk
         BbfgpAdeA62Cey5+/ufVhNHVbKMCtc2oZ3hBk4hBQXyCp2VevkpWP4xrdlQ27vI3Yt2Z
         dOlI42L13sVUjzUPF0xJ39RVhG+aGVYv9/9dTWKV3wAyLM1bSRa2XgxR6ueFMGqYs7+H
         HWDgaNlK2LQn+kwBMsmXgwhr1GF7oAcwZgeLbvbTckv48L/NNiAtkiBMRPfSef5mdYQo
         vs114Yj+beyJMLJtz0rx+uXAjNB/4uDlh85OzdndLKS9kNWsXAkF2y7pgUX5sCBsBZSH
         qCIg==
X-Forwarded-Encrypted: i=1; AJvYcCVDpQKY+OUCN+QJead/NPBDBgGmjDVftCVj/y8yOkQcHU7RxAx5W4ZOnqjbPKtocxnnREOQF8FCQIg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdOm53oFF9lmlz64qjO/CYNFtSYhZd5aqkvNY1xPHpDCwAyj6Y
	c5J7VCUjGS1P2L8eo/L2c2Xkk35JnAmScB/UOWqazuT25i/qTT8DcvwL6MuRdgLDiw==
X-Gm-Gg: ASbGncvpqpeXbTbBQ8Z+hb8bl3N8LeM53Jji1SzPivW27EyZ677vIY2oHL4e+tTeHt1
	fF85hbduQMX6osimvH937w1bw6IQ3I25TShaXw+wsKL9HsKf4AtiDuarGxoq6Hi6eYuG6BAswCW
	NWpcZyDFxw3J6vQRaaElkfPUVMzNpqa02VGMZw7q8TAJTDVwdQQbtdCrx6tHHRztl5l7vNYrtH4
	MN60kz2B/wKuwgHmlYPoRLhviCpXfSZnRweBYT0lhHtHfcwux38SuxtjkeSp4VWtATepVMFVHKI
	mIYUc4Pg+6au2cbMPPmVS4y9EfnIJ20FUIoiu6iGBLxfRhlcOy9QVddN+pdwnEHNz+55bQVKzBW
	hek7wmeMuEU1Ac2JyOqYvagSONt6tmZNQfJ4KS9Bviu2vJ943YMP+ndbUZjv5QRinLm6gyKxw/q
	bsTfjd1/R5xBFHp/S4uvXxdeM6Zw7r5C7dhnqnQKwABmu9h553m4Wrf/ca/lFVwhKivjCrvqOXl
	40=
X-Google-Smtp-Source: AGHT+IFyXKoBDSJHBt9GiGivnyI6vusTVrlYoAyMlSeRex+EXXYqb/a+/I4U3k23oq1uiG3oOSXiQg==
X-Received: by 2002:a05:600c:1c20:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-477c1131d60mr120622155e9.29.1763993369691;
        Mon, 24 Nov 2025 06:09:29 -0800 (PST)
Message-ID: <e9a85592-9df1-4f32-82df-20c7f069d1e2@suse.com>
Date: Mon, 24 Nov 2025 15:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen/mem_access: wrap memory access when VM_EVENT=n
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
 <20251121091554.1003315-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121091554.1003315-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 10:15, Penny Zheng wrote:
> @@ -2080,7 +2081,11 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>  #endif
>      }
>  
> -    if ( req_ptr )
> +    /*
> +     * Excessive condition is to avoid runtime undefined error only
> +     * when CONFIG_USBAN=y
> +     */
> +    if ( req_ptr && vm_event_is_enabled(curr) )
>      {

I fear the comment isn't really helpful this way. What's "excessive" here may
be clear from patch context, but it won't be clear when looking at the code
later. Nor would it then be immediately clear why the vm_event_is_enabled()
check is (seemingly) unnecessary. How about this:

"req_ptr being constant NULL when !CONFIG_VM_EVENT, CONFIG_UBSAN=y builds
 have been observed to still hit undefined-ness at runtime. Hence do a
 seemingly redundant vm_event_is_enabled() check here."

With this or any other suitable improvement to the comment:
Acked-by: Jan Beulich <jbeulich@suse.com>
If we want to go with the suggestion above, I'd be happy to do the replacement
while committing. But of course first the necessary 2nd ack will want
collecting.

Jan

