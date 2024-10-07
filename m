Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E969939EA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 00:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812557.1225337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvyx-0005gf-4f; Mon, 07 Oct 2024 22:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812557.1225337; Mon, 07 Oct 2024 22:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvyx-0005dM-1d; Mon, 07 Oct 2024 22:13:35 +0000
Received: by outflank-mailman (input) for mailman id 812557;
 Mon, 07 Oct 2024 22:13:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4SUe=RD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sxvyw-0005cx-Gz
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 22:13:34 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62190f25-84f9-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 00:13:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 9F041A04F7;
 Tue,  8 Oct 2024 00:13:29 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuvIWjaylGeg; Tue,  8 Oct 2024 00:13:29 +0200 (CEST)
Received: from begin (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 83527A048A;
 Tue,  8 Oct 2024 00:13:29 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sxvyr-0000000AIBP-0WPb; Tue, 08 Oct 2024 00:13:29 +0200
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
X-Inumbo-ID: 62190f25-84f9-11ef-99a2-01e77a169b0f
Date: Tue, 8 Oct 2024 00:13:29 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [MINI-OS PATCH 2/2] drop CONFIG_XC support
Message-ID: <ZwRdCU20l8PUPQ-V@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
References: <20241007103456.14946-1-jgross@suse.com>
 <20241007103456.14946-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007103456.14946-3-jgross@suse.com>
Organization: I am not organized

Juergen Gross, le lun. 07 oct. 2024 12:34:56 +0200, a ecrit:
> CONFIG_XC is no longer needed with individual CONFIG_LIBXEN support.

I don't really see why in the previous patch you introduced
compatibility and here you remove it?

Samuel

> Remove it, while disabling the CONFIG_LIBXEN items by default.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  Config.mk | 30 +++++++++---------------------
>  1 file changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index d0fbacac..f59a0cf4 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -193,6 +193,15 @@ CONFIG-n += CONFIG_9PFRONT
>  CONFIG-n += CONFIG_TPM_TIS
>  CONFIG-n += CONFIG_TPMBACK
>  CONFIG-n += CONFIG_BALLOON
> +CONFIG-n += CONFIG_LIBXENCALL
> +CONFIG-n += CONFIG_LIBXENCTRL
> +CONFIG-n += CONFIG_LIBXENDEVICEMODEL
> +CONFIG-n += CONFIG_LIBXENEVTCHN
> +CONFIG-n += CONFIG_LIBXENFOREIGNMEMORY
> +CONFIG-n += CONFIG_LIBXENGNTTAB
> +CONFIG-n += CONFIG_LIBXENGUEST
> +CONFIG-n += CONFIG_LIBXENTOOLCORE
> +CONFIG-n += CONFIG_LIBXENTOOLLOG
>  # Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
>  # console apart of standard dom0 handled console.
>  CONFIG-n += CONFIG_USE_XEN_CONSOLE
> @@ -201,8 +210,6 @@ CONFIG-y += CONFIG_PARAVIRT
>  else
>  CONFIG-n += CONFIG_PARAVIRT
>  endif
> -# Support legacy CONFIG_XC value
> -CONFIG_XC ?= $(libc)
>  
>  CONFIG-$(lwip) += CONFIG_LWIP
>  
> @@ -212,25 +219,6 @@ $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
>  CONFIG-x += CONFIG_LIBXS
>  CONFIG_LIBXS ?= $(CONFIG_XENBUS)
>  
> -CONFIG-x += CONFIG_LIBXENCALL
> -CONFIG-x += CONFIG_LIBXENCTRL
> -CONFIG-x += CONFIG_LIBXENDEVICEMODEL
> -CONFIG-x += CONFIG_LIBXENEVTCHN
> -CONFIG-x += CONFIG_LIBXENFOREIGNMEMORY
> -CONFIG-x += CONFIG_LIBXENGNTTAB
> -CONFIG-x += CONFIG_LIBXENGUEST
> -CONFIG-x += CONFIG_LIBXENTOOLCORE
> -CONFIG-x += CONFIG_LIBXENTOOLLOG
> -CONFIG_LIBXENCALL ?= $(CONFIG_XC)
> -CONFIG_LIBXENCTRL ?= $(CONFIG_XC)
> -CONFIG_LIBXENDEVICEMODEL ?= $(CONFIG_XC)
> -CONFIG_LIBXENEVTCHN ?= $(CONFIG_XC)
> -CONFIG_LIBXENFOREIGNMEMORY ?= $(CONFIG_XC)
> -CONFIG_LIBXENGNTTAB ?= $(CONFIG_XC)
> -CONFIG_LIBXENGUEST ?= $(CONFIG_XC)
> -CONFIG_LIBXENTOOLCORE ?= $(CONFIG_XC)
> -CONFIG_LIBXENTOOLLOG ?= $(CONFIG_XC)
> -
>  CONFIG-all := $(CONFIG-y) $(CONFIG-n) $(CONFIG-x)
>  
>  # Export config items as compiler directives
> -- 
> 2.43.0
> 

-- 
Samuel
 Cliquez sur le lien qui suit dans ce mail...vous n'avez plus qu'a vous
 inscrire pour gagner de l'argent en restant connecte....et puis faites
 passer le message et vous gagnerez encore plus d'argent ...
 -+- AC in NPC : Neuneu a rencontré le Pere Noël -+-

