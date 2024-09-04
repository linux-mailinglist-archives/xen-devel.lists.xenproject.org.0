Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82D96AE05
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 03:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789690.1199304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slf3O-0005qB-VL; Wed, 04 Sep 2024 01:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789690.1199304; Wed, 04 Sep 2024 01:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slf3O-0005ns-SN; Wed, 04 Sep 2024 01:43:26 +0000
Received: by outflank-mailman (input) for mailman id 789690;
 Wed, 04 Sep 2024 01:43:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9Y9=QC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1slf3N-0005nm-6A
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 01:43:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1147221e-6a5f-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 03:43:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 782575C568D;
 Wed,  4 Sep 2024 01:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97782C4CEC4;
 Wed,  4 Sep 2024 01:43:18 +0000 (UTC)
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
X-Inumbo-ID: 1147221e-6a5f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725414200;
	bh=huF/NFxJyk07g/dY02fBFmD+tCaxgIvi87Bis6XI64o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HDoE80MIuJacwmAQbPAGQJNls9EWYLAyV3OchBSnnpPnNN8VcsKP9J9+szIIDlZ3L
	 1v4wk8TjrwMl20KzFdHaLYKqyOCuutNEp2vfdDTWnkew+QgQDDZwm8vXDZj5bzzscn
	 yjoQfewzOhjry77jYDe7V7Nf1rd7/0DzvV1vPN8DW/sFmzhLJwksNCFGlcUeLVfvnj
	 MHkAN+jN8nTRCovidNiWMnvrxrsNECeQqWMLTF706yih7LVai/E9JW+AvIPneXUrA4
	 6HfjC2u9j9KuRl06+ulxDi/NPl64AvrdTdwwe55KEZrEVvT8r6edSsEDZ+4aJWCZbB
	 QX16/OaWHCpoQ==
Date: Tue, 3 Sep 2024 18:43:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Huang, Ray" <Ray.Huang@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is
 PVH
In-Reply-To: <b2b7b716-974c-4172-ba68-261453a96932@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409031839550.53815@ubuntu-linux-20-04-desktop>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com> <20240903070424.982218-3-Jiqian.Chen@amd.com> <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com> <BL1PR12MB5849C65CAC35890158F6A32FE7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <905fe9ef-d311-4956-b862-49f2f588afcd@suse.com> <BL1PR12MB58492EE11D404B2E09DA0210E7932@BL1PR12MB5849.namprd12.prod.outlook.com> <b2b7b716-974c-4172-ba68-261453a96932@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Sep 2024, Jan Beulich wrote:
> On 03.09.2024 12:53, Chen, Jiqian wrote:
> > On 2024/9/3 17:25, Jan Beulich wrote:
> >> On 03.09.2024 09:58, Chen, Jiqian wrote:
> >>> On 2024/9/3 15:42, Jan Beulich wrote:
> >>>> On 03.09.2024 09:04, Jiqian Chen wrote:
> >>>>> When dom0 is PVH type and passthrough a device to HVM domU, Qemu code
> >>>>> xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
> >>>>> xc_physdev_map_pirq map a pirq for passthrough devices.
> >>>>> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
> >>>>> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
> >>>>> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
> >>>>> codes.
> >>>>>
> >>>>> But it is fine to map interrupts through pirq to a HVM domain whose
> >>>>> XENFEAT_hvm_pirqs is not enabled. Because pirq field is used as a way to
> >>>>> reference interrupts and it is just the way for the device model to
> >>>>> identify which interrupt should be mapped to which domain, however
> >>>>> has_pirq() is just to check if HVM domains route interrupts from
> >>>>> devices(emulated or passthrough) through event channel, so, the has_pirq()
> >>>>> check should not be applied to the PHYSDEVOP_map_pirq issued by dom0.
> >>>>>
> >>>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> >>>>> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq. Then the
> >>>>> interrupt of a passthrough device can be successfully mapped to pirq for domU.
> >>>>
> >>>> As before: When you talk about just Dom0, ...
> >>>>
> >>>>> --- a/xen/arch/x86/hvm/hypercall.c
> >>>>> +++ b/xen/arch/x86/hvm/hypercall.c
> >>>>> @@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>>      {
> >>>>>      case PHYSDEVOP_map_pirq:
> >>>>>      case PHYSDEVOP_unmap_pirq:
> >>>>> +        break;
> >>>>> +
> >>>>>      case PHYSDEVOP_eoi:
> >>>>>      case PHYSDEVOP_irq_status_query:
> >>>>>      case PHYSDEVOP_get_free_pirq:
> >>>>
> >>>> ... that ought to match the code. IOW you've again lost why it is okay(ish)
> >>>> (or even necessary) to also permit the op for non-Dom0 (e.g. a PVH stubdom).
> >>>> Similarly imo Dom0 using this on itself wants discussing.
> >>> Do you mean I need to talk about why permit this op for all HVM
> >>
> >> You don't need to invent reasons, but it needs making clear that wider than
> >> necessary (for your purpose) exposure is at least not going to be a problem.
> >>
> >>> and  where can prevent PVH domain calling this for self-mapping, not only dom0?
> >>
> >> Aiui use on itself is limited to Dom0, so only that would need clarifying
> >> (along the lines of the above, i.e. that/why it is not a problem). For
> >> has_pirq() domains use on oneself was already permitted before.
> > 
> > Changed commit message to below. Please check and that will be great helpful if you would show me how to modify it.
> > {
> > x86/pvh: Allow (un)map_pirq when dom0 is PVH
> > 
> > Problem: when dom0 is PVH type and passthrough a device to HVM domU, Qemu
> > code xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
> > xc_physdev_map_pirq map a pirq for passthrough devices.
> > In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
> > has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
> > so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
> > codes.
> > 
> > To solve above problem, need to remove the chack has_pirq() for that
> > situation(PHYSDEVOP_map_pirq is issued by dom0 for domUs). But without
> > adding other restrictions, PHYSDEVOP_map_pirq will be allowed wider than
> > what the problem need.
> > So, clarify below:
> > 
> > For HVM domUs whose XENFEAT_hvm_pirqs is not enabled,it is fine to map
> > interrupts through pirq for them. Because pirq field is used as a way to
> > reference interrupts and it is just the way for the device model to
> > identify which interrupt should be mapped to which domain, however
> > has_pirq() is just to check if HVM domains route interrupts from
> > devices(emulated or passthrough) through event channel, so, remove
> > has_pirq() check has no impact on HVM domUs.
> > 
> > For PVH domUs that performs such an operation will fail at the check
> > xsm_map_dedomain_pirq() in physdev_map-nirq().
> > 
> > For PVH dom0, it uses vpci and doesn't use event channel, as above talks,
> > it also has no impact.
> > }
> 
> This is better than what you had before, and I don't really fancy re-
> writing the description effectively from scratch. So let's just go from
> there. As to the "excess" permission for the sub-ops: The main thing I'm
> after is that it be clarified that we're not going to introduce any
> security issues here. That requires auditing the code, and merely saying
> "also has no impact" is a little too little for my taste. For Dom0 an
> argument may be that it is overly powerful already anyway, even if for
> PVH we're a little more strict than for PV (I think).

Hi Jan, for clarity and to make this actionable, are you suggesting to
clarify the commit message by adding wording around "Dom0 is overly
powerful already anyway so it is OK so this is OK" ?

There are typically no restrictions in terms of functionalities offered
to Dom0 as Dom0 can destroy other VMs and reboot the platform.

