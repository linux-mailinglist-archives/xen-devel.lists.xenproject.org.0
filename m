Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603B81A163
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658069.1027127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxqS-0000Wl-Oe; Wed, 20 Dec 2023 14:46:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658069.1027127; Wed, 20 Dec 2023 14:46:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxqS-0000UX-M8; Wed, 20 Dec 2023 14:46:48 +0000
Received: by outflank-mailman (input) for mailman id 658069;
 Wed, 20 Dec 2023 14:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WYL=H7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rFxqQ-0000UR-SM
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:46:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 981ed9c0-9f46-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:46:44 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so5194715e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:46:44 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05600c1c8200b0040b3867a297sm7580923wms.36.2023.12.20.06.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 06:46:43 -0800 (PST)
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
X-Inumbo-ID: 981ed9c0-9f46-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703083604; x=1703688404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCADpb5MmkweT3Y+4qHiQv9EpgLHTecFUIfC5rF9w80=;
        b=wSrmXnRne1WbDMZFQuQc5w8t/dE3bAa2yPOHB6cQ2t6DAfIvDioq8re8bepawnQG1d
         xxjZiIoDzxlVwi3Y9gnjNQfUJqgTmSvfkW2HewKM3UhNYIB4okfBKjf6SL/d0PlIeCOj
         4glrRlN4Ocfy5qftxRJ5pv62bW1kMNpgBtiEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703083604; x=1703688404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCADpb5MmkweT3Y+4qHiQv9EpgLHTecFUIfC5rF9w80=;
        b=K4U7Tlzd+0Z5eUXKpA+L0SXy79qT9PRHrhBi4NoK7JzJtJj1dooJuAtjwGmJKolDao
         HmstpilSOO8Yz3gP38nF2K3PoTQ6NtaoZTYNKapilyGiIGuvosyB6HeFNxSAgSdP10m/
         Ddec999LKev2qwm+0UcvUvEBlysdeFtm+wNHfXUh8XXk/sM1tHmf6I6PjOgdDyqWMKyl
         08CV3MB+AINXh3UW0EyI/2KKtaeHOD9SAlzTouQopBFGpzOfSA3U1JyGpv56eDYUp5MT
         Z+V8fU4kkCeHjDl1H+LkBrpibSAkIvA35y2lDLMOTgaeM2lIXvrF5vW9E81AofrupggS
         5l6g==
X-Gm-Message-State: AOJu0YxAvb5GzwLWjOgnINSojiCvMR0CNTRbvuZPb+NRRuKzEhRdgidz
	/1XKzHwxrI1l5LtfW9C94yZx2g==
X-Google-Smtp-Source: AGHT+IH4NKX4tOkpqV1DGu/fSr91vrvpwrCRe0Cg3dSC/b7zzNcjEVTig0OIK7T3bOMwMBQa/fuFww==
X-Received: by 2002:a05:600c:520a:b0:40d:2b27:4ffd with SMTP id fb10-20020a05600c520a00b0040d2b274ffdmr1319419wmb.70.1703083603909;
        Wed, 20 Dec 2023 06:46:43 -0800 (PST)
Message-ID: <ffb3445f-fd50-4746-9f70-272ea52271ec@citrix.com>
Date: Wed, 20 Dec 2023 14:46:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: extend CPU errata #1474 affected models
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20231220142218.22850-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231220142218.22850-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2023 2:22 pm, Roger Pau Monne wrote:
> Errata #1474 does also affect models from family 17h ranges 00-2Fh, so the
> errata now covers all the models released under Family 17h (Zen, Zen+ and
> Zen2).

Perhaps "has now been extended to cover models from ..." ?

> Additionally extend the workaround to Family 18h (Hygon), since it's based on
> the Zen architecture and very likely affected.
>
> Rename all the zen2 related symbols to plain zen, since the errata doesn't
> exclusively affect Zen2 anymore.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for doing this.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I was going to suggest linking to an example revision guide but I see
the AMD website is still broken.

> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 0f305312ff2a..099646dc3994 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -54,7 +54,7 @@ bool __read_mostly amd_acpi_c1e_quirk;
>  bool __ro_after_init amd_legacy_ssbd;
>  bool __initdata amd_virt_spec_ctrl;
>  
> -static bool __read_mostly zen2_c6_disabled;
> +static bool __read_mostly zen_c6_disabled;

amd_1474_c6_disable ?

That's about as general as I can make it, without losing precision.


>  
>  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
>  				 unsigned int *hi)
> @@ -978,24 +978,24 @@ void amd_check_zenbleed(void)
>  		       val & chickenbit ? "chickenbit" : "microcode");
>  }
>  
> -static void cf_check zen2_disable_c6(void *arg)
> +static void cf_check zen_disable_c6(void *arg)

fam17_disable_c6() ?  I know Hygon is 0x18 but it's also reasonably well
know to be the same uarch.

This particular algorithm is good for all Fam17 uarches, irrespective of
#1474, even if they happen to be the same set of CPUs in practice.

~Andrew

