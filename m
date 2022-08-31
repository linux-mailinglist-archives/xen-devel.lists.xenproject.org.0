Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDC25A82A5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 18:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395843.635734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQBz-0001p8-LD; Wed, 31 Aug 2022 16:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395843.635734; Wed, 31 Aug 2022 16:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQBz-0001n2-HO; Wed, 31 Aug 2022 16:03:51 +0000
Received: by outflank-mailman (input) for mailman id 395843;
 Wed, 31 Aug 2022 16:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eSFh=ZD=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1oTQBx-0001mw-7D
 for xen-devel@lists.xen.org; Wed, 31 Aug 2022 16:03:49 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7deb9c1f-2946-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 18:03:47 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso8280797wmb.2
 for <xen-devel@lists.xen.org>; Wed, 31 Aug 2022 09:03:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b003a54d610e5fsm2638337wmq.26.2022.08.31.09.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 09:03:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F28D1FFB7;
 Wed, 31 Aug 2022 17:03:43 +0100 (BST)
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
X-Inumbo-ID: 7deb9c1f-2946-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
        bh=0YN6pdbUMWwP22LK5vInS861cQR+zwOyt+mGgXSMMMQ=;
        b=A9l5kZQJ4Dq/0k9hze3V/Bf5aK61/VUNyi9rWC9/sEbKPG303jOLZopBpku/LKoTFi
         yYPup9i4zMzmCU+H+C0CyerSMX2JtRZqMMAb+6DnIDK+nz0NRxC2MEOEVrlbbUQx/n9E
         nHWnO61NSTjOle8H5wI2/Z01KR/yBCKuX96DKEBTwp6YmLGlVSZ4zcZjzMB5hf09Ij1p
         qz4tF490+DqZyPBYecCMmiNZWjy5gzjGAt6TrpqZDrOAkuYJ0pU7NIXdktB/P4H4agK6
         FYPyHwvuW8vl9x6nMW3YXw+X2i5XAkKqZiMpuZnBN7iWnW4FqHV6Jg/9pvrSkzBsNZHu
         9eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date;
        bh=0YN6pdbUMWwP22LK5vInS861cQR+zwOyt+mGgXSMMMQ=;
        b=i4HvVOUPvYfHIDvn8FeAI0yPYGHpVk78/sz8Otk+gFLNAlNdIUbjDIqfd1Uj/KPmaS
         8P3ga7lMnWdqo1JkizMJD0puUexeLQOaPY4IS4DT3/4hbX9kQi5hmpWS1v0TD/Paf2rm
         nBRCR2qcQfGLej7xNeSBpNbdlDTGTOd5ICh1SdjBrKVPXLo00HDxjbfG5jfY4/z+MNVu
         jnCYMXB9Cd9ZmQWw+1UkQ/I5I4u822C9/EP5/37plwzgtVRTyZ1tAqGGsIAZDzFv38Xp
         0BVz1eHsaDa9Z9t9uh/6BAyg5A4FGRQZFv5FRYF4B8Z7LIP+424pivyzWuEgDEpuMD7v
         q06A==
X-Gm-Message-State: ACgBeo3/FFvdFgHGwmkpgo3lP+X8yCWXgHSP32qsG3XjwJKajE33EXN0
	E5ku6w0vHIY9bJtPgQJ8DFWdbQ==
X-Google-Smtp-Source: AA6agR5UMv9VbNtyXCUmLERehOYjp1CfN7QP6wWG3IQVnFp1jxC4R3yNkzvaI0fBL+k4tiks0ES2Og==
X-Received: by 2002:a05:600c:3d93:b0:3a5:eb9b:b495 with SMTP id bi19-20020a05600c3d9300b003a5eb9bb495mr2417150wmb.91.1661961825165;
        Wed, 31 Aug 2022 09:03:45 -0700 (PDT)
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com>
 <877d2xj23o.fsf@linaro.org>
 <edc33ca4-135e-111a-e198-38b9bae53005@suse.com>
 <87y1vdh9or.fsf@linaro.org>
 <9697a559-fe42-3efb-5715-1f6bc631f57d@suse.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Stratos-dev@op-lists.linaro.org" <Stratos-dev@op-lists.linaro.org>,
 "mathieu.poirier@linaro.com" <mathieu.poirier@linaro.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
Date: Wed, 31 Aug 2022 17:02:03 +0100
In-reply-to: <9697a559-fe42-3efb-5715-1f6bc631f57d@suse.com>
Message-ID: <875yi8pfhc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Juergen Gross <jgross@suse.com> writes:

> [[PGP Signed Part:Undecided]]
> On 24.08.22 17:58, Alex Benn=C3=A9e wrote:
>> Juergen Gross <jgross@suse.com> writes:
>>=20
>>> [[PGP Signed Part:Undecided]]
>>> On 24.08.22 13:22, Alex Benn=C3=A9e wrote:
>>>> Andrew Cooper <Andrew.Cooper3@citrix.com> writes:
>>>>
>>>>> On 24/08/2022 10:19, Viresh Kumar wrote:
>>>>>> On 24-03-22, 06:12, Juergen Gross wrote:
>>>>>>> For a rather long time we were using "normal" user pages for this p=
urpose,
>>>>>>> which were just locked into memory for doing the hypercall.
>>>>>>>
>>>>>>> Unfortunately there have been very rare problems with that approach=
, as
>>>>>>> the Linux kernel can set a user page related PTE to invalid for sho=
rt
>>>>>>> periods of time, which led to EFAULT in the hypervisor when trying =
to
>>>>>>> access the hypercall data.
>>>>>>>
>>>>>>> In Linux this can avoided only by using kernel memory, which is the
>>>>>>> reason why the hypercall buffers are allocated and mmap()-ed throug=
h the
>>>>>>> privcmd driver.
>>>>>> Hi Juergen,
>>>>>>
>>>>>> I understand why we moved from user pages to kernel pages, but I don=
't
>>>>>> fully understand why we need to make two separate calls to map the
>>>>>> guest memory, i.e. mmap() followed by ioctl(IOCTL_PRIVCMD_MMAPBATCH).
>>>>>>
>>>>>> Why aren't we doing all of it from mmap() itself ? I hacked it up to
>>>>>> check on it and it works fine if we do it all from mmap() itself.
>>>> As I understand it the MMAPBATCH ioctl is being treated like every
>>>> other
>>>> hypercall proxy through the ioctl interface. Which makes sense from the
>>>> point of view of having a consistent interface to the hypervisor but n=
ot
>>>> from point of view of providing a consistent userspace interface for
>>>> mapping memory which doesn't care about the hypervisor details.
>>>> The privcmd_mmapbatch_v2 interface is slightly richer than what you
>>>> could expose via mmap() because it allows the handling of partial
>>>> mappings with what I presume is a per-page *err array. If you issued t=
he
>>>> hypercall directly from the mmap() and one of the pages wasn't mapped =
by
>>>> the hypervisor you would have to unwind everything before returning
>>>> EFAULT to the user.
>>>>
>>>>>> Aren't we abusing the Linux userspace ABI here ? As standard userspa=
ce
>>>>>> code would expect just mmap() to be enough to map the memory. Yes, t=
he
>>>>>> current user, Xen itself, is adapted to make two calls, but it breaks
>>>>>> as soon as we want to use something that relies on Linux userspace
>>>>>> ABI.
>>>>>>
>>>>>> For instance, in our case, where we are looking to create
>>>>>> hypervisor-agnostic virtio backends, the rust-vmm library [1] issues
>>>>>> mmap() only and expects it to work. It doesn't know it is running on=
 a
