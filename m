Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374CF96E5E5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 00:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791445.1201311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smLKP-0004tE-Jx; Thu, 05 Sep 2024 22:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791445.1201311; Thu, 05 Sep 2024 22:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smLKP-0004q4-HB; Thu, 05 Sep 2024 22:51:49 +0000
Received: by outflank-mailman (input) for mailman id 791445;
 Thu, 05 Sep 2024 22:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMVQ=QD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1smLKO-0004pw-3i
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 22:51:48 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d2dc1ca-6bd9-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 00:51:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B3959A436AC;
 Thu,  5 Sep 2024 22:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D7EC4CEC3;
 Thu,  5 Sep 2024 22:51:42 +0000 (UTC)
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
X-Inumbo-ID: 6d2dc1ca-6bd9-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725576704;
	bh=qqOhDAb9+rm7BM5Qt7gj4mH6mmA3ePBI0CRCAaBwU+U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DLYsIQVAfRNDW6PuLOF1NdQ8bvzBMqAfJ5ags6KRptItX6h5DSWUGpq/kmsFYJNIl
	 FZQr/cA9nSJAWMzqTrPRFV2CdyQ1ppBUtAvirFiTOzThFq3sB9DjUejEl5LqlOrFSv
	 zI62hEHVpyvO1VI8pl3HRhF9nKhdpasYr8REUyLLweb/eSOYlURmVQe9Ca2noytKgQ
	 bseKX5nsxSMxW2hCcNR3ewNgo8859OI6vGv0TUIygM0A3pIGujvVq4KDdlhVbR7o9G
	 Oo2yivOr1tOCIOnQISQxq1Xk1ohBiJOkQPXUTPfRnRqTVr1D8hmZ306W4Jwe8xrrgw
	 0xUYldWtFW6pw==
Date: Thu, 5 Sep 2024 15:51:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, 
    Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Huang, Ray" <Ray.Huang@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v14 2/5] x86/pvh: Allow (un)map_pirq when dom0 is
 PVH
In-Reply-To: <f6a1f021-04cc-4dd3-bcea-97a7343399e1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409051521340.53815@ubuntu-linux-20-04-desktop>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com> <20240903070424.982218-3-Jiqian.Chen@amd.com> <e8db9a54-fcbf-4f4c-803e-7b11838e22a4@suse.com> <BL1PR12MB5849C65CAC35890158F6A32FE7932@BL1PR12MB5849.namprd12.prod.outlook.com>
 <905fe9ef-d311-4956-b862-49f2f588afcd@suse.com> <BL1PR12MB58492EE11D404B2E09DA0210E7932@BL1PR12MB5849.namprd12.prod.outlook.com> <b2b7b716-974c-4172-ba68-261453a96932@suse.com> <alpine.DEB.2.22.394.2409031839550.53815@ubuntu-linux-20-04-desktop>
 <ea41eb5d-f8a1-4120-b5c1-70bdf02d8038@suse.com> <BL1PR12MB5849E69A83D4BABAF544C22EE79D2@BL1PR12MB5849.namprd12.prod.outlook.com> <f6a1f021-04cc-4dd3-bcea-97a7343399e1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Sep 2024, Jan Beulich wrote:
