Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1871CA78B17
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935382.1336805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuQW-0003qH-Hp; Wed, 02 Apr 2025 09:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935382.1336805; Wed, 02 Apr 2025 09:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuQW-0003ni-Ef; Wed, 02 Apr 2025 09:30:28 +0000
Received: by outflank-mailman (input) for mailman id 935382;
 Wed, 02 Apr 2025 09:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzuQU-0003nc-BN
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:30:26 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ae4f222-0fa5-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:30:24 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so3319712f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:30:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6588d0sm16175757f8f.7.2025.04.02.02.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:30:23 -0700 (PDT)
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
X-Inumbo-ID: 1ae4f222-0fa5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743586224; x=1744191024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RZwtvBbefCO1sOZ9F2axG1WYO8tBhUMCAr1RvBwciM0=;
        b=a0C4+kzzSc0DeNnHjS92DRuNlf+cLfyNf7VDKlv3fIa+b9sTm/7DNS0J/47rx6AK1h
         yjn2R3a24gss3skm7IvZMrXs0am93clF2DRe0YPuzAFPQAQ9129fPKEszGtn2Z6/OAqH
         mxIV6cDj9doZIEPZhd8xQuNB21p6Ca/VWPcWzYEIGFJkU54AP4VgbyOZ8SzHqSdya7vN
         EleHkX7k0IUvvx1mxUj0OQa9Fm0tPc5U+tjnYkwIMz9tQE+m83EkMBdRW6ssN6X90wlG
         DQUquf1jV8JcegMyNlTq0dLzzBP/wJb7XARrUFuEYg04+abJZz6FHtWjtFjVmqA8+vxl
         LDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586224; x=1744191024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZwtvBbefCO1sOZ9F2axG1WYO8tBhUMCAr1RvBwciM0=;
        b=MwbQsqSp6zinmrYVxaWaIMSLMY9J52Hf18QcWowfd7//5X1GxSVDM7AYHY53EYOZcO
         iIZqy1teE4VN7x+hThcy3PB9Ne4ahjmSFsUtGF5ugt8icFes6Hgh19UZ5nKbRRFTtA1I
         Jcfnyn7+gY/ne9P+2gRsXt9Q6bTRnZ6pqhYRFDorukAaOjp3XvhRte2JF0yX6/+HkdZl
         AeAEiu6AJOwpQeEmp4WDT/8ggrJmBS7+BQkjfAFOA9y5CqsC0m/SKh1bGyrD5Nx+M+Mo
         6uS/YA68VAW88t0FEBy+jPoUuHPwpzLC4Bub8/S4sqHgKzhP5DMfqvsLLHTgAHcWcSGO
         059g==
X-Forwarded-Encrypted: i=1; AJvYcCXtUGdbL0p57IKSoo0uxdXB+2EmaGKAVU27y8N0t4uWlqYU0SdPw73Tr4Jio1+DFMs00NXKbMAMJA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuNkiYMfH4ELCd0/RPR4wbqFrrWea2sEbIO9ugA/OzWiaVIJAx
	5gmzRsZMYZ8tf79nbuoMm2k+WeAsLr/RxLKYg3FdKqJv6ugSxmc4VqhpldgpWw==
X-Gm-Gg: ASbGncvp1F6Q8gncjqQT6tTOTz7W6rfVjJ3JJYPPWO7v40g0XDqCJPwusAqXXNyUtfT
	bLYy502m5lZdO2jjtyWbnvFC7gCM2uUUZvRPdobg5pnMr8Xosqh/QoucOFWk0LnyxLpgWWEEBPw
	UNqgDrlDZzLZkoSNYEWomOp36qWAps0H3Vaqte8JlPaOXHCnB3NzMbyR0ppYCbjwhSEZ43ozZnA
	XUZHZUZCBXR4ZAXHlfT/n1cBjUvA1OLhDyf6rwaz9KjH8nluldBPjC1cy/CSpfetq6bc6Oe1jQ1
	fr5hTBUKXj+DU8F8ofugm6K2ebfWayzzX4i9laDmY3Nkm6hFeaewYQaVFvVleFTAWNgz03ZsfWq
	dNBe+uCpSZE1toPXl6MCaFyW/pUP/dEPH3pnmd+lf
X-Google-Smtp-Source: AGHT+IEeEXLRSVPtGrZeVbW6qUqDDZbNcl/djdxhZ4ogI/Bqaqj4tC4vu/rX+PEr072yzMyysFBwOA==
X-Received: by 2002:a5d:584c:0:b0:391:4559:8761 with SMTP id ffacd0b85a97d-39c1211394bmr13707502f8f.36.1743586223881;
        Wed, 02 Apr 2025 02:30:23 -0700 (PDT)
Message-ID: <52ae7bed-ba15-4842-b5d8-4fcb61df28b2@suse.com>
Date: Wed, 2 Apr 2025 11:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250401005008.2787764-1-stefano.stabellini@amd.com>
 <694eac75-e872-4ba0-80ed-95c14cd11f5e@suse.com>
 <87f8fc5f-ed82-4930-bc04-50106cc5acff@citrix.com>
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
In-Reply-To: <87f8fc5f-ed82-4930-bc04-50106cc5acff@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 11:21, Andrew Cooper wrote:
> On 01/04/2025 11:09 am, Jan Beulich wrote:
>> --- a/xen/common/bitmap.c
>> +++ b/xen/common/bitmap.c
>> @@ -359,12 +343,11 @@ static void bitmap_byte_to_long(unsigned
>>  
>>  #elif defined(__LITTLE_ENDIAN)
>>  
>> -static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
>> -				unsigned int nbits)
>> -{
>> -	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
>> -	clamp_last_byte(bp, nbits);
>> -}
>> +#define LITTLE_ENDIAN 1 /* For IS_ENABLED(). */
> 
> I guess I can fix this in my bswap series by giving __LITTLE_ENDIAN the
> value of 1 when it is defined ?

Hmm, that's an option, yes. Yet then I didn't pay close enough attention
to that part of the respective patch in that series, as I was blindly
assuming it to instead be

#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
# define __LITTLE_ENDIAN __ORDER_LITTLE_ENDIAN__
#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
# define __BIG_ENDIAN __ORDER_BIG_ENDIAN__
#endif

to keep the values of the symbols unaltered.

> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

