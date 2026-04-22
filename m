Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJuHCbYs6GmYGQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 04:04:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A94413D7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 04:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289815.1569529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFMwg-0006EL-Gm; Wed, 22 Apr 2026 02:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289815.1569529; Wed, 22 Apr 2026 02:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFMwg-0006Br-Dn; Wed, 22 Apr 2026 02:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1289815;
 Wed, 22 Apr 2026 02:04:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alexdeucher@gmail.com>) id 1wFMwf-0006Bl-4u
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 02:04:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFMwe-00DtmP-35
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 04:04:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alexdeucher@gmail.com>)
 id 69e82c87-5cb7-0a2a0a5109dd-0a2a4507bc88-10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 04:04:03 +0200
Received: from [74.125.82.171] (helo=mail-dy1-f171.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <alexdeucher@gmail.com>)
 id 69e82c92-229c-0a2a45070019-4a7d52ab9515-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 04:04:03 +0200
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2bda3b4318dso666386eec.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 19:04:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776823441; cv=none;
        d=google.com; s=arc-20240605;
        b=SC+NlWRpaZ9nCQ9vzr4IaFDKZynKybHk0xetJfLMhhOuMUBzp/eArydioeQMARS4zu
         N2EvA7HDNnRAc5Jbl2g6WbqUk9quMpV0NirG+UOMwQ2FzWfwJnESKUnjjVMJ6gP1dnd4
         4J1mH6XEsFtHsSjIYymEnq9Vb6eeA3TPIrrKZRVxP9gFZC1Di9mTNwW6s6UEhF3T6sKs
         K06p9ThSZHqHurL4mbUzxtpXOJaKE5af2mCa+pSZw9aqG2hxXGiUF/rzoVEBK81QgJp6
         ehMdLALsnYMHIUlgej7lopDU2zzYbwmFQUsDqWBAo1O2uS1mLggFYb5IyuXA03ZwV6/Y
         1ECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KXwfE/915Iuu5tjJxurXwHhruslbzJKEkqu1zMBps88=;
        fh=CpAw+SYsjEz676Bl6KfZoxXcwV8K0Qi8/4Z/twG/sVI=;
        b=IBSyL1lcGNgf5g3bJsW7r46niTb2cE4h0QG0xyeLskF0wynosVGPMbC5uuw0D2xZSd
         x5Fn+lLoZlE8OTpNJye3R2eatBWCI5IVjxbyy6rckVCbDCyWQ2CjBA+ym0O5rHhFv4u2
         rgILLjFXfhrS9s0bgpjwNRYJuC4FkssVm8o9c1uuoHj+5nCAOqcR7Mi/iZm1hnBiLODI
         YDAWQAdZPn0d35ImQmO+6piwdpaEjMgKRfl7LaNL6ZiKw1jTDUcrPdTZ7+opx07CyQ/I
         3EaHQtAeXCsGyN0kBEmb4ddfN9A/YIIWgUUgSk6pLTzC7ma0fAXj6ZEO8lBzqEOJ1OgE
         EJ8w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776823441; x=1777428241; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXwfE/915Iuu5tjJxurXwHhruslbzJKEkqu1zMBps88=;
        b=sE0FhMJwupGGhzz68BWNt8O3+Fn3CikCVrlmsNsa/87CUvH+SAHeqdRCJP7pUWeo3q
         avlzT+NdiSI43P946NipQz+1w1ivkfGAr3e3FMSbilti6PN2A9eE4YsWO5WTm1M69QMb
         IMd2xv1x94R4X9U1RRhXFsCWMki8RNLGSXrABUHT1qlMTGDIlq17Vjz/n4DD5pXKhdRq
         3/Fk1kRcbhsmA/p5jOtwbdE6GTy7Ay9iJKFUyxRuvD5kyAqhGvS/if1/wxU6EuP89RDP
         kCRtRoeIUL+1sVdUIpu41EotCtY+qchCfcVb4GIyty3qfp/rGREfnpEC1YCjWKk+XGVr
         ITdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823441; x=1777428241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXwfE/915Iuu5tjJxurXwHhruslbzJKEkqu1zMBps88=;
        b=cuITAVMsRLvvV4gOAZJ9761tBXATjU21m6aDRHele3zSpg4MYwOaggWDMFHIv/tCxE
         INjYdKNiJ+SKqP+Wxq8qzfoqxFiSzeSj1JW8p3JbIc4TEWtPlohl+JimP0GeWzdkKnoF
         tuwSOuCWJHiE1RzLUYuualLPNVsnGf2ERlQyi/CxSK2o3HCb6Ny09wMa1FaIHPqMmrEz
         IRdPmgG83+DZONLewRN5GuI0RBmLcScBILGuxtpg1TSI4sQ9YqngbvKVt8/hJZGCKBA7
         W20ArEdKrroGrqYVmA0V9s5T9QFgVEBUDjEsGCWZpKJ/wUddOFxGn4ij0j0wDMoltrtJ
         FFWA==
