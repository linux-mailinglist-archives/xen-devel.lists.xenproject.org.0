Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B78A2A892
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 13:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882816.1292902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg157-0003zP-Un; Thu, 06 Feb 2025 12:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882816.1292902; Thu, 06 Feb 2025 12:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg157-0003ww-RY; Thu, 06 Feb 2025 12:34:09 +0000
Received: by outflank-mailman (input) for mailman id 882816;
 Thu, 06 Feb 2025 12:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tg156-0003wq-Ip
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 12:34:08 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7dc3827-e486-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 13:34:06 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab777352df4so77078766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 04:34:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de38c0e993sm147132a12.12.2025.02.06.04.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 04:34:05 -0800 (PST)
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
X-Inumbo-ID: a7dc3827-e486-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738845246; x=1739450046; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LzkT0NtpYcF+4nH1QvFLCLq+J2jo2eQ1+tPDA6zqLX4=;
        b=IkyeUtwMDR/tXH9lIAcwntIGer5DFKDzQLHXwVLxV9A08CL9zN3Ev9ceGpetd9OGna
         1WVTLbJKT9j4esnGr+cetAGoWr50vPOfsuzssyDJ1jAGh2Y+DYD0vlcuWLmSCJdc6yjj
         hN4GCxzuJ1ELrtkr3HdiO5Mv94skGs/tPX2TvY+cqSqAD3CxvM2i3uJgn2xImQr9QxIX
         I5NzOycUIbiNuBMX5xLEN9sxnDG6E5kn0Ff0EO64cq9DoPNsosMK07lljchJhicnd2LH
         8YBAF64XGV7uUnpT4rzBydMZXE09DaiUQm4tmjY5gozir83aUwbu6CaISieitxHgmvpA
         ohWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738845246; x=1739450046;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzkT0NtpYcF+4nH1QvFLCLq+J2jo2eQ1+tPDA6zqLX4=;
        b=sm3JIzZ5tiJQ3jDE0pi2rKy3gWCGAxvK8mFHx41/ev0ebtM+CLZa66cF4oZyCOCUnR
         Rx2DL7to5UpuO4kSLnYcjQV6ddd+qezus3kVclSvIMU7FHZP96Ay9qSxEd5A2y6y2moA
         zBu+r962QbafmlFwrnY4psS/H1Q3tP2usmN4lX99vSMelEMiBsjoNj1DVQ/sAik2vg6J
         VJT3cqgQ8Sev9MkvzSIwcKbOvXNKdUbBrkuR3n4WzYf2IMzqXIvDbt/De7fKgTXr0Ih5
         LzjpugpgYZKCntv4WuyJ7WyykOwjPQC1nICEE2mYMTqYIm1FJaNWok2tth3/cJunmgzX
         QQVA==
X-Forwarded-Encrypted: i=1; AJvYcCViS/ed3dWzpodxvw2uOjJfPzO8xHWgegFbkoyu/Dlw2XJ5U7jci/PM+MQwTui3hpOw/07ObqFtNEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3uAkbrGRzWl9OK3Abj65Z9IUQES/0DgzLFnBJ+h1EycaeogT0
	IhOg+GVldHGoqgLkctZ8+h/jq2e/VrxhoI7B37LfTi3eehj4HIGbrqYGe30g1w==
X-Gm-Gg: ASbGncuIjJuAsncZSkNkxorOTiTvtZipooEgrY6+93QltiJcM42ZoMQqCY+AOemg+2b
	ekuDx6GdHLKQXLlXLc7Ee1lT2kVS+WmseVU2+AejrnoYP5a7gGakDtNl+fy0eZQ7SxWFJGDHUYM
	EImIdVvEZbhiR2gzxIi/6kPhIFRz5qDMOmrLh6a4dMYtAR1UJJuERVZBCwHbD/QVggdJP40IAJG
	3FqnVzXHSikl1QaPIDAHhB+y7AcN84h6wH7sP1lVVhCQlzwBlg9gWPQG2OLZ25HKSkWzwRH5Km4
	TNG0uuZ8XinIZodK104VvRQz4hRKRkzGhv7eSXeT1deG2JHv2eF09/+WMdol1JVnt2I8ByDpMTs
	k
X-Google-Smtp-Source: AGHT+IEzniGlO5CroEOj/20t40UApDH4VxII9TKUd9DZSeyDsK1InhvPlsCitPd3Em92aa1EVhQGCg==
X-Received: by 2002:a17:907:6d0a:b0:ab7:82d7:3d74 with SMTP id a640c23a62f3a-ab782d740b0mr20204266b.39.1738845246010;
        Thu, 06 Feb 2025 04:34:06 -0800 (PST)
Message-ID: <b3459204-fce8-409e-92e8-c4ace443e115@suse.com>
Date: Thu, 6 Feb 2025 13:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/mm: Introduce per-arch pte_attr_t type for PTE
 flags
From: Jan Beulich <jbeulich@suse.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <2b7f3e29fc1790978e2f615ee634f3a84bc340c9.1738789214.git.sanastasio@raptorengineering.com>
 <5a0e26ff-21fa-44c8-a1b2-3775e3ba00d9@suse.com>
Content-Language: en-US
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
In-Reply-To: <5a0e26ff-21fa-44c8-a1b2-3775e3ba00d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 13:29, Jan Beulich wrote:
> On 05.02.2025 22:02, Shawn Anastasio wrote:
>> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
>> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
>> represent architecture-dependent page table entry flags. This assumption
>> is not well-suited for PPC/radix where some flags go past 32-bits, so
>> introduce the pte_attr_t type to allow architectures to opt in to larger
>> types to store PTE flags.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>> Changes in v2:
>>   - Drop Kconfig option and use `#define pte_attr_t pte_attr_t` for arches to
>>   opt-in to defining the type.
>>   - Move default pte_attr_definition to xen/types.h
> 
> I'm unconvinced of types.h being an appropriate place for something mm-
> related. mm-types.h maybe?

To add to this (in an attempt to keep you from introducing a header of this
name, just to then include it from types.h): I don't think this type wants
exposing to all CUs. Ones entirely unrelated to mm (take e.g. everything
that's under lib/) shouldn't get to see it.

Jan

