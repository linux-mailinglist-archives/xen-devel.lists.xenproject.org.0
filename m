Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D184259FFBD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 18:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392879.631493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQtVh-0005fI-Qq; Wed, 24 Aug 2022 16:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392879.631493; Wed, 24 Aug 2022 16:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQtVh-0005cc-NS; Wed, 24 Aug 2022 16:45:45 +0000
Received: by outflank-mailman (input) for mailman id 392879;
 Wed, 24 Aug 2022 16:45:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+X8Z=Y4=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1oQtVg-0005cW-63
 for xen-devel@lists.xen.org; Wed, 24 Aug 2022 16:45:44 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 314022f7-23cc-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 18:45:42 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id z2so22832527edc.1
 for <xen-devel@lists.xen.org>; Wed, 24 Aug 2022 09:45:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q5-20020aa7da85000000b0043cc66d7accsm3378590eds.36.2022.08.24.09.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 09:45:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9BB71FFB7;
 Wed, 24 Aug 2022 17:45:40 +0100 (BST)
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
X-Inumbo-ID: 314022f7-23cc-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc;
        bh=UgjvIqrQtNcadbWeHjfBrKm6JtfttRT4rLl7T5Ad7HA=;
        b=vzszSV3O4uOM9Q1FmqmjXpFK4yAwJf7GRmxdV1IxNqMg4Cnh/obMfWeYBkzOkMx+R8
         XVauv0cHJpCxUQbXhAZdkY4M9xS9PJdi7d1PpolHp2u9Zl8AUbrPxqYSDrQr865RQbCN
         jPf3EskE/Kll0v5PmxESgQ445LRU3i4IUbJiyPuZzu/wI8AIFEsew6YdhhvxHhGTE000
         RzVNWxLXeGXGjd/LOpMJkq49Rq6W/tqLJuincmPYdDSccCxwagad7cL+DB1NNC8e4pYB
         czjXr+pWLgTkFeEr0Ot6yw30s3P57lc64h9sKRhlAMp+CeolMYCIHv9GRnAHzNhqkORH
         IF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc;
        bh=UgjvIqrQtNcadbWeHjfBrKm6JtfttRT4rLl7T5Ad7HA=;
        b=4ADQ6SlY9r/tfVMBLyUrpIE0uIuISJbdi/1SPxg/qidFUZJWqBEyWhQDAysL/FgjwW
         Dm46mtMNeSYxUFawt2xFMtQ5WQ6fje6PglqaDATmPYphMcrvB+FP2Su4pj88rpwe98cV
         QdOI/X+EUopO7cx3lybNHVhleU+u5pW0zKwud+DBsZH6fOoUh2wRTdVtTkcL95652aIS
         1C4RC3wFcovBzWe8LkCYE58U/oJ5m/B683esI210QXP+QsqwJcMRk/vtjJonkMIN3DCq
         PIky2uG7eyVsHu4obFaCmADbGgHBp5PDPZ3BrpsEZjtEyTaRLb1r2cRp5ljNOLE3P/Oj
         49xw==
X-Gm-Message-State: ACgBeo1xrSyXMCyYJhg70O0EA2HxycXpILE8It97u1spnymszy9j7pj6
	5JHTJEz1nh0z6oq618Xk/fIZSg==
X-Google-Smtp-Source: AA6agR5U1eg5th4kiv4RzrvNQ23r/owNL+FRAAesd+J0ChtKZObJOnlmK80hBv5SiqUyL8aK6amf6w==
X-Received: by 2002:a05:6402:2813:b0:447:2be4:a5d0 with SMTP id h19-20020a056402281300b004472be4a5d0mr6399583ede.104.1661359542145;
        Wed, 24 Aug 2022 09:45:42 -0700 (PDT)
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com>
 <877d2xj23o.fsf@linaro.org>
 <edc33ca4-135e-111a-e198-38b9bae53005@suse.com>
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
Date: Wed, 24 Aug 2022 16:58:03 +0100
In-reply-to: <edc33ca4-135e-111a-e198-38b9bae53005@suse.com>
Message-ID: <87y1vdh9or.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Juergen Gross <jgross@suse.com> writes:

