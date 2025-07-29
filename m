Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD46B14A2A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062186.1427822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugflg-0000Cw-EF; Tue, 29 Jul 2025 08:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062186.1427822; Tue, 29 Jul 2025 08:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugflg-00009s-Aw; Tue, 29 Jul 2025 08:33:04 +0000
Received: by outflank-mailman (input) for mailman id 1062186;
 Tue, 29 Jul 2025 08:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugflf-00009m-Dj
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:33:03 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3432aaf-6c56-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:33:01 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b790dbb112so219357f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:33:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2401f3ef888sm42171255ad.106.2025.07.29.01.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:33:00 -0700 (PDT)
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
X-Inumbo-ID: a3432aaf-6c56-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753777980; x=1754382780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pqZq2xogeASIWwf3M0t4CnVvN9CNOJNM/WQNa7SvZM0=;
        b=Gs+G0yd/BcMvsRUBSRMOjl2klJjE/Zl2HNuJEn8mlwe6QPND4soYKqk1Akuo293vnC
         wnHkWziG7fVbrmzcSY9ynpDvXldqHO1ICHt9Iyjk567xNVkk+gy8Yefhxm+wRELOqDcG
         rdLEvkuUNCyM2lMvbA0tCtsuDIStelrU/CpBeM00zccZFxuCBr518ZqFY3CVKMoQrKUH
         8WziOMznMmJSMpQzcBQMIQM3JdD1olB6PhZ7OEBt8RbSicoY8pZiT+LpwBQR3Y/LgOAh
         tradkuktpKNHOib4qLmaJ/9N/PEv9GcM7roUwONy8/i0QC6y2FuIdapxAymR0jRL5MU3
         DyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753777980; x=1754382780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqZq2xogeASIWwf3M0t4CnVvN9CNOJNM/WQNa7SvZM0=;
        b=ibqxvSR3494zsZ7rPjByJ+ylfbtmnp+OXCa6MUEtogV4H5llTSGhKwr6hKhReDYW/6
         jjT7trR4rw29DGsMaQY5YL2RE5TwaLDAGolyLmSIqyWzqvmBvKzs7DR6YeJFyHF5ZTh0
         GcEHRDETTS0Sew9F+3SH9upVJMAJHl0HPi/r7pmT9p+Ixzgs7c2HjDKr1bGejNiwa3Tp
         GnS+PcuWws5qcU3RdBvTgw9uC1LDX2XC+Lub12W9oRwpBQuHs3q+v4H6aPKNO7n8egRI
         r566hXNm5o3lYItRits5NDGL5Bku5gXMX/QwVe/emmQf2G8OatlVaDN9MGe5uuvyN7bQ
         uYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMXHLm/ufAZvenEd8gFWU+QJYIbwkIICNGygBvjdpsvQWkVPTZlPDxDcX3ceKTvstD7vC80Stpcqk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxW23E0vTZ+NqNqNm2+aRd1lFhXvDcP0FBzUPPliquipMjnG3lx
	pkZotrQiWYw+8jTPWLERhdGMH7KsIW5N9eHTiATytikDlNUKyr8co676KkAtXXkg7w==
X-Gm-Gg: ASbGncu6UK69ZTru/76Pm6EselSP1fseJNHZzl6ewUgXhDpe9dcJOAtxj9W5/YW4iuC
	nj4bQuVJYuwxzQr2tkvKVL6C3saH+cuf82TkgMsyqoOYgMO61PMdFenJ3MzeXzOOJ2+IVB7aM9q
	fFMKl6ZX68iOAu0zYDRwL1v0zEc8NHJU65LZcVl1u30i4o3F0lCKEPM8/LwJXrrRKwDNhWBSV9x
	Y+gH0V1NjsuyUaHKHg1i35fxolT3oqD9cpQtz01VDrESiDkzR8MwEtITyrGY+A0iLeOVqMkUxjX
	MK9IPSICo0h9SUmgsVGW/J5osnbtIoo85btoqrDfvERwekXUXwAJKLfPWE9oUbTRAp6+KmoKfJ1
	Xz4jF6EWxpYb58UNaQIH4gwjFyMieQv3BB5UvaYLQzq+j3fayJG1WAXjxsviZPvuF/pWylnKZb8
	8DSh9zr/UdywOjA1uTog==
X-Google-Smtp-Source: AGHT+IE9u7X9RoXg7a3xVW08JmSL2DcT7ryz3ul4OomyqVGvOHVuPUdu4UnctKfluVjkFlNFXkNkzQ==
X-Received: by 2002:a5d:5f85:0:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3b776679f02mr9864025f8f.50.1753777980491;
        Tue, 29 Jul 2025 01:33:00 -0700 (PDT)
Message-ID: <0fce6207-15b9-491a-97ab-3ad4b36ddaac@suse.com>
Date: Tue, 29 Jul 2025 10:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix memory leak on error in vcpu_create
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250728195245.90356-1-stewart.hildebrand@amd.com>
 <08ca27cf-435b-4807-8cbc-0b866709b9df@citrix.com>
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
In-Reply-To: <08ca27cf-435b-4807-8cbc-0b866709b9df@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2025 22:09, Andrew Cooper wrote:
> On 28/07/2025 8:52 pm, Stewart Hildebrand wrote:
>> In vcpu_create after scheduler data is allocated, if
>> vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
>> resulting in a memory leak. Correct the label.
>>
>> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Urgh, sorry for breaking this.  Ultimately it comes from having two
> different error handling schemes.
> 
> This patch is probably ok to start with (and to backport), but a better
> fix would be to handle sched and wq in vcpu_teardown().  That way we get
> a single failure path that does the correct thing irrespective.

I agree, and that variant would apparently be as easily backportable.
Stewart, are you up for going that route?

Jan

> An unrelated observation, but there's a waitqueue vcpu allocated in the
> common path, but I was under the impression that only x86 had any need
> for wqv (and I still need to get around to fixing introspection so we
> can drop wait.c entirely).
> 
> ~Andrew


