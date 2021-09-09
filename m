Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186D8404784
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182815.330601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFyH-0001gH-Dx; Thu, 09 Sep 2021 09:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182815.330601; Thu, 09 Sep 2021 09:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFyH-0001e6-Az; Thu, 09 Sep 2021 09:03:49 +0000
Received: by outflank-mailman (input) for mailman id 182815;
 Thu, 09 Sep 2021 09:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+l3J=N7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mOFyG-0001e0-7u
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:03:48 +0000
Received: from mail2-relais-roc.national.inria.fr (unknown [192.134.164.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d28ec08-0786-4d54-8c32-180c343af04a;
 Thu, 09 Sep 2021 09:03:47 +0000 (UTC)
Received: from unknown (HELO begin) ([193.50.111.40])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 11:03:43 +0200
Received: from samy by begin with local (Exim 4.95-RC2)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mOFyB-00FcqH-Gr;
 Thu, 09 Sep 2021 11:03:43 +0200
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
X-Inumbo-ID: 2d28ec08-0786-4d54-8c32-180c343af04a
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AdESmtaCmo3oSFmLlHemu55DYdb4zR+YMi2TD?=
 =?us-ascii?q?GXocdfUnSL3+qynOpoV+6faaslYssR0b9uxofZPwJE80lqQFg7X5X43CYOCOgg?=
 =?us-ascii?q?LBEGgh1+HfKlbbcBEWmNQx6U4tSdkcNDWsYGIVsfrH?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="527510806"
Date: Thu, 9 Sep 2021 11:03:43 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] stubdom: fix build with disabled pv-grub
Message-ID: <20210909090343.fqlc5vt35kfkqru6@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210909082705.9434-1-jgross@suse.com>
 <20210909082705.9434-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909082705.9434-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le jeu. 09 sept. 2021 10:27:04 +0200, a ecrit:
> Today the build will fail if --disable-pv-grub as a parameter of
> configure, as the main Makefile will unconditionally try to build a
> 32-bit pv-grub stubdom.
> 
> Fix that by introducing a pv-grub32 target in stubdom/Makefile taking
> care of this situation.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  Makefile         |  4 ++--
>  stubdom/Makefile | 13 +++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 96d32cfd50..5b5cef3e49 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -72,7 +72,7 @@ build-tools-oxenstored: build-tools-public-headers
>  build-stubdom: mini-os-dir build-tools-public-headers
>  	$(MAKE) -C stubdom build
>  ifeq (x86_64,$(XEN_TARGET_ARCH))
> -	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub
> +	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom pv-grub32
>  endif
>  
>  .PHONY: build-docs
> @@ -143,7 +143,7 @@ install-tools: install-tools-public-headers
>  install-stubdom: mini-os-dir install-tools
>  	$(MAKE) -C stubdom install
>  ifeq (x86_64,$(XEN_TARGET_ARCH))
> -	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub
> +	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub32
>  endif
>  
>  .PHONY: tools/firmware/seabios-dir-force-update
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 06aa69d8bc..b339ae701c 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -531,6 +531,13 @@ vtpmmgr-stubdom: mini-os-$(XEN_TARGET_ARCH)-vtpmmgr vtpmmgr
>  pv-grub: mini-os-$(XEN_TARGET_ARCH)-grub libxenguest grub
>  	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/grub/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/grub-$(XEN_TARGET_ARCH)/main.a
>  
> +.PHONY: pv-grub32
> +ifneq ($(filter grub,$(STUBDOM_TARGETS)),)
> +pv-grub32: pv-grub
> +else
> +pv-grub32:
> +endif
> +
>  .PHONY: xenstore-stubdom
>  xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
>  	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
> @@ -560,6 +567,12 @@ install-grub: pv-grub
>  	$(INSTALL_DIR) "$(DESTDIR)$(XENFIRMWAREDIR)"
>  	$(INSTALL_DATA) mini-os-$(XEN_TARGET_ARCH)-grub/mini-os.gz "$(DESTDIR)$(XENFIRMWAREDIR)/pv-grub-$(XEN_TARGET_ARCH).gz"
>  
> +ifneq ($(filter grub,$(STUBDOM_TARGETS)),)
> +install-grub32: install-grub
> +else
> +install-grub32:
> +endif
> +
>  install-c: c-stubdom
>  
>  install-caml: caml-stubdom
> -- 
> 2.26.2
> 

-- 
Samuel
The nice thing about Windows is - It does not just crash, it displays a
dialog box and lets you press 'OK' first.
(Arno Schaefer's .sig)

