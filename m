Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD6806D71
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 12:09:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649106.1013470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAplv-0001ZL-GG; Wed, 06 Dec 2023 11:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649106.1013470; Wed, 06 Dec 2023 11:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAplv-0001W8-DS; Wed, 06 Dec 2023 11:08:55 +0000
Received: by outflank-mailman (input) for mailman id 649106;
 Wed, 06 Dec 2023 11:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAplt-0001Uk-Dw
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 11:08:53 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d61c3d87-9427-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 12:08:51 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-40bda47c489so49530085e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 03:08:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i18-20020adfefd2000000b003334a1e92dasm7525844wrp.70.2023.12.06.03.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 03:08:50 -0800 (PST)
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
X-Inumbo-ID: d61c3d87-9427-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701860931; x=1702465731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CfaGgd6gQkSS9Mc3NdONhX0cX/DN06VXN/WVpsa6X8=;
        b=Chgdc/+NqMUgbnHrziRkuVDo31oC04uYzfqael8W/dzClc+mIQInIZ/KrD8NJIPgpj
         GzTHikO0gMRhuE0l5ZZ3jO+RHn5L4fNkR3RyWMkkV+PVi1qsfoYqfEU0Ww+JvkRha68n
         g84+r282CppL6KjgYHqASIg1eOEqA9U/+Y2QGplyiljTqi203xVrJ8DcjYvSYRPi29ZI
         +393U5Dz4YnlCiJuFp5TmE6fLWD/hgVpX0VBwXqXlASJ/vfEO7wN/wYQgA/6bB7nFFHn
         Y/3Qu8/Q/h7+4Vi3hb23Y271b/1SYM2oUmZw41gQMJwdA3tojMYEO1GhFNGY5rB/9X2k
         oKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701860931; x=1702465731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CfaGgd6gQkSS9Mc3NdONhX0cX/DN06VXN/WVpsa6X8=;
        b=ukK6Q106iqUE85x36BZ5OPIjxW7MFgUToX0fU6BF20GL+USyiHhIJePnSu9nsGErAB
         E/NbBLZYYvWwzLFKIoNaSsoGhuT9jkLYere7EwSluguB654RB5lg5DOODjG/X30iFmGO
         XYQObwYFM12/NzXIBGENQ0NGLvH2o4MjFZUhlpPD0P5WYQe3vZh1kfphWW9DWDj9YkYH
         54IkokLxVMY2YA1SGCHeyEFqC3NC7jTShmH2vqlHqp8VDsB9ggBxC0cje2o5I3R0gcO0
         VUi261TcUMaH+xI1bbWSgJ0wNg+voAXCjzEnDPeU4fzIsIjha77RL/AWixzwRZ/vExTA
         fRRg==
X-Gm-Message-State: AOJu0YzdOMoxlE/BndeQmyZ2TxOmDeXfENd8RtJWSJpyokLqn8JGddIb
	G7qDoxAvDIGJEg37NB2oHapk
X-Google-Smtp-Source: AGHT+IHXqpK7QmDlOLJKSLLQfDHZC0iRMzAXfnUJeKun8f/Sa6VfOSE2u71JIwMS2hAw+HhLPF/4Yw==
X-Received: by 2002:a05:600c:cb:b0:40b:5e59:c58a with SMTP id u11-20020a05600c00cb00b0040b5e59c58amr481730wmm.180.1701860930702;
        Wed, 06 Dec 2023 03:08:50 -0800 (PST)
Message-ID: <0033f56a-cdb7-408b-b78e-823135a463af@suse.com>
Date: Wed, 6 Dec 2023 12:08:49 +0100
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
 <1f46fa0d-8208-49fc-bb38-451616d1e7a9@suse.com>
 <f75edcea-c846-4e31-866d-4df7a7e0cbff@xen.org>
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
In-Reply-To: <f75edcea-c846-4e31-866d-4df7a7e0cbff@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 12:07, Julien Grall wrote:
> Hi Jan,
> 
> On 06/12/2023 11:05, Jan Beulich wrote:
>> On 06.12.2023 11:52, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 06/12/2023 08:52, Jan Beulich wrote:
>>>> On 05.12.2023 19:32, Julien Grall wrote:
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Right now, all tools and hypervisor will be complied with the option
>>>>> -Wdeclaration-after-statement. While most of the code in the hypervisor
>>>>> is controlled by us, for tools we may import external libraries.
>>>>>
>>>>> The build will fail if one of them are using the construct we are
>>>>> trying to prevent. This is the case when building against Python 3.12
>>>>> and Yocto:
>>>>>
>>>>> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
>>>>> |                  from xen/lowlevel/xc/xc.c:8:
>>>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
>>>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>>>>> |   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
>>>>> |       |     ^~~~~~~~~~~
>>>>> | In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
>>>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
>>>>> | /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
>>>>> |   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
>>>>> |       |     ^~~~~~~~~~
>>>>> | cc1: all warnings being treated as errors
>>>>>
>>>>> Looking at the tools directory, a fair few directory already add
>>>>> -Wno-declaration-after-statement to inhibit the default behavior.
>>>>>
>>>>> We have always build the hypervisor with the flag, so for now remove
>>>>> only the flag for anything but the hypervisor. We can decide at later
>>>>> time whether we want to relax.
>>>>>
>>>>> Also remove the -Wno-declaration-after-statement in some subdirectory
>>>>> as the flag is now unnecessary.
>>>>
>>>> With all these removals, don't you need to add the option centrally
>>>> somewhere? Or else are you sure that no compiler version, including
>>>> distro-customized ones, would ever come with the warning enabled by
>>>> default?
>>>
>>> I can't really go through the dozens of different built compilers... But
>>> I would find odd that a compiler will force this option. I view it as a
>>> style enforcement option and that's not up to a distro to decide what
>>> every projects do.
>>>
>>> Also, Allowing your thinking, we would need to add -Wno-switch-default &
>>> co just in case a compiler decide to enable it. So where would we stop
>>> adding -Wno-*?
>>>
>>> I don't think this is very scalable.
>>
>> I agree on this point, but: With the change you do there's a (slim) risk
>> of introducing build breakage. With other -W* / -Wno-* options we haven't
>> had reports of build issues.
> 
> The chance is very unlikely here. So I am not in favor of doing this. I 
> would like the opinion from the others.

Well, it's Anthony anyway who has the final say. I'm not going to insist,
I merely wanted to point out a possible issue.

Jan

