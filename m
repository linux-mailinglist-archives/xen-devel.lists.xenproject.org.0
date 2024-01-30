Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F8884202B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 10:55:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673263.1047565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkpR-0005oL-Uj; Tue, 30 Jan 2024 09:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673263.1047565; Tue, 30 Jan 2024 09:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUkpR-0005mm-Ri; Tue, 30 Jan 2024 09:54:53 +0000
Received: by outflank-mailman (input) for mailman id 673263;
 Tue, 30 Jan 2024 09:54:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFHt=JI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rUkpQ-0005mg-9v
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 09:54:52 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c31b0ff-bf55-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 10:54:51 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a30e445602cso985473366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 01:54:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v10-20020a92ab0a000000b00361b5daf4a7sm2735970ilh.49.2024.01.30.01.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 01:54:49 -0800 (PST)
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
X-Inumbo-ID: 9c31b0ff-bf55-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706608490; x=1707213290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mXFE+qEytay4U0JCy4X1C0AONMYBSMXblZWeobt3Nh4=;
        b=RNLyIkp5klE9s/AwRveZEqrUK2v4CJ3/xZtnBspdbyYomuEVs5wpn7PrS9uB8Pw/FU
         5DxqScQDVvaTtLhD4CTYPObh3G15Jj5U2r6B/1TqJFhpkHeTeR7b3BqmBlT55D0zRqGf
         4LTXkGjeu/YftQGQPKFV0WAUk5z5AiK+kvHSxRcWMx9ckBjyipJXFOVA04AM0hnrTQHq
         yEF6k+LfaWKat/lh67nnoUB8rOO+QRXyJxc8L5Bru4NNoSjlSVbo+sYN6dZJinG3bPtv
         RileZZm3m0vF65Uj+H+WQpm3XG5tNEFVHy2kf1otTno9M2iAytHs07rzodQqLqa0McYz
         wwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608490; x=1707213290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXFE+qEytay4U0JCy4X1C0AONMYBSMXblZWeobt3Nh4=;
        b=nR75twzoljZO7Xk2WDld4Czwlu36Cr8fxH1zo8IustAHbjZvBwZDU+feMFfiDpjIXc
         ysmc4Ig7Uhy+5+4E3srI7muQB3K4jHPgwvoHFpBVS/lYGW8iiDNPcOG8UvlJBmm1Ru0R
         st12Ph6ea+ugq9JI7fjaRGtzg+2Vu9IyozrHqVZ/Q7cQtOrnBaT2E4vEzHkRCxeylInc
         TDECDpvznbZz96ctcIaJtd4dDixrWixmBCvs7pOL+uCNoZ/Prx4LAurYqqn+tlH4VWw/
         oUDRPxLYiUtjo/fBPqsuwKdeKgHSXfsB02C7ETHhRFZpXaMGF03sABQ0neYGnYLWGXxI
         sSYA==
X-Gm-Message-State: AOJu0Yy2W3yBSopPe/SZW1J92V8ARVYEUsRkyd/CKyWcoo7xgsO+WCLN
	KvLbvk7EKLTBaYcgxLZLhwDZ/OA+r76hG0Pl75IVO4Yl1ta4bHDfrrUq33ANaw==
X-Google-Smtp-Source: AGHT+IGWG5NuAHSyLdHXpx7Z0QkUqH4kExTIaW/szOx3lUJMnDYkWy+VTs28JqBratz5NiHOA/N5fQ==
X-Received: by 2002:a17:906:ba84:b0:a35:a12f:e363 with SMTP id cu4-20020a170906ba8400b00a35a12fe363mr1337293ejd.10.1706608490454;
        Tue, 30 Jan 2024 01:54:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV2DqJqdkUvdF9jDY7tYggfNJGdZfLQeS0JZvdBS8bzNqj/tbLXS813NgGBKwmU6L6HpvDZEZa2jGJDPnkUrs+SaDz/+vPTC4FPWFTGy5JCNCwig31zZ0u8B2YdX7VFuA6urDeTmxP9g6CRiwlbB3PwS8iYgUON
Message-ID: <3f4df25b-9450-4c78-8ff5-08d6dffe2918@suse.com>
Date: Tue, 30 Jan 2024 10:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: Remove debugger.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240126205418.3587177-1-andrew.cooper3@citrix.com>
 <20240126205418.3587177-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240126205418.3587177-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.01.2024 21:54, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/bug.h
> +++ b/xen/arch/x86/include/asm/bug.h
> @@ -1,28 +1,8 @@
>  #ifndef __X86_BUG_H__
>  #define __X86_BUG_H__
>  
> -/*
> - * Please do not include in the header any header that might
> - * use BUG/ASSERT/etc maros asthey will be defined later after
> - * the return to <xen/bug.h> from the current header:
> - * 
> - * <xen/bug.h>:
> - *  ...
> - *   <asm/bug.h>:
> - *     ...
> - *     <any_header_which_uses_BUG/ASSERT/etc macros.h>
> - *     ...
> - *  ...
> - *  #define BUG() ...
> - *  ...
> - *  #define ASSERT() ...
> - *  ...
> - */
> -

Leaving aside the clumsiness of the initial text, other than in common/bug.c
I don't see why this comment is to go away (and, if at all, in this very
patch). With it retained or the removal suitably explained
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

>  #ifndef __ASSEMBLY__
>  
> -#define BUG_DEBUGGER_TRAP_FATAL(regs) debugger_trap_fatal(X86_EXC_GP,regs)
> -
>  #define BUG_INSTR       "ud2"
>  #define BUG_ASM_CONST   "c"
>  


