Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B523A98A99
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964706.1355428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZuT-0002u1-HE; Wed, 23 Apr 2025 13:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964706.1355428; Wed, 23 Apr 2025 13:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZuT-0002ru-Dh; Wed, 23 Apr 2025 13:13:05 +0000
Received: by outflank-mailman (input) for mailman id 964706;
 Wed, 23 Apr 2025 13:13:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7ZuS-0002ro-EN
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:13:04 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id affdc282-2044-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 15:13:03 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso48761045e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 06:13:03 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43bf20sm18505613f8f.48.2025.04.23.06.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:13:02 -0700 (PDT)
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
X-Inumbo-ID: affdc282-2044-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745413983; x=1746018783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vh2t5anhA6iDwOVHR1VzV29nAr/+XXvkWZl05lyvl9I=;
        b=YjwHVZD8qlqY8+X1XCjkug8KE2dheR8bgt/Rpx0jgN9Con8sGMzDmWIyr7fcMwbLJP
         ATOjgxBU6dCTsCR9uuSMdtOT0k7IidQmQ8/bs3Z9B+qnwDOk5Cyhj3N/QCzn79R/c7R9
         3dD93QZ9x68kOSf7Gz1sC0TL8GnhmmX+81x4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413983; x=1746018783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh2t5anhA6iDwOVHR1VzV29nAr/+XXvkWZl05lyvl9I=;
        b=e8EnkXiwzzCPamCl3/ua5+8/+lZd+0Gnv7/G8iZA1JU6/dPr1gOyCudXjXZs5sIML6
         HduAsftebRnBPBWqrwlZgwxfz1xAUV9ALi21CNYFT1VT+cBgSBhS7FkGBdbVEK+9EdMl
         367FGHmkgWDSQxwRLQRMgAxmpy+BwGdLWjP1E2ibzs4TiYzkHSshKDyMuWMqZ06PIbaH
         eXNdHLxegI6YGX+mdrxH6a9SUza3+wj9oPs89UPtEGNFPThqTKB55Qvh+pB1qUaySqoQ
         dBwpgcG1VKOKTLBKeiAMa5hVAARrEGs5Y2m2BvPRqGeO8N1rK1azjNa7pdndh831bEsB
         MRsA==
X-Forwarded-Encrypted: i=1; AJvYcCXvBJIEDG4I1T0yGAEdoHxmRdCVh7n0YOx0VZTIMiraUp7jMFxkV7h+eQ7mZpA1Sr7l9h3xZ7kItyk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2sVnln9Y6gt6sbKcvUurgdSNLKQJr3oDsS0oKn9AaISqLzNG5
	P2SjmKqn9Ws2qzVgS9Q/ZJoWc1PlgR/KTSlDYUwpjiLWWmBYk3tIYyErTapsWQDE5kMCmKI0liH
	CEZo=
X-Gm-Gg: ASbGncunNMi65RRv67nUyFoYVKSf+FYx3C62vdyMiwIaH/WlLt1dWhh5EG/gpy/+++s
	L7OGC8PgzWEelfUlGjcJynLSKKUCe+yOSA7OHtlaJnwCdNSnkMDehqqiXhMvP+lmKizQtBPSOMr
	3GQpZsu++Z16jQX6RmaVrue3jkvb/rVOMCQw8ACgyHLYIWLDQ6kHSHeB0m/15cL84bMrkDfhwN1
	xmgmeU/LbFz8pRKba7C9h9q0SJF1r30HfQGZVjRH83BBqPlCPjLpkM+MVqnbUnPyYMP4ivYeeVw
	p/EHTrYmnjEkSf/ESTVYHbmNTQPWp++p8vmIiA1vVNnVd2ywL/olvw==
X-Google-Smtp-Source: AGHT+IGmzDKkenMW7q5DoY3eSyO6CybNqXhy5hxnpdwrI+6J5KzNRrGUQrSsNiXyZxyVD3y/6sImRw==
X-Received: by 2002:a05:600c:4707:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-4406ac27536mr132344935e9.28.1745413982707;
        Wed, 23 Apr 2025 06:13:02 -0700 (PDT)
Message-ID: <cd7c88b4-848b-4051-bbd6-8a8b78416ebd@citrix.com>
Date: Wed, 23 Apr 2025 14:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/intel: workaround several MONITOR/MWAIT errata
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250423113215.80755-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250423113215.80755-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2025 12:32 pm, Roger Pau Monne wrote:
> There are several errata on Intel regarding the usage of the MONITOR/MWAIT
> instructions, all having in common that stores to the monitored region
> might not wake up the CPU.
>
> Fix them by forcing the sending of an IPI for the affected models.
>
> The Ice Lake issue has been reproduced internally on XenServer hardware,
> and the fix does seem to prevent it.  The symptom was APs getting stuck in
> the idle loop immediately after bring up, which in turn prevented the BSP
> from making progress.  This would happen before the watchdog was
> initialized, and hence the whole system would get stuck.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Apollo and Lunar Lake fixes have not been tested, due to lack of hardware.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index 420198406def..1dbf15b01ed7 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -441,8 +441,14 @@ void cpuidle_wakeup_mwait(cpumask_t *mask)
>      cpumask_andnot(mask, mask, &target);
>  }
>  
> +/* Force sending of a wakeup IPI regardless of mwait usage. */
> +bool __ro_after_init force_mwait_ipi_wakeup;
> +
>  bool arch_skip_send_event_check(unsigned int cpu)
>  {
> +    if ( force_mwait_ipi_wakeup )
> +        return false;
> +

I don't especially like this.  The callers are a loop over all CPUs, and
this can't be inlined/simplified automatically.

But, lets get the fix in place first.  Optimising comes later.

~Andrew

