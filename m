Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396F181437C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 09:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654902.1022385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3SN-0008Ja-85; Fri, 15 Dec 2023 08:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654902.1022385; Fri, 15 Dec 2023 08:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE3SN-0008HE-4n; Fri, 15 Dec 2023 08:22:03 +0000
Received: by outflank-mailman (input) for mailman id 654902;
 Fri, 15 Dec 2023 08:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE3SM-0008H5-GL
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 08:22:02 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03f2f787-9b23-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 09:21:58 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c55872d80so8545235e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 00:21:58 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b0040c44b4a282sm20101255wmq.43.2023.12.15.00.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 00:21:57 -0800 (PST)
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
X-Inumbo-ID: 03f2f787-9b23-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702628518; x=1703233318; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aUHn+EpO/wJgG//9RpLLhXdoLe1RQ/ZYsupoGSnu8GM=;
        b=sP/1trdwHZ4uCBYMr/HuS9DoDI0TcSY3RmXU5Pk22No43N6yWEltrZ23G8i1qq8lgr
         etnXaJcLIH4P02MlXtar0Wap53gybKs8dHhiLJTVDcTvCyXrYS4i7AyxxQqvxZXFQAlJ
         TXPi4TlbJEMc9Pm1qmk0M28ycsGuoe9lYDuEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628518; x=1703233318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUHn+EpO/wJgG//9RpLLhXdoLe1RQ/ZYsupoGSnu8GM=;
        b=DnS4xe3vx3htKbpdivq8vlM/cckecyQO4mpL5PB07TWfF73U6wbC581Btg/fdeN7g4
         S510bbFImDb7RqsAu5TUvY3mV7a+inRW9SfiyYJm2CHLIdxIGe55W82a3y+8O+nH4BCr
         jDmhZfMULvwoH+svij0iBZcRyP1ufJxdmqM2tDhH/97v6M6IRDN2lPPwp9gMumUugRFo
         xiwnpesJja2FJ+VW9IRwfk8eLJtRWAzk3TSVaTKeLZtcGRi7MfsVCJxaB5eKSTJXyQ5M
         binc0UjljOdvIm6D4IatI2Idw6eWWdDWB0NwY/92nX67VHbcGhA3ZvouzLxMj21Nl2VN
         BjTA==
X-Gm-Message-State: AOJu0Yz2TNdYdpbaS3++5VHedsjMlk5B+sdC/NYOumstH1T5bCvGByfS
	lfgiQuqndQ9tAxwAVAux5CfYjw==
X-Google-Smtp-Source: AGHT+IHcuhTj2ptHr/F8V5VtKOPw26XqdLkHSGdeQ1pQEIc1I3bxAxWIPhA/ytQgJdrVG4QR4FFCWw==
X-Received: by 2002:a05:600c:548c:b0:40b:5e26:2385 with SMTP id iv12-20020a05600c548c00b0040b5e262385mr5744293wmb.54.1702628518157;
        Fri, 15 Dec 2023 00:21:58 -0800 (PST)
Date: Fri, 15 Dec 2023 09:21:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Message-ID: <ZXwMpGFJuJD3j0wI@macbook>
References: <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZXrRG8oc25Do0Dnv@macbook>
 <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com>
 <ZXrTwfzedFQLhxiQ@macbook>
 <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>

