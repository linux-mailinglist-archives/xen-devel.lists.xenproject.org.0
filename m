Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AC29714BD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794130.1202838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbFl-0006YP-O9; Mon, 09 Sep 2024 10:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794130.1202838; Mon, 09 Sep 2024 10:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbFl-0006Wu-LG; Mon, 09 Sep 2024 10:04:13 +0000
Received: by outflank-mailman (input) for mailman id 794130;
 Mon, 09 Sep 2024 10:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snbFk-0006Wo-3g
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:04:12 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc112cb8-6e92-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:04:10 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53662965a05so1797621e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:04:10 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258338a2sm319917066b.43.2024.09.09.03.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:04:08 -0700 (PDT)
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
X-Inumbo-ID: dc112cb8-6e92-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725876250; x=1726481050; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3TXnKcFjV+bF+pgxtWHL7F27aDEWxhOk84cKyI/3Er8=;
        b=q387wNjaoNMtkfWkoxZVW1kNwM7ixiz8qwUwe0jT5k1+MGjNHFD54CpwZ7JjiSOjRR
         BfvTqSak6Qg7a/vZSx/ESDhi+w4jvYQfjOCkSrCNEvigHx5bOpx1MqXdor9K4SXnCme/
         MEXbacBUDFbax3jDS3rIEMSAkOkD1NRLEBm+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876250; x=1726481050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TXnKcFjV+bF+pgxtWHL7F27aDEWxhOk84cKyI/3Er8=;
        b=FKnYO1jyG1wFGXEytJSpl6J1sUd43r6f0f3bWKHCu6r4SCxuv9qG5jrSy7/ohuvvTd
         KTp3x+xC33sJU7DKzGMBeOxv6ZgojySrK8hWOocpyGymZ2epJrQT3KLUfk+fla0774dq
         PNJ5s5KTN4kVn/PdHfDTgxLrnrbXQ5wZbhsqUIocG2p+CeGtLGay3z5qdSPbOlaJDwkJ
         A0I/4pMEoOPOfVTGceoDdLaS2UhW1Ru+GuMAjONj5qs4RMSb1GWiqY4TLHnuAfxOb+B/
         afuki1yDm302X3aQQxemDbdyytK7Lvq9nUf0muSH4U7kyjsHnPvguEwh6XaKU4rdNB0/
         eEGg==
X-Forwarded-Encrypted: i=1; AJvYcCVjH5B6CPKh3MTtQktXoBEpyd9Ww01BN4shBa342lHkxgrfZ3T8bR1HGla9hT8/pJOx54OtexsWX1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzH2cqltEHAkW2ALBEum58Wp8xvQAfLw9h1RbON12aPzWBr8ku9
	gYlqnTJ6Wq+9r55lUGARmZc4RavpEZk30KlBZFtb7WKmFGkb9DO5OqOZ8Xnd8f0=
X-Google-Smtp-Source: AGHT+IECUAEU0tOCU407M87+wePIeLbCNeWpd471um92MscExUT1CrP2SubfJeuubKNoXtrQpuCCeg==
X-Received: by 2002:a05:6512:238b:b0:536:5646:251e with SMTP id 2adb3069b0e04-536587a34d3mr7889049e87.10.1725876249235;
        Mon, 09 Sep 2024 03:04:09 -0700 (PDT)
Date: Mon, 9 Sep 2024 12:04:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Message-ID: <Zt7IF3orBueNK-NM@macbook.local>
References: <BL1PR12MB58492EE11D404B2E09DA0210E7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b2b7b716-974c-4172-ba68-261453a96932@suse.com>
 <alpine.DEB.2.22.394.2409031839550.53815@ubuntu-linux-20-04-desktop>
 <ea41eb5d-f8a1-4120-b5c1-70bdf02d8038@suse.com>
 <BL1PR12MB5849E69A83D4BABAF544C22EE79D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f6a1f021-04cc-4dd3-bcea-97a7343399e1@suse.com>
 <alpine.DEB.2.22.394.2409051521340.53815@ubuntu-linux-20-04-desktop>
 <fb08f1bc-291d-4c97-b20e-7e4ba9f556c9@suse.com>
 <alpine.DEB.2.22.394.2409061500390.53815@ubuntu-linux-20-04-desktop>
 <3ef3295a-705f-4070-a223-774716e1f3a3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ef3295a-705f-4070-a223-774716e1f3a3@suse.com>

