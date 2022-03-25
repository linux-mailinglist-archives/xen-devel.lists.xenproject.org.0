Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8F64E78E9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 17:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294837.501533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXmoH-0004tH-CK; Fri, 25 Mar 2022 16:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294837.501533; Fri, 25 Mar 2022 16:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXmoH-0004rA-9F; Fri, 25 Mar 2022 16:29:09 +0000
Received: by outflank-mailman (input) for mailman id 294837;
 Fri, 25 Mar 2022 16:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qzZe=UE=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nXmoF-0004r4-LZ
 for xen-devel@lists.xen.org; Fri, 25 Mar 2022 16:29:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af448af8-ac58-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 17:29:06 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id dr20so16408054ejc.6
 for <xen-devel@lists.xen.org>; Fri, 25 Mar 2022 09:29:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ec21-20020a170906b6d500b006d170a3444csm2501103ejb.164.2022.03.25.09.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 09:29:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B3BB1FFB7;
 Fri, 25 Mar 2022 16:29:01 +0000 (GMT)
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
X-Inumbo-ID: af448af8-ac58-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=Bs6Ew4qcDSOPaAAgM3hWT94vALNcRpubufRp6rMTEHg=;
        b=ujpme7SbyVmPEIcwqa0cXoC9/8B8Wh20DGZpLHua01JTm7XTevZlOXLQJ+v/lHn5EZ
         Qv6J1qyCsWsSCxYK22oW8uQhgp5+DvWC+zy3wFC3psBotw7lQfuKJ9sNeWZy2WHOIcQo
         6kGSvs5qWqx5vxAXZk62+opV7F45WAZ7WZ8BBx5JhH0hTAfB8WG6dJR7wFZ/LTugGcL4
         eEhr52xrFW9YfXlYkedb97kmuTOp6TJoxaVEjCIFjuRbgjg2c1g7LvyZrzUYDp36rhnY
         SMM2QueIjhU5nxlovwmqF4y0PW62aWN0FBxAXBMHexmrLmcN4B7BSyHC3ZowTutMHYXI
         rXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=Bs6Ew4qcDSOPaAAgM3hWT94vALNcRpubufRp6rMTEHg=;
        b=VUzG80Km6CgAYpsYa2HzbtvEm78/uBb0mrU7PfzqebLHJvpLGZ8zP1CgOPS2s+2dTB
         gY4mX0PX1pPyE7kHNmaEOICX4n5gzmUC6alSWXaIqAwvdmlYpdMVhU4lVunEmIfTlnXA
         PTu/9S32gkQF4tmxHOSoy81rjBBtmBUFhsZNep/kwByOGQtGiPak7jCBv6hhPbi6yHPT
         8jmhiZq8g9HcZk28ldRqUoE5Ddvk9z51G3vCJ4GFRp2r6ASn8sY20RXsjKa91x4iGFLW
         icveSGVKDw84GMt7OKR8s9ard/cPbEkt0LYqjClp1n/ZFD8922r/gJvQ0mjtMGvYFEnI
         DfNA==
X-Gm-Message-State: AOAM530xlGdfW7l8V5k5TIBav7rPaMl1FcHBELBNQzmtSd47cXEUqf2F
	QCWF3ozidYlzuxNJ/wjMgn88Nw==
X-Google-Smtp-Source: ABdhPJx0oF1r9pspDG5weBqyLFiciFK7zxS9wHzyhze8BE48Ik/CHUsij5AMJexvMZJe7Fb+nkJhaQ==
X-Received: by 2002:a17:906:32d8:b0:6ce:d850:f79 with SMTP id k24-20020a17090632d800b006ced8500f79mr12201040ejk.414.1648225743518;
        Fri, 25 Mar 2022 09:29:03 -0700 (PDT)
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xen.org, Stratos-dev@op-lists.linaro.org,
 viresh.kumar@linaro.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 christopher.w.clark@gmail.com, boris.ostrovsky@oracle.com,
 Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
Date: Fri, 25 Mar 2022 16:07:51 +0000
In-reply-to: <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
Message-ID: <87mthe0zea.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


(add Arnd to CC)

Juergen Gross <jgross@suse.com> writes:

> [[PGP Signed Part:Undecided]]
> On 24.03.22 02:42, Stefano Stabellini wrote:
>> I am pretty sure the reasons have to do with old x86 PV guests, so I am
>> CCing Juergen and Boris.
>>=20
>>> Hi,
>>>
>>> While we've been working on the rust-vmm virtio backends on Xen we
>>> obviously have to map guest memory info the userspace of the daemon.
>>> However following the logic of what is going on is a little confusing.
>>> For example in the Linux backend we have this:
>>>
>>>    void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
>>>                                     uint32_t dom, void *addr,
>>>                                     int prot, int flags, size_t num,
>>>                                     const xen_pfn_t arr[/*num*/], int e=
rr[/*num*/])
>>>    {
>>>        int fd =3D fmem->fd;
>>>        privcmd_mmapbatch_v2_t ioctlx;
>>>        size_t i;
>>>        int rc;
>>>
>>>        addr =3D mmap(addr, num << XC_PAGE_SHIFT, prot, flags | MAP_SHAR=
ED,
>>>                    fd, 0);
>>>        if ( addr =3D=3D MAP_FAILED )
>>>            return NULL;
>>>
>>>        ioctlx.num =3D num;
>>>        ioctlx.dom =3D dom;
>>>        ioctlx.addr =3D (unsigned long)addr;
>>>        ioctlx.arr =3D arr;
>>>        ioctlx.err =3D err;
>>>
>>>        rc =3D ioctl(fd, IOCTL_PRIVCMD_MMAPBATCH_V2, &ioctlx);
>>>
>>> Where the fd passed down is associated with the /dev/xen/privcmd device
>>> for issuing hypercalls on userspaces behalf. What is confusing is why
>>> the function does it's own mmap - one would assume the passed addr would
>>> be associated with a anonymous or file backed mmap region already that
>>> the calling code has setup. Applying a mmap to a special device seems a
>>> little odd.
>>>
>>> Looking at the implementation on the kernel side it seems the mmap
>>> handler only sets a few flags:
>>>
>>>    static int privcmd_mmap(struct file *file, struct vm_area_struct *vm=
a)
>>>    {
>>>            /* DONTCOPY is essential for Xen because copy_page_range doe=
sn't know
>>>             * how to recreate these mappings */
>>>            vma->vm_flags |=3D VM_IO | VM_PFNMAP | VM_DONTCOPY |
>>>                             VM_DONTEXPAND | VM_DONTDUMP;
>>>            vma->vm_ops =3D &privcmd_vm_ops;
>>>            vma->vm_private_data =3D NULL;
>>>
>>>            return 0;
>>>    }
>>>
>>> So can I confirm that the mmap of /dev/xen/privcmd is being called for
>>> side effects? Is it so when the actual ioctl is called the correct flags
>>> are set of the pages associated with the user space virtual address
>>> range?
>>>
>>> Can I confirm there shouldn't be any limitation on where and how the
>>> userspace virtual address space is setup for the mapping in the guest
>>> memory?
>>>
>>> Is there a reason why this isn't done in the ioctl path itself?
>
> For a rather long time we were using "normal" user pages for this purpose,
> which were just locked into memory for doing the hypercall.

Was this using the normal mlock() semantics to stop pages being swapped
out of RAM?

> Unfortunately there have been very rare problems with that approach, as
> the Linux kernel can set a user page related PTE to invalid for short
> periods of time, which led to EFAULT in the hypervisor when trying to
> access the hypercall data.

I must admit I'm not super familiar with the internals of page table
handling with Linux+Xen. Doesn't the kernel need to delegate the
tweaking of page tables to the hypervisor or is it allowed to manipulate
the page tables itself?

> In Linux this can avoided only by using kernel memory, which is the
> reason why the hypercall buffers are allocated and mmap()-ed through the
> privcmd driver.
>
>>>
>>> I'm trying to understand the differences between Xen and KVM in the API
>>> choices here. I think the equivalent is the KVM_SET_USER_MEMORY_REGION
>>> ioctl for KVM which brings a section of the guest physical address space
>>> into the userspaces vaddr range.
>
> The main difference is just that the consumer of the hypercall buffer is
> NOT the kernel, but the hypervisor. In the KVM case both are the same, so
> a brief period of an invalid PTE can be handled just fine in KVM, while
> the Xen hypervisor has no idea that this situation will be over very
> soon.

I still don't follow the details of why we have the separate mmap. Is it
purely because the VM flags of the special file can be changed in a way
that can't be done with a traditional file-backed mmap?

I can see various other devices have their own setting of vm flags but
VM_DONTCOPY for example can be set with the appropriate madvise call:

       MADV_DONTFORK (since Linux 2.6.16)
              Do not make the pages in this range available to the child af=
ter
              a fork(2).  This is useful to  prevent  copy-on-write  semant=
ics
              from  changing  the  physical  location  of a page if the par=
ent
              writes to it after a  fork(2).   (Such  page  relocations  ca=
use
              problems for hardware that DMAs into the page.)

For the vhost-user work we need to be able to share the guest memory
between the xen-vhost-master (which is doing the ioctls to talk to Xen)
and the vhost-user daemon (which doesn't know about hypervisors but just
deals in memory and events).

Would it be enough to loosen the API and just have xen_remap_pfn()
verify the kernels VM flags are appropriately set before requesting Xen
updates the page tables?

--=20
Alex Benn=C3=A9e

