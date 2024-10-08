Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3D994439
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 11:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812937.1225688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6VH-0005DA-3Q; Tue, 08 Oct 2024 09:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812937.1225688; Tue, 08 Oct 2024 09:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6VG-0005BF-WF; Tue, 08 Oct 2024 09:27:39 +0000
Received: by outflank-mailman (input) for mailman id 812937;
 Tue, 08 Oct 2024 09:27:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=95Tx=RE=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sy6VF-0005B9-59
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 09:27:37 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d160c27-8557-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 11:27:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 99451A0522;
 Tue,  8 Oct 2024 11:27:34 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CZnuJGKckHA; Tue,  8 Oct 2024 11:27:34 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 7E874A0507;
 Tue,  8 Oct 2024 11:27:34 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sy6VC-0000000CBdi-1H4u; Tue, 08 Oct 2024 11:27:34 +0200
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
X-Inumbo-ID: 8d160c27-8557-11ef-99a2-01e77a169b0f
Date: Tue, 8 Oct 2024 11:27:34 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 2/4] stubdom: explcitly add libc and lwip Mini-OS config
 options
Message-ID: <ZwT7Bvl4OXe3e_N2@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20241005151548.29184-1-jgross@suse.com>
 <20241005151548.29184-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241005151548.29184-3-jgross@suse.com>
Organization: I am not organized

Juergen Gross, le sam. 05 oct. 2024 17:15:46 +0200, a ecrit:
> Today the Mini-OS build systems derives libc and lwip config options
> from the stubdom and LWIPDIR make variables supplied by the Xen build
> system.
> 
> In order to prepare those being explicit Mini-OS config options, add
> them to the related stubdom Mini-OS config files.
> 
> While at it remove the CONFIG_START_NETWORK setting from config files
> disabling lwip, as CONFIG_START_NETWORK requires lwip for becoming
> effective.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/c/minios.cfg           | 2 ++
>  stubdom/grub/minios.cfg        | 3 ++-
>  stubdom/ioemu-minios.cfg       | 2 ++
>  stubdom/vtpm/minios.cfg        | 3 ++-
>  stubdom/vtpmmgr/minios.cfg     | 3 ++-
>  stubdom/xenstore-minios.cfg    | 1 +
>  stubdom/xenstorepvh-minios.cfg | 1 +
>  7 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/stubdom/c/minios.cfg b/stubdom/c/minios.cfg
> index e69de29bb2..56d65510cd 100644
> --- a/stubdom/c/minios.cfg
> +++ b/stubdom/c/minios.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_LIBC=y
> +CONFIG_LWIP=y
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
> diff --git a/stubdom/ioemu-minios.cfg b/stubdom/ioemu-minios.cfg
> index a65baa3765..6153ae05f8 100644
> --- a/stubdom/ioemu-minios.cfg
> +++ b/stubdom/ioemu-minios.cfg
> @@ -1,3 +1,5 @@
> +CONFIG_LIBC=y
> +CONFIG_LWIP=y
>  CONFIG_START_NETWORK=n
>  CONFIG_QEMU_XS_ARGS=y
>  CONFIG_PCIFRONT=y
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
> diff --git a/stubdom/xenstore-minios.cfg b/stubdom/xenstore-minios.cfg
> index 239da519b9..0252b59432 100644
> --- a/stubdom/xenstore-minios.cfg
> +++ b/stubdom/xenstore-minios.cfg
> @@ -1,3 +1,4 @@
> +CONFIG_LIBC=y
>  CONFIG_BLKFRONT=n
>  CONFIG_NETFRONT=n
>  CONFIG_FBFRONT=n
> diff --git a/stubdom/xenstorepvh-minios.cfg b/stubdom/xenstorepvh-minios.cfg
> index 752b90d7d3..62a228f33d 100644
> --- a/stubdom/xenstorepvh-minios.cfg
> +++ b/stubdom/xenstorepvh-minios.cfg
> @@ -1,3 +1,4 @@
> +CONFIG_LIBC=y
>  CONFIG_PARAVIRT=n
>  CONFIG_BLKFRONT=n
>  CONFIG_NETFRONT=n
> -- 
> 2.43.0
> 

-- 
Samuel
Pour un père, autant mourir que de faire plein de calculs et pas s'occuper
de son fils
 -+- y sur #ens-mim - sombres histoires de zombies -+-

