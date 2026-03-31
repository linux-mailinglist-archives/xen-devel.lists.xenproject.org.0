Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNwNMRyXy2mYJQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:42:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D73673C3
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268807.1558004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7VcB-00082P-23; Tue, 31 Mar 2026 09:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268807.1558004; Tue, 31 Mar 2026 09:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7VcA-00080W-Vd; Tue, 31 Mar 2026 09:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1268807;
 Tue, 31 Mar 2026 09:42:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69cb96fe.v1-52638ce042e943f3823308eb28947edd@bounce.vates.tech>)
 id 1w7Vc8-00080Q-N6
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:42:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Vc6-00EVxg-B7
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:42:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69cb96fe.v1-52638ce042e943f3823308eb28947edd@bounce.vates.tech>)
 id 69cb96f6-bab6-0a2a0a5309dd-0a2a4506ad36-18
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:42:23 +0200
Received: from [198.2.132.14] (helo=mail132-14.atl131.mandrillapp.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69cb96fe.v1-52638ce042e943f3823308eb28947edd@bounce.vates.tech>)
 id 69cb96fe-3034-0a2a45060019-c602840e8b19-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:42:23 +0200
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-14.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4flNSZ2Hqdz8XS1gG
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:42:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 52638ce042e943f3823308eb28947edd; Tue, 31 Mar 2026 09:42:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774950142; x=1775220142;
	bh=3QgvblZRN6364QSNdN+5EIl2FiHO33eGJxLYGl+92ks=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Bq7yUCFM20kCL6CPQJXf611Un+GYwgGR5ewS4M2DIEZwvof3LGMpO3PCjY3YyExxy
	 kmmiTHcMw13gmlGN5uX82wB6H+GqKBFcW+DB48AnlQ4fZE4IIHAT2dFLOuT81i0dML
	 sh5EUEka6mzEOEZZNUGqgZ2GpDNU7PBC/5uZMijvsEIVVlzxI4BP9DFEjMy4Dq+Pf4
	 4KgX4DOSErbuyp2HoD4iZazXKwCkPhm3dyg0ZFYE9IVYqZvcwJpPGd24mWHC9TG8YV
	 Cx1E5mOIGFTzBQ8tSCb228J/MT6ZathvYbqsuy6q9Pn6TaP57HDaqVEsSwHlmn2pn4
	 faow1I7tVh8pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774950142; x=1775210642; i=teddy.astie@vates.tech;
	bh=3QgvblZRN6364QSNdN+5EIl2FiHO33eGJxLYGl+92ks=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Bkj9YPnV0mnLac8LZvCOR926I4LR5uj7ZVUiphokpu1hDmgiCjvRdrL1qxKVn69Oy
	 dS4mQk3B8EWV3+dsvX4D7tKPnYtRZcdBmdZ7xYB+HDAK6J7G4cMiXbu0iJXL2auGPo
	 nmhiWyhHYJvKiUkYFXNX2BZ/tSUC7jd7yOBGsAU8++5QoP16R9ARUhPbpi5U5CHR9x
	 xUTcDRFTlMqOw6+X4eSekQoSlgIUl3+oWSWPug5iGUPL44F1uC7Km0/V/pZ3h0uh0N
	 3c9a1QItU/aRSh4y5bxxepXp5K24FZgZMfWfAPhbTcygTKiHTmE+gtaFdNzWQZgYrV
	 eZSvinDiyAgmQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Why=20memory=20lending=20is=20needed=20for=20GPU=20acceleration?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774950140736
