Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55099987FDB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 09:59:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806101.1217419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5s9-0004UU-Lp; Fri, 27 Sep 2024 07:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806101.1217419; Fri, 27 Sep 2024 07:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su5s9-0004S1-If; Fri, 27 Sep 2024 07:58:41 +0000
Received: by outflank-mailman (input) for mailman id 806101;
 Fri, 27 Sep 2024 07:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYFD=QZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1su5s7-0004Ru-GU
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 07:58:39 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cd3ec62-7ca6-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 09:58:36 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7d5dso2006061a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 00:58:37 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d01e0sm96746066b.51.2024.09.27.00.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 00:58:36 -0700 (PDT)
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
X-Inumbo-ID: 4cd3ec62-7ca6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727423917; x=1728028717; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGyrrC6BM49yJXozHNCYe9qpeAR1jeYTf5X7lIORACc=;
        b=fZuOjlsriiTRw1HhZqluJRwoZUxILjQBJS/keEfSN1aq6gKeBZTh1D/ouuzz8MvIEQ
         ZcgILjotcFja4hKHuysTK4hWFJSB4YTm2qoMNF+0zo48twDQbzocGuC+Cms79ag1rx/+
         pTsVLSAhcjZeeRdry0MYi3X94RnYGpMdgziZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727423917; x=1728028717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGyrrC6BM49yJXozHNCYe9qpeAR1jeYTf5X7lIORACc=;
        b=XaB3zSdawbUD+4eFdcc818O5hqKUq5BcNBSc1h7E8gdcfhDh7TXckt/OwzwDV5dziz
         WBaluj8BZ9vWHMAmTzApNgFQuN2zrf4ixtByDmH4uco90UX5ubLKLR/JpLT3eZ+JYCcj
         zqMCUJ53KoSx7qHGyDvUqCEMLTvAzLMho4dqLdM3CByDwrZIyYV54Wc09GuepssRxKfG
         H3JCetIrdlzJB0q0WBFM365J0yh+Z4qpBADA5rKspyoYbNncUMzXm3qR6XExFNML9YHO
         HTxJy9nkCLyWhEocfuRKqj2uGWQBJ0255r1X/pcAl+mwAqBYzixuVJs49WScowVF0fqo
         PyTA==
X-Gm-Message-State: AOJu0Ywwhqe88xT5cqDSL2JqEM/jUTmA0lBmiQrOq4A4cO/czpjwdvBo
	H8+H7Zyk0yJlcXr3SdkMiSNx6qS87HyZ/Da3iI/3Vfs+dL/C0lXDnbc9wu/l89Y=
X-Google-Smtp-Source: AGHT+IGjjBDCkVBfCFPQ63IHp5y/uxELIaZh3fTVzaExgzpqPKikj3sD+3NtN5gC9T8JirsYYoGuSw==
X-Received: by 2002:a17:907:9304:b0:a8d:2d35:3dc4 with SMTP id a640c23a62f3a-a93c4910a6fmr198810566b.18.1727423916791;
        Fri, 27 Sep 2024 00:58:36 -0700 (PDT)
Date: Fri, 27 Sep 2024 09:58:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 1/6] xen: introduce SIMPLE_DECL_SECTION
Message-ID: <ZvZlqy4Y57ewtcq9@macbook.local>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
 <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>

On Thu, Sep 26, 2024 at 06:54:20PM +0200, Oleksii Kurochko wrote:
> Introduce SIMPLE_DECL_SECTION to cover the case when
> an architecture wants to declare a section without specifying
> of load address for the section.
> 
> Update x86/xen.lds.S to use SIMPLE_DECL_SECTION.

No strong opinion, but I feel SIMPLE is not very descriptive.  It
might be better to do it the other way around: introduce a define for
when the DECL_SECTION macro should specify a load address:
DECL_SECTION_WITH_LADDR for example.

> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - new patch
> ---
>  xen/arch/x86/xen.lds.S    | 6 ++++--
>  xen/include/xen/xen.lds.h | 6 ++++++
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index b60d2f0d82..9275a566e1 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -3,6 +3,10 @@
>  
>  #include <xen/cache.h>
>  #include <xen/lib.h>
> +
> +#ifdef EFI
> +#define SIMPLE_DECL_SECTION
> +#endif

A nit, but we have been trying to add some indentation to make the
ifdef blocks easier to read, so this would become:

#ifdef EFI
# define SIMPLE_DECL_SECTION
#endif

If it's not too much fuzz to adjust here and below.

Thanks, Roger.

