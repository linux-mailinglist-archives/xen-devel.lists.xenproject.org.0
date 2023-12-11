Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203AB80C4F5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 10:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651565.1017274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcoT-0002VR-1N; Mon, 11 Dec 2023 09:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651565.1017274; Mon, 11 Dec 2023 09:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCcoS-0002TN-V4; Mon, 11 Dec 2023 09:42:56 +0000
Received: by outflank-mailman (input) for mailman id 651565;
 Mon, 11 Dec 2023 09:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCcoR-0002TH-Ew
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 09:42:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7e86b58-9809-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 10:42:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c0fc1cf3dso44930045e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 01:42:53 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 bg38-20020a05600c3ca600b0040b540ff0a5sm12218117wmb.19.2023.12.11.01.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 01:42:52 -0800 (PST)
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
X-Inumbo-ID: a7e86b58-9809-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702287773; x=1702892573; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d/S/o876/bqSVETyB1aK4fWc+zqMD/lZ8eTzIbNA0Mk=;
        b=IdEtsTeCQ7robJ8pPhZDz6xiJYGh/rMgXhq2e5FyWjGDECCHAnHwJP5zIZa5w5bzuM
         mQFHiykufwR6RcmSaMC/ZylERIGf+mp8ZSPSlMOQM4KbDEzNy5y4x2hUUFoEob7sbE0u
         JNKhsBo8K/q+yIIS4Z7Ka79Dctn/hngumHgNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287773; x=1702892573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/S/o876/bqSVETyB1aK4fWc+zqMD/lZ8eTzIbNA0Mk=;
        b=V+Sr94GQ+TxrkUfWFQ8ziOzSpPOMTOnIGvCCBDmslyfI5nTmab0QOYWP+7za596bO5
         jh2f9207AFtivwD24QfG6l0jH5hNIYrm8YLZDFKRsmZBV1We/hNUgCS9rbC0CyQtuJ2v
         Wq5WqYCugCunoG0K8YWqfdxcL9bfxIHEsA3rUppGxBCGgNinYHej72MvEkohqgX8CD/T
         IqX+B1w9K6yMG/YHHsLHLAZVgZjQUIm8TJLHI8X4RPLKw4CnPlRdvw4ToG9620sPo9Zc
         LRac7i5IpsbV7UYpEa/RX1WGTnc3y+WQqaq7Flv+6JHsGctHO6gdQbFQQv0gEUXL73Sf
         Ludg==
X-Gm-Message-State: AOJu0Yys24uOznUDAC9PgGBQpv8sB2wFGfviFqu4N4cuAAi1Ov+8znOb
	hKxhd9P5xXhWbkGLX7fWHeE3Aw==
X-Google-Smtp-Source: AGHT+IFewKOSPeZfZJEJO3jU+tzT2H3YOTYooJQtLhjvDFNEUTh1UJMZr14RBvfmg1wEPtjkWCbOfA==
X-Received: by 2002:a05:600c:808:b0:40c:2aeb:c758 with SMTP id k8-20020a05600c080800b0040c2aebc758mr1914572wmp.119.1702287772861;
        Mon, 11 Dec 2023 01:42:52 -0800 (PST)
Date: Mon, 11 Dec 2023 10:42:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Message-ID: <ZXbZmwHtZJfSLrC3@macbook>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <ZWmkh0Xeaynh43N7@macbook>
 <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>
 <ZW2wuqXW-DneUVi0@macbook>
 <alpine.DEB.2.22.394.2312041333250.110490@ubuntu-linux-20-04-desktop>
 <ZW8EkQLTwEEK6fXC@macbook>
 <16de540b-fd79-4c23-9698-a641da9c9967@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16de540b-fd79-4c23-9698-a641da9c9967@amd.com>