X-Forwarded-Encrypted: i=1; AFNElJ8LFtF1TjBNO4I20y+uhXtnqrn6emCe3lFqRn7r4v+0WiAX11KYOPsDlo8nXaQzdH+Jf5HvYBtJrgc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywdyy4tlqom+sfhk9QNYM+J3rmeLQW1c1VI0pXn/f4EXTYB87PK
	jzODf9MS40VrQu0MeeiuyxUcxeqioS3fwPOJfmDghBQ1UVvlKQHkXxz7oCy8W8cZ0h9qgiDmBxp
	/er46nEWD+Ma5Zh0Yk6fBp8391SaxFRM=
X-Gm-Gg: AeBDievMK+IS09bXlmwrdghPzSsU5Xo+HMd2IkVBZ34U9EjYhNgjWMDJ4VAS4CR815/
	acTSGC5FqCTI4JnyzVFyBA4WAx/Du2bgbC7NcDYtlN0Pu9x/ZMHJgtqQ0P+LgTwEiCkTGwCt47b
	oEw8p41SkQgaUErlUviGw9Wg9XF5WwQQlmTWBDkufyE5vqEk5rGYdliZV7RNuN7ijqDIuoUCEye
	QKUdXC1YOF+yEtdX9EVi5+wD6k4GR0kjVQ5Kiob+D6/2nurgIzVMqnXRTQGc1hFc1os6y5WzR2g
	3WUz2rnF4nQGUdSuYmPehGlDgJySKDfFDuKCAhGGOjl632DPGsiK2Tn8nHpMRnB/IJi/Md1NcTJ
	fjsct
X-Received: by 2002:a05:7022:5f01:b0:12d:b654:8180 with SMTP id
 a92af1059eb24-12db65484bfmr455959c88.2.1776823441162; Tue, 21 Apr 2026
 19:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <a06133f7-3093-4733-9786-bc46c1453e06@gmail.com>
 <b8d04414-18b5-40f7-9ea2-88b30ff5bea0@amd.com> <c7865b27-6bf1-4df1-9520-c9ef6b3ef368@gmail.com>
 <4751cf03-d3c1-4d5d-af8e-39ad7c8ffb84@amd.com> <7472bfcf-8c22-4ac7-b903-a883cdb8f1c6@gmail.com>
 <8fe8b78b-5294-4319-af92-a4fb00527417@amd.com> <8846bac5-77ff-4439-ac5c-c33cdb4a94e3@gmail.com>
 <964c3670-fad3-44ce-bd93-2057bca2dcb8@amd.com> <08ad2301-3163-4497-8869-fa4cea30b384@gmail.com>
 <e5c00f2c-0819-48b4-b66e-71b9a40a7235@amd.com> <686713fc-c762-4b1b-88b2-d486d4f38ac6@gmail.com>
 <de6777c1-1165-4ace-a5a7-3004aa9ea8c5@invisiblethingslab.com> <d045e25d-0bc5-4056-b4a2-9eda73fb5be7@gmail.com>
