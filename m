Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC5B48F2B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 15:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115249.1461944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvbkP-0003Uz-1K; Mon, 08 Sep 2025 13:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115249.1461944; Mon, 08 Sep 2025 13:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvbkO-0003T2-Uf; Mon, 08 Sep 2025 13:17:28 +0000
Received: by outflank-mailman (input) for mailman id 1115249;
 Mon, 08 Sep 2025 13:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvbkN-0003Sw-BN
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 13:17:27 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 294ab4b7-8cb6-11f0-9d13-b5c5bf9af7f9;
 Mon, 08 Sep 2025 15:17:25 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f7f15so4929125a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 06:17:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7848sm23317077a12.2.2025.09.08.06.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 06:17:24 -0700 (PDT)
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
X-Inumbo-ID: 294ab4b7-8cb6-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757337445; x=1757942245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oPjaEpvTu6rko2XUhBcvGErTTY+OtKHGX7I/mSyLgKU=;
        b=ARLo+bg9PrS2g6enGY3IzMrr6eqdEbydyrqQByYl6FPdkz8cp4HHWGP0iUqJGppeMR
         piF4xu+638zDMmhM4gLeZlURENQwnpoUbj2QQQ2Hke+e7V1E/kzNF/IGBNfvtr4OqXxR
         VkEFuyfzDM96cNfYrfZKCf9fJKzbDGFzgaFB3PM9MfTs7sCBdW5QwslId+byqyWpZqE9
         QImSdNOFvgLL2Ung82goiRVqLpkJ6kveBAV6g2ee0Iir7GkdMxZDQ8NJSC7Wp4rSxgVl
         6K2AeQlenU2Jd7txmmiS8XTuar5c19KpDvfF6LeBIOdAYgyJYJa3W46Alp7aY0ucm5zu
         z1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757337445; x=1757942245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPjaEpvTu6rko2XUhBcvGErTTY+OtKHGX7I/mSyLgKU=;
        b=BaVKoiPKK/FnvG5LCxYKKkba5OweQ4lws2WKtfvrKFSbe2IsryMHYnfF5+vCFIS4Sp
         mbdETZzmZAfRbOFqSodPuaelSxr/mGWY+nRpn3rj3DDgeYdfgK2MXVI2hctL8bMY0gbc
         JXf/rFsaa3mdOcatEzIf5gmFqHi41Bf2bo/T7k5f0IUx8EXqoNJb+xSsCLgQ23qLfkjk
         JfON7Y4LfHM/5PnFyJ+rM3E8tr5zUnMVSSv4m0kWVWpFvpnEm6U0X336q8s6dQONBhcm
         ZSpETYQ5WOsx1yPAgtcCdXlm/m9ZvgBfCK4nqKT2x0xeoSLzc4mIe7bonaiuDXj1KeIV
         PDIA==
X-Gm-Message-State: AOJu0Yz30Wrg0Tb1MYnyouxRPLFhdzdaG/WRdQpEeuAQzMOpfiDUs+W2
	H/L4w4PXsb/Y/mLg9qsVtGLJoN1u6udRqcaaM6NnVNz6sovBQ/AZxAZ8/z6Z9X7KSg==
X-Gm-Gg: ASbGncuTi0eYsKEamRkdkXqaPbOApEOwAKPwSAeugerCfn7ScXgXoTYB6+LhVWdVL/g
	mPlYPcf0RQLVoXhHGYGUeYTwIjWg66WemOFSTjR5u7ntcRu2TDZNqmZpQEWIh7NVKHb0wO8q9E7
	8EIEOhsbdnfN/gpxBWpkhNK8LMHKAj0rYsFYjd+HATlZtqM/HnaZb/DYjjul5jcw7/Vznqu03OK
	NoKbaoRCLEX2VrxZ8BfIlNMXbb/cCmxko26UlOmgn8giRfwdu2YhC81kvwZcIArAxqEuJs0Wg3U
	E2WEUNzXI0zT8cAOTK7tvLd68Ijt/6mRgyjtlPDMWxDfFsmBI87nR0AZ8qK7BsE9JVCL6qSpOzy
	SNiaH1zMSZXheCn107rO7XFTHIVkCDtD5Fo0ilU8jK6WOW8WHMEP7uYZqkDe61MdfpcYpvhImzU
	uCypnGOnw=
