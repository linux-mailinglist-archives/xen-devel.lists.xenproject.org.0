Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D6B899E7F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 15:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701305.1095670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjl8-0007mK-F0; Fri, 05 Apr 2024 13:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701305.1095670; Fri, 05 Apr 2024 13:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjl8-0007ju-CH; Fri, 05 Apr 2024 13:37:34 +0000
Received: by outflank-mailman (input) for mailman id 701305;
 Fri, 05 Apr 2024 13:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsjl7-0007jl-0d
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 13:37:33 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6c4a2a7-f351-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 15:37:31 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-343f62a762fso172246f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 06:37:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bh13-20020a05600c3d0d00b0041630855440sm1817338wmb.43.2024.04.05.06.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 06:37:30 -0700 (PDT)
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
X-Inumbo-ID: a6c4a2a7-f351-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712324251; x=1712929051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IBCdakSxk5WnmZHxPxazg+SgJEJ9gnup/qaDRhBbLcs=;
        b=UhJeLuiORsAAiOahg2neIQh8bmk/wteARNON4s5F4xjrUq8o46BLf1UsyKhnxYzmxw
         HkwWuIM1O5yiw6O3TJz6Q6/qtPEdvWT47tpwSnneAo/Zn9RmX6s8V+Tq8EH2AA8HojLF
         S4olqGMPrBOsmb+sz/HgtyyPOvILnbGaL0A0RQF8kP6yihEXGbP1bKpFkGh02pvJTguR
         jlhni/KsWzeehixA1HYeKVlbULCEEHjenNUJbbqgXT0z1mFsSFXJHk230CIF06a/05l1
         wUK7mD73hUXW2nBHB5gCkoJSoxGNoUd4mtWsEa40uPdmFBuVIXaFjrRY76AHo7lhkfeI
         DQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712324251; x=1712929051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBCdakSxk5WnmZHxPxazg+SgJEJ9gnup/qaDRhBbLcs=;
        b=d6KkHWU18+WOqbc3aMGmqEi6/d6ChbmPTZ32p7YvbkSkY9J5dFRLl774ZTxwS7YEDb
         x8K4njuknkpHtArfvwL3uLAXTS0wUpA4Z0JIBAp3CWHxxdVqq92UX9sv35XTpvIuZkV9
         6tsGchUkcvgmzIBMjBqvfo90UpEpkPLSOR1lkmLzweJt3ZF4gbpYhU/902Jb0H8Xn7yR
         DchiXUu2iN1ubyrE3J0R0xz1U2ExjKOpOQfbNNlSlNEt1lvyAa+60K6237VzgZ7VYaeN
         tDKmidMrS9nddA0Eo8CudFVlMTfEX4SKfo7koCUxVMf7uzmTxvYxuELU7mJDJ+pCVurg
         5INw==
X-Forwarded-Encrypted: i=1; AJvYcCWWGG21dsEAXIoRfmDAq4s4d7gvJoRo/U/r7AQZP4F+nHotbpLYQQoP3ij56Lp57R+o1LSpNIJKsN4hjMk83gENQM7BbTdIKU/ZX6+SvWU=
X-Gm-Message-State: AOJu0Yw8XdZpdqbdEc/BGloSSo6ZjAW7wkqc8nnIc2xWR4/DPW93PAQd
	z3lkQyr2C+WxRu0Cx+7isCxvLGlJJYLcRgRpUXPcagaGgZ6UU9u0/rTQWwwycQ==
X-Google-Smtp-Source: AGHT+IGQ5JihFD/f4ETCl/8Nj3Mgvpn9JhvhLGO9NWT/DBkq0nsrDubeGb58yHdA8H9rJ+shHPhT4g==
X-Received: by 2002:a5d:4092:0:b0:343:cbf0:b7f3 with SMTP id o18-20020a5d4092000000b00343cbf0b7f3mr1104384wrp.48.1712324250719;
        Fri, 05 Apr 2024 06:37:30 -0700 (PDT)
Message-ID: <0aefb452-610e-458b-824e-3d6126000815@suse.com>
Date: Fri, 5 Apr 2024 15:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/compiler: address violation of MISRA C Rule 20.9
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <d7c9e5cdabbcc3262f0e23fbf914cd6bb7e47990.1712321857.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d7c9e5cdabbcc3262f0e23fbf914cd6bb7e47990.1712321857.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 14:59, Nicola Vetrini wrote:
> The rule states:
> "All identifiers used in the controlling expression of #if or #elif
> preprocessing directives shall be #define'd before evaluation".
> In this case, using defined(identifier) is a MISRA-compliant
> way to achieve the same effect.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



