Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38C2836174
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669784.1042203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRsSq-0005SQ-6P; Mon, 22 Jan 2024 11:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669784.1042203; Mon, 22 Jan 2024 11:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRsSq-0005QE-3X; Mon, 22 Jan 2024 11:27:40 +0000
Received: by outflank-mailman (input) for mailman id 669784;
 Mon, 22 Jan 2024 11:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRsSo-0005Q8-Qm
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:27:38 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e4bc6d4-b919-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 12:27:36 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50e766937ddso3439074e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 03:27:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m11-20020a056e020deb00b003625add635csm1269593ilj.5.2024.01.22.03.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 03:27:35 -0800 (PST)
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
X-Inumbo-ID: 3e4bc6d4-b919-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705922856; x=1706527656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YBmfVqAiah0GitxWoHHnU31j+zopCoO12qCsdShFQHM=;
        b=BxasoBvMzk+P9/k1sPnEOAwaII76w3wnSxhuiT14oBrAnwXcArkgJFoRv2tWZ3XQR7
         6ck7CI5MNw+F4hf3TUxfq4eEO01iqQS2t7/vDVp+HcoUofLJtnYNBlda4BxfIJQtYufB
         oVsfbyOAEu+PzgFQLhD8d+wzHpx1U/nsTHUNcmgbBqUJjRvJHdNlOSKhmDO0cd2p92w/
         Bsu8eudv/T5P9ownTxdtdfR3irt8M4qE353G/rlvrkOKv022Jf/vgSXMp8wPT67zlA4/
         H96Ve5e4wllPkAGgT7imAYDvJ+ptPB+T+e/M8WI5NynQlUUzZfaFImT7E+2phGYvPd2R
         6x1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922856; x=1706527656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBmfVqAiah0GitxWoHHnU31j+zopCoO12qCsdShFQHM=;
        b=FzctuE16PPwp5C7vrEtsYZKwOJHBdLjLlaansxKVKcZRa5JPTUkg1CkwG3rcTopM5p
         6Rl8xLsBqlT5diJAqnkmBKZ+srIT4y1Ree1imJtdub3fgmSasoZAlFgzzsF+bSGgpWeD
         aSelvXqpkkwWAdPnft1pvBKS1yoTHRpv0W/Z9M+Ri2gpyGcwZRUUCiqIv+1AYDMfkB6l
         8VrTE3FL2Jj3JwnPRQ0QikW+oCc/ilHCcVALdmViZHBsq8hmbwdno9gGRhjK5dirU/Er
         PUc2fHyFYlim1LsPWbSUd7xscEreRsSQItIGsjiZu7BU0zQ9cFH49Z1f/hLZw4bBWWUT
         4gAg==
X-Gm-Message-State: AOJu0Yyleey9puML6ppRtpUBOrQzGo3UFJqNqBSfyBzJqVY9SvaAeOZ4
	vS06JkO4x4/rMajwtAJaavB+6IZd0YEvfwyh1xcuhvRQRQnv5Ov8Soh+nK4jAw==
X-Google-Smtp-Source: AGHT+IHxQb3IyXcil1c9EF5vHhRormOrtc56tIDf3/IdRlvm9QeMEpn1JZOWcTbbvh+4HDhfDQLizg==
X-Received: by 2002:a05:6512:2253:b0:50e:a9db:9b89 with SMTP id i19-20020a056512225300b0050ea9db9b89mr1888439lfu.13.1705922856046;
        Mon, 22 Jan 2024 03:27:36 -0800 (PST)
Message-ID: <f8e18554-cb03-4b6f-9a6d-0d43c068388a@suse.com>
Date: Mon, 22 Jan 2024 12:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coverage: filter out lib{fdt,elf}-temp.o
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
 Michal Orzel <michal.orzel@amd.com>
References: <20240118120641.24824-1-michal.orzel@amd.com>
 <8057ae41-43b5-4469-b691-4e7f16b8dd4d@suse.com>
 <e399890c-0299-4ec5-884e-0637ae6cb5b0@perard>
 <9d552e6d-eb5d-4ccf-a35d-a359df7c4478@amd.com>
 <0a1c749b-8169-43b5-9921-961096f8570d@perard>
 <0437c4eb-8438-44a8-a749-aef6c4c93ef0@suse.com>
 <01dd5e72-c33c-49c7-838a-4e0eba454c05@perard>
 <d4842805-7e94-49ce-8f14-78642f469e02@perard>
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
In-Reply-To: <d4842805-7e94-49ce-8f14-78642f469e02@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 12:05, Anthony PERARD wrote:
> On Mon, Jan 22, 2024 at 10:54:13AM +0000, Anthony PERARD wrote:
>> On Mon, Jan 22, 2024 at 11:04:41AM +0100, Jan Beulich wrote:
>>> On 19.01.2024 16:25, Anthony PERARD wrote:
>>>> On Fri, Jan 19, 2024 at 09:43:30AM +0100, Michal Orzel wrote:
>>>>> Is my understanding correct that by switching from extra-y to targets we are preventing these objects to
>>>>> appear in non-init-objects (and thus having COV_FLAGS appended) while retaining the proper if_changed behavior?
>>>>>
>>>>> According to docs/misc/xen-makefiles/makefiles.rst:
>>>>> Any target that utilises if_changed must be listed in $(targets),
>>>>> otherwise the command line check will fail, and the target will
>>>>> always be built.
>>>>
>>>> Indeed, and $(extra-y) is added to $(targets) via
>>>> $(targets-for-builtin).
>>>>
>>>> While switching from $(extra-y) to $(targets) prevents the objects from
>>>> been added to $(non-init-objets), it doesn't matter because "libelf.o"
>>>> is in that variable, so $(COV_FLAGS) is added to $(_c_flags) and its
>>>> value is used in all the prerequisites of "libelf.o" which includes
>>>> "libelf-temp.o" and for example "libelf-dominfo.o". So the only thing
>>>> preventing $(COV_FLAGS) from been added when building "libelf-tools.o"
>>>> for example is that we set `COV_FLAGS:=` for "libelf.o".
>>>
>>> Yet doesn't that (again) mean things should actually work as-is, [...]
>>
>> No, because I've explain how it should work, in the hypothetical world
>> where we have `targets += libelf-temp.o $(libelf-objs)`.
> 
> The problem is that there's currently two "paths" to build libelf-temp.o
> (and even three I think for libelf-tools.o libelf-loader.o
> libelf-dominfo.o):
> 
> Simplified makefile:
> 
>     obj-y := libelf.o
>     extra-y := libelf-temp.o
>     COV_FLAGS := -fcoverage
> 
>     __build: $(extra-y) built_in.o

Oh, okay - this is the piece I was missing. Thanks for the explanation.

Jan

>     built_in.o: $(obj-y)
>     libelf.o: COV_FLAGS :=
>     libelf.o: libelf-temp.o
> 
> So, make can build "libelf-temp.o" as prerequisite of "__build" the
> default target, or as prerequisite of "libelf.o".
> In the first case, COV_FLAGS would have all the flags, and in the second
> case, COV_FLAGS would be reset, but that second case is too late as make
> is more likely to have already built libelf-temp.o with all the flags.
> 
> Cheers,
> 


