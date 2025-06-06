Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6EAD0226
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 14:24:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008494.1387771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNW6n-0001Fn-Oc; Fri, 06 Jun 2025 12:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008494.1387771; Fri, 06 Jun 2025 12:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNW6n-0001DY-M4; Fri, 06 Jun 2025 12:23:41 +0000
Received: by outflank-mailman (input) for mailman id 1008494;
 Fri, 06 Jun 2025 12:23:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNW6n-0001DS-1e
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 12:23:41 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1318c193-42d1-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 14:23:38 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so1512094f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 05:23:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603078d65sm11356755ad.5.2025.06.06.05.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 05:23:37 -0700 (PDT)
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
X-Inumbo-ID: 1318c193-42d1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749212618; x=1749817418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KHdzGdxdJ9jH5o+5dFL/LcSH6lFlDVOsAbHtZ/Eh9bU=;
        b=YjdNE+qmzOxukwUVqOPtOnkdEVR1FK5Xy+vGsUW+LJZmCo+mh7p/1V5goUW03T42PU
         AHFg9kIDM+XbayyfHzhmpZG8fsVOpHnDsDFS1P8llnTRoa4JqZzi8QqdVtBQUGONFJJB
         yuQMLNQ7lmW0m9vjVPX187vIZtdBJFj6V7z67NpX9uWx3DAK/Gtkn+BF2IfGY3jxNsn8
         KEViR2C4NNIwjbUQ++qu7HCwXF0f50Q85gZ7Ql/VOzh+ylIt7A4y+asw6dRvYcp/RhKW
         wV9ByeZRHBY7GpNEDKn4CQVMY0jzYH/1sZ5ZALxUrT9is/3c+BkDMomyQmc4zIfnmvjT
         9J4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749212618; x=1749817418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHdzGdxdJ9jH5o+5dFL/LcSH6lFlDVOsAbHtZ/Eh9bU=;
        b=pQaQZLLIR2XHFoNvR3WIoNOe6dorqvXeb51I6o9cSc2yMMr4N9o1r62X1Nh+UNJPf2
         NxxmW4sG2YDu/PhDo0EKIeyhA7Tv0mDm1uuwz1q/+XALL3lgApPLHvcdgqJD39Md38Mz
         V5ppIcf5fVddn+5fcJxyESCQcfxFlxuevYteazpfs/xswgZKQ3M2HyKGRB6GT/+U/MDo
         37h9X+t0GNtwJ55BRL+zYvsWo89gPwIxAOW+uyMP5Y8dvs7biSVLAFBI5IIOMUTlfnxg
         SY3HYy2e+UbleR9iSY9o7dLbMckNBHkYASWQHD/0HQDoqRo0LyVdlVJI+LHWn+sSKJ0G
         PwZA==
X-Forwarded-Encrypted: i=1; AJvYcCVlH0LFo8zpR0Nc/VKCoT95pH6q8caEa5H5FFlHcJSfMM+txHxrZnajjCPY95DYYMftrOmhx7R8Cs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxP9+74Zh58qflYmDvDn6XX4ooRpCdjcMIPr8xOp/7ur/Hn2viD
	FkjJW2z3YASq++SQ12V0BEAFYAzu3XOahY8Cfi7LU/XTv5v1nNr1CbQS3qAxzF0ZNA==
X-Gm-Gg: ASbGncuUKV6F/jEw/zctfsTlo84PFIqGTS/5R/d5U9s5cGE9phGylP28oP7SLILsIcK
	ME01GpcVWhTyWtoml9SjEw9f9KivtF2yklUG6SXA0c0P9FL0fOvIqdNaMFG/mDxxSZuFg1Qd0sl
	aRkpwdM6ZWGCglRgtkGkJ21cG4pCBZBsURgQ0Xfwz1KMuBPDR2PNarGHMLRX5Tnw7zXyYVrK7Jp
	M5yONFtgAw1hp2B2fHd4rBEXXtDvFgsRCmnl+3wWfbnOK0IlO/e3spBq9VvIpoUoVBEoj6exTyg
	OpI49IflxPvQovrucYt5Jl1K1KMcye43eEhJp5QybEeDHJZ/zCJvokgpTeDz8q1wewY7UT4DGpO
	gSiO6kzbb1IPHvSVbh5gz1Oat2aWmw1RD1UMoZ7pJ4IzBoBg=
