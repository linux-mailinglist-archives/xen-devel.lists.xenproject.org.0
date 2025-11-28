Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78BC92D1E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 18:43:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175047.1499963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP2UB-0005nN-BG; Fri, 28 Nov 2025 17:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175047.1499963; Fri, 28 Nov 2025 17:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP2UB-0005lf-8B; Fri, 28 Nov 2025 17:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1175047;
 Fri, 28 Nov 2025 17:42:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vP2UA-0005lZ-0i
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 17:42:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vP2U9-00Cyma-0x;
 Fri, 28 Nov 2025 17:42:21 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vP2U8-0049nB-2o;
 Fri, 28 Nov 2025 17:42:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=3OLmEvxbXHIN6KYekbzt0gxl/qjX6Z+BbIFDRQZriH0=; b=ULvt6KciEPqhrwmeDuUq7DRiJt
	7cZ92SVzsrRFL4glbOjzfsZza3mRVjw5qS+qUWMXjbwknEyWebMa8hXbrLiOmmh/kzUQ/MXQf4yLh
	JnOPL0F14s16P2FeXzsHdd2p0fT2P5JTNmVpqetWo+MUHG2+tYk3pRpHU/21f+7bl8BY=;
Date: Fri, 28 Nov 2025 18:42:19 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 7/8] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Message-ID: <aSne-50OjHHtec7v@l14>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <6da5b8b1aad1af18cf6ed352697ad39786adc37e.1762939773.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6da5b8b1aad1af18cf6ed352697ad39786adc37e.1762939773.git.mykyta_poturai@epam.com>

On Wed, Nov 12, 2025 at 10:51:49AM +0000, Mykyta Poturai wrote:
> With CPU hotplug sysctls implemented on Arm it becomes useful to have a
> tool for calling them. Introduce a new congifure option "hptool" to
> allow building hptool separately from other migration tools, and enable
> it by default.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 

You should had a line with just "---" around here, right after the
Signed-off-by, and before the changelog. That way, when we commit the
patch, git will automatically discard this patch changelog. Notice that
git do just that before adding stats about file changes.

> v3->v4:
> * no changes
> 
> v2->v3:
> * no changes
> 
> v1->v2:
> * switch to configure from legacy config
> ---
>  config/Tools.mk.in               |  1 +
>  tools/configure                  | 30 ++++++++++++++++++++++++++++++
>  tools/configure.ac               |  1 +
>  tools/libs/guest/Makefile.common |  4 ++++
>  tools/misc/Makefile              |  2 +-
>  5 files changed, 37 insertions(+), 1 deletion(-)
>  mode change 100755 => 100644 tools/configure
> 
> diff --git a/config/Tools.mk.in b/config/Tools.mk.in
> index 0037ad5a64..d5855ca090 100644
> --- a/config/Tools.mk.in
> +++ b/config/Tools.mk.in
> @@ -49,6 +49,7 @@ CONFIG_LIBNL        := @libnl@
>  CONFIG_GOLANG       := @golang@
>  CONFIG_PYGRUB       := @pygrub@
>  CONFIG_LIBFSIMAGE   := @libfsimage@
> +CONFIG_HPTOOL       := @hptool@
>  
>  CONFIG_SYSTEMD      := @systemd@
>  XEN_SYSTEMD_DIR     := @SYSTEMD_DIR@
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 285b4ea128..28a0c095c2 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -90,6 +90,7 @@ AX_ARG_DEFAULT_DISABLE([ovmf], [Enable OVMF])
>  AX_ARG_DEFAULT_ENABLE([seabios], [Disable SeaBIOS])
>  AX_ARG_DEFAULT_ENABLE([golang], [Disable Go tools])
>  AX_ARG_DEFAULT_ENABLE([pygrub], [Disable pygrub])
> +AX_ARG_DEFAULT_ENABLE([hptool], [Disable hptool])
>  
>  AC_ARG_WITH([linux-backend-modules],
>      AS_HELP_STRING([--with-linux-backend-modules="mod1 mod2"],
> diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
> index a026a2f662..774b1d5392 100644
> --- a/tools/libs/guest/Makefile.common
> +++ b/tools/libs/guest/Makefile.common
> @@ -25,6 +25,10 @@ OBJS-y       += xg_core.o
>  OBJS-$(CONFIG_X86) += xg_core_x86.o
>  OBJS-$(CONFIG_ARM) += xg_core_arm.o
>  
> +ifneq (,$(filter y,$(CONFIG_MIGRATE)$(CONFIG_HPTOOL)))

How is this supposed to work?

> +OBJS-y += xg_offline_page.o
> +endif
> +
>  vpath %.c ../../../xen/common/libelf
>  
>  LIBELF_OBJS += libelf-tools.o libelf-loader.o
> diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> index c26e544e83..f783f16ae6 100644
> --- a/tools/misc/Makefile
> +++ b/tools/misc/Makefile
> @@ -16,7 +16,7 @@ INSTALL_BIN                    += xencov_split
>  INSTALL_BIN += $(INSTALL_BIN-y)
>  
>  # Everything to be installed in regular sbin/
> -INSTALL_SBIN-$(CONFIG_MIGRATE) += xen-hptool
> +INSTALL_SBIN-$(CONFIG_HPTOOL)  += xen-hptool

So, I've look at the history as to why "xen-hptool" was only compiled
for CONFIG_MIGRATE, and it was because "xc_offline_page.c" didn't build
on ia64, commit 6b0b6e01b967 ("tools: disable xen-hptool on ia64").

And hiding xc_offline_page.c behind CONFIG_MIGRATE was probably just a
short-cut, 310311cd8863 ("libxc: fix link error on ia64") because I
guess the needed functions where behind this value at the time.

("xc_offline_page.c" is now "xg_offline_page.c")

This patch now build xen-hptool, and "xg_offline_page.c" by default. Does
this actually build on every architecture? We don't really have
per-binary configuration option, and having a library (libxenguest)
which get different functionality depending on which tool we want to
build doesn't seems to be the right thing to do.

If xg_offline_page.c can now be built on every architecture, how about
building it by default? Then, we can always build xen-hptool.

Thanks,

-- 
Anthony PERARD

