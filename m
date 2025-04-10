Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EDDA83B80
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 09:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944961.1343258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mXy-0002MN-Qe; Thu, 10 Apr 2025 07:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944961.1343258; Thu, 10 Apr 2025 07:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mXy-0002JJ-N3; Thu, 10 Apr 2025 07:42:02 +0000
Received: by outflank-mailman (input) for mailman id 944961;
 Thu, 10 Apr 2025 07:42:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2mXw-0002JD-TM
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 07:42:00 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 487431a8-15df-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 09:41:58 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso3842775e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 00:41:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89362fd6sm3988887f8f.16.2025.04.10.00.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 00:41:57 -0700 (PDT)
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
X-Inumbo-ID: 487431a8-15df-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744270918; x=1744875718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XjRhhVX2nojq0Dt8H3iGowC6FJrHqQ54cR6D41QMAiQ=;
        b=a6iMriDToIXDSNdwXtFkNSjlcJKFYKmgCksbMXrwdrXJZPeYLN5Es2x5gHsW2ztdLL
         aPGRFFROd2EPXo5Ydf5CUclJOVeHwzhIWbKIIvSZBNhpfNnzJ94dE1ovj0VevalhDUkj
         2KA1v4AU4UXEOTxqz01FN78g0oSUpkKx0wLNDgWRNplWoXsXxGe8AhXaQ550ty7jsYRC
         6CLbSOmKCAX+S5GMU0/vKHJtHGF87NniJxEBK+wrq+ylrMTOWhecn7rmV7wRmWJdquNO
         fbiRwDG85niV0Kzdadmt6t7efMLfrtm1ZJmsdJIXHugAh8wb4XmdOFH94b4/Yo0hrPrt
         yGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270918; x=1744875718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjRhhVX2nojq0Dt8H3iGowC6FJrHqQ54cR6D41QMAiQ=;
        b=w7PBi1mpKa07EqYQ8XrNzu8McdOSLFCssYQqT7N96KIHXA0rI/TTlxON5WYIoVkYfR
         s7cbXqyUczEHnQGlGSw3lSQbSl55mkiBPG6BoA2gYPYYyOCrl+zof0HO7takKN8UlYOL
         RA/Vsau9EaiEvVnBSFHdEk50LnMHeBCCecwYFsDs666TIumEF/OsVtz57xbm76UFOsNC
         nJss9uBv42SROPvdKgPF8Z9KvnjT1f+u6A6XArfQOekhAiMBNY6WAfrsZ5B0NY69Jd51
         1aK/potRTevk16TLPUFMFQ4db7vZfHTNX/yz1gPYDpVxHj8QIM+zpqKYbrbboQ5B9H4Y
         D5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrj2ZGEFR5OlEg1GRDGD1I/IxETO/N75TOJ7xndh1BJcsmsyTmBFQyEovhW1wWEOEK751geUSkn1c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnOCTdPg4u/8+FzMNRlULd9l7THvCMDFI9pwqKE0sCZyi/651k
	Ff2+1rFtf4aHqqg7gyDQJo5bIuFye0LKvvbldv92htusOQOp8PSDMpZAllsDtw==
X-Gm-Gg: ASbGncut/ljBVEUJSrbFEJVMy22D8xC0rt06JNMxFo7bLIs2ry7AsTgRTRN+wexYUgb
	mQWGeYNlDnOnbvLHGJGF3RJDI7h9a4ofSiLC9zqJ9Qv5hceI26H2xEsNejEzkIx7LFwjL92FzG2
	dlQbOmY91A8lgRSoyCMeOtuGOc8n6HNM6+GL5kgCpG4vUrKC/QDkIXLr7oaO7TONvHJuQptRYgd
	VJ/axzBkyGGcQHKAojWTigPwFrscAEUaRVXeX9sic4HamhK7pURGUK6kdmGV/UTxlSrRKeomAFF
	hdcm3wxwlGt0PaBUOUpOpLpBotZIYHAz42YiHyKP4Kv9apd2BiZJG9JsrMGJREOrFcmPbVCBfcA
	aaM2LF6zYKtIzhva+zR6yk6RYiw==
X-Google-Smtp-Source: AGHT+IGkfreKLo5aUa5O4oSTtfus8YA/q+W6MFLV9KJCspejiY5REvbuJhW0OrslwtFv/KcV5XMMxQ==
X-Received: by 2002:a05:6000:250e:b0:39a:ca59:a626 with SMTP id ffacd0b85a97d-39d8f4988acmr1328447f8f.28.1744270918071;
        Thu, 10 Apr 2025 00:41:58 -0700 (PDT)
