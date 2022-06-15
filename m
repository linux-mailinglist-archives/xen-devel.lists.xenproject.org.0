Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E8854D56E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 01:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350341.576647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1cd6-0007uJ-9Q; Wed, 15 Jun 2022 23:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350341.576647; Wed, 15 Jun 2022 23:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1cd6-0007r7-4X; Wed, 15 Jun 2022 23:40:56 +0000
Received: by outflank-mailman (input) for mailman id 350341;
 Wed, 15 Jun 2022 23:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o1cd5-0007qv-6r
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 23:40:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97dcbcfe-ed04-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 01:40:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 028EA619C5;
 Wed, 15 Jun 2022 23:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE0AC3411A;
 Wed, 15 Jun 2022 23:40:51 +0000 (UTC)
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
X-Inumbo-ID: 97dcbcfe-ed04-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655336451;
	bh=oSj2REQ5qGLGBBrSe5qR+g1EGWydDN+7KvkPWe4Dyo4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LUW1bMXvrBoJoj1dB2FuYZFam/bHc7Ly+IxnWxq6Eb8tkpXlgcaemVUcTi8TY4Mj6
	 uHZLAofAPPPATkiVmcMgvzpBt62ULG6W6WGlXSJGSocKm3EFl3Z8hx0RCnMvyecbzY
	 WLLEW+JmY1nObyduCjwaVJfMU8rdhhVpDjLZzvIU4VvLwXf8/ZlyeF1dtohOyzFKSu
	 y8zUBntYlUWGr/91mAzroQtwqdOzKbJoEawyIF/BwKQoECNk0wFztH29gRlL7r4aN8
	 oOZ6g0VIMBXuP+1EKhMpG4IYmehNZyQ2KnPhCGHeYpGcIPz9M6QPoCSvKLbOoywOEW
	 VU8wLej/gSrQQ==
Date: Wed, 15 Jun 2022 16:40:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV
 guests
In-Reply-To: <20220615084835.27113-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2206151336230.2430546@ubuntu-linux-20-04-desktop>
References: <20220615084835.27113-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jun 2022, Juergen Gross wrote:
> Commit fa1f57421e0b ("xen/virtio: Enable restricted memory access using
> Xen grant mappings") introduced a new requirement for using virtio
> devices: the backend now needs to support the VIRTIO_F_ACCESS_PLATFORM
> feature.
> 
> This is an undue requirement for non-PV guests, as those can be operated
> with existing backends without any problem, as long as those backends
> are running in dom0.
> 
> Per default allow virtio devices without grant support for non-PV
> guests.
> 
> The setting can be overridden by using the new "xen_virtio_grant"
> command line parameter.
> 
> Add a new config item to always force use of grants for virtio.
> 
> Fixes: fa1f57421e0b ("xen/virtio: Enable restricted memory access using Xen grant mappings")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  6 +++++
>  drivers/xen/Kconfig                           |  9 ++++++++
>  drivers/xen/grant-dma-ops.c                   | 22 +++++++++++++++++++
>  include/xen/xen.h                             | 12 +++++-----
>  4 files changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 8090130b544b..7960480c6fe4 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6695,6 +6695,12 @@
>  			improve timer resolution at the expense of processing
>  			more timer interrupts.
>  
> +	xen_virtio_grant= [XEN]
> +			Control whether virtio devices are required to use
> +			grants when running as a Xen guest. The default is
> +			"yes" for PV guests or when the kernel has been built
> +			with CONFIG_XEN_VIRTIO_FORCE_GRANT set.
> +
>  	xen.balloon_boot_timeout= [XEN]
>  			The time (in seconds) to wait before giving up to boot
>  			in case initial ballooning fails to free enough memory.
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index bfd5f4f706bc..a65bd92121a5 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -355,4 +355,13 @@ config XEN_VIRTIO
>  
>  	  If in doubt, say n.
>  
> +config XEN_VIRTIO_FORCE_GRANT
> +	bool "Require Xen virtio support to use grants"
> +	depends on XEN_VIRTIO
> +	help
> +	  Require virtio for Xen guests to use grant mappings.
> +	  This will avoid the need to give the backend the right to map all
> +	  of the guest memory. This will need support on the backend side
> +	  (e.g. qemu or kernel, depending on the virtio device types used).
> +
>  endmenu
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index fc0142484001..d1fae789dfad 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -11,6 +11,7 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/of.h>
>  #include <linux/pfn.h>
> +#include <linux/platform-feature.h>
>  #include <linux/xarray.h>
>  #include <xen/xen.h>
>  #include <xen/xen-ops.h>
> @@ -27,6 +28,27 @@ static DEFINE_XARRAY(xen_grant_dma_devices);
>  
>  #define XEN_GRANT_DMA_ADDR_OFF	(1ULL << 63)
>  
> +static bool __initdata xen_virtio_grants;
> +static bool __initdata xen_virtio_grants_set;
> +static __init int parse_use_grants(char *arg)
> +{
> +	if (!strcmp(arg, "yes"))
> +		xen_virtio_grants = true;
> +	else if (!strcmp(arg, "no"))
> +		xen_virtio_grants = false;
> +	xen_virtio_grants_set = true;
> +
> +	return 0;
> +}
> +early_param("xen_virtio_grant", parse_use_grants);
> +
> +void xen_set_restricted_virtio_memory_access(void)
> +{
> +	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_virtio_grants ||
> +	    (!xen_virtio_grants_set && xen_pv_domain()))
> +		platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
> +}

