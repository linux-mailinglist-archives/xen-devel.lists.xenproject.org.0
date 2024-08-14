Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4602E951E26
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 17:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777424.1187573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seFc3-0004aa-EC; Wed, 14 Aug 2024 15:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777424.1187573; Wed, 14 Aug 2024 15:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seFc3-0004Y9-Ap; Wed, 14 Aug 2024 15:08:35 +0000
Received: by outflank-mailman (input) for mailman id 777424;
 Wed, 14 Aug 2024 15:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seFc2-0004Y3-2S
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 15:08:34 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12234260-5a4f-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 17:08:32 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bb8e62575eso7012a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 08:08:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a5e0030sm4017375a12.65.2024.08.14.08.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 08:08:31 -0700 (PDT)
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
X-Inumbo-ID: 12234260-5a4f-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723648112; x=1724252912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=InZA3udHyAMwCEcT7duDMzUbFiwvcQVmCDEYk8ZDAa0=;
        b=P0WSRCHT9sBmnV5ZD3XJUJRj8EPNy/LOKR+jwtZD5yGCPTh75ApK/ysH5yxioS09Rk
         i1lE/ZHIpsKENAhVKPpRh1hdLOQeytvi1TZmDtdhbqYN/XI0EtVV8h6NPUQS0JIZor4A
         v7SX4ZnutC8ZQsQYcPOVCzopkzG+WQddHdxnX68AMDcHsGhkZCGktF0NPWrUQhWZ5xn9
         9Q1VsB/ZvcV2UUsur7dC5YBTpoeEtCJ0k5AGaMQmoW0DD+RTyb2WQ3ho64JwlfiMQpuy
         4MhopugYX70INju0XbptEcq9bJThYFQZMMCmrv06qYHYl/YHos+i5z4QlLIInMjmAIkC
         mFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723648112; x=1724252912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InZA3udHyAMwCEcT7duDMzUbFiwvcQVmCDEYk8ZDAa0=;
        b=PtPMlFWV60LFdOTJIaCEnNrkWrGqUaEUYOXzIkN7nW6ChJXmjvr0F+QhiqNKhSLpQx
         w4pyW7FKMX5A4gSrKOKpKQwYCbNl9J5lb1K4xZMx+fhWO2OC+Cxe8rdeAps6+cyQqVvl
         kCJNVl8cpcYi9CPVGg1WXF/xRUmXqmNeCQLf34pxbP+sJQhG8VA1Ktpr/7YtnmAKVsUv
         nNTalSbxkRZNfELnz1weGkhgAFYKyh9tXqpO066l5Smr+6Jw0wNuhFw/K4mUOnX3nubA
         jdODhPX0pohCoh4AsnDbPSz9lxEN26qmsVem9DrqeTpGVU1Ud+cJbWvo2Rqiq4OtjyIo
         KzGA==
X-Forwarded-Encrypted: i=1; AJvYcCVuL1JipMqpY5T2FcjNnWX86dieerGSUbZPt2xQUnBr1GzYXkgQPP7TQOdLeWslhQ3dlhekgtEM4oMbCmeO3JOz5l9LSto7dJ/ymFnwPV8=
X-Gm-Message-State: AOJu0YwHtRH0GJGXs4FFQg6AOVZcXcEHWPBc8SYHtdmAC9PIPkwXSVEO
	sDKdLu7ga7TStj2CoZr8hbqDnE+CTWOSvEwM8dmMWP9dv7NVanB8M5sm861E3Q==
X-Google-Smtp-Source: AGHT+IH3BxPjvY5h1TT95scpEvLAQqY6I9Q2P9FLxdpzHFvmVVbddVrocwZUCG+RdGhFAmLEI9XB3w==
X-Received: by 2002:a05:6402:34d1:b0:579:73b7:b4cc with SMTP id 4fb4d7f45d1cf-5bea1c6ac1bmr2856981a12.2.1723648111865;
        Wed, 14 Aug 2024 08:08:31 -0700 (PDT)
Message-ID: <bede9f51-0278-4c97-9c0d-ee3478373d72@suse.com>
Date: Wed, 14 Aug 2024 17:08:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] xen/riscv: set up fixmap mappings
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <1c1c0f912a9abbb542baa1ce92e75d64ec8043e9.1723214540.git.oleksii.kurochko@gmail.com>
 <07f19bb5-bd76-4158-875e-48f74e427a89@suse.com>
 <9361b63712bffc7bb0cb6bb1fc5954ade18314d2.camel@gmail.com>
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
In-Reply-To: <9361b63712bffc7bb0cb6bb1fc5954ade18314d2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 16:21, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-13 at 10:22 +0200, Jan Beulich wrote:
>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/page.h
>>> +++ b/xen/arch/riscv/include/asm/page.h
>>> @@ -81,6 +81,12 @@ static inline void flush_page_to_ram(unsigned
>>> long mfn, bool sync_icache)
>>>      BUG_ON("unimplemented");
>>>  }
>>>  
>>> +/* Write a pagetable entry. */
>>> +static inline void write_pte(pte_t *p, pte_t pte)
>>> +{
>>> +    *p = pte;
>>> +}
>>
>> No use of write_atomic() here? And no read_pte() counterpart right
>> away (then
>> also properly using read_atomic())?
> I wanted to avoid the fence before "*p=pte" which in case of
> write_atomic() will be present.

Well, this goes back to write_atomic() resolving to write{b,w,l,q}() for
unclear reasons; even the comment in our atomic.h says "For some reason".
The fence there is of course getting in the way here. I keep forgetting
about that aspect, because neither x86 nor Arm has anything similar
afaics.

> Won't it be enough to use here WRITE_ONCE()?

Maybe. I'm not entirely sure.

Jan