In-Reply-To: <d045e25d-0bc5-4056-b4a2-9eda73fb5be7@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Apr 2026 22:03:49 -0400
X-Gm-Features: AQROBzCq3JY-5ArkKnDyVVr-Wl_czV3R7nte4oTZblqOBZ3Fd9cc3qiKy3Gryh4
Message-ID: <CADnq5_Og_eAA2QkN_TM=AqY2rz_B6cwbm5tePzwrAXzK3BypGg@mail.gmail.com>
Subject: Re: Pinned, non-revocable mappings of VRAM: will bad things happen?
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Val Packett <val@invisiblethingslab.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, 
	Xen developer discussion <xen-devel@lists.xenproject.org>, linux-media@vger.kernel.org, 
	Suwit Semal <sumit.semwal@linaro.org>, 
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1776823443-2BB78C48-DC55805D/0/0
X-purgate-type: clean
X-purgate-size: 8296
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:val@invisiblethingslab.com,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:xen-devel@lists.xenproject.org,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:Pierre-eric.Pelloux-prayer@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 614A94413D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 9:34=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> On 4/21/26 12:55, Val Packett wrote:
> >
> > On 4/20/26 4:12 PM, Demi Marie Obenour wrote:
> >> On 4/20/26 14:53, Christian K=C3=B6nig wrote:
> >>> On 4/20/26 20:46, Demi Marie Obenour wrote:
> >>>> On 4/20/26 13:58, Christian K=C3=B6nig wrote:
> >>>>> On 4/20/26 19:03, Demi Marie Obenour wrote:
> >>>>>> On 4/20/26 04:49, Christian K=C3=B6nig wrote:
> >>>>>>> On 4/17/26 21:35, Demi Marie Obenour wrote:
> >>>>> ...
> >>>>>>>> Are any of the following reasonable options?
> >>>>>>>>
> >>>>>>>> 1. Change the guest kernel to only map (and thus pin) a small su=
bset
> >>>>>>>>     of VRAM at any given time.  If unmapped VRAM is accessed the=
 guest
> >>>>>>>>     traps the page fault, evicts an old VRAM mapping, and create=
s a
> >>>>>>>>     new one.
> >>>>>>> Yeah, that could potentially work.
> >>>>>>>
> >>>>>>> This is basically what we do on the host kernel driver when we ca=
n't resize the BAR for some reason. In that use case VRAM buffers are shuff=
led in and out of the CPU accessible window of VRAM on demand.
> >>>>>> How much is this going to hurt performance?
> >>>>> Hard to say, resizing the BAR can easily give you 10-15% more perfo=
rmance on some use cases.
> >>>>>
> >>>>> But that involves physically transferring the data using a DMA. For=
 this solution we basically only have to we basically only have to transfer=
 a few messages between host and guest.
