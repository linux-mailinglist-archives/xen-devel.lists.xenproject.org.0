Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481129C3DFA
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833653.1248832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATDA-0000oB-T0; Mon, 11 Nov 2024 12:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833653.1248832; Mon, 11 Nov 2024 12:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATDA-0000mX-QF; Mon, 11 Nov 2024 12:08:04 +0000
Received: by outflank-mailman (input) for mailman id 833653;
 Mon, 11 Nov 2024 12:08:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tATD9-0000mL-68
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:08:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97978eab-a025-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 13:07:59 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4315eac969aso24935225e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:07:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6b3505sm207043065e9.15.2024.11.11.04.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:07:58 -0800 (PST)
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
X-Inumbo-ID: 97978eab-a025-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk3OTc4ZWFiLWEwMjUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzI2ODc5LjE0NzAwNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731326878; x=1731931678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fm3UrvHXJhhf3Iwukz8xDV/O3XfFgWPgNEaLsVIAo9g=;
        b=UlpX/QoFS8OBQbsHgMGWmeGSwfWGOaCMRmqjVTVkyc6iqBhxLWrH4NAElyELMR42Ap
         z6pDSE26/H0W5j402jHz9BstgkFwgQ07p5X4vMkp5jtkJ/q8tXDZGXvFvLbZxuaKBS9b
         IJER1u9LbZ6VLNa60i4KypPQmWQFr4HVBQXVfkNBqqrKV+auVCFwoUVCEFSpF+JX1nCZ
         9lAkqBk61jBM9eHRks7PmcxMN0yvAlhlF4cl85GDP0YXuKwbXXOGeMWsVo9CkguZ1/r1
         6h+QUuUpZViIjwrhfICHSGGBU1n1gk9+zOG78ioZLGewD/1CJn+dKvubjLfkTHdS4dDH
         5pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326878; x=1731931678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm3UrvHXJhhf3Iwukz8xDV/O3XfFgWPgNEaLsVIAo9g=;
        b=vfWU3dqUYJY1HUiNw0My/qYqVC7U5KJAAIXUqMSYrZjOma1lBg9Vom6ZMAV12g1mhW
         H3v99TppkrHvnAX+yDYYSvFANksUaCDnIrUe/fdcO0M60Ij+Ei3eVXt/bC+pVugxk7J6
         NzwKiN5IFESKwQiHiRAgg4vLzIppXvfRgwGVjxo7Ra1O8DBwKY7rCYScURRVKbceaE79
         xTNPdVTus8gYpk4HLZQuMEC5C9/nZ/aUmAVyo3/vj32J1Ow9RYtTmoVC77sZpqatQZDt
         mZmwyTJr8pWhmntSifDKbJkd2BVtAOraWDLtbCyk+iFwmUgwTlCq0Ym5wudJw9JOg/4l
         XA5g==
X-Forwarded-Encrypted: i=1; AJvYcCWfpoJPnaHzh//kSDWP1yDUq5XpyZpqXHN84Q9l1eT7rqbcrnFnmxvXOkPrHLFRDcdxEY/oc36l9is=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5+KqHFB04JZKQrAISJV1yvhydl8aM+noMuQcZ+8eMx0CZBzyI
	uJbE5583SZXDAVuxB8ZoeVLTaS56ojX5T5tO2iLUafpywcLS8BGo9B22NzI8rA==
X-Google-Smtp-Source: AGHT+IF8bIEHWgFvQ0EIJgidtFiMWs4+H9Zby/7Hv3q/7Tcyf6UGP85pgLNk/k0WufzRtcp+1qv5vw==
X-Received: by 2002:a05:600c:3ba9:b0:431:47e7:9f45 with SMTP id 5b1f17b1804b1-432b686ec45mr112823215e9.11.1731326878575;
        Mon, 11 Nov 2024 04:07:58 -0800 (PST)
Message-ID: <ac35c128-6b65-4202-853f-b2db9e1a59e1@suse.com>
Date: Mon, 11 Nov 2024 13:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/10] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-5-alejandro.vallejo@cloud.com>
 <e8e2385d-b575-4483-ba54-f80c669af9c3@citrix.com>
 <D5JB58LVN4T6.1IUNQ15AHO1RV@cloud.com>
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
In-Reply-To: <D5JB58LVN4T6.1IUNQ15AHO1RV@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.11.2024 12:20, Alejandro Vallejo wrote:
> On Wed Oct 30, 2024 at 11:31 AM GMT, Andrew Cooper wrote:
>> On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
>>> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
>>> index cd716bf39245..04cab1e59f08 100644
>>> --- a/tools/firmware/hvmloader/config.h
>>> +++ b/tools/firmware/hvmloader/config.h
>>> @@ -4,6 +4,8 @@
>>>  #include <stdint.h>
>>>  #include <stdbool.h>
>>>  
>>> +#include <xen/hvm/hvm_info_table.h>
>>> +
>>>  enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
>>>  extern enum virtual_vga virtual_vga;
>>>  
>>> @@ -48,8 +50,9 @@ extern uint8_t ioapic_version;
>>>  
>>>  #define IOAPIC_ID           0x01
>>>  
>>> +extern uint32_t cpu_to_x2apicid[HVM_MAX_VCPUS];
>>
>> Just cpu_to_apic_id[] please.   The distinction between x or x2 isn't
>> interesting here.
> 
> I disagree.
> 
> While "x" says nothing of interest "x2" does state the width. cpu_to_apic_id is
> ambiguous and I've seen no shortage of code in which it's impossible to assess
> its correctness without going to check what the original author meant; and
> guesswork is bad for robustness. cpu_to_x2apicid has an unambiguous width at
> the meager cost of 2 chars. If you have very strong feelings about it I can
> change it, but my preference is to keep it as-is.

Just to mention it: I'm with Andrew here, and iirc I even had commented to this
effect on an earlier version as well.

Jan

