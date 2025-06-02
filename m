Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6CACB464
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003561.1383137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6W5-0003Xz-LP; Mon, 02 Jun 2025 14:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003561.1383137; Mon, 02 Jun 2025 14:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6W5-0003VU-Ib; Mon, 02 Jun 2025 14:51:57 +0000
Received: by outflank-mailman (input) for mailman id 1003561;
 Mon, 02 Jun 2025 14:51:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM6W4-0003VM-NA
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:51:56 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d458d00-3fc1-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 16:51:50 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso3410848f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 07:51:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e3c1146sm5729608a91.35.2025.06.02.07.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 07:51:49 -0700 (PDT)
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
X-Inumbo-ID: 1d458d00-3fc1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748875909; x=1749480709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm7cNfOyNkiOgSg9LIC0y0HPLqjG2l+p4TZscsqBbu0=;
        b=ZGamNin8ikIjtMCQskav9qkV7/Oqj+SqNgY6g/XuJy5aAzs6T57rkOBqiXzKW+adtF
         fVePecsbdlxZoOFcoNYNKFbZ1FIdic2BncKnE1f2YT7jOf046O+l3ae0+Rmo7dTK30ti
         mVjhiqN7XGCBUFLp0ctyttb7LJrmswrVkas8+5jPy5ZT71fbc9kbSv3Cw5vCJB0OMaP/
         jc/LDFEEWccsnwdelH1xh0NPOCMSGuVxXwGz/+CcX9hJB6V2LBKZd25tNjcyWch83jbk
         bm72mIrHJYGFlmehmJj5bZSVRKtimCXjd/5X3GpwWlSQHxVTxNs1BkhKwXUifPanQMLO
         YpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875909; x=1749480709;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gm7cNfOyNkiOgSg9LIC0y0HPLqjG2l+p4TZscsqBbu0=;
        b=C+S6LoY7lfXiLGHDL342/VPDx79NlA7aJycbYr0fvlNfVJTLCkzC6lShFgMvEBJqXq
         iGLmAZqk1Tpsh5VE67hh6HfTMQ72HtQzErO3H9wcJz+GCUz8SIZ6AHregmNq/GkKywAL
         Wq8Mv598Zw5uj4mzsKy+naYsG93R3b+ieVss4NAhuqEWd8E1hbWtp6RwJCRZnFnpgop5
         Sto98xiRbXlYB6rh8BC0xpGfmNmsnMDSMF99JnX47DUmJVw4LDG+1LVApZL0pupqEzDm
         63Ux2bfBXWqhGTdG+88DcruzURkpBnfPU3UuJtt9C6qVto52swZp7F351wCIW0n6zIjW
         T+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUbAf89Z091kHUNmNqbuUuMe/4ay6OMxc/dMEZXaFwT4C4cFmW7NCfjbeGl5vUBHz5WBnpqmMTYCzs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWD0Xoz8vK+igROMnDcc6EHhYib/PSyaozO3Jv7hkHNcVL6Qz5
	LbVXJIkhwU1sRA7W5DG4le2T8hYySaiyKogFDUR0VgroWvObCLPjSnczR9dzK1zaeA==
X-Gm-Gg: ASbGncvCAd9yTKTu0FRrL5cixuaB52ZvJvtbzAm/7+jiNnT5hzPqXd4Hjr7yA6xMZq/
	UOjMX9+Lj1tDI5eiSUHe19BN7XKETicd250eDQRfQxK0xjdtrgxnsZinRP884KLYMnTUkbaTDH3
	+Zrncpias79o4+rVPs7iDQxA/dEfjf/9hRgazdsnDt3B/8y98GmaRDrM+9KmNYA/xkH2M/kaBO6
	fIg8DHZd0Nv6ozYbbk6PXnxyANtF79PaueQ5hRZVuzkjoEVnDaHwxl4FNR8YPcHTuGQKqIGpAqd
	ruEU5cDgD+ywOsUs84KfUFI0D/B6r7QAc83YtQRVqryDUXXHmccLU6PtTeYJ24VMCyCvd4MB8me
	MYWJaYnLD5LaPDF5Ov/CWFUSak78/kqYBfwtc
X-Google-Smtp-Source: AGHT+IFBFtNbIgjKyFwMZJ4IGUJXh6bywRNgIwFW4Ce3TXeFTrK2FKk+kzOmDl5756gORud0bq/Xmg==
X-Received: by 2002:a05:6000:40cf:b0:3a4:e6e4:6ee7 with SMTP id ffacd0b85a97d-3a4f7a9d580mr9730597f8f.45.1748875909584;
        Mon, 02 Jun 2025 07:51:49 -0700 (PDT)
Message-ID: <6cc4d172-793b-4d3e-990e-f8fd0d4bbabc@suse.com>
Date: Mon, 2 Jun 2025 16:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-8-agarciav@amd.com>
 <5f3de127-70cd-422f-a368-6c23d83c6cf9@suse.com>
 <DAC4BPMR5N3A.3JYN5WXUSRGBG@amd.com>
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
In-Reply-To: <DAC4BPMR5N3A.3JYN5WXUSRGBG@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 16:30, Alejandro Vallejo wrote:
> On Mon Jun 2, 2025 at 9:53 AM CEST, Jan Beulich wrote:
>> On 30.05.2025 14:02, Alejandro Vallejo wrote:> --- a/xen/include/xen/grant_table.h
>>> +++ b/xen/include/xen/grant_table.h
>>> @@ -27,7 +27,7 @@
>>>  #include <xen/rwlock.h>
>>>  #include <public/grant_table.h>
>>>  
>>> -#ifdef CONFIG_GRANT_TABLE
>>> +#if __has_include("asm/grant_table.h")
>>>  #include <asm/grant_table.h>
>>>  #endif
>>
>> This change looks wrong (or otherwise is lacking justification): With GRANT_TABLE=n
>> the arch header isn't supposed to be included.
> 
> It's not equivalent to the previous code; but that's a feature, not a bug.
> 
> Not including the header with GRANT_TABLE=n  was the best we could with
> the older toolchains in order to not try to include a header that might not
> exist. The high number of sequential inclusions of xen/grant_table.h and
> asm/grant_table.h seem to attest to that.
> 
> I can ammend the commit message to be clearer, but IMO this is what it was always
> meant to be. I can replace the current commit message with:
> 
>   "The previous toolchain base version didn't provide __has_include(), which
>    allows conditional inclusion based on a header's existence. Lacking that
>    feature the inclusion was guarded by the GRANT_TABLE option being present
>    but even then sometimes the arch-specific header is required even when
>    the option is not selected. This causes inclusion sites to needlessly
>    include both asm/grant_table.h and xen/grant_table.h.
> 
>    Using __has_include() removes this requirement at inclusion sites."
> 
> Thoughts?

So why would we include a header we don't need when GRANT_TABLE=n? Overall
we're trying to reduce dependency trees rather than growing them further.

Jan

