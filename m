Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80546813D82
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 23:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654803.1022190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDuWH-0006UT-UR; Thu, 14 Dec 2023 22:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654803.1022190; Thu, 14 Dec 2023 22:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDuWH-0006S4-Rr; Thu, 14 Dec 2023 22:49:29 +0000
Received: by outflank-mailman (input) for mailman id 654803;
 Thu, 14 Dec 2023 22:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDuWG-0006Ry-H0
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 22:49:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 070117a1-9ad3-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 23:49:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ED3D8CE2462;
 Thu, 14 Dec 2023 22:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C970C433C7;
 Thu, 14 Dec 2023 22:49:20 +0000 (UTC)
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
X-Inumbo-ID: 070117a1-9ad3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702594162;
	bh=YxAoDz1562Qm5JXSHG+37rbo8or/kA4W8NhMy564ma8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Vdqfq4nnWtOEcINi1OABxK8g/yP4J2ctA/2JONMQqZrint4anCTu+YOROici5Xzto
	 1CFK1FL4QyysewKF8drTF6GKuzfhVAVwJQs3qDy6Ge5/3vVJptUDYK2/Vaj4BGyVew
	 UbnOWiec//ZBizalrWeqogQhhdDmI31C3/Gf5++drOnzlEX3LGQleiFtJNj6EBhcx+
	 4TEt7TXlbsEE7kqUoCAJyBR5RBGBuuuhWF2ktG2JuKtCBrXc0y/PwEnPIBu52HMYWq
	 yE4fbCwyPfZkPB6MaB7eg9PVwe1V8vwB161YT8lWqGXbSoK0Nq5jUw7jbSAW9tSpAL
	 wmFHgg4vXhGCg==
Date: Thu, 14 Dec 2023 14:49:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    "Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
In-Reply-To: <ZXrTwfzedFQLhxiQ@macbook>
Message-ID: <alpine.DEB.2.22.394.2312141441020.3175268@ubuntu-linux-20-04-desktop>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com> <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook> <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com> <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com> <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com> <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com> <ZXrRG8oc25Do0Dnv@macbook>
 <390368e2-5f13-4bbf-8c07-4a05c04e9939@suse.com> <ZXrTwfzedFQLhxiQ@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1075268383-1702593786=:3175268"
Content-ID: <alpine.DEB.2.22.394.2312141443090.3175268@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1075268383-1702593786=:3175268
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312141443091.3175268@ubuntu-linux-20-04-desktop>

On Thu, 14 Dec 2023, Roger Pau Monné wrote:
> On Thu, Dec 14, 2023 at 10:58:24AM +0100, Jan Beulich wrote:
> > On 14.12.2023 10:55, Roger Pau Monné wrote:
> > > On Thu, Dec 14, 2023 at 08:55:45AM +0000, Chen, Jiqian wrote:
> > >> On 2023/12/13 15:03, Jan Beulich wrote:
> > >>> On 13.12.2023 03:47, Chen, Jiqian wrote:
> > >>>> On 2023/12/12 17:30, Jan Beulich wrote:
> > >>>>> On 12.12.2023 07:49, Chen, Jiqian wrote:
> > >>>>>> On 2023/12/11 23:31, Roger Pau Monné wrote:
> > >>>>>>> On Mon, Dec 11, 2023 at 12:40:08AM +0800, Jiqian Chen wrote:
> > >>>>>>>> --- a/xen/arch/x86/hvm/hypercall.c
> > >>>>>>>> +++ b/xen/arch/x86/hvm/hypercall.c
> > >>>>>>>> @@ -72,8 +72,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> > >>>>>>>>  
> > >>>>>>>>      switch ( cmd )
> > >>>>>>>>      {
> > >>>>>>>> +    case PHYSDEVOP_setup_gsi:
> > >>>>>>>
> > >>>>>>> I think given the new approach on the Linux side patches, where
> > >>>>>>> pciback will configure the interrupt, there's no need to expose
> > >>>>>>> setup_gsi anymore?
> > >>>>>> The latest patch(the second patch of v3 on kernel side) does setup_gsi and map_pirq for passthrough device in pciback, so we need this and below.
> > >>>>>>
> > >>>>>>>
> > >>>>>>>>      case PHYSDEVOP_map_pirq:
> > >>>>>>>>      case PHYSDEVOP_unmap_pirq:
> > >>>>>>>> +        if ( is_hardware_domain(currd) )
> > >>>>>>>> +            break;
> > >>>>>>>
> > >>>>>>> Also Jan already pointed this out in v2: this hypercall needs to be
> > >>>>>>> limited so a PVH dom0 cannot execute it against itself.  IOW: refuse
> > >>>>>>> the hypercall if DOMID_SELF or the passed domid matches the current
> > >>>>>>> domain domid.
> > >>>>>> Yes, I remember Jan's suggestion, but since the latest patch(the second patch of v3 on kernel side) has change the implementation, it does setup_gsi and map_pirq for dom0 itself, so I didn't add the DOMID_SELF check.
> > >>>>>
> > >>>>> And why exactly would it do specifically the map_pirq? (Even the setup_gsi
> > >>>>> looks questionable to me, but there might be reasons there.)
> > >>>> Map_pirq is to solve the check failure problem. (pci_add_dm_done-> xc_domain_irq_permission-> XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0)
> > >>>> Setup_gsi is because the gsi is never be unmasked, so the gsi is never be registered( vioapic_hwdom_map_gsi-> mp_register_gsi is never be called).
> > >>>
> > >>> And it was previously made pretty clear by Roger, I think, that doing a "map"
> > >>> just for the purpose of granting permission is, well, at best a temporary
> > >>> workaround in the early development phase. If there's presently no hypercall
> > >>> to _only_ grant permission to IRQ, we need to add one.
> > >> Could you please describe it in detail? Do you mean to add a new hypercall to grant irq access for dom0 or domU?
> > >> It seems XEN_DOMCTL_irq_permission is the hypercall to grant irq access from dom0 to domU(see XEN_DOMCTL_irq_permission-> irq_permit_access). There is no need to add hypercall to grant irq access.
> > >> We failed here (XEN_DOMCTL_irq_permission-> pirq_access_permitted->domain_pirq_to_irq->return irq is 0) is because the PVH dom0 didn't use PIRQ, so we can't get irq from pirq if "current" is PVH dom0.
> > > 
> > > One way to bodge this would be to detect whether the caller of
> > > XEN_DOMCTL_irq_permission is a PV or an HVM domain, and in case of HVM
> > > assume the pirq field is a GSI.  I'm unsure however how that will work
> > > with non-x86 architectures.

PIRQ is an x86-only concept. We have event channels but no PIRQs on ARM.
I expect RISC-V will be the same.


> > > It would  be better to introduce a new XEN_DOMCTL_gsi_permission, or

"GSI" is another x86-only concept.

So actually the best name was indeed XEN_DOMCTL_irq_permission, given
that it is using the more arch-neutral "irq" terminology.

Perhaps it was always a mistake to pass PIRQs to
XEN_DOMCTL_irq_permission and we should always have passed the real
interrupt number (GSI on x86, SPI on ARM).

So your "bodge" is actually kind of OK in my opinion. Basically everyone
else (x86 HVM/PVH, ARM, RISC-V, probably PPC too) will use
XEN_DOMCTL_irq_permission with hardware interrupt numbers (GSIs, SPIs,
etc.), the only special case is x86 PV. It is x86 PV the odd one.

Given that DOMCTL is an unstable interface anyway, I feel OK making
changes to it, even better if backward compatible.

--8323329-1075268383-1702593786=:3175268--

