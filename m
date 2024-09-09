Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503FA9719DD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794434.1203360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sndpp-000402-MC; Mon, 09 Sep 2024 12:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794434.1203360; Mon, 09 Sep 2024 12:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sndpp-0003yK-Iu; Mon, 09 Sep 2024 12:49:37 +0000
Received: by outflank-mailman (input) for mailman id 794434;
 Mon, 09 Sep 2024 12:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sndpn-0003yE-OD
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:49:35 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6344867-6ea9-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 14:49:33 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso42052466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:49:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25a09e21sm338109666b.84.2024.09.09.05.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 05:49:32 -0700 (PDT)
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
X-Inumbo-ID: f6344867-6ea9-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725886173; x=1726490973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B0VFLT1xj82Q0+jigFTKBrrHXUSpqe6ZDmPVoye/hnc=;
        b=eE5pQeFWD8KA5JhuGf6vvATOO8GzDWTDXNL/uBv0zYM6zc6RqtvYcI+pOOBWv8ZBVy
         rVZOK0vozXrxCP5ejKAR38egJNnIazB0Wbnfm06OJyqCwmmdZHqN1hxDtJsdUOhXqTA0
         IuJkLqTSwSS4gGDVEvAyz27fjj6nwku329eIIkccnqSeLE9Bc+cLhziH1mluzs/qmxQo
         Sv6bkgv5QwUBuux3EGUjEd/gChO/OpGiHm/cfhMgevl5HfIsYODvx5jWPYfgw6k8l+2m
         cVyVFGrNc1RyUBjPKvHv00X78n5TW7Bc4/y+MpeNcAbg5T0hA8rGoT92fJG/KFcu2sqj
         5gyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886173; x=1726490973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0VFLT1xj82Q0+jigFTKBrrHXUSpqe6ZDmPVoye/hnc=;
        b=dSiBUD/TQixhA505wpUdYNNSXfGE8SR+ogL2QiLqq0na4bpfTqUmPNhEVNcxSZvUdh
         nTJs/a+QNWFnHl+lq/4BtmuzhVjPNsoM/j+au0HDYr/PJZbRLIMvgpPbvikw0wob2NhM
         +4fAI/jR50Q3OBOLLOB9Fkh+weXERcTRCgZQCG3uyytMcbp29OZ9K+1SvZyJGeKCYNKP
         op23ynAjnOCn3zbqcGhpUoqATty16ovrjQ9/LfI4Jy7HdeCsppMsL0d1PQw21/0F/lrp
         XgadEE67Zge2kAzL5fmrBPcPXkJyLgV5PquJG5uESNPXIE1WcJfFPNWvaetAJ3VLKFEF
         0mmA==
X-Gm-Message-State: AOJu0YzibwwKEE1NXIEQ3jvfGC6Hgwc7cO7K1fylyO57ftYC7E5oK7hn
	MxE/6lH8mZSLcfaSWKVVNWjJT8+BWG/Gqk7ppHFoyHKGlE5Qs9f4KQW5fB95G6l36Fe8TMJjHlE
	=
X-Google-Smtp-Source: AGHT+IF87DCPydV+EPhmjb/+aI7gP/D5oCeKnFKdoPbhc58lQwoejWsEa11fiY1e89inMJEi1TPOXw==
X-Received: by 2002:a17:907:6e8f:b0:a8a:8dd3:f135 with SMTP id a640c23a62f3a-a8a8dd3ffd8mr1084184366b.14.1725886172521;
        Mon, 09 Sep 2024 05:49:32 -0700 (PDT)
Message-ID: <98a906a4-7324-4e65-8dc1-298fc81a0729@suse.com>
Date: Mon, 9 Sep 2024 14:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/boot: Add missing __XEN__ definition
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org
References: <20240909110329.84512-1-frediano.ziglio@cloud.com>
 <20240909110329.84512-2-frediano.ziglio@cloud.com>
 <c05e0a14-269a-4608-9858-d6a64ae96fb9@suse.com>
 <CACHz=ZiQmduDU0TiSCXZwyPOESYFMFa+cW==LhAqDgP32Jp8Dg@mail.gmail.com>
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
In-Reply-To: <CACHz=ZiQmduDU0TiSCXZwyPOESYFMFa+cW==LhAqDgP32Jp8Dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2024 14:04, Frediano Ziglio wrote:
> On Mon, Sep 9, 2024 at 12:21 PM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 09.09.2024 13:03, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/boot/Makefile
>>> +++ b/xen/arch/x86/boot/Makefile
>>> @@ -15,7 +15,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32
>> -march=i686,$(XEN_TREEWIDE_CFLAGS))
>>>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>>  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
>>>  CFLAGS_x86_32 += -nostdinc -include $(filter
>> %/include/xen/config.h,$(XEN_CFLAGS))
>>> -CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS))
>>> +CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
>>
>> Any reason not to similarly make this -D% as a filter expression?
> 
> I saw that a lot of defines are about processor support which do not make
> sense for 32 bit.
> 
> Do you want me to add a comment in the commit?

Since we're being deliberately selective then - yes, please.

Jan

