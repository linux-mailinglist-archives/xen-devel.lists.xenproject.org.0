Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A584C5B6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 08:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677269.1053771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXcW1-0006Ef-Ao; Wed, 07 Feb 2024 07:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677269.1053771; Wed, 07 Feb 2024 07:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXcW1-0006CE-7W; Wed, 07 Feb 2024 07:38:41 +0000
Received: by outflank-mailman (input) for mailman id 677269;
 Wed, 07 Feb 2024 07:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXcW0-0006C4-2O
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 07:38:40 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7c25b13-c58b-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 08:38:37 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4101995472aso196475e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 23:38:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 az22-20020a05600c601600b0040e813f1f31sm1142209wmb.25.2024.02.06.23.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 23:38:36 -0800 (PST)
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
X-Inumbo-ID: e7c25b13-c58b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707291517; x=1707896317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rI0/7s/AzuxGq7spPCa1cjqAnALNzOqy2OeH8OfXcuQ=;
        b=REzvvpeh9i0tz5vruaaGNQCHeuqgYHTop7b9TsYvxQEDbXKv55JrCC4IH6APYSryam
         ChlL1fBEnCW5Ux+4uawY895WdXFsLljKF4uQJi4QCOj1hMqNhLTSYXGI7qdfU2HJMS2K
         BpFRVZ0kaq80b1K57znMc5/Pf9sFwrN/WqAH6pIYgpNuaMzJFGUqCTdErh/0eDZV8eqN
         3BDrHTDcNDTix2OiYkNi2rr+GFlYDcN1WMPqGRw9+E9E5wQwSgF4/X/uhPy8SgfW/5cf
         bPXbM+PO2gEI8CxTcrEkDT+3udsX7jzzhBSNf2EAh2ozGv2URpAmblzKd6VIxejoXbp4
         Fu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707291517; x=1707896317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rI0/7s/AzuxGq7spPCa1cjqAnALNzOqy2OeH8OfXcuQ=;
        b=nskcOV58rMsoNG+wGLlLZfFSn3dL6pItqABoxBUNBcIF5z2of6utH3gYo0yZl5XYBp
         moeVLNXdZfsH+cavccDtD2GmwxXGKmM6BxyLoPODN4lI542NcCcIWXySdNmNk/8kSYub
         60B09/eEE9I0lAqb4TWx1csFLnICwVZZ67tWrbtL4iy1ZXVPUaA8bxYS6RgpXink5sbV
         c44Hgy6PwIrIfRdAFc+sdBFrKwzeLSUpPrBX481RXFcSnmZEaoqi/g6j5XLgjbdMH8EQ
         ZW2pm6kRx2nvAzS/JtLCSaes/OdUeDPRczIV5T673/JWpC1S83I2/0+rcoSAiT68Il6D
         O1sA==
X-Gm-Message-State: AOJu0Yy08OPjL3IrKUN89z5VwMQ1jNTlewabpd+h4aj7iMn7/rDr95Nd
	Suq6LkGJ/qxLJ5mSP3cFD7F2I/qREBJCLN0nUGbQlKfsm1Zo4v9PDCgAzKyXdg==
X-Google-Smtp-Source: AGHT+IGeKV7xqIRSaCRjH1hq394Re2a3St7OqFCYhEPM5dtgMcevgJjJzl9VvS8TO7Tm4vW+XX6eBw==
X-Received: by 2002:a05:600c:519a:b0:40f:e498:3e15 with SMTP id fa26-20020a05600c519a00b0040fe4983e15mr2713120wmb.3.1707291517068;
        Tue, 06 Feb 2024 23:38:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVztV3N/fBNR3HsOyqJuVnMKm6EfhypsmqMhFuhkq4zTTdicVbIC5RamJcfeNxfkBDZRXARMeRLAHJ1lQUrHRvJwzX+UPdKxZARh3vweffLx4e/DQLNqDEwmNPtqFFuoAx/tWftmCijxObHt9jZyMCvkyKpwOAXTyFBkJ4Ip7nP8NBemaUsDVi7jgHj8ncviSMTtty6FNpo33joOoO3MexNk4dH
Message-ID: <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
Date: Wed, 7 Feb 2024 08:38:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 02:08, Stefano Stabellini wrote:
> On Tue, 6 Feb 2024, Jan Beulich wrote:
>> On 26.01.2024 11:05, Federico Serafini wrote:
>>> @@ -208,7 +205,7 @@ do {                                                                       \
>>>      case 8:                                                                \
>>>          put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
>>>          break;                                                             \
>>> -    default: __put_user_bad();                                             \
>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>      }                                                                      \
>>>      clac();                                                                \
>>>  } while ( false )
>>> @@ -227,7 +224,7 @@ do {                                                                       \
>>>      case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
>>>      case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
>>>      case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>>> -    default: __get_user_bad();                                             \
>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>      }                                                                      \
>>>      clac();                                                                \
>>>  } while ( false )
>>
>> Related to my remark on patch 1 - how is one to know the macro this was
>> invoked from, when seeing the resulting diagnostic?
> 
> I am not sure what do you mean here... we do get an error like the
> following (I added a STATIC_ASSERT_UNREACHABLE for case 4):
> 
> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable

Right - and how do I know what _user_ of the macro actually triggered
it? ISTR suggesting to use one or more of __FILE__ / __LINE__ /
__FUNCTION__ here, for that specific purpose ...

Jan

