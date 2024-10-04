Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9198FD2B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 08:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809991.1222569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swbUt-0003tk-9K; Fri, 04 Oct 2024 06:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809991.1222569; Fri, 04 Oct 2024 06:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swbUt-0003rf-6F; Fri, 04 Oct 2024 06:09:03 +0000
Received: by outflank-mailman (input) for mailman id 809991;
 Fri, 04 Oct 2024 06:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swbUr-0003rZ-Lq
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 06:09:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25d60793-8217-11ef-a0ba-8be0dac302b0;
 Fri, 04 Oct 2024 08:09:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso272120266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 23:09:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731besm176501766b.163.2024.10.03.23.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 23:08:59 -0700 (PDT)
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
X-Inumbo-ID: 25d60793-8217-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728022140; x=1728626940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PT5FF9FCVSduzE7WsMNW2QGl+PLBKLmxJdY8DNRPuh0=;
        b=ILmSeJGAXRUr9/7uuT9vqLa+8Qp8wqLhPzshMGUREvoX1Feiuzf2IPZbyFvbIdTZZA
         PlMvY4oLL9AH7taTgMAb1bfAz7jZDUWmHsfdOr8hqT/12dDWRWWcDT2JcVVGMhInNadG
         oBdTTnyVl50wdMFhwZbC/buDN8GECtJYyUaM+cZbKWOzebCE6aZsgPFwE0e2gUpLjoKB
         PBgzzWp1RNwSuTFg+yR0B1mIiX0i9B+bfh8F3m9rJBe/cLxcGod2fFxzdRDJ0X9tBY5d
         YE4YtY/Ew/gdzjaxMlAqAIpDaSaP6W5oQ6IcNj41AASHXHChaFt6VmVggmS43MXr2I8l
         HwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728022140; x=1728626940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT5FF9FCVSduzE7WsMNW2QGl+PLBKLmxJdY8DNRPuh0=;
        b=SjFmu3TuaItRnQAIt4iPLJ+cPFFBGH/j6RKwaOHHu7bDdPZcCLfJokqcKHfBaZQ7Gn
         ajSncdyCkT88bHuDlmNOppT/ZZpsN3xSfK7KeqcWdTgIF6NNCAN3yKQ2hgSGNDbwsCXu
         y42y76c+8tKpbhwaX3HmwKVd4srjspWE664qEti1YH7bCjUqyepHJHZm2pgjxUmS+Q8u
         7WKsZkjcvcm0n1zQJnlL3PuWlwli1p40R9EvLHxwItUnmpTD3n19k1XbztELqsB0rdrW
         4mbb4R5u3v2E5shXtmiav+NkcLRWZYCA5PuK9MIglwNgzRkRyeJFUTol2AlN1BhuScvL
         52Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWFXGuC0Me0mC0xtg4EtHlZK8gMAPKpUOOIZY7Boej9lHV3wK3zjCqLusSJAiXP041rOangPWUUVMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNmz6Lsrcy56ex2QuGTFbDfAsZKj75D/4G2eSzp7kdiu7wsZFF
	fmOF0kCk7CSJ0QMi/7b7A0BF6FLH5QzeKxahk69IfNNdwOPfCxDE24ZCKgCb9A==
X-Google-Smtp-Source: AGHT+IFSylWFcB+3YZsuCjs4zcXLmLofJmKr9uD0dYu+1NiU92wk/uQrSCaY3zAZUBypHUnYvnFaog==
X-Received: by 2002:a17:907:743:b0:a86:82e2:8c64 with SMTP id a640c23a62f3a-a991bd7d3e2mr138748466b.35.1728022139784;
        Thu, 03 Oct 2024 23:08:59 -0700 (PDT)
Message-ID: <1a0d69a0-84fb-4178-9f73-5490bb1d1adf@suse.com>
Date: Fri, 4 Oct 2024 08:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/fpu: Split fpu_setup_fpu() in three
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240813142119.29012-1-alejandro.vallejo@cloud.com>
 <20240813142119.29012-3-alejandro.vallejo@cloud.com>
 <c83942d9-bb55-45c2-9a44-314266ce14c0@suse.com>
 <D3EXG6HDKMYR.15275C42NLLBL@cloud.com> <D4M7ZZL8YUXE.1D7KX3JJDYH6L@cloud.com>
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
In-Reply-To: <D4M7ZZL8YUXE.1D7KX3JJDYH6L@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.10.2024 15:54, Alejandro Vallejo wrote:
> On Tue Aug 13, 2024 at 5:33 PM BST, Alejandro Vallejo wrote:
>> On Tue Aug 13, 2024 at 3:32 PM BST, Jan Beulich wrote:
>>> On 13.08.2024 16:21, Alejandro Vallejo wrote:
>>>> It was trying to do too many things at once and there was no clear way of
>>>> defining what it was meant to do. This commit splits the function in three.
>>>>
>>>>   1. A function to return the FPU to power-on reset values.
>>>>   2. A function to return the FPU to default values.
>>>>   3. A x87/SSE state loader (equivalent to the old function when it took a data
>>>>      pointer).
>>>>
>>>> While at it, make sure the abridged tag is consistent with the manuals and
>>>> start as 0xFF.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>>> ---
>>>> v3:
>>>>   * Adjust commit message, as the split is now in 3.
>>>>   * Remove bulky comment, as the rationale for it turned out to be
>>>>     unsubstantiated. I can't find proof in xen-devel of the stream
>>>>     operating the way I claimed, and at that point having the comment
>>>>     at all is pointless
>>>
>>> So you deliberately removed the comment altogether, not just point 3 of it?
>>>
>>> Jan
>>
>> Yes. The other two cases can be deduced pretty trivially from the conditional,
>> I reckon. I commented them more heavily in order to properly introduce (3), but
>> seeing how it was all a midsummer dream might as well reduce clutter.
>>
>> I got as far as the original implementation of XSAVE in Xen and it seems to
>> have been tested against many combinations of src and dst, none of which was
>> that ficticious "xsave enabled + xsave context missing". I suspect the
>> xsave_enabled(v) was merely avoiding writing to the XSAVE buffer just for
>> efficiency (however minor effect it might have had). I just reverse engineering
>> it wrong.
>>
>> Which reminds me. Thanks for mentioning that, because it was really just
>> guesswork on my part.
>>
>> Cheers,
>> Alejandro
> 
> Playing around with the FPU I noticed this patch wasn't committed, did it fall
> under the cracks or is there a specific reason?

Well, it's patch 2 in a series with no statement that it's independent of patch
1, and patch 1 continues to lack an ack (based on earlier comments of mine you
probably have inferred that I'm not intending to ack it in this shape, while at
the same time - considering the arguments you gave - I also don't mean to stand
in the way of it going in with someone else's ack).

Jan

