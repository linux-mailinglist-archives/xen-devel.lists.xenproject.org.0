Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC898A6AAAF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 17:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922903.1326690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvISL-00030K-EX; Thu, 20 Mar 2025 16:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922903.1326690; Thu, 20 Mar 2025 16:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvISL-0002xf-BT; Thu, 20 Mar 2025 16:09:17 +0000
Received: by outflank-mailman (input) for mailman id 922903;
 Thu, 20 Mar 2025 16:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvISK-0002xZ-HQ
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 16:09:16 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab722ca6-05a5-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 17:09:15 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso908622f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 09:09:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb40cdafsm24363185f8f.62.2025.03.20.09.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 09:09:13 -0700 (PDT)
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
X-Inumbo-ID: ab722ca6-05a5-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742486955; x=1743091755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qMxiv7I5TV04aLDAey/zrgsmZWa6wv4XsIdFP79JxMw=;
        b=F6b6s2VQzfVsXvRhRjiwHdzgbqCiDZNRjL1MdlL8hBZw4uLCCLZSbdkNDbJuXor5OK
         c2M5/cIQVs6pKQWXeHL/xLhpyOxKH2oiyNmj4F82OFHqaG+xzjkjvWgrXwRqo4Efi8TX
         lxu3oDZjWP4gjS+QnuScRmEcBTr2xnh11wynuRxwQAajRN4xhFW4bk3G6qhGc8s9ZUZn
         7dyNnKFCfACmCmeMlxjJECpmehMTd5cfOiiARLZhIScAPIgnrPbfo1i87ai6ksxXF2gr
         14SazDxc46joL4y5qSGZ5UzeWU9QJ7VwY4XUWdeVH7AxNlcPP6cBN35dwunEzrAIyhuY
         XWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486955; x=1743091755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMxiv7I5TV04aLDAey/zrgsmZWa6wv4XsIdFP79JxMw=;
        b=Y1m8xnDmXm/SwNaJvf10emks2avJLJe1sL0KBXamjs5tX8xlcFQtDb+ZJp+tERe/mL
         n+xN3FxslifBMHradMoBoEGBxYW/pQoCwxdCUhUFWw19xvGAvcyHqC1eZzH9WQAeiuhH
         fZNg0GByCZ24oUwwR7A6ap4RxZKmxGayX3JjcIhiiE+uv890dq9G1cV3z3VAJ8bJ5Cqe
         8sd5CocpjkXnuP+I4NilsK+fQcSP5qck1GtMarEaFzg/Rncb8zLOb8dbareYO4ToDeyT
         0QqBEHXk/LqSoN600nr47GXQV6ZsPcFeRHZJ4dmKYjuVPeOqXsk2urawqFpnVmexFBz3
         dhpA==
X-Forwarded-Encrypted: i=1; AJvYcCWfQgK7CCLD6+O1CESOy7k/MpQiyOvWuozFvwQeln9bX8c/j7l2v+jfHMDhbWPD8QpgsEDJBDkYTh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz12E05gPW/FlVR8by72kluaDkxJG9eBGkW6tl9No320nmlZFFB
	Q8xYcGyuwih27sW64+470BY2OZRWOti/b4TaZqJoaZiErmWn8IfYMaSog15YJg==
X-Gm-Gg: ASbGncvGMdM9ZVVatBpl28aM24tMuLwTecDhekL/xs2XjurgpYCk8FbyuVhGzLJm22X
	pSvQIl+cLNzUpTpy2TCP/qidbDtfKSdQV7gud2xxUYHLUvvJFWiqlJ8PuWmQDuXnNkzZ7H+t1ow
	bA8b08rzYeGUqO7AWnySKw5m6fI5bnc3MPLdTjNxwxqlwCEmH81CL6wleT18XPFpBewhObZR0Xz
	wHOy4BU9uqtkGO6mtruLQh0yzQP4ay2glQDJwaMpRQY49Od6ZMEvLa342hjhWd13iMBI3zM+P9K
	qbIZWnFVaaQlHm1OodXTARHp7dKDsf4rL/CPgyLeZpZzQL3n5ZO6A+MTelNXg8sD5ap9Ldw/L3w
	adN6rdrDcGdOLqA/8zhQJT2VhX69Fww==
X-Google-Smtp-Source: AGHT+IFnkph5dyYhc499kj7lsObXyZzL7Tb2W2GFQYRBTl0+1sYW60DRh4YjkOxTr1wit/LeDZ4gmg==
X-Received: by 2002:a05:6000:188f:b0:390:f902:f961 with SMTP id ffacd0b85a97d-3997f94179fmr60487f8f.45.1742486953527;
        Thu, 20 Mar 2025 09:09:13 -0700 (PDT)
