Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34876ACEA2A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 08:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006257.1385450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN48E-0000Ro-Iz; Thu, 05 Jun 2025 06:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006257.1385450; Thu, 05 Jun 2025 06:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN48E-0000Pq-Ey; Thu, 05 Jun 2025 06:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1006257;
 Thu, 05 Jun 2025 06:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN48C-0000Pk-Hm
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 06:31:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7b1d3a-41d6-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 08:31:14 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so284893f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 23:31:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafa34sm12555519b3a.103.2025.06.04.23.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 23:31:12 -0700 (PDT)
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
X-Inumbo-ID: ad7b1d3a-41d6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749105073; x=1749709873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LD1YIKKhP4Y4E1+J+F+lZ84K9Y0IuCjjqTjOSBewbQM=;
        b=XJ1XRCscL6eoGrHJvnEt6dYZvQxyyZ8dnXycR2dv+vGRi1ghO2NeDz/Yza2pMrUfyb
         JACZ9S99/DriXMWvK4q4Mu2l85mptG7k7bcISAgHuK7KtqSubcnpw712b9QH47vN14Ij
         sBuct6/aN8CCVHWh9Bm09ohOTcjnTsn9oibEug1GZX8TVljjmnlK/h4RkyrL7RvQ31XI
         V8dwuZVjk3WbJv1S6p6zHN9jwtC9/IbHthSr3CNgV4FkTXxWufSN2l3O9sYqnKuQz+ez
         czC2aga2jusiUylh+pUUkiW05KdooyjcozlIb9MhDOdpLrP3k6fm0QF1EPxXdJalnz9A
         85iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105073; x=1749709873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LD1YIKKhP4Y4E1+J+F+lZ84K9Y0IuCjjqTjOSBewbQM=;
        b=l/UfEEY//1FBSuD3z/kTBjWjI3d1ivjYJd1yHjSpnYoZams+eai7XmjpOw5FQoc8DV
         sYbV2on27vWilqavnVH+/hx0qEw8/3a2S2iASskHxvliardZA5a2kfBI41udmvgjUMEn
         /JEjVHUkQHDIjFExHtg9D8mWnzFqMaUNRDS6zLfKwgRBQjGRigcvIlIxWAjrwJAzMUDT
         6t8PBWN5oI2FqSH664lAZlOHsv7TbRYq4NA2uEv90qw1pxqZZKJQOiW0NrltBhR9OFSs
         JVQJIgR+b8o7V+QQm3uPWRb9Ce0mFxroRm+qDhV8zvJiU+0nMxjiHQhjFJYCMrt9uPc9
         nRZw==
X-Forwarded-Encrypted: i=1; AJvYcCVrwUsXNoxSf2TkAvQSfuaiujfLD35KcALaZxeiihoUJWsFtta6idjeQweQ32sDuKxpb64kJkSbaa8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5TK1Cr6cyZBz/8tHCNeIu3qRpADZlyHuD48/pcycrji86Exv4
	YA8R7BpDMXEOQS/mO38P3BqddZmZ82tw+emGykSWMlaoPgst9w5CiMSTPVEQJGm+3w==
X-Gm-Gg: ASbGncsepQme/wjEhnBVXmN5uG4b6LmG3GNQ69Q3grLRlT07hH1nd1zCuUohh4LWONJ
	XPlrFfXxWuleVf9M80b73R6vkIpSp8lWgBPpEtz+iNHGT17h750l8GSwbTfKzBhnXXhayR3RED0
	tKEl9v71HKVrcQI1gwM4Ko5Jg6OV/dsat2D6FDVPK8wA87VlVauG+mlkVY6cGbh4et2TcLA4QSi
	J3lCd9RqyK61MmNrZHVGqnHEerYLFidmoDyrhwIO/xzoGPtC5TaSFqMLVZbDK5xwQ8aHLucxXP8
	aMbPyBOcNkompAtPU3ZoOKPDZDYFzFcSCh08MZjDQJV7MkzVDv1YX3oDPFygBDHSFDqFIgVqXoS
	kLTVKWXED1Al3fg++R8yjK0wi7KtYrICwI7LvKyWLeUD+x+U=
X-Google-Smtp-Source: AGHT+IEaWQ+kW/CdH9J4SmVMQMUWyP38GtH3Z1cvnjfiTCKnPKNcEWsZjPALlBNx2TK8ZZx0xd9zVA==
X-Received: by 2002:adf:cf0b:0:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a5220844f3mr2539475f8f.4.1749105073274;
        Wed, 04 Jun 2025 23:31:13 -0700 (PDT)
Message-ID: <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com>
Date: Thu, 5 Jun 2025 08:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule 21.16.
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <20250604233537.2892206-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20250604233537.2892206-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 01:35, Stefano Stabellini wrote:
> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 
> MISRA C Rule 21.16 states the following: "The pointer arguments to
> the Standard Library function `memcmp' shall point to either a pointer
> type, an essentially signed type, an essentially unsigned type, an
> essentially Boolean type or an essentially enum type".
> 
> Comparing string literals with char arrays is more appropriately
> done via strncmp.

More appropriately - maybe. Yet less efficiently. IOW I view ...

> No functional change.

... this as at the edge of not being true.

> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Missing your own S-o-b.

Also (nit) may I ask that you drop the full stop from the patch subject?

> --- a/xen/arch/x86/dmi_scan.c
> +++ b/xen/arch/x86/dmi_scan.c
> @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios, const void *smbios3)
>  	const struct smbios_eps *eps = smbios;
>  	const struct smbios3_eps *eps3 = smbios3;
>  
> -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
> +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&

Unlike the last example given in the doc, this does not pose the risk of
false "not equal" returns. Considering there's no example there exactly
matching this situation, I'm not convinced a change is actually needed.
(Applies to all other changes here, too.)

> @@ -302,7 +302,7 @@ const char *__init dmi_get_table(paddr_t *base, u32 *len)
>  				continue;
>  			memcpy_fromio(&eps.dmi + 1, q + sizeof(eps.dmi),
>  			              sizeof(eps.smbios3) - sizeof(eps.dmi));
> -			if (!memcmp(eps.smbios3.anchor, "_SM3_", 5) &&
> +			if (strncmp(eps.smbios3.anchor, "_SM3_", 5) == 0 &&

Here and below there's a further (style) change, moving from ! to "== 0"
(or from implicit boolean to "!= 0"). As we use the original style in many
other places, some justification for this extra change would be needed in
the description (or these extra adjustments be dropped).

> @@ -720,10 +720,10 @@ static void __init efi_check_config(void)
>  	__set_fixmap(FIX_EFI_MPF, PFN_DOWN(efi.mps), __PAGE_HYPERVISOR);
>  	mpf = fix_to_virt(FIX_EFI_MPF) + ((long)efi.mps & (PAGE_SIZE-1));
>  
> -	if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
> -	    mpf->mpf_length == 1 &&
> -	    mpf_checksum((void *)mpf, 16) &&
> -	    (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
> +	if (strncmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
> +            mpf->mpf_length == 1 &&
> +            mpf_checksum((void *)mpf, 16) &&
> +            (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
>  		smp_found_config = true;
>  		printk(KERN_INFO "SMP MP-table at %08lx\n", efi.mps);
>  		mpf_found = mpf;

There are extra (indentation) changes here which ought to be dropped.

Jan

