Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4205A50182
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902331.1310283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppT3-0002Rs-NO; Wed, 05 Mar 2025 14:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902331.1310283; Wed, 05 Mar 2025 14:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppT3-0002PA-KU; Wed, 05 Mar 2025 14:11:25 +0000
Received: by outflank-mailman (input) for mailman id 902331;
 Wed, 05 Mar 2025 14:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tppT1-0002P4-Qy
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:11:23 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7bb99b5-f9cb-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 15:11:22 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-390df942558so5366279f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:11:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485dbe7sm21331271f8f.93.2025.03.05.06.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 06:11:22 -0800 (PST)
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
X-Inumbo-ID: b7bb99b5-f9cb-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741183882; x=1741788682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X+GHhVYXWkqjoztyhTg6GsM5/V7oTkbym5+cLxWI3bo=;
        b=YNgkeUrbDdveUc7rDXSSc+7SHd7g/UvasdKk7iPd0E1DcIf0AqIXgDDfFFRqVeatZS
         AxNhn4N8TkpHacuQ/YETZ8JsoBSoMnSnFLpg93tiQizqREIhKg9oPkg5NxeenKm1loIp
         kPj6U8euxZ8iVKGiLvBGtLXrMGBLabx41v82+EK5Cu6MlN5MTeRf6/PJjpnVUcrD3iuT
         ovgF8UQFCqyZXm3Ra3TNDCyzDh6Jp1g+lkZN6WlyRkNA+jGgOCoQ2WZWbNqh/EBR4cOU
         5sS4stGFSX6G+NJNEQNMIooxg2eoRlNv7Y+HAj7S7j8iTPtq5kckxqeOttlvS0h10rN0
         tAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741183882; x=1741788682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+GHhVYXWkqjoztyhTg6GsM5/V7oTkbym5+cLxWI3bo=;
        b=v5nY3hdNwhgUyg6Hi8VoPbXhxhSxXzwKfYYbZAyaV6bKcxYPzd2dtP6PsStqW2hg8m
         eGjF2kM3A3eMugtBq2VZ/WstU3FGveWnrY9nVu1QlaL9I3N8RNi9NywV556XX0wCRiKq
         Ma+hJMU83OMV+A/BBZYneMhs5B+h1nhODSilAHXNlMxz0orj2ZZ6tJI+sbr/wHs4da/u
         u6GY1CGPlLDjjZKmv5OhDA+otRiuC1fKGhrcjTLqueMHl3X3TUC7JG3NmnO2kL2ylMte
         Oa6jy5+86MxQR5gfMiE64VmvK56WWrcgeHIIbfmgojLWHDwP7hRxfw0CaqjZknShV2U+
         XAsw==
X-Forwarded-Encrypted: i=1; AJvYcCWDqh+vaFz85iMesKwAtiChLIxypkG7aAo+7elc9JhgzLX0lja1Zo/lQ/R2EN6W5H97b6cvOr5h7SA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRoeGYXxCIOgRw/fekYzxhcE3Xfw9MTBNsqup3s/kNTV1cABEA
	4qkXd4FH/xrX33YkVlmyvF+NuU76PKgPUTVWZzACUBrqDJaiOf2vPcRVtRMWOcHodGLXjwXkjrw
	=
X-Gm-Gg: ASbGnctvy4KuOP7Axxh7gbBlpfyompqf5Idfm6zxtjhxVmrTOXAltlbUcErU5jLw/go
	6XVnbqtTd91JY5iQBqD1+6s1N57roo6s0FvfZXYQV58yy9Pc8ywdcKYwZWlID4B3QsrVwsbX1at
	fY8CbHw2mVf++ofSHTCk5uCZMY6RK/K7P5qi+vc1pDgE/h8v+ZpQmknvAn1hi/GaUSjLBQDgGEe
	BT2W1dkJhekGfxk3su1QLgq35kBNf/5ncJy9JmV9IH4eeG78ZSdPXElezhO3g7CaTDu1MZYbJyr
	LvQoyAgKKMsnN0zQF14cIc8FzGve4LSiFeZPsYgOeW3mWYmqpTYj6KFfP0G3pgn7SeQxVCjyfa3
	qLRIJza03numlS5Z5egkPFwsI1hDYaw==
X-Google-Smtp-Source: AGHT+IGef4UZ2pv90srPzONkhu3ENvHwy49ffW/zUFMzy7vrrkNhY7yN/JuCwUc4Vm0zCHv+I9gf5g==
X-Received: by 2002:a05:6000:184f:b0:390:fb04:f930 with SMTP id ffacd0b85a97d-3911f7a84d1mr2623421f8f.34.1741183882400;
        Wed, 05 Mar 2025 06:11:22 -0800 (PST)
Message-ID: <60c797d7-6212-45e9-be34-b755a905fdf1@suse.com>
Date: Wed, 5 Mar 2025 15:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] x86/IDT: Generate the IDT at build time
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 01:02, Andrew Cooper wrote:
> This is a chunk of the FRED work split out because it's pretty self contained.
> 
> It's mostly cleanup/refactoring, although patch
> 
> traps.c is already overly large and going to get larger with FRED, so I'm
> splitting traps-setup.c out of it, as the two have reasonably-different logic.
> That's implemented in this series but not used in anger in this series.
> 
> Since v1:
>  * First 3 patches committed
>  * Minor adjustments.  See individual patches for details
> 
> Andrew Cooper (5):
>   x86/IDT: Rename idt_table[] to bsp_idt[]
>   x86/IDT: Make idt_tables[] be per_cpu(idt)
>   x86/IDT: Generate bsp_idt[] at build time
>   x86/IDT: Don't rewrite bsp_idt[] at boot time
>   x86/traps: Convert pv_trap_init() to being an initcall

For the two not having R-b already:
Acked-by: Jan Beulich <jbeulich@suse.com>
perhaps with patch 2's description slightly adjusted (see separate mail).

Jan


