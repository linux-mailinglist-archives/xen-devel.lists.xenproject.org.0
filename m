Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB8945DA0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771042.1181619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZr23-0000iG-Ng; Fri, 02 Aug 2024 12:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771042.1181619; Fri, 02 Aug 2024 12:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZr23-0000fV-KN; Fri, 02 Aug 2024 12:05:15 +0000
Received: by outflank-mailman (input) for mailman id 771042;
 Fri, 02 Aug 2024 12:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAnW=PB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZr22-0000fP-FQ
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:05:14 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78da1d5c-50c7-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 14:05:13 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-44f6700addcso34035741cf.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 05:05:13 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4518a6e5c35sm6788891cf.47.2024.08.02.05.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 05:05:11 -0700 (PDT)
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
X-Inumbo-ID: 78da1d5c-50c7-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722600312; x=1723205112; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hVJg0+nu4wkHktptE3dFs15rYFV2ig63vkdRke6igDY=;
        b=Q/89laYNR/3N/9ZUyYgi4liCSjkgPIzn1g97Cy5KsJEGtzaP864UqsZHItcNUkrgzT
         gtvKP93dwXP3yBWYVnEz4uwWQ9GiVKtxay3H9JpwUM7eioYGKwWCgIRHW80xatUYmdH8
         ED7wTVhE0LAv2Qaakca8ba0sccIVTUsu4UbX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722600312; x=1723205112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVJg0+nu4wkHktptE3dFs15rYFV2ig63vkdRke6igDY=;
        b=YXShiwf3fGR54xqyDxF3IKGr5d/gcKUcqDVlO3Kvpx7LazBQCflm9tToaICaOvnGC0
         g/zlXSBQDKmQmwbHQnJ0ZO4tAN6dZyEe8MCcpmyettPLN1Fq45o42zj3DKT0REp+5OgE
         YNpxrQ6kr0KQOPVHis78Jijc3thPalgR0diImj2zK0M8w/Pkacw74T2HaHUxbRKSOqS2
         ABo/hOQDmAN9R7t3eqK2ijhAlGPNzBg2TiIP0TMjPDV3pD4hj3GHRGjp6DM7Aqgl1qv5
         IVuRbVYRfj5dCPf57XTO53XBOxzjJ8NsmgJx3g475MC14kZ7WV6K3P7SRwf7uAG6CpBE
         k9Yg==
X-Gm-Message-State: AOJu0Yyrw/LfQil6gPc99LuYk3+9o4iBFZnPKxOShchU5Xooas3fEsky
	0h3BfCnD4RR3A8UBKudOeT5FjZMyrcFEM+wiwTwCjx4h75kUbLXJLCIA9SddJyc=
X-Google-Smtp-Source: AGHT+IHeF40GD7omxwOogNikdKICNXxzXqHXdcGsQGpV2pXlHpmWtWqAMp3K2GRxEVuGSEHBdOvBxQ==
X-Received: by 2002:ac8:580a:0:b0:447:f89a:4d37 with SMTP id d75a77b69052e-4518929e522mr35873881cf.44.1722600312002;
        Fri, 02 Aug 2024 05:05:12 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:05:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Message-ID: <ZqzLdLAakJ6AGg9O@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com>
 <ZqyT7ocbP6AZEb_S@macbook>
 <d5a6b8e4-d848-4b37-83f2-e492c9e99484@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5a6b8e4-d848-4b37-83f2-e492c9e99484@suse.com>

On Fri, Aug 02, 2024 at 11:40:53AM +0200, Jan Beulich wrote:
> On 02.08.2024 10:08, Roger Pau Monné wrote:
> > On Mon, Jul 08, 2024 at 07:41:21PM +0800, Jiqian Chen wrote:
> >> Some type of domains don't have PIRQs, like PVH, it doesn't do
> >> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
> >> to guest base on PVH dom0, callstack
> >> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> >> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
> >> irq on Xen side.
> >> What's more, current hypercall XEN_DOMCTL_irq_permission requires
> >> passing in pirq to set the access of irq, it is not suitable for
> >> dom0 that doesn't have PIRQs.
> >>
> >> So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/deny
> >> the permission of irq(translate from x86 gsi) to dumU when dom0
> >> has no PIRQs.
> > 
> > I've been wondering about this, and if the hypercall is strictly to
> > resolve GSIs into IRQs, isn't that the case that Xen identity maps GSI
> > into the IRQ space, and hence no translation is required?
> 
> It was a long-winded discussion to clarify that in obscure cases
> translation is required: Whenever there's a source override in ACPI.

Right, I see it's a bit convoluted to get the overrides, as those are
indexed by IO-APIC pin, so we need to resolve the GSI -> (ioapic, pin)
first and then check for any possible overrides.

Might be helpful to mention in the commit description that the GSI to
IRQ translation is done to account for ACPI overrides, as otherwise
GSIs are identity mapped into IRQs.

Thanks, Roger.

