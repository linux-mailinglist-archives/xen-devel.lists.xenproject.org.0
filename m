Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF9A7323A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929174.1331789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmNl-0002Ul-68; Thu, 27 Mar 2025 12:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929174.1331789; Thu, 27 Mar 2025 12:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmNl-0002SI-30; Thu, 27 Mar 2025 12:30:49 +0000
Received: by outflank-mailman (input) for mailman id 929174;
 Thu, 27 Mar 2025 12:30:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txmNj-0002SC-Hv
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:30:47 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee009ac-0b07-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 13:30:46 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso9677435e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:30:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39bedeb82c1sm926998f8f.3.2025.03.27.05.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 05:30:45 -0700 (PDT)
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
X-Inumbo-ID: 4ee009ac-0b07-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743078646; x=1743683446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xanE3JyXWw7AtvRzqqADzTYOFTcfJnHsiW9NnjNOF9Q=;
        b=EfrN0oMHHFFrm9ltvCD++rswbxdfhQzP8s/vBIeU3abrX81cxTI7P1GESH2mRXebTy
         b80fNWsL+zi8IZ/zBF5HWTrVVctzmBefw0StZQLKP5H9ekl1L0/PvbCt7lEn2G8qUUHf
         Uh8bGDGePzxYzzLBVdhNkU9+GKlTgPDbWeb/judUsajGFTqR2FCn+dZbSzkk68sJdAT5
         kCfeokCq84r4KOB2S6H42ebPdkc9SXvcdA9h2eTK9krQ9qk8rhZ8xKO/7o4lNEplfBD/
         51aOqvZUmrOV/EbCbRjH94WKxApzqsBAFELOfFqWNloNFtGroX5Qrt8daA/52iJ8Owt2
         Ym/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743078646; x=1743683446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xanE3JyXWw7AtvRzqqADzTYOFTcfJnHsiW9NnjNOF9Q=;
        b=r386dowKpEkXnCbZ9IKQCmV2wcwKQNIol6T92VtrYoNcs/n6M6zofoZ6kY+ifPjMon
         ElDDwAxKCxMbEBOS5H4SRR35UFcVeLR+3R3+Bwlb5glTvDx15o/Em36Hf65XLaLyc0LU
         X540jZW/o3XKidMdUngNaAv+TB86sZIhqJqCd8L2DkpFtGgAO+nUfinJoEusWPykD3aH
         sVcFE9VF3UTPvNIblrqv7+3zJvUaOI3ZCA4Gfi1XgZLIuy6zJjos24bCEkq0bfMoopCc
         7+oZnXrq/5OSpkWqdmJelClXCYxrXtQ4+XrPeLwNLZdns1hxM8+tVQadO3DlVQdIUYxS
         Hemw==
X-Gm-Message-State: AOJu0YwkWMbJeDhiRua23zzpgBekQQ/JGMGXmTLKGB7qukIdB9NngEjX
	k+XFZvMKkagdMBtN227By9eIT2aWTCX+/uRDtBXABQb1IE5GGKwgKZqUZX4H8Q==
X-Gm-Gg: ASbGncuq9z3BsP/Eax98GCSEf2msQrWViow//LzLQBT7JYcFjRdqTH27fi/H5VOnq27
	i2xqxlaZzPJZWOi/+fQz747igexzaUYWF4Di6Ph0uN+hBKqFXvA1O54E/GtQhMFj4m/A5X4RXhb
	DQMbJTNArVXIXWgOpFsAfuxmnuInPPf4P9npUxnmVWQKPNoAJJm4+qsKl/Pi3/3f/fej1kFT7/C
	rnvxjKHsC9W/S16aALY/qDNaEh2qmabhWL2IqZwCITvoS6xeTEm8gbVi5wOBNN1ek5ydzlstfaK
	PkKBwZ1uRyKwSIO8OuQ5ETQG49WENP46RAuY0Bv0aTTOcxA2FgxBSM8LmDEOPHSWRc383A/d0Gt
	H+eYQXJc1fCvsiOCZAZpNaMupb01alQ==
X-Google-Smtp-Source: AGHT+IGFcnMhK8NTNfDzcStcpsAHXK7the0kG5C++XI1UCVfg4yea1JO6JpxYF+JmjPbzCiIuPzUaA==
X-Received: by 2002:a05:6000:188e:b0:39a:ca59:a61d with SMTP id ffacd0b85a97d-39ad1773aa5mr2599618f8f.47.1743078646016;
        Thu, 27 Mar 2025 05:30:46 -0700 (PDT)
Message-ID: <fde64904-343b-48c9-b396-961811cc2adb@suse.com>
Date: Thu, 27 Mar 2025 13:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
 <Z-U4ozL6p-Unh5Y8@macbook.local>
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
In-Reply-To: <Z-U4ozL6p-Unh5Y8@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 12:38, Roger Pau Monné wrote:
> On Thu, Mar 27, 2025 at 12:20:47PM +0100, Jan Beulich wrote:
>> Unlike stated in the offending commit's description,
>> load_system_tables() wasn't the only thing left to retain from the
>> earlier restore_rest_processor_state().
>>
>> While there also do Misra-related tidying for the function itself: The
>> function being used from assembly only means it doesn't need to have a
>> declaration, but wants to be asmlinkage.
> 
> I wonder, maybe the intention was for the MTRR restoring on the BSP to
> also be done by the mtrr_aps_sync_end() call in enter_state()?
> 
> AFAICT that will set the MTRRs uniformly on all CPUs, by calling
> mtrr_set_all() just like mtrr_bp_restore(), but later in the restore
> process.

Hmm, yes, that's possible. The comment in set_mtrr() is somewhat misleading
then, though, as for the BP the writing then isn't just "okay" but necessary.
Question is whether doing this so much later is actually good enough.

Jan

