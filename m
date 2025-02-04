Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945CA274C0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 15:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881646.1291816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKCC-0002H7-96; Tue, 04 Feb 2025 14:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881646.1291816; Tue, 04 Feb 2025 14:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKCC-0002D8-5F; Tue, 04 Feb 2025 14:46:36 +0000
Received: by outflank-mailman (input) for mailman id 881646;
 Tue, 04 Feb 2025 14:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CkjP=U3=bounce.vates.tech=bounce-md_30504962.67a22847.v1-4c5cbc0a07684ad2957193fd2a558be5@srs-se1.protection.inumbo.net>)
 id 1tfKCA-0000sX-7p
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 14:46:34 +0000
Received: from mail145-20.atl61.mandrillapp.com
 (mail145-20.atl61.mandrillapp.com [198.2.145.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d31d742e-e306-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 15:46:33 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-20.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4YnR5M3ZD4zCf9Xsl
 for <xen-devel@lists.xenproject.org>; Tue,  4 Feb 2025 14:46:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4c5cbc0a07684ad2957193fd2a558be5; Tue, 04 Feb 2025 14:46:31 +0000
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
X-Inumbo-ID: d31d742e-e306-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1738680391; x=1738950391;
	bh=hhom3KKYrFZbq8NgxfUhw5QnVCOzyHXQRBvALWglcIw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LfwZ01OHG7lCcsqDaAq03JVTX8AF/Yif7LFMUOBesWe0f5/xNOXTX3rpMYQrbUYqc
	 d+Ixbk2pwUt+N+XqkTr/km5klCD3xchLnkgAWlChTA6fxTqo6Krgv1Gqx3gOPECRAR
	 h0WBSjRHcVQ0JP9coEFDU3LxNHq3BUjUFlqdobFU+Iq/DmhfEyrbBt44AfyQCP3gVK
	 2YAcjovrja3CgaIJxjALX8Is9ab4wpja293ONuAkAB5pU7QO9ud38j7+pEq4rj3f9t
	 +dLtVrIOVokJKuLkUxhs0xFbsqt0wtbCuJRKkurcBIYHPTqX1u8k1pXIi4A/gu6ye3
	 Lnh/XTiZ320Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1738680391; x=1738940891; i=teddy.astie@vates.tech;
	bh=hhom3KKYrFZbq8NgxfUhw5QnVCOzyHXQRBvALWglcIw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=azayknkHPfwpBOIfPhZ3+ZhrRkB5xnVq/njAJfLDPhSt5NAdfR39mWs+WzBMXuDLY
	 OsFJi+VFXP/nRPxMSYYkm3HaFv5LtoEbjvfTfOZ1ijRGQd883kg0LTI0zNBazb9M4H
	 eu90cRkcV+zBd2ny82pHrmghxavFxfzRoUBkuKEagqFsX1QyrI1CIcAXS9J9EDYu+q
	 TK14+3gJb+AxnKvlx/q1/LG36Pv5SAWOjSPx6KfKRNte/y0SpziP/8KKbDvNVBksup
	 OSm1oDf1LTYeJWzteB5nd84/YpSwfLR7dcsvcxEbFpZiGmpKggmhOjkalo4rvQIjx3
	 s+uJenfnCxoLQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20RFC=20PATCH=20v5=203/5]=20xen/public:=20Introduce=20PV-IOMMU=20hypercall=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1738680389983
Message-Id: <07423892-7f23-4e57-b1e9-4ef0fe45d6bc@vates.tech>
To: "Stefano Stabellini" <sstabellini@kernel.org>
Cc: "Jason Andryuk" <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
References: <cover.1737470269.git.teddy.astie@vates.tech> <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech> <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com> <c4351594-e394-4949-8dd1-20cce54ec192@vates.tech> <alpine.DEB.2.22.394.2502030939470.11632@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2502030939470.11632@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4c5cbc0a07684ad2957193fd2a558be5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250204:md
Date: Tue, 04 Feb 2025 14:46:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Stefano,

Le 03/02/2025 =C3=A0 18:47, Stefano Stabellini a =C3=A9crit=C2=A0:
> On Mon, 3 Feb 2025, Teddy Astie wrote:
>> Hello Jason,
>>
>> Le 30/01/2025 =C3=A0 21:17, Jason Andryuk a =C3=A9crit=C2=A0:
>>> Hi Teddy,
>>>
>>> Thanks for working on this.=C2=A0 I'm curious about your plans for this=
:
>>>
>>> On 2025-01-21 11:13, Teddy Astie wrote:
>>>> +/**
>>>> + * IOMMU_alloc_nested
>>>> + * Create a nested IOMMU context (needs IOMMUCAP_nested).
>>>> + *
>>>> + * This context uses a platform-specific page table from domain
>>>> address space
>>>> + * specified in pgtable_gfn and use it for nested translations.
>>>> + *
>>>> + * Explicit flushes needs to be submited with IOMMU_flush_nested on
>>>> + * modification of the nested pagetable to ensure coherency between
>>>> IOTLB and
>>>> + * nested page table.
>>>> + *
>>>> + * This context can be destroyed using IOMMU_free_context.
>>>> + * This context cannot be modified using map_pages, unmap_pages.
>>>> + */
>>>> +struct pv_iommu_alloc_nested {
>>>> +=C2=A0=C2=A0=C2=A0 /* OUT: allocated IOMMU context number */
>>>> +=C2=A0=C2=A0=C2=A0 uint16_t ctx_no;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* IN: guest frame number of the nested page table=
 */
>>>> +=C2=A0=C2=A0=C2=A0 uint64_aligned_t pgtable_gfn;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 /* IN: nested mode flags */
>>>> +=C2=A0=C2=A0=C2=A0 uint64_aligned_t nested_flags;
>>>> +};
>>>> +typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
>>>> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
>>>
>>> Is this command intended to be used for GVA -> GPA translation?=C2=A0 W=
ould
>>> you need some way to associate with another iommu context for GPA -> HP=
A
>>> translation?
>>>
>>
>> It's intended to be used for accelerating IOMMU emulation for the guest.
>> So in this case the other GPA->HPA translation is domain's p2m
>> page-table (or something similar) such as the translations made from
>> this nested context is meaningful from guest point of view.
>>
>> The idea to use it is to use the "remote_op" sub-command to let the
>> device model (e.g QEMU) alter the IOMMU behavior for the affected domain
>> (e.g by reattaching devices, making new IOMMU contexts, ...).
>>
>> I think it can also be used for virtio-iommu pagetable.
>>
>>> Maybe more broadly, what are your goals for enabling PV-IOMMU?=C2=A0 Th=
e
>>> examples on your blog post cover a domain restrict device access to
>>> specific portions of the the GPA space.=C2=A0 Are you also interested i=
n GVA
>>> -> GPA?=C2=A0 Does VFIO required GVA -> GPA?
>>>
>>
>> The current way of enabling and using PV-IOMMU is with the dedicated
>> Linux IOMMU driver [1] that implements Linux's IOMMU subsystem with this
>> proposed interface.
>> This in practice in the PV case replaces the xen-swiotlb with dma-iommu
>> and do all DMA through the paravirtualized IOMMU (e.g creating DMA
>> domains, moving devices to it).
>>
>> Regarding GVA->GPA, this is what this interface provides, and
>> restricting device access to memory is one way of using it. This is a
>> requirement for VFIO (as it is also one for Linux IOMMU), and I managed
>> to make SPDK and DPDK work in Dom0 using VFIO and these patches [2].
> 
> Thanks for the explanation, Teddy. It certainly seems that this work is
> moving in the right direction. However, I have a couple of questions on
> this point, as I admit that I have not fully understood it.
> 
> Modern IOMMUs support two stages of translation. Using ARM terminology,
> these are referred to as stage2 and stage1. The stage2 translation is
> used by Xen for the domain's GPA->PA (p2m) mapping. The pagetable used
> for stage2 could potentially be shared with the pagetable used by Xen
> for the p2m. Stage1 is typically controlled by the guest for its own
> address translations, mapping guest virtual addresses (GVA) to guest
> physical addresses (GPA).
> 
> I can see that this patch series introduces an interface that allows
> Dom0 to modify its own stage2 mappings.
> 
> My question is: how do we allow the domain to also set up stage1
> mappings? I would assume that the interface would take the form of a
> hypercall that allows a domain to pass a stage1 pagetable pointer, which
> Xen would then use to configure the IOMMU stage1. However, I do not see
> such a hypercall in your series. I was under the impression that
> GVA-to-GPA translation was left as future work, so I am confused by your
> statement that this patch series already provides it.
> 

There are 2 interfaces for the guest (and device model) to configure its 
GVA-to-GPA mappings. There are map/unmap subcommands and (depending on 
hardware support) nested iommu contexts where the guest/device model 
provides the GPA of the stage1 pagetable (this is meant to be a way of 
accelerating IOMMU emulation through QEMU).

Here is the hypercall subcommands for map/unmap where you can map and 
unmap pages to the "paravirtualized IOMMU context" (making the mapped 
region visible to devices of the context attached through reattach_device).

/**
  * IOMMU_map_pages
  * Map pages on a IOMMU context.
  *
  * pgsize must be supported by pgsize_mask.
  * Fails with -EINVAL if mapping on top of another mapping.
  * Report actually mapped page count in mapped field (regardless of 
failure).
  */
struct pv_iommu_map_pages {
     /* IN: IOMMU context number */
     uint16_t ctx_no;

     /* IN: Guest frame number */
     uint64_aligned_t gfn;

     /* IN: Device frame number */
     uint64_aligned_t dfn;

     /* IN: Map flags */
     uint32_t map_flags;

     /* IN: Size of pages to map */
     uint32_t pgsize;

     /* IN: Number of pages to map */
     uint32_t nr_pages;

     /* OUT: Number of pages actually mapped */
     uint32_t mapped;
};
typedef struct pv_iommu_map_pages pv_iommu_map_pages_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_map_pages_t);

