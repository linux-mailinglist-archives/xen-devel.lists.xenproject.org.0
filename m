Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37638A208C5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 11:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878354.1288523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcj4l-000232-52; Tue, 28 Jan 2025 10:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878354.1288523; Tue, 28 Jan 2025 10:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcj4l-00021Y-2E; Tue, 28 Jan 2025 10:44:11 +0000
Received: by outflank-mailman (input) for mailman id 878354;
 Tue, 28 Jan 2025 10:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcj4k-00021S-5B
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 10:44:10 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd25ff65-dd64-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 11:44:08 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d932eac638so10591660a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 02:44:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186d8c3esm6987096a12.80.2025.01.28.02.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 02:44:07 -0800 (PST)
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
X-Inumbo-ID: cd25ff65-dd64-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738061047; x=1738665847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gOJU4QZyYul2TIIrDQ4BSIIQc90qZkQ8as5C30Ul9IQ=;
        b=K3fGvncpRf2MJES2O1ALCcos7hJjJjpkMZEzwoTW1Sp1nriHM/9OKn+cQ80IUftZv/
         6SfMZGPOozAAOR4Vmwg8TwgF4K1VLj7YaD4ZsdgVARt9D2tXfyQpVTrX8aand57ofYsc
         ymSXjypObM1HuwjTzsxNtbl0dFZHF3f1vjo5GijwRDfFq6IKOFePV/hC8GKyq6QXbxKz
         Gh/Fm3R9S/SCNHjrzpDpgG6aMF3JQhBkBHnVYcnmO8gt+Km4AgBVR2ObT6r7nkNc2XZc
         aydfF8icGeyUm1rGuoEdKMVEFjWgjzNEEvPJE2Ys7wdj8Yo7TtpoPp7yZ8jYHvOt3pOS
         oFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738061047; x=1738665847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOJU4QZyYul2TIIrDQ4BSIIQc90qZkQ8as5C30Ul9IQ=;
        b=CWlQyJ0us/CmfbiaZ3tVwzsvAhLPnUx4qCB2XhYPyCNb2XuJ9PknscgXa4dzyqg+4G
         vRuni1rJZJBKHOxJ9xW1llmrFknJF/qK3PXrpvWwa9GF0d1wHhYYZ4G+OM7wPjjBH/Nd
         OQl5thgGBIFvZLniMMZ8uPLbA+4pK15kkpY5rB3RjDiiQef7l2geeWUtEZzlx1okm3Ta
         kO2ihz1w5vG7CgvClHekWE03F/3tZHp5tHnXDhcUxLAuXVOnNDweMUAHgl1BJFnLPIei
         kGsnsd4BFD2AaXmQAHbJn4bJI0OdUO3FefkHaz1HbfJAicoEjJzQfpq0mCPQZIE3KYD8
         v+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXodRbWHdwI9JGVHM6+okwjxh1k5XVGJnzDu1quW0d8cfXxwvOuMPMlOt3Y557vVXkInuv0mdahrW8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyzhu92WaFGx9utBfJxSYd17rlwFr1LA8a8w0jL27PhHO5MDduz
	lW5ekyqwCXqoi5oWknQGTSfznncy7CrTzYtNbyuL+VwFAGMohEfWRdZhTh6D3Q==
X-Gm-Gg: ASbGnctYNofvGt7NM75wveGtv8Kg0A8Qb0AQWbttATftxrZ6RjbF76w51uHnWI7TnEI
	v6mQ9iGLUajaKzGXt4Idm2mgybGXyISNc/qm5eXVmsy+ttbZDQ2XgGeGaMWVgTbogNAnTIwacED
	09WG0x72IMDjzenigKLYJy4WhKqQ2j+V3Azhlfj0yUVtcBHbqDUHPfcL1DXnqJaABgRXPebNBVa
	CNjdXIkg9CWSVzwTQyEiHBNecG3xK5nFDKbKdMCuZ8FZ3rpnmwkLR8iV8PXDQJ5IXO63FEdOmNu
	zWgxT3Rk8KCYuuyvx020PfxPcUx7grPHfn9DpW/NCk8ugktnl4XI47ihvxkPOxMGiaLlOaJv5rV
	6
X-Google-Smtp-Source: AGHT+IEx22njiy+fQ/KVPkX1Or5eo6a4frig/PdggWRWRQLGfNmgjVUMAHAgR13LEtKV7lbUCzax0Q==
X-Received: by 2002:a05:6402:4416:b0:5d9:a84:d4b6 with SMTP id 4fb4d7f45d1cf-5db7d0e8a21mr42472361a12.0.1738061047658;
        Tue, 28 Jan 2025 02:44:07 -0800 (PST)
Message-ID: <1a98115d-44b3-4440-b1a4-16e33d95c36a@suse.com>
Date: Tue, 28 Jan 2025 11:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/24] xen/domain: introduce hardware emulation flags
To: Jason Andryuk <jason.andryuk@amd.com>, dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-6-c5d36b31d66c@ford.com>
 <3ab581fb-4c7b-43ff-8ac4-6bab65758437@amd.com>
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
In-Reply-To: <3ab581fb-4c7b-43ff-8ac4-6bab65758437@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.01.2025 00:57, Jason Andryuk wrote:
> On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
>> --- /dev/null
>> +++ b/xen/include/public/virtdev.h
>> @@ -0,0 +1,61 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef XEN__PUBLIC_VIRTDEV_H
>> +#define XEN__PUBLIC_VIRTDEV_H
>> +
>> +/*
>> + * Domain hardware emulation flags.
>> + */
>> +enum {
>> +    VIRTDEV_LAPIC      = 1U << 0,
>> +    VIRTDEV_HPET       = 1U << 1,
>> +    VIRTDEV_PM         = 1U << 2,
>> +    VIRTDEV_RTC        = 1U << 3,
>> +    VIRTDEV_IOAPIC     = 1U << 4,
>> +    VIRTDEV_PIC        = 1U << 5,
>> +    VIRTDEV_VGA        = 1U << 6,
>> +    VIRTDEV_IOMMU      = 1U << 7,
>> +    VIRTDEV_PIT        = 1U << 8,
>> +    VIRTDEV_PIRQ       = 1U << 9,
>> +    VIRTDEV_PCI        = 1U << 10,
>> +};
> 
> If you do create this new header, I think you'll want to leave these as 
> just bit numbers and shifts.  IIRC, the headers strive for greatest 
> compatibility and, enums are less rigorously defined.

+1 - any use of enums we have in the public headers was a mistake. (I'm
yet to figure why we need this new header in the first place.)

Jan

