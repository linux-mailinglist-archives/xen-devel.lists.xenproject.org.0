Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E239B14F9C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 16:54:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062817.1428557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglin-0006rs-52; Tue, 29 Jul 2025 14:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062817.1428557; Tue, 29 Jul 2025 14:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uglin-0006qI-2Q; Tue, 29 Jul 2025 14:54:29 +0000
Received: by outflank-mailman (input) for mailman id 1062817;
 Tue, 29 Jul 2025 14:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/H3U=2K=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uglil-0006qC-GW
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 14:54:27 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebf8b224-6c8b-11f0-a31f-13f23c93f187;
 Tue, 29 Jul 2025 16:54:26 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b791736d12so566772f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 07:54:26 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4588d89c50fsm20978555e9.0.2025.07.29.07.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:54:25 -0700 (PDT)
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
X-Inumbo-ID: ebf8b224-6c8b-11f0-a31f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753800866; x=1754405666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EdrAXDkKu+XhvfDr21t7aYHLqegfW18EJ7XAxuKhcJw=;
        b=TxiPAKT2f4/TLsk2Of2JdzwPpKXn+MtX1B/9k5gVmLHRodhwh2A6pvdLb+CbmEoJNz
         xgfb2nUpOG6tVBPB+ux58MeyqGxT9e8x3p3PXWkYPED8rpUZ/ll5iBn7EO1clMAyGw6D
         Wy7sgdrNUGXBPs2HS4ic2wWUx0POCkrX0PYo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753800866; x=1754405666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdrAXDkKu+XhvfDr21t7aYHLqegfW18EJ7XAxuKhcJw=;
        b=wGwjMfQEGoupX/DPBXue4W/r4kWQ1KH/mkfcltjx5fm0A1PQiAGMJSwVy+fiPsbtH4
         +KbYwOJYhkOrIWxk5/QcXKGzR3Tm4sBJFlFesXMH3ew7MiIN8FztTBS4OQP12hoGWYh2
         MT4E6cXogc32VDMQUqKunZqq22Px0vk05z+RreybV9AxdYa9fF/jklhOTsKTjV1M5iWF
         b2Mz+3FhGVCIXyFVM9ZCyceMu8/TlFFZkDIBTjhcC3lemu2LK17KRdt+rBPUZoqcz5Ud
         zJF1jxjIN4biBuURY7M8F3Fthl3vK3Y3GdmLBzcPUKLc1FHS3Hw9FeF9Q4Ph1PwnmWJz
         OAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFQTJmQGpcAqDJ+sJk7dy2sHuHmA5sE6ZPc1aGx980DQ2Qz64qj2pZZb7EQRR71p8scx6I4Y4J3gw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUUQcQ74aoYM8e+9Unb/KALcsagayLlCKxmAZn+pAicE4gGs9X
	lHhUasnsqaFP9c45/YuMWl9gATiRQVXoRCqEfLaYI/H5SuMPRrGeK0WdscUrIrV+a/A=
X-Gm-Gg: ASbGncvHzI3msgI8cGgTAL3r8ekOL9umos6nrPgMrJK6N0+rE0SE6I6Vtrgc0nOCX9Z
	RLhqkP22khI6H6bRllOZ3OD1DdKfu8HToW/BLkzzTq3ojqKsexK4Z2vr8+xCzWUU+J30bAzSTG9
	wGG7EGt4yMO/Khs9WUQODGlPQtQJ2eAinp7IZpbqLhcF6CHXkGaSrv9xkBRYyfolyZlUPxNaB7t
	iDCRwnjXbd7nA/MK+qfHGY6AvTNSReTG+jZ0j7l/rX86XFT0VS2HvWPPRMKX7LZhvJFcWImFxYn
	OCbZ3pUmtZSx7OjLVMyfuVSNspOsR6H43Y/lfRl7QvPgZFo9xst7PJdvyqPTupF2VCCwJ/TbuPM
	I5EB4eI9BylvkhsRvUiuQ305xs8yB2Psg7OWd6Ca4MpzAUNxcckg+77KvorFTYa69AJmL
X-Google-Smtp-Source: AGHT+IEx8rBQ1SR9yLBJ63usNpGLwqJIuXRgHBHuVqgbnoiUB7Y+T52m9dWLPUM9GaohL+dU/R7tnw==
X-Received: by 2002:a05:6000:2305:b0:3b7:8c98:2f4c with SMTP id ffacd0b85a97d-3b78c98316cmr4438829f8f.33.1753800865810;
        Tue, 29 Jul 2025 07:54:25 -0700 (PDT)
Message-ID: <4a051d46-d2f9-4dd7-9927-146834054579@citrix.com>
Date: Tue, 29 Jul 2025 15:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] pdx: allow per-arch optimization of PDX conversion
 helpers
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-5-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250724110416.2081-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/07/2025 12:04 pm, Roger Pau Monne wrote:
> diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
> index 4565baca6a4d..cec13c889dab 100644
> --- a/xen/arch/arm/include/asm/Makefile
> +++ b/xen/arch/arm/include/asm/Makefile
> @@ -5,6 +5,7 @@ generic-y += hardirq.h
>  generic-y += iocap.h
>  generic-y += irq-dt.h
>  generic-y += paging.h
> +generic-y += pdx.h
>  generic-y += percpu.h
>  generic-y += random.h
>  generic-y += softirq.h

Please could I talk you into using __has_include__, as I'm slowly trying
to purge asm-generic.

> diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> index 10153da98bf1..91fc32370f21 100644
> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -159,6 +159,14 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
>  
>  #endif /* CONFIG_PDX_MASK_COMPRESSION */
>  
> +/*
> + * Allow each architecture to define it's (possibly optimized) versions of the
> + * translation functions.
> + *
> + * Do not use _xlate suffixed functions, always use the non _xlate variants.
> + */
> +#include <asm/pdx.h>
> +

You want:

#if __has_include__(<asm/pdx.h>)
# include <asm/pdx.h>
#else

// common defaults.

#endif

here.  This lets you implement the x86 special case only, and keeps all
the common logic in one file.

~Andrew