On Mon, Sep 09, 2024 at 10:56:07AM +0200, Jan Beulich wrote:
> On 07.09.2024 01:34, Stefano Stabellini wrote:
> > On Fri, 6 Sep 2024, Jan Beulich wrote:
> >> On 06.09.2024 00:51, Stefano Stabellini wrote:
> >>> On Thu, 5 Sep 2024, Jan Beulich wrote:
> >>>> On 05.09.2024 08:45, Chen, Jiqian wrote:
> >>>>> HI,
> >>>>>
> >>>>> On 2024/9/4 14:04, Jan Beulich wrote:
> >>>>>> On 04.09.2024 03:43, Stefano Stabellini wrote:
> >>>>>>> On Tue, 3 Sep 2024, Jan Beulich wrote:
> >>>>>>>> On 03.09.2024 12:53, Chen, Jiqian wrote:
> >>>>>>>>> On 2024/9/3 17:25, Jan Beulich wrote:
> >>>>>>>>>> On 03.09.2024 09:58, Chen, Jiqian wrote:
> >>>>>>>>>>> On 2024/9/3 15:42, Jan Beulich wrote:
> >>>>>>>>>>>> On 03.09.2024 09:04, Jiqian Chen wrote:
> >>>>>>>>>>>>> When dom0 is PVH type and passthrough a device to HVM domU, Qemu code
> >>>>>>>>>>>>> xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
> >>>>>>>>>>>>> xc_physdev_map_pirq map a pirq for passthrough devices.
> >>>>>>>>>>>>> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
> >>>>>>>>>>>>> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
> >>>>>>>>>>>>> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
> >>>>>>>>>>>>> codes.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> But it is fine to map interrupts through pirq to a HVM domain whose
> >>>>>>>>>>>>> XENFEAT_hvm_pirqs is not enabled. Because pirq field is used as a way to
> >>>>>>>>>>>>> reference interrupts and it is just the way for the device model to
> >>>>>>>>>>>>> identify which interrupt should be mapped to which domain, however
> >>>>>>>>>>>>> has_pirq() is just to check if HVM domains route interrupts from
> >>>>>>>>>>>>> devices(emulated or passthrough) through event channel, so, the has_pirq()
> >>>>>>>>>>>>> check should not be applied to the PHYSDEVOP_map_pirq issued by dom0.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> >>>>>>>>>>>>> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq. Then the
> >>>>>>>>>>>>> interrupt of a passthrough device can be successfully mapped to pirq for domU.
> >>>>>>>>>>>>
> >>>>>>>>>>>> As before: When you talk about just Dom0, ...
> >>>>>>>>>>>>
> >>>>>>>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
> >>>>>>>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
> >>>>>>>>>>>>> @@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>>>>>>>>>>      {
> >>>>>>>>>>>>>      case PHYSDEVOP_map_pirq:
> >>>>>>>>>>>>>      case PHYSDEVOP_unmap_pirq:
> >>>>>>>>>>>>> +        break;
> >>>>>>>>>>>>> +
> >>>>>>>>>>>>>      case PHYSDEVOP_eoi:
> >>>>>>>>>>>>>      case PHYSDEVOP_irq_status_query:
> >>>>>>>>>>>>>      case PHYSDEVOP_get_free_pirq:
> >>>>>>>>>>>>
> >>>>>>>>>>>> ... that ought to match the code. IOW you've again lost why it is okay(ish)
> >>>>>>>>>>>> (or even necessary) to also permit the op for non-Dom0 (e.g. a PVH stubdom).
> >>>>>>>>>>>> Similarly imo Dom0 using this on itself wants discussing.
> >>>>>>>>>>> Do you mean I need to talk about why permit this op for all HVM
> >>>>>>>>>>
> >>>>>>>>>> You don't need to invent reasons, but it needs making clear that wider than
> >>>>>>>>>> necessary (for your purpose) exposure is at least not going to be a problem.
> >>>>>>>>>>
> >>>>>>>>>>> and  where can prevent PVH domain calling this for self-mapping, not only dom0?
> >>>>>>>>>>
> >>>>>>>>>> Aiui use on itself is limited to Dom0, so only that would need clarifying
> >>>>>>>>>> (along the lines of the above, i.e. that/why it is not a problem). For
> >>>>>>>>>> has_pirq() domains use on oneself was already permitted before.
> >>>>>>>>>
> >>>>>>>>> Changed commit message to below. Please check and that will be great helpful if you would show me how to modify it.
> >>>>>>>>> {
> >>>>>>>>> x86/pvh: Allow (un)map_pirq when dom0 is PVH
> >>>>>>>>>
> >>>>>>>>> Problem: when dom0 is PVH type and passthrough a device to HVM domU, Qemu
> >>>>>>>>> code xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
> >>>>>>>>> xc_physdev_map_pirq map a pirq for passthrough devices.
> >>>>>>>>> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
> >>>>>>>>> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
> >>>>>>>>> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
> >>>>>>>>> codes.
> >>>>>>>>>
> >>>>>>>>> To solve above problem, need to remove the chack has_pirq() for that
> >>>>>>>>> situation(PHYSDEVOP_map_pirq is issued by dom0 for domUs). But without
> >>>>>>>>> adding other restrictions, PHYSDEVOP_map_pirq will be allowed wider than
> >>>>>>>>> what the problem need.
> >>>>>>>>> So, clarify below:
> >>>>>>>>>
> >>>>>>>>> For HVM domUs whose XENFEAT_hvm_pirqs is not enabled,it is fine to map
> >>>>>>>>> interrupts through pirq for them. Because pirq field is used as a way to
> >>>>>>>>> reference interrupts and it is just the way for the device model to
> >>>>>>>>> identify which interrupt should be mapped to which domain, however
> >>>>>>>>> has_pirq() is just to check if HVM domains route interrupts from
> >>>>>>>>> devices(emulated or passthrough) through event channel, so, remove
> >>>>>>>>> has_pirq() check has no impact on HVM domUs.
> >>>>>>>>>
> >>>>>>>>> For PVH domUs that performs such an operation will fail at the check
> >>>>>>>>> xsm_map_dedomain_pirq() in physdev_map-nirq().
> >>>>>>>>>
> >>>>>>>>> For PVH dom0, it uses vpci and doesn't use event channel, as above talks,
> >>>>>>>>> it also has no impact.
> >>>>>>>>> }
> >>>>>>>>
> >>>>>>>> This is better than what you had before, and I don't really fancy re-
> >>>>>>>> writing the description effectively from scratch. So let's just go from
> >>>>>>>> there. As to the "excess" permission for the sub-ops: The main thing I'm
> >>>>>>>> after is that it be clarified that we're not going to introduce any
> >>>>>>>> security issues here. That requires auditing the code, and merely saying
> >>>>>>>> "also has no impact" is a little too little for my taste. For Dom0 an
> >>>>>>>> argument may be that it is overly powerful already anyway, even if for
> >>>>>>>> PVH we're a little more strict than for PV (I think).
> >>>>>>>
> >>>>>>> Hi Jan, for clarity and to make this actionable, are you suggesting to
> >>>>>>> clarify the commit message by adding wording around "Dom0 is overly
> >>>>>>> powerful already anyway so it is OK so this is OK" ?
> >>>>>>
> >>>>>> Yes, perhaps with "deemed" added. 
> >>>>> OK, for PVH dom0, I will change to " Dom0 is deemed overly powerful already anyway, so it is OK "
> >>>>
> >>>> I don't mind the deemed as you add it, but the important place to add it
> >>>> here is before "OK". I'm sorry, it didn't occur to me that after all the
> >>>> prior discussion this earlier reply of mine could still be mis-interpreted.
> >>>>
> >>>>>> And text for DomU-s similarly extended, as the pointing at the XSM check is presently incomplete (stubdom-s can
> >>>>>> pass that check, after all, as can de-priv qemu running in Dom0).
> >>>>> So sorry, I know so little about this, I can't explain these situations, could you tell me how to describe or help me write a paragraph?
> >>>>
> >>>> I'm afraid that in order to make (propose) such a change you need to be
> >>>> able to explain why it is okay to expose functionality beyond where it's
> >>>> presently exposed. It's not just writing a new paragraph that's needed
> >>>> here. You first need to _check_ that what you do is okay. And once you've
> >>>> done that checking, you then summarize that in writing.
> >>>  
> >>>
> >>> PHYSDEVOP_map_pirq ends up calling physdev_map_pirq which is protected
> >>> by:
> >>>
> >>>     ret = xsm_map_domain_pirq(XSM_DM_PRIV, d);
> >>>     if ( ret )
> >>>         return ret;
> >>>
> >>> Dom0 having permission to do PHYSDEVOP_map_pirq even without has_pirq is
> >>> fine. Device models are also OK because the code we are trying to enable
> >>> is in fact part of the device model. If someone were to run an HVM
> >>> stubdom they might need this patch as well.
> >>>
> >>> If PHYSDEVOP_map_pirq is allowed, also PHYSDEVOP_unmap_pirq should be
> >>> allowed.
> >>>
> >>> Is this explanation OK?
> >>
> >> This still solely focuses on why the functionality is wanted. There
> >> continues to be nothing about the wider exposure actually being safe.
> > 
> > I don't think I understand what you would like to be checked or
> > clarified...
> > 
> > The only wider exposure is to device models, and device models can do a
> > lot worse than mapping pirqs already. There is no wider exposure to
> > DomUs. Also PV device models can already do this.
> 
> What do you mean by "worse"? I hope not "crash Xen"? And _that's_ what I
> want to have assurance of, e.g. a PVH/HVM DM not suddenly bringing Xen
> down, because these paths previously weren't accessible to them.

What about a commit message along the lines of:

x86/hvm: allow {,un}map_pirq hypercalls unconditionally

The current hypercall interfaces to manage and assign interrupts to
domains is mostly based in using pIRQs as handlers.  Such pIRQ values
are abstract domain-specific references to interrupts.

Classic HVM domains can have access to {,un}map_pirq hypercalls if the
domain is allowed to route physical interrupts over event channels.
That's however a different interface, limited to only mapping
interrupts to itself. PVH domains on the other hand never had access
to the interface, as PVH domains are not allowed to route interrupts
over event channels.

In order to allow setting up PCI passthrough from a PVH domain it
needs access to the {,un}map_pirq hypercalls so interrupts can be
assigned a pIRQ handler that can then be used by further hypercalls to
bind the interrupt to a domain.

Note that the {,un}map_pirq hypercalls end up calling helpers that are
already used against a PVH domain in order to setup interrupts for the
hardware domain when running in PVH mode.  physdev_map_pirq() will
call allocate_and_map_{gsi,msi}_pirq() which is already used by the
vIO-APIC or the vPCI code respectively.  So the exposed code paths are
not new when targeting a PVH domain, but rather previous callers are
not hypercall but emulation based.

Regards, Roger.

