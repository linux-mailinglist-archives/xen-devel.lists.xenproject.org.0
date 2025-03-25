Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19187A6EACF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 08:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926092.1328944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twyzm-0003y8-Qv; Tue, 25 Mar 2025 07:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926092.1328944; Tue, 25 Mar 2025 07:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twyzm-0003wg-OE; Tue, 25 Mar 2025 07:46:46 +0000
Received: by outflank-mailman (input) for mailman id 926092;
 Tue, 25 Mar 2025 07:46:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twyzl-0003wa-Fm
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 07:46:45 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b70f233-094d-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 08:46:43 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so39367125e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 00:46:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceafb7sm146697035e9.1.2025.03.25.00.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 00:46:42 -0700 (PDT)
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
X-Inumbo-ID: 4b70f233-094d-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742888803; x=1743493603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p/tma21W0tagGg9/XqW58uPu+AQaIfuzr2VjmvyOcus=;
        b=JCTBIY9F9gqGd4amb4TvYvCx1qCmqTzKPoflfFnMwLOWB9NGhjMdiOV2BlbFKnH9re
         hvmRNLq4uPHvnNp/90Zk1Ixdb7dqynHBL4rf70ShnUuFoP2SrhrdQKb0fkthimHFe9kp
         vVd1Ae5Ac6mmXR0KPAtXVKhhs8xrn+s07YVGyTndKfnZv+i4LRpjSm0k9wTWhJw9CtYl
         LxQi/wDU0MoaB1zFHt+L++Ip8w1pUE+lDNSPjtMrchezT+q6Fwfi3cdAXsocEawccfaA
         rJn7j3doiOCn/V772O/GkgmPUvjNoaPghz+x2IyWSEHyuj1rOLhDILZuBRZIXnDtChNC
         DyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742888803; x=1743493603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/tma21W0tagGg9/XqW58uPu+AQaIfuzr2VjmvyOcus=;
        b=PWvVcuyhlnLfio+b/KypDB7I+OCj94oAlkjBfMQtzol8CaBxvG703ZZSe+FnVpPsrc
         8ScSpo2mRue9QQ94KIqeu0ARYjTYnh5ZsuBad/B+KDFWIeACIQ5NpoZSzVNtyUAet0+t
         89hPqi6qXHJrU/iG3dsqwTdqbBvz14cCIMXR2Q5CLuZxQ0g4vyuS2oeJ9P8ZjeAMxc6M
         5wKuJXcCNTE7jRf+1YG+/9MLBTe2M3fX8HDgrJD9rHlimPvviiBsVQcRyNtVZXdJK/4S
         ZeIUJATyoXZLGBa7Dxs+Zubf1rLq7XUMiah/HcbXNS/gzW1K6nG2Fds0d+Cm1BpaKeIj
         o26g==
X-Forwarded-Encrypted: i=1; AJvYcCVEvbdBZOKB0rAWiD7KQzKJUPTJzHVPJe7AZ+i3O4oPpuFT2v1bUDZkkod9d1DZVSH2ZSHsTvFRUVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQ8NTzm7CcO70FkfZIIngtXpNiyqtn+HHHscwCAUaXKX6sMt8J
	YOq/xTCuoR3cn6x6SKQNw/ZgXDymyZmlOmvqzDFuycya2iR/2qpL3a2Mfd0VUQ==
X-Gm-Gg: ASbGncvqT5qH7/Grv/ord6L0rEiD0ZFTgXqZVY0k2k3ZzISY1jrmW0CW5IaAxO7i8Dk
	URRL+/wDWqNCmCS+UXj2aJjh+Yvu5ycd/6h5mAbNlBpkbqIdtFtL+YhtNg15iV7GH06k6LWd0yp
	ZBGjHHrSE8sOv0LHy/lLviDi2dPJBPoMFmB3zNe1a4zESAj7aM84GrFTApAke4woSfFdkv/DLGK
	Dtph/gmUooc1ES6h0d5Qf6RMvREzvQjRbHOZA2R9XZjzJ6YfGXpQwp94iVyp9wgTdZnl9nwxRyt
	0YqrtzZHX+JCiRXF6R8P5B0RJOV5rlaQeCWsKjrrGDTtq3VnnOh8Ic3lIiYYoZWc/EO/jRfHsPD
	zEFKS1TAnOPVLg3+0B0fgb4221PTN4A==
X-Google-Smtp-Source: AGHT+IGsnTJSMGGefzN6hrlg74gPrK06eVxh7WJeR5Ixjg2sHu4S9KDohZNARKVfEleScyAlR2ubDg==
X-Received: by 2002:a05:600c:1da4:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43d503516d7mr141523725e9.11.1742888802581;
        Tue, 25 Mar 2025 00:46:42 -0700 (PDT)
Message-ID: <a3659fe7-b98e-41ab-873b-58f494969b3d@suse.com>
Date: Tue, 25 Mar 2025 08:46:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/PVH: account for module command line length
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <110f0966-0b89-48d6-b1b3-abae93802c19@suse.com>
 <6a039bc7-429d-4473-8a92-e5693dfd3fd9@citrix.com>
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
In-Reply-To: <6a039bc7-429d-4473-8a92-e5693dfd3fd9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.03.2025 19:24, Andrew Cooper wrote:
> On 24/03/2025 12:03 pm, Jan Beulich wrote:
>> As per observation in practice, initrd->cmdline_pa is not normally zero.
>> Hence so far we always appended at least one byte. That alone may
>> already render insufficient the "allocation" made by find_memory().
>> Things would be worse when there's actually a (perhaps long) command
>> line.
>>
>> Skip setup when the command line is empty. Amend the "allocation" size
>> by padding and actual size of module command line. Along these lines
>> also skip initrd setup when the initrd is zero size.
>>
>> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v3: Permit empty initrd with non-empty module command line again.
>> v2: Use elf_round_up(). Introduce initrd_cmdline local. Re-base.
> 
> I wasn't making a request to support an empty module with a non-empty
> cmdline.
> 
> That's a nonsense configuration; it's almost certainly an error
> elsewhere, rather than an intended configuration.

Who are we to judge whether some configuration is nonsense?

>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -652,9 +652,10 @@ static int __init pvh_load_kernel(
>>      unsigned long image_len = image->size;
>>      unsigned long initrd_len = initrd ? initrd->size : 0;
>>      const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
>> +    const char *initrd_cmdline = NULL;
>>      struct elf_binary elf;
>>      struct elf_dom_parms parms;
>> -    size_t extra_space;
>> +    size_t extra_space = 0;
>>      paddr_t last_addr;
>>      struct hvm_start_info start_info = { 0 };
>>      struct hvm_modlist_entry mod = { 0 };
>> @@ -712,10 +713,26 @@ static int __init pvh_load_kernel(
>>       * split into smaller allocations, done as a single region in order to
>>       * simplify it.
>>       */
>> -    extra_space = sizeof(start_info);
>> -
>>      if ( initrd )
>> -        extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
>> +    {
>> +        extra_space = elf_round_up(&elf, initrd_len);
> 
> I'm going to insist on not doing this.  For the sake of anyone (else)
> trying to follow this logic.
> 
> You're trading increased cognitive complexity of the logic to avoid
> using one local variable.

Well, okay, I'll make a change here then. Your earlier reply didn't sound
like "I'm going to insist", though. Instead I thought I could assume that
my reply there having been left un-responded to would mean you're okay
with the justification I gave.

Jan

