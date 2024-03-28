Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D9A88FBE5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 10:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698859.1091047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpmIt-00085z-Ha; Thu, 28 Mar 2024 09:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698859.1091047; Thu, 28 Mar 2024 09:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpmIt-00083t-Eo; Thu, 28 Mar 2024 09:44:11 +0000
Received: by outflank-mailman (input) for mailman id 698859;
 Thu, 28 Mar 2024 09:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idZb=LC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rpmIs-00083J-Ai
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 09:44:10 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4a037e0-ece7-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 10:44:01 +0100 (CET)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-781753f52afso39259385a.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 02:44:08 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 po5-20020a05620a384500b0078a5e78f24fsm400584qkn.13.2024.03.28.02.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 02:44:06 -0700 (PDT)
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
X-Inumbo-ID: b4a037e0-ece7-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711619046; x=1712223846; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mfP5TGclSZ1zfwo7OSFJkdtTlDlpu7pQ66cX8iHPz5E=;
        b=gZnFrH11QGH8pLdgsdbEHfl1bv/l0c/J2xFh18XP089Nn7bqAvkXYJ9pL7JH9lQ0oP
         NEYen6RcYOUc6AO6X+PcoPnY5zS5ax7Ubu9oEJaBborYfZAthxiTqBtjbyD3M/ax/tWJ
         CVUctqxKm02JmaaAlJYc6aXB31QenvybSfox0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711619046; x=1712223846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfP5TGclSZ1zfwo7OSFJkdtTlDlpu7pQ66cX8iHPz5E=;
        b=ZapCaky9nOSWmtRURT4fNhgS/Ny4i+zGpNDCw2Jcta7f7oc1mydZt1PwgqPHVmzBVn
         MdWPIDaxHq7OL9BilUBsnDx+uP4880VFnMcTXGO73iLBJft+5Tx18RjzfkpKU4MoXfUm
         sDn5VzTNrZlBUL+wr5jo19ozBYBT49S05ReeLb7530j03upvKosEjG8mrl4zHOJNB0lu
         sF2IbEB5OY4bWHniaRPAl1E4tgnRZEBkAgGxOggCB8TjjavCnhGlsem+HtBnxEdqFS0i
         UyeTPHl96jxWGbfeEBdJn5QyfpwKveyYLooWvQbpu91HUizthw2R/jvRbEl8bdSIaiQ6
         W4sw==
X-Gm-Message-State: AOJu0YySBUgb3idADX2v6Vil9G7DW7yV/Pg1Pj03vOn3fSDnMpaLvL7h
	ddFgodfcrQQx2DERhTtHRWL+kJ/hp+syOqQB6ANXs8pSoJ/YB5x+C+BIiWizOtY7rTe/2CaoLgp
	C
X-Google-Smtp-Source: AGHT+IFfcqh+qPTj6+cGe5foXkQaVf7AY4+r/7lSxqzRCGqQ0dDUMIyUjN3pUlSxo+fjdbQs5vgk2A==
X-Received: by 2002:a05:620a:1aa4:b0:78a:439d:7665 with SMTP id bl36-20020a05620a1aa400b0078a439d7665mr2490546qkb.36.1711619046512;
        Thu, 28 Mar 2024 02:44:06 -0700 (PDT)
Date: Thu, 28 Mar 2024 10:44:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 2/3] xen: use explicit function alignment if supported
 by compiler
Message-ID: <ZgU75EW7rIRfMoje@macbook>
References: <20240207145547.89689-1-roger.pau@citrix.com>
 <20240207145547.89689-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240207145547.89689-3-roger.pau@citrix.com>

Ping?

On Wed, Feb 07, 2024 at 03:55:46PM +0100, Roger Pau Monne wrote:
> Introduce a new Kconfig check for whether the compiler supports
> -falign-functions and if supported use it to align functions to the per-arch
> selected value, just like it's done for assembly ENTRY() and FUNC() symbols.
> 
> Note that it's possible for the compiler to end up using a higher function
> alignment regardless of the passed value.  Different compilers handle the
> option differently, as clang will ignore -falign-functions value if it's
> smaller than the one that would be set by the optimization level, while gcc
> seems to always honor the function alignment passed in -falign-functions.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v5:
>  - New in this version.
> ---
>  xen/Kconfig  | 5 +++++
>  xen/Makefile | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/xen/Kconfig b/xen/Kconfig
> index 1e1b041fd52f..040cba1b4b73 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -41,6 +41,11 @@ config CC_SPLIT_SECTIONS
>  #
>  # Allow setting on a boolean basis, and then convert such selection to an
>  # integer for the build system and code to consume more easily.
> +#
> +# Requires clang >= 7.0.0
> +config CC_HAS_FUNCTION_ALIGNMENT
> +	def_bool $(cc-option,-falign-functions)
> +
>  config FUNCTION_ALIGNMENT_4B
>  	bool
>  config FUNCTION_ALIGNMENT_8B
> diff --git a/xen/Makefile b/xen/Makefile
> index 21832d640225..7c8249ab3a33 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -390,6 +390,7 @@ CFLAGS += -fomit-frame-pointer
>  endif
>  
>  CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
> +CFLAGS-$(CONFIG_CC_HAS_FUNCTION_ALIGNMENT) += -falign-functions=$(CONFIG_FUNCTION_ALIGNMENT)
>  
>  CFLAGS += -nostdinc -fno-builtin -fno-common
>  CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
> -- 
> 2.43.0
> 

