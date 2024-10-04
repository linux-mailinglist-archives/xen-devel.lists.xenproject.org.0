Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB798FDA9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 09:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810040.1222650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swcRr-000054-88; Fri, 04 Oct 2024 07:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810040.1222650; Fri, 04 Oct 2024 07:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swcRr-0008UD-4h; Fri, 04 Oct 2024 07:09:59 +0000
Received: by outflank-mailman (input) for mailman id 810040;
 Fri, 04 Oct 2024 07:09:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swcRp-0008U5-6v
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 07:09:57 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8ef3b73-821f-11ef-a0ba-8be0dac302b0;
 Fri, 04 Oct 2024 09:09:56 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso279946166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 00:09:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102a5c77sm183905766b.63.2024.10.04.00.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 00:09:55 -0700 (PDT)
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
X-Inumbo-ID: a8ef3b73-821f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728025796; x=1728630596; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ho4Gysn78FpFLuRB5/FuNEVX/Eh9IgP/HwXqGwLJ9A8=;
        b=LGaC3E9uBUELkKbgTG32ZKT0qMF9iul3F7uZ3L8tShx4ko6cXqgc7L015N23NBZz5E
         mfex/gIEdnGSMQW1PPs/h1E4Z2fLA6eMYJtv/5lgMTNrUgDdGKYL45H61YuTQXHCIBWN
         95VM/p19zhR9B3zXpusoHwg9OpM0mSrScQdOB344LhnTVXQfQv8FpkjyWzSaPHG/Ncmc
         bECRyYKiA2IQZEQlM/wG2RWI5qynPm9mQRy8/D0kg/E1RarV3HLtUK/uCnS3mdLo/zxU
         0Z9sB+UgGG2lpx3NrgsoeRLuXmrL6rSI3PIWyD4SSJQRG4EaUDw75tmBN1Se9fQyA0RY
         im1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728025796; x=1728630596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ho4Gysn78FpFLuRB5/FuNEVX/Eh9IgP/HwXqGwLJ9A8=;
        b=ZwlagWqWhDcMAHDvL1jILMjoxTJvU/cCvQDyfX4R4HWZxY58zn2urbP227ouGOlw1i
         HoLEhHw2VajymEMhXg8gjYx3RR/O5dMuvMkhygENMQs+8x+Wp2HhAqlnhigYKpnRu8o0
         BuawxjsOcg6LQbkdwOsfuLBarI89cb8Wold5TUSJD8IehGZjJ9ff4zOruzbvsXVZQUfy
         KI8o/dH2BIalQHWcxl82lCvOKLjIJO4XTJSq/KA7IXM2RqKJmfMqkxQtR0rgeSJE9+Xh
         fuGSEKJIZpa6prXcXne2kh4JbFZTUxcZeC6pFHSqMbqCnD8U2gWvZzcM0fum1h5HWDu+
         J7og==
X-Forwarded-Encrypted: i=1; AJvYcCWtoKStxS/riWg3S60EO5TKFlBYmIrU9LOaJcoipKNj12Xz5PM/lYYg2TEjcNksUmWEYt+Y2avElAo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzX35xSwSzt9X7U03BGQ+4C4F2sfOG64GXTp7pdb4Oqwn/pOLS
	zCSHZDScbPlhA9uWIAK4EJD7cdMoyIHbQqtoW99j153Qo6lkXotsnkXcgtuLhw==
X-Google-Smtp-Source: AGHT+IFLkIw/REh/F2uJ6RspRrjUaBLpHbrryzSK71I/mL6kQZDGONSBZTNj0vSSbQBq2xciu65N3A==
X-Received: by 2002:a17:906:d7dc:b0:a86:7d62:4c28 with SMTP id a640c23a62f3a-a991bd4548cmr155016166b.30.1728025795715;
        Fri, 04 Oct 2024 00:09:55 -0700 (PDT)
Message-ID: <903de969-9546-4a75-9431-3a5da31d0eef@suse.com>
Date: Fri, 4 Oct 2024 09:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] tests/x86: Introduce a userspace test harness for
 x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
 <20241002152725.1841575-3-andrew.cooper3@citrix.com>
 <8827ea2c-bac3-47c1-b1b1-9a2a02168c43@citrix.com>
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
In-Reply-To: <8827ea2c-bac3-47c1-b1b1-9a2a02168c43@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.10.2024 17:38, Andrew Cooper wrote:
> On 02/10/2024 4:27 pm, Andrew Cooper wrote:
>> Despite claiming full APX support in the 2.43 release, binutils trunk doesn't
>> tolerate JMPABS at all.  Clang-IAS like it but only when encoded as an
>> immediate, despite the fact the operand should be a moffset and encoded
>> without a $ prefix.  https://godbolt.org/z/P4Ph3svha
> 
> Actually, no.  Despite overlaying MOV moffs/rax, to share decode with
> another instruction that has a forced 8-byte immedate operation, it's
> used as a proper immediate, not a memory address.
> 
> So on further consideration, the $ prefix is correct.

This one's actually pretty ambiguous. Other direct branches don't use $, i.e.
consider the operand a "displacement", not an "immediate". Except for far
direct branches, which have (two) immediate operands. Originally coming from
the Intel syntax world, where this distinction doesn't even exist, I question
that arrangement. Imo far direct branches should have a non-immediate and an
immediate operand (the latter being the segment / selector). That would also
properly distinguish which one's which. Yet that ship has sailed; we could
add support for the alternative forms, but we can't drop support for the 2-
immediate variants.

I'd prefer to not repeat the mistake for JMPABS: The destination generally
is a symbol, and hence more natural to use without $. In the end it may be
prudent to simply permit both forms.

In any event I've added to my gas TODO list the need for JMPABS support.

Jan