> >>>>>
> >>>>> No idea how performant that is.
> >>>> In this use-case, 20-30% performance penalties are likely to be
> >>>> "business as usual".
> >>> Well that is quite a bit.
> >>>
> >>>> Close to native performance would be ideal, but
> >>>> to be useful it just needs to beat software rendering by a wide marg=
in,
> >>>> and not cause data corruption or vulnerabilities.
> >>> That should still easily be the case, even trivial use cases are mult=
iple magnitudes faster on GPUs compared to software rendering.
> >> Makes sense.  If only GPUs supported easy and flexible virtualization =
the way CPUs do :(.
> >>
> >>>>>>> But I have one question: When XEN has a problem handling faults f=
rom the guest on the host then how does that work for system memory mapping=
s?
> >>>>>>>
> >>>>>>> There is really no difference between VRAM and system memory in t=
he handling for the GPU driver stack.
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>> Christian.
> >>>>>> Generally, Xen makes the frontend (usually an unprivileged VM)
> >>>>>> responsible for providing mappings to the backend (usually the hos=
t).
> >>>>>> That is possible with system RAM but not with VRAM, because Xen ha=
s
> >>>>>> no awareness of VRAM.  To Xen, VRAM is just a PCI BAR.
> >>>>> No, that doesn't work with system memory allocations of GPU drivers=
 either.
> >>>>>
> >>>>> We already had it multiple times that people tried to be clever and=
 incremented the page reference counter on driver allocated system memory a=
nd were totally surprised that this can result in security issues and data =
corruption.
> >>>>>
> >>>>> I seriously hope that this isn't the case here again. As far as I k=
now XEN already has support for accessing VMAs with VM_PFN or otherwise I d=
on't know how driver allocated system memory access could potentially work.
> >>>>>
> >>>>> Accessing VRAM is pretty much the same use case as far as I can see=
.
> >>>>>
> >>>>> Regards,
> >>>>> Christian.
> >>>> The Xen-native approach would be for system memory allocations to
> >>>> be made using the Xen driver and then imported into the virtio-GPU
> >>>> driver via dmabuf.  Is there any chance this could be made to happen=
?
> >>> That could be. Adding Pierre-Eric to comment since he knows that use =
much better than I do.
> >>>
> >>>> If it's a lost cause, then how much is the memory overhead of pinnin=
g
> >>>> everything ever used in a dmabuf?  It should be possible to account
> >>>> pinned host memory against a guest's quota, but if that leads to an
> >>>> unusable system it isn't going to be good.
> >>> That won't work at all.
> >>>
> >>> We have use cases where you *must* migrate a DMA-buf to VRAM or other=
wise the GPU can't use it.
> >>>
> >>> A simple scanout to a monitor is such an use case for example, that i=
s usually not possible from system memory.
> >> Direct scanout isn't a concern here.
> >>
> >>>> Is supporting page faults in Xen the only solution that will be viab=
le
> >>>> long-term, considering the tolerance for very substantial performanc=
e
> >>>> overheads compared to native?  AAA gaming isn't the initial goal her=
e.
> >>>> Qubes OS already supports PCI passthrough for that.
> >>> We have AAA gaming working on XEN through native context working for =
quite a while.
> >>>
> >>> Pierre-Eric can tell you more about that.
> >>>
> >>> Regards,
> >>> Christian.
> >> I've heard of that, but last I checked it required downstream patches
> >> to Xen, Linux, and QEMU.  I don't know if any of those have been
> >> upstreamed since, but I believe that upstreaming the Xen and Linux
> >> patches (or rewriting them and upstreaming the rewritten version) woul=
d
> >> be necessary.  Qubes OS (which I don't work for anymore but still want
> >> to help with this) almost certainly won't be using QEMU for GPU stuff.
> >
> > Yeah, our plan is to use xen-vhost-frontend[1] + vhost-device-gpu,
> > ported/extended/modified as necessary. (I already have
> > xen-vhost-frontend itself working on amd64 PVH with purely xenbus-based
> > hotplug/configuration, currently working on cleaning up and submitting
> > the necessary patches.)
> >
> > I'm curious to hear more details about how AMD has it working but last
> > time I checked, there weren't any missing pieces in Xen or Linux that
> > we'd need.. The AMD downstream changes were mostly related to QEMU.
> >
> > As for the memory management concerns, I would like to remind everyone
> > once again that the pinning of GPU dmabufs in regular graphics workload=
s
> > would be *very* short-term. In GPU paravirtualization (native contexts
> > or venus or whatever else) the guest mostly operates on *opaque handles=
*
> > that refer to buffers owned by the host GPU process. The typical
> > rendering process (roughly) only involves submitting commands to the GP=
U
> > that refer to memory using these handles. Only upon mmap() would a
> > buffer be pinned/granted to the guest, and those are typically only use=
d
> > for *uploads* where the guest immediately does its memcpy() and unmaps
> > the buffer.
> >
> > So I'm not worried about (unintentionally) pinning too much GPU driver
> > memory.
> >
> > In terms of deliberate denial-of-service attacks from the guest to the
> > host, the only reasonable response is:
> >
> > =C2=AF\_(=E3=83=84)_/=C2=AF
> >
> > CPU-mapping lots of GPU memory is far from the only DoS vector, the GPU
> > commands themselves can easily wedge the GPU core in a million ways (an=
d
> > last time I checked amdgpu was noooot so good at recovering from hangs)=
.
> >
> >
> > [1]: https://github.com/vireshk/xen-vhost-frontend
> >
> > ~val
>
> I think it is best to handle things like GPU crashes by giving the guest
> some time to unmap its grants, and if that fails, crashing it.  This shou=
ld
> be done from a revoke callback, as afterwards the VRAM might get reused.
>
> Does amdgpu call revoke callbacks when the device is reset and VRAM
> is lost?  It seems like it at least ought to.
>
> As an aside, Qubes needs to use the process isolation mode of the
> amdgpu driver.  This means that only one process will be on the GPU
> at a time, so it _should_ be possible to blow away all GPU-resident
> state except VRAM without affecting other processes.  Unfortunately,
> I think AMD GPUs might have HW or FW limitations that prevent that,
> at least on dGPUs.

The driver has supported per queue resets for a few kernel releases
now so only the bad app would be affected in that case.

Alex

>
> It might make sense to recommend KDE with GPU acceleration.  KWin can
> recover from losing VRAM.
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)

