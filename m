Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789FA9C252
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967501.1357291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EpW-00087O-JH; Fri, 25 Apr 2025 08:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967501.1357291; Fri, 25 Apr 2025 08:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8EpW-00084G-Fq; Fri, 25 Apr 2025 08:54:42 +0000
Received: by outflank-mailman (input) for mailman id 967501;
 Fri, 25 Apr 2025 08:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8EpU-00084A-Rm
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:54:40 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6f0536a-21b2-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 10:54:31 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so8470035e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 01:54:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a538f4e3sm17053495e9.36.2025.04.25.01.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:54:37 -0700 (PDT)
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
X-Inumbo-ID: e6f0536a-21b2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745571278; x=1746176078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kX0GFG7ueQSP9itJd/oJ/9mcPcF7pU0wIEBIx0MCoQs=;
        b=aKV33tS9JpkXn1+mAjB2f3dRNwvvO2zZlo6sYkY0oVSFFuRSAxr8Qmm52vLlCwoikK
         XFJQVjR7lN//S/FfSMQvf5i5G2zHHzgoFt2ed/HEPg9C5gzdZVk911UXOreQMDzW+xet
         1yqXCQMxaKElSVdlLpMOTd+nh1lrtzAuWsk4xkimoJPM8M2CkviAfi3Mjf2A44qkCpqc
         IF8StrD5r5ZvNzCe6SKiZr7DeUcWYEZBwtHIT6QIwEzjnKMtyz6aa+wUbc/l43ght5d7
         oPCvhZ5dmwRR5JzEVRGLTcQvK+oDp/K+vHdMwxtdd0deU+YJNQyK5b5qk6KHq8rbwIvM
         NAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571278; x=1746176078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX0GFG7ueQSP9itJd/oJ/9mcPcF7pU0wIEBIx0MCoQs=;
        b=nPaaiK7mtwYAo8NsK1IXX7JVN1gYejjtVw/DTPIZBAa+OLdTvQLOyRw73BZsh53AGH
         96V9WMdHEW4D1EeQk2+Cd/8TDEhZdvnG9FZsOeCQUlD1v8FUDgSO3SlYFaw/hpUsC7Cv
         7GRtZtI65CF5TWQnc7PUuDhThHtjFKiAmNYbIZ7Jt7a6N0sm8T9h1cX+gKeR0yyhlSXF
         ZbcfjxZ04TzRI5Ji/3BWaaIBYS9LsjWRT7gS974EuebaJxtveSV4fXnuXIUzC32Ts9zd
         Zz4Tw5xXLJ6ShQLHmojOBAYLTJfvSgFF7Q2/masqcfOjmqakS701laZwGVF3Xi3Fb0tR
         xlIQ==
X-Gm-Message-State: AOJu0YwleUDFmlSi+Ahl1d6NyTV4UgfoTShkCJL/V7SsCAzTB/lkqNBu
	+/4SoJ582/SxTcak8qLx2nJSwaZIk1n8CKiOL9sUP131kFVV0zX99+Pi/Is+OQ==
X-Gm-Gg: ASbGncu1Anzn6Fr2IUAaLhe+vYUx/KPyO0RlEwVn8MvvsEGOQ98IoIC8Ycbn2Oed2mv
	r2I0qv7ZPZe/7AGxAuhqor/aecY9091aXIDdib5vrPV/D5Q6NhtN9i5CWiJUD6AU8gNUK6pJfyq
	Ay82SeyYXXk4lnLacry1WZYKFIOOpAbu4atnUnpzaJtACmme9ClN2auy2nRSDV6zFPnpTuz2Ie3
	B0W7YK3zN5mrYLpjbkYLxJyUtLTAHgHuPZtU29UDB0YD8zCHKkp8qcFCHjdN1gxB+1Us/tXP/VP
	Mu1KPLKSX2GYIe/wZXSTnUkA2/+I0FAJ0ziJz50Hi4TiDsYtgIBKwnvPSqI1xKJDvMf9BbCoUan
	iHYEaWHF+s5fJsw+qUqtIlfaETg==
X-Google-Smtp-Source: AGHT+IGcy8BRnlyg7JqobhDxzSd8Voi85ZnpHIqY/6bP3jExi4RDiYkLBVPW5xZ8BSn+s2lJaN3etQ==
X-Received: by 2002:a05:600c:1f82:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-440a66ab23bmr10158525e9.27.1745571278156;
        Fri, 25 Apr 2025 01:54:38 -0700 (PDT)
Message-ID: <f425b237-dd89-4800-96c7-08072a3f67e3@suse.com>
Date: Fri, 25 Apr 2025 10:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix buffer over-read in bitmap_to_xenctl_bitmap()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250424103841.94828-1-roger.pau@citrix.com>
 <041d4bd5-962c-4600-b436-0ec214a6c6ca@citrix.com>
 <aAo250IiFOC1Hggg@macbook.lan>
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
In-Reply-To: <aAo250IiFOC1Hggg@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2025 15:04, Roger Pau Monné wrote:
> On Thu, Apr 24, 2025 at 12:41:43PM +0100, Andrew Cooper wrote:
>> On 24/04/2025 11:38 am, Roger Pau Monne wrote:
>>> There's an off-by-one when calculating the last byte in the input array to
>>> bitmap_to_xenctl_bitmap(), which leads to bitmaps with sizes multiple of 8
>>> to over-read and incorrectly use a byte past the end of the array.
>>
>> /sigh
>>
>>> While there also ensure that bitmap_to_xenctl_bitmap() is not called with a
>>> bitmap of 0 length.
>>>
>>> Fixes: 288c4641c80d ('xen: simplify bitmap_to_xenctl_bitmap for little endian')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> You ought to note that this is only not getting an XSA because
>> 288c4641c80d isn't in a released Xen yet.
> 
> Yeah, I did explicitly check this wasn't backported to any stable
> branches.
> 
>>> ---
>>>  xen/common/bitmap.c | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
>>> index bf1a7fd91e36..415d6bc074f6 100644
>>> --- a/xen/common/bitmap.c
>>> +++ b/xen/common/bitmap.c
>>> @@ -369,6 +369,12 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
>>>      const uint8_t *bytemap;
>>>      uint8_t last, *buf = NULL;
>>>  
>>> +    if ( !nbits )
>>> +    {
>>> +	ASSERT_UNREACHABLE();
>>> +	return -EILSEQ;
>>> +    }
>>
>> I don't see any hypercalls performing a bits==0 check, so I expect this
>> is reachable.
> 
> bitmap_to_xenctl_bitmap() has just two callers, one passes nr_cpu_ids,
> the other MAX_NUMNODES.  I think there are no callers that pass 0,
> much less from hypercall provided values.

Still I don't think there should be an assertion here, not even an error.
As much as memcpy(x, y, 0) is okay, it ought to be okay to invoke this
function for entirely void bitmaps.

Jan

