Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC9DA77FCC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 18:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934671.1336312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tze6l-0002zR-Le; Tue, 01 Apr 2025 16:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934671.1336312; Tue, 01 Apr 2025 16:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tze6l-0002xO-Ih; Tue, 01 Apr 2025 16:04:59 +0000
Received: by outflank-mailman (input) for mailman id 934671;
 Tue, 01 Apr 2025 16:04:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tze6k-0002xG-5m
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 16:04:58 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e844da7-0f13-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 18:04:57 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so37603215e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 09:04:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fba3ed8sm162317185e9.6.2025.04.01.09.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 09:04:56 -0700 (PDT)
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
X-Inumbo-ID: 0e844da7-0f13-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743523497; x=1744128297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6SjNuBV4iL+6r1962jfN/sJuCzHuPQdZ1glXkhh3DH0=;
        b=XWAgs3TZllWDtamJv80t4HHrHbcoKMeh8eff+NCF0LRwEGSYBXDYsdp2PHkTZ/QfV5
         4WkffFDlX4lSe4lrZeFSrlvpZa6ovdSj51EBSyQDBbQ6Hujw+H6WYD523JVTZGQVnq6v
         433QFMymmMyEQS7T+HObF17h9AZs82KcWfvdulWAIjdsiKtPJPpjdliHdpvoIG9B8ncI
         apq+P1fm5M5RjWgFSPT9KvRuXqQYbxLH2grx8rTiT0l9ngBUERUqxNUYc55yXVErNWO7
         3O6bkRYHNeCbC+q0eDXTMM+MiVPI3EZXGmefMCRPTmM18GcqzQbozIba3XPTdBAiT3Ao
         +4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523497; x=1744128297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SjNuBV4iL+6r1962jfN/sJuCzHuPQdZ1glXkhh3DH0=;
        b=hUEMayFqgUt1tkODqQ9vQMy4w8ejAaxI/aQDQwX0gfJgPsPT9WlM3/S8WSNXKLwV4T
         8DupyKUy5w+1/u0mdSkbJY9DDyCfbjQXZwq5R9o7GeFhhpQi8fJxohJd/dcmGGD1eTOQ
         VWXtp/OyzHgDjzXZtCy9/IFHCtRr2FToNvWSh8lRz8q4l3+23QKGbwhkrsiB0tUeF5O7
         XIw+I+aQj/qwfpKD9hYbbHdb/+3iWtPD6OvUwuwNCOm6QIxWWwLorpDvvRed04tWRwWa
         I6cbQaBUSnUbvjaO7gqt6oRpFowniLOpA3pOuW/4T5T4UFN9rQRWgdW+R6eNvZahj3f1
         H+UA==
X-Forwarded-Encrypted: i=1; AJvYcCUKLiLxgLWKNozDS0OT5/oSucqKDauas52h8qlyMEeJlhvtzEJV0BmgTvF68UDSknqClYa1vtKmeA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwsPHVzmofE2xZepa4yZhIueXTbfKvlhA5j6FFQqMy+8eh0EPqT
	BOl9T1lSP1qYjS/x3+9j73vW5eDBMjG6q8V1lQ3GqRw/nv4AaP1/ps8OkBLgEg==
X-Gm-Gg: ASbGncvZcslskJsr1fh61U3NkM4A2MhS95TCanyBtdCMOrsX9FnjeSxupoOyBPLHeKl
	6BIvOpzGsA1lfZ1qKzJNt3pS+ASdBphM///93sapOZhWQyQMdXbjlRIzDFWljTdqcUf9F/k1nBH
	LkpdWfDxSxbdy+InXW7GtQdnf5k/xv/9teFJe1jd8sRV/lnAmGDCotFEAy7HcEJnCSVu/njGL+0
	oMrn+Ht5MXZK6+b15Ei4pL1Yy75tOqTTilH2sHiS5sSu2f3REH57g6YEEEKMwPCbtF3UOWMoS6L
	1f3S8too1B6Lq0n3CLFypp+VfO7cZfz0sqrC6tq+LrTWKtNqKZTKYb8Pzodhf5qV8FE/7sIL+nK
	kh7oQ+rb16icaArCaWG/28l8dzXL+Sg==
X-Google-Smtp-Source: AGHT+IHZ7Bz8VCa1ygwrlJIUsUY0MJKNQ+Tr+RvHOTOnkMaZnZ4ZCUrlO6zrN3JT1AqFrMmB2GglLQ==
X-Received: by 2002:a05:600c:3c9e:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-43ea7c9699fmr38910225e9.18.1743523496584;
        Tue, 01 Apr 2025 09:04:56 -0700 (PDT)
Message-ID: <9d7e1553-3af8-4fc3-a400-8714d9b68411@suse.com>
Date: Tue, 1 Apr 2025 18:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
 <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
 <32264ccb-e566-41e0-973f-5bc7d874f970@gmail.com>
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
In-Reply-To: <32264ccb-e566-41e0-973f-5bc7d874f970@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 17:58, Oleksii Kurochko wrote:
> On 3/31/25 6:14 PM, Jan Beulich wrote:
>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>> +    const unsigned long xen_virt_end_vpn =
>>> +        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>> +
>>>       if ((va >= DIRECTMAP_VIRT_START) &&
>>>           (va <= DIRECTMAP_VIRT_END))
>>>           return directmapoff_to_maddr(va - directmap_virt_start);
>>>   
>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
>> Is it necessary to be != ? Won't > suffice?
> 
> It could be just > MB(2). Or perphaps >=.

>= would make the build fail, wouldn't it?

>>> +    ASSERT((va_vpn >= xen_virt_starn_vpn) && (va_vpn <= xen_virt_end_vpn));
>> Are you sure about <= on the rhs of the && ?
> 
> I am using -1 [ ((XEN_VIRT_SIZE >> vpn1_shift) - 1) ] when calculating the xen_virt_end_vpn to make the range inclusive.

Oh, indeed, I didn't look there closely enough.

Jan

