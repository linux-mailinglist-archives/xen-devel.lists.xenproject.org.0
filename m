Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760592109E3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 13:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqaTc-0006HR-EM; Wed, 01 Jul 2020 11:00:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqaTb-0006HK-4h
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 11:00:27 +0000
X-Inumbo-ID: 10489faa-bb8a-11ea-86ee-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10489faa-bb8a-11ea-86ee-12813bfff9fa;
 Wed, 01 Jul 2020 11:00:26 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WmC/VWMI7ryIhLYTErmqxUt0KrLTV7rpQ45yxN8Vo5LMUcRTWSVBgJWscCLrXHCNA8zLzQW4OK
 GM8V8r3JInUpqQY2F+kHS/liWiNPLc7/1I+8m6vd/W+TJuQMuy2cIDrW0msngnUncfPbBWDoSQ
 NhwGjdeOFC54FCJFqFskI4T/o+m47qZIe8Zf21J5IKmEWEfjrXoar30nzKX2k3SSqjb8+lfpRd
 R2IbMj+4IfSJLUwYZLUb+Br/LCmg/IfEUuGlk+0IchxJ3MYVtStIGU/arxMwMCrAYZsIs03XxC
 v+g=
X-SBRS: 2.7
X-MesageID: 21388763
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,300,1589256000"; d="scan'208";a="21388763"
Date: Wed, 1 Jul 2020 13:00:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 08/10] x86/domctl: add XEN_DOMCTL_vmtrace_op
Message-ID: <20200701110016.GU735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <5578c50c2c1803ccd1c92d125c6b1febf1415a8a.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5578c50c2c1803ccd1c92d125c6b1febf1415a8a.1593519420.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On Tue, Jun 30, 2020 at 02:33:51PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Implement domctl to manage the runtime state of
> processor trace feature.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/domctl.c       | 48 +++++++++++++++++++++++++++++++++++++
>  xen/include/public/domctl.h | 26 ++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 6f2c69788d..a041b724d8 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -322,6 +322,48 @@ void arch_get_domain_info(const struct domain *d,
>      info->arch_config.emulation_flags = d->arch.emulation_flags;
>  }
>  
> +static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
> +                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    int rc;
> +    struct vcpu *v;
> +
> +    if ( !vmtrace_supported )
> +        return -EOPNOTSUPP;
> +
> +    if ( !is_hvm_domain(d) )
> +        return -EOPNOTSUPP;

You can join both checks.

> +
> +    if ( op->vcpu >= d->max_vcpus )
> +        return -EINVAL;
> +
> +    v = domain_vcpu(d, op->vcpu);
> +    rc = 0;

No need to init rc to zero, after the switch below it will always be
initialized.

> +
> +    switch ( op->cmd )
> +    {
> +    case XEN_DOMCTL_vmtrace_pt_enable:
> +    case XEN_DOMCTL_vmtrace_pt_disable:
> +        vcpu_pause(v);
> +        spin_lock(&d->vmtrace_lock);
> +
> +        rc = vmtrace_control_pt(v, op->cmd == XEN_DOMCTL_vmtrace_pt_enable);
> +
> +        spin_unlock(&d->vmtrace_lock);
> +        vcpu_unpause(v);
> +        break;
> +
> +    case XEN_DOMCTL_vmtrace_pt_get_offset:
> +        rc = vmtrace_get_pt_offset(v, &op->offset);

Since you don't pause the vcpu here, I think you want to use atomic
operations to update v->arch.hvm.vmx.pt_state->output_mask.raw, or
else you could see inconsistent results if a vmexit is updating it in
parallel? (since you don't pause the target vcpu).

Thanks, Roger.

