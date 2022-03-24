Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4509E4E5CE3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 02:43:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294106.499915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXCUb-0005Gi-6B; Thu, 24 Mar 2022 01:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294106.499915; Thu, 24 Mar 2022 01:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXCUb-0005Ew-04; Thu, 24 Mar 2022 01:42:25 +0000
Received: by outflank-mailman (input) for mailman id 294106;
 Thu, 24 Mar 2022 01:42:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nXCUZ-0005Eq-6F
 for xen-devel@lists.xen.org; Thu, 24 Mar 2022 01:42:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4825c34-ab13-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 02:42:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2B116194F;
 Thu, 24 Mar 2022 01:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E848EC340E8;
 Thu, 24 Mar 2022 01:42:17 +0000 (UTC)
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
X-Inumbo-ID: a4825c34-ab13-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648086138;
	bh=/SZaU4HqBGJJ3osh2aDi5ok4Cwjkcm8i0TKyIL0r0Wg=;
	h=Date:From:To:cc:Subject:From;
	b=Pqw+nuZ7NqieohnTrmgk1hor/3eua+YrMq9Oehikk/SA0YmUH6affzEE8SJg6nplI
	 MLnwT5nxtT0qXh84EVkPQ5eC5r/NM5DcFozeq63GUFuBcFlOETFpZXzI4kED8U/xTX
	 vg0c7yZ3yOHqNz0CnGXGtYVK15ATFy/z8uoAqKRGrWafLeRrYPWux0jV7MUE29z7zS
	 GLbQ/0mcrlQSvOHCX1bUMVwMpiUC9MVeLCAtnfc9ltjw8Hj5qeqC+Q9zkHiXlMKAUv
	 FdQGCM46bYiIQkt3sL5pIBKtnuRThoJVw7NX0Jaj5/cAd7X4znPf/9KboFeFoj8eUt
	 GcbPkXWA8QzSg==
Date: Wed, 23 Mar 2022 18:42:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: alex.bennee@linaro.org
cc: xen-devel@lists.xen.org, Stratos-dev@op-lists.linaro.org, 
    viresh.kumar@linaro.org, mathieu.poirier@linaro.com, 
    christopher.w.clark@gmail.com, jgross@suse.com, boris.ostrovsky@oracle.com
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
Message-ID: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I am pretty sure the reasons have to do with old x86 PV guests, so I am
CCing Juergen and Boris.


> Hi,
> 
> While we've been working on the rust-vmm virtio backends on Xen we
> obviously have to map guest memory info the userspace of the daemon.
> However following the logic of what is going on is a little confusing.
> For example in the Linux backend we have this:
> 
>   void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
>                                    uint32_t dom, void *addr,
>                                    int prot, int flags, size_t num,
>                                    const xen_pfn_t arr[/*num*/], int err[/*num*/])
>   {
>       int fd = fmem->fd;
>       privcmd_mmapbatch_v2_t ioctlx;
>       size_t i;
>       int rc;
> 
>       addr = mmap(addr, num << XC_PAGE_SHIFT, prot, flags | MAP_SHARED,
>                   fd, 0);
>       if ( addr == MAP_FAILED )
>           return NULL;
> 
>       ioctlx.num = num;
>       ioctlx.dom = dom;
>       ioctlx.addr = (unsigned long)addr;
>       ioctlx.arr = arr;
>       ioctlx.err = err;
> 
>       rc = ioctl(fd, IOCTL_PRIVCMD_MMAPBATCH_V2, &ioctlx);
> 
> Where the fd passed down is associated with the /dev/xen/privcmd device
> for issuing hypercalls on userspaces behalf. What is confusing is why
> the function does it's own mmap - one would assume the passed addr would
> be associated with a anonymous or file backed mmap region already that
> the calling code has setup. Applying a mmap to a special device seems a
> little odd.
> 
> Looking at the implementation on the kernel side it seems the mmap
> handler only sets a few flags:
> 
>   static int privcmd_mmap(struct file *file, struct vm_area_struct *vma)
>   {
>           /* DONTCOPY is essential for Xen because copy_page_range doesn't know
>            * how to recreate these mappings */
>           vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTCOPY |
>                            VM_DONTEXPAND | VM_DONTDUMP;
>           vma->vm_ops = &privcmd_vm_ops;
>           vma->vm_private_data = NULL;
> 
>           return 0;
>   }
> 
> So can I confirm that the mmap of /dev/xen/privcmd is being called for
> side effects? Is it so when the actual ioctl is called the correct flags
> are set of the pages associated with the user space virtual address
> range?
> 
> Can I confirm there shouldn't be any limitation on where and how the
> userspace virtual address space is setup for the mapping in the guest
> memory?
> 
> Is there a reason why this isn't done in the ioctl path itself?
> 
> I'm trying to understand the differences between Xen and KVM in the API
> choices here. I think the equivalent is the KVM_SET_USER_MEMORY_REGION
> ioctl for KVM which brings a section of the guest physical address space
> into the userspaces vaddr range.