Message-ID: <44ecdfc2-2bf5-4445-b861-71b43b435c31@suse.com>
Date: Thu, 10 Apr 2025 09:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] x86/mkreloc: fix obtaining PE image base address
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-3-roger.pau@citrix.com>
 <6c37ad18-a830-453e-a7ff-fb4978e3f0df@suse.com>
 <a14a7a42-cf7e-463b-a87d-e302ce32371b@suse.com>
 <Z_UGr0A8LetHDJvB@macbook.lan>
 <3364268c-41c9-47ed-a6d1-b8ee04118a46@suse.com>
 <Z_dxNnfBOP88tAKi@macbook.lan>
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
In-Reply-To: <Z_dxNnfBOP88tAKi@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.04.2025 09:20, Roger Pau Monné wrote:
> On Tue, Apr 08, 2025 at 02:34:48PM +0200, Jan Beulich wrote:
>> On 08.04.2025 13:21, Roger Pau Monné wrote:
>>> On Wed, Apr 02, 2025 at 09:46:53AM +0200, Jan Beulich wrote:
>>>> @@ -54,31 +56,40 @@ static unsigned int load(const char *nam
>>>>  
>>>>      if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
>>>>           read(in, &pe_hdr, sizeof(pe_hdr)) != sizeof(pe_hdr) ||
>>>> -         read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) != sizeof(pe32_opt_hdr) ||
>>>> -         read(in, &base, sizeof(base)) != sizeof(base) ||
>>>> -         /*
>>>> -          * Luckily the image size field lives at the
>>>> -          * same offset for both formats.
>>>> -          */
>>>> -         lseek(in, 24, SEEK_CUR) < 0 ||
>>>> -         read(in, image_size, sizeof(*image_size)) != sizeof(*image_size) )
>>>> +         (read(in, &pe32_opt_hdr.pe, sizeof(pe32_opt_hdr.pe)) !=
>>>> +          sizeof(pe32_opt_hdr.pe)) )
>>>>      {
>>>>          perror(name);
>>>>          exit(3);
>>>>      }
>>>>  
>>>>      switch ( (pe_hdr.magic == PE_MAGIC &&
>>>> -              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr)) *
>>>> -              pe32_opt_hdr.magic )
>>>> +              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pe)) *
>>>> +              pe32_opt_hdr.pe.magic )
>>>>      {
>>>>      case PE_OPT_MAGIC_PE32:
>>>>          *width = 32;
>>>> -        *image_base = base;
>>>> +        *image_base = pe32_opt_hdr.pe.image_base;
>>>> +        *image_size = pe32_opt_hdr.pe.image_size;
>>>>          break;
>>>>      case PE_OPT_MAGIC_PE32PLUS:
>>>> -        *width = 64;
>>>> -        *image_base = ((uint64_t)base << 32) | pe32_opt_hdr.data_base;
>>>> -        break;
>>>> +        if ( pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pep) )
>>>> +        {
>>>> +            if ( read(in,
>>>> +                      &pe32_opt_hdr.pe + 1,
>>>> +                      sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe)) !=
>>>> +                 sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe) )
>>>> +            {
>>>> +                perror(name);
>>>> +                exit(3);
>>>> +            }
>>>> +
>>>> +            *width = 64;
>>>> +            *image_base = pe32_opt_hdr.pep.image_base;
>>>> +            *image_size = pe32_opt_hdr.pep.image_size;
>>>> +            break;
>>>> +        }
>>>
>>> Since you are already refactoring much of this code, won't it be
>>> clearer to fetch the header inside of the switch cases.  So that
>>> there's a single read call for each header type?
>>
>> Except that the switch() itself uses not only pe_hdr, but also
>> pe32_opt_hdr. That could be re-arranged, but I'm a little reluctant to
>> do so.
> 
> Hm, I see, the magic field checked here is in the extended header, so
> we would need to fetch it ahead of the switch in any case.  How
> unhelpful.
> 
> One thing that I find weird about this code is the obfuscation of the
> switch condition, won't it be easier to read as:
> 
> if ( pe_hdr.magic != PE_MAGIC ||
>      pe_hdr.opt_hdr_size < sizeof(pe32_opt_hdr) )
>     fprintf(stderr,
>             "%s: Wrong PE magic or missing optional header\n", name);
>     exit(3);
> }
> 
> switch ( pe32_opt_hdr.magic )
> {
> ...
> 
> I would assume the current arrangement is done as to reuse the
> `default` error label, but IMO that switch condition is too hard to
> parse.

Well, yes, I have a tendency to code things like this to re-use code
where possible, but I (meanwhile) understand many people don't like
the result. Doing this differently would be a separate patch though, I
think. Anyway - to catch the maintainers' attention I guess I'll (re-)
submit the patch outside of this thread.

Jan