On Tue, Dec 05, 2023 at 02:01:46PM -0500, Stewart Hildebrand wrote:
> On 12/5/23 06:08, Roger Pau Monné wrote:
> > On Mon, Dec 04, 2023 at 02:07:51PM -0800, Stefano Stabellini wrote:
> >> On Mon, 4 Dec 2023, Roger Pau Monné wrote:
> >>> On Fri, Dec 01, 2023 at 06:56:32PM -0800, Stefano Stabellini wrote:
> >>>> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
> >>>>> On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
> >>>>>> @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
> >>>>>>          bus = PCI_BUS(machine_sbdf);
> >>>>>>          devfn = PCI_DEVFN(machine_sbdf);
> >>>>>>  
> >>>>>> +        if ( needs_vpci(d) && !has_vpci(d) )
> >>>>>> +        {
> >>>>>> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
> >>>>>> +                   &PCI_SBDF(seg, bus, devfn), d);
> >>>>>> +            ret = -EPERM;
> >>>>>> +            break;
> >>>>>
> >>>>> I think this is likely too restrictive going forward.  The current
> >>>>> approach is indeed to enable vPCI on a per-domain basis because that's
> >>>>> how PVH dom0 uses it, due to being unable to use ioreq servers.
> >>>>>
> >>>>> If we start to expose vPCI suport to guests the interface should be on
> >>>>> a per-device basis, so that vPCI could be enabled for some devices,
> >>>>> while others could still be handled by ioreq servers.
> >>>>>
> >>>>> We might want to add a new flag to xen_domctl_assign_device (used by
> >>>>> XEN_DOMCTL_assign_device) in order to signal whether the device will
> >>>>> use vPCI.
> >>>>
> >>>> Actually I don't think this is a good idea. I am all for flexibility but
> >>>> supporting multiple different configurations comes at an extra cost for
> >>>> both maintainers and contributors. I think we should try to reduce the
> >>>> amount of configurations we support rather than increasing them
> >>>> (especially on x86 where we have PV, PVH, HVM).
> >>>
> >>> I think it's perfectly fine to initially require a domain to have all
> >>> its devices either passed through using vPCI or ireqs, but the
> >>> interface IMO should allow for such differentiation in the future.
> >>> That's why I think introducing a domain wide vPCI flag might not be
> >>> the best option going forward.
> >>>
> >>> It would be perfectly fine for XEN_DOMCTL_assign_device to set a
> >>> domain wide vPCI flag, iow:
> >>>
> >>> if ( HYPERCALL_VPCI_FLAG_SET && !has_vpci(d) )
> >>> {
> >>>     if ( has_arch_pdevs(d) )
> >>>     {
> >>>         printk("All passthrough devices must use the same backend\n");
> >>>         return -EINVAL;
> >>>     }
> >>>
> >>>     /* Set vPCI domain flag */
> >>> }
> >>
> >> That would be fine by me, but maybe we can avoid this change too. I was
> >> imagining that vPCI would be enabled at domain creation, not at runtime.
> >> And that vPCI would be enabled by default for all PVH guests (once we
> >> are past the initial experimental phase.)
> > 
> > Then we don't even need a new CDF flag, and just enable vPCI when
> > IOMMU is enabled?  IOW: we can key the enabling of vPCI to
> > XEN_DOMCTL_CDF_iommu for specific domain types?
> > 
> > Maybe that's not so trivial on x86, as there's no x86 PVH domain type
> > from the hypervisor PoV.
> > 
> >>
> >>> We have already agreed that we want to aim for a setup where ioreqs
> >>> and vPCI could be used for the same domain, but I guess you assumed
> >>> that ioreqs would be used for emulated devices exclusively and vPCI
> >>> for passthrough devices?
> >>
> >> Yes, that's right
> >>
> >>
> >>> Overall if we agree that ioreqs and vPCI should co-exist for a domain,
> >>> I'm not sure there's much reason to limit ioreqs to only handle
> >>> emulated devices, seems like an arbitrary limitation.
> >>
> >> Reply below
> >>
> >>
> >>>> I don't think we should enable IOREQ servers to handle PCI passthrough
> >>>> for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
> >>>> Passthrough can be handled by vPCI just fine. I think this should be a
> >>>> good anti-feature to have (a goal to explicitly not add this feature) to
> >>>> reduce complexity. Unless you see a specific usecase to add support for
> >>>> it?
> >>>
> >>> There are passthrough devices (GPUs) that might require some extra
> >>> mediation on dom0 (like the Intel GVT-g thing) that would force the
> >>> usage of ioreqs to passthrough.
> >>
> >> From an architectural perspective, I think it would be cleaner, simpler
> >> to maintain, and simpler to understand if Xen was the sole owner of the
> >> PCI Root Complex and PCI config space mediation (implemented with vPCI).
> >> IOREQ can be used for emulation and it works very well for that. At
> >> least in my mind, that makes things much simpler.
> > 
> > But IOREQ already has all the code to mediate accesses to the PCI
> > config space, and the interface to register separate servers for
> > different PCI devices.
> > 
> > We would then need to duplicate this internally for vPCI, so that vPCI
> > could forward accesses to IOREQ just for IOREQ to forward to yet a
> > different component?  Seems like a lot of duplication for no benefit.
> > 
> >> I understand there are non-trivial cases, like virtual GPUs with
> >> hardware access, but I don't classify those as passthrough. That's
> >> because there isn't one device that gets fully assigned to the guest.
> >> Instead, there is an emulated device (hence IOREQ) with certain MMIO
> >> regions and interrupts that end up being directly mapped from real
> >> hardware.
> >>
> >> So I think it is natural in those cases to use IOREQ and it is also
> >> natural to have QEMU remap MMIO/IRQs at runtime. From a vPCI
> >> perspective, I hope it will mostly look as if the device is assigned to
> >> Dom0. Even if it ends up being more complex than that, Rome wasn't
> >> built in one day, and I don't think we should try to solve this problem
> >> on day1 (as long as the interfaces are not stable interfaces).
> > 
> > I don't see IOREQ as dealing explicitly with emulation.  Yes, it does
> > allow for emulators to be implemented in user-space, but at the end
> > it's just an interface that allows forwarding accesses to certain
> > resources (for the case we are speaking about here, PCI config space)
> > to entities that registered as handlers.
> > 
> > vPCI OTOH just deals with a very specific resource (PCI config space)
> > and only allows internal handlers to be registered on a byte
> > granularity.
> > 
> > So your proposal would be to implement a hierarchy like the one on the
> > diagram below:
> > 
> >     ┌────────┐ ┌──────────┐ ┌──────────────────┐
> >     │ Memory │ │ IO Ports │ │ PCI config space │
> >     └───────┬┘ └┬─────────┘ └───┬──────────────┘
> >             │   │               │
> >             │   │           ┌───┴──┐
> >             │   │           │ vPCI │
> >             │   │           └─┬──┬─┘
> >          ┌──┴───┴┐            │  │
> >          │ IOREQ ├────────────┘  │
> >          └────┬──┘               │
> >               │                  │
> >  ┌────────────┴──┐              ┌┴──────────────┐
> >  │ IOREQ servers │              │ vPCI handlers │
> >  └───────────────┘              └───────────────┘
> > 
> > While what I'm proposing would look like:
> > 
> >     ┌────────┐ ┌──────────┐ ┌──────────────────┐
> >     │ Memory │ │ IO Ports │ │ PCI config space │
> >     └────┬───┘ └────┬─────┘ └────────┬─────────┘
> >          │          │                │
> >          └─────┬────┴────┬───────────┘
> >                │  IOREQ  │
> >                └─┬─────┬─┘
> >                  │     │
> >  ┌───────────────┤     └────┬──────┐
> >  │ IOREQ servers │          │ vPCI │
> >  └───────────────┘          └───┬──┘
> >                                 │
> >                             ┌───┴───────────┐
> >                             │ vPCI handlers │
> >                             └───────────────┘
> > 
> > I'm obviously biased, but I think the latter is cleaner, and allows
> > all resources to be arbitrated by the same component (IOREQ).
> > 
> > If the concern is about the IOREQ hypercall interface, it would be
> > fine to introduce an option that limit IOREQs to internal users
> > (vPCI) without supporting external IOREQ servers.
> > 
> > Think of IOREQ as a resource mediator inside of Xen, that just does
> > the PCI address decoding and forwards the access to the interested
> > party, either an external IOREQ server or vPCI.
> > 
> >>
> >>> It's important that the interfaces we introduce are correct IMO,
> >>> because that ends up reflecting on the configuration options that we
> >>> expose to users on xl/libxl.  While both XEN_DOMCTL_createdomain and
> >>> XEN_DOMCTL_assign_device are unstable interfaces, how the vPCI option
> >>> gets placed there will ultimately influence how the option gets
> >>> exposed in xl/libxl, and the interface there is relevant to keep
> >>> stable for end user sanity.
> >>
> >> I agree with you on the stable interfaces. The important part is not to
> >> introduce changes to stable interfaces that could limit us in the
> >> future. Specifically that includes xl and libxl, we need to be careful
> >> there. But I don't see a single per-domain vPCI enable/disable option as
> >> a problem. Let's say that in the future we have a mediated vGPU
> >> implementation: if it works together with vPCI then the per-domain vPCI
> >> option in libxl will be enabled (either explicitely or by default), if
> >> it doesn't then vPCI will be disabled (either explicitely or by the
> >> newer vGPU options.)
> > 
> > If vPCI is hooked into IOREQ there won't be a need anymore to register
> > the vPCI config space traps, as that would be done by IOREQ, and hence
> > vPCI managed devices could be registered at runtime with IOREQ.  IOW:
> > there won't be a need anymore to signal at domain creation whether
> > vPCI is intended to be used or not.
> > 
> > We would obviously need to enable IOREQ for all domains with IOMMU
> > enabled, as it would be IOREQ that register the PCI config space
> > handlers.
> > 
> >> For *unstable* interfaces (XEN_DOMCTL_assign_device) I would rather wait
> >> before adding more changes on top of them, not because I don't care
> >> about the mediated GPU problem (we do have something similar at AMD),
> >> but because I worry that if we try to change them now we might not do a
> >> good enough job. I would prefer to wait until we know more about the
> >> actual use case, ideally with code supporting it.
> >>
> >> I think the difference in points of views comes from the fact that I see
> >> vPCI as the default, QEMU only as a limited peripheral emulator (or
> >> mediator for the vGPU case) but not in control. vPCI and QEMU are not
> >> equal in my view. vPCI is in charge and always present if not in very
> >> uncommon setups (even if we decide to hook it inside Xen by using
> >> internal IOREQ interfaces). QEMU might come and go.
> > 
> > Xen needs a single component that mediates accesses to resources,
> > whether that's IOREQ, or something else I don't really care that much.
> 
> I just wanted to share what the "something else" diagram might look like.
> 
>     ┌────────┐ ┌──────────┐ ┌──────────────────┐
>     │ Memory │ │ IO Ports │ │ PCI config space │
>     └────┬───┘ └────┬─────┘ └──────────┬───────┘
>          │          │                  │
>          └──┬───────┴───────────────┬──┘
>             │ PCI Resource Mediator │
>             └────┬─────┬────────────┘
>                  │     │
>          ┌───────┤     └────┬──────┐
>          │ IOREQ │          │ vPCI │
>          └────┬──┘          └───┬──┘
>               │                 │
>  ┌────────────┴──┐          ┌───┴───────────┐
>  │ IOREQ servers │          │ vPCI handlers │
>  └───────────────┘          └───────────────┘

