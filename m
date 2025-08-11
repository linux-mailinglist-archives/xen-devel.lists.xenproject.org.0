Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1892B1FF6D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 08:38:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076915.1438024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulM9b-0005zN-1N; Mon, 11 Aug 2025 06:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076915.1438024; Mon, 11 Aug 2025 06:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulM9a-0005wT-Ta; Mon, 11 Aug 2025 06:37:06 +0000
Received: by outflank-mailman (input) for mailman id 1076915;
 Mon, 11 Aug 2025 06:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulM9Z-0005wL-9S
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 06:37:05 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 928dd67e-767d-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 08:36:55 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so2067616f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 10 Aug 2025 23:36:55 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e009e465sm30837961f8f.43.2025.08.10.23.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 23:36:53 -0700 (PDT)
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
X-Inumbo-ID: 928dd67e-767d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754894214; x=1755499014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=da6plSrU7tXzWlA0zgg2moTYg2a1oxT5nHXgJraLh08=;
        b=mmfcLsSI0AhKrXTnjFbPGq64bANMMoCskYRmZ4/x4orOnkqtj5gCwdFHKnEnt2q0HL
         kSdqiH8oRCWPRyGuk8fNVBV4Fb8XsdgyhygrvlyG3+MXgjuFExr4G1Z5gOQBIdX/77q/
         VKfKkS5NTAgoMdkOEVYTuQmxZUr3mFFI1+mq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754894214; x=1755499014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=da6plSrU7tXzWlA0zgg2moTYg2a1oxT5nHXgJraLh08=;
        b=pEkoD7DC8pSKEqyYsWEIt+5UDjmGURc1CO1MoB7GRoFtDkXtbkhMuUE3W0mINlAdYq
         XJFZc+a9hXO3/D7POocBO49/JUYP4symq3RYeUcXB4grylXGWZbsRgAge/z/NK3FBR/x
         WWWBHCLz0Y7cTbAaGtOWKzBQdmwDGnbtjOvWDg8I++UDeHIbDUpF8GIcPW4pX9KH5txN
         ABYv0SvVz644mShfnayEwyULOnfQ6v39ulcv/6hr47bV8Mq1eE2MonYSUqkk3w5toTpO
         pYW1oMJtkPpkTZenxVXWNiRu1Lm2XzWczeHTg525HaZXMyI5IOdUvDFDymMElJK9hEZ/
         cZrA==
X-Gm-Message-State: AOJu0YwfNUZYIoCEg535AC3+r5IaVH/7KFOpUV4RYPBE+uzl1FT329IF
	EWGT/OsyDUzyR9fvF0oPY+inpW8NFdv8iS0rBkQ+7RnL+jEr2JR1XSkDzFuxxTXKLFrY6EYlnJ6
	adCK5ROA=
X-Gm-Gg: ASbGnctO1K6edBG1EkYdLeLXE6L2NCLIsYZMJ4BWCnCIn8B8K3zX5cAQQ7dyY0Nedf+
	1jF9SnPud6m5N0wugOgqcVeliYD9rCGLA4POFRgej37aJrRhXRjft2pWpGD2tyAlAmwq8SAfNrk
	aspCso3k7nPrPAhwaWizJkMd/wNkBETVasmQB+SOz0oVy+A8qDU+bHVBi/xq8hmFqichiKvuPpu
	UaSBsUt/gYBaFKM36MRDn2wqOZxGdBjwDykpFKiKkq4IavXSKSm3SHq2vP36VM5HlPbN1+8hPkr
	+F7d5UuSxNgsLoXszW0ZkZXG53toGCQhmd3eSn0pDNZ48aem9PFRoQTHfLnhYp8kC3rnXh2/NIk
	nOsBNZk6INPkhrpMrjuKrkNTSQ4EgcGJZT83JOO71qo7WuhcPSZfFR+6F//gOB0cWfbXs
X-Google-Smtp-Source: AGHT+IE67wkAKEQqwyB8+ailwpG3sfceZbqpcFOqQ17X8wFak8hbEOyXyjnM3yvipSzbiLhuKT7tKw==
X-Received: by 2002:a05:6000:40ce:b0:3b7:c703:ce4 with SMTP id ffacd0b85a97d-3b900b6aad8mr7998590f8f.59.1754894214269;
        Sun, 10 Aug 2025 23:36:54 -0700 (PDT)
Message-ID: <be2b70cc-11ba-4f3a-b0b8-0ead6d14934f@citrix.com>
Date: Mon, 11 Aug 2025 07:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/22] x86/msr: Rename wrmsr_ns() to wrmsrns(), and take
 64bit value
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-3-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250808202314.1045968-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/08/2025 9:22 pm, Andrew Cooper wrote:
> In hindsight, having the wrapper name not be the instruction mnemonic was a
> poor choice.  Also, PKS turns out to be quite rare in wanting a split value.
>
> Switch to using a single 64bit value in preparation for new users.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/include/asm/msr.h      | 4 ++--
>  xen/arch/x86/include/asm/prot-key.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
> index 4c4f18b3a54d..b6b85b04c3fd 100644
> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -39,7 +39,7 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
>  }
>  
>  /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
> -static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
> +static inline void wrmsrns(uint32_t msr, uint64_t val)
>  {
>      /*
>       * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
> @@ -47,7 +47,7 @@ static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
>       */
>      alternative_input(".byte 0x2e; wrmsr",
>                        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
> -                      "c" (msr), "a" (lo), "d" (hi));
> +                      "c" (msr), "a" (val), "d" (val >> 32));
>  }

It turns out this is the case poor code generation for MSR_STAR.

I've adjusted it to:

@@ -39,8 +39,10 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
 }
 
 /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
-static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
+static inline void wrmsrns(uint32_t msr, uint64_t val)
 {
+    uint32_t lo = val, hi = val >> 32;
+
     /*
      * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
      * prefix to avoid a trailing NOP.


which stops the compiler from loading the high half of %rax too.

~Andrew

