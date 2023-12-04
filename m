Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381380310E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646810.1009385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6eN-0007g1-3K; Mon, 04 Dec 2023 10:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646810.1009385; Mon, 04 Dec 2023 10:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6eM-0007e5-V6; Mon, 04 Dec 2023 10:58:06 +0000
Received: by outflank-mailman (input) for mailman id 646810;
 Mon, 04 Dec 2023 10:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA6eM-00070O-0A
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:58:06 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff9c0bc5-9293-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 11:58:04 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c08af319cso14163245e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 02:58:04 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 k3-20020a5d6283000000b0033335cabb9csm7012805wru.28.2023.12.04.02.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 02:58:03 -0800 (PST)
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
X-Inumbo-ID: ff9c0bc5-9293-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701687484; x=1702292284; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYi6cbbS90l6J5nSXZFOjrhCVfbmslDt3m8zmXiPtpc=;
        b=pPOaZI5sTtPKF0DIvmgCPCAQZrm8UY7zhzFtvl7nvCD1IU3bXsMy9aRGy+/TxMz0Nl
         tV7bMYyLjP8AyYRh1jDlexqQqBFngbDdlAAL7aVVJF+ketWwXrz2z89KB7XDakRi919y
         QBps4/CN4UuX/aMalUnAyi72FQIbxrKNeD+v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701687484; x=1702292284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYi6cbbS90l6J5nSXZFOjrhCVfbmslDt3m8zmXiPtpc=;
        b=dC6ibK+KZS4eEKqxRSKPb8xbvyYuu089IpZ2lV6tqNKVap27LVbSnOpZdYYABNJna/
         5ieRhnPHGZDjvV4pvyyHOuLNCEMrzZdLq0xmZLp3+Nq1e5iUwx6c4BOm2FwjO5aG0eD7
         lymtD3kxnCo4qVHMtPkWPg20jsOvwnNDGGR1dnVtsyyiWsmkgQfLWVwdLigZVRITv7mo
         tb7LzGJ1vBMvwxG/hbDqZqR3tNTIZ276cW+YpzBsbh0YH5RFh7AMAgcV58ZlSeRpCIUa
         3/uyzgNCTZKx1gGGuG1zaJvLjIkvmcOPqurvWES7TaW+7+oGad8aF7mbxaomeJj/wM+7
         guLw==
X-Gm-Message-State: AOJu0YwtJ30xYq0UtTR7WAqs2yj053r70ImVGS9VJ0qt1h5FuIrfWNQf
	WEhS8G6/DgCUkGr25bsLp+4rzw==
X-Google-Smtp-Source: AGHT+IE+TAFKEGjkK+RJYRELbF18VFrUAhpo7vi9lsZxnaS7j9VVjibOJHsc0djrgl9dQbSIOC38nA==
X-Received: by 2002:a05:600c:4593:b0:40b:4bd3:f8e2 with SMTP id r19-20020a05600c459300b0040b4bd3f8e2mr2395872wmo.22.1701687483631;
        Mon, 04 Dec 2023 02:58:03 -0800 (PST)
Date: Mon, 4 Dec 2023 11:58:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Message-ID: <ZW2wuqXW-DneUVi0@macbook>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
 <20231113222118.825758-5-stewart.hildebrand@amd.com>
 <ZWmkh0Xeaynh43N7@macbook>
 <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop>

On Fri, Dec 01, 2023 at 06:56:32PM -0800, Stefano Stabellini wrote:
> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
> > On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
> > > @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
> > >          bus = PCI_BUS(machine_sbdf);
> > >          devfn = PCI_DEVFN(machine_sbdf);
> > >  
> > > +        if ( needs_vpci(d) && !has_vpci(d) )
> > > +        {
> > > +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
> > > +                   &PCI_SBDF(seg, bus, devfn), d);
> > > +            ret = -EPERM;
> > > +            break;
> > 
> > I think this is likely too restrictive going forward.  The current
> > approach is indeed to enable vPCI on a per-domain basis because that's
> > how PVH dom0 uses it, due to being unable to use ioreq servers.
> > 
> > If we start to expose vPCI suport to guests the interface should be on
> > a per-device basis, so that vPCI could be enabled for some devices,
> > while others could still be handled by ioreq servers.
> > 
> > We might want to add a new flag to xen_domctl_assign_device (used by
> > XEN_DOMCTL_assign_device) in order to signal whether the device will
> > use vPCI.
> 
> Actually I don't think this is a good idea. I am all for flexibility but
> supporting multiple different configurations comes at an extra cost for
> both maintainers and contributors. I think we should try to reduce the
> amount of configurations we support rather than increasing them
> (especially on x86 where we have PV, PVH, HVM).

I think it's perfectly fine to initially require a domain to have all
its devices either passed through using vPCI or ireqs, but the
interface IMO should allow for such differentiation in the future.
That's why I think introducing a domain wide vPCI flag might not be
the best option going forward.

It would be perfectly fine for XEN_DOMCTL_assign_device to set a
domain wide vPCI flag, iow:

if ( HYPERCALL_VPCI_FLAG_SET && !has_vpci(d) )
{
    if ( has_arch_pdevs(d) )
    {
        printk("All passthrough devices must use the same backend\n");
        return -EINVAL;
    }

    /* Set vPCI domain flag */
}

We have already agreed that we want to aim for a setup where ioreqs
and vPCI could be used for the same domain, but I guess you assumed
that ioreqs would be used for emulated devices exclusively and vPCI
for passthrough devices?

Overall if we agree that ioreqs and vPCI should co-exist for a domain,
I'm not sure there's much reason to limit ioreqs to only handle
emulated devices, seems like an arbitrary limitation.

> I don't think we should enable IOREQ servers to handle PCI passthrough
> for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
> Passthrough can be handled by vPCI just fine. I think this should be a
> good anti-feature to have (a goal to explicitly not add this feature) to
> reduce complexity. Unless you see a specific usecase to add support for
> it?

There are passthrough devices (GPUs) that might require some extra
mediation on dom0 (like the Intel GVT-g thing) that would force the
usage of ioreqs to passthrough.

It's important that the interfaces we introduce are correct IMO,
because that ends up reflecting on the configuration options that we
expose to users on xl/libxl.  While both XEN_DOMCTL_createdomain and
XEN_DOMCTL_assign_device are unstable interfaces, how the vPCI option
gets placed there will ultimately influence how the option gets
exposed in xl/libxl, and the interface there is relevant to keep
stable for end user sanity.

Thanks, Roger.

