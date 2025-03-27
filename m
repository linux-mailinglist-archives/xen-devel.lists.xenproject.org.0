Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E786A73370
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 14:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929317.1331933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnQ5-00071t-HE; Thu, 27 Mar 2025 13:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929317.1331933; Thu, 27 Mar 2025 13:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txnQ5-0006zR-DC; Thu, 27 Mar 2025 13:37:17 +0000
Received: by outflank-mailman (input) for mailman id 929317;
 Thu, 27 Mar 2025 13:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txnQ3-0006z9-65
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 13:37:15 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c74471-0b10-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 14:37:14 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso7461575e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 06:37:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6450sm20105935f8f.70.2025.03.27.06.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 06:37:13 -0700 (PDT)
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
X-Inumbo-ID: 97c74471-0b10-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743082634; x=1743687434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m0BM/e4+m0sfYFFxbWW/loFogDa2oSvCgViKMm3UnLA=;
        b=CX6lVnRFvxgh6m9uPb5cr6cSiS1CKrdeeY6OjGD5BZMgrkbDmRoP29NisDwm5Npppb
         zNirJ3pHB77k/5fbxs/eKzlo+hojrPcdFzAutoQBjD4H1v8z5eiXsgN2cV9H3qYonYRJ
         Vgs5WUhLKtsml7jWbuL9u/TjeXU++Je0d+/KnrIzaaG9QsUnOPFfZcFJBwFSWPFsdUk2
         Cv81HxxHcrsZWu6OjEmGa8j48ABrwHA5+1GXjvc3wTY6wYLFKygLRfo5ngplYitqD2Y4
         zp2DDelMYcTD0GknVoKAbDqzni530/xDo6XlPfEAymmZNCDXiFI8HKeamI+r/MW9mdMq
         Qyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082634; x=1743687434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0BM/e4+m0sfYFFxbWW/loFogDa2oSvCgViKMm3UnLA=;
        b=PLwT8lsrae3WhbbFhOV7Lhzr/EkUR9yFmkgX7Yhkyw1nZO8Y23qoJJYGd7K5FVN4kL
         c6kc+kJYwpICDtAld7w+nmXoyyUZlIEUuPdyCoAHuvNozvW+dilDBH6zfDsqlSCbnYzF
         MTQIwhwOTNmlaoV5/t6njFHmNQ2XU7mJMhT8GGZ4PCxDQsDco0jS576u2xWIG5PE0y7k
         FhFEJiOu7nINavP4p91gG3nkadBhBfkSHrOlaI1rtUbtxQxqdOo4Xwpy1hxJ0F1l3OtE
         cQz4B4tkT6WB+k6FtQ5CUslU2XBvF36e/duVQjrF9Mi25Kn0CawvfFU94Dr6wLVqKU8K
         8Vow==
X-Forwarded-Encrypted: i=1; AJvYcCWoSlPHmsaZ8or5/NA+7CO2ymJGPpjbs7/l5Cy9AGCB9GEf8OZPoMkMy6Vs8BsV2dgC4sckhGJWeuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw8pvjC0GQY1JrI4P0nRaz+OwfGbSc/EnuLBKPVZvqLBj17O41
	EIfo5GLL3UJGripQeBTE4YXxDLusEfXBPFM9fubgH72+ok9Cb4WYF5Y1AR7oYg==
X-Gm-Gg: ASbGncsACoro1PemL5BbjhbJFvugBqS6o1+Q4nXr5myh9/M3AHYmeg09qAceefZLxA9
	BL8UHBoKH83M/gbr50p7wXHw7wowMqvY7XOgy7yVW6ZxMvMmrjL5vFXyeIyitGxnqBtGcIJFs6s
	sIDMLnolr8hQCYynZpOIQUwYdHqyyNbSJZwrWV/oFlU2eOyoP/uNo0N8wkUOs0AxLvCdibDEsql
	5nM4rv0Oh/SumeWjoiYZqFgjlV8V1HrwQl80UGr1XTWTOR3HpOgTr5IQTnhpRjHQuRvKrSQqNJy
	zZn88XmBO7R/bQnzsmBvFNNydNx8dTmXk70bOWigfyPdX82fDaL6jAQ/jeAQ9kbbRdaUOrdY99f
	rrVIgnoEgyDzMIZ+gCR24/jinJXZ39A==
X-Google-Smtp-Source: AGHT+IG9dCQXpi3tlLPe438JDYj5PV2qmF5FxxPmlxY3FOa3wpXBiEC5UYSh/o5DjiC/PzCjknAODQ==
X-Received: by 2002:a5d:588a:0:b0:38f:3b9b:6f91 with SMTP id ffacd0b85a97d-39ad1746a30mr2580419f8f.12.1743082633633;
        Thu, 27 Mar 2025 06:37:13 -0700 (PDT)
Message-ID: <f294e2b1-db03-46b2-b46d-61e89b55cef3@suse.com>
Date: Thu, 27 Mar 2025 14:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <8046d3c4-c00e-4322-b665-81614af89f13@suse.com>
 <34c4ba5e-3d06-45af-9c73-e4f160f6d74e@gmail.com>
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
In-Reply-To: <34c4ba5e-3d06-45af-9c73-e4f160f6d74e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 13:51, Oleksii Kurochko wrote:
> 
> On 3/27/25 9:18 AM, Jan Beulich wrote:
>> On 26.03.2025 18:47, Oleksii Kurochko wrote:
>>> --- a/xen/include/xen/config.h
>>> +++ b/xen/include/xen/config.h
>>> @@ -98,4 +98,13 @@
>>>   #define ZERO_BLOCK_PTR ((void *)-1L)
>>>   #endif
>>>   
>>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>>> +
>>> +#define BITS_PER_BYTE   __CHAR_BIT__
>>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>>> +
>>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
>> Just one remark here: Imo this needs to come with a comment, as alignment and
>> size aren't necessarily tied together. It's merely that we assume that
>> sizeof(void *) == __alignof(void *).
> 
> I will added the following comment then:
> /* it is assumed that sizeof(void *) == __alignof(void *) */

Ftaod - starting with a capital letter, to be in line with ./CODING_STYLE.

Jan

