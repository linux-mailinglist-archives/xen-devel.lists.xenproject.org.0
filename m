Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FDF97EE68
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 17:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802169.1212342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslD2-0003Pd-C9; Mon, 23 Sep 2024 15:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802169.1212342; Mon, 23 Sep 2024 15:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslD2-0003NF-95; Mon, 23 Sep 2024 15:42:44 +0000
Received: by outflank-mailman (input) for mailman id 802169;
 Mon, 23 Sep 2024 15:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sslD1-0003N9-Mm
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 15:42:43 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77d84d3f-79c2-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 17:42:41 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so6039127a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 08:42:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bc8906fsm11014166a12.86.2024.09.23.08.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 08:42:40 -0700 (PDT)
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
X-Inumbo-ID: 77d84d3f-79c2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727106161; x=1727710961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EVSlJ3ZBev5C5bJBwAmCrmsjl2ctOuxdfH+OzJxHvVY=;
        b=NFc22/XAR2iOEFgarE7Ez9NyP1LSTg4M/O8du7LuzP1EqBmIs5AFY+d330iWGd/6yR
         AZ6ppQx/z/KutJywvfWH6K1EhJ4UaJKCN3k9vtss3xMu11GJyezxz2w3WLbGUiF2qKMV
         uTpx6LpPgMzLM2tFmgu1oUX7MolIm/u4sbGhBnJQtiHxnwVQ3B14CV616F+bDjs0nW92
         uxJJXu09/9/cnmRB0PzzcxDWBk7G4WgdrJNvhGgajdadBaFGpYMb5T76xaaroZ6haft8
         LE2pts6kfFINB0Jjgoid5kgF9cY0KcVjuAar03jqCfWaM059JIMqM8j7t3mHfgjzjsGu
         1LQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727106161; x=1727710961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVSlJ3ZBev5C5bJBwAmCrmsjl2ctOuxdfH+OzJxHvVY=;
        b=btSfnPFOUVsExVhLOtoizGwoYDqitqlDsLqTVOFRY1uSDR/YaLV++wDdW0Zd8RRCTx
         oAKKRi15wwRqFJ3YojMwi1BMYltqMHwbExtbtqpBemxP+gsjW+/vJOjPWaHmAfOi6wr8
         q9VlKU2yFCawOXWLvPH+uYKhJjGz19tGzPLBGC1zKgnXMFBYAeB9ytekkHD2WpCBiJX6
         yYlxtJS7oaHCaesyhFs0u5suYrTZoCsxMrQsIjwpN9zsIBf9hedCsuccuzBIhbe0YWxB
         FleHYHb7XsgFHc1twk+94A+0J+HiTjXJDEfql/enT0nNvjBTniuVnUIhfL5GIjGZELs9
         qZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXzQtlukKhHsOCY2+VFOf/t2yRQLgmzrIaZd2V6wcJ0w1RPW1PHttIxXzJ9+GNBHUEIc0MU7X96avU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+p9vIkXMlFMiUMuWF3tsBq7GTc75jCrtWY1jM1SB44ff0zInA
	qDGqJ+7NatzJNUBmJvHdfIbhCE+wPf+x+MrN3o0ncGcHfpVqsbX0Wv5x+YFIzQ==
X-Google-Smtp-Source: AGHT+IH62JuBHovAEoST+BQbl00lPaF7ybMbAME1pPgS10Ui/5LTexkolr1yZo+j15mzGhC3nNxk1A==
X-Received: by 2002:a05:6402:1e92:b0:5c5:b90a:67a5 with SMTP id 4fb4d7f45d1cf-5c5b90a68cdmr8332433a12.32.1727106160790;
        Mon, 23 Sep 2024 08:42:40 -0700 (PDT)
Message-ID: <2857a31c-a705-4c96-bc9e-ea7cedb5707d@suse.com>
Date: Mon, 23 Sep 2024 17:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86: Put trampoline in separate .init.trampoline
 section
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-2-frediano.ziglio@cloud.com>
 <47fc5e0d-e249-4e69-b19d-bb2c4edd1abd@suse.com>
 <CACHz=ZjFdqWcu7hKDgwiSaQhxQxBFjQDbze3=GY02_TmY89wyA@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjFdqWcu7hKDgwiSaQhxQxBFjQDbze3=GY02_TmY89wyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.09.2024 17:31, Frediano Ziglio wrote:
> On Mon, Sep 23, 2024 at 4:17 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.09.2024 10:00, Frediano Ziglio wrote:
>>> This change put the trampoline in a separate, not executable section.
>>> The trampoline contains a mix of code and data (data which
>>> is modified from C code during early start so must be writable).
>>> This is in preparation for W^X patch in order to satisfy UEFI CA
>>> memory mitigation requirements.
>>> At the moment .init.text and .init.data in EFI mode are put together
>>> so they will be in the same final section as before this patch.
>>> Putting in a separate section (even in final executables) allows
>>> to easily disassembly that section. As we need to have a writable
>>> section and as we can't have code and data together to satisfy W^X
>>> requirement we need to have a data section. However tools like objdump
>>> by default do not disassemble data sections. Forcing disassembly of
>>> data sections would result in a very large output and possibly crash
>>> of tools. Putting in a separate section allows to selectively
>>> disassemble that part of code using a command like
>>>
>>>     objdump -m i386 -j .init.trampoline -d xen-syms
>>
>> For xen.efi it won't be quite as neat. One of the reason all .init.*
>> are folded into a single section there is that the longer section names
>> aren't properly represented, because of the linker apparently preferring
>> to truncate them instead of using the "long section names" extension. To
>> disassemble there one will need to remember to use "-j .init.tr". I'll
>> have to check if there's a linker option we fail to enable, but in the
>> absence of that we may want to consider to name the output section just
>> ".trampoline" there, abbreviating to ".trampol" (i.e. at least a little
>> more descriptive).
>>
> 
> Long names are working for me, probably some issues with older binutils tools.
> ".trampol" looks fine for me.

See the patch just sent, including the remark towards the somewhat unexpected /
inconsistent behavior of the linker. No need to drop the .init with that patch
in place then.

Jan

