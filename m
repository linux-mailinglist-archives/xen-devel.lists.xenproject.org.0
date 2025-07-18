Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B565B0A7C8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 17:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048940.1419139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnDq-0007ND-Nf; Fri, 18 Jul 2025 15:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048940.1419139; Fri, 18 Jul 2025 15:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucnDq-0007K6-Kz; Fri, 18 Jul 2025 15:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1048940;
 Fri, 18 Jul 2025 15:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00bL=Z7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucnDp-0007K0-MR
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 15:42:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be4eff27-63ed-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 17:42:00 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so1289029f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 08:42:00 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca5c8dfsm2188177f8f.82.2025.07.18.08.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 08:41:59 -0700 (PDT)
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
X-Inumbo-ID: be4eff27-63ed-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752853319; x=1753458119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nNGT0Ke96+J7+VsuoZzFtPTUBQajCOseVtWbGSzbsoM=;
        b=AvOv4H0QqcV0HCuqnXpnThKpc7gSvJ/jKvoBa9XQLBaF6rVIEyjE/1CA+LpCJ46x2s
         K+Im4IG0O3edvSvJoS/+DhFuPbHmbuy/E20PHW805SjgG3aSrhKXvpo6Zc07KfzgkbSc
         pUien1tvKDbySU4KudQzD9FddzRu0lGFAeS/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752853319; x=1753458119;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNGT0Ke96+J7+VsuoZzFtPTUBQajCOseVtWbGSzbsoM=;
        b=f62mK80OqOUb2+i2kqSJqEJ9aFA4E1+jKL5ZCcXqA8uevLzUH4DdyoMPikwhc5G299
         DWl9btbsXhYhPR8CSlcSD0+k0QRUhE1+speTcCRdXzVPc4qAKxMfZXVZexZ0Lrdz/UQ/
         Is/35jiMxpuexRqwG1OrBMBQc8v0blyuxgssYhTfhkYSpYnXdWvag8KRUeVnq6wmDDEe
         VDUOiuaWv1l6SkBWKpE4aUUvyWA9OfVHcZc6Ln5vLlE0LZqAhEt8UPd7HMxTplZHrW4U
         hMr4Jc2e1m+WhRtReP2fXRGABslfeJHIevxBl5QUAmmQ+BB5meDMeGAoZj9lfRjV1HrH
         hx8g==
X-Forwarded-Encrypted: i=1; AJvYcCUuqZmLdlvlnPof3Ujehuj7aKvB3LbSQB1IECKpi0CqEgy76KRaGhZM/7RG3pJaYjnwWPu4MTech3s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTN88DQjl/ubAWUsbvYr4TqYhQaloxfVzyMGaF6YWr+7xOiCRV
	lHZN8uRrGDyPWmUMe5gnAd155n5jFxt1+rmp0mbRODufHNul4eLjzDDoK1xw/v21ecg=
X-Gm-Gg: ASbGnctZ3JYKsjsPbhWzIYN0XVUolvEhvJvxZN2Hfrrx+8iR/Q26oQmYkQTt/UAAsa9
	OR7MUppGKEpc90sU5dYuoy8dCv8pHeNgFcd03MpmKsNx6+a8F/FvVThnJl5qeE8mpUTxfU9XZw8
	FqWxiOTGJQV0C85w2B5l71z2F5BhNItiMKo90/n9qpyYdYXGWKbaO+5y2oBNNjpD8/GqsXCKGTI
	pAF1teOjY/BdDSgwvYo3wpCR8GJtt3O+hXYaTHN8KO3XiR81C4+vrCY1NZmDV//YLCQ1lMCg0tF
	UIqAADU/fAW863oIsYGRjkl4ebbB5MKLWlhSUYQjV9f8ZOmFJlgbX3SLFPUJ+1WPndqEoItabkk
	8t0zo2zh9lVYUXQEitbaSESpnRH3fNaY2ml2ahL2YlnLajdaDe78432/wpFQVKRzSS7rxMoste8
	taRYM=
X-Google-Smtp-Source: AGHT+IFLMA+eNjlJbf+xdKxGOOPCanhp+/r20Uz9QuRwM1MovvdYeV0flySGxZJ4I5E4d8d1aYTItQ==
X-Received: by 2002:adf:ca89:0:b0:3b6:162a:8e08 with SMTP id ffacd0b85a97d-3b619ca6691mr2702234f8f.12.1752853319451;
        Fri, 18 Jul 2025 08:41:59 -0700 (PDT)
Message-ID: <47704e30-0f8f-483e-b22e-5cdb767699d5@citrix.com>
Date: Fri, 18 Jul 2025 16:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Don't allow HVM alongside PV_SHIM_EXCLUSIVE
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250718151214.24835-1-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250718151214.24835-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2025 4:12 pm, Alejandro Vallejo wrote:
> Otherwise compile-time errors ensue. It's a nonsensical configuration,
> but it's supriously triggered in randconfig jobs.
>
> Fixes: 8b5b49ceb3d9("x86: don't include domctl and alike in shim-excl...")
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/hvm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index b903764bda..f57a87bca3 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -1,6 +1,7 @@
>  menuconfig HVM
>  	bool "HVM support"
>  	default !PV_SHIM
> +	depends on !PV_SHIM_EXCLUSIVE
>  	select COMPAT
>  	select IOREQ_SERVER
>  	select MEM_ACCESS_ALWAYS_ON

I deeply regret not nacking this originally and blocking the patch you
listed as fixed.

This depends was explicitly reverted in 568f806cba4c because it breaks a
lot of things, notably `make allyesconfig`.

We're going to need to find a different way to fix RANDCONFIG.

~Andrew