/**
  * IOMMU_unmap_pages
  * Unmap pages on a IOMMU context.
  *
  * pgsize must be supported by pgsize_mask.
  * Report actually unmapped page count in mapped field (regardless of 
failure).
  * Fails with -ENOENT when attempting to unmap a page without any mapping
  */
struct pv_iommu_unmap_pages {
     /* IN: IOMMU context number */
     uint16_t ctx_no;

     /* IN: Device frame number */
     uint64_aligned_t dfn;

     /* IN: Size of pages to unmap */
     uint32_t pgsize;

     /* IN: Number of pages to unmap */
     uint32_t nr_pages;

     /* OUT: Number of pages actually unmapped */
     uint32_t unmapped;
};
typedef struct pv_iommu_unmap_pages pv_iommu_unmap_pages_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_unmap_pages_t);

If the hardware supports it, there is a alternative (still being 
drafted) interface to allow the guest to directly provide native pagetables=
.

This is exposed through the "_nested" subcommands, there is no 
implementation of this feature in this patch series yet.

/**
  * IOMMU_alloc_nested
  * Create a nested IOMMU context (needs IOMMUCAP_nested).
  *
  * This context uses a platform-specific page table from domain address 
space
  * specified in pgtable_gfn and use it for nested translations.
  *
  * Explicit flushes needs to be submited with IOMMU_flush_nested on
  * modification of the nested pagetable to ensure coherency between 
IOTLB and
  * nested page table.
  *
  * This context can be destroyed using IOMMU_free_context.
  * This context cannot be modified using map_pages, unmap_pages.
  */
struct pv_iommu_alloc_nested {
     /* OUT: allocated IOMMU context number */
     uint16_t ctx_no;

     /* IN: guest frame number of the nested page table */
     uint64_aligned_t pgtable_gfn;

     /* IN: nested mode flags */
     uint64_aligned_t nested_flags;
};
typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);

/**
  * IOMMU_flush_nested (needs IOMMUCAP_nested)
  * Flush the IOTLB for nested translation.
  */
struct pv_iommu_flush_nested {
     /* TODO */
};
typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);


> 
> 
> 
>> [1] Originally
>> https://lists.xen.org/archives/html/xen-devel/2024-06/msg01145.html but
>> this patch got quite old and probably doesn't work anymore with this new
>> Xen patch series.
>> I have a updated patch in my xen-pviommu branch
>> https://gitlab.com/xen-project/people/tsnake41/linux/-/commit/125d67a09f=
a9f66a32f9175641cfccca22dbbdb6
>>
>> [2] You also need to set "vfio_iommu_type1.allow_unsafe_interrupts=3D1" =
to
>> make VFIO work for now.

Thanks
Teddy



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


