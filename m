Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CB9765E4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797171.1207022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogK8-0004jR-1z; Thu, 12 Sep 2024 09:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797171.1207022; Thu, 12 Sep 2024 09:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogK7-0004hP-Un; Thu, 12 Sep 2024 09:41:11 +0000
Received: by outflank-mailman (input) for mailman id 797171;
 Thu, 12 Sep 2024 09:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sogK6-0003fo-Pl
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:41:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23962912-70eb-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 11:41:09 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so93556666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 02:41:09 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25a2844fsm724702066b.88.2024.09.12.02.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 02:41:07 -0700 (PDT)
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
X-Inumbo-ID: 23962912-70eb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726134068; x=1726738868; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jP+jklgRuEZXj97e/O/bzVmrOMAR4OaoRMps8ytb6VM=;
        b=JgDcpwXfFrfTdYmn4aRl88Mqwj14yjeDLHkR+mPJeahHFmTTgQKwQSwQRFOmCJHLrC
         WUoqA1GCaHIpmN9HkDz/TfOUArV50cK9quNS1pf2MoOt9Q54c1PJBBVuGJQw/XYt4sMf
         2Y0DVjsngbI/tXi0C7+C0chkphqUJL0ya01WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726134068; x=1726738868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jP+jklgRuEZXj97e/O/bzVmrOMAR4OaoRMps8ytb6VM=;
        b=TOa21FbrU6AERBzgvplcjwiLKxEvg7rRfagfFaEEXmXgsQvNq5gz+34XRYWO0a3Rqx
         1f0+9/4TOk2yNREKTEQfguYXQYEEaCd9lrDF5TffwwmcuipQNieWGTAUgA/iOvYm1BCl
         Uk/o+B7+gO9aztv3uq0v0wjXnupClQgoRD2TqMcuHRs1obNlf8sMGkqF4pb8imCBWR1n
         90O7RZD8sv6k+xd1pAc3nYfX6ayu2oQFWeorcF6RYZkcSUY9VTPzSaAnIdnzeVup2NNI
         acISSOHCznS/VRVM3EObHX13gYYf3c3C41NISD3/XwwbUIzSQjNfMAdKNktvJp6XweNn
         WNjQ==
X-Gm-Message-State: AOJu0YxwqY4jPvrX3qzO2xSVomKbY8jtKrN1Tqb6EhnKQxVslnSrTcC+
	M80DTdZEslfbPNfglKyZ94pp72ULJ9nbmvunF5BQIgT8x5aKXMrTt7j1VoBws7Q=
X-Google-Smtp-Source: AGHT+IEFGQREaIs5TARTpsXyi967rNMBKhm05HYKdJnU/sk80OglM0Y1fVwbpZQNFAht1FSkBEvqnA==
X-Received: by 2002:a17:907:7251:b0:a8d:4bdc:57c with SMTP id a640c23a62f3a-a90296174dcmr182572966b.44.1726134067717;
        Thu, 12 Sep 2024 02:41:07 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:41:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/traps: Re-enable IRQs after reading cr2 in the #PF
 handler
Message-ID: <ZuK3MmxR5OF891w-@macbook.local>
References: <20240911145823.12066-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911145823.12066-1-alejandro.vallejo@cloud.com>

On Wed, Sep 11, 2024 at 03:58:23PM +0100, Alejandro Vallejo wrote:
> Moves sti directly after the cr2 read and immediately after the #PF
> handler.
> 
> While in the area, remove redundant q suffix to a movq in entry.S
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> I don't think this is a bug as much as an accident about to happen. Even if
> there's no cases at the moment in which the IRQ handler may page fault, that
> might change in the future.
> 
> Note: I haven't tested it extensively beyond running it on GitLab.
> 
> pipeline:
>     https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1449182525
> 
> ---
>  xen/arch/x86/traps.c        |  2 ++
>  xen/arch/x86/x86_64/entry.S | 11 +++++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 708136f625..1c04c03d9f 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1600,6 +1600,8 @@ void asmlinkage do_page_fault(struct cpu_user_regs *regs)
>  
>      addr = read_cr2();
>  
> +    local_irq_enable();

I would maybe add an ASSERT(!local_irq_is_enabled()); at the top of the
function, just to make sure the context is as expected.

> +
>      /* fixup_page_fault() might change regs->error_code, so cache it here. */
>      error_code = regs->error_code;
>  
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index b8482de8ee..ef803f6288 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -844,8 +844,7 @@ handle_exception_saved:
>  #elif !defined(CONFIG_PV)
>          ASSERT_CONTEXT_IS_XEN
>  #endif /* CONFIG_PV */
> -        sti
> -1:      movq  %rsp,%rdi
> +1:      mov   %rsp,%rdi

Since you are modifying this already - we usually add a space between
the comma and the next operand.

Thanks, Roger.

