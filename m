Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E280EA39
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652952.1019140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0mC-0000Vh-7d; Tue, 12 Dec 2023 11:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652952.1019140; Tue, 12 Dec 2023 11:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD0mC-0000TC-3T; Tue, 12 Dec 2023 11:18:12 +0000
Received: by outflank-mailman (input) for mailman id 652952;
 Tue, 12 Dec 2023 11:18:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IzYH=HX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rD0mA-0000T6-KK
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:18:10 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20b854e7-98e0-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 12:18:08 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3363397426eso352781f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 03:18:08 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 v4-20020a5d4a44000000b003342e0745absm10528606wrs.93.2023.12.12.03.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 03:18:07 -0800 (PST)
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
X-Inumbo-ID: 20b854e7-98e0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702379888; x=1702984688; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7BFBppsK3GWi0F4LB+KttdrrzEfHyI8WvRQEogrcRE=;
        b=deE9eeDS9AicM2oPESH+238+vGS+YRjCe40iUTiZgt9JGq78OnKbWwFcjE3yXc/JOq
         R1DnerQfpbWwOcGkUhqn7ok9PfZ1RcZZ2rRYAOcMkOidiyQ5cef8nW9XXTT/PULhuF6A
         NAZbqq6EmoqL4aJ781y3sNNjOSyCpN9ohQUcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702379888; x=1702984688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7BFBppsK3GWi0F4LB+KttdrrzEfHyI8WvRQEogrcRE=;
        b=gwF6ly/SYxoqG7cIjWn1R2uzdlgR9T51h6Jh43wYmp+GzUjkxiC1DpGFbRSnYchicV
         oeWOkd0gm6JLF+W8InSp4VLQDhZScQmvammfm68XegjIBovHoweXdhjNaIRDrBC1IuTP
         GPfxU5OB08eP4038b8+PocLxhHiT15diOguBsIjuPOPDlX8+1GVTcMBk/pdqAn8GYWaU
         BPexNuelqaaJK9hwwati19O4lPVJyNNxDr+BN8PKaWOg2LOQvlhXBK09k6/ONY98ddB4
         B5rc4X4b0GxroE7Jfl7/Mh7PlfLT4QOYLmZXuwC5jwB5PNQGZwhLrd/0XO0zQgeS3Z/X
         pSJQ==
X-Gm-Message-State: AOJu0YxSEIkyf9NhPstf5yzWmPzSs5dLHHZq+Vvn2pquQ5cmXij1Ta4+
	7pW4A+BXVaNeZbGy2ba4SVfhcQ==
X-Google-Smtp-Source: AGHT+IE+cmXW0xzzzz/niDA4DCQcFmC2gDD9204EEblz5Il4mMgF4+Gk5TlFR116dxE3XcbBkwQm4g==
X-Received: by 2002:a5d:6242:0:b0:333:524d:59f9 with SMTP id m2-20020a5d6242000000b00333524d59f9mr2992320wrv.17.1702379887956;
        Tue, 12 Dec 2023 03:18:07 -0800 (PST)
Date: Tue, 12 Dec 2023 12:18:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Message-ID: <ZXhBb0Vt6gDuprHa@macbook>
References: <alpine.DEB.2.22.394.2312011857260.110490@ubuntu-linux-20-04-desktop>
 <ZW2ptexPQXrWBiOS@macbook>
 <alpine.DEB.2.22.394.2312041413000.110490@ubuntu-linux-20-04-desktop>
 <ZW7rDjjC0gxEI1cq@macbook>
 <15275706-5c31-4e29-aa29-9f5e90526219@suse.com>
 <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXculMdLgwGaRC7i@macbook>
 <BL1PR12MB584997DDE6839F2340022976E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXgeieg4E8UN0KoN@macbook>
 <50ca26a1-38e3-45fb-9c39-56e4d04de3e0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50ca26a1-38e3-45fb-9c39-56e4d04de3e0@suse.com>

On Tue, Dec 12, 2023 at 10:38:08AM +0100, Jan Beulich wrote:
> (I think the Cc list is too long here, but then I don't know who to
> keep and who to possibly drop.)
> 
> On 12.12.2023 09:49, Roger Pau Monné wrote:
> > On Tue, Dec 12, 2023 at 06:16:43AM +0000, Chen, Jiqian wrote:
> >> On 2023/12/11 23:45, Roger Pau Monné wrote:
> >>> On Wed, Dec 06, 2023 at 06:07:26AM +0000, Chen, Jiqian wrote:
> >>>> +static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
> >>>> +{
> >>>> +       struct physdev_setup_gsi setup_gsi;
> >>>> +
> >>>> +       setup_gsi.gsi = gsi_info->gsi;
> >>>> +       setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
> >>>> +       setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
> >>>> +
> >>>> +       return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
> >>>> +}
> >>>
> >>> Hm, why not simply call pcibios_enable_device() from pciback?  What
> >> pcibios_enable_device had been called when using cmd "xl pci-assignable-add sbdf" from pciback. But it didn't do map_pirq and setup_gsi.
> >> Because pcibios_enable_device-> pcibios_enable_irq-> __acpi_register_gsi(acpi_register_gsi_ioapic PVH specific)
> >>> you are doing here using the hypercalls is a backdoor into what's done
> >>> automatically by Xen on IO-APIC accesses by a PVH dom0.
> >> But the gsi didn't be unmasked, and vioapic_hwdom_map_gsi is never called.
> >> So, I think in pciback, if we can do what vioapic_hwdom_map_gsi does.
> >>
> > 
> > I see, it does setup the IO-APIC pin but doesn't unmask it, that's
> > what I feared.
> > 
> >>> It will be much more natural for the PVH dom0 model to simply use the
> >>> native way to configure and unmask the IO-APIC pin, and that would
> >>> correctly setup the triggering/polarity and bind it to dom0 without
> >>> requiring the usage of any hypercalls.
> >> Do you still prefer that I called unmask_irq in pcistub_init_device, as this v2 patch do?
> >> But Thomas Gleixner think it is not suitable to export unmask_irq.
> > 
> > Yeah, that wasn't good.
> > 
> >>>
> >>> Is that an issue since in that case the gsi will get mapped and bound
> >>> to dom0?
> >> Dom0 do map_pirq is to pass the check xc_domain_irq_permission()-> pirq_access_permitted(), 
> > 
> > Can we see about finding another way to fix this check?
> > 
> > One option would be granting permissions over the IRQ in
> > PHYSDEVOP_setup_gsi?
> 
> There's no domain available there, and imo it's also the wrong interface to
> possibly grant any permissions.

Well, the domain is the caller.

> > Otherwise we could see about modifying the logic in PHYSDEVOP_map_pirq
> > so that the hardware domain can map IRQs to other domains without
> > having it mapped to itself first?
> 
> While this may be possible to arrange for, it still would feel wrong. How
> would you express the same in a disaggregated environment? I.e. how would
> you make sure a domain trying to grant permission is actually permitted to
> do so for the resource in question?

I've been looking again at the original issue, and I think I was
confused.  The issue is not that dom0 doesn't have permissions over
the GSIs (as we do grant those in dom0_setup_permissions()), but
rather that XEN_DOMCTL_irq_permission attempts to use
domain_pirq_to_irq() in order to get the IRQ from the PIRQ parameter.

I've always been a bit confused with the PIRQ GSI relation, but IIRC
GSIs are always identity mapped to PIRQs, and hence you could possibly
adjust XEN_DOMCTL_irq_permission to use irq_permit_access() to check
if the caller domain has permissions over the target PIRQ.

Thanks, Roger.