Message-Id: <1de15ce0-9f7e-4253-80a7-ecd94caa4325@vates.tech>
To: "Val Packett" <val@invisiblethingslab.com>, "Demi Marie Obenour" <demiobenour@gmail.com>, "Xen developer discussion" <xen-devel@lists.xenproject.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, "Ariadne Conill" <ariadne@ariadne.space>
References: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com> <c38387fe-beef-4f50-b928-74f96b881b7a@gmail.com> <0bbf0349-1006-485f-a2db-6c8b795b4242@invisiblethingslab.com>
In-Reply-To: <0bbf0349-1006-485f-a2db-6c8b795b4242@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.52638ce042e943f3823308eb28947edd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260331:md
Date: Tue, 31 Mar 2026 09:42:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1774950143-7BE9E1C2-521428B3/0/0
X-purgate-type: clean
X-purgate-size: 8803
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@invisiblethingslab.com,m:demiobenour@gmail.com,m:xen-devel@lists.xenproject.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:ariadne@ariadne.space,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[invisiblethingslab.com,gmail.com,lists.xenproject.org,lists.freedesktop.org,kvack.org,ariadne.space];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:url];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.838];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 245D73673C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 30/03/2026 =C3=A0 22:13, Val Packett a =C3=A9crit=C2=A0:
> Hi,
> 
> On 3/29/26 2:32 PM, Demi Marie Obenour wrote:
>> On 3/24/26 10:17, Demi Marie Obenour wrote:
>>> Here is a proposed design document for supporting mapping GPU VRAM
>>> and/or file-backed memory into other domains.=C2=A0 It's not in the for=
m of
>>> a patch because the leading + characters would just make it harder to
>>> read for no particular gain, and because this is still RFC right now.
>>> Once it is ready to merge, I'll send a proper patch.=C2=A0 Nevertheless=
,
>>> you can consider this to be
>>>
>>> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
>>>
>>> This approach is very different from the "frontend-allocates"
>>> approach used elsewhere in Xen.=C2=A0 It is very much Linux-centric,
>>> rather than Xen-centric.=C2=A0 In fact, MMU notifiers were invented for
>>> KVM, and this approach is exactly the same as the one KVM implements.
>>> However, to the best of my understanding, the design described here is
>>> the only viable one.=C2=A0 Linux MM and GPU drivers require it, and cha=
nges
>>> to either to relax this requirement will not be accepted upstream.
>> Teddy Astie (CCd) proposed a couple of alternatives on Matrix:
>>
>> 1. Create dma-bufs for guest pages and import them into the host.
>>
>> =C2=A0=C2=A0=C2=A0 This is a win not only for Xen, but also for KVM.=C2=
=A0 Right now, shared
>> =C2=A0=C2=A0=C2=A0 (CPU) memory buffers must be copied from the guest to=
 the host,
>> =C2=A0=C2=A0=C2=A0 which is pointless.=C2=A0 So fixing that is a good th=
ing!=C2=A0 That said,
>> =C2=A0=C2=A0=C2=A0 I'm still concerned about triggering GPU driver code-=
paths that
>> =C2=A0=C2=A0=C2=A0 are not tested on bare metal.
> 
> To expand on this: the reason cross-domain Wayland proxies have been 
> doing this SHM copy dance was a deficiency in Linux UAPI. Basically, 
> applications allocate shared memory using local mechanisms like memfd 
> (and good old unlink-of-regular-file, ugh) which weren't compatible with 
> cross-VM sharing. However udmabuf should basically solve it, at least 
> for memfds. (I haven't yet investigated what happens with "unlinked 
> regular files" yet but I don't expect anything good there, welp.)
> 
> But I have landed a patch in Linux that removes a silly restriction that 
> tied dmabuf import into virtgpu to KMS-only mode:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/ 
> commit/?id=3Ddf4dc947c46bb9f80038f52c6e38cb2d40c10e50
> 
> And I have experimented with it and got a KVM-based VMM to successfully 
> access and print guest memfd contents that were passed to the host via 
> this mechanism. (Time to actually properly implement it into the full 
> system..)
> 
>> 2. Use PASID and 2-stage translation so that the GPU can operate in
>> =C2=A0=C2=A0=C2=A0 guest physical memory.
>> =C2=A0=C2=A0=C2=A0 This is also a win.=C2=A0 AMD XDNA absolutely require=
s PASID support,
>> =C2=A0=C2=A0=C2=A0 and apparently AMD GPUs can also use PASID.=C2=A0 So =
being able to use
>> =C2=A0=C2=A0=C2=A0 PASID is certainly helpful.
>>
>> However, I don't think either approach is sufficient for two reasons.
>>
>> First, discrete GPUs have dedicated VRAM, which Xen knows nothing about.
>> Only dom0's GPU drivers can manage VRAM, and they will insist on being
>> able to migrate it between the CPU and the GPU.=C2=A0 Furthermore, VRAM
>> can only be allocated using GPU driver ioctls, which will allocate
>> it from dom0-owned memory.
>>
>> Second, Certain Wayland protocols, such as screencapture, require 
>> programs
>> to be able to import dmabufs.=C2=A0 Both of the above solutions would
>> require that the pages be pinned.=C2=A0 I don't think this is an option,
>> as IIUC pin_user_pages() fails on mappings of these dmabufs.=C2=A0 It's =
why
>> direct I/O to dmabufs doesn't work.
>>
>> To the best of my knowledge, these problems mean that lending memory
>> is the only way to get robust GPU acceleration for both graphics and
>> compute workloads under Xen.=C2=A0 Simpler approaches might work for pur=
e
>> compute workloads, for iGPUs, or for drivers that have Xen-specific
>> changes.=C2=A0 None of them, however, support graphics workloads on dGPU=
s
>> while using the GPU driver the same way bare metal workloads do.
>> [=E2=80=A6]
> To recap, how virtio-gpu Host3d memory currently works with KVM is:
> 
> - the VMM/virtgpu receives a dmabuf over a socket (Wayland/D-Bus/ 
> whatever) and registers it internally with some resource ID that's 
> passed to the guest;
> - When the guest imports that resource, it calls 
> VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB to get a PRIME buffer that can be 
> turned into a dmabuf fd;
> - the VMM's handler for VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB (referencing 
> libkrun here) literally just calls mmap() on the host dmabuf, using the 
> MAP_FIXED flag to place it correctly inside of the VMM process's guest- 
> exposed VA region (configured via KVM_SET_USER_MEMORY_REGION);
> - so any resource imported by the guest, even before guest userspace 
> does mmap(), is mapped (as VM_PFNMAP|VM_IO) until the guest releases it.
> 
> So the generic kernel MM is out of the way, these mappings can't be 
> paged out to swap etc. But accessing them may fault, as the comment for 
> drm_gem_mmap_obj says:
> 
>  =C2=A0* Depending on their requirements, GEM objects can either
>  =C2=A0* provide a fault handler in their vm_ops (in which case any acces=
ses to
>  =C2=A0* the object will be trapped, to perform migration, GTT binding, s=
urface
>  =C2=A0* register allocation, or performance monitoring), or mmap the buf=
fer 
> memory
>  =C2=A0* synchronously after calling drm_gem_mmap_obj
> 
> It all "just works" in KVM because KVM's resolution of the guest's 
> memory accesses tries to be literally equivalent to what's mapped into 
> the userspace VMM process: hva_to_pfn_remapped explicitly calls 
> fixup_user_fault and eventually gets to the GPU driver's fault handler.
> 
> Now for Xen this would be=E2=80=A6 painful,
> 

