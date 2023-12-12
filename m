Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B180EA90
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 12:40:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652962.1019160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD17D-0007Xe-5o; Tue, 12 Dec 2023 11:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652962.1019160; Tue, 12 Dec 2023 11:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD17D-0007V9-2c; Tue, 12 Dec 2023 11:39:55 +0000
Received: by outflank-mailman (input) for mailman id 652962;
 Tue, 12 Dec 2023 11:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IzYH=HX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rD17B-0007Td-Lh
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 11:39:53 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28857399-98e3-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 12:39:50 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3333a3a599fso3513668f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 03:39:50 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f16-20020a5d6650000000b00336360467a8sm187075wrw.51.2023.12.12.03.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 03:39:49 -0800 (PST)
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
X-Inumbo-ID: 28857399-98e3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702381189; x=1702985989; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNXBBRHD5qkWk2guSivg12tTPW3ePPSJ0V1IVaOxCk0=;
        b=uhY0suybSgrUCrrPvZNmcaMrMKbSEzhzJCyG8CBsiqj38O7UXjV2oLU+jY6uTQpbr5
         22+h1dvdKBOW17eEnNxheoktdGYBj340348sLRX5JgbCDmOFmfEpUiUyUNI6nK4GBCMd
         Rdy3sbISOqumAknR4FPYlypdNv1T9ITBzQawE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702381189; x=1702985989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNXBBRHD5qkWk2guSivg12tTPW3ePPSJ0V1IVaOxCk0=;
        b=bRQodMiNeUuGge4HE/qxoMWkU4EYEu6el4ic435Rqe8N5vA3m5B/0eJvc2EiDGzopJ
         GtfdmyZogBmRgisO9Y2/kJbvWkSa2OaD/Akf/R2K6zg0U6rtVgzhrhXa307EQub6g3zN
         qBWdNPf9VToyjCv9d/CdbpfHu/nJaYl2uJW0BSOF3BbHoNHSJzWUiTr2Iwhie1iSh2ow
         w18vrvQgemIJ+b2RE7l4qORWs96Ox47S5kMt/dg6or/sZJEqI+sTp/fnhUqnR+kWTicn
         M7IbcJxN95cVoMDTd5bR+E7+S+dvzrgRgY/q5SuAA9Ddj0bRrUPavgxshhKH0oIT44s4
         eu/w==
X-Gm-Message-State: AOJu0YyN93cd+yKU1IthAQJ8sjCUEOo2L4XhYDZk80o/Q3Qm7h8pjqMx
	pH8amctVZ9zlSMhSaHB4Hiq09A==
X-Google-Smtp-Source: AGHT+IGhA7h3bvd2Khr+klspvTTuqGP41GONtnscuZATYBUae1a++AwgwOBg9QTOWntJSlUfuSQ8yQ==
X-Received: by 2002:a5d:5234:0:b0:333:2fd7:95f8 with SMTP id i20-20020a5d5234000000b003332fd795f8mr3438411wra.51.1702381189583;
        Tue, 12 Dec 2023 03:39:49 -0800 (PST)
Date: Tue, 12 Dec 2023 12:39:48 +0100
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
Message-ID: <ZXhGhKkcmlEZOpwZ@macbook>
References: <alpine.DEB.2.22.394.2312041413000.110490@ubuntu-linux-20-04-desktop>
 <ZW7rDjjC0gxEI1cq@macbook>
 <15275706-5c31-4e29-aa29-9f5e90526219@suse.com>
 <BL1PR12MB5849C871B0B9577D1E0BF576E784A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXculMdLgwGaRC7i@macbook>
 <BL1PR12MB584997DDE6839F2340022976E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXgeieg4E8UN0KoN@macbook>
 <50ca26a1-38e3-45fb-9c39-56e4d04de3e0@suse.com>
 <ZXhBb0Vt6gDuprHa@macbook>
 <c5d4e8a4-b286-4352-bf96-a67cb132b452@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5d4e8a4-b286-4352-bf96-a67cb132b452@suse.com>

