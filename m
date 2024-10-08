Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9199424F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 10:42:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812823.1225587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5nE-00050x-K3; Tue, 08 Oct 2024 08:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812823.1225587; Tue, 08 Oct 2024 08:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5nE-0004yE-HD; Tue, 08 Oct 2024 08:42:08 +0000
Received: by outflank-mailman (input) for mailman id 812823;
 Tue, 08 Oct 2024 08:42:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy5nD-0004xD-3P
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 08:42:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32bf5ebf-8551-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 10:42:06 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c42f406e29so7096776a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 01:42:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9935ee4594sm453864466b.189.2024.10.08.01.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 01:42:05 -0700 (PDT)
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
X-Inumbo-ID: 32bf5ebf-8551-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728376926; x=1728981726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xWAQuuPY3Y+UKj3p0PpqioXI6PMXZagE2PwXUZ/T8mQ=;
        b=NsFH+kQsPbXUuOXXqmfnEB2cPz4lil/KCvrXaN4ChNeVHayyEiR3/ZZJ8uYC0pQ9ts
         0dUFH/iKHyHyTPtIlQzZZOJt7fTKBrwTl4mZZ3LZaztEvNBsGlbdci43Yypkw8fCwY6g
         d8gbyskD24E+wAJmDJu6wRm5YRJIzTzHf2KKioJbBT2CPZLBYSmhZeRlesXV9mn6Jpda
         cei+jMMUY6MtYPx/HQOkZZvkGVwwcNfggAEXZGNuRC+o17X0CEz7p+5jw1sU7ClbhgKf
         II6oDAttNooAlpfUfAxSIzUPPNmHGI2BNCVg1w7agjOFqvRLVV3PbqQb7dZ8YM1G+S8q
         4zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728376926; x=1728981726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWAQuuPY3Y+UKj3p0PpqioXI6PMXZagE2PwXUZ/T8mQ=;
        b=Jd+r8GRgIyy+MRcR0jt6lHaHcmRoo1GQeiYZwZC1PorirRv4Y7LEpVf7BNKlorG2tT
         T4pDLfwmHNHy2cq7b21+ZPEhqjWsQK7uh241BdVbuIoOISDA06LAjztY34WfYxpyO1sR
         mI9i9fygMj9veDJRx4sfx30OA9GhVPBiYKhFK5PACkYBj8b4IQIxCyEdI0uBRl/jv/JN
         Qf880zaEBcaoxl06dal3IHtzKRWJNo3G0F/VZFzcdTXGWDDd75Ajvrp4VvqAxMf5UGlQ
         GK8M21XT1lGBPM1cDpNs1MUnGkvWC8dGE6gP6HPB54VvwyvOZ1OTp8oaR2CYKypFjeqx
         eKZw==
X-Forwarded-Encrypted: i=1; AJvYcCVvOGEsZHPmIfXBFphSfGp+GVKiK0SJhE6pzZRMghQYSWkvpi5D2NUZQ+g3qrsqF4c0l2/FmgPM6cQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy81OXA3kKedqujvhrL+sDYOxMsPGQWlbVKcg9HyP86bNpq8ctW
	eG9pRJQ9Y3E+fRhLAMez0NNfwR/j8jilTk43U7UVI1dACS4KonIpgFLNfgdoJRoeJBH1xuvPusI
	=
X-Google-Smtp-Source: AGHT+IHfc+jN9E6FOcW4F6hb05kYzApUrmg9nbK6IAr2e+5LHC3B333zcu5WC0sABjIWSEZ+vuhT3A==
X-Received: by 2002:a17:907:7244:b0:a99:36e8:c353 with SMTP id a640c23a62f3a-a9936e8c51bmr1145427466b.56.1728376925753;
        Tue, 08 Oct 2024 01:42:05 -0700 (PDT)
Message-ID: <0b34d746-cc7c-4db0-96c4-44ae3d6c6172@suse.com>
Date: Tue, 8 Oct 2024 10:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: fix maximum number of MSRs in
 XEN_DOMCTL_{get,set}_vcpu_msrs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241008083756.72829-1-roger.pau@citrix.com>
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
In-Reply-To: <20241008083756.72829-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2024 10:37, Roger Pau Monne wrote:
> Since the addition of the MSR_AMD64_DR{1-4}_ADDRESS_MASK MSRs to the
> msrs_to_send array, the calculations for the maximum number of MSRs that
> the hypercall can handle is off by 4.
> 
> Remove the addition of 4 to the maximum number of MSRs that
> XEN_DOMCTL_{set,get}_vcpu_msrs supports, as those are already part of the
> array.
> 
> A further adjustment could be to subtract 4 from the maximum size if the DBEXT
> CPUID feature is not exposed to the guest, but guest_{rd,wr}msr() will already
> perform that check when fetching or loading the MSRs.  The maximum array is
> used to indicate the caller of the buffer it needs to allocate in the get case,
> and as an early input sanitation in the set case, using a buffer size slightly
> lager than required is not an issue.
> 
> Fixes: 86d47adcd3c4 ('x86/msr: Handle MSR_AMD64_DR{0-3}_ADDRESS_MASK in the new MSR infrastructure')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> I'm tempted to just get rid of nr_msrs and use ARRAY_SIZE(msrs_to_send)
> instead, but refrained from doing it.

I think the variable would indeed better go away now. Yet that doesn't
necessarily need to happen right here.

Jan

