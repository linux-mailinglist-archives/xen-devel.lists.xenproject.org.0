Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6909996E9A3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 07:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791543.1201425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smRzW-0002DF-E4; Fri, 06 Sep 2024 05:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791543.1201425; Fri, 06 Sep 2024 05:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smRzW-0002B0-An; Fri, 06 Sep 2024 05:58:42 +0000
Received: by outflank-mailman (input) for mailman id 791543;
 Fri, 06 Sep 2024 05:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smRzV-0002Au-1r
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 05:58:41 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10019223-6c15-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 07:58:39 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f50f1d864fso18733301fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 22:58:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc528d5dsm2016775a12.9.2024.09.05.22.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 22:58:38 -0700 (PDT)
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
X-Inumbo-ID: 10019223-6c15-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725602318; x=1726207118; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lu5VyGphng4iCeKuSnaZArJlre3r6mAXdUvNAVJ9YqQ=;
        b=COBV7XODytWZDsfm1OxijQcH29Nzy1FtUwu8tRkyeDaQbmGgqucsO7uCQeNrvf5zhC
         h0r+l5pEzNiody4G3bz3WQa1Tfr2s/v+Ot0Jg265GZ5rRuwY0MBaXHogrLD5vT8BIYqm
         BFseRYWvnYv3WRjw7uzxOXY/ACVoV1ZN+lKiZv7uFnVkAUqyR3gqdv3RZaaZBuKygczo
         ar1AOp+cX3wXq2aO+HK7wS1xDnzlsEa8IiEk7eal+qeQaMq1vdob7yhbDwhg9ggJNI09
         dohXrBDkTNRIlqydHwkrzYZSSP+LiqCaa84XNW7kggFDD1jpx+GJpWNUENgemhrITd1r
         2xVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725602318; x=1726207118;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lu5VyGphng4iCeKuSnaZArJlre3r6mAXdUvNAVJ9YqQ=;
        b=jhcJBi/w5UN+Qj9jDMPQh/nvbkmhTAtX6vuvPSKk+N6F9sY9x5YHYluK98U26pkvar
         bAKeGOrQzo5llQFqWO6MCpxCFm7xutwRSvu9Bg+8AoFtwIaXRtVoeawcbHLgjDliTIvM
         5kXIqzF4OpPU9d7xqMjeK5vTVH6MVrgPgBcsCEbGXiAlZsi0fkK7gBh44yJaXraaT11Z
         iwT2N5QLPyoqtV2aBTiEEMkgR3HaC+ROuERJTJrSr6pePFbtVtJZnvzLIiwFioH20UsF
         7o/CoawpexOPEpFoGdSaTIX2EnHbWZRZJqgLloz+rSG0/xn9988LELZ4+Qs9CpmL+KEX
         TG5w==
X-Forwarded-Encrypted: i=1; AJvYcCVePv/uJ/RPxI6jjKdjkx6PvoGVzOc4NCCGbJ/YIO5soQ4OR1Nz3gy9spkYlFcTBN2qwiK3/CtmlnQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRX1ZtGW7+H9Omq5Pw1lVKy8OpQ9nrjWj9TSp1bk8WEgOu7EtM
	NiO3mWsNB9Pg306znn4otEYiQkno2TD6MgLorDHoXaIWLVI/Tl5vIRWLiHXK5A==
X-Google-Smtp-Source: AGHT+IHmkVFiyM5bf3PhENXQQBavJBj3mtz504An+bCkZMU4eUcNvQgWW44G1IkQbGQ6wMao+jnzyQ==
X-Received: by 2002:a2e:be91:0:b0:2f6:6101:5a63 with SMTP id 38308e7fff4ca-2f751eaef37mr8037711fa.2.1725602318347;
        Thu, 05 Sep 2024 22:58:38 -0700 (PDT)
Message-ID: <b16e9d77-869a-4ea3-93a6-647d3873ea4f@suse.com>
Date: Fri, 6 Sep 2024 07:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/trampoline: Collect other scattered trampoline
 symbols
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-4-andrew.cooper3@citrix.com>
 <092700d9-101b-4bac-a500-7f03bd471d89@suse.com>
 <341fa9f8-eabe-44fd-a291-4032d5fa5994@citrix.com>
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
In-Reply-To: <341fa9f8-eabe-44fd-a291-4032d5fa5994@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.09.2024 18:10, Andrew Cooper wrote:
> On 05/09/2024 4:42 pm, Jan Beulich wrote:
>> On 05.09.2024 15:06, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/efi/efi-boot.h
>>> +++ b/xen/arch/x86/efi/efi-boot.h
>>> @@ -102,9 +102,6 @@ static void __init efi_arch_relocate_image(unsigned long delta)
>>>      }
>>>  }
>>>  
>>> -extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
>>> -extern const s32 __trampoline_seg_start[], __trampoline_seg_stop[];
>> I'd prefer if these stayed here, leaving the 4 symbols as minimally exposed as
>> possible. Recall that efi-boot.h isn't really a header in that sense, but
>> rather a .c file. Elsewhere we keep decls in .c files when they're used in just
>> one CU.
> 
> See Frediano's RFC series, which needs to change this in order to move
> the 32bit relocation logic from asm to C.

And it moves the declarations to the new .c file. Visibility still limited
to that one file. And (afaics) no Misra violation, contrary to what your
later reply to Frediano suggests.

> The only reason efi-boot.h can get away with this right now is because
> the other logic is written entirely in asm.
> 
> 
> Scope-limiting linker section boundaries more than regular variables is
> weird to me.  It's not as if they magically take more care to use than
> regular variables, and trampoline.h is not a wide scope by any means.

It's not "more than", it's "like" (i.e. no matter whether a linker script
or assembly is the origin of the symbol).

Jan

