Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC18C577D8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161330.1489305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWpd-0004mm-Ba; Thu, 13 Nov 2025 12:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161330.1489305; Thu, 13 Nov 2025 12:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWpd-0004lD-7h; Thu, 13 Nov 2025 12:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1161330;
 Thu, 13 Nov 2025 12:53:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWpc-0004C2-C4
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:53:44 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a400b4-c08f-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:53:42 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64074f01a6eso1376613a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:53:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f880fsm1433583a12.11.2025.11.13.04.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:53:41 -0800 (PST)
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
X-Inumbo-ID: c8a400b4-c08f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763038422; x=1763643222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RNQdktPjqOqYAn4ga9tCxzKcOGSHaaBgicLG7Zh+V2M=;
        b=IOa/idboQfx2ghWrv9uJVugNVRw+7ozqYULSitwNYlrwurBry/j59lEPz0M4woX+1d
         z0stlhLb46iGYxhpbA1sAL9Yj4ISwo/hopQw6nzzLgT6CWfPq8R0pWvSUMaS1TV71Hu7
         QFFEww+y3AERz+kMFQRo4dSInATUjtwjFUsKsz8lShZgQeiNt2wLUeeawzg3FrEm/JoJ
         f9/Kcibb8UsVJzD+BJIyW0aiQ9THTPnNQztQ47P/GWRVzXjvYrrZRW1DFvj++xuzriE1
         CYf17xoewu2fwJaBWvOSONM2mEurECeOwM2vVnOth4j0lR1JnEWPHj3GKY6Rb/qV/w6i
         FWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763038422; x=1763643222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNQdktPjqOqYAn4ga9tCxzKcOGSHaaBgicLG7Zh+V2M=;
        b=MWtkXiKzinT+f2q++X7ZRs0Iq/qiZGFl6STJzcCHMz0OMobGGlc+6AwlGNhjTb6Y9L
         rNZlg/ImxZOMnzlNCRRpAwxygX91yOKWVTxZbtegZOLROPq3adPz8N18M5w8KCw6/luB
         hCJ5zTP94XsfUQUXUnVyNgZUG1BTKTPevb50/33ywPzi2OKOPUIP25lMO5lI5F5SatRR
         fGYkQmmwvmzDHoMtpFZNAXR30iApmkuoIeWwqHwfY61yQQ/YucXcydWemTm/HfxTaGW7
         izryrzJRc/EWTs/RGJcpCED7YZUX88g7S9Hc+da/amkn9j56+Vv7wWvLb5yzE/Ul+Myo
         4n1Q==
X-Gm-Message-State: AOJu0YyitjUb0TJmJgN+TzCKEv9ZuY7tbdA3fR8OL2hDEc3aqg4qkg0n
	X5COofYbxcRKjtnA2gdmrrwVGhRg4boQ4AJhxf5qzp8rtfOQljx+3APrQNTE0sheoA==
X-Gm-Gg: ASbGncsCztliKhi/yZWRNZ2dlQhcK6+hbDUlryQzXGPND3Zn6XrQh7cO7crKwRU6xIY
	4z0Hmf4rT9CththA85fAdR4Bb7H4L2v1coj+jWtdSU78cXcjBIlifP3zCqBOL3n/z4kFEM/Rnz2
	D/AGleDbcFEbF9i+aGG/2fXYrCdDdVU1S1iaBj8dPzDCibjgrUtNwafBOLxMC4aXU3SedGYd/KM
	//H3n+slfP5P5DkvXOkevxIB0H+NiVvzjwuf4TprePYMMh+TELLEheS0Erz1gmHYVM/mzQdkk4A
	NghEWasKHJSL5HvWODTNSMzTNMqtzlTk9uK6cGwastDE9tAmMxO7x/ppOlATSpmeem7hOaVQY/l
	cmLeknuCxdV26+eSrOTONBUoRt78kTHYO8YGmj8CYlsdJZBjeVmWlEFzKkmaz1W/Ak0GK+swqGd
	Ylg4GO/p7t2UizcN42jReQJn9d+yxB0IY49u9VOicMEHpC6WbKVybTf4Mjl2JNlkxWT3SLrTM0Q
	yK3SYlH2IJ2Rg==
X-Google-Smtp-Source: AGHT+IGZW80OvMxVzqEckpPRziUa165bl7W2otLnAvFMYgvwknWJ5J8+BRDUz99zm5JPfxUUcv46/A==
X-Received: by 2002:a05:6402:13d3:b0:640:a7a9:289f with SMTP id 4fb4d7f45d1cf-6431a4b59d1mr5685276a12.2.1763038422064;
        Thu, 13 Nov 2025 04:53:42 -0800 (PST)
Message-ID: <d027f21e-f2cc-4c63-9ebd-8f563d72c993@suse.com>
Date: Thu, 13 Nov 2025 13:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com> <aRXRtY10cFN38d02@mail-itl>
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
In-Reply-To: <aRXRtY10cFN38d02@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 13:40, Marek Marczykowski wrote:
> On Thu, Nov 13, 2025 at 12:09:37PM +0100, Jan Beulich wrote:
>> Use the new brk_alloc() instead, with ebmalloc() merely being a thin
>> wrapper.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I'm not quite certain whether we ought to permit non-page-granular
>> reservations. The in-memory image being somewhat larger due to possibly
>> excessive padding isn't really a big problem, I think.
> 
> My grep says ebmalloc is used in just two places:
> 1. For efi_memmap (via efi_arch_allocate_mmap_buffer())
> 2. For various cmdline options and module names (via aplace_string())
> 
> The second one is probably undesirable to allocate full page for each
> one. On the other hand, the current approach (putting small allocations
> at the same page as an earlier page-aligned one) also has its issues -
> see comments on 3/3 patch.

Imo if such sharing of a page is unwanted, then it's the side caring about
the non-sharing which ought to request an exact multiple of pages. Wasting
space due to doing this in the BRK implementation is undesirable.

Jan