Message-ID: <19a66aaa-e3e8-43be-a988-14586c2fd71b@suse.com>
Date: Thu, 20 Mar 2025 17:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <Z9rJUWCARMQYqNXr@mail-itl> <Z9vrc1Xvm5OEy8rM@l14>
 <Z9wPVGd0fEsbaO_s@mail-itl> <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com>
 <Z9wfKB0vdngn3xXX@mail-itl> <Z9wnzRbwb3HQaSMu@l14>
 <Z9wxcYapF5eno29b@mail-itl> <7698a70a-db0a-4d5d-b5ad-8c0636bc5a33@suse.com>
 <Z9w1BLntGv4ksws0@mail-itl> <fb116d7e-e678-4ac9-920a-de7e5b227417@suse.com>
 <Z9w7PPEbF1STQNBt@mail-itl>
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
In-Reply-To: <Z9w7PPEbF1STQNBt@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 16:58, Marek Marczykowski-Górecki wrote:
> On Thu, Mar 20, 2025 at 04:48:02PM +0100, Jan Beulich wrote:
>> On 20.03.2025 16:32, Marek Marczykowski-Górecki wrote:
>>> On Thu, Mar 20, 2025 at 04:21:18PM +0100, Jan Beulich wrote:
>>>> On 20.03.2025 16:17, Marek Marczykowski-Górecki wrote:
>>>>> On Thu, Mar 20, 2025 at 02:35:59PM +0000, Anthony PERARD wrote:
>>>>>> On Thu, Mar 20, 2025 at 02:59:04PM +0100, Marek Marczykowski-Górecki wrote:
>>>>>>> On Thu, Mar 20, 2025 at 02:49:27PM +0100, Jan Beulich wrote:
>>>>>>>> On 20.03.2025 13:51, Marek Marczykowski-Górecki wrote:
>>>>>>>>> On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
>>>>>>>>>> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-Górecki wrote:
>>>>>>>>>>> There are clearly some build path embedding left. And
>>>>>>>>>>> -ffile-prefix-map=/-fdebug-prefix-map= doesn't work correctly with
>>>>>>>>>>> XEN_ROOT having xen/.. at the end.
>>>>>>>>>>> BTW, would it be acceptable to have this?
>>>>>>>>>>>
>>>>>>>>>>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(realpath $(XEN_ROOT))=.)
>>>>>>>>>>
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> Could you avoid using $(XEN_ROOT) in hypervisor build system? (It's fine
>>>>>>>>>> in "tools/"). In "xen/", there's a few variables you can use if they are
>>>>>>>>>> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(srctree)
>>>>>>>>>> $(objtree) for relative path. That also should avoid the need to use
>>>>>>>>>> $(realpath ).
>>>>>>>>>
>>>>>>>>> XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve it to
>>>>>>>>> not have /.. for prefix-map to work correctly. Would it be better to use
>>>>>>>>> literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree) and
>>>>>>>>> have paths in debug symbols relative to hypervisor source dir, instead
>>>>>>>>> of xen repo root? I'm not sure if that wouldn't confuse some tools...
>>>>>>>>
>>>>>>>> abs_srctree being computed using realpath, can't we replace
>>>>>>>>
>>>>>>>> export XEN_ROOT := $(abs_srctree)/..
>>>>>>>>
>>>>>>>> by something as simpl{e,istic} as
>>>>>>>>
>>>>>>>> export XEN_ROOT := $(patsubst %/xen,%,$(abs_srctree))
>>>>>>>>
>>>>>>>> ?
>>>>>>>
>>>>>>> That works too. It's slightly less robust, but I don't expect "xen"
>>>>>>> directory to be renamed, so shouldn't be an issue. I'll leave also a
>>>>>>> comment there why not /.. .
>>>>>>
>>>>>> I don't think $(XEN_ROOT) is present in the binaries produce by the
>>>>>> hypervisor's build system. There's only a few use if that variable: to
>>>>>> load some makefile, to execute makefile that build xsm policy and to
>>>>>> generate cpuid-autogen.h. Otherwise I don't think the compile have this
>>>>>> path in the command line. What is going to be in the binary is
>>>>>> $(abs_srctree), which you can replace by "./xen" if you want; which mean
>>>>>> it doesn't matter if the directory is renamed or not. You might want to
>>>>>> also take care of $(abs_objtree) which seems to also be in `xen-syms`
>>>>>> when doing out-of-tree build.
>>>>>
>>>>> So, you suggest to do -fdebug-prefix-map=$(abs_srctree)=./xen ? That
>>>>> appears to work for in-tree builds too.
>>>>
>>>> And why ./xen (question to Anthony)? Just . is quite fine, isn't it?
>>>
>>> It makes paths in debug symbols relative to xen/ subdir, not the
>>> repository root. I'm not sure if that is a problem, but it may be for
>>> some tools.
>>
>> Yet especially in the symbol table (and hence in strack traces) that's
>> unnecessary extra space it takes up.
>>
>>>>> But now I actually tested how it looks with out-of-tree builds, and
>>>>> indeed $(abs_objtree) is embedded there too. Adding
>>>>> -fdebug-prefix-map=$(abs_objtree)=./xen appears to help for this. But,
>>>>> -fdebug-prefix-map doesn't help with abs_srctree in out-of-tree builds
>>>>> for some reason. -ffile-prefix-map does. And so does -fdebug-prefix-map
>>>>> + -fmacro-prefix-map. Is there any preference which one to use? It
>>>>> appears as -fmacro-prefix-map and -ffile-prefix-map have the same
>>>>> availability in both GCC (8) and Clang (10).
>>>>
>>>> Then the simpler -ffile-prefix-map is better, imo. Question then is
>>>> whether any of the options is actually needed at all for in-tree builds.
>>>
>>> Yes, without any of those options, both xen-syms and xen.efi contain
>>> full source path.
>>
>> Even in builds without debug info? 
> 
> For in-tree build without debug info, it appears no. But with debug
> info, something is needed even for in-tree build.
> And BTW, IIUC out-of-tree builds will become relevant even for in-tree
> build at some point, due to pvshim.

That hasn't happened yet because it's not quite straightforward to arrange
for.

>> Imo a goal ought to be to specify the
>> weakest possible of these options for any particular build mode. I.e.
>> possibly -ffile-prefix-map= for out of tree builds, else
>> -fdebug-prefix-map= when DEBUG_INFO=y, else nothing (if possible).
> 
> Is it? I don't really see why making the selection overly complex if the
> option is supported (and cc-option-add covers that case).

Yes, cc-option-add might cover the case where nothing is needed. But the
two options mentioned have appeared in gcc at different versions. People
using e.g. gcc7 may still benefit from -fdebug-prefix-map=.

Jan

