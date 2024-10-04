Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FE998FD73
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 08:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810010.1222600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swc1v-000286-8h; Fri, 04 Oct 2024 06:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810010.1222600; Fri, 04 Oct 2024 06:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swc1v-00026a-4n; Fri, 04 Oct 2024 06:43:11 +0000
Received: by outflank-mailman (input) for mailman id 810010;
 Fri, 04 Oct 2024 06:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swc1t-00026T-Oy
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 06:43:09 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea144d5c-821b-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 08:43:07 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c87ab540b3so5164268a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 23:43:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8ca3e02b0sm1498027a12.32.2024.10.03.23.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 23:43:06 -0700 (PDT)
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
X-Inumbo-ID: ea144d5c-821b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728024187; x=1728628987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hmYxHGg9YSO1d/YtR/JpWZEGn3yWbjxfedTFSJ5zNwk=;
        b=SyyPTn4oZTDTUoQZqDKyqIXE9+UKby/CVc69dKnggtdRaD5vlCqCdSLxIdattrAkne
         46xEGYArWo1IN6Pjmovf6XXYX+SjHczPp0y1vrTC7p0bImAkc77qhdxkz4BQKfh5u1O8
         fL0kL4/Unu6Ea9vCt6iy2WzZNcmFqjZH+zyYOVMqcZJpmjBP6djBky6de789X/ErWRBU
         f8VBXUQ3NgARVaED6hUHIq1VXoWxFcT9yxwhwLF2EL+v+I/Emz0lC6i6VeeVUTBnr2T6
         9/SvhTXgFXtnIIrFqdn/41gDTCqAoHaibCYR8pvTCMdNXy8gjOK5fNVhmKmzuyDXdlP6
         xtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728024187; x=1728628987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmYxHGg9YSO1d/YtR/JpWZEGn3yWbjxfedTFSJ5zNwk=;
        b=lRPYNmdeGvOfOzS0rb4MfTNTGKyBNnDs2rQFxHKmYjxmASQbyHZOiO3KqP4Qm83nKZ
         gIhl1T2TuChwAKBxATf2CHuDJndNLIP1Mz3B1tHA/6As0lCkS1cmy9Qws/6WKNdM4X5B
         Ad4y7qiIok26LRzv67QBKC1WndUn/qa1pmD5nUwucLVKoW/czyGlt0xnm5z7ZGprQUTn
         MVfygVD8T+rQA34sRnLREEqVEaszbRR8cku4B7R/eKyoBRa8kFZOJfGlbp+2cA7qg5lY
         RCtVUqtHOKQbX2VDjqYq0BCKHmfXF3OttdwKggpI7llCM/rUV/ZsNqZ8aWRKJ8+NELbp
         mkcA==
X-Forwarded-Encrypted: i=1; AJvYcCVwYp4QKiGK+KMYQiLlU4DBPNQ9kuY74ObcUD6Al0KeJ251VlQqVkmmTrvb8zVYlfoWM7vTIVZ05FE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymA3plVLI1j1b41p/HRqnElcUpgZRnXE1m6rcN5epZypV9a34q
	7LHiGKMhiWQ9uH2ws91KPp3Wsv/s7B06hX0GKReQV1aet6tmb26SNq5b+TTNsw==
X-Google-Smtp-Source: AGHT+IEF95BprliiUZbUKXYpy0NRLRNAR1D6LM4YeNcu5tb3zMuQohJ5wS9eK1pMxwfOEP1Ry9hyLQ==
X-Received: by 2002:a05:6402:2551:b0:5c4:2d5d:b25f with SMTP id 4fb4d7f45d1cf-5c8c0a65941mr5489705a12.13.1728024186906;
        Thu, 03 Oct 2024 23:43:06 -0700 (PDT)
Message-ID: <39fc1c44-ec09-4df2-86bc-c86717ef7a86@suse.com>
Date: Fri, 4 Oct 2024 08:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Introduce X86_ET_* constants in x86-defns.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241003170413.2227753-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241003170413.2227753-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.10.2024 19:04, Andrew Cooper wrote:
> The FRED spec architecturalises the Event Type encoding, previously exposed
> only in VMCB/VMCS fields.
> 
> Introduce the constants in x86-defns.h, making them a bit more consice, and
> retire enum x86_event_type.
> 
> Take the opportunity to introduce X86_ET_OTHER.  It's absence appears to be a
> bug in Introspection's Monitor Trap Flag support, when considering VECTORING
> events during another VMExit.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -204,4 +204,13 @@
>  #define X86_MT_UCM    0x07 /* UC- */
>  #define X86_NUM_MT    0x08
>  
> +/* Event Types. */
> +#define X86_ET_EXT_INTR    0 /* External Interrupt */
> +#define X86_ET_NMI         2 /* NMI */
> +#define X86_ET_HW_EXC      3 /* Hardware Exception (#PF/#GP/etc) */
> +#define X86_ET_SW_INT      4 /* Software Interrupt (INT $n) */
> +#define X86_ET_PRIV_SW_EXC 5 /* Privileged Software Exception (ICEBP/INT1) */
> +#define X86_ET_SW_EXC      6 /* Software Exception (INT3, INTO) */
> +#define X86_ET_OTHER       7 /* Misc event: MTF=0, SYSCALL=1, SYSENTER=2 */

ET could of course mean a lot of things; sadly no sufficiently short but
still less ambiguous alternative comes to mind, so ET is going to be it.

Jan

