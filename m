Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA8669840
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477317.739975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJvU-0000Yc-H4; Fri, 13 Jan 2023 13:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477317.739975; Fri, 13 Jan 2023 13:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJvU-0000VA-CR; Fri, 13 Jan 2023 13:16:56 +0000
Received: by outflank-mailman (input) for mailman id 477317;
 Fri, 13 Jan 2023 13:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8NH=5K=gmail.com=mingo.kernel.org@srs-se1.protection.inumbo.net>)
 id 1pGJvS-0000V4-ST
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:16:54 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b4da49a-9344-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 14:16:52 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id cf18so45878436ejb.5
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 05:16:52 -0800 (PST)
Received: from gmail.com ([31.46.242.235]) by smtp.gmail.com with ESMTPSA id
 b26-20020aa7dc1a000000b00499c3ca6a0dsm4114514edu.10.2023.01.13.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 05:16:50 -0800 (PST)
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
X-Inumbo-ID: 8b4da49a-9344-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlCw+zZM+W0MIRuZZ9a+0t+5twIPtxY+d3mAecrMHG0=;
        b=aJ+qO/wntm5Sh3d2sH0EboaTSwBg43UeydQCepU9Dwcdfbnfk0bnxaVO4Tz1I2hpMM
         wmpAmaRxb/t0V45AOs/Og3rD3+pDn2nWgPF5K+rJtI9z27YH6fQjWh5h1rnh23/QE/Bw
         HAelQHtDb1IqC7Oba2euFvVTvi/KRovTaXZHgbeTl7If1knWpa4Zrgz070yc1vzmSneM
         jUv3TeFShdx5cF1NOWaRDNoRe249I/vk8J71D9YhRv6RA5CQUVvkg/jaNt/RaUD1jMmK
         x9qzjJtju6LpxTsL7TqMoY5mDf/aRI2PbUoA+ssjf8TVocwFvYvCj6RiBkTcUJB3NxFd
         F13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlCw+zZM+W0MIRuZZ9a+0t+5twIPtxY+d3mAecrMHG0=;
        b=UGcBZvXhPxLu5OqJ2M3W7sxwPLHpX3qpenWHFWz36T0n/tuesjpzB2/q5DNjELLdDQ
         2NiIisX8D9wBO/3R9oDEUpvC1ymoBEY7Z5Tf4sign3TyROe7oJdAxRAg/3NTzq7wqfpj
         EGpsL19YHlvyWX2LYbZJfE3W/YYZLg0yWpq/taVvjoP8CI/Cmbe9uOQvml9dzCaRaG/K
         asQEDaCk3Fwe+3bUzaFNo8M+XFHML9MSRRb5qlcnwA26LDLPwkKqOAqHQSb39+YbaGYQ
         D1bDNoc4yxOQGG6RneoxkuU0BbxsAwJXClZ0oJ4iVhTWhYIIeIIR8tN+vtdmv7+o4XWW
         Y1uw==
X-Gm-Message-State: AFqh2kqej1JPdzU8Sy84p27U/eL6zRuAZfV1cRwbPoLyAF1//e4kQe/y
	3Lf/pqk7B4cdfCiaLcOLmA8=
X-Google-Smtp-Source: AMrXdXtNjIfcqueavthjwXjDEZYtukIwVQn1HNUGbds0mLX015YBewarJuZYaImpFSWzdBXfMsjSbw==
X-Received: by 2002:a17:906:9f07:b0:7ec:27d7:1838 with SMTP id fy7-20020a1709069f0700b007ec27d71838mr85275567ejc.22.1673615811828;
        Fri, 13 Jan 2023 05:16:51 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Fri, 13 Jan 2023 14:16:44 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com
Subject: Re: [RFC][PATCH 2/6] x86/power: Inline write_cr[04]()
Message-ID: <Y8FZvLq+MeQ7A+lI@gmail.com>
References: <20230112143141.645645775@infradead.org>
 <20230112143825.644480983@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112143825.644480983@infradead.org>


* Peter Zijlstra <peterz@infradead.org> wrote:

> Since we can't do CALL/RET until GS is restored and CR[04] pinning is
> of dubious value in this code path, simply write the stored values.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/power/cpu.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/arch/x86/power/cpu.c
> +++ b/arch/x86/power/cpu.c
> @@ -208,11 +208,11 @@ static void notrace __restore_processor_
>  #else
>  /* CONFIG X86_64 */
>  	native_wrmsrl(MSR_EFER, ctxt->efer);
> -	native_write_cr4(ctxt->cr4);
> +	asm volatile("mov %0,%%cr4": "+r" (ctxt->cr4) : : "memory");

>  #endif
>  	native_write_cr3(ctxt->cr3);
>  	native_write_cr2(ctxt->cr2);
> -	native_write_cr0(ctxt->cr0);
> +	asm volatile("mov %0,%%cr0": "+r" (ctxt->cr0) : : "memory");

Yeah, so CR pinning protects against are easily accessible 'gadget' 
functions that exploits can call to disable HW protection features in the 
CR register.

__restore_processor_state() might be such a gadget if an exploit can pass 
in a well-prepared 'struct saved_context' on the stack.

Can we set up cr0/cr4 after we have a proper GS, or is that a 
chicken-and-egg scenario?

Thanks,

	Ingo

