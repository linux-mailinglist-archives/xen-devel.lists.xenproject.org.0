Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F21A22541
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 21:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879331.1289549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdF5U-00010D-OO; Wed, 29 Jan 2025 20:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879331.1289549; Wed, 29 Jan 2025 20:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdF5U-0000y1-Kl; Wed, 29 Jan 2025 20:55:04 +0000
Received: by outflank-mailman (input) for mailman id 879331;
 Wed, 29 Jan 2025 20:55:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y68Q=UV=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1tdF5T-0000xv-1n
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 20:55:03 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e69a957-de83-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 21:55:01 +0100 (CET)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so259898276.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 12:55:01 -0800 (PST)
Received: from [10.138.7.94] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-6f757876fe8sm24376507b3.5.2025.01.29.12.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 12:54:59 -0800 (PST)
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
X-Inumbo-ID: 4e69a957-de83-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738184100; x=1738788900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueZk4UbNoQ80hfj8dpqw2VgMTf7ByqVqHJz79+NLnU0=;
        b=Ri6YLqj6rUh2n84QB3Pw+PLxd6CczL79GUFdFxStnUkXqGqksRuxbVwOLA3x54D8nY
         yOezGrqBYJ+G84ob4yvz/+9iWsFmWW3rsY01maO6laxW5Rqi2E+7uTIBjDFhg/1G/k8j
         Y/eM5E+ITQF+5VMb0t48SmcDg+rRKYy3LJLswxlfTPuHBnA6ApvjrxA5MVIc/Fx989Ub
         jx2fqaImVeMove3oLN53lBsyWc7S5XYID27zlx9h0fcaZE6lkIMTHYpoF2KA5zZOvEQ2
         btbyxqBrAANfTCwcX/pFYZu6Aiq1+chyLLvJFOLngqmnJIEa43gxee7+xyQjgkQfP6mF
         1drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738184100; x=1738788900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueZk4UbNoQ80hfj8dpqw2VgMTf7ByqVqHJz79+NLnU0=;
        b=mKbbk5yAJBGwchJh2kCvG/qJi73qaUTBDUV+JqyHxVB+Ou0HOZbui53e2bJiRCP976
         IDLNl0m9VWa7iddJPe4JHJ97E8/NrKEEIEs9k9lARIQrxEpU2QS9MwY7fFD6KarnW9jt
         h0OcbTrheIXcVtYroEjwbE/KmZmohiIspXEohnQblLXwy9cAYhQbNwXgz6wyQuvZ8OBM
         S3As10t3JAqUCGhKf/+3jCjlMlWE1FK3aUXUHaGPCF7Shsa3jELpllhgDAY6G1lmBsEE
         CnMlRu+5GVVIifdkeUNKxubuwQgHUPPTVRlGoTcK3JCK8YAUCTjvS6x7aELQItwhaVis
         Cr3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+KQDowGfOpo+Fh8wcUhqIok2xbLukJ7SzEkpTkXCpBDQReCwClOt7cECZ8fMcbOADrrMJXfXi1ko=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5rh8jMEGenIlDUYVcmyc5MQvP2uv5hNkphjQ3SxgY/kqmHa9p
	VdGGI95bsp/PjcVT20Oa347c2bmgdVMU6AQB/xjeEtUDzs+Y79t3
X-Gm-Gg: ASbGncsY40pcptJxImei45nwgx3gqMYFRC/zfODFoEZ8LOvqk2RF8t2GKHPjCKJWCpV
	4sMvQT8rPdMZewHHFvQV4rRL6fY+VjZcnakNv7QOaFmYJjm/0t4XxiFczD5FXOBDxSiZqBGEjNc
	eBbpbDzCr2fWRCJsYTVTt8y/53hjeqDafQvaEGtT+rB9bULuxqdcFxwxIsnPVE7FCqSj2qcSrr6
	ULCp3DUo6AFox2/B0T1Sae9kEnQswtARWERFDtjDvyF6mhu9y1m8cmLrf0uPbZUgMSvy8N/5ctW
	PlIVdwfFVG5e6w/X+cI=
X-Google-Smtp-Source: AGHT+IEWmX2x1u7n/vc0UVcEoX4V7EHvc3YO4LXHl+8qKvZBYQDsROpwgWkMjeON3KdFCpXBNEgtTQ==
X-Received: by 2002:a05:690c:4808:b0:6ef:4fba:8143 with SMTP id 00721157ae682-6f7a836fbafmr43773547b3.18.1738184100325;
        Wed, 29 Jan 2025 12:55:00 -0800 (PST)
Message-ID: <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com>
Date: Wed, 29 Jan 2025 15:54:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource
 object
Content-Language: en-US
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>, Huang Rui
 <ray.huang@amd.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Kernel KVM virtualization development <kvm@vger.kernel.org>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <Z36wV07M8B_wgWPl@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/8/25 12:05 PM, Simona Vetter wrote:
> On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wrote:
>>
>> On 2024/12/22 9:59, Demi Marie Obenour wrote:
>>> On 12/20/24 10:35 AM, Simona Vetter wrote:
>>>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>>>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>>>>
>>>>> A virtio-gpu userptr is based on HMM notifier.
>>>>> Used for let host access guest userspace memory and
>>>>> notice the change of userspace memory.
>>>>> This series patches are in very beginning state,
>>>>> User space are pinned currently to ensure the host
>>>>> device memory operations are correct.
>>>>> The free and unmap operations for userspace can be
>>>>> handled by MMU notifier this is a simple and basice
>>>>> SVM feature for this series patches.
>>>>> The physical PFNS update operations is splited into
>>>>> two OPs in here. The evicted memories won't be used
>>>>> anymore but remap into host again to achieve same
>>>>> effect with hmm_rang_fault.
>>>>
>>>> So in my opinion there are two ways to implement userptr that make sense:
>>>>
>>>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>>>    notifier
>>>>
>>>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>>>    page references or page pins at all, for full SVM integration. This
>>>>    should use hmm_range_fault ideally, since that's the version that
>>>>    doesn't ever grab any page reference pins.
>>>>
>>>> All the in-between variants are imo really bad hacks, whether they hold a
>>>> page reference or a temporary page pin (which seems to be what you're
>>>> doing here). In much older kernels there was some justification for them,
>>>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>>>> now all sorted out. So there's really only fully pinned, or true svm left
>>>> as clean design choices imo.
>>>>
>>>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>>>> you?
>>>
>>> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
>>> in complexity that pinning everything avoids.  Furthermore, this avoids the
>>> host having to take action in response to guest memory reclaim requests.
>>> This avoids additional complexity (and thus attack surface) on the host side.
>>> Furthermore, since this is for ROCm and not for graphics, I am less concerned
>>> about supporting systems that require swappable GPU VRAM.
>>
>> Hi Sima and Demi,
>>
>> I totally agree the flag FOLL_LONGTERM is needed, I will add it in next
>> version.
>>
>> And for the first pin variants implementation, the MMU notifier is also
>> needed I think.Cause the userptr feature in UMD generally used like this:
>> the registering of userptr always is explicitly invoked by user code like
>> "registerMemoryToGPU(userptrAddr, ...)", but for the userptr release/free,
>> there is no explicit API for it, at least in hsakmt/KFD stack. User just
>> need call system call "free(userptrAddr)", then kernel driver will release
>> the userptr by MMU notifier callback.Virtio-GPU has no other way to know if
>> user has been free the userptr except for MMU notifior.And in UMD theres is
>> no way to get the free() operation is invoked by user.The only way is use
>> MMU notifier in virtio-GPU driver and free the corresponding data in host by
>> some virtio CMDs as far as I can see.
>>
>> And for the second way that is use hmm_range_fault, there is a predictable
>> issues as far as I can see, at least in hsakmt/KFD stack. That is the memory
>> may migrate when GPU/device is working. In bare metal, when memory is
>> migrating KFD driver will pause the compute work of the device in
>> mmap_wirte_lock then use hmm_range_fault to remap the migrated/evicted
>> memories to GPU then restore the compute work of device to ensure the
>> correction of the data. But in virtio-GPU driver the migration happen in
>> guest kernel, the evict mmu notifier callback happens in guest, a virtio CMD
>> can be used for notify host but as lack of mmap_write_lock protection in
>> host kernel, host will hold invalid data for a short period of time, this
>> may lead to some issues. And it is hard to fix as far as I can see.
>>
>> I will extract some APIs into helper according to your request, and I will
>> refactor the whole userptr implementation, use some callbacks in page
>> getting path, let the pin method and hmm_range_fault can be choiced
>> in this series patches.
> 
> Ok, so if this is for svm, then you need full blast hmm, or the semantics
> are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userptr, this does
> not work.
> 
> The other option is that hsakmt/kfd api is completely busted, and that's
> kinda not a kernel problem.
> -Sima

On further thought, I believe the driver needs to migrate the pages to
device memory (really a virtio-GPU blob object) *and* take a FOLL_LONGTERM
pin on them.  The reason is that it isn’t possible to migrate these pages
back to "host" memory without unmapping them from the GPU.  For the reasons
I mention in [1], I believe that temporarily revoking access to virtio-GPU
blob objects is not feasible.  Instead, the pages must be treated as if
they are permanently in device memory until guest userspace unmaps them
from the GPU, after which they must be migrated back to host memory.

The problems with other approaches are most obvious if one considers a Xen
guest using a virtio-GPU backend that is not all-powerful.  Normal guest
memory is not accessible to the GPU, and Xen uses the IOMMU to enforce this
restriction.  Therefore, the guest must migrate pages to virtio-GPU blob
objects before the GPU can access them.  From Xen’s perspective, virtio-GPU
blob objects belong to the backend domain, so Xen allows the GPU to access
them.  However, the pages in blob objects _cannot_ be used in Xen grant table
operations, because Xen doesn’t consider them to belong to the guest!
Similarly, if the guest has an assigned PCI device, that device will not
be able to access the blob object’s pages.

I’m no expert on Linux memory management, so I’m not sure how to implement
this behavior.  What I _can_ say is that a blob object is I/O memory, and
behaves somewhat similar to a PCI BAR in a system with no P2PDMA support:
CPU access works, but DMA from other devices does not.  Furthermore, the
memory can’t be used for page tables or granted to other Xen guests, and it
will go away if the device is hot-unplugged.  In fact, if the PCI transport
is used, the blob object is located in the BAR of an (emulated) device.
There are non-PCI transports, though, so assuming that blob objects are
located in a PCI BAR is not a good idea.

The reason that pinning the objects in "device" memory is a reasonable
approach is that the host (or backend, in the Xen case) can still migrate
pages between device and host memory and not allocate backing store for
pages that are never accessed.  Therefore, it is not necessary for every
CPU access to go across the PCIe bus even for dGPUs.  Instead, if guest
CPU accesses are much more frequent than device accesses, the memory will
be migrated to the host side.  It’s up to the virtio-GPU backend
implementation to make sure that this happens.  For KVM, this should be
automatic, but for Xen, this might need additional Xen patches so that
the backend domain is notified when pages are accessed or dirtied.

[1]: https://lore.kernel.org/dri-devel/9572ba57-5552-4543-a3b0-6097520a12a3@gmail.com
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)

