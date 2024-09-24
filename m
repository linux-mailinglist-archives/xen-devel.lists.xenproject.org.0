Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8099848A6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 17:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803063.1213472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7S3-0002g4-8j; Tue, 24 Sep 2024 15:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803063.1213472; Tue, 24 Sep 2024 15:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7S3-0002dx-68; Tue, 24 Sep 2024 15:27:43 +0000
Received: by outflank-mailman (input) for mailman id 803063;
 Tue, 24 Sep 2024 15:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st7S1-0002dp-Q8
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 15:27:41 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8943278a-7a89-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 17:27:40 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so718276366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 08:27:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930caf21sm95390066b.98.2024.09.24.08.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 08:27:39 -0700 (PDT)
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
X-Inumbo-ID: 8943278a-7a89-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727191660; x=1727796460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nHODZjJNYepNzWXL3r5jtyMEMW0/BmcOMDxCtIS0XS0=;
        b=W1jf35wA2E3Zt+Pkd7+jb/p4j571o2+25edv++rN+jpXr1EmA5X+wWCe82Zc1TTp4Z
         NwVeQ01ygT9krzdcbwLlacoYyhaXudL1BgQqdvzYmIz+O+zQIkWbfTxYHl9NnSBfyOqO
         T2hgDCLEz4pddMIkwAQYA8JoMFVsTswh7b06vTFy3HO07ykPcUYix4ztXZ3wZfbuRK17
         oyhIOjdlLFSm6A+ng/x3FYx9pb9vj59Y5pTyQe4Xl479rE4e5zFmWZrcRiv0KYNroJGK
         h6F28t9RjhlcIsI++j9yp0Z1GAFq97oSGHsh8H7WdHq+32ZudtDyghQCxkOJwz4Hhf7Q
         uzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727191660; x=1727796460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHODZjJNYepNzWXL3r5jtyMEMW0/BmcOMDxCtIS0XS0=;
        b=fcThk7D2QFJwt4tG39iA9ekfBRVjEVeMyUDBzQ/Lz0EI3x+GL4ZcPBmm5CPtV0wuDY
         X04vgOE9vgSJTZQEkrZZL0/IBsEO8DIh5n8DQbWbcnYJpiDiVSmNXTmlVpG7CCopjzJ1
         Kbn+Lv9fegV+NfLu0rYsbDGuIwn6KjaE19D0DaUAYebqNT1rm2Y/NbR0/qjj6HYEWxwH
         eM75+bL4dHLMVblphOvxPNhvYZhn47VfGelbIOZSifZpzX2uCzJYcGlUPqs7o4+u+XQe
         WPm/16gEkHY8fwwMFyMZrMDldZALGsr6E0+G/akSJz0ZtEKCknQL/qnh7SfKobnP+w48
         ktNQ==
X-Gm-Message-State: AOJu0YwJiZcALgPySBPBCbsqJ4gzG9Bus/7jYhXWZ2ah0vzGgWeqxtwA
	Ubk695ILGSsdrvCeKlKy5EIWS6XNvLuzn9UwHg0Fz9arXx6umQyovZpriM3zrA==
X-Google-Smtp-Source: AGHT+IGi63fGxrOMn3hs+ioXx1Y65xPrSzTjfBBElrFi/zhVsFbkgovmRxdik9y3AdjmVBK7nDhKGw==
X-Received: by 2002:a17:906:da83:b0:a91:158b:122c with SMTP id a640c23a62f3a-a91158b130emr452601566b.38.1727191659830;
        Tue, 24 Sep 2024 08:27:39 -0700 (PDT)
Message-ID: <b7a21dd2-e30b-4f16-8e3e-96245c8e277d@suse.com>
Date: Tue, 24 Sep 2024 17:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
 <ZvLWSEwbdL1kpvC6@macbook.local>
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
In-Reply-To: <ZvLWSEwbdL1kpvC6@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 17:10, Roger Pau Monné wrote:
> On Mon, Sep 23, 2024 at 03:35:59PM +0100, Matthew Barnes wrote:
>> With the introduction of mixed x2APIC mode (using cluster addressing for
>> IPIs and physical for external interrupts) the use of pure cluster mode
>> doesn't have any benefit.
>>
>> Remove the mode itself, leaving only the code required for logical
>> addressing when sending IPIs.
>>
>> Implements: https://gitlab.com/xen-project/xen/-/issues/189
> 
> There's at least one extra bit which I would also like to see removed,
> either in this patch, or as following patch.
> 
> In struct arch_irq_desc we have 3 cpumasks: cpu_mask, old_cpu_mask and
> pending_mask.  After dropping cluster mode for external interrupts,
> those fields could become integers AFACT, as now interrupts can only
> target a single CPU opposed to a logical CPU set.

Yeah, that very much wants to be a separate change.

Jan


