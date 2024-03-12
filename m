Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A78796FE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 15:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691896.1078443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3aV-0007ZY-4z; Tue, 12 Mar 2024 14:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691896.1078443; Tue, 12 Mar 2024 14:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3aV-0007Xz-2A; Tue, 12 Mar 2024 14:58:43 +0000
Received: by outflank-mailman (input) for mailman id 691896;
 Tue, 12 Mar 2024 14:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk3aU-0007Xt-GN
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 14:58:42 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 031b7454-e081-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 15:58:40 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so78151641fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 07:58:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fj10-20020a0564022b8a00b00565af2ea649sm3973699edb.14.2024.03.12.07.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 07:58:39 -0700 (PDT)
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
X-Inumbo-ID: 031b7454-e081-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710255520; x=1710860320; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HjKGRpfIuNggACzJB+28pH8IV0WC3Ki+EkzhoSBzjM=;
        b=fyfoL1HBwvjhu2lXHoBMm2+/eRpqhCqPTlFrri1it4LQHqNK6TnEcjBgROnUqtfd6S
         Z1qWCS0YxfHlWMvBng+oodXEoftbgphJcX+RJ3kZHwNEbZjq7q0qEVHFu1rSNE5fOx1y
         chbZtm45i1moAy0tiTwFDIT2BNa7fa2ldcOmRwK+0gqLXk1NJ2KNoRedVLJolKbM28Jt
         9yznQ/3xUOP08K9q6DbZUkLCvXDR3G8M+qIKwizZOhQEaQZP6+uJqwtm6xdtqkFYt/QJ
         C0msWAfqHLJnWR4RalL9fatOM/bylCutiC4z/UOQ9BhaVDyCTXechBNAatcT68R8hSBa
         4aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710255520; x=1710860320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3HjKGRpfIuNggACzJB+28pH8IV0WC3Ki+EkzhoSBzjM=;
        b=cKiEHN53o+avBoqwXLLQ/4TYLn/Kl0YMhRZKeGUD8xcX9OFTEAi+TqkL8BrRX1zFWj
         Og1spiioufK9jusFyluTK9V+28hwMhhuJAgFitUGOKgdS4QjbuMx8uCsSy6ZhfOBA8JG
         RO+Ge4nkRysbtNmn04QS0sTycWZnylPNwWsBytG386J3MXOZHPStFhEC/FzuOKWXUaEq
         3fCQctBQnTj21d7Bnfn376bv1jrpke+iehDBVz0dIMitKdptd6uze6/m+Q9xPeUKZVPr
         +ugJaLHCLTVg0IndKgCzC67cc6QQIlxjWl7+bOLzmTJkN/IX9IbsYnfj3bnKlQVrd2+V
         wrww==
X-Forwarded-Encrypted: i=1; AJvYcCXtQZEYR6m+4mLlHyu/m9p7L15ksNxkyx5P1zdr6RQUIYROQVAyXGt6YDtHqfRBuFsEuRImBgQQVOjylt0auS58dbbzVfFg/dBwmhfU050=
X-Gm-Message-State: AOJu0YwMRqHxdb4X90HxGOsmxWVShakRxI/ArozXPqIUEArRrSOjJSFL
	OR9Nq8WO0v2zrnwG/RCgi+pPXpbdlTXCkIMsB2pi8b9Fy0NFsHhcjQmVDBFw1g==
X-Google-Smtp-Source: AGHT+IFHG3yO7+3ZkrAhRPtrWb/engaW6sYGVj7uyqEP07T4dGw0t61HAUq21WAmse+vhjrTXCDDjg==
X-Received: by 2002:a05:651c:80d:b0:2d2:ccd2:3a9b with SMTP id r13-20020a05651c080d00b002d2ccd23a9bmr6036994ljb.28.1710255519791;
        Tue, 12 Mar 2024 07:58:39 -0700 (PDT)
Message-ID: <9c4bbb6f-60d6-43b8-aa82-35fa6f393e23@suse.com>
Date: Tue, 12 Mar 2024 15:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 13/16] xen: add deviations for MISRA C.2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <787aa5a65135796c825d366b43e00ba018c0065b.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <787aa5a65135796c825d366b43e00ba018c0065b.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Add safe deviation for *.c files, as estabilished in past discussion.
> Add SAF deviation for files that need an #include directive before guard.

While similar topics, the two are technically entirely different, and
hence would likely again better be split. In fact I think I might ack
the former as is, while ...

> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -7,6 +7,7 @@
>   * Copyright (c) 2004-2006, K A Fraser
>   */
>  
> +/* SAF-7-safe include before guard needed for correct code generation */
>  #include "../xen.h"
>  
>  #ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__

... I fear I lack details about the need for this, not even taking into
account my earlier remark regarding the insertion of such comments in
public headers. Why is the #include needed for our own purposes (we
can't easily (re)move it entirely, as external consumers may rely on
it)? The common case is for this header to be included from ../xen.h.
In that case, aiui, the #include above has no effect at all, due to the
guard in ../xen.h. Which leaves direct inclusions of the header here.
There I'd expect a change like the one here to be accompanied by
clarification of why those few cases can't be switched to including
public/xen.h instead. Because if that was possible, doing so would
allow us to get away here without any deviation.

Jan