indeed

> but,
> 
> we have no need to replicate what KVM does. That's far from the only 
> thing that can be done with a dmabuf.
> 
> The import-export machinery on the other hand actually does pin the 
> buffers on the driver level, importers are not obligated to support 
> movable buffers (move_notify in dma_buf_attach_ops=C2=A0is entirely optio=
nal).
> 

dma-buf is by concept non-movable if actively used (otherwise, it would 
break DMA). It's just a foreign buffer, and from device standpoint, just 
plain RAM that needs to be mapped.

> Interestingly, there is already XEN_GNTDEV_DMABUF=E2=80=A6
> 
> Wait, do we even have any reason at all to suspect 
> that=C2=A0XEN_GNTDEV_DMABUF doesn't already satisfy all of our buffer-sha=
ring 
> requirements?
> 

XEN_GNTDEV_DMABUF has been designed for GPU use-cases, and more 
precisely for paravirtualizing a display. The only issue I would have 
with it is that grants are not scalable for GPU 3D use cases (with 
hundreds of MB to share).
But we can still keep the concept of a structured guest-owned memory 
that is shared with Dom0 (but for larger quantities), I have some ideas 
regarding improving that area in Xen.

The only issue with changing the memory sharing model is that you would 
need to adjust the virtio-gpu aspect, but the rest can stay the same.

The biggest concern regarding driver compatibility is more about :
- can dma-buf be used as general buffers : probably yes (even with 
OpenGL/Vulkan); exception may be proprietary Nvidia drivers that lacks 
the feature; maybe very old hardware may struggle more with it
- can guest UMD work without access to vram : yes (apparently), AMDGPU 
has a special case where VRAM is not visible (e.g too small PCI BAR), 
there is vram size vs "vram visible size" (which could be 0); you could 
fallback vram-guest-visible with ram mapped on device
- can it be defined in Vulkan terms (from driver) : You can have 
device_local memory without having it host-visible (i.e memory exists, 
but can't be added in the guest). You would probably just lose some 
zero-copy paths with VRAM. Though you still have RAM shared with GPU 
(GTT in AMDGPU) if that matters.

Worth noting that if you're on integration graphics, you don't have VRAM 
and everything is RAM anyway.

> 
> Thanks,
> ~val
> 
> P.S. while I have everyone's attention, can I get some eyes on:
> https://lore.kernel.org/all/20251126062124.117425-1- 
> val@invisiblethingslab.com/ ?
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



