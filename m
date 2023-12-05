Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C833D805AD6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 18:10:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648151.1012212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYvn-00025N-AM; Tue, 05 Dec 2023 17:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648151.1012212; Tue, 05 Dec 2023 17:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAYvn-00022X-7P; Tue, 05 Dec 2023 17:09:59 +0000
Received: by outflank-mailman (input) for mailman id 648151;
 Tue, 05 Dec 2023 17:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAYvm-00022R-QH
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 17:09:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cdd9fe3-9391-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 18:09:56 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40bda47c489so40884845e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 09:09:56 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b0040b3d33ab55sm23185556wmb.47.2023.12.05.09.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 09:09:54 -0800 (PST)
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
X-Inumbo-ID: 1cdd9fe3-9391-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701796195; x=1702400995; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTjh+ByXcmDCxhU+NNUA3HCKjxE68CgBO2niK+jby0Q=;
        b=XsBkEEEm+DK8Z9GG41FDs4IZY6g7Ld8qlXJJ5s3WYpvPz0B4+LkOHyop37ioNv1Y8I
         OmI97wDra/6mluuY3CCcTGuPJt2vLPMR1Hs2/UijuZGV7c0IrE+IvaPZq2j0PzPl4kvx
         H5c21eF7757l6rpsHeSJNjpBxIDx21iULjkUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701796195; x=1702400995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTjh+ByXcmDCxhU+NNUA3HCKjxE68CgBO2niK+jby0Q=;
        b=WV/g5irNf2gTsaXnVU7JIcJ+ci7NTk8fzr+F/EuH3SSSfx3fWcL6PnFa4g6JugwZg9
         ymGDZg2+lwW/Zn+F7IFsVfBgwp4tEWZqPIdlzS3/uqizPx7ud9/HKZ+jLuosDbgocQPf
         J7UzlV8SXTITbMU/2Y/lOsBopZRfTG6OAsM5FHTZl7Xt2N9QqTG1P8Vuzx+El77Feq+b
         PLUvMQXw9L1P1/Bx33XXOLmzgAN5kuW+z/BPYp2sbmAaKQC134UXTI9yyYgXJsOLT8zS
         YnaZVXCEIRE+T93UPiPlQye00J0Oo8R8lzWU3CY7s/HsMrOltg7nsVAYxzXhiKCcsP2h
         IVjg==
X-Gm-Message-State: AOJu0Yz3KVg2MnDZRH0H63eYcueXH3U+dryKndPicCaZTcrl0XyHW/6W
	8CH9SwZFCXSOfGm+ZhuWkT4u2A==
X-Google-Smtp-Source: AGHT+IEeiAx2grdp6OiaajX/mmo4BWCwwvE/ZkNit21Mw4PLo6+jb9OJAtOmu08DVeBcWuUvX+qoCw==
X-Received: by 2002:a7b:c34a:0:b0:40b:5e59:c586 with SMTP id l10-20020a7bc34a000000b0040b5e59c586mr785994wmj.176.1701796195252;
        Tue, 05 Dec 2023 09:09:55 -0800 (PST)
Date: Tue, 5 Dec 2023 18:09:53 +0100
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
Message-ID: <ZW9ZYeDD7k146LsB@macbook>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <ZWmkh0Xeaynh43N7@macbook>
 <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>
 <ZW2wuqXW-DneUVi0@macbook>
 <alpine.DEB.2.22.394.2312041333250.110490@ubuntu-linux-20-04-desktop>
 <ZW8EkQLTwEEK6fXC@macbook>
 <8980b420-8e6a-4dd9-ba5f-bd2eb527c2f7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8980b420-8e6a-4dd9-ba5f-bd2eb527c2f7@amd.com>

On Tue, Dec 05, 2023 at 11:27:03AM -0500, Stewart Hildebrand wrote:
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
> 
> There are many Arm based platforms that need to use iommu but don't have (or don't use) PCI, so we'd still like to have a separate vPCI flag.

OK, read below though - if we switch to vPCI being a descendant of
IOREQ (so that the PCI config space decoding is done by IOREQ) we
could hotplug vPCI managed devices at runtime without requiring any
prior initialization at domain create, since the traps to the PCI
config space would be setup by IOREQ.

We might need a PCI flag in order to signal whether the domain is
intended to use PCI devices or not, and so whether IOREQ needs to
setup PCI config space traps (either fully emulated or passthrough
devices).  But that would be arch-specific AFAICT, as on x86 we
always trap accesses to the PCI IO ports.

Thanks, Roger.

