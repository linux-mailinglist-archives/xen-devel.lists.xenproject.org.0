Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C005C99398E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812533.1225323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvd3-0001Cp-BQ; Mon, 07 Oct 2024 21:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812533.1225323; Mon, 07 Oct 2024 21:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvd3-00019v-8Q; Mon, 07 Oct 2024 21:50:57 +0000
Received: by outflank-mailman (input) for mailman id 812533;
 Mon, 07 Oct 2024 21:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4SUe=RD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sxvd1-00019p-4g
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:50:55 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3986e886-84f6-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 23:50:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 3529DA04EB;
 Mon,  7 Oct 2024 23:50:53 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTi6RukUwb9d; Mon,  7 Oct 2024 23:50:53 +0200 (CEST)
Received: from begin (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id E95A2A04E8;
 Mon,  7 Oct 2024 23:50:52 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sxvcy-0000000A4XW-22Yd; Mon, 07 Oct 2024 23:50:52 +0200
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
X-Inumbo-ID: 3986e886-84f6-11ef-a0bb-8be0dac302b0
Date: Mon, 7 Oct 2024 23:50:52 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 2/4] stubdom: explcitly add libc and lwip Mini-OS config
 options
Message-ID: <ZwRXvG4a2Jtgba2s@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20241005151548.29184-1-jgross@suse.com>
 <20241005151548.29184-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005151548.29184-3-jgross@suse.com>
Organization: I am not organized

> diff --git a/stubdom/grub/minios.cfg b/stubdom/grub/minios.cfg
> index 8df49092cd..5145b357e0 100644
> --- a/stubdom/grub/minios.cfg
> +++ b/stubdom/grub/minios.cfg
> @@ -1,3 +1,4 @@
> -CONFIG_START_NETWORK=n
> +CONFIG_LIBC=y
> +CONFIG_LWIP=n
>  CONFIG_SPARSE_BSS=n
>  CONFIG_TPMFRONT=y

Grub does use LWIP, and just does not want mini-os to start network
automatically, grub does so by itself from minios_probe.

> diff --git a/stubdom/vtpm/minios.cfg b/stubdom/vtpm/minios.cfg
> index 31652ee4f2..22f66f1351 100644
> --- a/stubdom/vtpm/minios.cfg
> +++ b/stubdom/vtpm/minios.cfg
> @@ -1,7 +1,8 @@
> +CONFIG_LIBC=y
> +CONFIG_LWIP=n
>  CONFIG_TPMFRONT=y
>  CONFIG_TPM_TIS=n
>  CONFIG_TPMBACK=y
> -CONFIG_START_NETWORK=n
>  CONFIG_TEST=n
>  CONFIG_PCIFRONT=n
>  CONFIG_BLKFRONT=y
> diff --git a/stubdom/vtpmmgr/minios.cfg b/stubdom/vtpmmgr/minios.cfg
> index 3fb383d30f..a9f13a2fd2 100644
> --- a/stubdom/vtpmmgr/minios.cfg
> +++ b/stubdom/vtpmmgr/minios.cfg
> @@ -1,7 +1,8 @@
> +CONFIG_LIBC=y
> +CONFIG_LWIP=n
>  CONFIG_TPMFRONT=y
>  CONFIG_TPM_TIS=y
>  CONFIG_TPMBACK=y
> -CONFIG_START_NETWORK=n
>  CONFIG_TEST=n
>  CONFIG_PCIFRONT=n
>  CONFIG_BLKFRONT=y

I guess vtpm indeed don't need lwip.

Samuel

