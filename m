Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAF99DC2BE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 12:22:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845955.1261265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGz51-0002BN-GK; Fri, 29 Nov 2024 11:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845955.1261265; Fri, 29 Nov 2024 11:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGz51-00029U-DS; Fri, 29 Nov 2024 11:22:35 +0000
Received: by outflank-mailman (input) for mailman id 845955;
 Fri, 29 Nov 2024 11:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGz4z-00029O-9B
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 11:22:33 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35b5a11a-ae44-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 12:22:25 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ffc76368c6so29337131fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 03:22:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6a7bsm165327466b.104.2024.11.29.03.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 03:22:24 -0800 (PST)
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
X-Inumbo-ID: 35b5a11a-ae44-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmYiLCJoZWxvIjoibWFpbC1sajEteDIyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM1YjVhMTFhLWFlNDQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODc5MzQ1LjU1NjkwNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732879345; x=1733484145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=81LOAsSMXEi+8JT7BTHq+q3xwjZ4MNJv87OAfCMneXY=;
        b=J/QLH9RrKaeKEyZKIgP/Ky38Q62qXxEqg/I6iCWtY0R8Eni1W9SZpNHexjJJn3xkNI
         eGgYcEUOAvsdkd7UasZbBSyW8PLXKxeCQlGiah+ZKC8DijrL4Ik7Jz5tFpdA3oGXxLum
         41PwkIcF+1O9C0mb55pFgtH4vTqBGAk5kWyVtG4RtfeznABd1kw3owhIa9FXziUCqkBZ
         +LE2e+kqAfE9hf1g1qM/0PckPtZSSSGcoX3ThUHsv3Mx57ZG1K0jxwIeDHIyyYKyh1vv
         eCFBaP1FCXoId3IXwPzoGS227SB0233mh+CucMBwRtMQxROHurIBXO8+05qcT1lMA46w
         Pydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879345; x=1733484145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81LOAsSMXEi+8JT7BTHq+q3xwjZ4MNJv87OAfCMneXY=;
        b=Czvo34wo8EiZEOQD2Tj8aRJKaXlWgCcRtnipdMeR+BBogF6ki7pZ+hBFZQgRzAtCkx
         kH8nGQIh27O9DJtskZrUEqppypcIGy6XSKLdV1lN0s871oXhWeOEgw0kPX6/+s32M5DG
         +JFtWGAsC3EStQyOcSUWU4Ov/Yxdf4svEPUevBkciIdM+thL7oQm26SGW0EjXVXlKxrN
         G68hX9j2FakhnytVXb6UMnhGqnjQMe7W5CrZWeEi8oJz3R0wxvMe/tmrdobjI8TAkuXH
         3eDxUCsEOVphuXRqDNe52vYHk8iKGt2AmIiQP+U8yQTvNMO2v/Qf+flnibGT/rcb1mNJ
         Kq2A==
X-Forwarded-Encrypted: i=1; AJvYcCVNA0UXyxpte4dsOujkFEFOkzMejUsSE2WW23Z1q6/WbELStfAJGCXI1sipkZbu10MklQEQjAP45XE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyk6WkzZ+SU9Y2/l3kIM8O+D2z59Y181E+33T3Ln/mpnM2wP/WS
	7brSpwSfzvd7Ogd9L7SIQmqHHSnnqNas4iBQrbr0cBSFU07Q8mAuXk0qwLO2sA==
X-Gm-Gg: ASbGncsLAgC9ItKE8OhZ/7WE2DtyYtA1TNxQ80N1oHUybg8Bl+h51BCVFCeO3eTGF0t
	qpBrWa4ju5n3xiz8hOQ29N15NUhXU64ypCe+r4rj5WLXPqn+9wFuIux0sdrZ3pI5avFseOtW3cv
	ZV0NYz+c0A77q6Xyv1oUCeLEyoICvJ9ouPPgusIU0N7MDuzLogk7UmVgOWIhnWtPGRiS5si8x8H
	berwHfZXmrkRYNBCG8GSpMQC3EqaPtP6rWKO7NkF33wPHWEQ9zdN21akBxh9I1qJDep+3MzCuaq
	e94UEReMOKhea/5aV/k8nldJK9QmS+apxCI=
X-Google-Smtp-Source: AGHT+IH7eC+qOsvnTonYluNajqyeTePFq6+DixSo80qx2sPY0rfxm0N4xndyw52bkxTDqJHhdrq/rQ==
X-Received: by 2002:a05:6512:3a8d:b0:53d:e83e:a23d with SMTP id 2adb3069b0e04-53df00d952dmr9584517e87.27.1732879344836;
        Fri, 29 Nov 2024 03:22:24 -0800 (PST)
Message-ID: <b064a441-4f46-4a2e-bc2b-965548242820@suse.com>
Date: Fri, 29 Nov 2024 12:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241129091237.3409304-1-luca.fancellu@arm.com>
 <20241129091237.3409304-2-luca.fancellu@arm.com>
 <63022d0b-5761-4392-8280-fbfca8c679f7@suse.com>
 <52FD5E2C-A620-486D-A648-5F34531B2681@arm.com>
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
In-Reply-To: <52FD5E2C-A620-486D-A648-5F34531B2681@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.11.2024 12:14, Luca Fancellu wrote:
> Hi Jan,
> 
>> On 29 Nov 2024, at 11:06, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 29.11.2024 10:12, Luca Fancellu wrote:
>>> --- a/xen/include/xen/xvmalloc.h
>>> +++ b/xen/include/xen/xvmalloc.h
>>> @@ -40,20 +40,46 @@
>>>     ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
>>>                              __alignof__(typeof(*(ptr)))))
>>>
>>> +#ifdef CONFIG_HAS_VMAP
>>> +
>>> /* Free any of the above. */
>>> void xvfree(void *va);
>>>
>>> +/* Underlying functions */
>>> +void *_xvmalloc(size_t size, unsigned int align);
>>> +void *_xvzalloc(size_t size, unsigned int align);
>>> +void *_xvrealloc(void *va, size_t size, unsigned int align);
>>> +
>>> +#else /* !CONFIG_HAS_VMAP */
>>> +
>>> +static inline void xvfree(void *va)
>>> +{
>>> +    xfree(va);
>>> +}
>>> +
>>> +static inline void *_xvmalloc(size_t size, unsigned int align)
>>> +{
>>> +    return _xmalloc(size, align);
>>> +}
>>> +
>>> +static inline void *_xvzalloc(size_t size, unsigned int align)
>>> +{
>>> +    return _xzalloc(size, align);
>>> +}
>>> +
>>> +static inline void *_xvrealloc(void *va, size_t size, unsigned int align)
>>> +{
>>> +    return _xrealloc(va, size, align);
>>> +}
>>
>> Just to double check: Was it at least considered to use simple #define-s
>> to effect the aliasing? Wrapper functions like the above ones have the
>> downside of needing touching (easy to miss) when the wrapped function
>> types change in whichever minor way. (And yes, I do understand that we
>> generally aim at using inline functions in preference to macros.)
> 
> Yes, I think I tried and I didn’t have issues using #define-s, I asked here
> https://patchwork.kernel.org/project/xen-devel/patch/20241115105036.218418-2-luca.fancellu@arm.com/#26123448
> about a preferred approach, but I didn’t have any reply, so I went for what
> I believed was preferred as you said, static inline-s instead of macros.

As Andrew's idea didn't work out, personally I think the simple #define
approach you suggested would be preferable in this case. There is in
particular no type-safety concern here, as the wrapped functions will
all have the intended type checking applied.

Jan

