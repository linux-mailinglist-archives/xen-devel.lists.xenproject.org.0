Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C8997654B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797092.1206901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sofuq-0002aw-5J; Thu, 12 Sep 2024 09:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797092.1206901; Thu, 12 Sep 2024 09:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sofuq-0002Yx-2W; Thu, 12 Sep 2024 09:15:04 +0000
Received: by outflank-mailman (input) for mailman id 797092;
 Thu, 12 Sep 2024 09:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sofuo-0002Yr-LP
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:15:02 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c856c7b-70e7-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 11:15:00 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c40942358eso1150135a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 02:15:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cef8sm6357065a12.89.2024.09.12.02.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 02:14:58 -0700 (PDT)
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
X-Inumbo-ID: 7c856c7b-70e7-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726132499; x=1726737299; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/XwBnEdP55i4Rgy8sCgVQ/cSoLC9OeoreKHg2Q9G8g=;
        b=cjPfjqseTR1yz6cO2sVhxq611EYvvXDI9GdVMv1iRqe4blwLiVCqg6U5GsHBZQ7ign
         7E6PDtMSJ2OcwxtrjFjALAM/DOe/j0Kc0joRiK0x2M6crh+RcNbGbHl2ziVhkFWlSAYH
         nycb16DuzcXNo3/23NqEJgRLDmkaIuR1uwvaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726132499; x=1726737299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/XwBnEdP55i4Rgy8sCgVQ/cSoLC9OeoreKHg2Q9G8g=;
        b=tHzYnccIzbfvx27uAp3/lCN5hWPVz4x9lyJAZTLYyxhaC+phCxATF/7D+V3VqsBD3S
         qz5WjoGIdaNRdW5jOD8I2WTwpDGrglJUkaabatsQBuu5n2VVyRhOeS68qblwB1RJaDAs
         U11cp8ERt4EZExY6U4ljNHUOvhXliQwEFFNJbPpOUlVF32qugi4OwvBife5+nfuUSVFQ
         W0npfxZuHsWPQJI699PzxUmOE5BokBaiii1Z+d87Krk41QPntkSt4CZvAFoMU+gXqjeb
         LvuuSyS2pqNHVnMikTQoGmRBxMMx9TjKRDM1JZ6qOnozp9O6qzh1dQtSE8BzGQlCcu4l
         ixeA==
X-Gm-Message-State: AOJu0YzVezIciJCJPG0U3oW7oYx3kLNKNtXomh0umxuHDZ5Cx+eb/Tss
	wSgVPohuJ9IYrFewhX6uf96AauFJnj4gRAQCeY9nG8DRaO+RQARUu0qNSqUPuXc=
X-Google-Smtp-Source: AGHT+IEuXG47T/8bcAOGBF6BjF5xMfuGSaT4jHWJXRyZZjU7UipCiw9Bptq7p6j4Q1xqL99aPLYWhw==
X-Received: by 2002:a05:6402:2312:b0:5c4:14ba:9cd7 with SMTP id 4fb4d7f45d1cf-5c414ba9d0emr1497362a12.10.1726132498621;
        Thu, 12 Sep 2024 02:14:58 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:14:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] x86/hvm: make stdvga support optional
Message-ID: <ZuKxEVsbV0MqLrtb@macbook.local>
References: <20240912085709.858052-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240912085709.858052-1-Sergiy_Kibrik@epam.com>

On Thu, Sep 12, 2024 at 11:57:09AM +0300, Sergiy Kibrik wrote:
> Introduce config option X86_STDVGA so that stdvga driver can be disabled on
> systems that don't need it.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/Kconfig              | 10 ++++++++++
>  xen/arch/x86/hvm/Makefile         |  2 +-
>  xen/arch/x86/include/asm/hvm/io.h |  5 +++++
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 62f0b5e0f4..2ba25e6906 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -385,6 +385,16 @@ config ALTP2M
>  
>  	  If unsure, stay with defaults.
>  
> +config X86_STDVGA
> +	bool "Standard VGA card emulation support" if EXPERT
> +	default y
> +	depends on HVM
> +	help
> +	  Build stdvga driver that emulates standard VGA card with VESA BIOS
> +          Extensions for HVM guests.
> +
> +	  If unsure, say Y.
> +
>  endmenu
>  
>  source "common/Kconfig"
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index 4c1fa5c6c2..4d1f8e00eb 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -22,7 +22,7 @@ obj-y += pmtimer.o
>  obj-y += quirks.o
>  obj-y += rtc.o
>  obj-y += save.o
> -obj-y += stdvga.o
> +obj-$(CONFIG_X86_STDVGA) += stdvga.o
>  obj-y += vioapic.o
>  obj-y += vlapic.o
>  obj-y += vm_event.o
> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
> index 24d1b6134f..9b8d4f6b7a 100644
> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -128,8 +128,13 @@ struct hvm_hw_stdvga {
>      spinlock_t lock;
>  };
>  
> +#ifdef CONFIG_X86_STDVGA
>  void stdvga_init(struct domain *d);
>  void stdvga_deinit(struct domain *d);
> +#else
> +static inline void stdvga_init(struct domain *d) {}
> +static inline void stdvga_deinit(struct domain *d) {}
> +#endif

Shouldn't Xen report an error if a user attempts to create a domain
with X86_EMU_VGA set in emulation_flags, but stdvga has been built
time disabled?

Thanks, Roger.

