Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4857CA78BB4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935541.1336926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuyA-0003CM-Sm; Wed, 02 Apr 2025 10:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935541.1336926; Wed, 02 Apr 2025 10:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuyA-0003Au-OC; Wed, 02 Apr 2025 10:05:14 +0000
Received: by outflank-mailman (input) for mailman id 935541;
 Wed, 02 Apr 2025 10:05:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzuy9-0003An-Hi
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:05:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6fda1e1-0fa9-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 12:05:11 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso44442715e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 03:05:11 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb60cc172sm15699195e9.21.2025.04.02.03.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:05:10 -0700 (PDT)
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
X-Inumbo-ID: f6fda1e1-0fa9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743588311; x=1744193111; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0ox6JV0NvXmrbFJj+nazu1SIV6qH4uyBb3294h1tlrQ=;
        b=BnM7SWuOOcOSfIoAxtsbzj8S8hVO+i4J+yh0FRet6ORldcPKbLwWkQRoDUs2LSK+61
         YdVfgeagMnzQRvDrLdwUGLlbgciuwEg0GtqG679et6KDtUEJxWRsoIdYysjxmb9Z506H
         BgnadNxFK7ITFtljaGbLMb7qLGWszdXdYgWwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743588311; x=1744193111;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ox6JV0NvXmrbFJj+nazu1SIV6qH4uyBb3294h1tlrQ=;
        b=GCvYFl0BHn+VsHOFtKKPoC2+JHLZ7bS5QphymZVhwLDOkcznddKduHWVn7qr1j2hDq
         3p+dDFeuoDLoO7NwxOLORve1nE9GhBE1uYVo1IfEyilV/RQfCWaVG7Ri049ylqRO7B7I
         3M7CSz7WdGPZwFjAJ8KHSgCSHcbd480BWq/f3lAI/R+kDlpxicnS/OLFwpSj2D5UIXMV
         u48z00aEZGaenr3LrfnGT8PqIU9Z4S02413OYvx+SDxUVZ+avHxWar4WpNiygVU8mz1c
         F60QpX4FR82igI+IAwWFdHMc/VaweCkWVK9HjNtUeetkVYwz5skFbxM56HsT7GA08cjf
         iQxg==
X-Gm-Message-State: AOJu0Yz/RYUgdxFBqnljpTeEzBOmSGweu6daicVkFLMTCYaTrfLwocqn
	fqQJnWORIWNbE76XWJ8SyVNRufNXLs6fXlNTWKaPBteIoyk2GXMMEOGKgvVTqPZbw4jtBaIHTSv
	AqnI=
X-Gm-Gg: ASbGncuVMuarGZ9TLV2PWlFcHY/OHgYxjweZ9ID6IHyu6SfBcDsahf4goa7X4pSChzy
	k+yAW12y0jCdoFenqSta9lFINzVqfM03J8ckZSTFWsp9OoHcadR/tebBskJ7mkltW+nlvtV51DT
	HiT3uIArq7o9hNxSz/xpbPRYY62tGxZErB+uKv5MSXTfi4odC7wGPgXE19rTV4w/afJyPYmTZDw
	I9/WvtJIxArffxHcgAUApksU94JWYn7scwFY8JAUaqbBepDQvBvjc1M9+SycD0phOIJZrIa7//y
	pCt5o8PLEfUOa1iDdNbWsOyDrGGbrT9mwbp3J0WLKwIwsTe757NDmeb3EFFiX7TtZ8DnaQnK8L9
	lknDIqBnyJw==
X-Google-Smtp-Source: AGHT+IFUUcvFknDh/mmASfovAB76T1166MkgezHkQrWxXYaRw8+RPGoKn7kna22bF70//+6IL0SFiw==
X-Received: by 2002:a05:600c:6a12:b0:43d:fa59:cc8e with SMTP id 5b1f17b1804b1-43dfa59cd01mr103071575e9.32.1743588310727;
        Wed, 02 Apr 2025 03:05:10 -0700 (PDT)
Message-ID: <32e8c022-1564-478b-833f-75f56f4afd45@citrix.com>
Date: Wed, 2 Apr 2025 11:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: Use asm goto() in _vmx_cpu_up()
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, dmkhn@proton.me
References: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
 <20250402095621.1278093-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250402095621.1278093-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2025 10:56 am, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 0ba65becec1e..8e99e6f73062 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -785,6 +770,23 @@ static int _vmx_cpu_up(bool bsp)
>      vmx_pi_per_cpu_init(cpu);
>  
>      return 0;
> +
> + vmxon_fault:
> +    if ( bios_locked &&
> +         test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) &&
> +         (!(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX) ||
> +          !(eax & IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX)) )
> +    {
> +        printk("CPU%d: VMXON failed: perhaps because of TXT settings "
> +               "in your BIOS configuration?\n", cpu);
> +        printk(" --> Disable TXT in your BIOS unless using a secure "
> +               "bootloader.\n");

Oh, I should remove the line splits, and put in some XENLOG_*.

~Andrew

