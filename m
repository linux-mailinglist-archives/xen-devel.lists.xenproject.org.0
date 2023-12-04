Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8B803150
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 12:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646829.1009414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6sW-0005DR-Ob; Mon, 04 Dec 2023 11:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646829.1009414; Mon, 04 Dec 2023 11:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA6sW-0005AV-Lc; Mon, 04 Dec 2023 11:12:44 +0000
Received: by outflank-mailman (input) for mailman id 646829;
 Mon, 04 Dec 2023 11:12:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA6sU-0005AL-PP
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 11:12:42 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a030bbf-9296-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 12:12:40 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3334254cfa3so652362f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 03:12:40 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 j10-20020a5d604a000000b003333fd29854sm4955607wrt.45.2023.12.04.03.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 03:12:39 -0800 (PST)
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
X-Inumbo-ID: 0a030bbf-9296-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701688360; x=1702293160; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xcd+lJtiJV0rf/33zhY/14IfMTuerv/klvGcvT9Bn9g=;
        b=M/mJHpXhmuA35NSFTGbrhgbMcu/5Q4Sg25Yl6nJiG12vHexFJ7D2n4XbZzgLDRhPl3
         N1mnKfnAjHH/0xW843pHuW37hM41uBqSlzKYo8WlzGKqiYx6nEyp0bIERVwAmW34YAz9
         HytUoIaNXMd2nZo3gfhLLYV1IwEszBccdrpqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701688360; x=1702293160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcd+lJtiJV0rf/33zhY/14IfMTuerv/klvGcvT9Bn9g=;
        b=XsxeepXxWns4lAP3ftg2gE3DefhyCefigPEl1TapSGw8fjaqySOnRC3LBuQBHnxUPL
         ezDT/eY1kmEok5Hh0fpZyMlE1eR5ABGIEGz5wfbZxwOpLmIRmXRVbrjY98sZiSOekkj4
         Brj57F/KTHL4iKUMVb/1MkUhqdQUm5ClTHQi125Jlzjrt2cqB4+g0hj7LSZdZDdLFRTQ
         3jRCVV4F9ciyWtt+3d+Go4UaaW2bAkSlZFXi+hhgevjx9DJB4RcHxvkJeQhN8Yf1Du2I
         AyIuqSxj9v9F+ZCXNgdEzOveFn0KbIPuFZ4Tzg3b4bbLLfpTL2dG26peh4qZHuHGoPsM
         RzJQ==
X-Gm-Message-State: AOJu0YzperTVMSaCn48wITjrFqj5dy1h+bHXOoYx4GjUB8MhVQzD0Thw
	h9qOlJC8uemDmvzt+1lLRRryZA==
X-Google-Smtp-Source: AGHT+IEGiAO/PNuHEbBC0xubkySMEiFso3hUz212Alw7dFGrZEjXb8f//Bhps4YaMNMNEwJ6c/nqDw==
X-Received: by 2002:adf:e681:0:b0:332:f97e:f560 with SMTP id r1-20020adfe681000000b00332f97ef560mr2514583wrm.30.1701688360191;
        Mon, 04 Dec 2023 03:12:40 -0800 (PST)
Date: Mon, 4 Dec 2023 12:12:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Message-ID: <ZW20J5p0jj3dNArE@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com>
 <ZWX4R9UEE6oXiqaz@macbook>
 <alpine.DEB.2.22.394.2311291937170.3533093@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311291956130.3533093@ubuntu-linux-20-04-desktop>
 <ZWheuUjLxShoQ_qn@macbook>
 <alpine.DEB.2.22.394.2311301907370.110490@ubuntu-linux-20-04-desktop>
 <ZWmhRb6Ne4vgplzM@macbook>
 <BL1PR12MB5849CEDE0F018E0DB86D8E2BE786A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849CEDE0F018E0DB86D8E2BE786A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Dec 04, 2023 at 05:38:06AM +0000, Chen, Jiqian wrote:
> On 2023/12/1 17:03, Roger Pau Monné wrote:
> > On Thu, Nov 30, 2023 at 07:09:12PM -0800, Stefano Stabellini wrote:
> >> On Thu, 30 Nov 2023, Roger Pau Monné wrote:
> >>> On Wed, Nov 29, 2023 at 08:02:40PM -0800, Stefano Stabellini wrote:
> >>>> n Wed, 29 Nov 2023, Stefano Stabellini wrote:
> >>>>> On Tue, 28 Nov 2023, Roger Pau Monné wrote:
> >>>>>> On Fri, Nov 24, 2023 at 06:41:36PM +0800, Jiqian Chen wrote:
> >>>>>>> In PVH dom0, it uses the linux local interrupt mechanism,
> >>>>>>> when it allocs irq for a gsi, it is dynamic, and follow
> >>>>>>> the principle of applying first, distributing first. And
> >>>>>>> if you debug the kernel codes, you will find the irq
> >>>>>>> number is alloced from small to large, but the applying
> >>>>>>> gsi number is not, may gsi 38 comes before gsi 28, that
> >>>>>>> causes the irq number is not equal with the gsi number.
> >>>>>>> And when we passthrough a device, QEMU will use its gsi
> >>>>>>> number to do mapping actions, see xen_pt_realize->
> >>>>>>> xc_physdev_map_pirq, but the gsi number is got from file
> >>>>>>> /sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
> >>>>>>> so it will fail when mapping.
> >>>>>>> And in current codes, there is no method to translate
> >>>>>>> irq to gsi for userspace.
> >>>>>>
> >>>>>> I think it would be cleaner to just introduce a new sysfs node that
> >>>>>> contains the gsi if a device is using one (much like the irq sysfs
> >>>>>> node)?
> >>>>>>
> >>>>>> Such ioctl to translate from IRQ to GSI has nothing to do with Xen, so
> >>>>>> placing it in privcmd does seem quite strange to me.  I understand
> >>>>>> that for passthrough we need the GSI, but such translation layer from
> >>>>>> IRQ to GSI is all Linux internal, and it would be much simpler to just
> >>>>>> expose the GSI in sysfs IMO.
> >>>>>
> >>>>> Maybe something to add to drivers/xen/sys-hypervisor.c in Linux.
> >>>>> Juergen what do you think?
> >>>>
> >>>> Let me also add that privcmd.c is already a Linux specific interface.
> >>>> Although it was born to be a Xen hypercall "proxy" in reality today we
> >>>> have a few privcmd ioctls that don't translate into hypercalls. So I
> >>>> don't think that adding IOCTL_PRIVCMD_GSI_FROM_IRQ would be a problem.
> >>>
> >>> Maybe not all ioctls translate to hypercalls (I guess you are
> >>> referring to the IOCTL_PRIVCMD_RESTRICT ioctl), but they are specific
> >>> Xen actions.  Getting the GSI used by a device has nothing do to with
> >>> Xen.
> >>>
> >>> IMO drivers/xen/sys-hypervisor.c is also not appropriate, but I'm not
> >>> the maintainer of any of those components.
> >>>
> >>> There's nothing Xen specific about fetching the GSI associated with a
> >>> PCI device.  The fact that Xen needs it for passthrough is just a red
> >>> herring, further cases where the GSI is needed might arise outside of
> >>> Xen, and hence such node would better be placed in a generic
> >>> location.  The right location should be /sys/bus/pci/devices/<sbdf>/gsi.
> >>
> >> That might be true but /sys/bus/pci/devices/<sbdf>/gsi is a non-Xen
> >> generic interface and the maintainers of that portion of Linux code
> >> might have a different opinion. We'll have to see.
> > 
> > Right, but before resorting to implement a Xen specific workaround
> > let's attempt to do it the proper way :).
> > 
> > I cannot see why exposing the gsi on sysfs like that would be an
> > issue.  There's a lot of resource information exposed on sysfs
> > already, and it's a trivial node to implement.
> Thanks for both of you' s suggestions. At present, it seems the result of discussion is that it needs to add a gsi sysfs. I will modify it in the next version and then add the corresponding maintainer to the review list.

Thanks, please keep xen-devel on Cc if possible.  Maybe if the
suggested path is not suitable maintainers can recommend another path
where the gsi (or equivalent) node could live.

Thanks, Roger.

