Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BEBAA18D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 19:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133057.1471238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3HIf-0004hZ-G5; Mon, 29 Sep 2025 17:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133057.1471238; Mon, 29 Sep 2025 17:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3HIf-0004fE-DT; Mon, 29 Sep 2025 17:04:33 +0000
Received: by outflank-mailman (input) for mailman id 1133057;
 Mon, 29 Sep 2025 17:04:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONJG=4I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1v3HId-0004f8-TS
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 17:04:31 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bfffeb1-9d56-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 19:04:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A874144F6E;
 Mon, 29 Sep 2025 17:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FAEC4CEF4;
 Mon, 29 Sep 2025 17:04:26 +0000 (UTC)
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
X-Inumbo-ID: 5bfffeb1-9d56-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759165467;
	bh=PTfUS9dphzeB1S5ixZ54Q1nWox4nNQPxHuDNoIHXjzU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TDo8OHGIUOOzF56rcmzqyVjjoOkzWUIPnSDZd4S9rZHDj+3k7ng94+nUFeWKbiEDQ
	 Z739UszNw1+dfbgzEVwp7xrfO5li1VBAepk2k9IicyPCXH4bKcjimFTcKjvWnwPeWm
	 j4riqOUxcRoNEEleEvaAzVZ+YwRTv2UmuB3Adoghrdh6lADLvVt2D3P9LKytcRRE2j
	 p3vEkw3RZ6GdtsPgZcnFEnMUCfJWtg7BdVmR12i8EytKyonHfYuiWwi3VNQJoUMHNg
	 qihKvvxyz0PgqrHIMj6hk8KxSpNO2z0R/XnFF8847IPSV2Y6m6RfePcsjNiosFigZf
	 ZwQ3MsEfJG0XQ==
