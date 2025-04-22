Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D178A96F39
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 16:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962707.1353862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7EtC-0003dD-KR; Tue, 22 Apr 2025 14:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962707.1353862; Tue, 22 Apr 2025 14:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7EtC-0003az-GO; Tue, 22 Apr 2025 14:46:22 +0000
Received: by outflank-mailman (input) for mailman id 962707;
 Tue, 22 Apr 2025 14:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7EtB-0003at-AP
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 14:46:21 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8869e8db-1f88-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 16:46:11 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso39380585e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 07:46:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6dfe4esm174788745e9.33.2025.04.22.07.46.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 07:46:10 -0700 (PDT)
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
X-Inumbo-ID: 8869e8db-1f88-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745333171; x=1745937971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tq3bLS60OtZQwZ8RKs91TCHStfyD8zsWHDBgp1u9xQU=;
        b=LbBZ1iLTf7f4hQZXlsJMKKsUo+TN8+EEoK69/JaAr3iBegdEoZxynEJS/pbbNBvvLo
         JjTqnJ8h7qQxaj9ZaVyC5GClzgfwo2L7hApB5LfuaskC0BbEoiXZe1kxrnh+IstxkWsh
         b0Vy0Rl0xwh8v8i80MaSmTfhXyxOcdnK9np+fRZMFEj8t27xBbxgcdkbPk60VORr8Gpx
         P+75MNMmzNCQGfk7lAoAT8xc1vovvPBT5yJ88SMwngH3pP/yxrl+OG6yz6Ds0WY1LvNJ
         P/yCz1PCLy35G8AryE2GxSZfTM+bECCUY6SiqDcCdWLYXu7cUTYsNX337GalfPwAs5pQ
         EcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333171; x=1745937971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tq3bLS60OtZQwZ8RKs91TCHStfyD8zsWHDBgp1u9xQU=;
        b=FGvDYvBK6qQXtfBVcubph3pyk9CS03KDPytsP0OLPbShoJYhDprD0dmgrKLcOZrGGl
         Zzin396rIHuWUqUJrKl3bU4idlh2YhJBlJK9foZw9A0BSuW4rfeomJZX/BX9jV1Hfhax
         nQnqdZewMdLsXBKp+Tg9SKxDXJxQesOMNC5NfQN0TvjGDN5b8fK2YWaMpudCxKPMcAau
         4Qe4zMUSnL9MatwYqrE061aOM0KhdpPxlrq39mgHtLsiycYSdNB+ETaeAx/AN+2M49da
         8I2b6mzp76gsNoFS2G+GnyaSCfLIVKU6n1z1c5E5bi7HbH5C1DdtTUsmKvNYXS7BZP2x
         B8Og==
X-Forwarded-Encrypted: i=1; AJvYcCV0jeX44XQn33glp3GiHgR1IMr6hKf436kTUd2i2l4SIi+DAXYqLmrZSDmYbjEEHs3n0TvcuXBuQ0E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu0Py2IwYmtL7OyjqNw5az6IQDliAFbWmFJFvGzyK/tVEfX7lc
	knMw7d+5Lqj6fdxWkAahD3rszupNC5EpUEJ3FTzmNvkGeJmll0ereM42mWm7Cg==
X-Gm-Gg: ASbGncuwjAP82jWyTW3mTI0Q/owtJpFbTODTl7ZwHURRySHE06lGyCsj2+zaX7PjuYT
	C7aMmbDo3/C3CgTzYtDh/IYCnhDJYVFs2GjS7EXPQgr5whOQp2qLmEiFUMAJqYvYxWSq2hPtMPB
	uKrqnJyh6tZhm/wwzfCbZ5bN2jB7WeV3uXG/3PLkEgDsnrRfZtV+iMsKaQJAoUZsTBCVNG5Ud/N
	YHRhBvOPMwlhcFRF/hDYBS0Au72sw0lehg+gqFdN5+gD+PeBb6OnNiLnOWEyVpTvg902yYTVECT
	Z4fw3hkhG2lb+yK3ZPwL9xLfSTm4FQPoTK1OQ5hwOhRckO1ciHOo9ItmMn5ZsyiGXY/3kwsROMM
	byNr+mC//epzdObiUdmhVnCXk2A==
X-Google-Smtp-Source: AGHT+IGrb4FoI6XzoNoQvtkLk6D7AbXWJRARXvrqAuve5ULTlwr732gqgx1QeEljpLX7ExPg8vW5lA==
X-Received: by 2002:a05:600c:3592:b0:439:9e13:2dd7 with SMTP id 5b1f17b1804b1-4408188366cmr79770875e9.2.1745333170681;
        Tue, 22 Apr 2025 07:46:10 -0700 (PDT)
Message-ID: <868507a4-a1ac-4900-b59e-76ed182ee6ff@suse.com>
Date: Tue, 22 Apr 2025 16:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Include .debug_str_offsets in
 DWARF2_DEBUG_SECTIONS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250422113247.1285339-1-andrew.cooper3@citrix.com>
 <82a02afa-c1b7-4656-8f34-bd4886c9fb9f@suse.com>
 <53964eef-bfad-4d3e-93e5-8a18ba2f3cc3@citrix.com>
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
In-Reply-To: <53964eef-bfad-4d3e-93e5-8a18ba2f3cc3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.04.2025 16:42, Andrew Cooper wrote:
> On 22/04/2025 1:13 pm, Jan Beulich wrote:
>> On 22.04.2025 13:32, Andrew Cooper wrote:
>>> --- a/xen/include/xen/xen.lds.h
>>> +++ b/xen/include/xen/xen.lds.h
>>> @@ -56,6 +56,7 @@
>>>    DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>>>    DECL_DEBUG(.debug_types, 1)                     \
>>>    DECL_DEBUG(.debug_str, 1)                       \
>>> +  DECL_DEBUG(.debug_str_offsets, 1)               \
>> The alignment wants to be at least 4.
> 
> I checked before making this patch, and Clang uses alignment 1 on the
> section:
> 
>> [8134] .debug_str_offsets PROGBITS        0000000000000000 16fe11d
>> 21c868 00      0   0  1

Oh, I'm surprised. The table holding 4- (or 8-) byte values, it should
have better alignment already in object files, I would think. Feels like
a bug / oversight in Clang.

>> [8135] .rela.debug_str_offsets RELA       0000000000000000 2089e08
>> ca6b60 18   I 8136 8134  8
> 
> Is there an official spec on the matter?

I did look through the Dwarf5 spec, but could find any detail of this
kind there.

Jan

