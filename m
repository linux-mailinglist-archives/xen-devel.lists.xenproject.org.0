Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F138CCCC8F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 17:33:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189939.1510657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGw6-0002pP-EZ; Thu, 18 Dec 2025 16:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189939.1510657; Thu, 18 Dec 2025 16:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWGw6-0002mn-Ba; Thu, 18 Dec 2025 16:33:06 +0000
Received: by outflank-mailman (input) for mailman id 1189939;
 Thu, 18 Dec 2025 16:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWGw4-0002mJ-U7
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 16:33:04 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 393afa99-dc2f-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 17:33:03 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so447275f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 08:33:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244934c29sm6006121f8f.2.2025.12.18.08.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 08:33:02 -0800 (PST)
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
X-Inumbo-ID: 393afa99-dc2f-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766075582; x=1766680382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2dEIuB0DC9wX6qSgJYqJ8dzhIf1vffBNl9klKLbxGLA=;
        b=LfwVhaACidSLhsZLPqtV2K2H1B1qX/WSk0P6MsbSeF7ZezsFwr7HEqDUFBEqIWQEXo
         bHj8Ct2WKlUXqbWgnODX1UHuNTWume7PZU6TqUIzFy9/cDqCmivQmQmww8MhaBmcfUa1
         kVPYAJUwA7T9LOT+EdO8usABeZsWk/YMPJqzMnPeN8scanlsNTi9+hu/9aiE5l2RxaI1
         C24spOWDFPfKEk5kJ1psIJ4teBwtrtax30b65+OfSKhJ0/xBdb3fQyZNTPqV5a/+yWPk
         AYSgCPaVMZ6quvxOGXQKn/rDVHfF9zNkED/sWzBJMc40cp/L+meY+Y7IEO5qf9FXhtMx
         ZTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766075582; x=1766680382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dEIuB0DC9wX6qSgJYqJ8dzhIf1vffBNl9klKLbxGLA=;
        b=JfQKn0XQA0CMyVoDddf1j6baZbszV4IvSsxT5wC9iTHaXpYENAiRM8YDqbSjHytIlR
         FTKVLnOI2Mo+DRNycPkHkr7ne9ZpmKMdlpDsIYDxghjYw8m4jxF5gju6xpCplES7++Ow
         YmktdNGvQ8BX0TV0MdslrvvVGKZ8C8wdWlhVsz3hTHYVfE0As7NXoOBFle5NJsentOBh
         5i03ekUyKrHzQHkMVT3NWm4R2Cr11Au1oND71bNBBf6QsATlzCJcgxiSOBll1E7+GRX4
         xxzqqiqvUDmIKUKN2T3cWEB1k2D98+mTY6Adsy6CkSXP1HBpNW+7JlJKC4VgiGR3nmCR
         4NSA==
X-Forwarded-Encrypted: i=1; AJvYcCV0AN/Mp9waEffENu/34p8GdY5P2oOSJMMfqszbOzmVmc6nXoCipDuLkl1I7Y104v12JipQF0k4h/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3bdHrczmRvb9T5dVeLT69I8P+Q9QHhF7RflOWFI8p5tGrMNIk
	5YWB5UBYdWItK8Vn/BtKojG1PgDZ8omfgl96DOOJtE9CC4UthZXIX3OCAvdA60eQbg==
