Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FAFA18CBF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 08:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875791.1286213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taV7w-0007HY-35; Wed, 22 Jan 2025 07:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875791.1286213; Wed, 22 Jan 2025 07:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taV7v-0007Eh-W3; Wed, 22 Jan 2025 07:26:15 +0000
Received: by outflank-mailman (input) for mailman id 875791;
 Wed, 22 Jan 2025 07:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taV7t-0007Eb-Si
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 07:26:13 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27ac1d29-d892-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 08:26:11 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso44995245e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 23:26:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf327e06asm15730131f8f.95.2025.01.21.23.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 23:26:08 -0800 (PST)
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
X-Inumbo-ID: 27ac1d29-d892-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737530771; x=1738135571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uXON6t7AxhOnqd0US4WwWK/Pgdlb8dqLkOOvl3UraWs=;
        b=OcFJ+Lyq2W5AFwvmJj57rXSICal/KqucmQ+j1umToi+qdO3dbdU50WRk4c2SEf2xYe
         N6SxN5Egw464zIfZ2eLjDgkVSvtSt2cEo/D6aWabztuuu3HYUAzBG5z90NqQWj6oOhsl
         0yZZruEJ5EQKE6TLSRaSU7WBmUSjXW5tDyT2jCkbiKOXWbXuaV5ESSipwfOQEz3sFHV4
         tp0obEk4nWQO4mKuW8YutISiaSjoWRA9Nm004rCGLIB0uT6aQEsKZjPXzN0fHw6GM9t5
         kVsbLUwRR8Gfh/BtlRw/L1KSE6xyTja8BnNI3caCEuM5IUYtxCDNmYGJtH6SWFtvJe9V
         TF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737530771; x=1738135571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXON6t7AxhOnqd0US4WwWK/Pgdlb8dqLkOOvl3UraWs=;
        b=EN+LsEsObswleF8PS39SFQFm65e4K/1Mjo0/9vDbX84w98ffjIbME+rT9/0Tb+4V7Z
         QKeXol+F4bWHfWYQ4yQfvbzxjJpFpXZN0QH1iQMsNOFqykDvwFX7Cl4w0b7qUknVMpHM
         biVIldElh9OtMLcIhN1stWONqucgyjRayO9bs5b9Kt0HBuXVcHW9wSi/L9wFjx1mYslf
         tRZqcZSSzL2hhzwA/xdHfOBChBI/x/OWyrsllvjpx/vbFMv0u2GnPpVTmciEA3175O/h
         y0uyq+D91UqyXygSJdBc/ymQSQE102tGLRAzLTqnWSiom71KaRNT35cLwvfS7kxAtlqb
         LzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXva91dnzyTZ4KQ7bnbt7HtLPbc77NuTvRCmoEl/BSHtYO+5Uj4jaQrbK+/H2FijojH/usjajM7J3o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCAE57YP/2gIibC3K/CJABDogc1xuPbYe+0gSBSX//1YWIr8cA
	AhmFIl9NICty+yB8FB2ATVTKD0t4A8gq7Iv5Hooq7785GJUNj+1rQ00wts9Xkw==
X-Gm-Gg: ASbGncuOgnfBWyK6CMX5LsqmbTb1n8liVWSCp8uZY70WSpnw8aMpweb1f6abQl/eU3j
	tCRjQrD8TzkgbrlWl0Gy3dOhY45NT+6CGDDwrXzAzDdt2iChCWXYfF0jgDIJDYkFS63UvJyhAL5
	b/XGbqq0KcDrq1gcOMmjKScpwlYA2JENffvKUZdxCVBt1AeUPW7DFZvTlLMKX84ocjq7swc74jg
	A0+sxyYcC12ZpR7IZ33AzWkQ3SA3WOF6NhIvjE1RVPHM+dV1JOrBq1fB41NG7r2QnZ4ctf6DKHN
	SeKbq1wCgX0d/WlN6RS3i609EMoHpK7DvSVPmD8CjfkJQN+E4N98ATc=
X-Google-Smtp-Source: AGHT+IFXOLvBP+gbmo2rvCn94gz6toag1PleudUe00XW4enwQFjr5EhSWaVywxlq3lYSQ/lK0vE2/A==
X-Received: by 2002:adf:f788:0:b0:38a:41c9:8544 with SMTP id ffacd0b85a97d-38bf57a2838mr12894564f8f.37.1737530768580;
        Tue, 21 Jan 2025 23:26:08 -0800 (PST)
Message-ID: <68e3da06-2b21-4f42-8d24-2743290ac562@suse.com>
Date: Wed, 22 Jan 2025 08:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/24] arm/vuart: move vpl011-related code to vpl011
 emulator
To: Jason Andryuk <jason.andryuk@amd.com>, dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-2-c5d36b31d66c@ford.com>
 <99bda095-391e-4825-9bb4-c21b7c5e1813@amd.com>
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
In-Reply-To: <99bda095-391e-4825-9bb4-c21b7c5e1813@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2025 23:56, Jason Andryuk wrote:
> On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
> 
>> @@ -579,6 +571,9 @@ static void __serial_rx(char c)
>>       if ( pv_shim && pv_console )
>>           consoled_guest_tx(c);
>>   #endif
>> +
>> +    if ( rc )
>> +        printk(KERN_ERR "d%pd: failed to process console input: %d\n", d, rc);
>>   }
>>   
>>   static void cf_check serial_rx(char c)
>>
> 
> This will print the ENOSPC that was formerly silent.  Since this is 
> input from the console, that seems more informative to the user and okay 
> to me.

I don't view this as okay. For one it needs to be a guest log level, such
that rate limiting can suitably suppress too many of these messages in a
short time (which in particular might happen if the ENOSPC reason isn't
dealt with by the receiving domain). And then I wonder whether this
wouldn't better be even more strongly limited, perhaps to just once per
domain.

I'm also unconvinced of KERN_ERR - from Xen's perspective nothing error-
like has happened, once again most notably for the ENOSPC case. I'd view
this as a warning at best.

Finally: Why d%pd? It ought to be just %pd.

Jan

