Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA1A71412
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927419.1330168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNMB-0008Pp-D3; Wed, 26 Mar 2025 09:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927419.1330168; Wed, 26 Mar 2025 09:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNMB-0008Nr-9G; Wed, 26 Mar 2025 09:47:31 +0000
Received: by outflank-mailman (input) for mailman id 927419;
 Wed, 26 Mar 2025 09:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txNM9-0008Nj-UR
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:47:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54aa41e1-0a27-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 10:47:29 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso70104635e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:47:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd18621sm179868805e9.12.2025.03.26.02.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:47:27 -0700 (PDT)
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
X-Inumbo-ID: 54aa41e1-0a27-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742982448; x=1743587248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mV5C4+0dRv4ArKxLNujf5R/eRhn1nBAhdAsmACl3CaQ=;
        b=J0rK+UcQSMwvMmdxb+hA5IFCR7Z9WRJWpOcUmrZqcbysWVLgtBnYoMEEAV67cg2e4H
         zDtpQ7PjU2DcTiEyXlOimZeZVS0JCnUPXWn1T0OruWJFqi7BpmUfAWwTFDUat20WtxkP
         cvQT1FTic3huwc8yLaQjHwwfEpt87BD26r5A0fTQl0/CngmPEOHGC9miyh1Dquo5E5y2
         IEvxaqxjOWeAgVlZJ+LqnbBRtEAJikLqge9G53KLi5VsXlstBln86yF0bNu30HC5c5eV
         vYUMtzpbaGBOrH24yN7RNEvxGLa7lHCqBp25mW/o38RG4RR4I7/O4sNF4ycv/Aitfk8h
         Vxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982448; x=1743587248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mV5C4+0dRv4ArKxLNujf5R/eRhn1nBAhdAsmACl3CaQ=;
        b=tO+iQ1HeecKsbbCBqNL5s3+r5IOqXXfEu534gvz82TlfwzFcPlFGUl2XF8r46oS869
         Gx8D1z+xSJkhQxUD6yP7FNWfxM68Jr3oJ+vUkMoyao41FdjFXuTG+OBNWhiiFFaSz9io
         /MHhQOWPznucANGqL66zE9A5W/qa6MDnb0PB0zFqEqG0wL2w3b27/d0RcebyQe18e2OA
         +vEzJiCym91kS/CEwx2D4DV2o8PACJAKTn9pNsXATtMUY6Wd7wvJBOV52/XebdR2VVRO
         lEk2um4wsrydFtl0b4eS4/NtktSryTDA3R82Yubk4cOJB1Jihi65JG9Si86wMrpZ+uN+
         3PIg==
X-Forwarded-Encrypted: i=1; AJvYcCVfYPkyDJyACut12TbhehCShaXxbxG1/OstxzXfbE3AoVRTV51aMjUtN4EWxdiZz75XzEEcnsGrOgc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfkNQg3zF6zAh5eC3UQQ2juTf7yBvrVDxyDcD1SDKagU8GyN9c
	RiHj8QHTcZnMRQRrIUSfLXpgGtag9rbPZpLo5RAbI5XL4DW8U5eg5cQCGdsgCQ==
X-Gm-Gg: ASbGncvBcCismtHmuwas1sRdGhnXCujLjgIXpzpZe2CgQWS6Ruqpneyc0jUhnfwlyYr
	Rp6/kxWYLe7IBMgnj9KUokMOFJW8bOm9if15UJG8QleYA8HiY6S2XUOjDpmt+dBmAxhKGknDKLL
	LX2aWAD7wJYngcPsudpytb1CaOSSO3CcN+5nPQ3+RQKysSeX68PZk/vDiVn6nCbP/CAdmhEDSsb
	uaIQkpYq15h1DkA5wZsu6HvLV9TLS9b5EQ2IPWwwm7noGpMdThGqfjaOVT6TxTmvZRYjLvbd3+t
	eIwkMIHX2j1nwLC0a2dUNkoEUTEtGvq04oBl/WQLXqQod0wPlMDNaY94FyniskFStuMoRD+vakX
	K5T1dX44cZwLMOr+oKGAiSR09jSBxgA==
X-Google-Smtp-Source: AGHT+IEI6qy+mS0hXKqZg1s8aTlpPrNmh5Het2mcDqJnPS0j8/XpYLLE4swYrrsNLNvSwgL7OETmjg==
X-Received: by 2002:a05:600c:cce:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43d509ed65amr215289725e9.11.1742982448296;
        Wed, 26 Mar 2025 02:47:28 -0700 (PDT)
Message-ID: <2778d532-15b2-46ae-ac54-5e4aba877727@suse.com>
Date: Wed, 26 Mar 2025 10:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitops: Account for POPCNT errata on earlier Intel
 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325185219.315319-1-andrew.cooper3@citrix.com>
 <56fbd614-2b46-4cc2-88f3-e244aedd5479@suse.com>
 <a57c2ae0-2c9f-4fac-9ebb-a570f0f2cabc@citrix.com>
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
In-Reply-To: <a57c2ae0-2c9f-4fac-9ebb-a570f0f2cabc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 10:34, Andrew Cooper wrote:
> On 26/03/2025 9:20 am, Jan Beulich wrote:
>> On 25.03.2025 19:52, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/bitops.h
>>> +++ b/xen/arch/x86/include/asm/bitops.h
>>> @@ -488,10 +488,16 @@ static always_inline unsigned int arch_hweightl(unsigned long x)
>>>       *
>>>       * This limits the POPCNT instruction to using the same ABI as a function
>>>       * call (input in %rdi, output in %eax) but that's fine.
>>> +     *
>>> +     * On Intel CPUs prior to Cannon Lake, the POPCNT instruction has a false
>>> +     * input dependency on it's destination register (errata HSD146, SKL029
>>> +     * amongst others), impacting loops such as bitmap_weight().  Insert an
>>> +     * XOR to manually break the dependency.
>>>       */
>> With this being an Intel-only issue, wouldn't we better ...
>>
>>>      alternative_io("call arch_generic_hweightl",
>>> +                   "xor %k[res], %k[res]\n\t"
>> ... put this line in #ifdef CONFIG_INTEL then? The extra overhead is small, but
>> I see no reason not to avoid it if we can. (I realize that's not quite as
>> straightforward as it reads, for alternative_io() being a macro.)
> 
> For an XOR, no; not worth the complexity.
> 
> Besides, this gets used a whole 5 locations in the hypervisor, after I
> cleaned up the paths which shouldn't have been using hweight() in the
> first place.

Well, okay with me then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

