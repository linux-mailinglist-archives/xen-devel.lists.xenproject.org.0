Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990094BA42D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 16:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274851.470457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKiaI-00027S-MM; Thu, 17 Feb 2022 15:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274851.470457; Thu, 17 Feb 2022 15:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKiaI-00025X-J1; Thu, 17 Feb 2022 15:20:42 +0000
Received: by outflank-mailman (input) for mailman id 274851;
 Thu, 17 Feb 2022 15:20:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nKiaG-00025R-BC
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 15:20:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKiaF-0007mN-6X; Thu, 17 Feb 2022 15:20:39 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.236.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKiaE-0007EM-Vy; Thu, 17 Feb 2022 15:20:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=nDE20JAHrHiHzPhpUoZuugFZT0dSKEMJ/mHl8bG2ZnA=; b=O6/Q03THa/2sLXjmobKPbz6yrr
	ETDUYeEHncfrq3B/pPs/cdCScgKRbDmHQINB3ojS5KsKG2qwiYZtfSSDYHuIdyP57tQgH3/aIS6XK
	fLBPA/MgZsfNzyrPsK6GVrfuVO8nVmoCLoOM+hp9wD/CWnGyI1qNf7Uo+kl9RN/q5tMU=;
Message-ID: <ab6d8d13-30cf-d322-668e-f3f5aaa56824@xen.org>
Date: Thu, 17 Feb 2022 15:20:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul@xen.org>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/02/2022 18:00, Oleksii Moisieiev wrote:
> If set, Xen is allowed to assign the devices even if they are not under
> IOMMU.

I think you mean "not protected by an IOMMU".

> Can be confugired from dom.cfg in the following format:

s/confugired/configured/

> force_assign_without_iommu = 1
> 
> This parameter has the same purpose as xen,force-assign-without-iommu
> property in dom0less archtecture.

s/archtecture/architecture/

> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>   docs/man/xl.cfg.5.pod.in              |  9 +++++++++
>   tools/golang/xenlight/helpers.gen.go  |  5 +++++
>   tools/golang/xenlight/types.gen.go    |  1 +
>   tools/libs/light/libxl_arm.c          |  3 +++
>   tools/libs/light/libxl_types.idl      |  1 +
>   tools/xl/xl_parse.c                   |  3 +++
>   xen/common/domain.c                   |  2 +-
>   xen/drivers/passthrough/device_tree.c | 19 +++++++++++++++++--
>   xen/drivers/passthrough/iommu.c       |  5 ++++-
>   xen/include/public/domctl.h           |  5 ++++-
>   xen/include/xen/iommu.h               |  3 +++
>   11 files changed, 51 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b98d161398..ddf82cb3bc 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1614,6 +1614,15 @@ This feature is a B<technology preview>.
>   
>   =back
>   
> +=over 4
> +
> +=item B<force_assign_without_iommu=BOOLEAN>
> +
> +If set, Xen allows to assign a devices even if it is not behind an IOMMU.
> +This renders your platform *unsafe* if the device is DMA-capable.

I agree this is going to be unsafe. But the more important bit here is 
this is not going to work because the guest has no way to translate a 
GFN to an MFN.

Your guest will need to be direct map to make it usable. So I would add 
that this will *not* work with DMA-capable devices.

Also, can you explain in the commit message why you want to allow this 
setup?

>       xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 093bb4403f..f1f19bf711 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -512,7 +512,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>   
>       if ( iommu )
>       {
> -        if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
> +        if ( config->iommu_opts >> XEN_DOMCTL_IOMMU_MAX )

XEN_DOMCTL_IOMMU_MAX will be defined as:

(1U << _XEN_DOMCTL_IOMMU_force_iommu)

This means the shift will do the wrong thing. However, AFAICT, this new 
option will only be supported by Arm and likely only for platform device 
for the time being.

That said, I am not convinced this flag should be per-domain in Xen. 
Instead, I think it would be better to pass the flag via the device 
assign domctl.

>           {
>               dprintk(XENLOG_INFO, "Unknown IOMMU options %#x\n",
>                       config->iommu_opts);
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 98f2aa0dad..103608dec1 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -198,6 +198,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>   {
>       int ret;
>       struct dt_device_node *dev;
> +    struct domain_iommu *hd = dom_iommu(d);
>   
>       switch ( domctl->cmd )
>       {
> @@ -238,6 +239,16 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>               return -EINVAL;
>   
>           ret = iommu_add_dt_device(dev);
> +
> +        /*
> +         * iommu_add_dt_device returns 1 if iommu is disabled or device don't
> +         * have iommus property
> +         */
> +        if ( (ret == 1) && (hd->force_assign_iommu) ) {
> +            ret = -ENOSYS;
> +            break;
> +        }
> +
>           if ( ret < 0 )
>           {
>               printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
> @@ -275,10 +286,14 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>   
>           ret = iommu_deassign_dt_device(d, dev);
>   
> -        if ( ret )
> -            printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \"%s\""
> +        if ( ret ) {
> +            if ( hd->force_assign_iommu )
> +                ret = -ENOSYS;
> +            else
> +                printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \"%s\""
>                      " to dom%u failed (%d)\n",
>                      dt_node_full_name(dev), d->domain_id, ret);
> +        }
>           break;
>   
>       default:
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> index 6334370109..216a9058c0 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -193,6 +193,8 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
>       hd->node = NUMA_NO_NODE;
>   #endif
>   
> +    hd->force_assign_iommu = opts & XEN_DOMCTL_IOMMU_force_iommu;
> +
>       ret = arch_iommu_domain_init(d);
>       if ( ret )
>           return ret;
> @@ -534,6 +536,7 @@ int iommu_do_domctl(
>   {
>       int ret = -ENODEV;
>   
> +

Spurious change.

>       if ( !is_iommu_enabled(d) )

Should not this check be updated to check force_assign?

>           return -EOPNOTSUPP;
>   
> @@ -542,7 +545,7 @@ int iommu_do_domctl(
>   #endif
>   
>   #ifdef CONFIG_HAS_DEVICE_TREE
> -    if ( ret == -ENODEV )
> +    if ( ret == -ENOSYS )

AFAICT, none of the code (including callee) before ret have been 
modified. So why are you modifying the check here?

>           ret = iommu_do_dt_domctl(domctl, d, u_domctl);
>   #endif
>   
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index b85e6170b0..bf5f8c5b6b 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -81,8 +81,11 @@ struct xen_domctl_createdomain {
>   #define _XEN_DOMCTL_IOMMU_no_sharept  0
>   #define XEN_DOMCTL_IOMMU_no_sharept   (1U << _XEN_DOMCTL_IOMMU_no_sharept)
>   
> +#define _XEN_DOMCTL_IOMMU_force_iommu 1
> +#define XEN_DOMCTL_IOMMU_force_iommu  (1U << _XEN_DOMCTL_IOMMU_force_iommu)
> +
>   /* Max XEN_DOMCTL_IOMMU_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_IOMMU_MAX XEN_DOMCTL_IOMMU_no_sharept
> +#define XEN_DOMCTL_IOMMU_MAX XEN_DOMCTL_IOMMU_force_iommu
>   
>       uint32_t iommu_opts;
>   
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 6b2cdffa4a..a9cf2334af 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -330,6 +330,9 @@ struct domain_iommu {
>        * necessarily imply this is true.
>        */
>       bool need_sync;
> +
> +    /* Do not return error if the device without iommu is assigned */
> +    bool force_assign_iommu;
>   };
>   
>   #define dom_iommu(d)              (&(d)->iommu)

Cheers,

-- 
Julien Grall

