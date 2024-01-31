Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957AA843A84
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 10:13:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673844.1048329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6eG-00073a-3F; Wed, 31 Jan 2024 09:12:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673844.1048329; Wed, 31 Jan 2024 09:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6eG-00071B-0e; Wed, 31 Jan 2024 09:12:48 +0000
Received: by outflank-mailman (input) for mailman id 673844;
 Wed, 31 Jan 2024 09:12:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rV6eE-000713-Rl
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 09:12:46 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4fca485-c018-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 10:12:45 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e80046246so3522655e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 01:12:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b0040ebfbff33csm979376wmq.36.2024.01.31.01.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 01:12:44 -0800 (PST)
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
X-Inumbo-ID: e4fca485-c018-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706692364; x=1707297164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJ44NbYDDCT/+Y/+x5YTp0Iz0ab+1broxKOD1oGv1dA=;
        b=YBs2hhghGbXzsQcU92QKbRq0gd0eCjI8nqgq0/GzpSJ3xyFwPJYUEBkS+umXyykcjG
         KX6Rk5H159sJQAu0YtdG3XAZdmQCbQPwhgUOIm9gA1DByIUqYhe7cZbf/TlCTL6erDEK
         IarVDxKlRHwaHp2GoFGl8dzazvHC/+ARjbiACd1qvKyPlU5REqMUR114IyXd+uStaMd6
         k9Xoqg5xisS+KkTu5SYVnw14/8zXYD7ypqahePd8qhVj35aYH8ABgzVXog0mL/NBuViU
         Yb0SvHpJXFF/CXU3RHYYg66+Ztdnun7TzsbhUuHyG3SWYFZPuLCJT+rpQVc4Yjcs+/GD
         AwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692364; x=1707297164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ44NbYDDCT/+Y/+x5YTp0Iz0ab+1broxKOD1oGv1dA=;
        b=PuvG6gCwCV3MLVFmhFQhvqFTwumFFh/M11ncyHOF8dUl0r/RlDOTxOniHUmVjwoP0d
         m8koO4m+kEoZi0gvb65JlvikMctGatps1H0JlUHHmCQs1MADuWp6LN3tGhxK6DZkxtvt
         cmDg37f1IbJMY4IANYkGBwvf8QN3l459FYOtV51v3rIkJwEIQowaPUBzDTbrdIgU4Jtp
         zZnBz6kmOAAT5lQmISgp2pVcz/3yq+muOCnUNPra28C+FZvEXt/KVIyfRVyPk7RvJg7j
         kIuH8dzRTAt/lt0d/WKEm8fl55cs8W72G4gv+gpbJvv7WhG6/sJKDemJrSt2Cf9/ddt8
         /7Ig==
X-Gm-Message-State: AOJu0Yz08rdSVroKPCr6cIUC/CdtloJRk5HKfbLxgZ3BgZIh24YPg0RE
	t4GUG5MwoivZ8z9ZoXyXuSasacAK9Zwq+ynnYyWKGN1ARVBGZgPCouNq3YEHRA==
X-Google-Smtp-Source: AGHT+IHdSSgx9sgICJOjEIU043LZ2O2s4tBe1boEWLHMB/3sVHYw2OAurdPoQGigk5zsBYhsNidGZQ==
X-Received: by 2002:a05:600c:3516:b0:40f:25be:e811 with SMTP id h22-20020a05600c351600b0040f25bee811mr3562034wmq.8.1706692364520;
        Wed, 31 Jan 2024 01:12:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWqEfKzQPkAlY9lwifuGuPwEfOdIFcMRoQfYrT+kRoNwIJsWkeBL9C4UkfY/fQQ3S7b8/2TZUo4lDdXVdkXGmaHnmhr/T6hJFUvaY7Ss9aXbYUpmVsBTLVZOABcuVRMZVzgDRvW3jMmVdByMnKoXcGq
Message-ID: <07f5e482-deca-4c63-963e-f55029001778@suse.com>
Date: Wed, 31 Jan 2024 10:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Fix UBSAN failure in do_hvm_op() printk
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240130183713.24680-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240130183713.24680-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 19:37, Andrew Cooper wrote:
> Tamas reported this UBSAN failure from fuzzing:
> 
>   (XEN) ================================================================================
>   (XEN) UBSAN: Undefined behaviour in common/vsprintf.c:64:19
>   (XEN) negation of -9223372036854775808 cannot be represented in type 'long long int':
>   (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
>   ...
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d040307c1c>] R ubsan.c#ubsan_epilogue+0xa/0xd9
>   (XEN)    [<ffff82d04030805d>] F __ubsan_handle_negate_overflow+0x99/0xce
>   (XEN)    [<ffff82d04028868f>] F vsprintf.c#number+0x10a/0x93e
>   (XEN)    [<ffff82d04028ac74>] F vsnprintf+0x19e2/0x1c56
>   (XEN)    [<ffff82d04030a47a>] F console.c#vprintk_common+0x76/0x34d
>   (XEN)    [<ffff82d04030a79e>] F printk+0x4d/0x4f
>   (XEN)    [<ffff82d04040c42b>] F do_hvm_op+0x288e/0x28f5
>   (XEN)    [<ffff82d04040d385>] F hvm_hypercall+0xad2/0x149a
>   (XEN)    [<ffff82d0403cd072>] F vmx_vmexit_handler+0x1596/0x279c
>   (XEN)    [<ffff82d0403d909b>] F vmx_asm_vmexit_handler+0xdb/0x200
> 
> The problem is an unsigned -> signed converstion because of a bad
> formatter (%ld trying to format an unsigned long).
> 
> We could fix it by swapping to %lu, but this is a useless printk() even in
> debug builds, so just drop it completely.
> 
> Reported-by: Tamas K Lengyel <tamas@tklengyel.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



