Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13777C7B9C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 04:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616241.958116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr7um-0007IB-D4; Fri, 13 Oct 2023 02:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616241.958116; Fri, 13 Oct 2023 02:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr7um-0007GV-A4; Fri, 13 Oct 2023 02:28:36 +0000
Received: by outflank-mailman (input) for mailman id 616241;
 Fri, 13 Oct 2023 02:28:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqf=F3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qr7uk-0007GJ-BY
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 02:28:34 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 331ab322-6970-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 04:28:31 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so19129151fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 19:28:31 -0700 (PDT)
Received: from [10.157.20.243] ([103.14.252.248])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a62e50e000000b0069319bfed42sm12353803pff.79.2023.10.12.19.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 19:28:30 -0700 (PDT)
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
X-Inumbo-ID: 331ab322-6970-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697164110; x=1697768910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pfJSEG9QOxLLhw2Fw8f8eA9hg3LTBJZJUHREXWYPV4c=;
        b=WOmycWcfoJYR6o26/zZkfxu6niiMbBhx+7z4fgcuh1CpXsm3xwiUkfpACec1hnc9uf
         xVgGVzBbUjn3DSWvGkrTtyZBT2T3ZA0jw9FyYJ+kxFfnOQbd6iBX5czDBGLBfcp3wDSW
         o95YondD0QFMQgFa838IMjEx84AoaXer4C2Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697164110; x=1697768910;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfJSEG9QOxLLhw2Fw8f8eA9hg3LTBJZJUHREXWYPV4c=;
        b=WQQekFWeLG+ZXQvN++u8zPxN4m/bEG7T+TzGP6EOwMSAwujiPc13xOxvcWm7Uk4y9L
         8mwXFO9cYc3OmQNTGpAtn2pQJ04Z7veTQdJNEwa0tY3cXGxOl/gdguQhgFNtN17gdakw
         3iNmdztE2YhQvpd7X741qTmHzwlKGMHRVe6FG/ExlhiuqOaASixCvu/P4PBifOlY+2zF
         FaIdw6WaQTcsSLi0ORAVb1IW0XdWIKy3Wy3gPDGJPecxWXXkDzhRoduQfvziUBP3+QpT
         mUL0UubMyaj1y6W0PqQ3F1Xcf56uN+odeYa2RvYEj8Sb3m9/go3GUXx/2l3tEaQk7SAQ
         oHog==
X-Gm-Message-State: AOJu0YxrdzSsF4u2kw2xV1n41yuYm1SMGW7rxX4v/bjcyD1be1gY0kbc
	LvMMSyFs6oO7ywEGlqNdjYs8lg==
X-Google-Smtp-Source: AGHT+IFgbpC529yGs6bQ8oACsgPE6tkOAGjZHebiPpDqRPPxGiku11ijCdu8ghScphAc+HoitxKpsA==
X-Received: by 2002:a2e:2e15:0:b0:2bc:f439:b5a5 with SMTP id u21-20020a2e2e15000000b002bcf439b5a5mr25152145lju.14.1697164110490;
        Thu, 12 Oct 2023 19:28:30 -0700 (PDT)
Message-ID: <50c3c5da-42d2-4b1b-89b7-d57d28ebb764@citrix.com>
Date: Fri, 13 Oct 2023 10:28:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [for-4.18][PATCH 2/2] x86/amd: Prevent potentially fetching wrong
 instruction bytes on Zen4
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
References: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
 <20231012172601.22600-3-alejandro.vallejo@cloud.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231012172601.22600-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/10/2023 1:26 am, Alejandro Vallejo wrote:
> If Zen4 runs with SMT and without STIBP, then it may corrupt its own code
> stream. This is erratum #1485 in the AMD specs.

I'm afraid this description isn't fully accurate, and I can't elaborate
any further at this juncture.

Just say "address AMD erratum #1485".  When the revision guides do get
published, things will become clearer.

> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 22aa8c0085..2426e4cf15 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -1166,6 +1166,17 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	if (c->x86 == 0x10)
>  		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
>  
> +	/*
> +	 * Erratum #1485: Outdated microcode on Zen4 may cause corruption
> +	 * in the code stream if SMT is enabled and STIBP is not. The fix
> +	 * is cheap, so it's applied irrespective of the loaded microcode.

Again, unfortunately not accurate.  Just link to the erratum here.

> +	 */
> +	if (!cpu_has_hypervisor && is_zen4_uarch()) {
> +		rdmsrl(MSR_AMD64_BP_CFG, value);
> +		wrmsrl(MSR_AMD64_BP_CFG,
> +		       value | AMD64_BP_CFG_SHARED_BTB_FIX);
> +	}
> +
>  	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
>  		opt_allow_unsafe = 1;
>  	else if (opt_allow_unsafe < 0)
> diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
> index 5a40bcc2ba..7d18f7c66b 100644
> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -145,12 +145,20 @@
>   * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
>   * as a heuristic that distinguishes the two.
>   *
> + * Zen3 and Zen4 are easier to spot by model number, but it's still not a
> + * single range. We use AutoIBRS to to discriminate instead, as that's a
> + * Zen4-specific feature.

I'd strongly advise not passing commentary on whether Zen3/4 are easier
or harder to spot.  Just discuss the technical aspect.

> + *
>   * The caller is required to perform the appropriate vendor check first.
>   */
>  #define is_zen1_uarch() ((boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) && \
>                           !boot_cpu_has(X86_FEATURE_AMD_STIBP))
>  #define is_zen2_uarch() (boot_cpu_data.x86 == 0x17 && \
>                           boot_cpu_has(X86_FEATURE_AMD_STIBP))
> +#define is_zen3_uarch() (boot_cpu_data.x86 == 0x19 && \
> +                         !boot_cpu_has(X86_FEATURE_AUTO_IBRS))
> +#define is_zen4_uarch() (boot_cpu_data.x86 == 0x19 && \
> +                         boot_cpu_has(X86_FEATURE_AUTO_IBRS))
>  
>  struct cpuinfo_x86;
>  int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);
> diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
> index 11ffed543a..4437e8a63e 100644
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -403,6 +403,8 @@
>  #define MSR_AMD64_DE_CFG		0xc0011029
>  #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
>  #define MSR_AMD64_EX_CFG		0xc001102c
> +#define MSR_AMD64_BP_CFG		0xc001102e
> +#define AMD64_BP_CFG_SHARED_BTB_FIX	(_AC(1, ULL) << 5)

MSR_AMD64_BP_CFG is fine to have in msr-index.h (it's consistent across
generations), but SHARED_BTB_FIX is not.  It's model specific, so keep
it local to the errata workaround.

LFENCE_SERIALISE was special.  It happened to have always been
consistent, and was retroactively declared to be architectural.

~Andrew

