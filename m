Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB0793317
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595975.929692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgnt-0000Bs-CN; Wed, 06 Sep 2023 00:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595975.929692; Wed, 06 Sep 2023 00:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgnt-00009K-8Q; Wed, 06 Sep 2023 00:53:57 +0000
Received: by outflank-mailman (input) for mailman id 595975;
 Wed, 06 Sep 2023 00:53:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgnr-00008b-UR
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:53:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da4de28b-4c4f-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 02:53:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AE74B81835;
 Wed,  6 Sep 2023 00:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D608C433C7;
 Wed,  6 Sep 2023 00:53:52 +0000 (UTC)
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
X-Inumbo-ID: da4de28b-4c4f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693961633;
	bh=CrPqomtDE1matdoZ4HxUUPdCMnwna8XS9lekLHtSbDM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CZ/YhH6wLXZPF4QoXBPwUzcSbjjWoVee90smyyRpmdYfFQOKDowEXUgLWkbHqQM7G
	 dlu6Wq14Md62swSukOuUYobKABWHTFFHKdCQGYUhykTCMajVcqKVfZh5HCRxCkg6lN
	 thB9k+j/do4Fkq7ZwGdB0WceB+sTOb/9FLknPEZJETOpG+WUg/w6getFX/6L35wrMR
	 BQu3dkIyIaeP6ntJ5rGUXjGmL5pa2tHG5PoBURNSGYB0hCKnvGKSFIZTsWswQJIpZk
	 EcUL2qnwjEozVvuZu0ea2FOVfz9IlKWQ5LtAyza6QamAkw71jnEEOK0uJjSc7cW65O
	 jFpyVVh4iiaMw==
Date: Tue, 5 Sep 2023 17:53:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org, 
    julien@xen.org, sstabellini@kernel.org
Subject: Re: [XEN][PATCH v11 14/20] common/device_tree: Add rwlock for
 dt_host
In-Reply-To: <227d9107-5f5c-b773-639e-ee59a7047a27@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051740440.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-15-vikram.garhwal@amd.com> <227d9107-5f5c-b773-639e-ee59a7047a27@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Sep 2023, Michal Orzel wrote:
> On 01/09/2023 06:59, Vikram Garhwal wrote:
> > Dynamic programming ops will modify the dt_host and there might be other
> > functions which are browsing the dt_host at the same time. To avoid the race
> > conditions, adding rwlock for browsing the dt_host during runtime. dt_host
> > writer will be added in the follow-up patch for device tree overlay
> > functionalities.
> > 
> > Reason behind adding rwlock instead of spinlock:
> >     For now, dynamic programming is the sole modifier of dt_host in Xen during
> >     run time. All other access functions like iommu_release_dt_device() are
> >     just reading the dt_host during run-time. So, there is a need to protect
> >     others from browsing the dt_host while dynamic programming is modifying
> >     it. rwlock is better suitable for this task as spinlock won't be able to
> >     differentiate between read and write access.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> > Changes from v10:
> >     Add ASSERT for iommu_assign_dt_device() and iommu_add_dt_device().
> > Changes from v9:
> >     Update commit message and fix indentation.
> >     Add ASSERT() for iommu_deassign_dt_device() and iommu_remove_dt_device().
> >     Fix code styles.
> >     Remove rwlock_init in unflatten_device_tree() and do DEFINE_RWLOCK in
> >         device-tree.c
> > Changes from v7:
> >     Keep one lock for dt_host instead of lock for each node under dt_host.
> > ---
> > ---
> >  xen/common/device_tree.c              |  1 +
> >  xen/drivers/passthrough/device_tree.c | 28 +++++++++++++++++++++++++--
> >  xen/include/xen/device_tree.h         |  7 +++++++
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index f38f51ec0b..b1c2952951 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
> >  struct dt_device_node *dt_host;
> >  /* Interrupt controller node*/
> >  const struct dt_device_node *dt_interrupt_controller;
> > +DEFINE_RWLOCK(dt_host_lock);
> >  
> >  /**
> >   * struct dt_alias_prop - Alias property in 'aliases' node
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 80f6efc606..1f9cfccf95 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -31,6 +31,8 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
> >      int rc = -EBUSY;
> >      struct domain_iommu *hd = dom_iommu(d);
> >  
> > +    ASSERT(system_state <= SYS_STATE_active || rw_is_locked(&dt_host_lock));
> This looks not right (I know Julien suggested this). The second part will be checked only if state > active i.e. suspend/resume.
> I think this wants to be:
> ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock));
> so that once the state is >= active, we require dt_host_lock to be locked.

Well spotted!

