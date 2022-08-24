Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5AF59F8CB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392476.630849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQoqJ-0003Dl-8n; Wed, 24 Aug 2022 11:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392476.630849; Wed, 24 Aug 2022 11:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQoqJ-0003By-5X; Wed, 24 Aug 2022 11:46:43 +0000
Received: by outflank-mailman (input) for mailman id 392476;
 Wed, 24 Aug 2022 11:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+X8Z=Y4=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1oQoqI-0003Bs-0u
 for xen-devel@lists.xen.org; Wed, 24 Aug 2022 11:46:42 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69dcbb30-23a2-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 13:46:40 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso690024wmr.3
 for <xen-devel@lists.xen.org>; Wed, 24 Aug 2022 04:46:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c3b8300b003a319b67f64sm8255516wms.0.2022.08.24.04.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 04:46:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8F601FFB7;
 Wed, 24 Aug 2022 12:46:35 +0100 (BST)
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
X-Inumbo-ID: 69dcbb30-23a2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc;
        bh=XxhKIjR8GaWVfm2736zYQHBVI04PuDH60V7gYHYS8cg=;
        b=ebZa0Scl5OyKn9ed+TB/PKDU3u7VG6fw1G31e/0LxGJG/Ws11BDGGt/q9DCOeSWbDR
         JBgKK5ejYli3GEWq9kSDUagi8Kmdyr+p22FjL/WReDws8n5U186cx5T225S/hrEcTIcP
         7UFTpI+pH6TbYyuXySxwW21cL4QFgZEa+NMA1Gn/zWOksnzQKaoeTuz3nmoUbZjjJckS
         x8KR/+KstXaZOU53bXkNqfW8tXvLwYJ7vl9m1l7uPvV+FXUVs4YPBQCrkTSMWmGkgpJV
         8czWEjtUpmiBFql9r4BFDKPnO9XF0LbALavhQ/xCKw6j+f4ggF2XFkBzruUOD3zL5MB4
         Ce8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc;
        bh=XxhKIjR8GaWVfm2736zYQHBVI04PuDH60V7gYHYS8cg=;
        b=BTF4om6r+xKXantwrw3jWNisLvngwhysIh+vvWCITa16d+yGvQnzDCis+baGrnjRDS
         KUCQrHI1PN/P5wNSRdVYI6FdUVvz+Jce6AIRB/wKevFtv0xcATCGK0AL12KX+ZEN+6ro
         yLn4N9QIvqNZy/fyKbFJ3JZCK3SLDqwT6j+3uv5V72ryRS1MXvrwnLzLgFRemGFFKGqI
         rAyWhWfgUCpz8fe7rQRZ83uGVMYchAgt637s3IqKmbm+irIraMb1teDYGF29t9RxP7OV
         wP7/sWGMYRzGLOOxaeOG0tobwvG2LG5F/8Qb9Ah40lPWg88ORIipbQ6KqMcBFjUmf6a/
         1m1w==
X-Gm-Message-State: ACgBeo0n32TY+dK3sZgLwxzWhyAnsvX4lCziVVVzmsHnsLt9/ls/h6oK
	n5ShVFZpK68dUB9LtO7EMq0HMw==
X-Google-Smtp-Source: AA6agR5Zv6eNrWbFYJ+TFCnhBh0Jo/cioog7snDtr10vWjAp26CGn/rodkkROJFz7XRaZGCjMjKl/Q==
X-Received: by 2002:a05:600c:4f49:b0:3a6:1cc6:afba with SMTP id m9-20020a05600c4f4900b003a61cc6afbamr5125967wmq.80.1661341598215;
        Wed, 24 Aug 2022 04:46:38 -0700 (PDT)
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>, "Stratos-dev@op-lists.linaro.org"
 <Stratos-dev@op-lists.linaro.org>, "mathieu.poirier@linaro.com"
 <mathieu.poirier@linaro.com>, "christopher.w.clark@gmail.com"
 <christopher.w.clark@gmail.com>, "boris.ostrovsky@oracle.com"
 <boris.ostrovsky@oracle.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "vincent.guittot@linaro.org"
 <vincent.guittot@linaro.org>, "olekstysh@gmail.com" <olekstysh@gmail.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
