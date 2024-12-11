Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6689ECF85
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 16:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854880.1267965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOV4-0003bb-SK; Wed, 11 Dec 2024 15:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854880.1267965; Wed, 11 Dec 2024 15:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLOV4-0003Z5-Pc; Wed, 11 Dec 2024 15:19:42 +0000
Received: by outflank-mailman (input) for mailman id 854880;
 Wed, 11 Dec 2024 15:19:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTIw=TE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLOV3-0003Yz-SD
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 15:19:41 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 570f68dc-b7d3-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 16:19:40 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so9006802a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 07:19:40 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d14c7aaa09sm9158873a12.80.2024.12.11.07.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 07:19:39 -0800 (PST)
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
X-Inumbo-ID: 570f68dc-b7d3-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733930379; x=1734535179; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hamutSdrGzdlYLG1n/9z/tGor9ygoyk7yWzz82YAn8s=;
        b=mrHbQWohsgUWvu6LRJ0jif8o+4vy5Zd4kyu2VtuJSy1Wn6Ma3m+o7GrHCyN45tC1kv
         SceDQ9/fDfLtySgkjXQ1bkYffe/3PgYWz7JarpEjjeT1vIoBIvz3tO1pi7AMJ9maOZ+h
         ALF44/P2E2IsF5wJvh23zc/HY5vhdYbqebyRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733930379; x=1734535179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hamutSdrGzdlYLG1n/9z/tGor9ygoyk7yWzz82YAn8s=;
        b=HG0MBMn9pja1L3pAl5jFgCx+q3VGPK8SGvvakC2jHpkq3nnhRIYjWmgDXGAFA5RvmJ
         Q5NOTwIk4cuTcGJnnuE39w/tx0SBDpC+qRNG8MmqcVqViK1HvCcj2L85AXA4hF3VlYCK
         NFZMzi5G/ltSoQ0FyVSUTjoEEQv05HpGK1UrTpJ/1pkDouPLXOOSQ1Xuoa0RZRnl5De/
         2XQEIVRsFSb5zZGDLTbYfuefW37WGRYl3rLLnkj4gsEz5SsdmeFEiZwvszJ62zcZKDRh
         4ctmpkbmgE5A7vfZua/buYyPD5PXCKPdH+bsqDlwqojKPlRa0fWanf5fAf0l/XHegsax
         vsYQ==
X-Gm-Message-State: AOJu0YwQFNTTc3QVJfN5maw52n5O1J+LMqNLDX0tEEHHUlvRzYmTju4d
	khKW4mkGhXfRMjlGyecc3hV1PGdUvJh38H+7XUFxMJrPpH6nBKFzC6/+4S58dEg=
X-Gm-Gg: ASbGncsLnf+Ux0J47pgPi97CS2fmwH+k1M9csas/g6iOfwoREB766bW9RbSflYXBpZW
	XLOm29n7f/1nZdxYG7XlfDlTy1Hk9a3aYW1kczcb8n6gK2qpd0Tpr2sL1HD+yYfNGJoFp/uHt9i
	yexJNwFE/3rw8ASlJ8dYHDAJrd7JqXn/zPFLniaNLitT67bd3mR0o0iFbk5X1gbE+jrjh01J2yY
	J3VCIUMSb0ZeY8LjrIKG5CUaXcNpppkBEHuVaJfS3fFyAWfdrOGl7V0WuGAuYg=
X-Google-Smtp-Source: AGHT+IFuVkn0bjck4KKkjhnwlCNjnet7n6TKglHuyY3sf6ErJuCQNrmksytcwwS/DQsdsB8zuGNPlg==
X-Received: by 2002:a05:6402:3484:b0:5d0:b040:4616 with SMTP id 4fb4d7f45d1cf-5d4331778cemr3168266a12.28.1733930379365;
        Wed, 11 Dec 2024 07:19:39 -0800 (PST)
Date: Wed, 11 Dec 2024 16:19:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 09/35] x86/domain: print emulation_flags
Message-ID: <Z1mtigiI-5wkgzhK@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:39PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Print d->arch.emulation_flags on the console for better traceability while
> debugging in-hypervisor hardware emulators.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/domain.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 78a13e6812c9120901d0a70fb3bc1bd6a8b6917d..c88d422a64544531c1e1058fa484364bb4277d1e 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -818,11 +818,15 @@ int arch_domain_create(struct domain *d,
>  
>      if ( !emulation_flags_ok(d, emflags) )
>      {
> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> +        printk(XENLOG_G_ERR "d%d: Xen does not allow %s %sdomain creation "

gprintk(XENLOG_ERR, "...

Might be more natural now that we have the macro (together with Jan's
suggestion to use %pd (same below).

>                 "with the current selection of emulators: %#x\n",
> -               d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
> +               d->domain_id,
> +               is_hvm_domain(d) ? "HVM" : "PV",
> +               is_hardware_domain(d) ? "(hardware) " : "",
> +               emflags);
>          return -EOPNOTSUPP;
>      }
> +    printk(XENLOG_G_INFO "d%d: emulation_flags %#x\n", d->domain_id, emflags);

This would need to be a dprintk at least, and the log level should be
XENLOG_DEBUG.

Maybe it would be better if you could print this information as part
of some debug key, for not having to print it for every guest
creation.  Maybe as part of the 'q' debug key?

Thanks, Roger.