On Tue, Dec 12, 2023 at 12:19:49PM +0100, Jan Beulich wrote:
> On 12.12.2023 12:18, Roger Pau Monné wrote:
> > On Tue, Dec 12, 2023 at 10:38:08AM +0100, Jan Beulich wrote:
> >> (I think the Cc list is too long here, but then I don't know who to
> >> keep and who to possibly drop.)
> >>
> >> On 12.12.2023 09:49, Roger Pau Monné wrote:
> >>> On Tue, Dec 12, 2023 at 06:16:43AM +0000, Chen, Jiqian wrote:
> >>>> On 2023/12/11 23:45, Roger Pau Monné wrote:
> >>>>> On Wed, Dec 06, 2023 at 06:07:26AM +0000, Chen, Jiqian wrote:
> >>>>>> +static int xen_pvh_setup_gsi(gsi_info_t *gsi_info)
> >>>>>> +{
> >>>>>> +       struct physdev_setup_gsi setup_gsi;
> >>>>>> +
> >>>>>> +       setup_gsi.gsi = gsi_info->gsi;
> >>>>>> +       setup_gsi.triggering = (gsi_info->trigger == ACPI_EDGE_SENSITIVE ? 0 : 1);
> >>>>>> +       setup_gsi.polarity = (gsi_info->polarity == ACPI_ACTIVE_HIGH ? 0 : 1);
> >>>>>> +
> >>>>>> +       return HYPERVISOR_physdev_op(PHYSDEVOP_setup_gsi, &setup_gsi);
> >>>>>> +}
> >>>>>
> >>>>> Hm, why not simply call pcibios_enable_device() from pciback?  What
> >>>> pcibios_enable_device had been called when using cmd "xl pci-assignable-add sbdf" from pciback. But it didn't do map_pirq and setup_gsi.
> >>>> Because pcibios_enable_device-> pcibios_enable_irq-> __acpi_register_gsi(acpi_register_gsi_ioapic PVH specific)
> >>>>> you are doing here using the hypercalls is a backdoor into what's done
> >>>>> automatically by Xen on IO-APIC accesses by a PVH dom0.
> >>>> But the gsi didn't be unmasked, and vioapic_hwdom_map_gsi is never called.
> >>>> So, I think in pciback, if we can do what vioapic_hwdom_map_gsi does.
> >>>>
> >>>
> >>> I see, it does setup the IO-APIC pin but doesn't unmask it, that's
> >>> what I feared.
> >>>
> >>>>> It will be much more natural for the PVH dom0 model to simply use the
> >>>>> native way to configure and unmask the IO-APIC pin, and that would
> >>>>> correctly setup the triggering/polarity and bind it to dom0 without
> >>>>> requiring the usage of any hypercalls.
> >>>> Do you still prefer that I called unmask_irq in pcistub_init_device, as this v2 patch do?
> >>>> But Thomas Gleixner think it is not suitable to export unmask_irq.
> >>>
> >>> Yeah, that wasn't good.
> >>>
> >>>>>
> >>>>> Is that an issue since in that case the gsi will get mapped and bound
> >>>>> to dom0?
> >>>> Dom0 do map_pirq is to pass the check xc_domain_irq_permission()-> pirq_access_permitted(), 
> >>>
> >>> Can we see about finding another way to fix this check?
> >>>
> >>> One option would be granting permissions over the IRQ in
> >>> PHYSDEVOP_setup_gsi?
> >>
> >> There's no domain available there, and imo it's also the wrong interface to
> >> possibly grant any permissions.
> > 
> > Well, the domain is the caller.
> 
> Granting permission to itself?

See below in the previous email, the issue is not with the
permissions, which are correctly assigned from
dom0_setup_permissions(), but the usage of domain_pirq_to_irq() in
pirq_access_permitted() as called by XEN_DOMCTL_irq_permission.
There's no need to play with the permissions at all.

Regards, Roger.

