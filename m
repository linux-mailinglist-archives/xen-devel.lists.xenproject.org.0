Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67038CAC90E
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:56:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180218.1503446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSX2n-0004XX-Mw; Mon, 08 Dec 2025 08:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180218.1503446; Mon, 08 Dec 2025 08:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSX2n-0004Ue-Ik; Mon, 08 Dec 2025 08:56:33 +0000
Received: by outflank-mailman (input) for mailman id 1180218;
 Mon, 08 Dec 2025 08:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSX2m-0004UY-Ma
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:56:32 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c96449a1-d413-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 09:56:29 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42b38de7940so2130030f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:56:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222484sm24653242f8f.24.2025.12.08.00.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:56:28 -0800 (PST)
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
X-Inumbo-ID: c96449a1-d413-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765184189; x=1765788989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F4k9GUhihgLRaSoIOZd9ZqRELSB3jUjtNblECQYml48=;
        b=FL/ksLg7I28GV35jWLXG45ZU+VLjzd+cOabw7rTDPhUzcq0NHuh8giLeEgViOKVUXi
         WxUrqqW/G3lWWReORjhqoyE9W24ycSTbH5Fekp593F9ik+RboHb6k1BrbtGBGnW1rENf
         k6kijB1BHB7N+hIoyjIzDTSnuO7nFwFRzKwmmkRskzTEPCl0axHaInqULhK9kQhWP7+h
         njQQmJ/3IWnRGo2i93FmwdAMzGkKUBVph0bXzATgZS0rlAXt54rvhXhByg0HZu1lM058
         YDB85uTKNgIAUHExfwCpWiUhCnqSa4UfnmdnSXSzWsfETeGnGOboAWPbA81oQGZ2y06c
         wezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765184189; x=1765788989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4k9GUhihgLRaSoIOZd9ZqRELSB3jUjtNblECQYml48=;
        b=PEBUvnXKUlNo5sUyR2+VOWk4lEfEL44kVg08CIpLn4qo8Zbe/xowgjnmStx5W1q8zk
         x6ybK7iRmvVqedA8tRGXG/Jmi3cYVi7HmQWdZM483JiKw8lAcxgJdgWNm6hehnYgoUjy
         nm9nvEhkxYb8IY27Dhp/Dqt3/tfaoTi/A/kq6cI419b+BfctGJZZMWmWReMpqbqisBVV
         NtBHm3Px4N1mfM6TLFswnb4whcy+s03uKsKcfeX+wREReKTGf+8P0C4Rf9+Cw9WBfRa2
         S95RzVDvjZdviEXqrkuEIyfq3VjZOcQHTryZZozYqwqUMiLaefaW/ybF0cwkLvreJ/Ba
         tDog==
X-Forwarded-Encrypted: i=1; AJvYcCWlPOkbEDhqyJws0ApAC6bCFLxPH3+511qtH9jHXB5l9wmuS0y29Mz3zl0/TwhYc8yo/gzZRIwMcXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAqrnJb0oAcw5ek0biYzF48J6yIHG31peEtt/+kav4KJkwVTj3
	xetIzE4i2eEzOwXkAOOC3iMhgF5HSnEDiQrCVjaTci2vXAXEoHtsuYCf4OIOGSVltA==
X-Gm-Gg: ASbGncvOlmByY0Wkaj/qqX1GhN4ea2tkawMJA7pV8cgANACnz1X5PtuBuFJef40V0Cg
	VuDyCpdeLlVvcz6mIAS5p+Gbz1Kl+5QWfajuDqi7MfCu7QsOo93gSDI3w6EwC4lROiohY4zmo0n
	ZxLVtX6p5MzV9N2vJNry8DzVKNDpnQMFISWzZeLSQOFq291UBScw3ley2aPq9pijxzJ9cqkik9S
	3QtaaZ+YwuNWF+gWZLFKnpa1xbwOI8mcWFGoQsKh01Whp8tVAXm35AQgayS8k2bmu+Pd1qHQFIJ
	DcA33BZRdjq/3PQbxUx0L8sg/3953Rr4vbVTQSNObPPsNAZRemqR0c8DDk6ce+oOfKAaJsQ6CY4
	Il6c8HPH2WzL9gTFHTGJPl/ykmJW4y4cJEkV1VM4nQCKNQ7xl8t+Kcg2QBW3uPK2SbCdDADej6t
	kSO/rQ04hfxFBjGVFyYeWpWcQklJJFWsAZxm4sxh37SAoo2t7FXhl0ugTV7xB0eI8cwKB/56W9T
	hv4IG+vTdqRfw==
X-Google-Smtp-Source: AGHT+IFG8f/coAjyNnTHlV5L+8VhKc/j8l9da18qTcBcGdMEbFlekgdu2FSV+7uj5pbYtE5fMBnbsw==
X-Received: by 2002:a05:6000:40cb:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-42f89f54bdbmr7120626f8f.47.1765184189204;
        Mon, 08 Dec 2025 00:56:29 -0800 (PST)
Message-ID: <6c10dbc4-3247-4a0d-9953-858d09df08a9@suse.com>
Date: Mon, 8 Dec 2025 09:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251205222813.277164-1-jason.andryuk@amd.com>
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
In-Reply-To: <20251205222813.277164-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 23:28, Jason Andryuk wrote:
> When linking to create xen-syms, add --gc-sections to garbage collect
> unused stuff.

What about xen.efi?

>  Relies on CONFIG_CC_SPLIT_SECTIONS

Yet still ...

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -137,18 +137,21 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>  	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>  	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> +	      --gc-sections \

... you pass the option unconditionally. Which may be fine from a functional
perspective (little if anything will be saved), but besides being a little
inconsistent with the description I also wonder whether the option won't have
unwanted side effects (longer linking time, bigger working set).

>  	      $(dot-target).0.o -o $(dot-target).0
>  	$(NM) -pa --format=sysv $(dot-target).0 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>  		> $(dot-target).1.S
>  	$(MAKE) $(build)=$(@D) $(dot-target).1.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> +	      --gc-sections \
>  	    $(dot-target).1.o -o $(dot-target).1
>  	$(NM) -pa --format=sysv $(dot-target).1 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
>  		> $(dot-target).2.S
>  	$(MAKE) $(build)=$(@D) $(dot-target).2.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> +	      --gc-sections \
>  	    $(orphan-handling-y) $(dot-target).2.o -o $@
>  	$(NM) -pa --format=sysv $@ \

Rather than having to alter three locations (plus another three for xen.efi,
plus another three for every other architecture that would want to follow
suit), should we perhaps introduce $(XEN_FINAL_LDFLAGS) or some such? That
could then have --gc-sections conditionally upon CONFIG_CC_SPLIT_SECTIONS.

I further wonder whether the use of the option wouldn't want gating by its
own Kconfig control (dependent upon CC_SPLIT_SECTIONS). If nothing else than
to have an easy workaround if either we had a usage bug (e.g. a missing
KEEP() somewhere in a linker script) or there was a related bug in the
linker that we end up being affected by.

Jan

