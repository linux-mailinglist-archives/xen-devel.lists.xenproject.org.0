Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B945BA371
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 02:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407729.650318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYyy2-0007kZ-RB; Fri, 16 Sep 2022 00:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407729.650318; Fri, 16 Sep 2022 00:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYyy2-0007iK-OX; Fri, 16 Sep 2022 00:12:26 +0000
Received: by outflank-mailman (input) for mailman id 407729;
 Fri, 16 Sep 2022 00:12:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jeri=ZT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oYyy1-0006vA-Dt
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 00:12:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ccf77dc-3554-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 02:12:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E82F862781;
 Fri, 16 Sep 2022 00:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA31C433C1;
 Fri, 16 Sep 2022 00:12:21 +0000 (UTC)
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
X-Inumbo-ID: 3ccf77dc-3554-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663287142;
	bh=D6JNVX4L5f1CKCm5Ste0j39s2hx8Ri7r6fqTpPPufxQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g7cNe3Qa/zZmla1b66xZh8C3yqnfHSIfBlHUGm7wn3ogMLEKAv3gOoNsfYCKkj2X7
	 IXb9FiO3wApAZmSiHai9UsPHUoQzxYT1krxtrVBeDvCa6mew/QbgcARpOGZv6RI42+
	 x+/JQhHwLVy+RWPr72Vosy4RWB7YWP9/xrlgY0EEQNSta3E7wOjM995KHswFkO5l4z
	 3UsXIRXyRPiFwBYvDDUuSsJdQw/I+HIjuaapdglzSG7C4PIuzRnUM9S3HEy5Iu1PJs
	 POM5Lhfo23rnV39h1gd6x42ssztaNezm4yWJcqwmASXjXm9t+lW8sUI7iUGGQ2UZAA
	 r5/sFsbza6Y+A==
Date: Thu, 15 Sep 2022 17:12:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>, 
    "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>, 
    "Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>, 
    "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>, 
    "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
In-Reply-To: <fca322ea-6823-1a7a-213a-73e7dfbea830@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209151701170.157835@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop> <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com> <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com> <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop> <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com> <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop> <3c1eccfe-3ca5-32d8-ee5a-cf8e7b23d587@suse.com> <alpine.DEB.2.22.394.2209141749460.157835@ubuntu-linux-20-04-desktop> <fca322ea-6823-1a7a-213a-73e7dfbea830@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Sep 2022, Juergen Gross wrote:
> On 15.09.22 03:18, Stefano Stabellini wrote:
> > On Wed, 14 Sep 2022, Jan Beulich wrote:
> > > On 14.09.2022 01:31, Stefano Stabellini wrote:
> > > > The problem is that drivers/xen/privcmd.c:privcmd_mmap sets VM_IO |
> > > > VM_PFNMAP, and either flag would cause check_vma_flags to return
> > > > -EFAULT.
> > > > 
> > > > Do you know if it works if you remove VM_IO | VM_PFNMAP from
> > > > privcmd_mmap?
> > > 
> > > My Linux MM knowledge is certainly rusty, but I don't think this can
> > > work, at the very least not without further changes elsewhere.
> > 
> > The definition of VM_PFNMAP is:
> > 
> >      Page-ranges managed without "struct page", just pure PFN
> > 
> > So it made perfect sense to use VM_PFNMAP back in the day when we were
> > using address ranges without "struct page" for foreign mappings.
> > 
> > 
> > However, nowadays Linux drivers typically call
> > xen_alloc_unpopulated_pages to get local pages to be used for foreign
> > mappings. xen_alloc_unpopulated_pages should work for both PV and
> > autotranslated guests. So the local pages should have a regular "struct
> > page" backing them.
> 
> I agree that a struct page is associated with such PFNs.
> 
> I'm not sure there are no other implicit dependencies in our drivers relying
> on VM_PFNMAP and/or VM_IO being set.
> 
> This would need really intensive testing for verification.
>
> > I noticed that privcmd calls
> > alloc_empty_pages->xen_alloc_unpopulated_pages only for autotranslated
> > guests. Do you guys think it is intentional? In theory,
> > xen_alloc_unpopulated_pages should work for PV guests too.
> 
> I agree that it should work, but it isn't needed.

Sorry I don't follow -- why isn't it needed?

Don't we need a struct page so that get_user_pages_fast & friends work
correctly for a given address? I thought that was the original intention
behind all of the xen_alloc_unpopulated_pages rework.


> > After that, privcmd calls xen_remap_domain_gfn_array, which calls
> > xen_xlate_remap_gfn_array or xen_remap_pfn depending on
> > PV or autotranslated.
> > 
> > But then I can see the following at the top of xlate_remap_gfn_array:
> > 
> > 	/* Kept here for the purpose of making sure code doesn't break
> > 	   x86 PVOPS */
> > 	BUG_ON(!((vma->vm_flags & (VM_PFNMAP | VM_IO)) == (VM_PFNMAP |
> > VM_IO)));
> > 
> > and a similar one in arch/x86/xen/mmu_pv.c:xen_remap_pfn:
> > 
> > 	BUG_ON(!((vma->vm_flags & (VM_PFNMAP | VM_IO)) == (VM_PFNMAP |
> > VM_IO)));
> > 
> > 
> > Given that the pages passed to xen_xlate_remap_gfn_array and
> > xen_remap_pfn could have been allocated with
> > xen_alloc_unpopulated_pages, why the BUG_ON?
> > 
> > Is this just legacy? In the sense that the following could work?
> > 
> > - privcmd calls xen_alloc_unpopulated_pages for both PV & autotranslated
> 
> This would add some performance penalty for PV compared to today.
> 
> > - no setting VM_PFNMAP | VM_IO
> 
> This would need some very thorough testing for not breaking any PV device.
> There are even more implications, as e.g. the kernel's memory management
> might interfere in extreme situations like memory shortage or page migration
> with pages not having set the flags (I might be wrong here, but better safe
> than sorry).
 
For sure it would need to be very well tested.

Given that we have done very good work in refactoring the kernel memory
allocation for mapping foreign pages, and now it is a lot more solid and
"compatible" with the rest of the Linux infrastructure, it would be nice
if we could exploit it to the fullest and get rid of bugs such as
"get_user_pages_fast doesn't work".


> > - no BUG_ON in xlate_remap_gfn_array
> > - no BUG_ON in xen_remap_pfn
> 
> Those are rather easy, as I'm not aware of those BUG_ON()s having triggered
> in the last few years.