It's IMO weird that the PCI resource mediator also controls Memory
and IO ports, since that's not a PCI specific resource.

Isn't your proposed "PCI Resource Mediator" the same as what IOREQ
currently does?

I'm kind of confused as what benefit there is in introducing another
layer that multiplexes guest resource accesses.

> > Having vPCI mediate accesses to the PCI config space, and IOREQ to the
> > memory (and on x86 IO port) space just seems awfully complicated for
> > AFAICT no real benefit.
> > 
> > Also, you seem to confabulate IOREQ with QEMU, while the latter is
> > indeed an user of IOREQ, I do see IOREQ as a simple resource mediator
> > inside of Xen, that has the ability to forward such accesses to
> > external emulators using an hypercall interface.
> > 
> >> Now that I am writing this, I realize this is also why I wasn't too
> >> happy with the idea of hooking vPCI using IOREQ. It makes them look as
> >> if they are the same, while I don't they should be considered at the
> >> same level of priority, criticality, safety, integration in the system,
> >> etc.
> > 
> > I feel there are some fears with IOREQ from a safety PoV?  The code
> > that does the resource multiplexing is small, and as said above if
> > there are safety concerns with the hypercall interface it would be
> > fine to limit it's usage to internal handlers only.
> 
> Would it make any sense at all to split the resource multiplexing bits from IOREQ into a new separate PCI resource mediator?

That might be fine, but seems like a lot of work and more complexity
in Xen for AFAICT no real benefit.

I think I would need to better understand the worries with using
IOREQ, but wouldn't it be easier to just limit the current IOREQ
code/interface to suit your needs?  Again without knowing exactly what
are the issues with using IOREQ	it's hard to propose solutions.

Thanks, Roger.

