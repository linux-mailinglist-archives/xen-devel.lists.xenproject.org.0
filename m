Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910EB7C7B86
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 04:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616236.958106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr7hW-0005HF-8s; Fri, 13 Oct 2023 02:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616236.958106; Fri, 13 Oct 2023 02:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr7hW-0005F4-5O; Fri, 13 Oct 2023 02:14:54 +0000
Received: by outflank-mailman (input) for mailman id 616236;
 Fri, 13 Oct 2023 02:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfqf=F3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qr7hU-0005Ey-M2
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 02:14:52 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a862790-696e-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 04:14:51 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50567477b29so2153320e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 19:14:51 -0700 (PDT)
Received: from [10.157.20.243] ([103.14.252.248])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a170902a5c500b001ae0152d280sm2640618plq.193.2023.10.12.19.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 19:14:50 -0700 (PDT)
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
X-Inumbo-ID: 4a862790-696e-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697163291; x=1697768091; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m5YvkI3/K5l45PWFbsw3hsiaMoJ2HBBKjP22fAYw1ck=;
        b=KTGMOkHSojBEG4i5+6qXjz3ojKT/ubUyUh6Msic90fbWmE5/6k8OzGhK0IvMUtg4Cb
         SyZNNfeP7F9FGDH+3selY/i3P/JIJZu0FQ13ThAg8OBZypC7B0wv7+czCShJaBVaxBhZ
         fRAHB4W9JKk1FAt9MT4CNA/dN4mSGqoFBs9/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697163291; x=1697768091;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5YvkI3/K5l45PWFbsw3hsiaMoJ2HBBKjP22fAYw1ck=;
        b=H8XLolxztjYna9l4vkYauP/BxFPiOgvRtlyC5jXQdem2C4nhjDWomOuW1Ogj8pQLbw
         5w+6t6dMHEQUVGqbJM43RvvcLXBRxBD9RbAUi/sfFIqe4KgTExjMitHo13eiMyrBvXr1
         yjKvL6ceFyfKH4ZmhkOB2k5qRcrmU54GFSHmENKXL3wmaDuIOfb8w5v7a4W3PARgVG9p
         EG989o4sZgf6w+KvQ3Z7FD3S+9btMpnnxr5ZuSmMP5Itbmgb2af3CiQ6tT/Zf9Gz9T4V
         lNWWjLIKyBNsMO/tgtC8aU6miqNRlyOdlVNlctUlI1mS7JRJnOQ+4gWyNrS6twkZOb/A
         fTcA==
X-Gm-Message-State: AOJu0YyN7WX/JZNEAFOp4BNY2MSnDbPiHD77wLl6Xhg3V/0N2pIkkvep
	nOCxpUhEFBeKLe4NuwXv5WzfHA==
X-Google-Smtp-Source: AGHT+IEpUSeCDUKTdo1C35effx5/EpBbW+e0qqxStjIU0Hss/tceEQZhcUVGelvqORfDy94679IO7Q==
X-Received: by 2002:ac2:5a5a:0:b0:500:9ab8:b790 with SMTP id r26-20020ac25a5a000000b005009ab8b790mr19955255lfn.60.1697163290786;
        Thu, 12 Oct 2023 19:14:50 -0700 (PDT)
Message-ID: <06c4df56-8118-4f11-843a-7e4ae81f2464@citrix.com>
Date: Fri, 13 Oct 2023 10:14:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [for-4.18][PATCH 1/2] xen/x86: Add family guards to the
 is_zen[12]_uarch() macros
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
References: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
 <20231012172601.22600-2-alejandro.vallejo@cloud.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231012172601.22600-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/10/2023 1:26 am, Alejandro Vallejo wrote:
> It slightly simplifies the code that uses them at no real cost because the
> code is very rarely executed. This makes it harder to confuse zen uarches
> due to missing or mistaken family checks.

I'm afraid I disagree.

It's bogus to do a family check without a vendor check.  By making this
change, you're separating (spatially in code, and therefore cognitively)
the two checks that it's important to be able to cross-check.

> diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
> index d862cb7972..5a40bcc2ba 100644
> --- a/xen/arch/x86/include/asm/amd.h
> +++ b/xen/arch/x86/include/asm/amd.h
> @@ -145,11 +145,12 @@
>   * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
>   * as a heuristic that distinguishes the two.
>   *
> - * The caller is required to perform the appropriate vendor/family checks
> - * first.
> + * The caller is required to perform the appropriate vendor check first.
>   */
> -#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
> -#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
> +#define is_zen1_uarch() ((boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) && \
> +                         !boot_cpu_has(X86_FEATURE_AMD_STIBP))
> +#define is_zen2_uarch() (boot_cpu_data.x86 == 0x17 && \
> +                         boot_cpu_has(X86_FEATURE_AMD_STIBP))

What leads you to believe there aren't Hygon Zen2's ?

~Andrew

