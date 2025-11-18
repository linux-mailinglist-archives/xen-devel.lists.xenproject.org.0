Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA79C67DC9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 08:14:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164458.1491418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFv3-0004ac-3q; Tue, 18 Nov 2025 07:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164458.1491418; Tue, 18 Nov 2025 07:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLFv3-0004YM-12; Tue, 18 Nov 2025 07:14:29 +0000
Received: by outflank-mailman (input) for mailman id 1164458;
 Tue, 18 Nov 2025 07:14:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLFv1-0004YG-3F
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 07:14:27 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36f34fca-c44e-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 08:14:26 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47798ded6fcso9308635e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 23:14:25 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a80:314a:d80f:dc29:6f97?
 (p200300cab70c6a80314ad80fdc296f97.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a80:314a:d80f:dc29:6f97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477991646b2sm174918695e9.7.2025.11.17.23.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 23:14:24 -0800 (PST)
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
X-Inumbo-ID: 36f34fca-c44e-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763450065; x=1764054865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zFtCrnINDrwaYiyzXiSXq+gd5proqbnsJy69jJO9sTM=;
        b=QF9W/clGmIBZmWrldoTZajoon+ldHugTjTpQOcv8LtHU8y6Ac74XA5/urbwz+NehRN
         4PyYwwuScTHY3yhf4upPq5kepwVrDdxN2FwAnui9edpvhsOhxPei5TFXR4vXGXFwFsFF
         cP118jlfEG7pLcM3oxdRRd0Dd2U3HdlfyZawK8tm/LvpPBkTioVeuMjuA3lq7DhK8qJw
         /Ah/9bceVd22DN5xNzKBhXKQItjpWgbq5XkgJKuJV7hjDrAH/0AjosBMyWUIv6T/WkQs
         acPLBXcLZU3EspXHbix7jDYEgZ2L4V7nRhYlWEMQ/XYhnDXniN+oOc8LcaLe6dszBBwG
         zK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450065; x=1764054865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFtCrnINDrwaYiyzXiSXq+gd5proqbnsJy69jJO9sTM=;
        b=wWSkZCub4JNlzD0U4IdsqKS9TFyd66tupoqEu7ayk3qSlkOuPZptbE5eADwnfD2Bzd
         xU+FL4JvpWBb33jWCU4WyaFp9lGzJ9ryoYpociBW5dgJparAYf0WGvd8pxtgP+0FdVNl
         s1m1FiCpbKeMjBTjA8ESziFVpwJWZcHnrtZ3Gq6sw8pLLCbln6TadoZs7OC9eGNzhLUo
         aDrjpdNJQw3RfjBdToNZSKMk0k0Z0d8l9sgH/FY6RLaFugzQ8zHXoQs8Ij43iCf//FjJ
         HnshRpYuFgOzhHbPeSU0bcOADxnhzi7N2VUTqTEsSd67ruAuSqULzZeWm28HUT47GzpQ
         XXuw==
X-Forwarded-Encrypted: i=1; AJvYcCX6RGgcnobcqVPf2hJgI2l5XB88n0St63Z/f++yRWL87u3P73K7bPtqA11oTPUJgoPnTU8lvixksAs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLcX9oNATjKOBsI/VUHRGGtcpdcQ2Pdsz25LBji7YMtZH2ieLU
	sn71sGcPBGZCTbGFJeSsfElZ1ZqhByJ9RL0erY7OmKj2FGX36yAZ+4HJvZpS+smEjQ==
X-Gm-Gg: ASbGnctT1W6FMzpr0kHu0LADnNv7CJmBpT2woIvhl1XzT8WaUGxK44ykkop5uiiwUrx
	KCxVtEc7VZSJbCr+C+hTpGQjMRNCuLxAbJOkzNpRHDIoBkVRW9hZpd1Oab8GFbrQmNYqUcECqtP
	T9M5rTqTQW0fQ3vy+FVXa9VvTET23IXkAVEY0j1TmY8yUIDSVuOTU9UZ1ddUMiOV8SoB5NzGFZ5
	Lo9506wik2bQ0zrYUFepSPr4qtDJqKVaTSBOMUzv9UbLJIqM7u6lYm+YmFtiFY61DkolSRqkhZB
	FGW4lt8N3ozGtiYKo4Xzr/K1+R26NBpKeujurBu1whXNQsK9vJVV0wF7fqfSsCxDJd0CDR3c17R
	hSMj+j5sIls9zKNMfbKcOrE3dUABv63UYac7aNc+szH1LF5ymgCYqWuk6eMa6K0gpX9wbPkrXzD
	mfwIkGQfobZT8h12mo4OeBAsr5rdXN266zZqeq5o3bprUf2iRKndC4+9lLctt8B6kHxiQ4RCAq9
	uWKkdcR5s58ktbMw9C0o4/mEHD80sjvvjsMUyYkI4iR5czbFvjZBt81M9c=
X-Google-Smtp-Source: AGHT+IFkfFJj8L7BvMxKgxmLIXld8JD0juWb8QEyVBlMojVq0nvr3x+VVt0IkJwKEOqXXnCAeBBK/Q==
X-Received: by 2002:a05:600c:1f91:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-4778feadab1mr130618645e9.28.1763450065211;
        Mon, 17 Nov 2025 23:14:25 -0800 (PST)
Message-ID: <ea81a0f2-d3d9-41f4-ae88-1426123129a6@suse.com>
Date: Tue, 18 Nov 2025 08:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-29-Penny.Zheng@amd.com>
 <c18cdb1c-f2b3-4eeb-b064-670c86e19e67@suse.com>
 <DM4PR12MB84511357C8F6FB1976244CA0E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84511357C8F6FB1976244CA0E1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 07:43, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, October 30, 2025 9:40 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; oleksii.kurochko@gmail.com; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Orzel, Michal <Michal.Orzel@amd.com>; Julien
>> Grall <julien@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with
>> CONFIG_MGMT_HYPERCALLS
>>
>> On 13.10.2025 12:15, Penny Zheng wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -646,11 +646,13 @@ config SYSTEM_SUSPEND
>>>       If unsure, say N.
>>>
>>>  config MGMT_HYPERCALLS
>>> -   def_bool y
>>> +   bool "Enable privileged hypercalls for system management"
>>>     help
>>>       This option shall only be disabled on some dom0less systems, or
>>>       PV shim on x86, to reduce Xen footprint via managing unnessary
>>> -     hypercalls, like sysctl, etc.
>>> +     hypercalls, like sysctl, domctl, etc.
>>> +     Be cautious to disable it, as users will face missing a few basic
>>> +     hypercalls like listdomains, getdomaininfo, etc.
>>
>> This is still too little, imo. For one I'm not sure "users" is quite the right term. I'd say
>> it's more "admins". And then, as mentioned, there are a few domctl-s which are
>> usable by DMs. Aiui device pass-through may also be impacted, which imo will
>> want mentioning here as well. Or else, if there is an implication that DMs aren't to
>> be used when MGMT_HYPERCALLS=n, that is what would want calling out.
> 
> How about
> "
>         Be cautious to disable it, as admins will face missing a few basic
>         hypercalls like listdomains, getdomaininfo, etc, hence leading to
>         have an impact on xl-device-passthrough and restricted DM.
> "

Much better. However, why "xl-" and why "restricted"? Neither aspect matters
here, unless I overlook something.

> Another question on PV_SHIM_EXCLUSIVE:
> After Stefano's " 6c80f0dd1bb  xen: fix randconfig build problems after introducing SYSCTL " reversion patch, and to avoid incurring randconfig failures till the last, maybe I shall combine all PV_SHIM_EXCLUSIVE-related changes into a new commit and put it in the last, after making MGMT_HYPERCALLS optional again?

Whatever works best.

Jan

