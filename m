Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52389EF2DC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 17:53:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856220.1268915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLmQV-0001Wu-VN; Thu, 12 Dec 2024 16:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856220.1268915; Thu, 12 Dec 2024 16:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLmQV-0001VR-Sk; Thu, 12 Dec 2024 16:52:35 +0000
Received: by outflank-mailman (input) for mailman id 856220;
 Thu, 12 Dec 2024 16:52:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLmQU-0001VL-Tb
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 16:52:34 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ae6fcd4-b8a9-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 17:52:32 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385e2880606so848988f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 08:52:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782521dfesm4390674f8f.107.2024.12.12.08.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 08:52:31 -0800 (PST)
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
X-Inumbo-ID: 7ae6fcd4-b8a9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734022352; x=1734627152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ABRjboFcPXzmp8ZEB8fDUTBnLeQ+jIzjHW5crLMy4/Q=;
        b=Qf0c53rO33Ku5XEdUcnE4ZmEqJoyeNHDMYrEIELhZa6MmN9/syWC+MDqKGkGSvW8MB
         gA75qv5lZXUu+avWnrv6+herVuOaKO8mGJsXhycbdyZQfjwDDTkLufJQRS/5kSMebBTw
         KXiTEDxL+BI932ywcMnClNWpxJIts9GvP2+yqlQE51+hZuvbqUazK7OjgfwbTuzacXPc
         dAcFIjQPt6qU0Xb42vnq7AtuH0BW3XnYNQ/KfTmKXiaeCgh0VzGnd4XoNyAzuN6JGt6p
         Gg8ODnEPli5FCWO/uCuvD5s/AdefxnXnHeLlxmfa0bE7mDZcu1JqousQ6J/tbHMSw/AF
         vLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734022352; x=1734627152;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABRjboFcPXzmp8ZEB8fDUTBnLeQ+jIzjHW5crLMy4/Q=;
        b=ezlhJwSJnGWHPDu0MCtABupvgf53qOgDzo1wIlREumLKFv6SRIpSTNsHH7v1Tab7aU
         lEupCU6hw+VSs3Mg3GkM9dCyMft/XJEGoyzAq3/dfmWzBfEeXFxeKL4zwlk6bxZT0AsM
         7L3yNPxEXIqaLgqqYl5DTl9EjBD84YeX4UR0iFF2k7geVZbcLR9B7Tiq6d3JSbNS9m7t
         hPZSpLQpa+kzuPjfEKKzuNjwCPlvwKOkuWF1xU70rtYd9LwdeEMut2Wr1i9lONHP4lrV
         cECURTdVDZxIHz/EY6AYqJxZNVqVUNkVAUlqAWt7w6FtADZC8ydPLVnml9H8Xc9Ko5C/
         EYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxkyg/zMBZyXfIAlr1fQ/F1MHi5B9ySggnfMS0pP8ySJcqqit33kuUuDNfjQNibYaA1qcu21aqw0c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4PD5buIAPo8u2fMphpbTAaOT39EgEkYPIoc2TEPT/w1AkfwJA
	+AneU6PLQGCdYk2IAWK1AeNfDMniuGAdEUW38qUsZHfCjkx2IdI/tmWG2TQnbw==
X-Gm-Gg: ASbGncuoL7yMxk7DkxnIQQSLYd5dhtioIppYFkcOeo/bmq7Dd+TkVPQyY2xlUNLm0oJ
	RDhse7bePY6+3zax0jYUOzeXmGsMLW2+MlFKwtsoJPNGKtDu/AUs8MVZw/Vf0thoEg8HFxZIvab
	QG9ivbx5Uvoda2+25oa5dAAAhd7MsqBkhWs0d+HQrQ1f2VWBrw6yokLtRpHgIS/6txJbyl51ulw
	btcGEnwMDBWG0ZpnQ3V7jN9xeh0MMQutkZpXwP1t8w4Pnz2Kibl/abVNrkoc7KFerECycq0uI+t
	laEIYfhCe0oLuya0K6x825Qu9qRMRZQU26ynxsx9UQ==
X-Google-Smtp-Source: AGHT+IE8tZAZf6JMun47dVUijQMchEn0AO/AC7YNyhCuCMOFMzbNmogvF5FY0knQFnWEvgM82/tiDw==
X-Received: by 2002:a5d:6da6:0:b0:386:33e3:853c with SMTP id ffacd0b85a97d-3864ce8645amr6765397f8f.12.1734022351880;
        Thu, 12 Dec 2024 08:52:31 -0800 (PST)
