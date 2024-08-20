Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E427E958C32
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 18:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780678.1190314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgRkD-0002AL-KD; Tue, 20 Aug 2024 16:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780678.1190314; Tue, 20 Aug 2024 16:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgRkD-000281-Ga; Tue, 20 Aug 2024 16:30:05 +0000
Received: by outflank-mailman (input) for mailman id 780678;
 Tue, 20 Aug 2024 16:30:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgRkC-0001vs-Mv
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 16:30:04 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73403ea3-5f11-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 18:30:02 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a83856c6f51so307849266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 09:30:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebc081cf5sm6906778a12.90.2024.08.20.09.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 09:30:01 -0700 (PDT)
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
X-Inumbo-ID: 73403ea3-5f11-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724171402; x=1724776202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e6Gv6Db5kswHeBVVZ97FVUOYbze1tncphl99p1mwsJA=;
        b=BeCX6pGruOxotGKxQyDDI0KkbSKIBRWv7aRL6/iw0jh8+U4t1xqLdbkNw0unh4vbD1
         ZVJVSCiBkECbQxNhWzVi0haZvvIlDPEmgaX/pSB+hzOp6gXVSGe4TWfAzLv6bZZBE+Qd
         SsKXrNukKrG5DVxiUSBn6t/Nyr6AvHLxPoXqZ6rQhnmIEbh7C0P/MI9ujbote8m3Q/Ha
         1g5qqvroy3W9KdXc1A1/zxvYf7W6JKAkXqPUbeLcODsREFAOFXYw4pNOlrDHncvJN9/a
         ff1hWwDajY7FZi1r2b9h5hj0babHsrthRPZ4uy4ghhkzj9fNqJd42PP2K1xD2mh9i+Cd
         vFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724171402; x=1724776202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6Gv6Db5kswHeBVVZ97FVUOYbze1tncphl99p1mwsJA=;
        b=RXIlOQRTT2jHXyY7RU708z8sqKCWziQBXkmrBe5pEN0QNK0YMAa0azYca2nJqgkvin
         BS2RjAcLrrkYLpf3hMiqDXhA8vvW3O+dSJXsJqhJsjcMFOqGzsJCeJ4ecgpyI8FEHNSJ
         VVNKgwU8xccAJ3TRc/pohDp0hmULD+5gVnlVKNRMJopVMyHbYLNAnpq+H7kJIhCgh/Ff
         CpVr2Jzo2DOU7VF1zIXpfwzFy6yINfNAOepeOahKl02XaULH4toe8yaBFDYCOjcpGEtn
         T1xGHDcCQSLtacphMsIUoMnl1bVWOWVGWoBq9FvDtboitT9T/9c5/rEw7kvW+FidVxHy
         3wAg==
X-Forwarded-Encrypted: i=1; AJvYcCVm+B4AH0RJFpF4up9LJZrJ4OTukk76ZBj+0Jgp5sepSyRD0U2Tn1gZHeHVoyWaeWgL5HKhhafqkiIg48ZDVH9MztUIVeVXuvugq2H2mDY=
X-Gm-Message-State: AOJu0YzcrZI0Pcbst/Gj28Zu6rzrfiyBdihUqV3dDwr1NhlWdpiIqec+
	gw0yrJfDbCqVPSx6dWA5uS52DjcoVrfliTgS+zVWpLhIXwen6OftfmkMGF5Uzw==
X-Google-Smtp-Source: AGHT+IH9TcqOu73H3pE2yKU+l2FSgTL9VkXZNJrhqjnXMZe7iuOwEjPXmyRymcHiAnWXhAqWZPRa9A==
X-Received: by 2002:a05:6402:1942:b0:5a1:2ce9:f416 with SMTP id 4fb4d7f45d1cf-5beca8e4022mr11422473a12.37.1724171401923;
        Tue, 20 Aug 2024 09:30:01 -0700 (PDT)
Message-ID: <2e28bc2c-250f-44eb-9926-e66c72312ef8@suse.com>
Date: Tue, 20 Aug 2024 18:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
 <1551cd4dd3b5fcf6aea59a972b60fa6b3b06bed6.camel@gmail.com>
 <4a7f44ce-e5ba-4a36-9b0b-7cd7c14cc846@suse.com>
 <bd4226d7002d912fb8f20db673b45c034352f200.camel@gmail.com>
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
In-Reply-To: <bd4226d7002d912fb8f20db673b45c034352f200.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 16:42, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-20 at 15:47 +0200, Jan Beulich wrote:
>> On 20.08.2024 15:18, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
>>>> From all I can determine we also get here when making brand new
>>>> entries.
>>>> What am I overlooking?
>>> Yes, but in this case an intermediate page tables should be
>>> read_only,
>>> so alloc_only will be true and it will be allowed to create new
>>> intermediate page table.
>>
>> Hmm, so instead of "read-only" do you maybe mean page tables are not
>> supposed to be modified? There's a difference here: When they're
>> read-only, you can't write to them (or a fault will result). Whereas
>> when in principle they can be modified, there still may be a rule
>> saying "in this case they shouldn't be altered".
> 
> There is such rule which checks that page tables aren't supposed to be
> modified ( so that is why they are read-only ):

Hmm, you're saying "read-only" again in reply to me explaining that this
isn't the correct term here. I find this increasingly confusing.

Jan

> ```
>     /* Sanity check when modifying an entry. */
>     if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
>     {
> 	...
> 
>         /* We don't allow modifying a table entry */
>         if ( pte_is_table(entry) )
>         {
>             printk("Modifying a table entry is not allowed.\n");
>             return false;
>         }
> ```
> 
> ~ Oleksii


