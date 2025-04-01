Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB88A77F9B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 17:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934632.1336282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdy2-0006eA-AR; Tue, 01 Apr 2025 15:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934632.1336282; Tue, 01 Apr 2025 15:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzdy2-0006cX-6X; Tue, 01 Apr 2025 15:55:58 +0000
Received: by outflank-mailman (input) for mailman id 934632;
 Tue, 01 Apr 2025 15:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzdy0-0006cP-UA
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 15:55:56 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbdb6ebb-0f11-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 17:55:55 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso37928455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 08:55:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000a09sm158690115e9.35.2025.04.01.08.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 08:55:55 -0700 (PDT)
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
X-Inumbo-ID: cbdb6ebb-0f11-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743522955; x=1744127755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FsFssmijb2yQK1HipmMBz6KwuCpmiCk6Ykqybi7sTTI=;
        b=XMzu3TA9v1KXtU6rNWVo7DZJDq87lMOc6B4xvOmrVjZXnIfRG84Vc+wY8V/bjcM6vT
         EcWfRAbfFZMbSF+h6gtd/7Jc30zj1OxCm3VJJsvOpboMsAqNGNKm3ZYId5QW43WmCLrE
         /g/3q5DgTqmYv0NDfINN9hJXdvtqNes9Oepkk9CLBK+k09DzwIRhreWWmtaFDaqMf1zW
         jZ0t7V1KMX2jIzgUA0LEpWye6fk5Jak3Hl4GTNe3B/kLkJ5KpC+jU4JYxgRILD/DrUZs
         JoHIBozhRH+yDwjamsWZd6qj9F74X+GLnhWlL7ttjJtrXbhkLmMRJScXc+GkUKRo8uDI
         Qk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522955; x=1744127755;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsFssmijb2yQK1HipmMBz6KwuCpmiCk6Ykqybi7sTTI=;
        b=GgLadu6QbkrIGSsyD3ITXA1kbAqkV6wZVDWcztmTOJ5RSanTRMk2P5zyfAfb1wxxyZ
         G8rKgjD0rbYKqpCTrheAuDHSabfufnwuWmS6Vh7Kly6kNDuyn4Rg2rXWC+Z77Dn9nsux
         U8Y8IMtax+6BxnhtwJ83lcmRWyuHo4RsKZDWlTrglFSX/OQBRogTndN42qjDqvam20IP
         nnD/gQzy3U9agxd4ZDnBLoIPL3N6wEdeRtLziNj6jkCsDs841Uh3+dCRVOxf0PmdpLp+
         NR8qpEAfvyf1fFnDNKebvgh5lU+IpV+ETT3znIpCCFeSgyZmgVxu2WAFFjGDIw/TWck/
         wV0g==
X-Forwarded-Encrypted: i=1; AJvYcCWeP6w9wS5iH7Bcif1HgUDEtZxNarQdrfF7h9uy+KxJOSTUjMho5ITI3BhXNPiXLXXmg9vAU0hnVIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAGs1N9RByN3y7YsWVT0hJdTJwQgBnAiaexJi8GsKlmEfxrP5p
	/dpKLvY0ntNnubCCbTpkBuU9b1xLdUCooAKGGS3TT6NROG4/lIS0T7pdqhqe+A==
X-Gm-Gg: ASbGncv5vgJmUf3DFwJ+oAaeSF/kYpWQ9W8cz3/nUnU/Km0btA8zqLYcl4cdGcDCy4o
	UwPbqnczGjOOhrbAWRejAFyukXjMWUKCJTNVFXY6llXK1fpdaljgh1ybLBVAHFhGD0Fu+CxMz+q
	JibDQaLQFfaKbMcoDqbEaPUTyoVOLY2J1WTo42Ozpe8z0V4Vhxk/hEQ6RUW6JZ1n3PQvpZ0/Rbc
	3SHplw0nwChOe7ddliK8CVJ/nbHh2/5IdTBRzA2cYqHrRGNRY9gwka9BovB6VumenSb4TFSQRun
	oJXCoGEMpNyehtBEHvCCY6RR3kGui+nbIdBula4uVDMEhKirh+YvTo4hnplhG19MrYh+KBwIPeh
	FaC8JuhPvrGOBc2lEuCE1vM099A088w==
X-Google-Smtp-Source: AGHT+IFTTkjVNzQd1HUH9MMyv1+v/H2qZiw1ZftnJWPxnh8wCgZsnsskP60Wp16g/S844pkuiDyfvA==
X-Received: by 2002:a05:600c:698c:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-43eb04507e6mr5128515e9.0.1743522955295;
        Tue, 01 Apr 2025 08:55:55 -0700 (PDT)
Message-ID: <2564a765-bc7d-4d11-8d91-97df655da8fc@suse.com>
Date: Tue, 1 Apr 2025 17:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] x86/mkreloc: print the linear address of
 relocations to read-only sections
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-5-roger.pau@citrix.com>
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
In-Reply-To: <20250401130840.72119-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> --- a/xen/arch/x86/efi/mkreloc.c
> +++ b/xen/arch/x86/efi/mkreloc.c
> @@ -270,8 +270,9 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
>  
>          if ( !(sec->flags & IMAGE_SCN_MEM_WRITE) )
>              fprintf(stderr,
> -                    "Warning: relocation to r/o section %s:%08" PRIxFAST32 "\n",
> -                    get_name(sec->name), i - disp);
> +                    "Warning: relocation to r/o section %s:%08" PRIxFAST32 " @ %p\n",
> +                    get_name(sec->name), i - disp,
> +                    (void *)(base + sec->rva + i - disp));

This being a build tool, it may be built/run as 32-bit code. I fear the
conversion to a pointer will not be liked by the compiler then, for (in
this case) really losing half of the bits.

Jan

