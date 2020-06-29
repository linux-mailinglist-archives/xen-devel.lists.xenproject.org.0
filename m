Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A316E20CDDD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 12:18:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpqr4-0006g8-Sv; Mon, 29 Jun 2020 10:17:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jpqr3-0006g3-Eg
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 10:17:37 +0000
X-Inumbo-ID: c096cbe0-b9f1-11ea-8496-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c096cbe0-b9f1-11ea-8496-bc764e2007e4;
 Mon, 29 Jun 2020 10:17:36 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FiMoakWGtd8Kau2qdBzZ1DZ2/uaSVxaB/dldtcmzNM4fC/HmhRFrhCr97QKZaNJblbdknTmebK
 BC4F8Y6QET5LuP4VuTbTG5Q6mIw8SoWPYJeVols0bNnxiVvzBDxvL3JRJqnEv5evdzqHzBC0Rt
 HQFXMO3DbPvLFmv4mZgSeEyHiBLJMPVQZwKYza2jP72rf7SerL0hWfdAhVp6canC0MEkjZR2tu
 1fyFEuCQpNZTTS7xetcCM+cWUe+2H5ubRIBDrWZI42ARNwPequzFj3B16PMJ2YVcpuD7Rozf4/
 gqg=
X-SBRS: 2.7
X-MesageID: 21153121
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21153121"
Date: Mon, 29 Jun 2020 12:17:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Ruh <jan.ruh@tttech.com>
Subject: Re: Kernel requires x86-64 CPU, after modifying arch_shared_info
 struct
Message-ID: <20200629101728.GH735@Air-de-Roger>
References: <6f88fc3e2795436fa1f30dd026dd8eda@tttech.com>
 <20200629091823.GF735@Air-de-Roger>
 <af1c2ea2298a4115baf50b580caa0017@tttech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <af1c2ea2298a4115baf50b580caa0017@tttech.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 29, 2020 at 09:56:43AM +0000, Jan Ruh wrote:
> > Did you try backing up your changes and seeing if the same happens?
> 
> If backing up my changes everything works as expected.
> 
> > Did you rebuild both the Xen hypervisor and the tools?
> 
> Yes, I rebuild both Xen hypervisor and the tools.
> 
> > Pasting your xl config file would be helpful in order to help debug.
> 
> As requested my xl config:

xl parser will just ignore the ';', you can remove them.

>     type="hvm"; extra="console=hvc0 earlyprintk=xen";
>     kernel="/usr/lib/kernel/vmlinuz-domu";
>     ramdisk="/usr/lib/kernel/initrd.img-domu";
>     root="/dev/xvda2 ro";
>     memory=1024;
>     autoballoon="off";

autoballoon is not a xl.cfg option.

>     xen_platform_pci=1;
>     pae=1; acpi=1; apic=1;

All those are already enabled by default, no need to specify them
here.

>     vcpus=1;
>     name="vm1";
>     disk=["file:domu.img,hda,w"];
>     vif=["bridge=xenbr0"];
>     vfb=["type=vnc,keymap=de"];
>     vnclisten="192.168.2.4:0";
>     boot="c";'
> 
> > Posting your changes might also help spot something wonky.
> 
> diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
> index 629cb2ba40..61c46504a5 100644
> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -265,6 +265,14 @@ struct arch_shared_info {
>      /* There's no room for this field in the generic structure. */
>      uint32_t wc_sec_hi;
>  #endif
> +
> +    uint32_t st_version;
> +    uint64_t time_sec;
> +    uint64_t time_nsec;
> +    uint64_t cycle_last;
> +    uint32_t mult;
> +    uint32_t shift;
> +
>  };
>  typedef struct arch_shared_info arch_shared_info_t;
> 
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index c39fbe50a0..2782cb5127 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1254,15 +1254,15 @@ void update_domain_synctime(struct domain *d)

This doesn't seem to exist in current Xen code, so I guess there are
further changes applied here?

>  {
>      uint32_t *st_version;
> 
> +    st_version = &shared_info(d, arch.st_version);
>      *st_version = version_update_begin(*st_version);
>      smp_wmb();
> 
> +    shared_info(d, arch.mult)        = global_time.mult;
> +    shared_info(d, arch.shift)       = global_time.shift;
> +    shared_info(d, arch.cycle_last)  = global_time.cycle_last;
> +    shared_info(d, arch.time_sec)    = global_time.time_sec;
> +    shared_info(d, arch.time_nsec)   = global_time.time_nsec;
> 
>      smp_wmb();
>      *st_version = version_update_end(*st_version);
> 
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 72e7d33708..4b9ad0261b 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -503,22 +503,22 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>      }
>      case XEN_SYSCTL_adjust_gtime:
>      {
> +        struct adjust_gtime *adjust_gtime = (struct adjust_gtime*) &op->u.adjust_gtime;
> 
> +        ret = do_adj_gtime(adjust_gtime);

Same with do_adj_gtime, I cannot find it in the current code, hence
I'm afraid it's impossible to tell what it's actually doing.

> +
>          copyback = 1;
> 
>          break;
> 
> diff --git a/tools/include/xen-foreign/reference.size b/tools/include/xen-foreign/reference.size
> index bb2ada32fb..9afd11e5fa 100644
> --- a/tools/include/xen-foreign/reference.size
> +++ b/tools/include/xen-foreign/reference.size
> @@ -9,6 +9,6 @@ vcpu_guest_context        |     344     344    2800    5168
>  arch_vcpu_info            |       0       0      24      16
>  vcpu_time_info            |      32      32      32      32
>  vcpu_info                 |      48      48      64      64
> -arch_shared_info          |       0       0      28      48
> +arch_shared_info          |       0       0      64      88

Aren't you missing a line below that contains the shared_info size,
and that also need to be updated (since arch_shared_info is contained
in shared_info)?

> 
> 
> global_time is a static struct in time.c, no existing Xen code is changed, just functions added that are being called from the sysctl adjust_gtime.
> 
> Further tests show that in /tools/libxc/xc_dom_binloader.c: xc_dom_parse_bin_kernel xc sets the dom->guest_type to "xen-3.0-x86_32" instead of "xen-3.0-x86_64". I also cannot see though how it can be connected to my change to arch_shared_info.

Hm, I think guest type should be hvm-3.0-x86_32, as xen-* are PV guest
types, and you are trying to boot a HVM guest.

Anyway I'm not familiar with HVM direct kernel boot, so this might
have no effect here.

Are you sure the type is set to "xen-3.0-x86_64" prior to your
changes?

Maybe it would be worth to also paste the output of 'xl -vvv create
...'.

> Sorry for the banner, I always forget that the mail client adds that thing, I hope it doesn't do it again.

I'm afraid it's still appended to this email, see below.

Roger.

> CONFIDENTIALITY: The contents of this e-mail are confidential and
> intended only for the above addressee(s). If you are not the
> intended recipient, or the person responsible for delivering it to
> the intended recipient, copying or delivering it to anyone else or
> using it in any unauthorized manner is prohibited and may be
> unlawful. If you receive this e-mail by mistake, please notify the
> sender and the systems administrator at straymail@tttech.com
> immediately.

