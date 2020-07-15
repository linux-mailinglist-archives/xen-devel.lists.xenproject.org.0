Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0028221386
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 19:33:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvlGY-0001qw-Qe; Wed, 15 Jul 2020 17:32:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvlGX-0001qr-MN
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 17:32:21 +0000
X-Inumbo-ID: 21f1f443-c6c1-11ea-942e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21f1f443-c6c1-11ea-942e-12813bfff9fa;
 Wed, 15 Jul 2020 17:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594834340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LBDx2QqeDw9WZ96RcUl126PhE18mwDrNiy8GsGKJWF8=;
 b=Td41bDWm5PrUR4zbUiAuYHhiCmwACtafDcRD7CrlaABDUtP0fOZhcHy7
 mr7vwZuvQrAsfUr1PxT7oKAKQHzB3EDj3e3QxEFd/yPCfPA9XhEUIquQI
 gEuWNIy30u72wznhoPMJZS95/+xoNNdBUSIZ29HAGPZBw9eOnHsAKrQKO o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8nwuYvLGVw1/QLgYMNx9F8v9aXiQsE//zWNPJxkmi1eXbDbPrfqC6zEoBrWi4qUAKZJUbrvnsf
 vShPtRYnzglJonkrogX2ItiioYpy48kfsfvJCYGl12rxL30ulBWQn9BgZkJy4SWZF3gOiDsU80
 OMf+yzp30IaxkWRJg6bfolDV9sES/++gTNFSIgdna7CI1eHQSMqtRKqVwhj0+cZQg7UVRmTrFx
 Crl4r1YNCMiZlUxkwbpSsFjtESpnIpwaqK8U8XpzzLvyRcA4EoNrs+m8lAMl9o0zWwHtKHryBx
 OWw=
X-SBRS: 2.7
X-MesageID: 22655873
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,356,1589256000"; d="scan'208";a="22655873"
Date: Wed, 15 Jul 2020 19:32:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 09/11] x86/domctl: add XEN_DOMCTL_vmtrace_op
Message-ID: <20200715173202.GG7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <a9899858dba4a7e22a0256cff734399bff348adb.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9899858dba4a7e22a0256cff734399bff348adb.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 07, 2020 at 09:39:48PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Implement domctl to manage the runtime state of
> processor trace feature.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/domctl.c       | 50 +++++++++++++++++++++++++++++++++++++
>  xen/include/public/domctl.h | 28 +++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 6f2c69788d..6132499db4 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -322,6 +322,50 @@ void arch_get_domain_info(const struct domain *d,
>      info->arch_config.emulation_flags = d->arch.emulation_flags;
>  }
>  
> +static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
> +                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    int rc;
> +    struct vcpu *v;
> +
> +    if ( op->pad1 || op->pad2 )
> +        return -EINVAL;
> +
> +    if ( !vmtrace_supported )
> +        return -EOPNOTSUPP;
> +
> +    if ( !is_hvm_domain(d) )
> +        return -EOPNOTSUPP;

You can join both if into a single one if they both return
-EOPNOTSUPP.

> +
> +    if ( op->vcpu >= d->max_vcpus )
> +        return -EINVAL;

You can remove this check and just use the return value of domain_vcpu
instead, if it's NULL the vCPU ID is wrong.

> +
> +    v = domain_vcpu(d, op->vcpu);
> +    rc = 0;

No need to init rc to 0, as it would be unconditionally initialized in
the switch below due to the default case.

> +
> +    switch ( op->cmd )
> +    {
> +    case XEN_DOMCTL_vmtrace_pt_enable:
> +    case XEN_DOMCTL_vmtrace_pt_disable:
> +        vcpu_pause(v);
> +        rc = vmtrace_control_pt(v, op->cmd == XEN_DOMCTL_vmtrace_pt_enable);
> +        vcpu_unpause(v);
> +        break;
> +
> +    case XEN_DOMCTL_vmtrace_pt_get_offset:
> +        rc = vmtrace_get_pt_offset(v, &op->offset, &op->size);

In order to get consistent values here the vCPU should be paused, or
else you just get stale values from the last vmexit?

Maybe that's fine for your use case?

> +
> +        if ( !rc && d->is_dying )
> +            rc = ENODATA;

This check here seems weird, if this is really required shouldn't it
be done before attempting to fetch the data?

> +        break;
> +
> +    default:
> +        rc = -EOPNOTSUPP;
> +    }
> +
> +    return rc;
> +}
> +
>  #define MAX_IOPORTS 0x10000
>  
>  long arch_do_domctl(
> @@ -337,6 +381,12 @@ long arch_do_domctl(
>      switch ( domctl->cmd )
>      {
>  
> +    case XEN_DOMCTL_vmtrace_op:
> +        ret = do_vmtrace_op(d, &domctl->u.vmtrace_op, u_domctl);
> +        if ( !ret )
> +            copyback = true;
> +        break;

Nit: new additions would usually got at the end of the switch.

> +
>      case XEN_DOMCTL_shadow_op:
>          ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
>          if ( ret == -ERESTART )
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 7681675a94..73c7ccbd16 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1136,6 +1136,30 @@ struct xen_domctl_vuart_op {
>                                   */
>  };
>  
> +/* XEN_DOMCTL_vmtrace_op: Perform VM tracing related operation */
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +
> +struct xen_domctl_vmtrace_op {
> +    /* IN variable */
> +    uint32_t cmd;
> +/* Enable/disable external vmtrace for given domain */
> +#define XEN_DOMCTL_vmtrace_pt_enable      1
> +#define XEN_DOMCTL_vmtrace_pt_disable     2
> +#define XEN_DOMCTL_vmtrace_pt_get_offset  3
> +    domid_t domain;
> +    uint16_t pad1;
> +    uint32_t vcpu;
> +    uint16_t pad2;

pad2 should be a uint32_t? Or else there's a padding field added by
the compiler? (maybe I'm missing something, I haven't checked with
pahole).

> +
> +    /* OUT variable */
> +    uint64_aligned_t size;
> +    uint64_aligned_t offset;
> +};
> +typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
> +
> +#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> +
>  struct xen_domctl {
>      uint32_t cmd;
>  #define XEN_DOMCTL_createdomain                   1
> @@ -1217,6 +1241,7 @@ struct xen_domctl {
>  #define XEN_DOMCTL_vuart_op                      81
>  #define XEN_DOMCTL_get_cpu_policy                82
>  #define XEN_DOMCTL_set_cpu_policy                83
> +#define XEN_DOMCTL_vmtrace_op                    84
>  #define XEN_DOMCTL_gdbsx_guestmemio            1000
>  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1277,6 +1302,9 @@ struct xen_domctl {
>          struct xen_domctl_monitor_op        monitor_op;
>          struct xen_domctl_psr_alloc         psr_alloc;
>          struct xen_domctl_vuart_op          vuart_op;
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +        struct xen_domctl_vmtrace_op        vmtrace_op;
> +#endif

No need for the preprocessor conditionals here, the whole domctl.h is
only to be used by the tools or Xen, and is already properly guarded
(see the #error at the top of the file).

Thanks.

