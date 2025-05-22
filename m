Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812FDAC0D0D
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 15:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993972.1377031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Au-0000F4-Ne; Thu, 22 May 2025 13:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993972.1377031; Thu, 22 May 2025 13:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Au-0000DS-Kx; Thu, 22 May 2025 13:41:32 +0000
Received: by outflank-mailman (input) for mailman id 993972;
 Thu, 22 May 2025 13:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uI6At-00009Z-BL
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 13:41:31 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76848c54-3712-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 15:41:28 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-601ab204085so8911653a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 06:41:28 -0700 (PDT)
Received: from [10.0.5.8] ([213.235.133.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca2bfsm1075931566b.157.2025.05.22.06.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 06:41:27 -0700 (PDT)
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
X-Inumbo-ID: 76848c54-3712-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747921288; x=1748526088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dO80HXkGB8fOypjW2hkXwE66Di8Sv1KGNxTyMQdy+4o=;
        b=ZK3AdrMHaOTwlr9BbG3UboXsUOarEQDZA5qnh59nOqvywn+hhrqGbY4k/gj29UloLu
         IZTRANkiZMwyGvQMO+39qjZE1PBb3EwB1d6q3v7rUNTps92yzYLpjz9gmeYzBu3L2qAv
         szTEYwtWDbEc32JJTMAMxEFaqNEu1eiJiIZ7cHkTrV2F3jI+lFew0QDphfP/iHYHik8d
         6wMenW9zP3Cj7Di4cartQ/ba5ocm4CcF2B/tJFWbF5EU0CUgvSgbaDwtybQC38vvMuMN
         TxpLF96+N7qjj/mpaj7cmIZMlVJ72Tdf6iqnEAU60S67N5zdA3qIkAnFwpWLT1jhZVD1
         jBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921288; x=1748526088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dO80HXkGB8fOypjW2hkXwE66Di8Sv1KGNxTyMQdy+4o=;
        b=sUF/1bf9O+TPNfXuVwYDTS3WDREm9PKWMGM0+OXwYvdcGK1sL4mMnurqG/Q6wlVPZU
         bWJp4UszlcLXJG1sFXaDCyaPXyl8oPYNuZo1hIeCh4oSLZW5+q4umJpjt+vFGYQcGm7D
         2GUq8dkggyQFYCNo3r9ki2CLwQzILmZSTyXZ/pHqfctZbdaDyqkzUwRsV411XOdryfs5
         MPXbKoKLKHK4+OBTZhuG24aZOYL4YtxbBHccMMEx4ib8pk3PdfU7itUvzwQVfbLbx6qk
         dkPoo9wW4Po9ix1H9pirWSqxzHJ3+r/XMDGLJgRpsOmoV4zb26CtwfVxKHg59id+HWTF
         WrJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpnKb8QQty5b6p5iq47xXtoGXRC+sIDYTy56NP/1F1ryOqHu9xFMNC1UmNGhmaOFgVh4l3bCuFlp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2OlzQvmkhplPCeYQ/7yZ8N0uRk4TrnzJElSQoBUjTogSf3Q29
	h6pWc7QR1KHeFSMLopKw2JzCxnSlxjMZ1BgOs1a/WlK+kJVe+5P7uCG4yGdPk3KlQw==
X-Gm-Gg: ASbGncvcG/8OD9xUm/53anGBom0XIxm48b/j8qdPlKJ8L1ayLRv1Mm668tMuUTRlB+c
	PhtD454iDa+TeOGXJHs/K49LMVHUlrRyiA7L0wYDp8lHgHITlX0zoHwmNwv/UD4X4JaWHA8mKnQ
	Fgiq9RjT7HU7Tr05k4Pe1/Re5ekPtH6Ya0sD056Uz2Uq1CwtxE2YWcq3Kn6MRXaHgv3Pqix/0SL
	mVrTNV7sq6g0t5f0+0pM3TI7sJUHUUZKI0EwCkejZRIFTC3wsGZSIZpcoAqu7Lirzyc9zVjLpp/
	HTUbFYjpd37FCafnyMs=
X-Google-Smtp-Source: AGHT+IFAJKTB998SAkkTy93emFS7tGj18XqoaAZ77lM1d0AefeYkYVnWlDw9Eo2gqL0G+VsGKLz1+A==
X-Received: by 2002:a17:907:3e28:b0:ad5:2d5d:206f with SMTP id a640c23a62f3a-ad52fa567ccmr2460222766b.19.1747921288077;
        Thu, 22 May 2025 06:41:28 -0700 (PDT)
Message-ID: <ce703bea-239f-4dae-bae6-b6e0052975df@suse.com>
Date: Thu, 22 May 2025 15:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/traps: split code to dump execution state to a
 separate helper
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250522075440.99882-1-roger.pau@citrix.com>
 <20250522075440.99882-4-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250522075440.99882-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2025 09:54, Roger Pau Monne wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -714,13 +714,15 @@ static cpumask_t show_state_mask;
>  static bool opt_show_all;
>  boolean_param("async-show-all", opt_show_all);
>  
> +static bool force_show_all;
> +
>  static int cf_check nmi_show_execution_state(
>      const struct cpu_user_regs *regs, int cpu)
>  {
>      if ( !cpumask_test_cpu(cpu, &show_state_mask) )
>          return 0;
>  
> -    if ( opt_show_all )
> +    if ( opt_show_all || force_show_all )
>          show_execution_state(regs);
>      else if ( guest_mode(regs) )
>          printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in guest\n",
> @@ -734,6 +736,38 @@ static int cf_check nmi_show_execution_state(
>      return 1;
>  }
>  
> +void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
> +{
> +    unsigned int msecs, pending;
> +
> +    force_show_all = show_all;

Prior (v1) comments here still apply.

Jan

