Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A027D806D50
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 12:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649099.1013450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApig-0008Ag-S2; Wed, 06 Dec 2023 11:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649099.1013450; Wed, 06 Dec 2023 11:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApig-00087o-O2; Wed, 06 Dec 2023 11:05:34 +0000
Received: by outflank-mailman (input) for mailman id 649099;
 Wed, 06 Dec 2023 11:05:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rApif-00087i-IA
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 11:05:33 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5efc00bc-9427-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 12:05:31 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-40838915cecso69586385e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 03:05:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9-20020a05600c34c900b0040b2c195523sm25567166wmq.31.2023.12.06.03.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 03:05:30 -0800 (PST)
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
X-Inumbo-ID: 5efc00bc-9427-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701860731; x=1702465531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIeeRfxClzAdHWsMsKaPL/cbt6oReecT3eOFuTgXlXY=;
        b=P/Qj4gVVLcnEYSAPwuTcM3Un4OL9+FTbdBollpOHcrIP0eU2jAhHnncQr+tdG/V0gt
         hF1bLwgWwSGt42FYIO8r8fBXbtWajQMIV8F4z+5KoF26r4vT+ZHck7RvTXRO3vf7d89h
         u4C6Y+WALrAPTg24V7+R8uM1/c9WwAGYqeM18WH5F4I3340NJDf9eCiBwZ0+ttc3OqC8
         PAwltsBX9QGsKh5BHjO7PvuJTB62idG3nWYvYOAXlpvHRu9Kjk4iS2oEfPE8W+mFkqqY
         DXA7y7brPPXk+Bbh24havyVKZ1akz1UGe6QMh6QaeaeA2YXxwpX819+T2dJuJIpboKNG
         44Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860731; x=1702465531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIeeRfxClzAdHWsMsKaPL/cbt6oReecT3eOFuTgXlXY=;
        b=MeIu3ELEgoNu/RIAKsc8m2yxW9LIyq8WomptfjW4swCpK4x/iPBsShMol3ib/SAtuN
         SqgBpDMrqkPuhaqBvDLYYuDxPacLQ0RhawK5UQnC4P6WYWBkS+ke1HBMDk0FiNc4jFgz
         L0hK8IYPuLeDCpFWiTfwWNtuehOAR3VX9yW1QXbm1ZbJRGiVWD29bmMcJndGFzm1KY0/
         Z7NjpwWFqVKy9U9uQXpLXEUER7oUH8GdJrLGdMTpMFLONmhsD6mQcRELsD5gzxo0IHWK
         HiGjEnUsAxYafqtdsneMwIXIkqANGjVShnV6upAz45vKSLg8TENPzNDFIql99NwBWlXQ
         fXjg==
X-Gm-Message-State: AOJu0Yx8NXF5jgCvMZU2SxThzDVBJuZFVady4ydLbfmiCA4GVcDleDGd
	kwdP6ZiKmSrNR82S/CZwcmW/
X-Google-Smtp-Source: AGHT+IFHjYPyEDhbZPsKUAAM615rQB5vt4/c5kEZRV+UpceZ451aHgDzluk85EootyjvdOnb1zyPjQ==
X-Received: by 2002:a05:600c:4194:b0:40c:729:50d7 with SMTP id p20-20020a05600c419400b0040c072950d7mr438395wmh.156.1701860730833;
        Wed, 06 Dec 2023 03:05:30 -0800 (PST)
Message-ID: <1f46fa0d-8208-49fc-bb38-451616d1e7a9@suse.com>
Date: Wed, 6 Dec 2023 12:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Only compile the hypervisor with
 -Wdeclaration-after-statement
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Juergen Gross <jgross@suse.com>, Alexander Kanavin <alex@linutronix.de>,
 xen-devel@lists.xenproject.org
References: <20231205183226.26636-1-julien@xen.org>
 <c7d844ea-139e-416f-bb8e-51e63c0fe3ed@suse.com>
 <5f31e7d9-fedb-43d4-b8e6-9304c387f282@xen.org>
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
In-Reply-To: <5f31e7d9-fedb-43d4-b8e6-9304c387f282@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 11:52, Julien Grall wrote:
> Hi Jan,
> 
> On 06/12/2023 08:52, Jan Beulich wrote:
>> On 05.12.2023 19:32, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Right now, all tools and hypervisor will be complied with the option
>>> -Wdeclaration-after-statement. While most of the code in the hypervisor
>>> is controlled by us, for tools we may import external libraries.
>>>
>>> The build will fail if one of them are using the construct we are
>>> trying to prevent. This is the case when building against Python 3.12
>>> and Yocto:
>>>
>>> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
>>> |                  from xen/lowlevel/xc/xc.c:8:
>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>>> |   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
>>> |       |     ^~~~~~~~~~~
>>> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>>> |   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
>>> |       |     ^~~~~~~~~~
>>> | cc1: all warnings being treated as errors
>>>
>>> Looking at the tools directory, a fair few directory already add
>>> -Wno-declaration-after-statement to inhibit the default behavior.
>>>
>>> We have always build the hypervisor with the flag, so for now remove
>>> only the flag for anything but the hypervisor. We can decide at later
>>> time whether we want to relax.
>>>
>>> Also remove the -Wno-declaration-after-statement in some subdirectory
>>> as the flag is now unnecessary.
>>
>> With all these removals, don't you need to add the option centrally
>> somewhere? Or else are you sure that no compiler version, including
>> distro-customized ones, would ever come with the warning enabled by
>> default?
> 
> I can't really go through the dozens of different built compilers... But 
> I would find odd that a compiler will force this option. I view it as a 
> style enforcement option and that's not up to a distro to decide what 
> every projects do.
> 
> Also, Allowing your thinking, we would need to add -Wno-switch-default & 
> co just in case a compiler decide to enable it. So where would we stop 
> adding -Wno-*?
> 
> I don't think this is very scalable.

I agree on this point, but: With the change you do there's a (slim) risk
of introducing build breakage. With other -W* / -Wno-* options we haven't
had reports of build issues.

Yet then, thinkking more generally, imo it would be a good idea to always
for either the "yes" or the "no" option for warnings we care about
controlling ourselves. But that's nothing belonging in your change, of
course.

Jan

