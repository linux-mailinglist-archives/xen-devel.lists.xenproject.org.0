Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF479848B9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 17:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803075.1213492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7UT-00051n-1b; Tue, 24 Sep 2024 15:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803075.1213492; Tue, 24 Sep 2024 15:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st7US-0004zS-Uu; Tue, 24 Sep 2024 15:30:12 +0000
Received: by outflank-mailman (input) for mailman id 803075;
 Tue, 24 Sep 2024 15:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st7UR-0004zM-Gz
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 15:30:11 +0000
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [2a00:1450:4864:20::543])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e227514b-7a89-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 17:30:09 +0200 (CEST)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-5c3d2f9f896so7890492a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 08:30:09 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f78a1sm94408466b.161.2024.09.24.08.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 08:30:08 -0700 (PDT)
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
X-Inumbo-ID: e227514b-7a89-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727191809; x=1727796609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LUifuIj9lY+xOrtIDO1T2CmFuBK98cZvAY8FMWixn+k=;
        b=Tv0y/7GhodCk9xMY2+bFE45emuqMAA9IDhBRtjmaX609caCxHV721Dxon90uphssUI
         qyJQuWnnrGYaMTa7Pu6MtwBgx4IF4rMoWuv3cMGcd6QxSqygUsoLVHZkeAh6pN9UUTER
         2PTEXpMH5OqL39ostzRZRoZRt/KtET+OhMyZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727191809; x=1727796609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUifuIj9lY+xOrtIDO1T2CmFuBK98cZvAY8FMWixn+k=;
        b=xIF+f/5SI10ITTwOqW7sTQHQb5a8mpCRfGCYwTUImvwqnCnftd8vEBKhHkdtYrDJru
         u5CwT2HVyIt6d1TNLJMXuIY5heD9c+E0oAqTizaN6cFnMnH4/lT3ON24yZQ8LYI32WDv
         ij11WqZ9j43W7G5+nM4+l9fCvvf+BSznSLgaOH3eU8d645/iwDhaEmYQLZS8LYUrh0k/
         QWAB9l6moH55R5e8EpZoNFWfStUBxsUTDKlrennLNIQ7w9mfC7P6o/sNsdwKcSZrPUZw
         8Z8YY+ZexGFCQhCgZnhfEoWfwbm2XVOuOC0+8+cvfMZoO4g/4xXav2ykiicqBCdn3XX5
         tONg==
X-Forwarded-Encrypted: i=1; AJvYcCUAktyY1yoiwaZHJcJZZwdcjYEFzNHIUmKksCBkMvU1Cw1GSpl0fYVdaCweRGBRAeeaKWGFQQJ2jWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDbxVoikq4adhdwGFgKXDqt5eIHdNq1vby6GCEdesT12i0KZvp
	hWMLbHe6gGD5sjinaBFzkwfIxx0mcUQ4f/vFr+lZbsl86HpLJhyM3W8bY342ssk=
X-Google-Smtp-Source: AGHT+IGFpL4pLckZ1ZQL9gF4vVXaKsvvo52n9To3mxeZT8qDVD4msLsv2PalEwUjyVQu5QYzHbjM8A==
X-Received: by 2002:a17:907:7ea9:b0:a8a:7027:c015 with SMTP id a640c23a62f3a-a90d5153cefmr1604270366b.56.1727191809002;
        Tue, 24 Sep 2024 08:30:09 -0700 (PDT)
Message-ID: <b1fb6bd0-c13c-4ff0-a71e-08e1f63d31ba@citrix.com>
Date: Tue, 24 Sep 2024 16:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
To: Matthew Barnes <matthew.barnes@cloud.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/09/2024 3:35 pm, Matthew Barnes wrote:
> With the introduction of mixed x2APIC mode (using cluster addressing for
> IPIs and physical for external interrupts) the use of pure cluster mode
> doesn't have any benefit.
>
> Remove the mode itself, leaving only the code required for logical
> addressing when sending IPIs.
>
> Implements: https://gitlab.com/xen-project/xen/-/issues/189
>
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> ---
>  CHANGELOG.md                      |  1 +
>  docs/misc/xen-command-line.pandoc |  4 +--
>  xen/arch/x86/Kconfig              | 12 --------
>  xen/arch/x86/genapic/x2apic.c     | 50 +++----------------------------
>  4 files changed, 7 insertions(+), 60 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 26e7d8dd2ac4..335e98b2e1a7 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Changed
>   - On x86:
>     - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
> +   - Remove x2APIC cluster mode, leaving only physical and mixed modes.
>  
>  ### Added
>  

There's a removed section just below this, which this line ought to be in.

Also, it's cluster mode for external interrupts.  The "external
interrupts" bit is what distinguishes it from mixed mode.

Can fix both on commit too.

~Andrew

