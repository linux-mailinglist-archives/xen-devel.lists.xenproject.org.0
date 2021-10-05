Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD09F4232CC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 23:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202493.357443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXrxO-0006e6-OW; Tue, 05 Oct 2021 21:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202493.357443; Tue, 05 Oct 2021 21:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXrxO-0006cJ-LP; Tue, 05 Oct 2021 21:26:38 +0000
Received: by outflank-mailman (input) for mailman id 202493;
 Tue, 05 Oct 2021 21:26:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hd/I=OZ=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mXrxN-0006cD-7i
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 21:26:37 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 008071b5-0b90-4e3c-9f0b-7548d29c184c;
 Tue, 05 Oct 2021 21:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 28C29456;
 Tue,  5 Oct 2021 23:26:33 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xkkca_-2_iAr; Tue,  5 Oct 2021 23:26:32 +0200 (CEST)
Received: from begin.home (acaen-652-1-186-147.w86-215.abo.wanadoo.fr
 [86.215.106.147])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 980D9243;
 Tue,  5 Oct 2021 23:26:31 +0200 (CEST)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mXrxG-00G23n-Fl;
 Tue, 05 Oct 2021 23:26:30 +0200
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
X-Inumbo-ID: 008071b5-0b90-4e3c-9f0b-7548d29c184c
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 5 Oct 2021 23:26:30 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/2] mini-os: fix testbuilds regarding CONFIG_XC
Message-ID: <20211005212630.cj7z6xcuyb4iqvyv@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211004141924.7088-1-jgross@suse.com>
 <20211004141924.7088-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004141924.7088-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 28C29456
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Juergen Gross, le lun. 04 oct. 2021 16:19:23 +0200, a ecrit:
> CONFIG_GC is requiring external support, so disable it in testbuilds.
> 
> The only reason this is working right now is its usage being inside
> a HAVE_LIBC section.
> 
> Make that more obvious by making the default setting of CONFIG_XC
> depending on libc being available.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  Config.mk                     | 3 ++-
>  arch/x86/testbuild/all-yes    | 3 ++-
>  arch/x86/testbuild/newxen-yes | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index 15311ef..8f4cea9 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -62,6 +62,7 @@ MINIOS_COMPILE_ARCH    ?= $(shell uname -m | sed -e s/i.86/x86_32/ \
>  MINIOS_TARGET_ARCH     ?= $(MINIOS_COMPILE_ARCH)
>  endif
>  
> +stubdom ?= n
>  libc = $(stubdom)
>  
>  XEN_INTERFACE_VERSION ?= 0x00030205
> @@ -179,7 +180,6 @@ CONFIG-y += CONFIG_FBFRONT
>  CONFIG-y += CONFIG_KBDFRONT
>  CONFIG-y += CONFIG_CONSFRONT
>  CONFIG-y += CONFIG_XENBUS
> -CONFIG-y += CONFIG_XC
>  CONFIG-n += CONFIG_QEMU_XS_ARGS
>  CONFIG-n += CONFIG_TEST
>  CONFIG-n += CONFIG_PCIFRONT
> @@ -195,6 +195,7 @@ CONFIG-y += CONFIG_PARAVIRT
>  else
>  CONFIG-n += CONFIG_PARAVIRT
>  endif
> +CONFIG-$(libc) += CONFIG_XC
>  CONFIG-$(lwip) += CONFIG_LWIP
>  
>  $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index 8732e69..5464342 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -13,7 +13,8 @@ CONFIG_FBFRONT = y
>  CONFIG_KBDFRONT = y
>  CONFIG_CONSFRONT = y
>  CONFIG_XENBUS = y
> -CONFIG_XC = y
> +# XC is special: it needs support from outside
> +CONFIG_XC = n
>  # LWIP is special: it needs support from outside
>  CONFIG_LWIP = n
>  CONFIG_BALLOON = y
> diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
> index 9c30c00..2a3ed2e 100644
> --- a/arch/x86/testbuild/newxen-yes
> +++ b/arch/x86/testbuild/newxen-yes
> @@ -13,7 +13,8 @@ CONFIG_FBFRONT = y
>  CONFIG_KBDFRONT = y
>  CONFIG_CONSFRONT = y
>  CONFIG_XENBUS = y
> -CONFIG_XC = y
> +# XC is special: it needs support from outside
> +CONFIG_XC = n
>  # LWIP is special: it needs support from outside
>  CONFIG_LWIP = n
>  CONFIG_BALLOON = y
> -- 
> 2.26.2
> 

-- 
Samuel
<k> faut en profiter, aujourd'hui, les blagues bidon sont à 100 dollars
 -+- #sos-bourse -+-

