Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4303EEABA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 12:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167703.306146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFw7N-0002kO-8z; Tue, 17 Aug 2021 10:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167703.306146; Tue, 17 Aug 2021 10:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFw7N-0002iE-3g; Tue, 17 Aug 2021 10:14:49 +0000
Received: by outflank-mailman (input) for mailman id 167703;
 Tue, 17 Aug 2021 10:14:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O7ht=NI=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mFw7L-0002fi-5T
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 10:14:47 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f536afc-b243-4627-a5cb-be3615a70d6e;
 Tue, 17 Aug 2021 10:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 761F4140;
 Tue, 17 Aug 2021 12:14:37 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdcDoQExvbwW; Tue, 17 Aug 2021 12:14:33 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id C61A1B8;
 Tue, 17 Aug 2021 12:14:31 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1mFw74-002XiE-Na; Tue, 17 Aug 2021 12:14:30 +0200
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
X-Inumbo-ID: 4f536afc-b243-4627-a5cb-be3615a70d6e
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 17 Aug 2021 12:14:30 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/2] mini-os: make config handling more generic
Message-ID: <20210817101430.fzr25viy54ygagnp@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20210817095459.27671-1-jgross@suse.com>
 <20210817095459.27671-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210817095459.27671-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 761F4140
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

Juergen Gross, le mar. 17 août 2021 11:54:58 +0200, a ecrit:
> When adding a new CONFIG_ variable this needs to be done in multiple
> places. Change the handling to be more generic.
> 
> This at once fixes a bug with CONFIG_XC which was not defined for the
> C preprocessor (it seems that this never resulted in any real issues,
> though).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  Config.mk | 66 +++++++++++++++++++++++--------------------------------
>  1 file changed, 28 insertions(+), 38 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index cb823c2..15311ef 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -171,49 +171,39 @@ endif
>  # CONFIG_ variables.
>  
>  # Configuration defaults
> +CONFIG-y += CONFIG_START_NETWORK
> +CONFIG-y += CONFIG_SPARSE_BSS
> +CONFIG-y += CONFIG_BLKFRONT
> +CONFIG-y += CONFIG_NETFRONT
> +CONFIG-y += CONFIG_FBFRONT
> +CONFIG-y += CONFIG_KBDFRONT
> +CONFIG-y += CONFIG_CONSFRONT
> +CONFIG-y += CONFIG_XENBUS
> +CONFIG-y += CONFIG_XC
> +CONFIG-n += CONFIG_QEMU_XS_ARGS
> +CONFIG-n += CONFIG_TEST
> +CONFIG-n += CONFIG_PCIFRONT
> +CONFIG-n += CONFIG_TPMFRONT
> +CONFIG-n += CONFIG_TPM_TIS
> +CONFIG-n += CONFIG_TPMBACK
> +CONFIG-n += CONFIG_BALLOON
> +# Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
> +# console apart of standard dom0 handled console.
> +CONFIG-n += CONFIG_USE_XEN_CONSOLE
>  ifeq ($(TARGET_ARCH_FAM),x86)
> -CONFIG_PARAVIRT ?= y
> +CONFIG-y += CONFIG_PARAVIRT
>  else
> -CONFIG_PARAVIRT ?= n
> +CONFIG-n += CONFIG_PARAVIRT
>  endif
> -CONFIG_START_NETWORK ?= y
> -CONFIG_SPARSE_BSS ?= y
> -CONFIG_QEMU_XS_ARGS ?= n
> -CONFIG_TEST ?= n
> -CONFIG_PCIFRONT ?= n
> -CONFIG_BLKFRONT ?= y
> -CONFIG_TPMFRONT ?= n
> -CONFIG_TPM_TIS ?= n
> -CONFIG_TPMBACK ?= n
> -CONFIG_NETFRONT ?= y
> -CONFIG_FBFRONT ?= y
> -CONFIG_KBDFRONT ?= y
> -CONFIG_CONSFRONT ?= y
> -CONFIG_XENBUS ?= y
> -CONFIG_XC ?=y
> -CONFIG_LWIP ?= $(lwip)
> -CONFIG_BALLOON ?= n
> -# Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
> -# console apart of standard dom0 handled console.
> -CONFIG_USE_XEN_CONSOLE ?= n
> +CONFIG-$(lwip) += CONFIG_LWIP
> +
> +$(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
> +$(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
> +
> +CONFIG-all := $(CONFIG-y) $(CONFIG-n)
>  
>  # Export config items as compiler directives
> -DEFINES-$(CONFIG_PARAVIRT) += -DCONFIG_PARAVIRT
> -DEFINES-$(CONFIG_START_NETWORK) += -DCONFIG_START_NETWORK
> -DEFINES-$(CONFIG_SPARSE_BSS) += -DCONFIG_SPARSE_BSS
> -DEFINES-$(CONFIG_QEMU_XS_ARGS) += -DCONFIG_QEMU_XS_ARGS
> -DEFINES-$(CONFIG_PCIFRONT) += -DCONFIG_PCIFRONT
> -DEFINES-$(CONFIG_BLKFRONT) += -DCONFIG_BLKFRONT
> -DEFINES-$(CONFIG_TPMFRONT) += -DCONFIG_TPMFRONT
> -DEFINES-$(CONFIG_TPM_TIS) += -DCONFIG_TPM_TIS
> -DEFINES-$(CONFIG_TPMBACK) += -DCONFIG_TPMBACK
> -DEFINES-$(CONFIG_NETFRONT) += -DCONFIG_NETFRONT
> -DEFINES-$(CONFIG_KBDFRONT) += -DCONFIG_KBDFRONT
> -DEFINES-$(CONFIG_FBFRONT) += -DCONFIG_FBFRONT
> -DEFINES-$(CONFIG_CONSFRONT) += -DCONFIG_CONSFRONT
> -DEFINES-$(CONFIG_XENBUS) += -DCONFIG_XENBUS
> -DEFINES-$(CONFIG_BALLOON) += -DCONFIG_BALLOON
> -DEFINES-$(CONFIG_USE_XEN_CONSOLE) += -DCONFIG_USE_XEN_CONSOLE
> +$(foreach i,$(CONFIG-all),$(eval DEFINES-$($(i)) += -D$(i)))
>  
>  DEFINES-y += -D__XEN_INTERFACE_VERSION__=$(XEN_INTERFACE_VERSION)

