Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95050C69A90
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164825.1491698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLM1d-000353-6u; Tue, 18 Nov 2025 13:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164825.1491698; Tue, 18 Nov 2025 13:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLM1d-00033b-48; Tue, 18 Nov 2025 13:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1164825;
 Tue, 18 Nov 2025 13:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLM1b-00033T-OY
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:45:39 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd357b0f-c484-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:45:37 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b735e278fa1so822617266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 05:45:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed9d38sm1375305966b.67.2025.11.18.05.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 05:45:36 -0800 (PST)
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
X-Inumbo-ID: dd357b0f-c484-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763473537; x=1764078337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zkETE9o8Sl5QoRq38JwUTwe7vTd7IIWStNkxRer9PfU=;
        b=dy/cmpYau1vXoWRbhOnT9W0BJv2uNU8wI82BGnfJIOZGy9FeTvb0mqMwKmAzmTSBbC
         sqU08NKhZmZ+jAl3Sc230+2rX/Rb2Fi7ALrGCdkOUhc1KcTlwT4OXR/ORZff4IE/0CqS
         68tvp+SfSZ4ER/17/tPzX7V5b7q6/cCedBVAmH2bN9bjquYi09f2xD8sxwTdPsa1zXtG
         0lt5AXpd4pfLmdP29hHfL92brkxxT+L/uslgKvTFScXoVophkGmGZld2jRgMUZDSgGoU
         4uNLrT4gkMmpGDxx5W9HNp7a7y9+2vVPHTHxP/efuusP+m8I8jXfK8ysj0+VmIe+FR6G
         SkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763473537; x=1764078337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkETE9o8Sl5QoRq38JwUTwe7vTd7IIWStNkxRer9PfU=;
        b=mNegT/SvLU9WgNOMfMgEbMt/ubr3WOF+Uo1mV1K/UGQUkGJwAk8E5x4VksmGiXS5ch
         wXEl+Vj7h3Cru7ebIstWoN9m3IQ1m6Z1t7UtY9eOLV+V/X5P2mo81YwnMCMMJmNCqIPX
         ATbyDkSqmUdVh8FzwQyCUf+CT4hUyngyUmO2fWcxZ5FRSSUjQyqeGuTfMjKB4NvsoS4v
         yPJaI8lerM+XDTPSIJQDYbp5LxeVcrrEaqatYFtoLNA4ICOB0xcc9VuCEAhA2m1618n8
         mM6wma3HcTXmpO2o9yrrUipLybpFlTdk/3nfLXHvCDd6uMN5wFehrcu2tRjcE8FspCbh
         CtWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkwdhtXx3UKLTA5EIJ4SPQIPDFji0Uagm7sITAxHvCvwSwbQo8F05Q5Vhs+VnHVF8qgEnjigWfLwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyC039DxP5s8Rr9Uc1frZbA5VIliQ9g74nrAITACc1u1twmace
	Pi9kU5JHUGpGwKOQ2rbKNYTTyByMSWnqDK/DpZXn778yn/IisLw/OdWZXcx5johkdg==
X-Gm-Gg: ASbGncvyLtU8IcrPrSz9HQhT9dEFFzio5wd9anqtWYWZKe+n+ON2/WCsiSqgvA4rwO7
	dqkOeElByCgJC+ROjG5XuO2LaNCMklJIyQHh/lRlSivNEsT9O2hEgb9APPxHxd3lmilgPkTnsO5
	jG7S9NK7z7fMO7Px3+U4CBDAuLZM/rK2CP1hofRP6Ux9MkjPB9m2z8q/k0GSSaZFqVgFrq6Jshg
	+nauzkIHOeqkZsUj3SF54u3WvuOoFcWKpyu18tpBI91gvfXgvSFHsXIaJ6BvxK/LPF2VLDX04Fu
	IMFy+eRb+/XuTPQWnqRTKPqj/+QUy4HSqmlTSvY5bBHavIrxxU1lYsROpfuTdYJ+81nKVR6NMcI
	2SyP7v2QZ5eV1xZ+8cW6rbovW8wAIqozX3vehA+0pHqKxsafF1lwSQAkR7DWtUreEB/0lLJLS1R
	a50glfh75HpBJWHQlrystDDA5UtAxMOUGqKbzZsS9jhZ0jxiZosocxQxPmlTZEo+61
