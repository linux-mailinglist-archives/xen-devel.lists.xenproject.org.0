Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D024998B449
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 08:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807727.1219350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svWMF-0004uR-8m; Tue, 01 Oct 2024 06:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807727.1219350; Tue, 01 Oct 2024 06:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svWMF-0004sY-5H; Tue, 01 Oct 2024 06:27:39 +0000
Received: by outflank-mailman (input) for mailman id 807727;
 Tue, 01 Oct 2024 06:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svWMD-0004sS-79
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 06:27:37 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa5a6a0-7fbe-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 08:27:36 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a93c1cc74fdso773553166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 23:27:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297be12sm657189566b.179.2024.09.30.23.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 23:27:34 -0700 (PDT)
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
X-Inumbo-ID: 3fa5a6a0-7fbe-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727764055; x=1728368855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jdpED8HK8tuc9VWQI7WO7MSrDU0AXIkbbzAiwhTKjpY=;
        b=esNtJFYT5HQYpLOIsu4H2iXrA4JhyIx7P3UiOVMmqvsOs4iLbATsawyh4wQ1XW+Fub
         +eZ2zkSPEb4eQFmw20UJq4Z8JAOuOzG21uJ8UZivNsVBwjtFcMhqyhOJiljmaErEQuSo
         axzlHWFRZ5pejZfRYMWVijyhPGthtI0dUk7zzuFLdAWM1yfbsOzeUENIfMS8VPBLjqJa
         XeNzIdGj2TcClluGiyq6rAzDFQ42zGxMCPRNUEYLTsTDvxBjnL2USOgklghpAvGnkh2O
         /jrYRtFK52SZ50uKz085nKULCLVkaxDaYA6l6/i0MUpy7KnD6gAvf3xDkzxj4pr1OppW
         dM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764055; x=1728368855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdpED8HK8tuc9VWQI7WO7MSrDU0AXIkbbzAiwhTKjpY=;
        b=AjX7tIB9LCAUrdfY/A0bR+P1TXVI+xf09zxgyhZF/y4m5GZfypSKzGj+Rh432wd101
         yv1NYPeexVY4cBEi8DYsgBXch+Um8jtrthK8p3b48+KZQa8bxDKVxUy916e936HIkcCP
         HpCYwIr5mMboD/NQIoLBYoxKLbYouYZsOz4ADfbwXT8Jtm3eL8ojNAJKC7Pg8tfZBUx1
         ou43eGnGAgYJLQ6NuW+OYywvNDXrEfizgtDDHA6ch5GdUjcQCyJnnTlK/1nrIGbw885n
         eDPbkTaKRhpP4UvHj1yGPmOLU8+v7hPkJLd3hAm6U1Gfb70OGNIsqaAvVRXa8QisaGBY
         pzLA==
X-Forwarded-Encrypted: i=1; AJvYcCW2TluIilsHQojJAwogwj+uh8jH+IIuvWkqarPhWAppJtuBaJonpFeRT91OR03m6FEFV8iZAuFUwH4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyK+8wVfBLdSJDKotVkAZDwHhHO1TFsR7kakJr5QqVwLfJeFZOd
	He2cMI5LIYj5Pf6PrZPxl2Sm5jxOHcEp4haJDeGHTgBuS/kXeF64hT3CycL7jw==
X-Google-Smtp-Source: AGHT+IEtaQ5mTvoa+jVWlhnf+xIWnX4zh430leC/vClMBJ2SI3D6hY/W9rWD+fn+ncpfwWyUgBVelA==
X-Received: by 2002:a17:907:1c24:b0:a8d:2faf:d341 with SMTP id a640c23a62f3a-a93c48ee926mr1658562366b.10.1727764055504;
        Mon, 30 Sep 2024 23:27:35 -0700 (PDT)
Message-ID: <f696a8b4-02f5-4b2e-9417-db94bf354a32@suse.com>
Date: Tue, 1 Oct 2024 08:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com>
 <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com>
 <alpine.DEB.2.22.394.2409092149210.3672@ubuntu-linux-20-04-desktop>
 <44738f93-e99b-4f1c-9ed3-59dd2eac7aff@suse.com>
 <alpine.DEB.2.22.394.2409111808580.611587@ubuntu-linux-20-04-desktop>
 <24e33cc2-c9eb-4609-a074-51df81997aba@suse.com>
 <alpine.DEB.2.22.394.2409301430090.451631@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2409301430090.451631@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 23:40, Stefano Stabellini wrote:
> On Mon, 30 Sep 2024, Jan Beulich wrote:
>> On 12.09.2024 03:13, Stefano Stabellini wrote:
>>> Hi Jan, we have gone back and forth on this a few times, but neither
>>> Alessandro nor I fully understand your perspective. To help streamline
>>> the process and save time for everyone, I suggest you provide an example
>>> of the rules written in the style you believe is appropriate. Once you
>>> set the initial direction, Alessandro and I can continue and complete
>>> the rest in that preferred style.
>>
>> Header inclusion guards
>> -----------------------
>>
>> Unless otherwise specified, all header files should include proper
>> guards to prevent multiple inclusions. The following naming conventions
>> apply:
>>
>> - Guard names are derived from directory path underneath xen/ and the
>>   actual file name.  Path components are separated by double underscores.
>>   Alphabetic characters are converted to upper case.  Non-alphanumeric
>>   characters are replaced by single underscores.
>> - Certain directory components are omitted, to keep identifier length
>>   bounded:
>>   - The top level include/,
>>   - Any architecture's arch/<arch>/include/asm/ collapses to
>>     ASM__<ARCH>__,
>>   - Architecture-specific private files' arch/.
>>
>> For example:
>>
>> - Xen headers: XEN__<filename>_H
>>   - include/xen/something.h -> XEN__SOMETHING_H
>>
>> - asm-generic headers: ASM_GENERIC__<filename>_H
>>   - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
>>
>> - arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
>>   - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
>>
>> - Private headers: <dir>__<filename>_H
>>   - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>>   - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
>>   - common/something.h -> COMMON__SOMETHING_H
>>
>> Note that this requires some discipline on the naming of future new
>> sub-directories: There shouldn't be any random asm/ one anywhere, for
> 
> I would remove the word "random"

Fine with me; perhaps use "other" in its place?

>> example.  Nor should any new ports be named the same as top-level (within
>> xen/) directories.  Which may in turn require some care if any new top-
>> level directories were to be added.  Rule of thumb: Whenever a new sub-
>> directory is added, check the rules for no collisions to result.
> 
> I guess you meant "no collisions among the results" ?

No, that would be insufficient. I specifically mean to say that there
should be no _potential_ for collisions, i.e. not just "among the
results", but also for hypothetical files added underneath such new
subdirs. Would "for no collisions to potentially result" be more clear
from you perspective?

Jan