> On 05.09.2024 08:45, Chen, Jiqian wrote:
> > HI,
> > 
> > On 2024/9/4 14:04, Jan Beulich wrote:
> >> On 04.09.2024 03:43, Stefano Stabellini wrote:
> >>> On Tue, 3 Sep 2024, Jan Beulich wrote:
> >>>> On 03.09.2024 12:53, Chen, Jiqian wrote:
> >>>>> On 2024/9/3 17:25, Jan Beulich wrote:
> >>>>>> On 03.09.2024 09:58, Chen, Jiqian wrote:
> >>>>>>> On 2024/9/3 15:42, Jan Beulich wrote:
> >>>>>>>> On 03.09.2024 09:04, Jiqian Chen wrote:
> >>>>>>>>> When dom0 is PVH type and passthrough a device to HVM domU, Qemu code
> >>>>>>>>> xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
> >>>>>>>>> xc_physdev_map_pirq map a pirq for passthrough devices.
> >>>>>>>>> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
> >>>>>>>>> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
> >>>>>>>>> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
> >>>>>>>>> codes.
> >>>>>>>>>
> >>>>>>>>> But it is fine to map interrupts through pirq to a HVM domain whose
> >>>>>>>>> XENFEAT_hvm_pirqs is not enabled. Because pirq field is used as a way to
> >>>>>>>>> reference interrupts and it is just the way for the device model to
> >>>>>>>>> identify which interrupt should be mapped to which domain, however
> >>>>>>>>> has_pirq() is just to check if HVM domains route interrupts from
> >>>>>>>>> devices(emulated or passthrough) through event channel, so, the has_pirq()
> >>>>>>>>> check should not be applied to the PHYSDEVOP_map_pirq issued by dom0.
> >>>>>>>>>
> >>>>>>>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> >>>>>>>>> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq. Then the
> >>>>>>>>> interrupt of a passthrough device can be successfully mapped to pirq for domU.
> >>>>>>>>
> >>>>>>>> As before: When you talk about just Dom0, ...
> >>>>>>>>
> >>>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
> >>>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
> >>>>>>>>> @@ -73,6 +73,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>>>>>>      {
> >>>>>>>>>      case PHYSDEVOP_map_pirq:
> >>>>>>>>>      case PHYSDEVOP_unmap_pirq:
> >>>>>>>>> +        break;
> >>>>>>>>> +
> >>>>>>>>>      case PHYSDEVOP_eoi:
> >>>>>>>>>      case PHYSDEVOP_irq_status_query:
> >>>>>>>>>      case PHYSDEVOP_get_free_pirq:
> >>>>>>>>
> >>>>>>>> ... that ought to match the code. IOW you've again lost why it is okay(ish)
> >>>>>>>> (or even necessary) to also permit the op for non-Dom0 (e.g. a PVH stubdom).
> >>>>>>>> Similarly imo Dom0 using this on itself wants discussing.
> >>>>>>> Do you mean I need to talk about why permit this op for all HVM
> >>>>>>
> >>>>>> You don't need to invent reasons, but it needs making clear that wider than
> >>>>>> necessary (for your purpose) exposure is at least not going to be a problem.
> >>>>>>
> >>>>>>> and  where can prevent PVH domain calling this for self-mapping, not only dom0?
> >>>>>>
> >>>>>> Aiui use on itself is limited to Dom0, so only that would need clarifying
> >>>>>> (along the lines of the above, i.e. that/why it is not a problem). For
> >>>>>> has_pirq() domains use on oneself was already permitted before.
> >>>>>
> >>>>> Changed commit message to below. Please check and that will be great helpful if you would show me how to modify it.
> >>>>> {
> >>>>> x86/pvh: Allow (un)map_pirq when dom0 is PVH
> >>>>>
> >>>>> Problem: when dom0 is PVH type and passthrough a device to HVM domU, Qemu
> >>>>> code xen_pt_realize->xc_physdev_map_pirq and libxl code pci_add_dm_done->
> >>>>> xc_physdev_map_pirq map a pirq for passthrough devices.
> >>>>> In xc_physdev_map_pirq call stack, function hvm_physdev_op has a check
> >>>>> has_pirq(currd), but currd is PVH dom0, PVH has no X86_EMU_USE_PIRQ flag,
> >>>>> so it fails, PHYSDEVOP_map_pirq is not allowed for PVH dom0 in current
> >>>>> codes.
> >>>>>
> >>>>> To solve above problem, need to remove the chack has_pirq() for that
> >>>>> situation(PHYSDEVOP_map_pirq is issued by dom0 for domUs). But without
> >>>>> adding other restrictions, PHYSDEVOP_map_pirq will be allowed wider than
> >>>>> what the problem need.
> >>>>> So, clarify below:
> >>>>>
> >>>>> For HVM domUs whose XENFEAT_hvm_pirqs is not enabled,it is fine to map
> >>>>> interrupts through pirq for them. Because pirq field is used as a way to
> >>>>> reference interrupts and it is just the way for the device model to
> >>>>> identify which interrupt should be mapped to which domain, however
> >>>>> has_pirq() is just to check if HVM domains route interrupts from
> >>>>> devices(emulated or passthrough) through event channel, so, remove
> >>>>> has_pirq() check has no impact on HVM domUs.
> >>>>>
> >>>>> For PVH domUs that performs such an operation will fail at the check
> >>>>> xsm_map_dedomain_pirq() in physdev_map-nirq().
> >>>>>
> >>>>> For PVH dom0, it uses vpci and doesn't use event channel, as above talks,
> >>>>> it also has no impact.
> >>>>> }
> >>>>
> >>>> This is better than what you had before, and I don't really fancy re-
> >>>> writing the description effectively from scratch. So let's just go from
> >>>> there. As to the "excess" permission for the sub-ops: The main thing I'm
> >>>> after is that it be clarified that we're not going to introduce any
> >>>> security issues here. That requires auditing the code, and merely saying
> >>>> "also has no impact" is a little too little for my taste. For Dom0 an
> >>>> argument may be that it is overly powerful already anyway, even if for
> >>>> PVH we're a little more strict than for PV (I think).
> >>>
> >>> Hi Jan, for clarity and to make this actionable, are you suggesting to
> >>> clarify the commit message by adding wording around "Dom0 is overly
> >>> powerful already anyway so it is OK so this is OK" ?
> >>
> >> Yes, perhaps with "deemed" added. 
> > OK, for PVH dom0, I will change to " Dom0 is deemed overly powerful already anyway, so it is OK "
> 
> I don't mind the deemed as you add it, but the important place to add it
> here is before "OK". I'm sorry, it didn't occur to me that after all the
> prior discussion this earlier reply of mine could still be mis-interpreted.
> 
> >> And text for DomU-s similarly extended, as the pointing at the XSM check is presently incomplete (stubdom-s can
> >> pass that check, after all, as can de-priv qemu running in Dom0).
> > So sorry, I know so little about this, I can't explain these situations, could you tell me how to describe or help me write a paragraph?
> 
> I'm afraid that in order to make (propose) such a change you need to be
> able to explain why it is okay to expose functionality beyond where it's
> presently exposed. It's not just writing a new paragraph that's needed
> here. You first need to _check_ that what you do is okay. And once you've
> done that checking, you then summarize that in writing.
 

PHYSDEVOP_map_pirq ends up calling physdev_map_pirq which is protected
by:

    ret = xsm_map_domain_pirq(XSM_DM_PRIV, d);
    if ( ret )
        return ret;

Dom0 having permission to do PHYSDEVOP_map_pirq even without has_pirq is
fine. Device models are also OK because the code we are trying to enable
is in fact part of the device model. If someone were to run an HVM
stubdom they might need this patch as well.

If PHYSDEVOP_map_pirq is allowed, also PHYSDEVOP_unmap_pirq should be
allowed.

Is this explanation OK?

