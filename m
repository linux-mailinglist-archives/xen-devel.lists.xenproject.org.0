Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8493F5AA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 14:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766698.1177203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYPgt-0006zv-MQ; Mon, 29 Jul 2024 12:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766698.1177203; Mon, 29 Jul 2024 12:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYPgt-0006xC-JK; Mon, 29 Jul 2024 12:41:27 +0000
Received: by outflank-mailman (input) for mailman id 766698;
 Mon, 29 Jul 2024 12:41:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYPgs-0006x0-CG
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 12:41:26 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd54d4f2-4da7-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 14:41:24 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aabb71bb2so484587466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 05:41:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab5948asm503539366b.85.2024.07.29.05.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 05:41:23 -0700 (PDT)
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
X-Inumbo-ID: dd54d4f2-4da7-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722256883; x=1722861683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YULLr0Wx5v8GFltj2CE1Q7/zDfepEGYe/jLhxXlbRk0=;
        b=ZxQ0UVLoHZ6etuTFtT8gZ55ejOZ2+X1uYTinTEGoB7MUpDLRc3fF4DA7YSHUqEpLMe
         KcgUBvW90eclqtNVw0nXwGIQdOigSVRkhwqB35ko6dOntHxi85ee6WcjBCs/st1s1zL6
         i3XCPNjqRrS7yw1bkKCdOyE/DPlt9X8ugDRo11quChn1zB9TqzSFqOYJBLXtLUn31H+q
         9MctIxoCsJhbTxLOtZPbBtjOM+iNoVgW1O7hG8778jrYCNI6zqIOUcSTFLzZnMI//uMO
         F7WNq6ziQXrnX35sXq8g4UK3LoBRMQlCiUsAfAchj6ee/45cypoOVZ69yXimGB2j879B
         /NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722256883; x=1722861683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YULLr0Wx5v8GFltj2CE1Q7/zDfepEGYe/jLhxXlbRk0=;
        b=pCh9ZAP0xgLdMXPEQVZpxP1fQwSx34Y5vms8QNl+mnpouTxDkMsim4sA2ycDetpoGE
         iKk02n8RSN8igu1VcaiL127tVFg43GSmhiBpwFbNCo1VPh6dGrivF/vm2oCLgS+ONKqt
         YHMnaB9OKoMMsNLMBjIE6x1yt3SLiORAnZtj9hfaRrp5Uhg5i8NkX828gQFDV5bwTFXn
         nrDCQg9KPeQM8C/jm1WubOYFOek87zX7BdMjm3AkpqY/ayScHHLeEhGO5uyfwkxY4q9n
         2dfZDdqc9jkON68SbArLC4lcjStrI2czTIIOQQh+F3jCRaX0lIHnvFS+3ZybAys5CJyl
         NknQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9DxHY2KA+t3YjqeE3S8s4+h9/2LLOHnRhJYZ4IpdI1uqpGE3mLza8avmFGJUcHnTLiFSSxv8+QJi+zm71QWWSUzNOu8TSuz5L8CQLNTA=
X-Gm-Message-State: AOJu0YxXLKc9VTMgWxaee/BSay3VH2v5WEoGhE7xC3n366L1lHg/Mk0N
	W5W9bTprNG6Vz5BBdI9VhdCYYxcDXClQsDfgVdC5Urs5PZq4N7StpA2VEUjqew==
X-Google-Smtp-Source: AGHT+IEcPhsa6XM2+okNKfxoIckjK2EEZ+pzr+/bgLL+wlel1TLfKSIihgG7UiaFwyTd7wC2SqaiwA==
X-Received: by 2002:a17:906:c10f:b0:a7a:a33e:47cc with SMTP id a640c23a62f3a-a7d40185a3emr544752366b.59.1722256883536;
        Mon, 29 Jul 2024 05:41:23 -0700 (PDT)
Message-ID: <2a6efb82-bde4-490b-9c72-413009e756bd@suse.com>
Date: Mon, 29 Jul 2024 14:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/altcall: further refine clang workaround
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240729103050.38401-1-roger.pau@citrix.com>
 <5f31e485-f103-4fe8-bcd5-7e5d1312e449@suse.com> <ZqeESDfcw85yJv2e@macbook>
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
In-Reply-To: <ZqeESDfcw85yJv2e@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.07.2024 14:00, Roger Pau Monné wrote:
> On Mon, Jul 29, 2024 at 12:47:09PM +0200, Jan Beulich wrote:
>> On 29.07.2024 12:30, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/alternative.h
>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>> @@ -183,13 +183,13 @@ extern void alternative_branches(void);
>>>   * https://github.com/llvm/llvm-project/issues/12579
>>>   * https://github.com/llvm/llvm-project/issues/82598
>>>   */
>>> -#define ALT_CALL_ARG(arg, n)                                            \
>>> -    register union {                                                    \
>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
>>> -        unsigned long r;                                                \
>>> -    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
>>> -        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
>>> -    }
>>> +#define ALT_CALL_ARG(arg, n)                                             \
>>> +     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
>>> +         unsigned long tmp = 0;                                          \
>>> +         *(typeof(arg) *)&tmp = (arg);                                   \
>>> +         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
>>
>> With this, even more so than before, I think the type of tmp would better
>> be void * (or the BUILD_BUG_ON() be made use unsigned long, yet I consider
>> that less desirable).
> 
> Won't using void * be uglier, as we then need to cast the last tmp
> statement to unsigned long?

Only if we stick to using unsigned long for a ## n ## _. Afaics there's
nothing wrong with making that void *, too.

Jan