X-Google-Smtp-Source: AGHT+IHborE7MT15/hhoZpac9B1XuwQpHpW0607nfflNxpEHBfKMPLUyExfowzvylOUEumQCiEJr7w==
X-Received: by 2002:a05:6000:2507:b0:3a4:da0e:5170 with SMTP id ffacd0b85a97d-3a526e1ed18mr6679358f8f.27.1749212617920;
        Fri, 06 Jun 2025 05:23:37 -0700 (PDT)
Message-ID: <34c4a8a0-e4fb-4db5-a8b4-19f3e34957ac@suse.com>
Date: Fri, 6 Jun 2025 14:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] arm/gnttab: Break links between
 asm/grant_table.h and xen/grant_table.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-3-agarciav@amd.com>
 <765d42ec-a421-4b8c-80bd-30c909e81e8d@suse.com>
 <DAFD46XOYPG8.3V37FNPAPPT3T@amd.com>
 <66d75dad-4407-4b09-8dd3-c61b5d05ed91@suse.com>
 <DAFDPTBLTEL9.3MTSVY5O3ONL0@amd.com>
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
In-Reply-To: <DAFDPTBLTEL9.3MTSVY5O3ONL0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 12:30, Alejandro Vallejo wrote:
> On Fri Jun 6, 2025 at 12:07 PM CEST, Jan Beulich wrote:
>> On 06.06.2025 12:02, Alejandro Vallejo wrote:
>>> On Fri Jun 6, 2025 at 8:52 AM CEST, Jan Beulich wrote:
>>>> On 05.06.2025 21:47, Alejandro Vallejo wrote:
>>>>> --- a/xen/common/grant_table.c
>>>>> +++ b/xen/common/grant_table.c
>>>>> @@ -42,8 +42,10 @@
>>>>>  #include <xen/xvmalloc.h>
>>>>>  #include <xen/nospec.h>
>>>>>  #include <xsm/xsm.h>
>>>>> +
>>>>>  #include <asm/flushtlb.h>
>>>>>  #include <asm/guest_atomics.h>
>>>>> +#include <asm/grant_table.h>
>>>>>  
>>>>>  #ifdef CONFIG_PV_SHIM
>>>>>  #include <asm/guest.h>
>>>>> --- a/xen/include/xen/grant_table.h
>>>>> +++ b/xen/include/xen/grant_table.h
>>>>> @@ -27,10 +27,6 @@
>>>>>  #include <xen/rwlock.h>
>>>>>  #include <public/grant_table.h>
>>>>>  
>>>>> -#ifdef CONFIG_GRANT_TABLE
>>>>> -#include <asm/grant_table.h>
>>>>> -#endif
>>>>> -
>>>>>  struct grant_table;
>>>>>  
>>>>>  /* Seed a gnttab entry for Hyperlaunch/dom0less. */
>>>>
>>>> The description doesn't make clear why these two files need changing.
>>>
>>> What sort of description? I removed a conditional include  and added it to one
>>> of the few places it didn't include it already along with xen/grant_table.h.
>>>
>>> The title does say the patch removes the crossed includes in asm/grant_table.h
>>> and xen/grant_table.h.
>>>
>>> It's, I hope, self-explanatory regular spring cleanup.
>>
>> Then I'm sorry, to me it isn't. "Break links" has an entirely different (file
>> system) meaning to me, in the common case. Plus that says what is being done,
>> but not why. And it's the "why" that I'm seeking clarification on. From your
>> response to my remarks on v1 I was concluding that the issue is that in a few
>> places asm/grant_table.h would need including additionally. I didn't expect
>> any #include to (need to) go away.
> 
> Let me take a step back then. How about this commit message for this same patch?
> 
>   xen/gnttab: Remove cyclic includes in xen/grant_table.h and arm's asm/grant_table.h
> 
>   The way they currently include each other, with one of the includes being conditional
>   on CONFIG_GRANT_TABLE, makes it hard to know which contents are included when.
> 
>   Seeing how nothing in either header depends on the other, let the include sites
>   include both if both are needed.
> 
>   Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

While definitely better as a description, I still don't see the point of removing
the conditional #include from xen/grant_table.h.

Jan

