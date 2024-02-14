Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540D854AAC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680780.1058896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFXI-0000Bt-27; Wed, 14 Feb 2024 13:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680780.1058896; Wed, 14 Feb 2024 13:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFXH-0000A0-UI; Wed, 14 Feb 2024 13:42:51 +0000
Received: by outflank-mailman (input) for mailman id 680780;
 Wed, 14 Feb 2024 13:42:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raFXG-00009s-8w
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:42:50 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0cc0df4-cb3e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 14:42:48 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33ce2d1ab86so627057f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:42:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x4-20020a5d6504000000b0033cda80f54dsm4352308wru.83.2024.02.14.05.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:42:47 -0800 (PST)
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
X-Inumbo-ID: f0cc0df4-cb3e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707918168; x=1708522968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5g4/QT6by55SLstFmMALxYwyJ8bfsQFdcdXYiqLh8I=;
        b=aPvo/f2qaaAB8X6zGY7cL0IL0nN2MOLm0xez2yDOzCUHTdrp4hQJIIRBOZ7DlVlTU4
         oZ3tdTgBL3CTyULVViNUI/KKqrKubdOLxXlUtU1eNHRUrE5Xh+YSaMWMXTdykFanfTo7
         L7vFxRgph6PDGfclo+5STrCId0Vbzf0hfRsqG04euwskvvqK18LD3kBnJ3cHOjot23NQ
         b0xhK0NsHldefGD8q3YCIQVFxzlhtAz2Wlq2plMssyY23VnulHYHtdL84L6+YyzBX/Nt
         pD4GiXFAWZPrkvEMpU7cG6Ye6xsdI6PdijjHGoKsK1rMFY7dqDL6EX9X4xYUXp7pDYoh
         zmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707918168; x=1708522968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5g4/QT6by55SLstFmMALxYwyJ8bfsQFdcdXYiqLh8I=;
        b=Smhezx+vUREP5+yHUMhoV6sur27cmy6ZL7A+QUkI+1bZpw+pr6vHyko4h1Nv8+CSXo
         dvbTqFeT9d2WCanja01BGlZVoeUVnzvhAoq85Mbtob7E7IlGO0NJbzJLAqdr30X8AfHH
         Z0ovlDkk3TXPaFogwJMmIkMH4QtwLApeararPVY1rLbQ2JjO3G/ogTSNyD0KGwi2Dhwy
         a/KddK/rhqhm1IUhyKyio9G9WT0DDYzgqs6R9N89bbZmw3efLK6hZZ5Lmr8JMLwDNEeq
         /I+wecna3bLHgp8Pb5pgbajhqR1ltAGVwcopfZFxGCts/i0IJqg5KpCca6LfJDPSu0IV
         q0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK9jjarSdaZv+Whh3wwYlVOBwQzH9W4bs5W96M3Q0XNsdt982iDoe6QPwErN5jvi5b+aDIvY7flNmcrIfo8FGUJywpyszzHp4zLnzLkNM=
X-Gm-Message-State: AOJu0Yy6JNC/KxcxK6b6mKkNRDRLJw3IuD6C02MPRvszVLD4xpkvuA2A
	TgY203d2X8vsfqeWov5XF+JH2gM9P6VvtwA3TPtY7DpQGmRXW1SnJ+Ner5vNxg==
X-Google-Smtp-Source: AGHT+IFJNLmYlbCvCqgwmaXxTLYz2vinYknPHEKtZ5v+4/O7ksSn2YGbL7CH8iZI/AKeu91mpPsxCg==
X-Received: by 2002:a5d:60c7:0:b0:33a:edaf:13ec with SMTP id x7-20020a5d60c7000000b0033aedaf13ecmr1681734wrt.14.1707918167947;
        Wed, 14 Feb 2024 05:42:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwwxBeq/YFk/SLTfoX7WP/4MOc5gzA9qiWaUMNmPQZCMrr2+qrVNXEe+btaSLu1jPTWIDnsqKm7JtJcfgFCjqNVC/tqIQVMeoX0lzR92586/WWzSTT2l+7eqlAjHDp1FZhI3FEpyo86jkdLg0Z2aYSwIr8GQwLQbhDlqDwuoLdSOjWNf27/vl49ttb2g8efbH7M60ZSbiVO9iw2DY=
Message-ID: <ff45456b-87bf-4e6c-b2c9-6f3d5258d478@suse.com>
Date: Wed, 14 Feb 2024 14:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm: add the __must_check attribute to {gfn,mfn}_add()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-6-roger.pau@citrix.com>
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
In-Reply-To: <20240214103741.16189-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 11:37, Roger Pau Monne wrote:
> It's not obvious from the function itself whether the incremented value will be

s/the function itself/just the function name/ ?

> stored in the parameter, or returned to the caller.  That has leads to bugs in
> the past as callers assume the incremented value is stored in the parameter.

... callers may assume ... ?

> --- a/xen/include/xen/mm-frame.h
> +++ b/xen/include/xen/mm-frame.h
> @@ -23,7 +23,7 @@ TYPE_SAFE(unsigned long, mfn);
>  #undef mfn_x
>  #endif
>  
> -static inline mfn_t mfn_add(mfn_t mfn, unsigned long i)
> +static inline mfn_t __must_check mfn_add(mfn_t mfn, unsigned long i)
>  {
>      return _mfn(mfn_x(mfn) + i);
>  }
> @@ -62,7 +62,7 @@ TYPE_SAFE(unsigned long, gfn);
>  #undef gfn_x
>  #endif
>  
> -static inline gfn_t gfn_add(gfn_t gfn, unsigned long i)
> +static inline gfn_t __must_check gfn_add(gfn_t gfn, unsigned long i)
>  {
>      return _gfn(gfn_x(gfn) + i);
>  }

What about dfn_add() (in xen/iommu.h)?

Jan

