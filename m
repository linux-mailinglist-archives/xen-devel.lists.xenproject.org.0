Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384DA87C133
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693372.1081356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkns8-0008DV-Jb; Thu, 14 Mar 2024 16:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693372.1081356; Thu, 14 Mar 2024 16:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkns8-0008Ap-Gy; Thu, 14 Mar 2024 16:24:00 +0000
Received: by outflank-mailman (input) for mailman id 693372;
 Thu, 14 Mar 2024 16:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR1U=KU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkns7-0008Ag-Jn
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:23:59 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41bff52e-e21f-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 17:23:57 +0100 (CET)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-781753f52afso67267685a.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:23:57 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05620a10af00b0078861322748sm992012qkk.102.2024.03.14.09.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 09:23:55 -0700 (PDT)
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
X-Inumbo-ID: 41bff52e-e21f-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710433436; x=1711038236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDYxu/GWIa2hifdrZpxrefOg8QGb0tTGr/kbspM9Ja4=;
        b=WNxqxORDRe4Tt8DFVKAtCcApIr+0q1nW0ZSyPiX31y0eTB77wd3o7pBjDQFic/k1y6
         tIcQxV3oqxnXVaICujb8zj/9xsqwCB3XR8Vd6WOWjUm15n/TUlYbgsmOtQfLI4RfGxJU
         m1G7f+eC4kUfcgfJE1Yb+LuL5XEG3X8LD/BZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710433436; x=1711038236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDYxu/GWIa2hifdrZpxrefOg8QGb0tTGr/kbspM9Ja4=;
        b=srYsIo1qjnMg1fcZBpCVcT9S6epLZSfpoQlmuPdSriNgX+JbzkaMXWvchArtZ3XMys
         ln+9Th8YElLv4mHtghyF+uBLr33IF6smeN2fNwLH9WPGd8j+h66Q+Il55VBSx8KH7Ztj
         2fZRHXui971Mzjaepi4m43YqyY+8Q9xRZ3We/5+HPDpjqOS1nC3pQLWdc1ZIwht8hTcg
         TNTXDt72LpoUkcS7AFcYWBQOid5D461vTems/pxHdOT6JkO3X4K8cTQJlnhjz73APM3v
         MIBY8e4tq04G2//L3IkA7GCAFctx0bBChpR/UTdCdl1rB53N5GEByNZEkN/vqqyO4TNY
         +8BQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2QBepQ2GZsGIaeYlx8zTyWs6BMGZWTSiJ1SdbZIieBs3G8IAmOTdVuI0yjL4eyc+xwBVWlAx+QHJgelT93yBTM3aVLw6OXIHgB8yfwyY=
X-Gm-Message-State: AOJu0YwiskCsBv5SKaaKm8tp7TbBr4eEyuKU5aReGhv9FwLXuvWg31kh
	v4hkNsCZYUWf7gYP+R9gtVw66wmgVYb4oRSZFMFc7azjNyxxmzK/JZ/hMI/2RVo=
X-Google-Smtp-Source: AGHT+IEoiWoAQRJk9XSdS6rJEGLf4gBKMzcz0OlRLuaAZmIm4lITzHUfBc17ecXEU/CaU0E94HuBVg==
X-Received: by 2002:a05:620a:4d5:b0:788:33e6:aac5 with SMTP id 21-20020a05620a04d500b0078833e6aac5mr2396491qks.73.1710433436507;
        Thu, 14 Mar 2024 09:23:56 -0700 (PDT)
Message-ID: <6a3c09a1-f35f-4d1e-bbba-342388da71ef@citrix.com>
Date: Thu, 14 Mar 2024 16:23:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] xen/bitops: Implement ffs() in common logic
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-3-andrew.cooper3@citrix.com>
 <76a1e81d-86d1-438c-975e-c4db46af93ee@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <76a1e81d-86d1-438c-975e-c4db46af93ee@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2024 2:16 pm, Jan Beulich wrote:
> On 13.03.2024 18:27, Andrew Cooper wrote:
>> --- a/xen/arch/arm/include/asm/bitops.h
>> +++ b/xen/arch/arm/include/asm/bitops.h
>> @@ -157,7 +157,7 @@ static inline int fls(unsigned int x)
>>  }
>>  
>>  
>> -#define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
>> +#define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
> The way the macro is invoked, I don't think the helper local variable
> is then needed anymore?

I strongly suspect It is still needed.  ISOLATE_LSB() double-expands its
parameter.

Either way, I'm not reopening that can of worms that lead to this form.
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -430,16 +430,23 @@ static inline int ffsl(unsigned long x)
>>      return (int)r+1;
>>  }
>>  
>> -static inline int ffs(unsigned int x)
>> +static inline unsigned int arch_ffs(unsigned int x)
>>  {
>> -    int r;
>> +    int r = -1;
>> +
>> +    /*
>> +     * The AMD manual states that BSF won't modify the destination register if
>> +     * x=0.  The Intel manual states that the result is undefined, but the
>> +     * architects have said that the register is written back with it's old
>> +     * value, possibly zero extended above 32 bits.
>> +     */
>> +    asm ( "bsf %[val], %[res]"
>> +          : [res] "+r" (r)
>> +          : [val] "rm" (x) );
> And this isn't what the compiler would be doing anyway?

No.  The builtin avoids all undefined behaviour, and is quite a lot of
asm as a result.

With some help from the gcc mailing list
https://gcc.gnu.org/pipermail/gcc/2024-March/243465.html I've found a
solution which improves things in the common case.

> Also, just to mention it: I take it that you/we are sure that disallowing
> both operands to be the same register is still better than ...
>
>> -    asm ( "bsf %1,%0\n\t"
>> -          "jnz 1f\n\t"
>> -          "mov $-1,%0\n"
>> -          "1:" : "=r" (r) : "rm" (x));
> ... the original form?

Yes.  Without any doubt, on a 64bit CPU.

This transformation isn't safe on a 486, but I expect even the later
32bit CPUs lacking register renaming would still be better with the
non-branch form.


>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -110,6 +110,21 @@ static inline int generic_flsl(unsigned long x)
>>  
>>  #include <asm/bitops.h>
>>  
>> +/*
>> + * Find First Set bit.  Bits are labelled from 1.
>> + */
>> +static always_inline __pure unsigned int ffs(unsigned int x)
> Why always_inline?

For all the normal reasons to counter Clang and GCC doing stupid things
with inlines that contain assembly.

>
>> +{
>> +    if ( __builtin_constant_p(x) )
>> +        return __builtin_ffs(x);
>> +
>> +#ifndef arch_ffs
>> +#define arch_ffs __builtin_ffs
>> +#endif
>> +
>> +    return arch_ffs(x);
>> +}
> Just to mention it: __builtin_ffs() takes and returns plain int. I'm
> happy about our own helper being unsigned-correct, but anything like
> this has a Misra angle too.

I did note that, and decided it could wait until some other point.

~Andrew

