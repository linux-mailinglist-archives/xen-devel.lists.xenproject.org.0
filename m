Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D597D6B2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 16:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801177.1211225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sreN5-00042y-Fq; Fri, 20 Sep 2024 14:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801177.1211225; Fri, 20 Sep 2024 14:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sreN5-00040R-Bq; Fri, 20 Sep 2024 14:12:31 +0000
Received: by outflank-mailman (input) for mailman id 801177;
 Fri, 20 Sep 2024 14:12:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1w=QS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sreN4-00040L-9Q
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 14:12:30 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d956cbe-775a-11ef-99a2-01e77a169b0f;
 Fri, 20 Sep 2024 16:12:27 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3787f30d892so1269291f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 07:12:27 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e844dsm17494472f8f.40.2024.09.20.07.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 07:12:26 -0700 (PDT)
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
X-Inumbo-ID: 5d956cbe-775a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726841547; x=1727446347; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/BAJ3VseaYwK+qYtee/iR/vA5cXPA5RvlOi/GfV7MzM=;
        b=AyxqwaDMg3ONGVQWSaRAYcgzarzGBWLShEjLC9pdLBd/iTcGoe0OQHFcSzZyg1PJg0
         pQ0Rzisx4XxQ1p2qYfj3cLBmz8dKtNdnWMU20INybMrFS30oNUTxD+0bsb+OF14DHQ8D
         Ylxza/8kjEQTw9ZwrVjFgrE5ItUeUFH9UzZOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726841547; x=1727446347;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BAJ3VseaYwK+qYtee/iR/vA5cXPA5RvlOi/GfV7MzM=;
        b=nEwDy90SQFuZ55aWGhRRxbNdojDKl+RooocwX57Rg9ekmU2e+8ZpeNHbBzGYF8hJU/
         3CWNd05yCuzLXePWvTCX87Kt/b3KWHBnuBycswfEvxpcVAY1PyPyJ4HL7KsdhS9GfDZj
         NXJ3anwVYuUBuzUB8xEOgKXssNDhjByaxDZ3HiKhk4PsVaRmpq9mv4eKINoSWr3zO0k1
         34U7OTMA/r3WNVRxMmOEl3E3S65uVkFq5E1ZkVaDKA4hG4G+jyHG4zeIDZjpCmv9sPPR
         RhJjZB/wk8rn6Jr9HE+7UqPg59/42Xq4zDY/QLSbmUIv6nW6NETvWQuE88A7HOhEVO3y
         mZeA==
X-Gm-Message-State: AOJu0YzGyzmeD+ZY7/ZBE4GkPR1PHnNG3g5QUbiZ33VUG3D+KN/04j2+
	wpkVTkKCAx/ybVNZ/t1+Vd7krtmkx8lcSj/M1qiND6N/iPl+Dx2zFVz2mV0Z05U=
X-Google-Smtp-Source: AGHT+IFHBpGvx0JfqU4HgKO6pLlC3b7z4rjGLWEyEVglUsRW8JfK3r0EAp4gCLquVSGIovfCDds13w==
X-Received: by 2002:a5d:6609:0:b0:374:bde6:bff5 with SMTP id ffacd0b85a97d-37a4235a1dfmr1572351f8f.46.1726841546725;
        Fri, 20 Sep 2024 07:12:26 -0700 (PDT)
Date: Fri, 20 Sep 2024 16:12:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
Message-ID: <Zu2Cyan46VVs2oef@macbook.local>
References: <20240918130554.97345-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918130554.97345-1-alejandro.vallejo@cloud.com>

On Wed, Sep 18, 2024 at 02:05:54PM +0100, Alejandro Vallejo wrote:
> Moves sti directly after the cr2 read and immediately after the #PF
> handler.

I think you need to add some context about why this is needed, iow:
avoid corrupting %cr2 if a nested 3PF happens.

> While in the area, remove redundant q suffix to a movq in entry.S
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One nit below.

> ---
> Got lost alongside other patches. Here's the promised v2.
> 
> pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1458699639
> v1: https://lore.kernel.org/xen-devel/20240911145823.12066-1-alejandro.vallejo@cloud.com/
> 
> v2:
>   * (cosmetic), add whitespace after comma
>   * Added ASSERT(local_irq_is_enabled()) to do_page_fault()
>   * Only re-enable interrupts if they were enabled in the interrupted
>     context.
> ---
>  xen/arch/x86/traps.c        |  8 ++++++++
>  xen/arch/x86/x86_64/entry.S | 20 ++++++++++++++++----
>  2 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 708136f62558..a9c2c607eb08 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1600,6 +1600,14 @@ void asmlinkage do_page_fault(struct cpu_user_regs *regs)
>  
>      addr = read_cr2();
>  
> +    /*
> +     * Don't re-enable interrupts if we were running an IRQ-off region when
> +     * we hit the page fault, or we'll break that code.
> +     */
> +    ASSERT(!local_irq_is_enabled());
> +    if ( regs->flags & X86_EFLAGS_IF )
> +        local_irq_enable();
> +
>      /* fixup_page_fault() might change regs->error_code, so cache it here. */
>      error_code = regs->error_code;
>  
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index b8482de8ee5b..218e5ea85efb 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -844,9 +844,9 @@ handle_exception_saved:
>  #elif !defined(CONFIG_PV)
>          ASSERT_CONTEXT_IS_XEN
>  #endif /* CONFIG_PV */
> -        sti
> -1:      movq  %rsp,%rdi
> -        movzbl UREGS_entry_vector(%rsp),%eax
> +.Ldispatch_handlers:

Maybe 'dispatch_exception', since it's only exceptions that are
handled here? dispatch_handlers seems a bit too generic, but no strong
opinion.

Thanks, Roger.