Date: Mon, 29 Sep 2025 10:04:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, "Penny, Zheng" <penny.zheng@amd.com>, 
    "Huang, Ray" <Ray.Huang@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "Stabellini, Stefano" <stefano.stabellini@amd.com>, 
    "Andryuk, Jason" <Jason.Andryuk@amd.com>
Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
In-Reply-To: <alpine.DEB.2.22.394.2509290959070.937823@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2509291003350.937823@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-19-Penny.Zheng@amd.com> <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com> <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <66b43c3b-c74f-4c18-b91a-bd7b56a62eff@suse.com> <DM4PR12MB84518B65027B6A355ED4D246E11EA@DM4PR12MB8451.namprd12.prod.outlook.com> <af57c032-541d-4956-85de-269066c50cd3@suse.com> <IA1PR12MB8467188458BA8FAF348AC538E11EA@IA1PR12MB8467.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2509261224150.2244509@ubuntu-linux-20-04-desktop> <0e72c63c-9a6b-4fd7-848d-8c8d09fc91ef@suse.com> <alpine.DEB.2.22.394.2509290959070.937823@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Sep 2025, Stefano Stabellini wrote:
> On Sun, 28 Sep 2025, Jan Beulich wrote:
> > On 26.09.2025 21:24, Stefano Stabellini wrote:
> > > On Thu, 25 Sep 2025, Penny, Zheng wrote:
> > >>> -----Original Message-----
> > >>> From: Jan Beulich <jbeulich@suse.com>
> > >>> Sent: Friday, September 26, 2025 2:53 PM
> > >>> To: Penny, Zheng <penny.zheng@amd.com>
> > >>> Cc: Huang, Ray <Ray.Huang@amd.com>; Daniel P. Smith
> > >>> <dpsmith@apertussolutions.com>; xen-devel@lists.xenproject.org; Stabellini,
> > >>> Stefano <stefano.stabellini@amd.com>; Andryuk, Jason
> > >>> <Jason.Andryuk@amd.com>
> > >>> Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
> > >>> CONFIG_MGMT_HYPERCALLS
> > >>>
> > >>> On 26.09.2025 06:41, Penny, Zheng wrote:
> > >>>>> -----Original Message-----
> > >>>>> From: Jan Beulich <jbeulich@suse.com>
> > >>>>> Sent: Thursday, September 25, 2025 10:29 PM
> > >>>>>
> > >>>>> On 25.09.2025 11:41, Penny, Zheng wrote:
> > >>>>>>> -----Original Message-----
> > >>>>>>> From: Jan Beulich <jbeulich@suse.com>
> > >>>>>>> Sent: Thursday, September 11, 2025 9:30 PM
> > >>>>>>>
> > >>>>>>> On 10.09.2025 09:38, Penny Zheng wrote:
> > >>>>>>>> --- a/xen/include/xsm/xsm.h
> > >>>>>>>> +++ b/xen/include/xsm/xsm.h
> > >>>>>>>> @@ -55,8 +55,8 @@ struct xsm_ops {
> > >>>>>>>>      void (*security_domaininfo)(struct domain *d,
> > >>>>>>>>                                  struct xen_domctl_getdomaininfo *info);
> > >>>>>>>>      int (*domain_create)(struct domain *d, uint32_t ssidref);
> > >>>>>>>> -    int (*getdomaininfo)(struct domain *d);
> > >>>>>>>>  #ifdef CONFIG_MGMT_HYPERCALLS
> > >>>>>>>> +    int (*getdomaininfo)(struct domain *d);
> > >>>>>>>>      int (*domctl_scheduler_op)(struct domain *d, int op);
> > >>>>>>>>      int (*sysctl_scheduler_op)(int op);
> > >>>>>>>>      int (*set_target)(struct domain *d, struct domain *e); @@
> > >>>>>>>> -234,7
> > >>>>>>>> +234,11 @@ static inline int xsm_domain_create(
> > >>>>>>>>
> > >>>>>>>>  static inline int xsm_getdomaininfo(xsm_default_t def, struct
> > >>>>>>>> domain
> > >>>>>>>> *d)  {
> > >>>>>>>> +#ifdef CONFIG_MGMT_HYPERCALLS
> > >>>>>>>>      return alternative_call(xsm_ops.getdomaininfo, d);
> > >>>>>>>> +#else
> > >>>>>>>> +    return -EOPNOTSUPP;
> > >>>>>>>> +#endif
> > >>>>>>>>  }
> > >>>>>>>
> > >>>>>>> This is in use by a Xenstore sysctl and a Xenstore domctl. The
> > >>>>>>> sysctl is hence already broken with the earlier series. Now the
> > >>>>>>> domctl is also being screwed up. I don't think MGMT_HYPERCALLS
> > >>>>>>> really ought to extend to any operations available to other than the core
> > >>> toolstack.
> > >>>>>>> That's the Xenstore ones here, but also the ones used by qemu
> > >>>>>>> (whether run in
> > >>>>> Dom0 or a stubdom).
> > >>>>>>
> > >>>>>> Maybe not only limited to the core toolstack. In
> > >>>>>> dom0less/hyperlaunched
> > >>>>> scenarios, hypercalls are strictly limited. QEMU is also limited to
> > >>>>> pvh machine type and with very restricted functionality(, only acting
> > >>>>> as a few virtio-pci devices backend). @Andryuk, Jason @Stabellini,
> > >>>>> Stefano Am I understanding correctly and thoroughly about our scenario here for
> > >>> upstream?
> > >>>>>> Tracking the codes, if Xenstore is created as a stub domain, it
> > >>>>>> requires
> > >>>>> getdomaininfo-domctl to acquire related info.  Sorry, I haven't found
> > >>>>> how it was called in QEMU...
> > >>>>>
> > >>>>> It's not "it"; it's different ones. First and foremost I was thinking
> > >>>>> of
> > >>>>>  * XEN_DOMCTL_ioport_mapping
> > >>>>>  * XEN_DOMCTL_memory_mapping
> > >>>>>  * XEN_DOMCTL_bind_pt_irq
> > >>>>>  * XEN_DOMCTL_unbind_pt_irq
> > >>>>> but there may be others (albeit per the dummy xsm_domctl() this is
> > >>>>> the full set). As a general criteria, anything using XSM_DM_PRIV
> > >>>>> checking can in principle be called by qemu.
> > >>>>>
> > >>>>
> > >>>> Understood.
> > >>>> I assume that they are all for device passthrough. We are not accepting device
> > >>> passthrough via core toolstack in dom0less/hyperlaunch-ed scenarios. Jason has
> > >>> developed device passthrough through device tree to only accept "static
> > >>> configured" passthrough in dom0less/hyperlaunch-ed scenario, while it is still
> > >>> internal , it may be the only accept way to do device passthrough in
> > >>> dom0less/hyperlaunch-ed scenario.
> > >>>
> > >>> Right, but no matter what your goals, the upstream contributions need to be self-
> > >>> consistent. I.e. not (risk to) break other functionality. (Really the four domctl-s
> > >>> mentioned above might better have been put elsewhere, e.g. as dm-ops. Moving
> > >>> them may be an option here.)
> > >>
> > >> Understood.
> > >> I'll move them all to the dm-ops
> > > 
> > > Hi Penny, Jan, I advise against this.
> > > 
> > > I think it is clear that there are open questions on how to deal with
> > > the safety scenarios. I briefly mentioned some of the issues last week
> > > at Xen Summit. One example is the listdomains hypercall that should be
> > > available to the control domain. We cannot resolve all problems with
> > > this patch series. I think we should follow a simpler plan:
> > > 
> > > 1) introduce CONFIG_MGMT_HYPERCALLS the way this patch series does,
> > >    removing all domctls and sysctls
> > > 
> > > 2) make further adjustments, such as making available the listdomains
> > >    hypercall and/or the hypercalls listed by Jan as a second step after
> > >    it
> > 
> > I'm going to be okay-ish with that as long as the help text of the Kconfig
> > option clearly mentions those extra pitfalls.
> 
> +0

Ahah I mistyped this :-)

I meant +1 in the sense that I am happy with the idea of kconfig clearly
mentioning the pitfalls.

