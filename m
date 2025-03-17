Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15609A64B88
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:03:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916547.1321622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8Fh-0005xf-Fk; Mon, 17 Mar 2025 11:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916547.1321622; Mon, 17 Mar 2025 11:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8Fh-0005vU-D0; Mon, 17 Mar 2025 11:03:25 +0000
Received: by outflank-mailman (input) for mailman id 916547;
 Mon, 17 Mar 2025 11:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu8Fg-0005vO-5B
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:03:24 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ea1ff9-031f-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 12:03:22 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso13721825e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 04:03:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d200fad64sm101304045e9.25.2025.03.17.04.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:03:21 -0700 (PDT)
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
X-Inumbo-ID: 70ea1ff9-031f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742209402; x=1742814202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FQjtTdlwB+8VKnxBbUM1jaL7uHemp+a4JRqYrdzGBqA=;
        b=bq2X/raHh7dAQj32k8bCzYwv4WS6Y+fUvaSIaztJ+kF7q2JH+CZ0YtsgVJcO/Q4eG5
         OFXV6+GQIOXAz4YmWfU0mEO6ANA4pJDPSelbEwlad0CSccqK90qPmgNoAtC28LUQdj4E
         OTQkRTeAexY8Krf4YwxNpfPOXflTYsMzV1mpaG4DSTrv/ung4fDa16hUidXG6vJhgQUT
         BnuXpTQNCDwjSAWoonqc9Q4ScU08B4CO5gUm2BpdhkyKVNCGmZTx+R8kXFM7LWrc1GKF
         e3uQAoZ97QQC6uLNbUAxE7u6PAiIx2vKWefa4De/MjAOXCNFV5A9R39tqaXRdTOh9kzi
         V9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209402; x=1742814202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQjtTdlwB+8VKnxBbUM1jaL7uHemp+a4JRqYrdzGBqA=;
        b=HWcMdEvyKkSxUf8uqMLhSEjx8rSqEqbu58ckj3EQcgfW/i5bIbOgWfem7xNt324L3U
         JfkvWWg1XlFMzA3NiRZPw75l8MdNCXQV2p0oZXWtY11xy8De7tQdHlPjf1fgXsq9kC+N
         C55vB668oFOgMJxCDP/0XAJLTAeHeFZ3DGqcYv6FMa0iETLYylsNx9lc4Dq7KisSvCy+
         mU+wy//HO4ouF5rVk96eVZxMjVTWoMVojFIxwvSZS5ibbfwABeXsXtGoOrWJh6jl28Mr
         vQm1hZjm9Vmh724JFdnOhaBQIa6ehy3tr7odXPRGphZcS9vGVXNrdqv4B2vxobVZCzhc
         DeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU39Y0s9fejvv2neBJrwCKqYhNtxt8mgR2u8oqNE+4bjjhUsu6agJiC0j03oCGKg6VsrLzr7+4kmvE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3UnVVlyrnrWooAhb1Mi/VKsdAuZX4f9OWpKBNMQKrjcygd7co
	Vn4cWx6Wjmd4Pv8C4evFhMNAhHmFNNyUQAaubI1Dc0e1xlKuR2iCQFcIjJpfFlpkTbw6XeP42CQ
	=
X-Gm-Gg: ASbGncul1LYsZ1scwLOblH/yZrSXm5QLkVsjxMj2Rv/5lrYpDGmO5o0HvD0f02+0jjV
	Te26VQN+Vo4hIQcN0NAsHZLOAs4P8zeggAFHhFv9Ax9zwDSGgbt1krWkem49e0KmHI4ZSyUUnkk
	5gfXxaUgvbcKxkb/iID8HEXujomxzzdcmgpid7QVlEbs9iOLlnTqqSy7Gca+ajP2KMRWP6dffOw
	gdlRpZRjSRxK+2MXAz5nEIO2LWBF2h+hs2Zb/QCzbaXRqVMK3lH+ce20aIUIz3wgOBg7kTLBihV
	12FhTseoemiq2Q26gbNayuCawBzIfeuH0zA7OZvZ84z7eSguXUWOpOu4MfLZAba4LPm/c6LNMc9
	sE/IJdsbx0OTVxPJc9X4hekJjvA7xVA==
X-Google-Smtp-Source: AGHT+IG7O7EahYML0G9SHVk+E51H00Zh0d9XywrkbEkB17aKdnmHO+kgzbB3PMYRDuhlG9Q/8uyL9Q==
X-Received: by 2002:a05:6000:400c:b0:391:a74:d7dc with SMTP id ffacd0b85a97d-39720e3c898mr13514945f8f.50.1742209401434;
        Mon, 17 Mar 2025 04:03:21 -0700 (PDT)
Message-ID: <0141cd64-348b-41fd-8a45-d8e236e60cb1@suse.com>
Date: Mon, 17 Mar 2025 12:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] Revert "x86/traps: 'Fix' safety of read_registers()
 in #DF path"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> This reverts commit 6065a05adf152a556fb9f11a5218c89e41b62893.
> 
> The discussed "proper fix" has now been implemented, and the #DF path no
> longer writes out-of-bounds.  Restore the proper #DF IST pointer.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -847,13 +847,7 @@ void load_system_tables(void)
>  	tss->ist[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE;
>  	tss->ist[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE;
>  	tss->ist[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE;
> -	/*
> -	 * Gross bodge.  The #DF handler uses the vm86 fields of cpu_user_regs
> -	 * beyond the hardware frame.  Adjust the stack entrypoint so this
> -	 * doesn't manifest as an OoB write which hits the guard page.
> -	 */
> -	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE -
> -		(sizeof(struct cpu_user_regs) - offsetof(struct cpu_user_regs, es));
> +	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE;

And one of these "es is special" also gone.

Jan