On Thu, Dec 14, 2023 at 02:49:18PM -0800, Stefano Stabellini wrote:
> On Thu, 14 Dec 2023, Roger Pau Monné wrote:
> > On Thu, Dec 14, 2023 at 10:58:24AM +0100, Jan Beulich wrote:
> > > On 14.12.2023 10:55, Roger Pau Monné wrote:
> > > > On Thu, Dec 14, 2023 at 08:55:45AM +0000, Chen, Jiqian wrote:
> > > >> On 2023/12/13 15:03, Jan Beulich wrote:
> > > >>> On 13.12.2023 03:47, Chen, Jiqian wrote:
> > > >>>> On 2023/12/12 17:30, Jan Beulich wrote:
> > > >>>>> On 12.12.2023 07:49, Chen, Jiqian wrote:
> > > >>>>>> On 2023/12/11 23:31, Roger Pau Monné wrote:
> > > >>>>>>> On Mon, Dec 11, 2023 at 12:40:08AM +0800, Jiqian Chen wrote:
> > > >>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
> > > >>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
> > > >>>>>>>> @@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> > > >>>>>>>>  
> > > >>>>>>>>      switch ( cmd )
> > > >>>>>>>>      {
> > > >>>>>>>> +    case PHYSDEVOP_setup_gsi:
> > > >>>>>>>
> > > >>>>>>> I think given the new approach on the Linux side patches, where
> > > >>>>>>> pciback will configure the interrupt, there's no need to expose
> > > >>>>>>> setup_gsi anymore?
> > > >>>>>> The latest patch(the second patch of v3 on kernel side) does setup_gsi and map_pirq for passthrough device in pciback, so we need this and below.
> > > >>>>>>
> > > >>>>>>>
> > > >>>>>>>>      case PHYSDEVOP_map_pirq:
> > > >>>>>>>>      case PHYSDEVOP_unmap_pirq:
> > > >>>>>>>> +        if ( is_hardware_domain(currd) )
> > > >>>>>>>> +            break;
> > > >>>>>>>
> > > >>>>>>> Also Jan already pointed this out in v2: this hypercall needs to be
> > > >>>>>>> limited so a PVH dom0 cannot execute it against itself.  IOW: refuse
> > > >>>>>>> the hypercall if DOMID_SELF or the passed domid matches the current
> > > >>>>>>> domain domid.
> > > >>>>>> Yes, I remember Jan's suggestion, but since the latest patch(the second patch of v3 on kernel side) has change the implementation, it does setup_gsi and map_pirq for dom0 itself, so I didn't add the DOMID_SELF check.
> > > >>>>>
> > > >>>>> And why exactly would it do specifically the map_pirq? (Even the setup_gsi
> > > >>>>> looks questionable to me, but there might be reasons there.)
> > > >>>> Map_pirq is to solve the check failure problem. (pci_add_dm_done-> xc_domain_irq_permission-> XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0)
> > > >>>> Setup_gsi is because the gsi is never be unmasked, so the gsi is never be registered( vioapic_hwdom_map_gsi-> mp_register_gsi is never be called).
> > > >>>
> > > >>> And it was previously made pretty clear by Roger, I think, that doing a "map"
> > > >>> just for the purpose of granting permission is, well, at best a temporary
> > > >>> workaround in the early development phase. If there's presently no hypercall
> > > >>> to _only_ grant permission to IRQ, we need to add one.
> > > >> Could you please describe it in detail? Do you mean to add a new hypercall to grant irq access for dom0 or domU?
> > > >> It seems XEN_DOMCTL_irq_permission is the hypercall to grant irq access from dom0 to domU(see XEN_DOMCTL_irq_permission-> irq_permit_access). There is no need to add hypercall to grant irq access.
> > > >> We failed here (XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0) is because the PVH dom0 didn't use PIRQ, so we can't get irq from pirq if "current" is PVH dom0.
> > > > 
> > > > One way to bodge this would be to detect whether the caller of
> > > > XEN_DOMCTL_irq_permission is a PV or an HVM domain, and in case of HVM
> > > > assume the pirq field is a GSI.  I'm unsure however how that will work
> > > > with non-x86 architectures.
> 
> PIRQ is an x86-only concept. We have event channels but no PIRQs on ARM.
> I expect RISC-V will be the same.
> 
> 
> > > > It would  be better to introduce a new XEN_DOMCTL_gsi_permission, or
> 
> "GSI" is another x86-only concept.

Yes, that hypercall would be x86-specific.

> So actually the best name was indeed XEN_DOMCTL_irq_permission, given
> that it is using the more arch-neutral "irq" terminology.
> 
> Perhaps it was always a mistake to pass PIRQs to
> XEN_DOMCTL_irq_permission and we should always have passed the real
> interrupt number (GSI on x86, SPI on ARM).

I really don't know much about Arm, but don't you also have LPIs, and
would need to add some kind of type field to
xen_domctl_irq_permission?

> So your "bodge" is actually kind of OK in my opinion. Basically everyone
> else (x86 HVM/PVH, ARM, RISC-V, probably PPC too) will use
> XEN_DOMCTL_irq_permission with hardware interrupt numbers (GSIs, SPIs,
> etc.), the only special case is x86 PV. It is x86 PV the odd one.

x86 PV could also pass the GSI if we wanted to change the interface
uniformly.  AFAICT the hypercall is only used by libxl, so would
likely be fine to change.

> Given that DOMCTL is an unstable interface anyway, I feel OK making
> changes to it, even better if backward compatible.

Me calling this a 'bodge' was mostly because I think it would be nice
to take the opportunity to move the hypercall to a stable
interface.

Thanks, Roger.

