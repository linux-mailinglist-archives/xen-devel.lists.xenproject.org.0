Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C627B43D762
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 01:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217517.377604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfs7r-0005Bx-OZ; Wed, 27 Oct 2021 23:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217517.377604; Wed, 27 Oct 2021 23:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfs7r-000594-LH; Wed, 27 Oct 2021 23:14:31 +0000
Received: by outflank-mailman (input) for mailman id 217517;
 Wed, 27 Oct 2021 23:14:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfs7q-00058v-6v
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 23:14:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a27092dc-377b-11ec-848a-12813bfff9fa;
 Wed, 27 Oct 2021 23:14:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33D9661073;
 Wed, 27 Oct 2021 23:14:28 +0000 (UTC)
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
X-Inumbo-ID: a27092dc-377b-11ec-848a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635376468;
	bh=ZxsRB9KDMD7vo3PWeIPjNbL9zMu2Gc6zvpMQSYEYrCE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bqBWZrzOrE7EKghJyMpRBdqiGSvnZCVC9F8eIzC32x+bEqmUjXF/IbKFFKtgjoZpS
	 3UpvRDI1g7Ev/txKY+fWL2/qlOkMZuEMExepdOoNeBSypieBVIoQrRD5ELn5LtT89U
	 CVpDVoomWSm+LHyP+0cioGtfaeP+gq9GwhRjLUOgqo3XRr+AWR+oF9c0z5Ans6fbSb
	 pPqeynqgT+mqxP8ADjE6F5cju4NjQI733czmC6RxdNgH4vx1W/ntbma14t8lD9w1al
	 gm62Vniwj9VcTBJ/ou3GwfwIMw0gz3UGM1EyrKDEFmnX60PsZHi+055RTvpVYkMM8A
	 IawtkiYNY5o5g==
Date: Wed, 27 Oct 2021 16:14:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com, 
    Ian Jackson <iwj@xenproject.org>
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a
 lock
In-Reply-To: <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
Message-ID: <alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s>
References: <20211026122903.15042-1-michal.orzel@arm.com> <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org> <70c30a6c-b779-805e-079a-41bb484894b9@xen.org> <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com> <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-507483422-1635376468=:20134"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-507483422-1635376468=:20134
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 27 Oct 2021, Julien Grall wrote:
> > > > > +    return ret;
> > > > >    }
> > > > >    static int register_smmu_master(struct arm_smmu_device *smmu,
> > > > > @@ -2056,7 +2066,10 @@ static int arm_smmu_add_device(struct device
> > > > > *dev)
> > > > >        } else {
> > > > >            struct arm_smmu_master *master;
> > > > > +        spin_lock(&arm_smmu_devices_lock);
> > > > >            master = find_smmu_master(smmu, dev->of_node);
> > > > > +        spin_unlock(&arm_smmu_devices_lock);
> > > > 
> > > > At the moment, unlocking here is fine because we don't remove the
> > > > device. However, there are a series to supporting removing a device (see
> > > > [1]). So I think it would be preferable to unlock after the last use of
> > > > 'cfg'.
> > > > 
> > Ok. I will move unlocking to the end of this else {} block. I was not aware
> > of the patch you are referring to.
> 
> I think the end of the else is still too early. This needs to at least be past
> iommu_group_set_iommudata() because we store cfg.
> 
> Potentially, the lock wants to also englobe arm_smmu_master_alloc_smes(). So I
> am wondering whether it would be simpler to hold the lock for the whole
> duration of arm_smmu_add_device() (I can see value when we will want to
> interlock with the remove code).

The patch was to protect the smmu master list. From that point of view
the unlock right after find_smmu_master would be sufficient, right?

We only need to protect cfg if we are worried that the same device is
added in two different ways at the same time. Did I get it right? If so,
I would say that that case should not be possible? Am I missing another
potential conflict?


I am pointing this out for two reasons:

Protecting the list is different from protecting each element from
concurrent modification of the element itself. If the latter is a
potential problem, I wonder if arm_smmu_add_device is the only function
affected?

The second reason is that extending the lock past
arm_smmu_master_alloc_smes is a bit worrying because it causes
&arm_smmu_devices_lock and smmu->stream_map_lock to nest, which wasn't
the case before.

I am not saying that it is a bad idea to extend the lock past
arm_smmu_master_alloc_smes -- it might be the right thing to do. But I
am merely saying that it might be best to think twice about it and/or do
that after 4.16.
--8323329-507483422-1635376468=:20134--