Message-ID: <7aea0e1d-f60c-4e82-8b63-c4e18cbcce85@suse.com>
Date: Thu, 12 Dec 2024 17:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add stack protector
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <f1e86e0e-985a-41ae-a94c-979288275257@suse.com> <87pllx3gib.fsf@epam.com>
 <fd9ea545-0eb1-4803-9d1e-df15c5805fa3@citrix.com>
 <9056a92d-8e91-4f2d-a8f3-5cde378f6c6f@suse.com>
Content-Language: en-US
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
In-Reply-To: <9056a92d-8e91-4f2d-a8f3-5cde378f6c6f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2024 15:30, Jan Beulich wrote:
> On 12.12.2024 02:17, Andrew Cooper wrote:
>> (With the knowledge that this is a disputed Kconfig pattern, and will
>> need rebasing), the way I want this to work is simply:
>>
>> diff --git a/xen/Makefile b/xen/Makefile
>> index 0de0101fd0bf..5d0a88fb3c3f 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -434,6 +434,9 @@ endif
>>  
>>  ifeq ($(CONFIG_STACK_PROTECTOR),y)
>>  CFLAGS += -fstack-protector
>> +ifeq ($(CONFIG_X86),y)
>> +CFLAGS += -mstack-protector-guard=global
>> +endif
>>  else
>>  CFLAGS += -fno-stack-protector
>>  endif
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 9cdd04721afa..7951ca908b36 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -28,6 +28,7 @@ config X86
>>         select HAS_PCI_MSI
>>         select HAS_PIRQ
>>         select HAS_SCHED_GRANULARITY
>> +       select HAS_STACK_PROTECTOR if
>> $(cc-option,-mstack-protector-guard=global)
>>         select HAS_UBSAN
>>         select HAS_VMAP
>>         select HAS_VPCI if HVM
>>
>>
>>
>> Sadly, it doesn't build.  I get a handful of:
>>
>> prelink.o: in function `cmdline_parse':
>> /home/andrew/xen.git/xen/common/kernel.c:216:(.init.text+0x20f2): failed
>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>> --no-relax
>> /home/andrew/xen.git/xen/common/kernel.c:230:(.init.text+0x246f): failed
>> to convert GOTPCREL relocation against '__stack_chk_guard'; relink with
>> --no-relax
>>
>> which is more toolchain-whispering than I feel like doing tonight.
> 
> Imo the root of the problem is that the compiler doesn't itself mark
> __stack_chk_guard hidden (it does so for __stack_chk_fail, albeit only for
> 32-bit code), and hence finds it necessary to use @gotpcrel to access the
> variable. Even if the linker managed to relax all of these, it would then
> still be less efficient compared to direct RIP-relative accesses.
> 
> I also can't see how we might be able to override the compiler's internal
> declaration to mark it hidden (the same appears to be true for other items
> the declares internally, like the retpoline thunks or even strcmp() et al).
> Passing -fvisibility=hidden doesn't make a difference (just as another
> data point).
> 
> Playing with -fstack-protector* flavors, I observe:
> - -fstack-protector causing several failures, like you observed, oddly
>   enough exclusively from __init functions,
> - -fstack-protector-all and -fstack-protector-strong each causing a single
>   (but respectively different) failure, for apparently random non-__init
>   functions.
> Taking this together it very much smells like a linker issue. I'll see
> about checking there further.

The oddity with how many diags show up is down to internals of the linker.
It processes a single input section in full (continuing over this specific
type of error), but will stop processing afterwards if any such error was
encountered.

The issue itself is a wrong assumption in the linker: It believes that it
would only ever build small-model code when encountering this kind of
relocation, and when not linking a shared library or PIE. With this
assumption it converts the relocation resulting from @gotpcrel to
R_X86_64_32S (converting the MOV from GOT to MOV $imm), which of course
overflows when later trying to actually resolve it. What I'm yet to
understand is why it doesn't use R_X86_64_PC32 (also) in such a situation
(it does e.g. when building a shared library).

While so far I didn't try it, using --no-relax is presumably not an option,
as I expect that it'll leave us with a non-empty .got. Plus I didn't even
start looking into how the xen.efi linking would deal with the ELF-specific
gotpcrel relocs; the concept of GOT doesn't exist in PE/COFF, after all.

While the linker certainly wants fixing, I continue to think that getting
the compiler side right would yield the better overall result.

Jan