> [[PGP Signed Part:Undecided]]
> On 24.08.22 13:22, Alex Benn=C3=A9e wrote:
>> Andrew Cooper <Andrew.Cooper3@citrix.com> writes:
>>=20
>>> On 24/08/2022 10:19, Viresh Kumar wrote:
>>>> On 24-03-22, 06:12, Juergen Gross wrote:
>>>>> For a rather long time we were using "normal" user pages for this pur=
pose,
>>>>> which were just locked into memory for doing the hypercall.
>>>>>
>>>>> Unfortunately there have been very rare problems with that approach, =
as
>>>>> the Linux kernel can set a user page related PTE to invalid for short
>>>>> periods of time, which led to EFAULT in the hypervisor when trying to
>>>>> access the hypercall data.
>>>>>
>>>>> In Linux this can avoided only by using kernel memory, which is the
>>>>> reason why the hypercall buffers are allocated and mmap()-ed through =
the
>>>>> privcmd driver.
>>>> Hi Juergen,
>>>>
>>>> I understand why we moved from user pages to kernel pages, but I don't
>>>> fully understand why we need to make two separate calls to map the
>>>> guest memory, i.e. mmap() followed by ioctl(IOCTL_PRIVCMD_MMAPBATCH).
>>>>
>>>> Why aren't we doing all of it from mmap() itself ? I hacked it up to
>>>> check on it and it works fine if we do it all from mmap() itself.
>> As I understand it the MMAPBATCH ioctl is being treated like every
>> other
>> hypercall proxy through the ioctl interface. Which makes sense from the
>> point of view of having a consistent interface to the hypervisor but not
>> from point of view of providing a consistent userspace interface for
>> mapping memory which doesn't care about the hypervisor details.
>> The privcmd_mmapbatch_v2 interface is slightly richer than what you
>> could expose via mmap() because it allows the handling of partial
>> mappings with what I presume is a per-page *err array. If you issued the
>> hypercall directly from the mmap() and one of the pages wasn't mapped by
>> the hypervisor you would have to unwind everything before returning
>> EFAULT to the user.
>>=20
>>>> Aren't we abusing the Linux userspace ABI here ? As standard userspace
>>>> code would expect just mmap() to be enough to map the memory. Yes, the
>>>> current user, Xen itself, is adapted to make two calls, but it breaks
>>>> as soon as we want to use something that relies on Linux userspace
>>>> ABI.
>>>>
>>>> For instance, in our case, where we are looking to create
>>>> hypervisor-agnostic virtio backends, the rust-vmm library [1] issues
>>>> mmap() only and expects it to work. It doesn't know it is running on a
>>>> Xen system, and it shouldn't know that as well.
>>>
>>> Use /dev/xen/hypercall which has a sane ABI for getting "safe" memory.
>>> privcmd is very much not sane.
>>>
>>> In practice you'll need to use both.=C2=A0 /dev/xen/hypercall for getti=
ng
>>> "safe" memory, and /dev/xen/privcmd for issuing hypercalls for now.
>> I'm unsure what is meant by safe memory here. privcmd_buf_mmap()
>> looks
>> like it just allocates a bunch of GFP_KERNEL pages rather than
>> interacting with the hypervisor directly. Are these the same pages that
>> get used when you eventually call privcmd_ioctl_mmap_batch()?
>
> privcmd_buf_mmap() is allocating kernel pages which are used for data bei=
ng
> accessed by the hypervisor when doing the hypercall later. This is a gene=
ric
> interface being used for all hypercalls, not only for
> privcmd_ioctl_mmap_batch().
>
>> The fact that /dev/xen/hypercall is specified by xen_privcmdbuf_dev is a
>> little confusing TBH.
>> Anyway the goal here is to provide a non-xen aware userspace with
>> standard userspace API to access the guests memory. Perhaps messing
>
> This is what the Xen related libraries are meant for. Your decision to
> ignore those is firing back now.

We didn't ignore them - the initial version of the xen-vhost-master
binary was built with the rust and linking to the Xen libraries. We are
however in the process of moving to more pure rust (with the xen-sys
crate being a pure rust ioctl/hypercall wrapper).

However I was under the impression there where two classes of
hypercalls. ABI stable ones which won't change (which is all we are
planning to implement for xen-sys) and non-stable ABIs which would need
mediating by the xen libs. We are hoping we can do all of VirtIO with
just the stable ABI.

>> around with the semantics of the /dev/xen/[hypercall|privcmd] devices
>> nodes is too confusing.
>> Maybe we could instead:
>>   1. Have the Xen aware VMM ask to make the guests memory visible to
>> the
>>      host kernels address space.
>
> Urgh. This would be a major breach of the Xen security concept.
>
>>   2. When this is done explicitly create a device node to represent it (=
/dev/xen/dom-%d-mem?)
>>   3. Pass this new device to the non-Xen aware userspace which uses the
>>      standard mmap() call to make the kernel pages visible to userspace
>> Does that make sense?
>
> Maybe from your point of view, but not from the Xen architectural point
> of view IMHO. You are removing basically the main security advantages of
> Xen by generating a kernel interface for mapping arbitrary guest memory
> easily.

We are not talking about doing an end-run around the Xen architecture.
The guest still has to instruct the hypervisor to grant access to its
memory. Currently this is a global thing (i.e. whole address space or
nothing) but obviously more fine grained grants can be done on a
transaction by transaction basis although we are exploring more
efficient mechanisms for this (shared pools and carve outs).

This does raise questions for the mmap interface though - each
individually granted region would need to be mapped into the dom0
userspace virtual address space or perhaps a new flag for mmap() so we
can map the whole address space but expect SIGBUS faults if we access
something that hasn't been granted.

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