X-Google-Smtp-Source: AGHT+IGVHhbBsSa6puYaNYWGUjL3z9PHFIXgqRau4l+taVUPFu0BE+ktgHGAKpQgQjG5w+10OtPBJw==
X-Received: by 2002:a05:6402:21d1:b0:61c:5343:8f29 with SMTP id 4fb4d7f45d1cf-62377109cf2mr6292414a12.21.1757337444795;
        Mon, 08 Sep 2025 06:17:24 -0700 (PDT)
Message-ID: <97e033e6-4d6d-4452-b9d5-70b351a1a5a8@suse.com>
Date: Mon, 8 Sep 2025 15:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68bd98b92c2b2_2afba52d9ed55e79908873e@prd-scan-dashboard-0.mail>
 <77361e51-dcb8-40e2-a526-9ff90ba942a2@suse.com>
 <DCNDAW983CUC.C7PT9CRVXUWU@amd.com>
 <9e474109-7aa1-42b9-9fa6-31c4ef0fb856@suse.com>
 <DCNFIZNXYSZS.2SXOS2FXVOS4Z@amd.com>
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
In-Reply-To: <DCNFIZNXYSZS.2SXOS2FXVOS4Z@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.09.2025 14:48, Alejandro Vallejo wrote:
> On Mon Sep 8, 2025 at 1:25 PM CEST, Jan Beulich wrote:
>> On 08.09.2025 13:04, Alejandro Vallejo wrote:
>>> On Mon Sep 8, 2025 at 12:19 PM CEST, Jan Beulich wrote:
>>>> On 07.09.2025 16:37, scan-admin@coverity.com wrote:
>>>>> ** CID 1665362:       Integer handling issues  (INTEGER_OVERFLOW)
>>>>> /xen/lib/find-next-bit.c: 104           in find_next_zero_bit()
>>>>>
>>>>>
>>>>> _____________________________________________________________________________________________
>>>>> *** CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
>>>>> /xen/lib/find-next-bit.c: 104             in find_next_zero_bit()
>>>>> 98     	}
>>>>> 99     	if (!size)
>>>>> 100     		return result;
>>>>> 101     	tmp = *p;
>>>>> 102     
>>>>> 103     found_first:
>>>>>>>>     CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
>>>>>>>>     Expression "0xffffffffffffffffUL << size", where "size" is known to be equal to 63, overflows the type of "0xffffffffffffffffUL << size", which is type "unsigned long".
>>>>> 104     	tmp |= ~0UL << size;
>>>>> 105     	if (tmp == ~0UL)	/* Are any bits zero? */
>>>>> 106     		return result + size;	/* Nope. */
>>>>> 107     found_middle:
>>>>> 108     	return result + ffz(tmp);
>>>>> 109     }
>>>>
>>>> I cannot make sense of their claim. 0xffffffffffffffffUL << 63 is simply
>>>> 0x8000000000000000UL, isn't it? Where's the overflow there? There also
>>>> cannot be talk of a 32-bit build, or else ~0UL would have been transformed
>>>> to 0xffffffffUL.
>>>
>>> The offending line LGTM too.
>>>
>>> The only credible explanation I can think of is Coverity flagging discarded 1s
>>> on left shifts as loss of precision.
>>>
>>> If so, "~((1 << size) - 1)", or "(~0UL >> size) << size" should make it happy,
>>> but surely that error would flare up with all uses of GENMASK() too?
>>
>> And with any other non-zero values of "size" here.
> 
> Is this the only issue flagged? Or are there any others of the same kind? It
> might me easier to spot a pattern with a larger dataset.

I've seen only this one report.

Jan