I agree with Christoph on this.

On ARM all guests are HVM guests. Unless I am reading this wrongly, with
this check, the user needs to pass the xen_virtio_grant command line
option or add CONFIG_XEN_VIRTIO_FORCE_GRANT to the build to use virtio
with grants. Instead, it should be automatic.

I am not against adding new command line or compile-time options. But
on ARM we already have all the information we need in device tree with
"iommus" and "xen,grant-dma". We don't need anything more.

On ARM if "xen,grant-dma" is present we need to enable
PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS, otherwise we don't.

So I think it should be something like the appended (untested):

- on ARM we call xen_set_restricted_virtio_memory_access if
  xen,grant-dma is present in device tree
- on x86 ideally we would have something like xen,grant-dma in a Xen
  ACPI table, but for now:
    - always restrict for PV guests (no change)
    - only restrict for HVM guests if a new cmdline option is passed
    - so the command line option is only for Xen x86 HVM guests
    - no need for another build-time option

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2522b11e593f..cdd13d08f836 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6730,6 +6730,10 @@
 			improve timer resolution at the expense of processing
 			more timer interrupts.
 
+	xen_virtio_grant= [X86,XEN]
+			Control whether virtio devices are required to use
+			grants when running as a Xen HVM guest.
+
 	xen.balloon_boot_timeout= [XEN]
 			The time (in seconds) to wait before giving up to boot
 			in case initial ballooning fails to free enough memory.
diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 1f9c3ba32833..07eb69f9e7df 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -443,8 +443,6 @@ static int __init xen_guest_init(void)
 	if (!xen_domain())
 		return 0;
 
-	xen_set_restricted_virtio_memory_access();
-
 	if (!acpi_disabled)
 		xen_acpi_guest_init();
 	else
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 8b71b1dd7639..66b1d9d3d950 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -189,13 +189,27 @@ static int xen_cpu_dead_hvm(unsigned int cpu)
 }
 
 static bool no_vector_callback __initdata;
+static bool __initdata xen_virtio_grants;
+static bool __initdata xen_virtio_grants_set;
+static __init int parse_use_grants(char *arg)
+{
+	if (!strcmp(arg, "yes"))
+		xen_virtio_grants = true;
+	else if (!strcmp(arg, "no"))
+		xen_virtio_grants = false;
+	xen_virtio_grants_set = true;
+
+	return 0;
+}
+early_param("xen_virtio_grant", parse_use_grants);
 
 static void __init xen_hvm_guest_init(void)
 {
 	if (xen_pv_domain())
 		return;
 
-	xen_set_restricted_virtio_memory_access();
+	if (xen_virtio_grant)
+		xen_set_restricted_virtio_memory_access();
 
 	init_hvm_pv_info();
 
diff --git a/drivers/xen/grant-dma-iommu.c b/drivers/xen/grant-dma-iommu.c
index 16b8bc0c0b33..b43a8906ef64 100644
--- a/drivers/xen/grant-dma-iommu.c
+++ b/drivers/xen/grant-dma-iommu.c
@@ -40,6 +40,7 @@ static int grant_dma_iommu_probe(struct platform_device *pdev)
 		return ret;
 
 	platform_set_drvdata(pdev, mmu);
+	xen_set_restricted_virtio_memory_access();
 
 	return 0;
 }

