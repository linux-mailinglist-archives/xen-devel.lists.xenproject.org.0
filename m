Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367ADA81020
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942428.1341584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Ay9-0005XW-G5; Tue, 08 Apr 2025 15:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942428.1341584; Tue, 08 Apr 2025 15:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Ay9-0005Vw-DF; Tue, 08 Apr 2025 15:34:33 +0000
Received: by outflank-mailman (input) for mailman id 942428;
 Tue, 08 Apr 2025 15:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2Ay7-0005Vq-JH
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:34:31 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f653d47d-148e-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:34:30 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso5056044f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:34:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30096b9csm15313643f8f.13.2025.04.08.08.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 08:34:28 -0700 (PDT)
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
X-Inumbo-ID: f653d47d-148e-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744126469; x=1744731269; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz/rCBnwXJYbr2MvKvt2kktYZIy2sqCVQ2YeGXdS1AE=;
        b=AmWLBMnhTC96O9TocNF0aJzi9ZInejlzPypCu0Fm22u2UMQ1v4sx7P5rmFvJdZRS7H
         Ca8zL05FYP3hd5rW0/myo6+x9tGGBPohJO+5ju03C9aGfhQcvHDF0Jlh433sLTDSNyil
         nEJh2sSOYndGl3LG8O0tVea9IuNcm6qBPBqXRSRjBlhFKCC7Gr73lzcn+2/ypPJN8WMT
         NM2gHMXVjnW19qJKh64ZwsSFUVXc9Uc5BGqCgS59VaGlgZ5YwaqWsJtID09De54dtiV4
         CCd0x5WG0I38gULnU2MV2/aiYPcvbAzj5gck6I4/dUOG4e0OmmFi0eSLh/QBIMJR7/aX
         kf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126469; x=1744731269;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz/rCBnwXJYbr2MvKvt2kktYZIy2sqCVQ2YeGXdS1AE=;
        b=tXKb6iDlVfaWzGR0Q7wo971qy2G/V9XLC0tbVn32AMbuDx8K3vOLH7xMI+MyvdKAEK
         Umk/dEimAJ4VB5Lid9iygPJ3IimQTzQeEXZxgdG1WnDxHvpVoQMpteK3JKmLHpad9f52
         WLLth/7FcWlJC5Z3asR92YchLfTKmiWiEVUO8ihTStZMBlkGHRZu9hui/UJLuyBo//DL
         ndzDFJQZGgwKn7cV/YJL56r8z+7oqDUuL+U2iHQKSaB6YAjZ+pNAldFMvs5GplPMfXVA
         XrTUg9bdroMUnS0hQIU6V/0baisDCYmaXBwfKNszbW8NKoy32i3nV/xHuz6AgLs9xv9A
         3q/g==
X-Forwarded-Encrypted: i=1; AJvYcCUxHXDGfC9g3CvPBRFgXRtsYZZrYddMWtT30FPfcOuEpKlb4tVg3AbCKJxo8bq37DUxUiUlD6g6/VE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8kyOdHgHdRFTznCrURSXDhZ28T7PX5fY3iC6zBXVHOvFCHhF7
	Sf35le2L8OFSgPGG5lneEtarJjTwqGknfDg5jdrIZJPajANwlkKibmKmXBCsHA==
X-Gm-Gg: ASbGncsTT+87tp2hWdT8kCqgTGE3I8BSQ1rd+C4LRYMcr3Y+r4A69gGQEP8ALocBgSa
	p45vBrQeBRvDLWVTmPLjMvOUHj4RUO426Qc726zuUkx0R78GZmxBCCtWvDoxkY+qTSUZoVBxuAP
	+ocFYnSmK+roQcG2ONjpt8QZVYHaY1KaVyno+wWdal/W500luSRQDBnTLdI5ndkEOICjJAnf0kO
	7FRuZOiMFPFGcWv9IwPblBjsrdbqDSBX8OkVyGBqwx7y8DX5IFsEocTtNA2JKR+87/gao1GfKlO
	Mgn9tuU/JuHy6pvhxR9DowVpUYYo6IScxc6aCqY8XS1Qc9wrRCgiYTGG5n8hrPB6lABkNqKYVHz
	X6cL79s/+/vrPeiSxTlqK9mHEVnGDXg==
X-Google-Smtp-Source: AGHT+IFW4D+PRg06ucIfKfTQVYuqU3MI4mQp0SCm2PeFU3Enh/M9Cn1eqWR0VUb1Wr6JHIOyrC1/ng==
X-Received: by 2002:a05:6000:1844:b0:391:12a5:3c95 with SMTP id ffacd0b85a97d-39d0de255d4mr14022516f8f.22.1744126469355;
        Tue, 08 Apr 2025 08:34:29 -0700 (PDT)
Message-ID: <c14efb79-54c1-438d-813e-15f635813ccc@suse.com>
Date: Tue, 8 Apr 2025 17:34:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/domain: rewrite emulation_flags_ok()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250401005224.461325-1-dmukhin@ford.com>
 <20250401005224.461325-4-dmukhin@ford.com>
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
In-Reply-To: <20250401005224.461325-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 02:52, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Rewrite emulation_flags_ok() using XEN_X86_EMU_{OPTIONAL,BASELINE}
> to simplify future modifications.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Came in the context of NS16550 emulator v3 series:
>   https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com/
> 
> After modifying emulation_flags_ok() with a new NS16550 vUART
> configuration switch passed from the toolstack for the HVM
> case, I decided to look into how to improve emulation_flags_ok().
> ---
>  xen/arch/x86/domain.c | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)

There is a readability win, yes.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -750,25 +750,18 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>      BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
>  #endif
>  
> -    if ( is_hvm_domain(d) )
> -    {
> -        if ( is_hardware_domain(d) &&
> -             emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
> -            return false;
> -        if ( !is_hardware_domain(d) &&
> -             /* HVM PIRQ feature is user-selectable. */
> -             (emflags & ~X86_EMU_USE_PIRQ) !=
> -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> -             emflags != X86_EMU_LAPIC )
> -            return false;
> -    }
> -    else if ( emflags != 0 && emflags != X86_EMU_PIT )
> -    {
> -        /* PV or classic PVH. */
> -        return false;
> -    }
> +    /* PV or classic PVH */
> +    if ( !is_hvm_domain(d) )
> +        return emflags == 0 || emflags == XEN_X86_EMU_PIT;

What's "classic PVH" here? This got to be PVHv1, which is dead. As you touch /
move such a comment, you want to adjust it so it's at least no longer stale.

> -    return true;
> +    /* HVM */
> +    if ( is_hardware_domain(d) )
> +        return emflags == (XEN_X86_EMU_LAPIC |
> +                           XEN_X86_EMU_IOAPIC |
> +                           XEN_X86_EMU_VPCI);
> +
> +    return (emflags & ~XEN_X86_EMU_OPTIONAL) == XEN_X86_EMU_BASELINE ||
> +            emflags == XEN_X86_EMU_LAPIC;

There was a comment about X86_EMU_USE_PIRQ being optional, which you've lost
together with (only) that (i.e. not at the same time including vPCI) optionality.

Furthermore you move from X86_EMU_* namespace to XEN_X86_EMU_* one without even
mentioning that (and the reason to do so) in the description. Aiui the function
deliberately uses the internal names, not the public interface ones.

Jan

