Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E091A7A1428
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 05:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602844.939624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgzDt-0001lN-Uc; Fri, 15 Sep 2023 03:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602844.939624; Fri, 15 Sep 2023 03:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgzDt-0001j9-Rt; Fri, 15 Sep 2023 03:10:25 +0000
Received: by outflank-mailman (input) for mailman id 602844;
 Fri, 15 Sep 2023 03:10:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CaZ=E7=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1qgzDs-0001j1-M6
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 03:10:24 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67c105f1-5375-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 05:10:22 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c06f6f98c0so14969375ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 20:10:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 y7-20020a17090322c700b001c0a414695dsm2285725plg.62.2023.09.14.20.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 20:10:20 -0700 (PDT)
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
X-Inumbo-ID: 67c105f1-5375-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694747420; x=1695352220; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s66uVsXieXZEwrz2tGtxEkm4KD1eEh+8pBHuZBZ6AXU=;
        b=Ag+kMRx/vdAnUXWljupD5btwkNsRDTUtEP0cqhHcwABH9HCPuaQa4tRZCYwXwqgeOE
         Oxk2eqxObvVqZkq/bvpHnSr4jQPXVwYL7MkctHVLxUGrNUW36XAbXHh4gTQ1Q5er1h7o
         DrT5DAYudTGMaaO+6e4WEUDEIJXhNVFs6sVbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694747420; x=1695352220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s66uVsXieXZEwrz2tGtxEkm4KD1eEh+8pBHuZBZ6AXU=;
        b=k8WL5lwwRWK3i/2Q1Ghs96XgSr6TUJvs1L4rESY5P60VzLx3V2Ltq39z7Nr5+WER1Z
         LG8CaIHOwCiZJVfH4vb5tfAW2zM9kuie1tXPCkkJBcfeu/maDJIUgzuHv30yKxGKgsEu
         LK6Z3uvZiD0AVV8/pc83HdLpu4CTz6+IXMAKdHVvbmaJ41BRZ2W4woKSK2yVxnRxw0aT
         Qz0DgACQ4oGKy5sjijwiQ4unWixHyIdtkh+Riydh8PipqoiaFbtmfV+Ol7f+lmNKDGnk
         KlzIzrJkgzerQ5TaTQPJ9ERZmTXm3eBOyoXkmyBOFA0ZJrauGXEUPNva0gZgvOwWy25c
         Oonw==
X-Gm-Message-State: AOJu0Yx62ZEMMOoFiIuF1NVGXWQP5kVJEjOg4yf9l8P4cRoLxAbLJJKY
	axLGRg4laZ3WMtTnLb3T3589jw==
X-Google-Smtp-Source: AGHT+IHiPr6yjry1eOi32qemWdUt8KSs5Y4FRrVUY+L6LPMW/8uikqG4J6/IPV1vKIwXV6zuvnYF/Q==
X-Received: by 2002:a17:902:76c5:b0:1bb:c06e:647a with SMTP id j5-20020a17090276c500b001bbc06e647amr443590plt.53.1694747420577;
        Thu, 14 Sep 2023 20:10:20 -0700 (PDT)
Date: Thu, 14 Sep 2023 20:10:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] xen/efi: refactor deprecated strncpy
Message-ID: <202309142009.DD5AE193@keescook>
References: <20230911-strncpy-arch-x86-xen-efi-c-v1-1-96ab2bba2feb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911-strncpy-arch-x86-xen-efi-c-v1-1-96ab2bba2feb@google.com>

On Mon, Sep 11, 2023 at 06:59:31PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> `efi_loader_signature` has space for 4 bytes. We are copying "Xen" (3 bytes)
> plus a NUL-byte which makes 4 total bytes. With that being said, there is
> currently not a bug with the current `strncpy()` implementation in terms of
> buffer overreads but we should favor a more robust string interface
> either way.

Yeah, this will work. Since this is a u32 destination, I do wonder if
strtomem_pad() would be better since we're not really writing a string?
But since this is all hard-coded, it doesn't matter. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> A suitable replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer while being functionally the
> same in this case.
> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested
> ---
>  arch/x86/xen/efi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
> index 863d0d6b3edc..7250d0e0e1a9 100644
> --- a/arch/x86/xen/efi.c
> +++ b/arch/x86/xen/efi.c
> @@ -138,7 +138,7 @@ void __init xen_efi_init(struct boot_params *boot_params)
>  	if (efi_systab_xen == NULL)
>  		return;
>  
> -	strncpy((char *)&boot_params->efi_info.efi_loader_signature, "Xen",
> +	strscpy((char *)&boot_params->efi_info.efi_loader_signature, "Xen",
>  			sizeof(boot_params->efi_info.efi_loader_signature));
>  	boot_params->efi_info.efi_systab = (__u32)__pa(efi_systab_xen);
>  	boot_params->efi_info.efi_systab_hi = (__u32)(__pa(efi_systab_xen) >> 32);
> 
> ---
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> change-id: 20230911-strncpy-arch-x86-xen-efi-c-14292f5a79ee
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook

