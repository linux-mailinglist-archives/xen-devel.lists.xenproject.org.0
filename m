Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA1E87C052
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 16:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693329.1081263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkn5K-0003Gm-09; Thu, 14 Mar 2024 15:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693329.1081263; Thu, 14 Mar 2024 15:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkn5J-0003Es-Tj; Thu, 14 Mar 2024 15:33:33 +0000
Received: by outflank-mailman (input) for mailman id 693329;
 Thu, 14 Mar 2024 15:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkn5I-0003Ej-7S
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 15:33:32 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35951c5f-e218-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 16:33:30 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56647babfe6so1458715a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 08:33:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f23-20020a170906049700b00a4588098c5esm803943eja.132.2024.03.14.08.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 08:33:29 -0700 (PDT)
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
X-Inumbo-ID: 35951c5f-e218-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710430410; x=1711035210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QY+LJPNp7m6PeIjTFExpYUxA+SrCAjz9mhvCE9G7UGk=;
        b=Xvnz4n9PDjikuHFo6zmv92l0IDetndd6Gjk1oHts6F1YIZqywHvTXT0OlHWUS1i6pW
         rPN7afjwHoBORPU7qiHRdmdKQ+jrDUUjYrrrsIM/4QKAngoZZYTrpMMSCm1W71oAEzuN
         YSFVEQGVfcBn7hoI8KThzjvorz7tKUDbmv2RVRwCfnBvBw2wqo0WOhXTeT/PL5kui2Gi
         MxAM63498ga7HeGnJx42yBEeRxkQX0/AgKORrNyDzAN76wsnHk13iz5PKtGJM1jVkdE3
         ZSiHWX16zd2hyX9Zdi+RDVSpfK+NLiTmLk8dZsXqRKlM1Y5nmx4Pd0zUE/5lpImnmsUh
         VQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430410; x=1711035210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QY+LJPNp7m6PeIjTFExpYUxA+SrCAjz9mhvCE9G7UGk=;
        b=Bb4OdzAtv90jNQp0YwW2blvZAA61uptHpsY4KYl2v/70iVX2wpK6tfgpI1y2pEyW9m
         yEbo2lCUaGlgnnuU/Caq3NzMRFD6XRBPkbtF5xDkf6EmoTaLEXAzTilUFpWSqzdj2pm7
         zJpgY9DMqic/sfs147bWXYmx2Qlq3xl5daFahBXdIEq6uaR8TYHcYwMC2k5rcbPHUPYP
         61lYvCcLJX/5wGh2JCOf5RYFNt6QTYsF3d6RQEH7vtbdYpihHRANYTt1vUBBA0farz+Z
         X+nnTUDhPss0uEQEQVyoRIQ56IJ2dL06+l0hoR9A09I/UcUH44IMyGXcQMMvF6sksZQi
         nJFg==
X-Forwarded-Encrypted: i=1; AJvYcCUcd2xb2dd2Z7Rg1EdB6vBYB3+uSf+zG6MH/KQ49Uvc/i836bTTAhWuFN5xIPR9q/i2KG29zVgEKMxfvO8JGXsxHsrkreHH8lIQi+5RrYI=
X-Gm-Message-State: AOJu0YwdNEl6w1kCD6S8fMUbY1xTRaEVlK0lwFsus/lyiAo7wDVn11qL
	i4ok+3eGU+jWYGGYircjSmSW2OnA/VhjRAK3YUx53mqkdVjgOtgMGP4zoOOO8w==
X-Google-Smtp-Source: AGHT+IGj2cW4rbPrS21BAX30Hty+57JXFKO7Whn4B06BftR1b529siPQV812q3cQsy/3K5AOGqql1g==
X-Received: by 2002:a17:906:7fc8:b0:a46:2760:3c9b with SMTP id r8-20020a1709067fc800b00a4627603c9bmr1326410ejs.34.1710430409734;
        Thu, 14 Mar 2024 08:33:29 -0700 (PDT)
Message-ID: <e233c298-66aa-4653-9b83-18006abe63eb@suse.com>
Date: Thu, 14 Mar 2024 16:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RISCV] [PATCH 0/7] xen/bitops: Reduce the mess, starting with
 ffs()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <1805b028-e21f-448f-bf94-2156092e40a5@citrix.com>
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
In-Reply-To: <1805b028-e21f-448f-bf94-2156092e40a5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2024 15:45, Andrew Cooper wrote:
> On 13/03/2024 5:27 pm, Andrew Cooper wrote:
>> Start cleaning it up with ffs() and friends.  Across the board, this adds:
>>
>>  * Functioning bitops without arch-specific asm
> 
> It turns out that RISC-V doesn't have a CLZ instruction in the base
> ISA.  As a consequence, __builtin_ffs() emits a library call to ffs() on
> GCC, or a de Bruijn sequence on Clang.
> 
> The optional Zbb extension adds a CLZ instruction, after which
> __builtin_ffs() emits a very simple sequence.
> 
> This leaves us with several options.
> 
> 1) Put generic_ffs() back in, although if we do this then it's going to
> be out-of-line in lib/ where it can be mostly ignored.
> 
> 2) Require Zbb for Xen.
> 
> 3) Alternative it up with Zbb or generic_ffs().
> 
> 
> I've got half a mind to do 1) irrespective.  It's mostly just shuffling
> logic out of bitops.h into lib/.

Yes. Might also help with the bi-sectability issue you faced.

> I also think we should do option 2 for RISCV.  Given the instruction
> groups that H does mandate, it's unrealistic to expect that such a chip
> wouldn't support Zbb/etc.

I'm not so sure here.

> Also, getting full alternatives working is yet-more work that's not
> trivial at this point in RISCV's development.  I think it is entirely
> reasonable to avoid this work for now, and make it a problem for anyone
> who has an H-capable Zbb-incapable system.  (with a strong implication
> that this is work that probably never needs to be done.)

That's definitely for later.

Jan

