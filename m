Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD9886B5F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 12:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696782.1087976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rndCW-0003ki-0a; Fri, 22 Mar 2024 11:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696782.1087976; Fri, 22 Mar 2024 11:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rndCV-0003iQ-Tv; Fri, 22 Mar 2024 11:36:43 +0000
Received: by outflank-mailman (input) for mailman id 696782;
 Fri, 22 Mar 2024 11:36:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rndCU-0003iK-N2
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 11:36:42 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 730f9125-e840-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 12:36:40 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56bc8cfc19fso2101883a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 04:36:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d23-20020aa7c1d7000000b0056b8dcdaca5sm927938edp.73.2024.03.22.04.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 04:36:39 -0700 (PDT)
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
X-Inumbo-ID: 730f9125-e840-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711107400; x=1711712200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ddeNj19CFFs05J34nOmcAfdUFRG5CkBb26jcctDpU=;
        b=RbBXXd2CFPIzBr80WGncyM3eCGnU/I/qXW2MHPnfGf1lbB4M33Z5q/RDMW0ZMxmwTB
         V1srkuHNytv5nqUZV8nrUNh1rvbFIPKpAiwx4SZ8uyf5Yc5nR6YeUstRTcf4TrO+mtmJ
         z+7+siTd/UJo8LBv3l8kLFbRb6Ym08fGpN1QXr9LWUMeXZda0je6ar1heRk/TyevbqVS
         YrFlyNAvvLbqtCUK3TSVvzWezUx5t+DvsTJHX5i5rdq8Wd0twept9unR0q5GPkZqhrce
         Ckejo5oeHM+1TKk4H81kQih2jYD08v8Dv3efCJegphoOhHgX5Zmp2+4wEqoJ8gop3ih8
         eX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711107400; x=1711712200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ddeNj19CFFs05J34nOmcAfdUFRG5CkBb26jcctDpU=;
        b=ectX3mwgoAj9jpLVET70Wk0iaMXBRtl9l1voT/gV8DCkQKurarkWZjucFSURxU6Evh
         jWvvUL55Mx4wihwSTtSgSPsahCRHean/baoNPGeqN9fBrcezt9Txr7tbccwSFr2OPVWm
         rzw5UGGfAJNmy29NtFrEJmrd2DCU84QWh6tOB4bdfyiMGfUzJ67/JioxAuchd4BiuXef
         FvXaO9Ly1yvrSmRTsAUwyUnA0NKUfsaQlGE5QWDy0H+3sEcW/3x/MKMeGUTXmIYKPFqB
         ZUUgqrVhtd762ZJlw2A4uU9XhNdWIDNiMRM1WyTlXEzjQoHG26Ptw98Gtqi01HeZTcjh
         DjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+IkQmkXWVD3rMuZ+CgeHam2fT6o+Esa4letMIKLgMxK+BTz00weP3eGMZ2PajJ94wyzcNWtpXecyOlRn4wFhALanUrztlyxVtZcoZlqE=
X-Gm-Message-State: AOJu0Ywmp7aBfjrThH3IpMTHpMzVaj+oQrc7qabH69JbyD5Nm07gktQJ
	BrFlA8bgZuvmaPBPq7ZpKoIwKSTWJaibGaLmHdn1LMRc8DXwqPFKqNv6U7gSsA==
X-Google-Smtp-Source: AGHT+IGIqAn2hvS5D7oMpPvFqea4F7YDnzQBXuHmP+h6KKdQ/CnipSVvqewfvKg+BHSLJdS7TmQP2w==
X-Received: by 2002:a50:9998:0:b0:567:429f:7164 with SMTP id m24-20020a509998000000b00567429f7164mr1180181edb.32.1711107399721;
        Fri, 22 Mar 2024 04:36:39 -0700 (PDT)
Message-ID: <9b40aeeb-ca7a-47c0-acde-407631ae9db7@suse.com>
Date: Fri, 22 Mar 2024 12:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/20] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <dae9f595e5afd1e6a46149919e6689afe263e1ce.1710517542.git.oleksii.kurochko@gmail.com>
 <49dd40b6-4558-4e0c-b6ab-eee5b814dd8d@suse.com>
 <2a2779011db8ba6db04e8d2e4355479b50e48e01.camel@gmail.com>
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
In-Reply-To: <2a2779011db8ba6db04e8d2e4355479b50e48e01.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.03.2024 12:02, Oleksii wrote:
> On Thu, 2024-03-21 at 13:27 +0100, Jan Beulich wrote:
>> On 15.03.2024 19:06, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/io.h
>>> @@ -0,0 +1,167 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + *  The header taken form Linux 6.4.0-rc1 and is based on
>>> + *  arch/riscv/include/asm/mmio.h with the following changes:
>>> + *   - drop forcing of endianess for read*(), write*() functions
>>> as
>>> + *     no matter what CPU endianness, what endianness a particular
>>> device
>>> + *     (and hence its MMIO region(s)) is using is entirely
>>> independent.
>>> + *     Hence conversion, where necessary, needs to occur at a
>>> layer up.
>>> + *     Another one reason to drop endianess conversion is:
>>> + *    
>>> https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5749-3-hch@lst.de/
>>> + *     One of the answers of the author of the commit:
>>> + *       And we don't know if Linux will be around if that ever
>>> changes.
>>> + *       The point is:
>>> + *        a) the current RISC-V spec is LE only
>>> + *        b) the current linux port is LE only except for this
>>> little bit
>>> + *       There is no point in leaving just this bitrotting code
>>> around.  It
>>> + *       just confuses developers, (very very slightly) slows down
>>> compiles
>>> + *      and will bitrot.  It also won't be any significant help to
>>> a future
>>> + *       developer down the road doing a hypothetical BE RISC-V
>>> Linux port.
>>> + *   - drop unused argument of __io_ar() macros.
>>> + *   - drop "#define _raw_{read,write}{b,w,l,d,q}
>>> _raw_{read,write}{b,w,l,d,q}"
>>
>> In the commit message I'm not worried as much, but at least here the
>> odd mention
>> of d as suffixes would better be purged.
> Probably, I use incorrect words, but what I meant that it was dropped:
>    #define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}
> before declaration/definition of inline functions (
> __raw_{read,write}{b,w,l,d,q} ).

But where did you find a raw_readd() or raw_writed() (with no matter how
many leading underscores)?

Jan

