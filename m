Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45805B3992
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 15:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404375.646827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWeMx-000156-B4; Fri, 09 Sep 2022 13:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404375.646827; Fri, 09 Sep 2022 13:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWeMx-00012R-7h; Fri, 09 Sep 2022 13:48:31 +0000
Received: by outflank-mailman (input) for mailman id 404375;
 Fri, 09 Sep 2022 13:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuYE=ZM=citrix.com=prvs=244871dc4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWeMv-00012L-G2
 for xen-devel@lists.xen.org; Fri, 09 Sep 2022 13:48:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13c72b43-3046-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 15:48:27 +0200 (CEST)
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
X-Inumbo-ID: 13c72b43-3046-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662731307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RurGK9/j9Y+TRgZ1tZr7Hq8m+s7DzmDqjgoWSZZDWcE=;
  b=Bh37VtVjTKOM4Qr0yZlaCbw1sCYYdN54YhZ8cC8utOWlAgkCb/8ddpjn
   8svwm2QbnvVh6PBhfUtfPzLL6+RjEK+CIky/R0iEWPxgL5XqHAo4p+tXR
   Vi8kziZYWX3OJkxm8VJ9MTS/JDJbOhApLI7Z6FQO040rbDstN4Mm0GScr
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80591647
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ERVuUqMLO14r5KfvrR0Nl8FynXyQoLVcMsEvi/4bfWQNrUog1zMDy
 TcfC22AMv6INmT0f9gkbdzl9xkAsJ7VmIIwQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMuvrS8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFO9mK9cA0FmIrEgxdhlB0Rg0
 Ls1GSkCO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJmagjAZBtefE8aEpskkM+jh2Xlci0eo1WQzUYyyziLkV0ojuSyWDbTUtWaT/hag0epn
 yGF8WvwBgxKPvaN8gPQpxpAgceQxHimCer+DoaQ8fpng0aP13cTIBITXFq/5/K+jyaWXttDK
 00Z52w2qqko9UGxZt38WRSipziPuRt0c8VUO/037keK0KW8ywSEAmkJSBZRZdpgs9U5LRQo2
 UWOhMjBHiF0vfueTnf13qyIoD27Py9TNnMLbyIASQoD4vHzoYUyiAKJRdFmeIalg9uwFTzuz
 jSiqCklm65VncMNkaKh8jjvnTO2q4PJCA0o4wzNdmak6ApjY8iifYPAwUba6/1NKprfQUSAo
 GQDh+Ca7eYHF5bLkzaCKM0EGLy5ofyINjvRjHZrHp8o7TPr/GSsFahL/Ct3OEByd8oJZxfue
 ArXuBhN/9lXPX2jd6gxZJi+Y/nG1oC5S46jDKqNKIMTPN4hL2dr4R2Ce2bBhDrfn0h8jp0HB
 qmJd+OCKDE3OL1omW/eq/gm7VM7+swv7TqNG8qllE38jeX2iG29EulcbgbXBgwtxObd+ViOr
 Y4CXyef408HONASdBU75mL6wboiCXEgTa77pMVMHgJoClo3QTpxYxM9LF5IRmCEo0i2vr2Sl
 p1FchUEoGcTfFWeQelwVlhtaan0QbF0pm8hMConMD6AgiZ9O9jxtv5ALcJqItHLEdCPKtYtF
 5E4lzioWKwTGlwrBRxGBXUCkGCSXEvy3l/fV8ZUSDM+Y4RhV2T0xzMQRSO2rXFmM8ZCnZFhy
 1FW/l+EHMFrqsULJJq+Vc9DOHvq5SFBxLorBRKSSjSREW21mLVXx+XKpqdfC6kxxd/rn2LyO
 9q+afvAmdTwng==
IronPort-HdrOrdr: A9a23:jnCxcagcjw3XRwr6yEOAesmkJ3BQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="80591647"
Date: Fri, 9 Sep 2022 14:47:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH V6 3/3] libxl: arm: make creation of iommu node
 independent of disk device
Message-ID: <YxtEDe93TJDTYTC3@perard.uk.xensource.com>
References: <cover.1662626550.git.viresh.kumar@linaro.org>
 <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>

On Thu, Sep 08, 2022 at 02:23:01PM +0530, Viresh Kumar wrote:
> The iommu node will be required for other virtio device types too, not
> just disk device.
> 
> Move the call to make_xen_iommu_node(), out of the disk device specific
> block and rename "iommu_created" variable to "iommu_needed", and set it
> to true for virtio disk device.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  tools/libs/light/libxl_arm.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 55aee15c10b4..2637acafa358 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1157,7 +1157,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>      size_t fdt_size = 0;
>      int pfdt_size = 0;
>      libxl_domain_build_info *const info = &d_config->b_info;
> -    bool iommu_created;
> +    bool iommu_needed;
>      unsigned int i;
>  
>      const libxl_version_info *vers;
> @@ -1265,22 +1265,26 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>          if (d_config->num_pcidevs)
>              FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>  
> -        iommu_created = false;
> +        iommu_needed = false;

That variable could now be initialised at declaration rather than in
the middle of the code, as it could be used for more than just
virtio-disk.

>          for (i = 0; i < d_config->num_disks; i++) {
>              libxl_device_disk *disk = &d_config->disks[i];
>  
>              if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> -                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
> -                    !iommu_created) {
> -                    FDT( make_xen_iommu_node(gc, fdt) );
> -                    iommu_created = true;
> -                }
> +                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID)
> +                    iommu_needed = true;
>  
>                  FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
>                                             disk->backend_domid) );
>              }
>          }
>  
> +        /*
> +         * Note, this should be only called after creating all virtio-mmio
> +         * device nodes

I think this comment is confusing. Before this patch, it didn't seems to
matter that the node was created only after the first device. But the
comment seems to say that the node should only be created last. But it
seems that all that matter is that the node is only created once.
So maybe the comment is superfluous? Or we could comment that we will
create a single iommu node for all virtio-mmio node/device...


> +         */
> +        if (iommu_needed)
> +            FDT( make_xen_iommu_node(gc, fdt) );
> +
>          if (pfdt)
>              FDT( copy_partial_fdt(gc, fdt, pfdt) );
>  

Thanks,

-- 
Anthony PERARD