X-Google-Smtp-Source: AGHT+IHBu3yk1XMXDPAkFn7cqqCJdvT54+4z1YWG/Xj9t9Rjq13/xEiYKQy5Do42c3rTrK3GpDp3lw==
X-Received: by 2002:a17:907:97c3:b0:b72:a899:169f with SMTP id a640c23a62f3a-b7367828ab8mr2065746766b.4.1763473536976;
        Tue, 18 Nov 2025 05:45:36 -0800 (PST)
Message-ID: <567f2759-fa03-43bd-9ae4-75e0e3811b60@suse.com>
Date: Tue, 18 Nov 2025 14:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114140117.270461-1-grygorii_strashko@epam.com>
 <11c3929a-977b-4ef8-aaaa-9aea01657b04@suse.com>
 <fdd51da7-c8dc-4c0f-aaaf-a9fd2094bcd4@epam.com>
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
In-Reply-To: <fdd51da7-c8dc-4c0f-aaaf-a9fd2094bcd4@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2025 14:08, Grygorii Strashko wrote:
> On 17.11.25 18:43, Jan Beulich wrote:
>> On 14.11.2025 15:01, Grygorii Strashko wrote:
>>> --- a/xen/arch/x86/pv/Makefile
>>> +++ b/xen/arch/x86/pv/Makefile
>>> @@ -14,6 +14,10 @@ obj-y += ro-page-fault.o
>>>   obj-$(CONFIG_PV_SHIM) += shim.o
>>>   obj-$(CONFIG_TRACEBUFFER) += trace.o
>>>   obj-y += traps.o
>>> +obj-$(CONFIG_PV) += usercopy.o
>>
>> Just obj-y with the movement.
>>
>> However, is the movement (and was the adding of $(CONFIG_PV) in the earlier
>> version) actually correct? The file also produces copy_{from,to}_unsafe_ll(),
>> which aren't PV-specific. This may be only a latent issue right now, as we
>> have only a single use site of copy_from_unsafe(), but those functions need
>> to remain available. (We may want to arrange for them to be removed when
>> linking, as long as they're not referenced. But that's a separate topic.)
> 
> It is confusing that none of build cfg combinations have failed
> (HVM=y PV=n, HVM=n PV=n) :(
> 
> copy_to_unsafe_ll()
> - called from copy_to_unsafe()
> - copy_to_unsafe() has no users (unreachable, MISRA 2.1?)
> 
> copy_from_unsafe_ll()
> - called from copy_from_unsafe()
> - copy_from_unsafe() called from one place do_invalid_op() with
>    copy_from_unsafe(,, n = sizeof(bug_insn)).
>    Due to __builtin_constant_p(n) check the copy_from_unsafe() call
>    optimized by compiler to
>    get_unsafe_size(*(uint16_t *)to, from, 2, UA_DROP, ret, 2);
> 
> as result copy_from_unsafe_ll() is unreachable also (?).

Yes, these likely all want to become library-like, so they are linked in only
when actually referenced.

> If those function are not subject to be removed, the
>   usercopy.c can't be moved in "x86/pv", Right?

That's my take, yes.

> Making copy_{from,to}_unsafe_ll() available for !PV means
> rewriting usercopy.c in some way, Right?

"Re-writing" is probably too much, but some adjustments would be needed if
you want to keep the "unsafe" functions but compile out the "guest" ones.
It may be possible to compile the file twice, once from x86/pv/ and once
from x86/, replacing the self-#include near the bottom of the file. The
former would then produce the "guest" functions, the latter the "unsafe"
ones.

Jan

