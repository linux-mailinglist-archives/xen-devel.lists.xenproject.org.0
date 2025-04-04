Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28968A7B826
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937783.1338670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bGZ-0005wN-CY; Fri, 04 Apr 2025 07:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937783.1338670; Fri, 04 Apr 2025 07:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bGZ-0005v9-9m; Fri, 04 Apr 2025 07:15:03 +0000
Received: by outflank-mailman (input) for mailman id 937783;
 Fri, 04 Apr 2025 07:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0bGY-0005v3-Hk
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:15:02 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 854cb93f-1124-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 09:15:00 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso11772905e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:15:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec3174cf0sm39619435e9.0.2025.04.04.00.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:14:59 -0700 (PDT)
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
X-Inumbo-ID: 854cb93f-1124-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743750900; x=1744355700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TsSqE5qEVthIS9WBDBAL9NQk8rriV1c+RZxCh5djVj8=;
        b=WoHvDqFAikHFRTRJGQ5xyg8xBnJ3LjlFss5RCJ9RDAKoeKq15+MmZLygt6dnbUEq0c
         ZIEQqsQC6BFmjGGGrNqFfQBz86maPmO5/WpunaUrcFH+/mw4Q/NRxQqzph8RPu7N4hbU
         yH6yqPUhTietndrklWx71xH6R7cDy7iKo3QJ4jENu3E7mo+5TCoGugloLJZx9YzJzrxM
         LTDHEOk7/XTbdl5Tx114NmbQ1ZHpZGS7h7GQFHRKDj8rnB6yVSrfh1zZ7tT8AqQwhnuM
         6uvh3PcadDVP5RfvWiDmmrJBZdDqOfyho9KxeiXpP9XeuEg68RQzEUlLdxVsP62QQ0KZ
         qujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743750900; x=1744355700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsSqE5qEVthIS9WBDBAL9NQk8rriV1c+RZxCh5djVj8=;
        b=Ko4oz+enO10mNsT3QWTvw3XrBs8vSEyN3Qy/oFtlPscCW4pGQLSNMcOkCaZxvUAd+P
         zqZlN4zUtLZveZh+ARDThTRVtat4AI55cvcDXrQrJZwP4solIpF/lleA+9OhtU5EzF95
         JxbFd3bSFjfMSWq+42PcZcOtOi96YNmXoAng+Y75xXGy5gocfOyv6Bvq0G7Q4NLXdwHi
         vWr6WwJZm3GffAaxfl2mCWpTHxsVeCc4PpvoVYPJ7rOfMqXAHJ91/Lvy1033ntsVq+Od
         EeZNec/czNe30ah9iLiSBcZpYN4pUANcHaNtIYDNklfGT7reBAwEOIA/nT9bYy53efq0
         aVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr+QvzO3XkvbGqLH2qo9PL8uM0Vl+s4fBCCP52BHuuUVh51bp1hPuJdVIly8ZO9KTMg9URP8uFz54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqA9NUNHNOLFCkdlfK3hDcdbVOt5XfGze/elxRwunTB8gH6CZy
	CCfzbkUr8Pe/QaCbPpMQ50gcQMIau7B1XGFpK4cNAs8E7kVekZ9KfWJKJfHRdA==
X-Gm-Gg: ASbGncv+Gy/+jMPih8YymbAt8KUDQ9fY0G5o6mjxfnkz4jntVgLfiqpJjmdANaWClcn
	pJwQxqnKsdvYJD+n9g+uJWsBYTfBz0ZYARNH81bXurjXWwL0dSQs5X0/N+3XO+h5MpAo0RUVu42
	jcDjmbHLO1VtDxVqO9eKY6TFYioltzB4NBANhAZIBU0GIpM+22ATdWv2igJgU2viXk2a9r/a+D6
	sx0FOU1zcsVecwrvN213812k6vRz5yJwBr4drZq2hC5KV5VM+54LjukuidJ929wNN5T9cWFeJvE
	rghZgux5CS6GYcQnFrw0jBXaXDDXELv3/7z53QAkReMZZqFr1NySfa8ekM7shYE5kiEhsNMSo2A
	CFU7pFGwXfPx9RW5QpDZdUhhN/wGMew==
X-Google-Smtp-Source: AGHT+IFD8tDWCbnnTCZNkOjcxWMDiNdE3fzZqDHQkr39NzAOb2Gz8SlC6SGz8bD7VFxHDI0dFXtW+Q==
X-Received: by 2002:a05:600c:c07:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43ed0db3c4bmr17435485e9.30.1743750899714;
        Fri, 04 Apr 2025 00:14:59 -0700 (PDT)
Message-ID: <05063353-93c6-4ca6-8155-bf42bd23bacd@suse.com>
Date: Fri, 4 Apr 2025 09:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/vmx: rework VMX wrappers to use `asm goto()`
To: dmkhn@proton.me
Cc: anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250403182250.3329498-1-dmukhin@ford.com>
 <20250403182250.3329498-7-dmukhin@ford.com>
 <c452a1d7-4a57-4c5f-8a83-36a74ff228ec@citrix.com>
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
In-Reply-To: <c452a1d7-4a57-4c5f-8a83-36a74ff228ec@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 22:10, Andrew Cooper wrote:
> On 03/04/2025 7:23 pm, dmkhn@proton.me wrote:
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -294,54 +294,57 @@ extern uint8_t posted_intr_vector;
>>  
>>  static always_inline void __vmptrld(u64 addr)
>>  {
>> -    asm volatile ( "vmptrld %0\n"
>> -                   /* CF==1 or ZF==1 --> BUG() */
>> -                   UNLIKELY_START(be, vmptrld)
>> -                   _ASM_BUGFRAME_TEXT(0)
>> -                   UNLIKELY_END_SECTION
>> -                   :
>> -                   : "m" (addr),
>> -                     _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__, __FILE__, 0)
>> -                   : "memory" );
>> +    asm goto ( "vmptrld %[addr]\n"
>> +               "jbe %l[vmfail]\n\t"
> 
> Also cosmetic, but the very final line in the asm block ideally doesn't
> want the \n\t.

And to clarify (Andrew gave a similar comment elsewhere) the \t instead
wants to appear on the first of these two lines.

Jan

