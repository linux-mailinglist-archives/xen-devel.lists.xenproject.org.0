Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E9384B15A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676700.1052925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHqR-0004PT-Em; Tue, 06 Feb 2024 09:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676700.1052925; Tue, 06 Feb 2024 09:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHqR-0004NF-C7; Tue, 06 Feb 2024 09:34:23 +0000
Received: by outflank-mailman (input) for mailman id 676700;
 Tue, 06 Feb 2024 09:34:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXHqQ-0004N9-6i
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:34:22 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e71c25c8-c4d2-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 10:34:20 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d090c83d45so40151481fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:34:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n1-20020a05640206c100b0055fd90b0556sm836293edy.90.2024.02.06.01.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:34:18 -0800 (PST)
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
X-Inumbo-ID: e71c25c8-c4d2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707212059; x=1707816859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d9nNKtEgZz65B54Rk3a0q+Gvw5E3vaE1jvwO7dd9KVQ=;
        b=fgIbipHyq/mD2Q7q2EoA3KzNUcP4Z/JSbJ183VJEiO1Y7DVVXJE2kLT5SMjnHmGlIe
         YoH9nRqfjJkThQw7P06ifC32lVLOrZK0mXWE+ZP2/5Yyu7PVFKQjyNiRtTWq+sBZ7Pzt
         NawNve/y9GGyW+U71Bdsw2ETiw1EBMS4pFlPxinnxJckhpHHqTfE73D9r6Fm7vWMFsEB
         b360qc/1t/Q5l3rgzGe7owe1m60nQCtOBORHBCJ6qPHFnBQeJnXlBqPyJXiwTxt10IR1
         XqSH8aZ41nCuJauJKTnRhKvOZb6KY1kTUcyYmw1mY4ZIVTfYMmzWBIiZQSGHlb8gHdav
         DZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707212059; x=1707816859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9nNKtEgZz65B54Rk3a0q+Gvw5E3vaE1jvwO7dd9KVQ=;
        b=G0k3Ye6Yc3sS0CuXBGjVpTbu5J+ZFd8tCfyZjXDptzBhQM9YVAPrsB7POE6I8Cbk4x
         o4F6oGteQd/d3Twy5pUZl7+eCQtWPEJ4L/W3No7MhedhtwU0pKfZyKxuU8u5bMWuEAjh
         pnPFl3+y6+aGCUs3GO8fniyzCMkiKd6HxVr0LdOR9K8Qs7/x3Y2Vx+uKLOhgWZ9ShUFa
         Ie8ON1j0svu7j0FhcIBhsxFwwjCYwXUIb1wducmtBDXSEhk62f50OUiyfBxJjesKNLC6
         uSjF6PkIhEA3JNqn+2fuQTfj4dc5/+wjoqegN6M+kA6MSCIemRlOY6cUHxGlrTmSIamf
         lB+w==
X-Gm-Message-State: AOJu0Yw1zW8yFyu2sSCbwgnvY8FB4G9/SsyTwUVDzGKrNZbZkm3Fm2U6
	PRH/BNwXcAV9juNb8EF8Jy8rVsHxQfaojLVTnFO8rDzBcG0HgVs5iTUo91OUOg==
X-Google-Smtp-Source: AGHT+IH7jvvefEXIsXF/CAVB+vVMCHIJrhUenBSP+iKIREr0wPKr0mOzWcNAKL/R7oPBRVqxn6tsqA==
X-Received: by 2002:a2e:95c9:0:b0:2d0:9efa:666f with SMTP id y9-20020a2e95c9000000b002d09efa666fmr1536096ljh.21.1707212059020;
        Tue, 06 Feb 2024 01:34:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXBVf3WloR43BkmJiX3X/UfAh5+rShGkDL/YoOJPiRKM6Je7XXY740I5amSKOwRSsgknjjtjOlLXVRl8oC50HVndpQY7mT1wacwErA+6LrxCBsv5gQFgzUP4JUPc1Mo0mzTWI8ROrotQT23jsdzae0cDRIMMhkoQnhssrWXUfts63dkNyNRiZ6XJMwC174=
Message-ID: <1256d6a8-5744-4790-b12c-8a36b9d144ed@suse.com>
Date: Tue, 6 Feb 2024 10:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitmap: Compile with -Wsign-conversion
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <20240205151454.1920291-1-andrew.cooper3@citrix.com>
 <072da633-de82-4d93-b467-8372973406fe@xen.org>
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
In-Reply-To: <072da633-de82-4d93-b467-8372973406fe@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:55, Julien Grall wrote:
> On 05/02/2024 15:14, Andrew Cooper wrote:
>> Use pragmas to able the warning in this file only.  All supported versions of
>> Clang understand this, while older GCCs simply ignore it.
>>
>> bitmap_find_free_region() is the only function which isn't sign-convert
>> clean.  This highlights a latent bug in that it can't return successfully for
>> a bitmap larger than 2G.
>>
>> Add an extra check, and explicit cast to silence the warning.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>>
>> Slightly RFC.  This is our first use of pragmas like this.
> 
> The only other approach I can think of is specifying the CFLAGS per file 
> like Linux did. I don't know if our build system supports that though.

It does, see e.g.

# Allows usercopy.c to include itself
$(obj)/usercopy.o: CFLAGS-y += -iquote .

in arch/x86/Makefile.

> AFAICT, the only advantage would be to avoid duplicating the pragmas. So 
> this is not a strong preference.

My other concern there are old gcc versions we still support. I haven't
checked (yet) when support for these pragma-s was introduced; I only
know they haven't been there forever. However, ...

>> --- a/xen/common/bitmap.c
>> +++ b/xen/common/bitmap.c
>> @@ -14,6 +14,9 @@
>>   #include <xen/lib.h>
>>   #include <asm/byteorder.h>
>>   
>> +#pragma GCC diagnostic warning "-Wsign-conversion"
>> +#pragma clang diagnostic warning "-Wsign-conversion"
>> +
> 
> OOI, any reason why wasn't added at the right at the top of the file?

... this may be relevant: Inline functions may have an issue with being
processed with the warning enabled. Otoh it may also be a problem if
the warning isn't enabled for them.

Jan

