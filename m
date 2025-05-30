Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6EBAC91B0
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 16:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001330.1381519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0ri-0003T0-Bt; Fri, 30 May 2025 14:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001330.1381519; Fri, 30 May 2025 14:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL0ri-0003RL-7V; Fri, 30 May 2025 14:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1001330;
 Fri, 30 May 2025 14:37:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMCM=YO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uL0rg-0003RE-KM
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 14:37:44 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a54ea5ea-3d63-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 16:37:43 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a363d15c64so1419021f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 07:37:43 -0700 (PDT)
Received: from [10.81.43.171] ([46.149.103.15])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d800671csm19708385e9.30.2025.05.30.07.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 07:37:42 -0700 (PDT)
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
X-Inumbo-ID: a54ea5ea-3d63-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748615863; x=1749220663; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4NVacMHC7XtpveJzs3ER6JEJKeVbCO25yrq7om+VxTQ=;
        b=rxx+6ncHIRcIw5fOjbFvLkG6odOFhq2eSpa5EI3mtFN8eGZ9V3IVNkg2gLaa/qGuSd
         9o7zUYB35OtOHA4PEIKwiMy0LH3anLkxncd6k/9B5HJmPay37JqoCCEKSYXZW71DqmkN
         Wpa+pBuwjlVDb6/ZRNsx0jUlDrhAq7z+XMXPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615863; x=1749220663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NVacMHC7XtpveJzs3ER6JEJKeVbCO25yrq7om+VxTQ=;
        b=K5N+ZdrW+9EinTW+Bn8qyJhI4+QLhc+Rk0XS1IzAxp+hp5OVu5CcgDXwoCZwXnotUA
         8ajl8BIoIrKQyYQj3iNN5/QnYreSD1nbtAOo+ZP6xw4LSSce3VHSxO9pucpwZEV1FGrt
         +TqMXR/PYnz4rmyA5Pxf+SeuqHZuxRsWJdp/oFBmcXhHOGq7ECwXk6DdC/NWr0hT6FBn
         9JKx1O2l2f8bX+1+t9ERpwnM/lsV++K3XJWogLBknshnfV8Oe4uRhAQ1kWVIjPXTQ7bI
         FdDvoF7IO5tlvj486Dg4iOGhOUJ+E0VoTvM5asXQssR+LsVlIOiXLjrwlSmYn7vlA9j0
         OC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6b9VlyUqNzrUKYZNl0Xx+q5m5VsrMarjDFt+y5V+pJQhw0DVVVvMsLvzFZBVxPeNAfk0lKj2QKeU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLtBBH1nE/zlgJPpyae2DhgJh3umGSW6wJIxjtkbPLwR0m76os
	j0nvCRL1SZirVKieGTBJ2lFvxxb3xplns+ZKP8AW9Nq1NLMl6AyKtLE6E8ppFGjjhsE=
X-Gm-Gg: ASbGnctY8Yj3zzWUsZgkZy/4h1OYlXuqbL0SMFjI6sAYMWLXiaI9O5jYgRpRfKkPaic
	fvSTG9B8IkPVJKOSQuSMZqd2id89y0jcp16PcDn7Aan2WgPvMFyMM3+D23i2LAAWFT2wzc2zq1H
	qB2qk62x6nRx4bkb/Hps/p9xp0Yxb3lKY+GxWWnSuXl4PZkF+4gPipXZf0vw2BXdfKtJc3A/Y56
	eSyo9dSLMfzLY+1YxVBHTk9Yr9CDJFnzAQrlxAxNibNe2iOciT0Ta7bZtOfF1P+XVM5bY8lS3kF
	3AKF3MYSwy97P/ynkDH1j5FQonOYtcT/Ld3h+pXYN8Gex8fxgC4JIvP9WJ+n0f6UhX0ZLgrw
X-Google-Smtp-Source: AGHT+IGhS9K7lReOHQKB4rKYAdvxg5bV8/hF2jakaiSIumrm9CclyME5tlf/79Ty8m+DMrwCNQngNw==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:f786:acc8 with SMTP id ffacd0b85a97d-3a4f7a023admr2814064f8f.7.1748615862797;
        Fri, 30 May 2025 07:37:42 -0700 (PDT)
Message-ID: <b3c1b3dc-2faa-4f01-82c6-b33cac6ca163@citrix.com>
Date: Fri, 30 May 2025 15:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Move svm_domain structure to svm.h
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <f55cf69b228e77b736fe1969515cf561e3967d46.1748595000.git.teddy.astie@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f55cf69b228e77b736fe1969515cf561e3967d46.1748595000.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2025 9:53 am, Teddy Astie wrote:
> struct svm_domain was in vmcb.h which is meant for VMCB specific operations and
> constants, move it to svm.h where it belongs.
>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/include/asm/hvm/domain.h   |  1 +
>  xen/arch/x86/include/asm/hvm/svm/svm.h  | 11 +++++++++++
>  xen/arch/x86/include/asm/hvm/svm/vmcb.h | 11 -----------
>  3 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> index 333501d5f2..2608bcfad2 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -16,6 +16,7 @@
>  #include <asm/hvm/io.h>
>  #include <asm/hvm/vmx/vmcs.h>
>  #include <asm/hvm/svm/vmcb.h>
> +#include <asm/hvm/svm/svm.h>
>  

I agree the headers aren't laid out well, but this isn't great either.

You're now including svm.h in ~all translation units, because
~everything includes sched.h and sched.h includes these.

In some copious free time, what we need to do is split $foo-types.h out
of current headers so we can avoid including most of these headers in
most TUs in Xen.  But that's a huge effort.

>  #ifdef CONFIG_MEM_SHARING
>  struct mem_sharing_domain
> diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
> index 4eeeb25da9..32f6e48e30 100644
> --- a/xen/arch/x86/include/asm/hvm/svm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
> @@ -21,6 +21,17 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
>                     unsigned long fs_base, unsigned long gs_base,
>                     unsigned long gs_shadow);
>  
> +struct svm_domain {
> +    /* OSVW MSRs */
> +    union {
> +        uint64_t raw[2];
> +        struct {
> +            uint64_t length;
> +            uint64_t status;
> +        };
> +    } osvw;
> +};
> +

Honestly, I'm tempted to just drop OSVW.

It's a legacy AMD facility which predates the Zen/EPYC days, which isn't
even available to guests (because it was broken when I came to do some
remedial fixes, and there's still been no work to put it into suitably
into the migrate stream).

Right now, I'm pretty confident that guests will uniformly get #GP
accessing the MSRs, and there's no way to configure visibility.

~Andrew

