Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E332EAB966C
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986365.1371929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpIn-0002LO-Ct; Fri, 16 May 2025 07:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986365.1371929; Fri, 16 May 2025 07:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpIn-0002Iz-A8; Fri, 16 May 2025 07:16:17 +0000
Received: by outflank-mailman (input) for mailman id 986365;
 Fri, 16 May 2025 07:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFpIl-0002Il-Gc
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:16:15 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5e35b31-3225-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 09:16:12 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad238c68b35so326204566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:16:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d442069sm106230766b.103.2025.05.16.00.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 00:16:11 -0700 (PDT)
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
X-Inumbo-ID: a5e35b31-3225-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747379772; x=1747984572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EPuN4A8qZuSPbQNnYDinMdAiRz36z3O3U1gltDJApmw=;
        b=aYSc1PwmoFgkAtp+C+paOAI0XrLsWmwkEts39bwjIhF25VGq0DCnZ3GGKKdr1S0P1C
         XBtGbEa7yXJhzO5NOIhGaCF+xALq916PckxKX9mxnFJkClFExBbaJ+7BpYxiqyvR4gAT
         IytHggR776QkALx3taWr7osqdAy1yzh507zm54B/TTbJTtmcsGWvvV7w4FIgBTN2b9G9
         QE4R+Gp0tLaa9qk6vfIzMJZcTugzt7/A6PBukqxAIzA+L20/SvCTny/tJ8cx8nkePVap
         cS6ZSldTE6mSe+7cBnZuR4/JEb1bjNifQ9EYOFZ1asJlfBYSiGy2ogp9g4vP39kE1I1P
         9VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747379772; x=1747984572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPuN4A8qZuSPbQNnYDinMdAiRz36z3O3U1gltDJApmw=;
        b=MdJo5y33sQNSQHT5LoFhgRuMjEhRRJhlmxYoVamXx+TN28DVe9G502UQfcNDDmpVuN
         12L3t/hzA9fzy4OkKQqLAVFCJ9neeevBmWetuJoLwRhp7MK1QpmxLWQstnYM5L/e2eBH
         B3CfMe4v/ogLUeX+S0WCSeOd7i0N55rDA1J/t6rC8wNmOmXqbaxfpL42Ib6LqGcMILI/
         BhUg0wfUTsBTiO5HEWnsowfwFEe+XxDqOxjiyQfehzTEpU3cxsl5/9R+CvFP5lvjFYnC
         Cx4OV+y6TWrsfujVQh/FvCtnmQwCU7wbM706Gyg4S1cQpItjUx7VQJVANsLWkOYrKEBL
         zxrA==
X-Forwarded-Encrypted: i=1; AJvYcCWr6f7jQexBBuGFnPHb8k6UZ6hNYkvc+9EPkuQgl35Z4spe76M5vtwg0SoeJJdNt1YZWXQVAz79omQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtLJ0Sfr1C8C2ubWIAFjRSRIHkDfQ6atPcR78UhoWXnR7ez59q
	57vFvwJA3knS83FB14jYIBxDk5NU2h6J2vCBK9OMesF1XlQ1KrPPJ4WuCFiSq0rVig==
X-Gm-Gg: ASbGncvqH33MyowxKL2vWFnh9BLvcdEK3wNf7+ResVmTLyeh+m3O1U3/EM9ZeBoBCFW
	cLqkcsCDqOabM7mKWrllsaLa95tx8phdBROFOzyhIXl1H/ucLWymKJ84UTdRsZKQVShTuDIoqOf
	F7XYOK58xMXzwWxsD9zaDxcCiAuhdbjOoCIql/gBZbC/C5edeuh1yJNse8V/G7K09g1R3YKlusN
	FaS5b57RVhf9xpaVUiwGamqZSv2dPiNBAZgCy1+nmer7Z43bspEAq/QBSjevwU1NINWRd5KXaNU
	rDqndS9ggyCxWy0EwO30p0EwlYilzjgCpVIZ8DNqbvkwiJZKsbXDLnYkwXKUjHyRt5/qDuYXM8m
	InZoMlnP+5GG9XkVNLlNriRxcVVX1QoYug81z
X-Google-Smtp-Source: AGHT+IHhtz8kZegkRQ9494A/1oKKH/QDrLYmTtwMUTunreIDmSxHo2K2PKa2OYbCeBI2o5LhBmtrhw==
X-Received: by 2002:a17:907:940f:b0:acf:c:22ca with SMTP id a640c23a62f3a-ad536b5a48dmr123129766b.1.1747379772303;
        Fri, 16 May 2025 00:16:12 -0700 (PDT)
Message-ID: <8f7beebc-643b-4308-b8ff-c0b812eb8d02@suse.com>
Date: Fri, 16 May 2025 09:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] xen: introduce flag when a domain requires cache
 control
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-9-roger.pau@citrix.com>
 <b9a2b6fb-af34-443e-93b6-a5e827259a4b@suse.com>
 <aCXFeBGIr87MwELu@macbook.lan>
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
In-Reply-To: <aCXFeBGIr87MwELu@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2025 12:44, Roger Pau Monné wrote:
> On Mon, May 12, 2025 at 05:24:01PM +0200, Jan Beulich wrote:
>> On 06.05.2025 10:31, Roger Pau Monne wrote:
>>> Such flag is added to the domain create hypercall, and a matching option is
>>> added to xl and libxl to set the flag: `cache_control`.  When the flag is
>>> set, the domain is allowed the usage of cache control operations.  If the
>>> flag is not explicitly set, libxl will set it if the domain has any `iomem`
>>> or `ioports` ranges assigned.
>>>
>>> Modify cache_flush_permitted() helper so that it's return value is no
>>> longer based on the IO resources assigned to the domain, but rather whether
>>> the domain has been explicitly allowed control over the cache, or if it has
>>> IOMMU support and there's a single IOMMU in the system that doesn't allow
>>> forcing snooping behind the guest back.  As a result of this, the return of
>>> cache_flush_permitted() is constant for the lifetime of a domain, based on
>>> the domain creation flags and the capabilities of the IOMMU if enabled
>>> for the domain.
>>
>> This then further emphasizes the remark made for patch 7.
> 
> Hm, I think you are referring to the remark about how PCI device
> without IO resources would be handled then, and what would
> cache_flush_permitted() return then?

Or more generally the relationship between that and has_arch_io_resources().

> IMO the benefit of the approach presented here is that it aims to know
> whether a domain needs cache control to be set at creation time, and
> not altered during it's runtime.

I agree that having this not vary over a domain's lifetime makes things easier
for us. At the same time it may negatively affect performance of domains where
hardware devices are added / removed on the fly.

Jan

