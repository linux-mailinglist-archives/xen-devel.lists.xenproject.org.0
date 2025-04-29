Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36730AA033B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 08:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971429.1359841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eOQ-0005UM-Tt; Tue, 29 Apr 2025 06:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971429.1359841; Tue, 29 Apr 2025 06:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eOQ-0005Rh-Qn; Tue, 29 Apr 2025 06:24:34 +0000
Received: by outflank-mailman (input) for mailman id 971429;
 Tue, 29 Apr 2025 06:24:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9eOP-0005Rb-Mh
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 06:24:33 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c51fd7d-24c2-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 08:24:31 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so10774148a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 23:24:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f701400565sm7051142a12.26.2025.04.28.23.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 23:24:30 -0700 (PDT)
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
X-Inumbo-ID: 9c51fd7d-24c2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745907871; x=1746512671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QU6KR1YCqqkt4ZtbdPgZPAuqHqCzoFWZnGvVxGCK7Es=;
        b=D+WL8PwZ2pR7sRC521SkQc1LBtl50wRnQAVk5zBZtDnxUH050rbY+vRqpqbJdPFceE
         VS7fAgb1iLHtCXttUpdd9cx370E18RfmRa3LM6bpRtTQtjHH1mfowmSHZyLUZ06YpodN
         2HlR2TdqGVftqyPbd4LI7NtmzmjEov2RlqbocdVe7JZ/daSR2scVl0W+tyf5uD6xZGld
         LL+OP453pONm4DwYPEt1O/O0e/P2qr2DZhTEcWHH8qnGu444aXcJcP1tVX4hgzDNMUkM
         0vsbN64kfqzzpGNSfolozK5pCXSK+ulOPhjxffTiUwCP3u3ZC/Ky9ASlH7T9G6VT4VLQ
         LM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907871; x=1746512671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QU6KR1YCqqkt4ZtbdPgZPAuqHqCzoFWZnGvVxGCK7Es=;
        b=AMTT1f8bPvwDz5Rd/36yLOMciD9rN7M3KBj4EJOnObEfjAAPz5C903f+hdkRJpmTSM
         LW3IrQf/pE/2I2CcntKNGE27OhCzXzKieltmQLrO5J3bZbzG1WWbOLPPkhPDJzobSXzH
         +d/Sqdyu2KZ6kJO3X/sTDjVD5mFJC5xefR+v0td3uPhpQz38mgNLeN3ESQotQJT5erQ8
         J5AW1ZW5i8LY3QIgYK6BQCZsFNRC1LWuEpdC6Mc/25MuqY9mPcEjKqYSYCP/ozuskmAZ
         MQTYxqMP5YY3vkozWl11Av8fnO7l0ohuz7rcfe/vf7JgEKZjX4M3Jgjn+QIYkdSL/yqm
         g5EQ==
X-Gm-Message-State: AOJu0Yw0US4RBFof/rVbbWKGt6W6wVjuhPjV459+mJPL4bQpBuKFiowm
	s4WRsWWWs6Djf3rCEHk/kc5K5GpAm31UWFNl/ge3OVfl6r1d5M/UAaJrWuWNAg==
X-Gm-Gg: ASbGncsieb9cTPxtCzUSRHdAbWIiy8Yo1WJ6EvYIgLJFjp4RUrJhsCrt//SPr85DjYV
	/9Qm8zo1FuhLhkIBN7pup11yeunL7qpmmdLks1uolnPhRAELL8/giiPid772amCcU2+6A41kJ5R
	qy7pM6vPlWchVMnUo+IR7nBqqxwt5ibnl3Q+He+BJIHNm/2NyNHjiy7Bni2wZtw+UVI7XDFLPab
	BSDrTo4R6qodaiAawvFwayuQ0h0yOH4EgKje0yj51FwLSoX0HEXpKQMmJax4ZXCiyzixb4J/dN6
	B+nYj3uAJt+O1faFFItC0grCUoeiRlmfS0FnCj1Iubq1XUvx3ypgYwo2XEUBONZZodOHKjgahCu
	/jGQZD0e+TDSHly4aX1QNLAjFVA==
X-Google-Smtp-Source: AGHT+IGe8rFc3WgZ4vnk27HtedbG8H9qmLwB63qtaJdSSIu7e8rtacdyTEOOrU4UwWvrKGHD7xa65Q==
X-Received: by 2002:a05:6402:510b:b0:5f6:d53f:cb9d with SMTP id 4fb4d7f45d1cf-5f83b27dcb4mr1485727a12.30.1745907870873;
        Mon, 28 Apr 2025 23:24:30 -0700 (PDT)
Message-ID: <c9ed2626-6353-4e4e-add8-e06ffff54427@suse.com>
Date: Tue, 29 Apr 2025 08:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 jason.andryuk@amd.com, agarciav@amd.com, Teddy Astie <teddy.astie@vates.tech>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <f315a128-ce68-42be-9f0c-044ad0c5320c@vates.tech>
 <alpine.DEB.2.22.394.2504281300340.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504281300340.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.04.2025 22:02, Stefano Stabellini wrote:
> On Mon, 28 Apr 2025, Teddy Astie wrote:
>> Hello Stefano,
>>
>> Le 25/04/2025 à 22:21, Stefano Stabellini a écrit :
>>> From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
>>>
>>> Dom0 PVH might need XENMEM_exchange when passing contiguous memory
>>> addresses to firmware or co-processors not behind an IOMMU.
>>>
>>> XENMEM_exchange was blocked for HVM/PVH DomUs, and accidentally it
>>> impacted Dom0 PVH as well.
>>>
>>> Permit Dom0 PVH to call XENMEM_exchange while leaving it blocked for
>>> HVM/PVH DomUs.
>>>
>>
>> In addition to Jan's remarks, I think it wants some additional
>> clarifications on the hypercall interface. public/memory.h indicates
>> "only PV guests can use this operation", so the interface is actually
>> unspecified about HVM guests (e.g what are MFN/GMFN in this case ?).
> 
> That is a new addition from c08a11ab98c.

Later addition or not, I agree with Teddy that it wants amending.

Jan

> If you see fae7d5be8bb, there
> is a statement that "we permitted this operation".


