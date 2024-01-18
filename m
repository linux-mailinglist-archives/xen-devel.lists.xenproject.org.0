Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C1831D1B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 17:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668835.1041325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUoP-00004w-Rm; Thu, 18 Jan 2024 16:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668835.1041325; Thu, 18 Jan 2024 16:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUoP-0008UL-OU; Thu, 18 Jan 2024 16:00:13 +0000
Received: by outflank-mailman (input) for mailman id 668835;
 Thu, 18 Jan 2024 16:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQUoO-0008UF-G8
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 16:00:12 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a88daccf-b61a-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 17:00:11 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a2e0be86878so172219666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 08:00:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gu12-20020a0566382e0c00b0046df4450843sm1025984jab.50.2024.01.18.08.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 08:00:10 -0800 (PST)
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
X-Inumbo-ID: a88daccf-b61a-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705593610; x=1706198410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Imm3giTj2XYmflJYbY88fLmhBZY/5fcDZEEkEQe2smU=;
        b=OBd4arrcfIQcE7s0X1QYX5iolY6AJsONajkOSRL8ea4F0LFxuF45EnXiTMa1V19OvM
         i1LsOuUqN7ymuooyip1F58PM8WXAEFXecd9juDUSn/Qvl5MwPoMHCZFUVQ5iCLCep1qU
         BKAPGcCEcmw4lISx0CL67yzdrNpvifXioGgnqL7IGsqp0xM9PNqUsz6xMELPzi7+kycV
         gIFtScR/LQRSKBbeSaL7MUwI2AMosdjc+SbIfYjj+yezsncDCJtD1Cm1MyWiDmJKf+1B
         SltQRyWKTgfeoyVVJNfSpgeHzrSP8TiRiz6L0bMpjyggs5hMtHUaOjLkPe6Q1uB5gOsU
         CWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705593610; x=1706198410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Imm3giTj2XYmflJYbY88fLmhBZY/5fcDZEEkEQe2smU=;
        b=iMVd7YpfpfRLFDqDrIvpI+I4qU6+TfyfqkE0faOH/mT1l+ahgLKxkXIb7Pfg9wbNa6
         8Wp8peidf3IF62dotmYHMYM3qvCu0Nrhmp5jSSJx096NspHZzpxcj/+rTmylMvMjqM4P
         sCEMtloFM+W9KqwXNaEY+X16VZghkrvrStRgTpbr6U66nWarN5OamFikSttw5VyARm/8
         dZDb+edL8ndZgn1cbNtYDY+r63oZjT6ZPcW9FOe9lRtFh6wHRESDK0RAs2oiQrCffgYs
         7XyxF2SACXaUW78a0DVO2DZAmvuS2lEZ0G/ngDr7fhBMXHmtR6SKGuZ6caF8so6bs2vZ
         GMVQ==
X-Gm-Message-State: AOJu0YxETkX8R/YyYWmcFCAplFewGj/a5C6iex4OkocKx7HwRk9JicmR
	OH5vGu2vBl0vg4OenARZpv6jUUkbuSeinnXBgdO097NkW0473n4tkddCRP7I3g==
X-Google-Smtp-Source: AGHT+IH5tFTvnv+6oxGBHPNjtGoJKFZ31/qcz4LPMx1aNFXIlrq0cqODpCFiE5Y1yR3i5tphxqW7uw==
X-Received: by 2002:a17:906:906:b0:a2e:e5b:d3fc with SMTP id i6-20020a170906090600b00a2e0e5bd3fcmr2986293ejd.19.1705593610477;
        Thu, 18 Jan 2024 08:00:10 -0800 (PST)
