Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42E54E93A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 20:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350816.577227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1u6V-0005f6-Vj; Thu, 16 Jun 2022 18:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350816.577227; Thu, 16 Jun 2022 18:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1u6V-0005cc-SY; Thu, 16 Jun 2022 18:20:27 +0000
Received: by outflank-mailman (input) for mailman id 350816;
 Thu, 16 Jun 2022 18:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hdZ4=WX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o1u6V-0005cW-1y
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 18:20:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe0f2acc-eda0-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 20:20:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB8DAB824F8;
 Thu, 16 Jun 2022 18:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253CEC34114;
 Thu, 16 Jun 2022 18:20:23 +0000 (UTC)
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
X-Inumbo-ID: fe0f2acc-eda0-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655403623;
	bh=8D4UPmPWJGZms6MD3CREfq52BmU6+/z5BRR65651Wts=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QsraUgbu9SU0YBwZZ6+jQn/BdglCIeXx3J/wTE5X92rlzaZtaXCdcqPnksQFUwwqk
	 nR3E/JqTMu5QiPX43myf+PnQgP0uXbshq4YYw4jDwK/6o30SkKIqfIIj2Mvq2rMq0M
	 L2+0mVIHciDqg5RIE5393kLTwHkheBNoCgZqfHCNHTZVRutblqQNPKGO5K4AsSklsI
	 zNTHdgC/93EJ45M/IaQmGJMCK6scVHAmm2kU3sGpfgPQ5wwJWqG/X59ETWlXe2ndnM
	 8DPG5D4wIQIQjhwJUB4CamjR3kMrr02DVWsP2JDnhAkyB+KC0ucby3huL6M8JoiQjI
	 FHBxkahj3NqQw==
Date: Thu, 16 Jun 2022 11:20:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    viresh.kumar@linaro.org, hch@infradead.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2] xen: don't require virtio with grants for non-PV
 guests
In-Reply-To: <20220616053715.3166-1-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2206161106020.10483@ubuntu-linux-20-04-desktop>
References: <20220616053715.3166-1-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jun 2022, Juergen Gross wrote:
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
> Add a new config item to always force use of grants for virtio.
> 
> Fixes: fa1f57421e0b ("xen/virtio: Enable restricted memory access using Xen grant mappings")
> Reported-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - remove command line parameter (Christoph Hellwig)
> ---
>  drivers/xen/Kconfig | 9 +++++++++
>  include/xen/xen.h   | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
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
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index 0780a81e140d..4d4188f20337 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -56,7 +56,7 @@ extern u64 xen_saved_max_mem_size;
>  
>  static inline void xen_set_restricted_virtio_memory_access(void)
>  {
> -	if (IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain())
> +	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain())
>  		platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
>  }

Hi Juergen, you might have seen my email:
https://marc.info/?l=linux-kernel&m=165533636607801&w=2

Linux is always running as HVM on ARM, so if you want to introduce
XEN_VIRTIO_FORCE_GRANT, then XEN_VIRTIO_FORCE_GRANT should be
automatically selected on ARM. I don't think there should be a visible
menu option for XEN_VIRTIO_FORCE_GRANT on ARM.

I realize we have a conflict between HVM guests on ARM and x86:

- on ARM, PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS should be enabled when
  "xen,grant-dma" is present
- on x86, due to the lack of "xen,grant-dma", it should be off by
  default and based on a kconfig or command line option

To be honest, like Christoph suggested, I think even on x86 there should
be a firmware table to trigger setting
PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS. We have 2 Xen-specific ACPI
tables, and we could have 1 more to define this. Or an HVM param or
a feature flag?

I think that would be the cleanest way to do this, but it is a lot of
more work compared to adding a couple of lines of code to Linux, so this
is why I suggested:
https://marc.info/?l=linux-kernel&m=165533636607801&w=2

ARM uses "xen,grant-dma" to detect whether
PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS needs setting.

One day x86 could check an ACPI property or HVM param or feature flag.
None of them are available now, so for now use a command line option as
a workaround. It is totally fine to use an x86-only kconfig option
instead of a command line option.

Would you be OK with that?