X-Gm-Gg: AY/fxX6Jcmw3zBonsKQiM8X6C26mIuqPfyhXsFFNkHymrdYprunmI4t9gxU27eePByK
	3lDQstfhekUACFyFbJPNX/tCxlFpEz2JCSVkoaJJrFM1+tBQDTzxH3IZPjjxGllNNguTYIftHOg
	MN0kxsS50cOZVGjPo2P+1qjfOyjvMUf68r5EajI7f6/6Q34/MtfBgmaAh/+CN5ooMuVMDNmZnfU
	EauB6n9KvrlL7fpMLQrHL0VrV2iwfYrS9pjVuMvZNWN3bNcv79dhhk140WlDiUQseVtPbywAlwK
	FEyCXGssPbJGS24rfDVPDZAs4FZ6LBuXz/GfnuRUNX8KjjEs+blGutnl1UZdm9VlAH07Oc08zP5
	9ywLjwpAQdP6g7JxFpiqW//lK0PTaplf7Q03fEY345677hZfCX1oCIeFfQreej3KoNawLl9bRTk
	TexerWbCn0rPSGeXjZ43zPkP3qkexwjskOzMVlykIM3bojmJsBZXYoGuMY+Y200Nwq7WW60s4NO
	lI=
X-Google-Smtp-Source: AGHT+IE++cKRKbjUAFqXUjmkgywuVsB+Pc0Lw9OyZej2Clb23qmh/F7/hYIul+qowoo5QlHhQR8bfA==
X-Received: by 2002:a05:6000:2dc3:b0:431:26b:5e3f with SMTP id ffacd0b85a97d-4324e7048f3mr77195f8f.63.1766075582425;
        Thu, 18 Dec 2025 08:33:02 -0800 (PST)
Message-ID: <e7e12bee-2b0b-4474-a64e-78f570432a3e@suse.com>
Date: Thu, 18 Dec 2025 17:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 0/4] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
 <a4646368-2c91-4d57-846f-e7de51395627@epam.com>
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
In-Reply-To: <a4646368-2c91-4d57-846f-e7de51395627@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 17:20, Grygorii Strashko wrote:
> I'm planning to send v3 - so would be appreciated for any other comments.

Andrew,

could you please write down the outline of what you described verbally the
other day, to scope the extent to which we may want to take changes here?

Thanks, Jan

> On 19.11.25 21:30, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Hi
>>
>> This series introduces possibility to disable 32-bit (COMPAT) interface support
>> in the following case:
>>        - Only PVH domains are used
>>        - Guests (OS) are started by using direct Direct Kernel Boot
>>        - Guests (OS) are 64-bit and Guest early boot code, which is running not
>>          in 64-bit mode, does not access Xen interfaces
>>          (hypercalls, shared_info, ..)
>>
>> If above criterias are met the COMPAT HVM interface become unreachable and can be disabled.
>> Coverage reports analyze and adding guard (debug) exceptions in hvm_hypercall/hvm_do_multicall_call
>> and hvm_latch_shinfo_size() confirm that COMPAT HVM interface is unused for safety use-case.
>>
>> Changes in v2 described in each patch:
>> - patch "x86: constify has_32bit_shinfo() if !CONFIG_COMPAT" squashed in patch 2.
>>
>> v1:
>>   https://patchwork.kernel.org/project/xen-devel/cover/20251111175413.3540690-1-grygorii_strashko@epam.com/
>>
>> Grygorii Strashko (4):
>>    x86: hvm: dm: factor out compat code under ifdefs
>>    x86: hvm: compat: introduce is_hcall_compat() helper
>>    x86: hvm: factor out COMPAT code under ifdefs
>>    x86: pvh: allow to disable 32-bit interface support
>>
>>   xen/arch/x86/hvm/Kconfig          | 19 ++++++++++++++++++-
>>   xen/arch/x86/hvm/dm.c             |  2 ++
>>   xen/arch/x86/hvm/hvm.c            | 24 ++++++++++++++++++++----
>>   xen/arch/x86/hvm/hypercall.c      | 22 +++++++++++++++++-----
>>   xen/arch/x86/hypercall.c          |  6 +-----
>>   xen/arch/x86/include/asm/domain.h |  9 +++++++--
>>   xen/common/kernel.c               |  2 +-
>>   xen/include/hypercall-defs.c      |  9 +++++++--
>>   xen/include/xen/sched.h           |  9 +++++++++
>>   9 files changed, 82 insertions(+), 20 deletions(-)
>>
> 


