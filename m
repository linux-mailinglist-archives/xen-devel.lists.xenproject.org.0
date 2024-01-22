Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16CD836053
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 12:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669760.1042163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRs5Z-0007bo-Iq; Mon, 22 Jan 2024 11:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669760.1042163; Mon, 22 Jan 2024 11:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRs5Z-0007ZV-Fv; Mon, 22 Jan 2024 11:03:37 +0000
Received: by outflank-mailman (input) for mailman id 669760;
 Mon, 22 Jan 2024 11:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRs5X-00074J-GN
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 11:03:35 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2e2eec0-b915-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 12:03:34 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cd0d05838fso34534231fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 03:03:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 db7-20020a056e023d0700b00361988e4fe9sm3319291ilb.42.2024.01.22.03.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 03:03:33 -0800 (PST)
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
X-Inumbo-ID: e2e2eec0-b915-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705921414; x=1706526214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBYNIG3ncMsczqGQLPF/BIKyKH8VgE9hqXp7m7uzQ6M=;
        b=ObzkpwO5FgKBfL3UpuNUllAH3EEm9cBxY+ed5ZLyj3KBPsrZUV9zgbCD6S853DTruJ
         yMi9GyhDJx1RP1Cs1MbXuaT4r30k7LJ0mZ+F83OsEz/Lke3Ywa+zFJl6FJuNzBnauY/z
         XIYmQiRuvirfI89nY/HymeE579oUVBN6KuiR81B0ayt/gb650IpKcJkD8XSFCLoo8SJj
         Faqe6dYpOD6D/A22VdckoiQDDuW0kNGrxqKSp1zM64aCoW3/N719ZzF3JypT97hQLGjg
         gxUHfDnNJa5hNA7l8uXDD7FwQ/JhRw1QGoi1qkmbiG4Ut3TSlaxS8PehpVaDbS3N0noE
         tVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921414; x=1706526214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBYNIG3ncMsczqGQLPF/BIKyKH8VgE9hqXp7m7uzQ6M=;
        b=J7VxHOYm6lk5/Kws/E1e8892+nl7B9PlQG8fQVzbubDjMsx830UEvZWfD+omfujt0/
         X7k5erNlr12Jyn6vbY1cVtxdc0oEQTXo3MucqvzNA3ILfwp5ErWS7s7/2AIyhMqJSrVX
         mcdqCn3MW/j9ZK/pqOzb4xIAJ3m/Ws11j65hAOQqWvGuAhxAbcqPYz7jYqu1j/ggOsfc
         qmjTpbZsm1dMyZHJ3i9dJImfC7k3u8ZaRPvRRTHDkali0RmUy3XX3lumSIW1/88YDIYQ
         8uo8X/5vBxQHwQz7y/9sAVslnP5rW7WffN15xv1imGoqy99l0W6SBnPAv1vvRZg+1MS+
         iF3Q==
X-Gm-Message-State: AOJu0YzKTCwqheOZXxGNy1/wFjPFA7YliRZ34cVO7qMvl2OfjGZ28YYx
	4R2NvOUjT1+nbp38E3ho+yytoMvB5o+XjYRS3pQDu/tAym2LW+83eKm42u3dIw==
X-Google-Smtp-Source: AGHT+IFIU2PN31eFCkcRGrnrfe09p3/mudIIpphrzOszhSPzpe7e/jQGLLugAObuxBSitXRP4NI41w==
X-Received: by 2002:a2e:9345:0:b0:2cc:c6e0:fba with SMTP id m5-20020a2e9345000000b002ccc6e00fbamr1560886ljh.7.1705921414326;
        Mon, 22 Jan 2024 03:03:34 -0800 (PST)
Message-ID: <0d0415e9-385f-4b25-9e87-6c29fbb3ca9b@suse.com>
Date: Mon, 22 Jan 2024 12:03:30 +0100
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
In-Reply-To: <01dd5e72-c33c-49c7-838a-4e0eba454c05@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 11:54, Anthony PERARD wrote:
> On Mon, Jan 22, 2024 at 11:04:41AM +0100, Jan Beulich wrote:
>> On 19.01.2024 16:25, Anthony PERARD wrote:
>>> On Fri, Jan 19, 2024 at 09:43:30AM +0100, Michal Orzel wrote:
>>>> Is my understanding correct that by switching from extra-y to targets we are preventing these objects to
>>>> appear in non-init-objects (and thus having COV_FLAGS appended) while retaining the proper if_changed behavior?
>>>>
>>>> According to docs/misc/xen-makefiles/makefiles.rst:
>>>> Any target that utilises if_changed must be listed in $(targets),
>>>> otherwise the command line check will fail, and the target will
>>>> always be built.
>>>
>>> Indeed, and $(extra-y) is added to $(targets) via
>>> $(targets-for-builtin).
>>>
>>> While switching from $(extra-y) to $(targets) prevents the objects from
>>> been added to $(non-init-objets), it doesn't matter because "libelf.o"
>>> is in that variable, so $(COV_FLAGS) is added to $(_c_flags) and its
>>> value is used in all the prerequisites of "libelf.o" which includes
>>> "libelf-temp.o" and for example "libelf-dominfo.o". So the only thing
>>> preventing $(COV_FLAGS) from been added when building "libelf-tools.o"
>>> for example is that we set `COV_FLAGS:=` for "libelf.o".
>>
>> Yet doesn't that (again) mean things should actually work as-is, [...]
> 
> No, because I've explain how it should work, in the hypothetical world
> where we have `targets += libelf-temp.o $(libelf-objs)`.

Yes and no: Why would the COV_FLAGS propagation to prereqs not work today?
Whether libelf-*.o are prereqs to libelf-temp.o or to libelf.o shouldn't
matter, nor should it matter whether libelf-temp.o or libelf.o (or both)
are listed in $(targets). As soon as either libelf-temp.o or libelf.o has
COV_FLAGS overridden (to empty), libelf-*.o ought to be built with empty
COV_FLAGS. What am I missing?

Jan