Date: Wed, 24 Aug 2022 12:22:44 +0100
In-reply-to: <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com>
Message-ID: <877d2xj23o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Andrew Cooper <Andrew.Cooper3@citrix.com> writes:

> On 24/08/2022 10:19, Viresh Kumar wrote:
>> On 24-03-22, 06:12, Juergen Gross wrote:
>>> For a rather long time we were using "normal" user pages for this purpo=
se,
>>> which were just locked into memory for doing the hypercall.
>>>
>>> Unfortunately there have been very rare problems with that approach, as
>>> the Linux kernel can set a user page related PTE to invalid for short
>>> periods of time, which led to EFAULT in the hypervisor when trying to
>>> access the hypercall data.
>>>
>>> In Linux this can avoided only by using kernel memory, which is the
>>> reason why the hypercall buffers are allocated and mmap()-ed through the
>>> privcmd driver.
>> Hi Juergen,
>>
>> I understand why we moved from user pages to kernel pages, but I don't
>> fully understand why we need to make two separate calls to map the
>> guest memory, i.e. mmap() followed by ioctl(IOCTL_PRIVCMD_MMAPBATCH).
>>
>> Why aren't we doing all of it from mmap() itself ? I hacked it up to
>> check on it and it works fine if we do it all from mmap() itself.

As I understand it the MMAPBATCH ioctl is being treated like every other
hypercall proxy through the ioctl interface. Which makes sense from the
point of view of having a consistent interface to the hypervisor but not
from point of view of providing a consistent userspace interface for
mapping memory which doesn't care about the hypervisor details.

The privcmd_mmapbatch_v2 interface is slightly richer than what you
could expose via mmap() because it allows the handling of partial
mappings with what I presume is a per-page *err array. If you issued the
hypercall directly from the mmap() and one of the pages wasn't mapped by
the hypervisor you would have to unwind everything before returning
EFAULT to the user.

>> Aren't we abusing the Linux userspace ABI here ? As standard userspace
>> code would expect just mmap() to be enough to map the memory. Yes, the
>> current user, Xen itself, is adapted to make two calls, but it breaks
>> as soon as we want to use something that relies on Linux userspace
>> ABI.
>>
>> For instance, in our case, where we are looking to create
>> hypervisor-agnostic virtio backends, the rust-vmm library [1] issues
>> mmap() only and expects it to work. It doesn't know it is running on a
>> Xen system, and it shouldn't know that as well.
>
> Use /dev/xen/hypercall which has a sane ABI for getting "safe" memory.=C2=
=A0
> privcmd is very much not sane.
>
> In practice you'll need to use both.=C2=A0 /dev/xen/hypercall for getting
> "safe" memory, and /dev/xen/privcmd for issuing hypercalls for now.

I'm unsure what is meant by safe memory here. privcmd_buf_mmap() looks
like it just allocates a bunch of GFP_KERNEL pages rather than
interacting with the hypervisor directly. Are these the same pages that
get used when you eventually call privcmd_ioctl_mmap_batch()?

The fact that /dev/xen/hypercall is specified by xen_privcmdbuf_dev is a
little confusing TBH.

Anyway the goal here is to provide a non-xen aware userspace with
standard userspace API to access the guests memory. Perhaps messing
around with the semantics of the /dev/xen/[hypercall|privcmd] devices
nodes is too confusing.

Maybe we could instead:

 1. Have the Xen aware VMM ask to make the guests memory visible to the
    host kernels address space.
 2. When this is done explicitly create a device node to represent it (/dev=
/xen/dom-%d-mem?)
 3. Pass this new device to the non-Xen aware userspace which uses the
    standard mmap() call to make the kernel pages visible to userspace

Does that make sense?

--=20
Alex Benn=C3=A9e

