Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14A90B1CB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742366.1149161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDIo-0001yL-3F; Mon, 17 Jun 2024 14:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742366.1149161; Mon, 17 Jun 2024 14:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDIo-0001vc-01; Mon, 17 Jun 2024 14:25:46 +0000
Received: by outflank-mailman (input) for mailman id 742366;
 Mon, 17 Jun 2024 14:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJDIm-0001vW-J7
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:25:44 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ae2a795-2cb5-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 16:25:43 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so665460466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 07:25:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f8176eea5sm178998766b.88.2024.06.17.07.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 07:25:42 -0700 (PDT)
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
X-Inumbo-ID: 7ae2a795-2cb5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718634343; x=1719239143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QKUxaFYJiLg9Ph/VfOVu53T0ux5v0DrUMuEEkKaFwe4=;
        b=Cw+uSzZDw8g7jhIKbeQDP/uSYxPCFWUwD11XxzHzD93h1SBUM2bfhxx7q0+HBQjSmB
         QSlEXFDACmrFRxUevuoiyPVJsOaVJ9YklHCPFYv5vIBWgDDjvQH+0JGvdTOyaezxfU/k
         KNcNBXsJ7Z3bu2QYFXBrpiGviU7Fi5g8QglS92hJ6Y58Yfcg1cF/nPQUc8a2oRxQTMcT
         Zprg9zvT3x7Wgd6LYDuXJASSwTj0jvTf0knWbjHiNRKmthO8ZoX743XygpSQQAdRActy
         q9fhfrtJDSy19bBsPqFqnlDL3DFsiAEEek/gZvbTygWuNU6z5dy83In5TmNvbzP2fhL9
         cJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718634343; x=1719239143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKUxaFYJiLg9Ph/VfOVu53T0ux5v0DrUMuEEkKaFwe4=;
        b=Zc+IutychFcUxnUQH8a0IB/DYKHcfoJAx0AAFC3wYouxWH5Fe8CJBSc5AutXpBfV5x
         xiac+kkg5+1ZocgpdfaW184XksKZzBJwFtemIohvNQvyafV1rlJ3kQhcFzM4Cj19c9JS
         W4kz5hnAHz0ffRXMDUoA2ukiu3NopqfVslOCPEJKH/C1R6HGuF9ys/cZ/PuVJVuO/5jh
         p7j6VPwqyN2ktxq6HrfPPNkWhqYCJSVbch/47xJkqmRrsGRCv39mWrwwkbMu2t1kNu+5
         QB47MqUrNwR+/d478xFl2mIRM5b4bnEPVD6Z5E5B7dbY3pxU0r9ylIAHgwZa+Uy+fKcw
         /VaA==
X-Gm-Message-State: AOJu0Yxhd2vgEO3FRCo2GCgxv8hMpEMtD8D8j0K1YM4dUswWgziohvKr
	lwzyVR3WQ9gDTuDC5Opz1CfSJ3KmuHXG6oSYKaS03FmNsPLuw3BPjNJUi2XQJA==
X-Google-Smtp-Source: AGHT+IGCRyB/yokdEe2X6n7ZLojfXcD6MbiY45JVgMP9N+wJUoaqOs5hTl81gNYNcF3RIn1k8yEKKQ==
X-Received: by 2002:a17:907:3f03:b0:a6f:5fe2:56e9 with SMTP id a640c23a62f3a-a6f60d2b9a7mr842972766b.17.1718634342984;
        Mon, 17 Jun 2024 07:25:42 -0700 (PDT)
Message-ID: <bd2eb947-7fca-4f1a-bf43-addccdda35a0@suse.com>
Date: Mon, 17 Jun 2024 16:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
 <ZnBCFgHltVqj2FDh@mail-itl>
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
In-Reply-To: <ZnBCFgHltVqj2FDh@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.06.2024 16:03, Marek Marczykowski-Górecki wrote:
> On Mon, Jun 17, 2024 at 01:22:37PM +0200, Jan Beulich wrote:
>> Hello,
>>
>> while it feels like we had a similar situation before, I can't seem to be
>> able to find traces thereof, or associated (Linux) commits.
> 
> Is it some AMD Threadripper system by a chance?

It's an AMD system in any event, yes. I don't have all the details on it.

> Previous thread on this issue:
> https://lore.kernel.org/xen-devel/CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com/

Ah yes, that's probably the one I was vaguely remembering. There it was the
kernel image E820 conflicted with. Yet ...

>> With
>>
>> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
>> ...
>> (XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619175 pages to be allocated)
>> ...
>> (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
>>
>> the kernel occupies the space from 16Mb to 64Mb in the initial allocation.
>> Page tables come (almost) directly above:
>>
>> (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
>>
>> I.e. they're just above the 64Mb boundary. Yet sadly in the host E820 map
>> there is
>>
>> (XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)
>>
>> i.e. a non-RAM range starting at 64Mb. The kernel (currently) won't tolerate
>> such an overlap (also if it was overlapping the kernel image, e.g. if on the
>> machine in question s sufficiently much larger kernel was used). Yet with its
>> fundamental goal of making its E820 match the host one I'm also in trouble
>> thinking of possible solutions / workarounds. I certainly do not see Xen
>> trying to cover for this, as the E820 map re-arrangement is purely a kernel
>> side decision (forward ported kernels got away without, and what e.g. the
>> BSDs do is entirely unknown to me).
> 
> In Qubes we have worked around the issue by moving the kernel lower
> (CONFIG_PHYSICAL_START=0x200000):
> https://github.com/QubesOS/qubes-linux-kernel/commit/3e8be4ac1682370977d4d0dc1d782c428d860282
> 
> Far from ideal, but gets it bootable...

... as you say, it's a workaround for particular systems, but not generally
dealing with the underlying issue. This explains why I couldn't find any
patch(es), though.

Jan

