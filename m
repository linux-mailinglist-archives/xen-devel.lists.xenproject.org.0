Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C49BE584
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830732.1245804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eCx-0002Hy-AM; Wed, 06 Nov 2024 11:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830732.1245804; Wed, 06 Nov 2024 11:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8eCx-0002FC-7E; Wed, 06 Nov 2024 11:28:19 +0000
Received: by outflank-mailman (input) for mailman id 830732;
 Wed, 06 Nov 2024 11:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8eCw-0002F3-3W
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:28:18 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36c2b20d-9c32-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:28:15 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d6ff1cbe1so4806761f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:28:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7e1bsm19018529f8f.1.2024.11.06.03.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 03:28:14 -0800 (PST)
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
X-Inumbo-ID: 36c2b20d-9c32-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmIiLCJoZWxvIjoibWFpbC13cjEteDQyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM2YzJiMjBkLTljMzItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODkyNDk1LjQ3Njg2NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730892495; x=1731497295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EIMQF3dEGES7l2eWIPggWazUIxRdB765Mm+97U4o2DY=;
        b=BjFHNYbaXaO2QtnvzRq6cZcbkTlK5SmGqPccaey71imMb6oL+2puzZkuS/Zh1yJh+Z
         //IzKsqYxJAK7MLcP1CiDXbxwrJWWx76AnnwL2NtAbZbRtSM9oCku39wiHPjRHSuEazz
         HH73oMsLa0eyw0NDGfFHf5Ln2AsyZH+beueqTQxObKoXkOiKEsdJnyW4NfISp1/uHCoe
         S1vHRVK1a0QWZh7CDgxHrEeoeIB9RXXfBmbu/rFrpLfy3LCZrtMku4mRKNcym30ujOHx
         dn9DJsYCJyDNPHgkIjc524NmF3QfzFh1io631MXRLmHljl3jVzOPVk+2tIdrDsJlvlCQ
         nHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730892495; x=1731497295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIMQF3dEGES7l2eWIPggWazUIxRdB765Mm+97U4o2DY=;
        b=Z8iUar/k9Fk7uDiHpw0hEDUW4LBXVNQigwVse7pqg2OwEzcNYP3UN5OzIRyVanLqmd
         XIvA02Gdj+JaQ1BxCO1Zb7sx0+wpYl2cpJ6HOviV11qM0EDkvAoukmfHALV0r1svTZQB
         n7M95LaG6NCJ1RSCwRsXdzAXm1CVVG28hwIN0hXUujX7l2MEzWX284UPsF75MrT1H0sW
         mlpxHXaawBaCUyYKe8wK3NIEotFTbkoOT2ErnD3yLsW9J038yWGb85hY8CUEknn0yux1
         KlqSBBSKX7J3X7cNNZNe9B1xB8x5dYpeeMF30ABNDwygamIkVrqHUr7Rvm7QEO3KTBYa
         rxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhAA7Qja9u4OFzC66SQokdEquzRTjWtVgynFH3853xJi5MAAHJonPtfmGPDWBuWrri9gFXnQPYFQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzi6HtvZyxho6QjThMb0fqQlAFy/IpGEI86Hhe5QmZIQCmfZgK5
	rvR2jQXujEqmh0rqidyqyNZZCFj/yA/5kBm8hzgUYJjDMSM7Pt07HEurdN5Jbg==
X-Google-Smtp-Source: AGHT+IEloJKowAVLVFihK2/OBvZWfMKStIBFcMrWptW328FtRRaGkxYFq8jvJdgvdZ6/fxB270FsNw==
X-Received: by 2002:a5d:6c65:0:b0:37c:cbd4:ec9 with SMTP id ffacd0b85a97d-381be7add43mr16829657f8f.5.1730892494834;
        Wed, 06 Nov 2024 03:28:14 -0800 (PST)
Message-ID: <ef7e8597-d0ea-4804-95dd-3fd3d6faacd3@suse.com>
Date: Wed, 6 Nov 2024 12:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/3] x86/emul: use pseudo keyword fallthrough
To: Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1730880832.git.federico.serafini@bugseng.com>
 <9be1812e391ce893afa028c05614b74cddb197b7.1730880832.git.federico.serafini@bugseng.com>
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
In-Reply-To: <9be1812e391ce893afa028c05614b74cddb197b7.1730880832.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2024 10:04, Federico Serafini wrote:
> Make explicit the fallthrough intetion by adding the pseudo keyword
> where missing and refactor comments not following the agreed syntax.
> 
> This satisfies the requirements to deviate violations of
> MISRA C:2012 Rule 16.3 "An unconditional break statement shall
> terminate every switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

We can certainly take this as is, as a tiny first step. Personally I'm
not overly happy though to see a mix of comment- and pseudo-keyword-
style annotations in individual files. After all going forward we'll
want to use the latter, now that this becomes possible. Yet for that I
view it a more than just helpful if bad precedents didn't exist
anymore. Being the one to touch the emulator files most, I can say
that here more than perhaps anywhere else new code is very often added
by copy-and-paste-then-edit.

Therefore question in particular to the other x86 maintainers: Won't
we be better off if we fully convert to pseudo-keyword-style right
away?

Jan

> --- a/xen/arch/x86/x86_emulate/decode.c
> +++ b/xen/arch/x86/x86_emulate/decode.c
> @@ -1356,7 +1356,8 @@ int x86emul_decode(struct x86_emulate_state *s,
>                          --disp8scale;
>                      break;
>                  }
> -                /* vcvt{,t}s{s,d}2usi need special casing: fall through */
> +                /* vcvt{,t}s{s,d}2usi need special casing. */
> +                fallthrough;
>              case 0x2c: /* vcvtts{s,d}2si need special casing */
>              case 0x2d: /* vcvts{s,d}2si need special casing */
>                  if ( evex_encoded() )
> @@ -1530,7 +1531,8 @@ int x86emul_decode(struct x86_emulate_state *s,
>                          disp8scale -= 1 + (s->evex.pfx == vex_66);
>                      break;
>                  }
> -                /* vcvt{,t}sh2usi needs special casing: fall through */
> +                /* vcvt{,t}sh2usi needs special casing. */
> +                fallthrough;
>              case 0x2c: case 0x2d: /* vcvt{,t}sh2si need special casing */
>                  disp8scale = 1;
>                  break;
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -1460,6 +1460,7 @@ x86_emulate(
>  
>          d = (d & ~DstMask) | DstMem;
>          /* Becomes a normal DstMem operation from here on. */
> +        fallthrough;
>      case DstMem:
>          generate_exception_if(ea.type == OP_MEM && evex.z, X86_EXC_UD);
>          if ( state->simd_size != simd_none )
> @@ -1942,6 +1943,7 @@ x86_emulate(
>              break;
>          }
>          generate_exception_if((modrm_reg & 7) != 0, X86_EXC_UD);
> +        fallthrough;
>      case 0x88 ... 0x8b: /* mov */
>      case 0xa0 ... 0xa1: /* mov mem.offs,{%al,%ax,%eax,%rax} */
>      case 0xa2 ... 0xa3: /* mov {%al,%ax,%eax,%rax},mem.offs */


