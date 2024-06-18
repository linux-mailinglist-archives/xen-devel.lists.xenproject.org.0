Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C558190C4ED
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742820.1149690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUAW-0000oK-8G; Tue, 18 Jun 2024 08:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742820.1149690; Tue, 18 Jun 2024 08:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJUAW-0000lx-4b; Tue, 18 Jun 2024 08:26:20 +0000
Received: by outflank-mailman (input) for mailman id 742820;
 Tue, 18 Jun 2024 08:26:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MUlf=NU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJUAU-0000lf-5m
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:26:18 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eab53ee-2d4c-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 10:26:17 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6e43dad8ecso897936666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:26:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da40easm593951966b.26.2024.06.18.01.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 01:26:16 -0700 (PDT)
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
X-Inumbo-ID: 6eab53ee-2d4c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718699176; x=1719303976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CcAq5yeb76TA5G66ic4dihfr2dtGNBChhAibNhJp7Co=;
        b=Zw5WRQ8+v3XUqq3Ph5NdKq/Dyu8rqW1gqFgClyCaRqbdw61gLbTSJPw0GkBqdTeRKd
         LjmlGM8gIXuWuiyoipNGxlJ1f0TSTGFSTasKaTtPbuAvtOJaxIiV/LZJG1lfG0PytL/5
         QxvmiZq9Q+ZlSxSa+Dc6m7RvxiZvS5w4Leb1+q7qRfjeCirVuF9MdTxAfhD9sojYVTa6
         +x0rNILUuyYxFOma+s2m+eugood0u1ESs0ZyITVQEVRYrPsFXVX5QGzXWqDVbQTzbQ03
         DDs5hh1bOc0NU0V4a9SN2pZ6RrjXrBIzlW8clfa3WyemQxhljHdawQs8JAttr3UJhX2E
         7jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699176; x=1719303976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcAq5yeb76TA5G66ic4dihfr2dtGNBChhAibNhJp7Co=;
        b=xT2KqcDBOLyZiSQLCiIC0DiB1DG69gHAymeSdBYrHEGlt/Plu64dIPqJa09tqqf0ce
         i0WxMHb+wzw5EBig9hUoizAuedqp3Eou5gJxhE8B+QhfTA0aJM3TdB3V0iTfvkFuyx8p
         t4OZrx3Gdd4nREURlH0DLDNw2q/R2HaTXxnatuf2xMimF0RKgfCZvMYmM+mOXIpDMWNw
         HSou+7/A435G83xXuFFQsBcnDn69Yja2S4sAmz8CxMZuhV4cSiYmTDJrbe0XUZJZdD7c
         Rh4BptrvmuNI7c4oeeepc9rmJVfVgYUGu8ZWgCvpU92bF5F3lKiosPJNR7ZIa80xwezM
         R0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBpV9bIYm7lBn+fvsrfdcbdpjkAFuYHhIhp6CC83gzezje82FpcnopRJGbG+przHcapiuUQ4KqlYomKYUJtDfTssr87cS+VI5QN+8DLLw=
X-Gm-Message-State: AOJu0Yx/UohjMHzImMk3c/Lz5DW0ifBYFEKq342yEvsUKS5trQcT+tUi
	HZrcqtRF+l9b46UMW0U27kc8tajPxNzFXMaYTaVoyDZJXGwuE8VpEbA5OKQMpQ==
X-Google-Smtp-Source: AGHT+IFwFLMRnUo8jgcrzJtZSR/iEbhZ8VfqaBORz9p25rIDdt4JiIQ7mnGF7hEznnrPbfaNwEY0Gw==
X-Received: by 2002:a17:906:66ce:b0:a6f:1285:5799 with SMTP id a640c23a62f3a-a6f9508d99bmr114658166b.36.1718699176513;
        Tue, 18 Jun 2024 01:26:16 -0700 (PDT)
Message-ID: <dfae4cdc-d445-4e1e-83f4-3b1ca790beb7@suse.com>
Date: Tue, 18 Jun 2024 10:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/8] xen/riscv: add minimal stuff to mm.h to build
 full Xen
To: "Oleksii K." <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
 <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
 <7721c1b4eb0ea76cca5460264954d40d639499b7.camel@gmail.com>
 <e80e30c9-6558-4b70-ab2f-18c34c359dae@citrix.com>
 <1b3b389156ad924f00af8af1d173b89fc533050e.camel@gmail.com>
 <fa62c314-424e-4e5b-9046-3a2e1eba654e@citrix.com>
 <0b6350f2d8cfe8f2f8f24f1f2de601f3db529335.camel@gmail.com>
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
In-Reply-To: <0b6350f2d8cfe8f2f8f24f1f2de601f3db529335.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.06.2024 10:21, Oleksii K. wrote:
> On Fri, 2024-06-14 at 10:47 +0100, Andrew Cooper wrote:
>> On 11/06/2024 7:23 pm, Oleksii K. wrote:
>>> [OPTION 1] If we accepting of loosing 4 Gb of VA then we could
>>> implement mfn_to_page() and page_to_mfn() in the following way:
>>> ```
>>>    diff --git a/xen/arch/riscv/include/asm/mm.h
>>>    b/xen/arch/riscv/include/asm/mm.h
>>>    index cc4a07a71c..fdac7e0646 100644
>>>    --- a/xen/arch/riscv/include/asm/mm.h
>>>    +++ b/xen/arch/riscv/include/asm/mm.h
>>>    @@ -107,14 +107,11 @@ struct page_info
>>>    
>>>     #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>>>    
>>>    -/* PDX of the first page in the frame table. */
>>>    -extern unsigned long frametable_base_pdx;
>>>    -
>>>     /* Convert between machine frame numbers and page-info
>>> structures.
>>> */
>>>     #define
>>> mfn_to_page(mfn)                                          
>>> \
>>>    -    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
>>>    +    (frame_table + mfn))
>>>     #define
>>> page_to_mfn(pg)                                           
>>> \
>>>    -    pdx_to_mfn((unsigned long)((pg) - frame_table) +
>>>    frametable_base_pdx)
>>>    +    ((unsigned long)((pg) - frame_table))
>>>    
>>>     static inline void *page_to_virt(const struct page_info *pg)
>>>     {
>>>    diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
>>>    index 9c0fd80588..8f6dbdc699 100644
>>>    --- a/xen/arch/riscv/mm.c
>>>    +++ b/xen/arch/riscv/mm.c
>>>    @@ -15,7 +15,7 @@
>>>     #include <asm/page.h>
>>>     #include <asm/processor.h>
>>>    
>>>    -unsigned long __ro_after_init frametable_base_pdx;
>>>     unsigned long __ro_after_init frametable_virt_end;
>>>    
>>>     struct mmu_desc {
>>> ```
>>
>> I firmly recommend option 1, especially at this point.
> Jan, as you gave your Acked before, don't you mind to define
> mfn_to_page() and page_to_mfn as mentioned above ( Option 1 )?

No, I don't mind. And please feel free to keep my ack if no other significant
changes are made.

Jan

