Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8621F99958B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 00:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816567.1230715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz23h-0003mg-DB; Thu, 10 Oct 2024 22:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816567.1230715; Thu, 10 Oct 2024 22:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sz23h-0003kk-AP; Thu, 10 Oct 2024 22:55:01 +0000
Received: by outflank-mailman (input) for mailman id 816567;
 Thu, 10 Oct 2024 22:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKkP=RG=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sz23f-0003ke-Mf
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 22:54:59 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ababa910-875a-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 00:54:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id AEEFBA04C6;
 Fri, 11 Oct 2024 00:54:56 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMEPgG12ZKuc; Fri, 11 Oct 2024 00:54:56 +0200 (CEST)
Received: from begin.home (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 4B5CAA04BB;
 Fri, 11 Oct 2024 00:54:56 +0200 (CEST)
Received: from samy by begin.home with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sz23b-0000000Ft2s-3faP; Fri, 11 Oct 2024 00:54:55 +0200
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
X-Inumbo-ID: ababa910-875a-11ef-99a2-01e77a169b0f
Date: Fri, 11 Oct 2024 00:54:55 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 3/3] stubdom: use real lib dependencies for xenstore
 stubdoms
Message-ID: <ZwhbPyXIiAOm4rVY@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
References: <20241010155459.22389-1-jgross@suse.com>
 <20241010155459.22389-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010155459.22389-4-jgross@suse.com>
Organization: I am not organized

Juergen Gross, le jeu. 10 oct. 2024 17:54:59 +0200, a ecrit:
> Today the build of Xenstore stubdoms depend on libxenguest just because
> libxenguest depends on all needed libraries. In reality there is no
> dependency on libxenguest for Xenstore stubdoms.
> 
> Use the actual dependencies instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 6ed4253b25..2a81af28a1 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -523,12 +523,14 @@ else
>  pv-grub-if-enabled:
>  endif
>  
> +XENSTORE_DEPS := libxenevtchn libxengnttab libxenctrl
> +
>  .PHONY: xenstore-stubdom
> -xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
> +xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore $(XENSTORE_DEPS) xenstore
>  	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
>  
>  .PHONY: xenstorepvh-stubdom
> -xenstorepvh-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstorepvh libxenguest xenstorepvh
> +xenstorepvh-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstorepvh $(XENSTORE_DEPS) xenstorepvh
>  	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstorepvh-minios.gen.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstorepvh/xenstored.a
>  
>  #########
> -- 
> 2.43.0