>>>>>> Xen system, and it shouldn't know that as well.
>>>>>
>>>>> Use /dev/xen/hypercall which has a sane ABI for getting "safe" memory.
>>>>> privcmd is very much not sane.
>>>>>
>>>>> In practice you'll need to use both.=C2=A0 /dev/xen/hypercall for get=
ting
>>>>> "safe" memory, and /dev/xen/privcmd for issuing hypercalls for now.
>>>> I'm unsure what is meant by safe memory here. privcmd_buf_mmap()
>>>> looks
>>>> like it just allocates a bunch of GFP_KERNEL pages rather than
>>>> interacting with the hypervisor directly. Are these the same pages that
>>>> get used when you eventually call privcmd_ioctl_mmap_batch()?
>>>
>>> privcmd_buf_mmap() is allocating kernel pages which are used for data b=
eing
>>> accessed by the hypervisor when doing the hypercall later. This is a ge=
neric
>>> interface being used for all hypercalls, not only for
>>> privcmd_ioctl_mmap_batch().
>>>
>>>> The fact that /dev/xen/hypercall is specified by xen_privcmdbuf_dev is=
 a
>>>> little confusing TBH.
>>>> Anyway the goal here is to provide a non-xen aware userspace with
>>>> standard userspace API to access the guests memory. Perhaps messing
>>>
>>> This is what the Xen related libraries are meant for. Your decision to
>>> ignore those is firing back now.
>> We didn't ignore them - the initial version of the xen-vhost-master
>> binary was built with the rust and linking to the Xen libraries. We are
>> however in the process of moving to more pure rust (with the xen-sys
>> crate being a pure rust ioctl/hypercall wrapper).
>
> Ah, okay, I wasn't aware of this.
>
>> However I was under the impression there where two classes of
>> hypercalls. ABI stable ones which won't change (which is all we are
>> planning to implement for xen-sys) and non-stable ABIs which would need
>> mediating by the xen libs. We are hoping we can do all of VirtIO with
>> just the stable ABI.
>
> Okay.
>
>>=20
>>>> around with the semantics of the /dev/xen/[hypercall|privcmd] devices
>>>> nodes is too confusing.
>>>> Maybe we could instead:
>>>>    1. Have the Xen aware VMM ask to make the guests memory visible to
>>>> the
>>>>       host kernels address space.
>>>
>>> Urgh. This would be a major breach of the Xen security concept.
>>>
>>>>    2. When this is done explicitly create a device node to represent i=
t (/dev/xen/dom-%d-mem?)
>>>>    3. Pass this new device to the non-Xen aware userspace which uses t=
he
>>>>       standard mmap() call to make the kernel pages visible to userspa=
ce
>>>> Does that make sense?
>>>
>>> Maybe from your point of view, but not from the Xen architectural point
>>> of view IMHO. You are removing basically the main security advantages of
>>> Xen by generating a kernel interface for mapping arbitrary guest memory
>>> easily.
>> We are not talking about doing an end-run around the Xen
>> architecture.
>> The guest still has to instruct the hypervisor to grant access to its
>> memory. Currently this is a global thing (i.e. whole address space or
>> nothing) but obviously more fine grained grants can be done on a
>> transaction by transaction basis although we are exploring more
>> efficient mechanisms for this (shared pools and carve outs).
>
> Happy to hear that.
>
>> This does raise questions for the mmap interface though - each
>> individually granted region would need to be mapped into the dom0
>> userspace virtual address space or perhaps a new flag for mmap() so we
>> can map the whole address space but expect SIGBUS faults if we access
>> something that hasn't been granted.
>
> Do I understand that correctly? You want the guest to grant a memory
> region to the backend, and the backend should be able to map this region
> not using grants, but the guest physical addresses?

Yes - although it doesn't have to be the whole GPA range. The vhost-user
protocol communicates what offset into the GPA space the various memory
regions exist at.

>
>
> Juergen
>
> [2. OpenPGP public key --- application/pgp-keys; OpenPGP_0xB0DE9DD628BF13=
2F.asc]...
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