Message-ID: <7ca08488-acc5-4846-86dd-b81b6e4fe3fc@suse.com>
Date: Thu, 18 Jan 2024 17:00:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/8] common: assembly entry point type/size annotations
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
 <38de36da-0822-4452-9594-8d50a5a77335@suse.com> <Zak7Rmbj_izBvcC4@macbook>
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
In-Reply-To: <Zak7Rmbj_izBvcC4@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.01.2024 15:52, Roger Pau Monné wrote:
> On Mon, Jan 15, 2024 at 03:34:05PM +0100, Jan Beulich wrote:
>> Recent gas versions generate minimalistic Dwarf debug info for items
>> annotated as functions and having their sizes specified [1]. Furthermore
>> generating live patches wants items properly annotated. "Borrow" Arm's
>> END() and (remotely) derive other annotation infrastructure from
>> Linux'es, for all architectures to use.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> [1] https://sourceware.org/git?p=binutils-gdb.git;a=commitdiff;h=591cc9fbbfd6d51131c0f1d4a92e7893edcc7a28
>> ---
>> v5: Drop CODE_ALIGN fallback. s/algn/align/g.
>> v3: New, generalized from earlier x86-only version. LAST() (now
>>     LASTARG()) moved to macros.h.
>> ---
>> TBD: {CODE,DATA}_ALIGN are byte granular, such that a value of 0 can be
>>      specified (in case this has some special meaning on an arch;
>>      conceivably it could mean to use some kind of arch default). We may
>>      not strictly need that, and hence we could also make these power-
>>      of-2 values (using .p2align).
>>
>> Note that we can't use ALIGN() (in place of SYM_ALIGN()) as long as we
>> still have ALIGN.
>>
>> Note further that FUNC()'s etc "align" parameter is intended to allow
>> for only no or a single argument. If we wanted to also make the fill
>> value customizable per call site, the constructs would need re-doing to
>> some degree.
>>
>> --- /dev/null
>> +++ b/xen/include/xen/linkage.h
>> @@ -0,0 +1,54 @@
>> +#ifndef __LINKAGE_H__
>> +#define __LINKAGE_H__
>> +
>> +#ifdef __ASSEMBLY__
>> +
>> +#include <xen/macros.h>
>> +
>> +/* CODE_ALIGN needs to be specified by every architecture. */
>> +#ifndef CODE_FILL
>> +# define CODE_FILL ~0
>> +#endif
>> +
>> +#ifndef DATA_ALIGN
>> +# define DATA_ALIGN 0
>> +#endif
>> +#ifndef DATA_FILL
>> +# define DATA_FILL ~0
>> +#endif
>> +
>> +#define SYM_ALIGN(align...) .balign align
>> +
>> +#define SYM_L_GLOBAL(name) .globl name
>> +#define SYM_L_WEAK(name)   .weak name
>> +#define SYM_L_LOCAL(name)  /* nothing */
>> +
>> +#define SYM_T_FUNC         STT_FUNC
>> +#define SYM_T_DATA         STT_OBJECT
>> +#define SYM_T_NONE         STT_NOTYPE
>> +
>> +#define SYM(name, typ, linkage, align...)         \
>> +        .type name, SYM_T_ ## typ;                \
>> +        SYM_L_ ## linkage(name);                  \
>> +        SYM_ALIGN(align);                         \
>> +        name:
>> +
>> +#define END(name) .size name, . - name
>> +
>> +#define FUNC(name, align...) \
>> +        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
>> +#define LABEL(name, align...) \
>> +        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
>> +#define DATA(name, align...) \
>> +        SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
>> +
>> +#define FUNC_LOCAL(name, align...) \
>> +        SYM(name, FUNC, LOCAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
>> +#define LABEL_LOCAL(name, align...) \
>> +        SYM(name, NONE, LOCAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
> 
> One thing that I've noticed while reviewing further patches, the usage
> of CODE_ALIGN and CODE_FILL in LABEL_LOCAL() means that CODE_FILL must
> always be a nop, or else the assembler will put garbage while padding
> the symbol, and hence the preceding code will no longer fallthrough
> into the label?

Well, except when an arch has no such cases, it'll need to override
CODE_FILL. Hence why for now Arm and PPC architectures get away without
such an override. It may well be that at least Arm will need to gain
one as soon as the first case of falling through is converted to this
new model. See also the RISC-V change, where it becomes permissible for
CODE_FILL to expand to nothing (thus using assembler built-in defaults).

> Looking further, LABEL_LOCAL() is always used when there's no
> fallthrough, but it's IMO not obvious from the description here.

Not sure what adjustment to the description you are thinking of. What's
used where isn't dictated by this patch / framework.

Jan

