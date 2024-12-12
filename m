Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9159EE707
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856006.1268769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLib9-0000wO-04; Thu, 12 Dec 2024 12:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856006.1268769; Thu, 12 Dec 2024 12:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLib8-0000tV-TB; Thu, 12 Dec 2024 12:47:18 +0000
Received: by outflank-mailman (input) for mailman id 856006;
 Thu, 12 Dec 2024 12:47:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLib7-0000tP-V8
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:47:17 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36cf82ba-b887-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 13:47:15 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so978455a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:47:15 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3d00a0370sm8613889a12.6.2024.12.12.04.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 04:47:14 -0800 (PST)
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
X-Inumbo-ID: 36cf82ba-b887-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734007634; x=1734612434; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E+lwibPUPUtKfa/BiyW51T+1sphSyp6BBlkuj86kxWk=;
        b=p+CxU2qgLqufKXZD7o4KKI3pZx+UA942x+LWXJox0Kpz2UpQxBI06Ui2yrSGlPNq78
         IDb+1a4tTRJWv7cj9ENeBkBQlFxFL9t/rfN3fcBp6p5NxfwjoL0g6nWuLqeNFb0U1lf8
         8BXjbYDNSk2xfjxgn6nWp1fF/Lt7h/TeP0NM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007634; x=1734612434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+lwibPUPUtKfa/BiyW51T+1sphSyp6BBlkuj86kxWk=;
        b=Hit3bx1dUr0rvcQ1CmLEGyFnRkc2xY4ozZw3VbLRm9T4dGgbT7zd/jR2fJY3Go2o2h
         MonU0QQti7ZnGJTnfgtYcn9BdzM4zrxkPmBZLCHCeAUhupqfrxYiKGikcpLfMLTj+Qt/
         lzIS9ogjNHD21uj99FPKxI5SlCxEEz3zsNz9aEftV5FoEQes5YBvLU/0gPTNhWt22ApN
         P8PLOc8jLPmlOH3M6Dfmgx4QZmVxhEurK57XvaJ9Vz3PPBj0EW1tr1DicJX4aE40C1vW
         eX7v3jh/EbZFQCJDwLyAmJZnBVl3gMLjMbhnkW886vblfBB5UbWJ1K/hsCjvO4OZ8Wdj
         lDdg==
X-Gm-Message-State: AOJu0YxbsaZfaZ9sbHskShk7H0x8RvbyUZS4ohk2etsQ3MJ6o+R9FJZ7
	S+0a2O10yFW+GWSdHSYCT4+wroeffVqEPTOoC60gKZmchw2IChh/kpqZy1VdXmU=
X-Gm-Gg: ASbGncssEwI4U9sfDbWZM9IMmfJHQoBQPDI3fmPyZMfCJ2d4bo4Ry70zXFolwTYDGBS
	QdPVA79fpcd8RswLvWVxLrZe2QCWMrMzAE9jdM+OpBIGTH+bqvIL82YAyq1fMLLt3YHLUmbmMnZ
	AMc4wKYfX7HIM0NRphFnbXDNHAoIBUSx0iqr7/KogcZM+NHTX+jVcJBh1myYMBTPTykx294C4us
	Kyj9oAaCVraN9P2CGXrCpAf881uMxHrMx16nVfN1DZLR5GW47AnxI0mzULlvN1uMQ==
X-Google-Smtp-Source: AGHT+IFwaZQTVzw8SudTv1zJfT8BNoBN+MMOuMT6DdIyv6TMMmIRiTHdVHkkaJZ0Ec9YRhGvGsxlCA==
X-Received: by 2002:a05:6402:4304:b0:5d0:e73c:b7f6 with SMTP id 4fb4d7f45d1cf-5d633ea9bb0mr110675a12.31.1734007634503;
        Thu, 12 Dec 2024 04:47:14 -0800 (PST)
Date: Thu, 12 Dec 2024 13:47:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 26/35] xen/console: make console buffer size
 configurable
Message-ID: <Z1rbUfLQolFdMoi6@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-26-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-26-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:56PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add new CONRING_LOG_SHIFT Kconfig parameter to specify the boot console buffer
> size as a power of 2.
> 
> Bump default size to 32 KiB.
> 
> Link: https://gitlab.com/xen-project/xen/-/issues/185
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Thanks for taking care of this.

> ---
>  xen/drivers/char/Kconfig   | 23 +++++++++++++++++++++++
>  xen/drivers/char/console.c |  4 ++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index e6e12bb4139717f9319031f51f5d20155d2caee2..3bc892fc38d8cdeb3c76ea44d747f712a8d0d372 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -96,6 +96,29 @@ config SERIAL_TX_BUFSIZE
>  
>  	  Default value is 32768 (32KiB).
>  
> +config CONRING_LOG_SHIFT
> +	int "Console buffer size"
> +	range 14 25
> +	default 15
> +	help
> +	  Select the boot console buffer size as a power of 2.
> +	  Run-time console buffer size is the same as the boot console size,
> +	  unless enforced via 'conring_size=' boot parameter.
> +
> +	  Examples:
> +	    25 =>  32 MiB
> +	    24 =>  16 MiB
> +	    23 =>   8 MiB
> +	    22 =>   4 MiB
> +	    21 =>   2 MiB
> +	    20 =>   1 MiB
> +	    19 => 512 KiB
> +	    18 => 256 KiB
> +	    17 => 128 KiB
> +	    16 =>  64 KiB
> +	    15 =>  32 KiB
> +	    14 =>  16 KiB

It might be better to do something similar to what we do in
SERIAL_TX_BUFSIZE, that the user provides a value in KiB which is
rounded down to the nearest power of 2?

> +
>  config XHCI
>  	bool "XHCI DbC UART driver"
>  	depends on X86
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index d22fb4a253af26f9b51d91bd408e1dbf4bb5a7c1..581ee22b85302a54db5b9d5d28e8b2d689d31403 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -104,11 +104,11 @@ static int cf_check parse_console_timestamps(const char *s);
>  custom_runtime_param("console_timestamps", parse_console_timestamps,
>                       con_timestamp_mode_upd);
>  
> -/* conring_size: allows a large console ring than default (16kB). */
> +/* conring_size: allows a large console ring than default (32 KiB). */
>  static uint32_t __initdata opt_conring_size;
>  size_param("conring_size", opt_conring_size);

You also need to update xen-command-line.pandoc to mention the default
size is now set in Kconfig.  And here I would mention
CONFIG_CONRING_SIZE rather than explicit 32 KiB, because that's just
the default in Kconfig, but might not be the default in the build
itself.

FWIW, you could define:

#define _CONRING_SIZE        (CONFIG_CONRING_SIZE & (CONFIG_CONRING_SIZE - 1))

Thanks, Roger.

