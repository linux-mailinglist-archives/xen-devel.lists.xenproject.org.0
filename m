Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6AA64E63
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916670.1321721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9O9-0000pC-QH; Mon, 17 Mar 2025 12:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916670.1321721; Mon, 17 Mar 2025 12:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9O9-0000mn-Mj; Mon, 17 Mar 2025 12:16:13 +0000
Received: by outflank-mailman (input) for mailman id 916670;
 Mon, 17 Mar 2025 12:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu9O8-0000mc-9G
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:16:12 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c8b7192-0329-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 13:16:10 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso20263035e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:16:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2010e0bfsm102256145e9.36.2025.03.17.05.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 05:16:09 -0700 (PDT)
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
X-Inumbo-ID: 9c8b7192-0329-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742213770; x=1742818570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FlLIlBvWAdx5vS5mvjL2/43jQPhKhQrFXVQWoVPlX/8=;
        b=KmdZrs0yJrpp08J66IxgxmHmctZkGXFSWLd66/glRnkNHDMYsnxcU5t0pl0y/PIWz4
         EztF8xaP0BAnBbvLzwNNXBdtn/8NFju/PIZoHOTbw9g6l3zXmFMnezUdA3rJsXE5wvtx
         uslc+v9z3g7ZfhUOjPWj+zozi62wrZCrPsP1+wSkhhHWsqGfrYnZrQAeorDraLeqQtCZ
         utlP3ZWDL/ASDRyluoYwL2Y7TRXCAZycOJYa2VlGGB1GTBckY7qW90+6XInyYe7K8/XJ
         28SvwcAeSc/NUmLcJzRBL7b5I4BUSzSvAHiPWGGUtRVtq2VTh2vB6WSnuVuDhWfoZfre
         84lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213770; x=1742818570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlLIlBvWAdx5vS5mvjL2/43jQPhKhQrFXVQWoVPlX/8=;
        b=TCGpBTMB9tryau09Fq9SiJaYR35FP3qW2byerIaieRfStZkK9pLE/TA3R2yZw6NIe8
         mhYULtAEqOFJcNJWSeeccwYEEEZXxvUTKNKXP5ONNwiZtY1huJ1sgHyqG7QuJStoA7N6
         wvbQGqrdLnTgZlyQUW6Vf2oaDLDACRkNn0G+Bd517j03Hj+mGpKiL+u/rs0XO2iO2stg
         6Lp8tY2rBy8SP+IcUjn33qrTH/MjbfhWR5Z3PgJozct5zBDFQk6V0uHqc1Op0jqcavbu
         TPw0u5YJOxj03FNjl/ugI+FQgXFr3epKgAQbmFedP+/eaXYNSJTt9H3NhhDP8xk166MZ
         dvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVckjQ62kVvlYxwGYVXVw4NBhnrVMU0txjb3gNZ8v3yLubFL12sLaf3WY2srHzy5ZgS0qMZT7PkCv4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6Fg7+JX+4TwFi7hIZN3ZZfB50m9v46/JosP9EnIB/ipsVVNLB
	yWoXNNMg7klK+lCCopO+Il1+T6xavB+eeV82Q6RsRrP2kSh4k9P2J+2EDc9ccA==
X-Gm-Gg: ASbGncsVplp4xHBTi81QfoTE2jNs/OGEbq4H9xDw8psRrpHzG3NC8KFTIAjvQVB/U52
	uf2x9VDrC3kSvH/GX+IX43U97fZB3Ns/Ov5UAS7P4F8SkB58W68Ey8XF9Iu2zjuoDPFTOXslk80
	eBsF3eTUP0uJFGzY4jyjPUuMM3pNnHVdYVQSpImU1gcTo5RzmtwTNow+3fca1fq5WqXci8ZBT6d
	Tvl0cOMN6JA6VxbEEmK2Yryz+H0C0adcbAfUVzt+8/U3KuzsifqKc5nAb2Y9sC6nAIDG/2YO5FA
	iukY+2FfGk8hFMR+HLtZsKGoRAzh1ydbGT6JUbTOw4gjCX/DvEIMZEHjBg5ykmL6v/me5gpA5xh
	4UZenDR0mCX6GuaU/fqJj+lR30e535A==
X-Google-Smtp-Source: AGHT+IFmeUJnDfiEIfCxtFN4sPn0sgOlmnQ9WdRtjut325l8qsRw9cucDNda5H7u11GetsfIaj8TGQ==
X-Received: by 2002:a05:600c:548e:b0:43c:eacc:9d8c with SMTP id 5b1f17b1804b1-43d1eccf5b2mr125210245e9.24.1742213769955;
        Mon, 17 Mar 2025 05:16:09 -0700 (PDT)
Message-ID: <a046ae35-8663-4357-aaef-34a97f1b1584@suse.com>
Date: Mon, 17 Mar 2025 13:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] x86: Drop the vm86 segments selectors from struct
 cpu_user_regs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-9-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> The data segment registers are part of the on-stack IRET frame when
> interrupting Virtual 8086 mode, but this ceased being relevant for Xen in
> commit 5d1181a5ea5e ("xen: Remove x86_32 build target.") in 2012.
> 
> With all other cleanup in place, delete the fields so we can introduce FRED
> support which uses this space for different data.
> 
> Everywhere which used the es field as an offset in cpu_user_regs needs
> adjusting.  However, they'll change again for FRED, so no cleanup is performed
> at this juncture.
> 
> This also undoes the OoB Read workaround in show_registers(), which can now
> switch back to being simple structure copy.
> 
> No functional change, but a lot of rearranging of stack and struct layout
> under the hood.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



