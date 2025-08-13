Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA99B2497F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 14:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079835.1440523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAbE-0001k4-7I; Wed, 13 Aug 2025 12:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079835.1440523; Wed, 13 Aug 2025 12:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umAbE-0001hz-4c; Wed, 13 Aug 2025 12:29:00 +0000
Received: by outflank-mailman (input) for mailman id 1079835;
 Wed, 13 Aug 2025 12:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umAbD-0001ht-B9
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 12:28:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15a6ffc5-7841-11f0-a328-13f23c93f187;
 Wed, 13 Aug 2025 14:28:58 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a16e52e54so4609595e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 05:28:58 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1a53905asm916005e9.22.2025.08.13.05.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 05:28:56 -0700 (PDT)
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
X-Inumbo-ID: 15a6ffc5-7841-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755088137; x=1755692937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kspBEk2ejV6PU0W2SBmovNS8ntq174ozRTD+odW8AWI=;
        b=aX8xSWwbnViQbecrrg5RPwH0PGJwFjdaTxAlq9Nc4GmWiissnFNoyp6QO6qGi9wKSc
         1SLbUZh8yM5PmEqqLtTICBF/v600syYiEjE4+o+/NEhNznGfaNjqJE9hAB/QMMtl1xyl
         +GLqdhEVDw6Sf66GAjY4l/TjRDSM+T2V9IIXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755088137; x=1755692937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kspBEk2ejV6PU0W2SBmovNS8ntq174ozRTD+odW8AWI=;
        b=SHP9hhJWjZWxU4mfFDiHPqE2+EWd/hRgpGHFoMj437B1jUULVxlKY4jmrYZOvlooan
         Xdh6iCqqMv7HLQkOW9o8ZHsZ+Wsv/PR75ViztoTXaITVzI5c1e7oESpxYHZADTcmjJrD
         4XqFZPvepAoiTSsict/F+fho2EsQp97+Cyym1WvfAuTwdENILQ9eVMC/kb1Rbj5MXGlI
         LYrhFtFxaKkrHgsqEUD1pgcHx4u7VHWGbXTNrB2dA/JxpUqmpXzCegO8mOpToJM4ez3L
         3ysHW53qYPSkMzJAtfGlo2NbvOv9maXyJcACr+amgmZcv/EtGkPkbQ+nxh54p5tSUz+C
         PAZA==
X-Gm-Message-State: AOJu0YyqRNL8mTLX5Mb5jj32xVEbgrXV9RnDk868IbkzUPsjg0rNTF4p
	ewZ5iZ17RQusm97UolJngVpRbmit+8ucvA4w3tZ/Rl2ce1Nz544laGIJ3udT4qzofu+cAxDIXu6
	1ccdS
X-Gm-Gg: ASbGnctkKNLpVyrorsRZlgJqmveHvXYWpM6yok/t/mqdC4oeGOjlA/Ko+HXHjKw+IpZ
	i7JHrg4HPEPfTUxEe4q9n8lwSFsufPVggYlqEbdws4NVc/ub2bSIbIFn0yIvZ/jA2JaftwEjLSW
	bjF2M1ocvgkh0fb0tc5M9aTSQ92xpUO20Lz6CiWKWxYD9qcCLw6kPdfYLtarKwBeCNtIYvzP8H/
	oIZfaUJtJBXE68bAplpahzFttiteI21hiyr1C2YHgNIID+gD7C686jwZFVHlBrDYLvIHFZTuIxR
	CvJryLxekpH/Bi4wvnwsMxtGVBNk4UcVm9eNKs4m0VXUeNdLkonl6lNpdkPj1QB5YynhDUGIzRS
	Srl5OnLhMxT5B5BjLOvWXnB46qGHkKPCsYTRIw1alKMZ70xp27P2phRtR9deAclMwIf7S
X-Google-Smtp-Source: AGHT+IEMoFJVAD4LwtrpwcZgGbCf8fpx/HI3S9ZOhFx4Yz/UYNgQldbBX20cq2Lm5b4Pn6wt57d6qg==
X-Received: by 2002:a05:600c:35c5:b0:459:d3ce:2cea with SMTP id 5b1f17b1804b1-45a19fc88edmr3650545e9.6.1755088137242;
        Wed, 13 Aug 2025 05:28:57 -0700 (PDT)
Message-ID: <0beb69c9-9286-4780-951a-cc47b9a4624b@citrix.com>
Date: Wed, 13 Aug 2025 13:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250808202314.1045968-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2025 9:23 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index a45ce106e210..90cbad13a7c7 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -57,6 +57,10 @@ config HAS_CC_CET_IBT
>  	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
>  	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)
>  
> +config HAS_AS_FRED
> +	# binutils >= 2.41 or LLVM >= 19
> +	def_bool $(as-instr,eretu;lkgs %ax)
> +
>  menu "Architecture Features"
>  
>  source "arch/x86/Kconfig.cpu"
> diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
> index 61a5faf90446..2e5200b94b82 100644
> --- a/xen/arch/x86/include/asm/asm-defns.h
> +++ b/xen/arch/x86/include/asm/asm-defns.h
> @@ -4,6 +4,15 @@
>      .byte 0x0f, 0x01, 0xfc
>  .endm
>  
> +#ifndef CONFIG_HAS_AS_FRED
> +.macro eretu
> +    .byte 0xf3, 0x0f, 0x01, 0xca
> +.endm
> +.macro erets
> +    .byte 0xf2, 0x0f, 0x01, 0xca
> +.endm
> +#endif

Seeing as I know you are going to be unhappy with the Kconfig...

I think I'm dev complete on the PV support now, and there's not an LKGS
in sight.

We don't strictly need the conditional in asm-defns.h, and if we don't
need it in C either then we can drop the Kconfig entirely.

~Andrew

