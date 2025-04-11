Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C00A8564E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 10:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946826.1344592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39Xv-0004oM-J3; Fri, 11 Apr 2025 08:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946826.1344592; Fri, 11 Apr 2025 08:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39Xv-0004lg-G3; Fri, 11 Apr 2025 08:15:31 +0000
Received: by outflank-mailman (input) for mailman id 946826;
 Fri, 11 Apr 2025 08:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u39Xt-0004la-La
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 08:15:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20d294de-16ad-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 10:15:28 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-399737f4fa4so899331f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Apr 2025 01:15:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb20sm79568525e9.3.2025.04.11.01.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 01:15:27 -0700 (PDT)
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
X-Inumbo-ID: 20d294de-16ad-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744359328; x=1744964128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BWlf9YaDq6iwb91Y497OMIUiV89XVUHF/KmI3fZZwr4=;
        b=A4HFX8bgF4hl0QuBHtHMoutUKpMeoJnhJfYh3ARed6FsvX/Vlvw/xX1WzFZUG6T6Zp
         9rcOaqqGaFp5/SzjkfhVd2TvjFJYYfg1JK2n+aD/qRxalcDxcweW9t5tM941EN2YME+I
         fO7zfgmJH3sXwE3sMf3ZtjxxjCaLOuRIV9M/nG6Ms3y9QUmH022wFPTE3vixT44cJfgI
         +gnYLy7CuAaztogCkKTnzoeunlX0223WwM+andcgGAg8CDCrus9gEwJB70xtKJNhjyBt
         Vv8KtlJ19ZLJVtHvGrWsAMhjdU0JfxD/fiqSHAjMqwynvqHPwvwsrCxy8Y1FKy4UZLO/
         dnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744359328; x=1744964128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWlf9YaDq6iwb91Y497OMIUiV89XVUHF/KmI3fZZwr4=;
        b=kGes5UJWnCooy1W+IYxCF7GcEqde9h1lYRrHabKodWwBEBkVEQxE/pIfMABFJFU4dr
         nI84AtJp0I1DHTJflSyXdashsrWe8b6ww7HJnxtRle92bIt1l4XJagG1z42tiZM8kt91
         rY6EIkctWl8dFtXUBiF7RuXvpBWoc9iajSOMyi2v6R5hzpCyoj91jqUmhXzT1UMBACFe
         8asl/jeaLH6F6obCv4/f9su56JWEbTPeG/c3sZBLvrGNlFr3abnowBqMysY+7k5SyRop
         Ik4QMXMi7RoqovuGzgSRSNLWIE1FZyO5i0ZTczIhx+8FXmlGMdSwFFq4PY8Qo2729+Bt
         CM3g==
X-Gm-Message-State: AOJu0YwNitNvHo6wezLvArJBKwctayWrYjwsjdZpOa4Cb2+v5c9PFhjx
	eMdGfGdm6XbgQw3OxFZZKfhL2fWXMv4xR1ISb6/A1yZELXn17mEU93uDBszLLA==
X-Gm-Gg: ASbGncvWBK6VhRndcqLbm6321znO4mKsvR6SIIUzbH/wWDFBo/JAPDO0I4NFGZybtVz
	yChBS56p7mkzMGU7+WQgpbKxLcl/UiNjLHDIGLEapcqYRsKJ577dJCdUfZGx6Zm+Lev/hwxn447
	V6W7SAwXjbgDiNTZ26cTx3Ed907Gu63YCmubmwDKPGqISbREfCt3BAMo5DChUjX0BUCK9+210Uz
	CdlIPVCrlLELCrCgwzbciUPeP0wrNZ2PNZNSGWfA05uJCqmA8Fhoq966t0rvmiZ/lj5hlDmqtRr
	37vQRYWDYZ5IqIdQ5KUloK9ZXH7kh44ic4jmVueEyyR4xxlXpVfizVq1xx1mILqv90hFXXAWtV6
	VUkzLcaxe4OViIhzWB+mHZ/tgEw==
X-Google-Smtp-Source: AGHT+IHSXGtFsYBgSxAgklm/GFX5NMwgP4ahM93VdQjTzuzyyfco/pfpuUiWqcf+ftXswZUqO0NCGg==
X-Received: by 2002:a5d:64e8:0:b0:390:f745:bbfb with SMTP id ffacd0b85a97d-39ea52171f7mr1388235f8f.26.1744359327892;
        Fri, 11 Apr 2025 01:15:27 -0700 (PDT)
Message-ID: <87349713-cdc4-4d54-adcb-27db20a2a210@suse.com>
Date: Fri, 11 Apr 2025 10:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
 Alejandro.GarciaVallejo@amd.com, "Lira, Victor M" <VictorM.Lira@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan> <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
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
In-Reply-To: <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.04.2025 22:55, Jason Andryuk wrote:
> On 2025-04-04 06:28, Roger Pau Monné wrote:
>> On Thu, Apr 03, 2025 at 06:01:42PM -0700, Stefano Stabellini wrote:
>>> On one Sapphire AMD x86 board, I see this:
>>>
>>>
>>> (XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
>>> (XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
>>> [...]
>>> (XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position
>>>
>>>
>>> Linux boots fine on this platform but Linux as Dom0 on Xen does not.
>>> This is because the pci_check_bar->is_memory_hole check fails due to the
>>> MMIO region overlapping with the EFI reserved region.
>>
>> That's weird.  (Partially) the reason to not attempt to map such BAR
>> is that it should already be mapped, because at dom0 creation time all
>> reserved regions are added to the p2m (see arch_iommu_hwdom_init()).
>> If that's not the case we should figure out why this reserved region
>> is not added to dom0 p2m as part of arch_iommu_hwdom_init().
> 
> Victor discovered these regions are type 11 EfiMemoryMappedIO, but they 
> get converted to e820 RESERVED.  The BAR points into it.
> 
> 00000f0000000-00000f7ffffff type=11 attr=800000000000100d
> 00000fd000000-00000fedfffff type=11 attr=800000000000100d
> 00000fee00000-00000fee00fff type=11 attr=8000000000000001
> 00000fee01000-00000ffffffff type=11 attr=800000000000100d
> 
> Xenia discovered Linux keeps small regions like this reserved, but lets 
> larger ones (>= 256kb) become holes.  See the comment in Linux 
> arch/x86/platform/efi/efi.c:efi_remove_e820_mmio() around line 301.

What a hack. And the mentioning of MMCFG space isn't even correct there,
I think. That space may legitimately be reserved (and at least older
Linux actually checked for that), unlike any ranges where BARs may live.
As to host bridge windows - I dare to question that they always need to
be "large". Similarly nothing guarantees the some non-window space
included in _CRS may not point at a "large" region.

Jan

