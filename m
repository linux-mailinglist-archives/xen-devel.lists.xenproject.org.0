Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608AA9B4CA6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 15:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827493.1242124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nbP-0007DD-Cn; Tue, 29 Oct 2024 14:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827493.1242124; Tue, 29 Oct 2024 14:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nbP-0007Ae-AE; Tue, 29 Oct 2024 14:53:47 +0000
Received: by outflank-mailman (input) for mailman id 827493;
 Tue, 29 Oct 2024 14:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzX=RZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5nbO-0007AY-B2
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 14:53:46 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97831ce9-9605-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 15:53:43 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c96936065dso6495868a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 07:53:43 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297a57sm483954266b.133.2024.10.29.07.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 07:53:42 -0700 (PDT)
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
X-Inumbo-ID: 97831ce9-9605-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk3ODMxY2U5LTk2MDUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjEzNjIzLjQzODY5NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730213623; x=1730818423; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8CW5WdJP3MA0EauCh12BA3osj2WKys67ACbayf73a/Q=;
        b=I5/KpoI26XIHGFCnjcDqYPzz1yMiZoMu6+JDrlYmTxyWD1RU+3DMzq/NpQP+DyB97I
         49BGIxMf0KvKJIqftZ+O9fwqNQLALBPV/I6X1d+ChbAqPevHnI+xnoWfrxJCrhw7FDgA
         nYR/l+/0OiykZ3HDFZ7XOT6wGDPZy0aI/G9UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730213623; x=1730818423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CW5WdJP3MA0EauCh12BA3osj2WKys67ACbayf73a/Q=;
        b=JgY2Ug3t5MIOsaaoAzWFP6Ngt4dNqJmjD7sbLNTgWU6DlaCZKSJQaZzsSaabUAfErd
         jXbcOjgCr8Ke3+6i3+T5Eu+7pGrPCpQDzR23mUQ5dHhUGammDgc1GgmqbHo2Dhy1z3fF
         b5BKKF5qDKhtUx+ZQie+aL0s0bXMHXJyXMce3/0N9sVs+8Urs6/TxegBqvUsKSaUZokc
         Ytz6tGXFItpLJMH/Bo28ah0eYqlCWpq3VdfXXaAw7DGJ/vDq4b8ozbkiiWVapl6IjeEw
         8MMAggaixmYdOLoILdi6meDTv1rONEBZGl3fK2FoNduVUriOK9mFPpsTmNOwq4ZxDbZh
         BGQA==
X-Gm-Message-State: AOJu0YyobfC7y3WfatHAjsF89XATu3Lz+ajhQR/7MaN0epElCXhyEZ5o
	gssk30ChgN2yHTPmySz/oTHlOusnktNQrAI5FbrQ4uLnAZkV7PVgoVMrltKuiAU=
X-Google-Smtp-Source: AGHT+IG/i3pExaX6mwkYj5Isewii3lV5775hPvATqb/wdxdwZwZYKDi3YbXRG5nSMssccEPTxIx/Zg==
X-Received: by 2002:a17:907:1c1d:b0:a9a:f53:a5c6 with SMTP id a640c23a62f3a-a9e3a7f468fmr1621066b.65.1730213622815;
        Tue, 29 Oct 2024 07:53:42 -0700 (PDT)
Date: Tue, 29 Oct 2024 15:53:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 5/5] x86/boot: Clarify comment
Message-ID: <ZyD29aZqLRydMUCp@macbook>
References: <20241029102942.162912-1-frediano.ziglio@cloud.com>
 <20241029102942.162912-6-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029102942.162912-6-frediano.ziglio@cloud.com>

On Tue, Oct 29, 2024 at 10:29:42AM +0000, Frediano Ziglio wrote:
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/reloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> index e50e161b27..e725cfb6eb 100644
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -65,7 +65,7 @@ typedef struct memctx {
>      /*
>       * Simple bump allocator.
>       *
> -     * It starts from the base of the trampoline and allocates downwards.
> +     * It starts on top of space reserved for the trampoline and allocates downwards.

I'm afraid this line is over 80 characters long, will need to be
adjusted.  Maybe:

    * Starts at top of the relocated trampoline space and allocates downwards.

Thanks.

