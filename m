Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D2FA257F8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 12:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880539.1290617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teuTf-0004Rj-5I; Mon, 03 Feb 2025 11:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880539.1290617; Mon, 03 Feb 2025 11:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teuTf-0004QG-2Q; Mon, 03 Feb 2025 11:18:55 +0000
Received: by outflank-mailman (input) for mailman id 880539;
 Mon, 03 Feb 2025 11:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IEZt=U2=bounce.vates.tech=bounce-md_30504962.67a0a619.v1-8381e2f2b3f2487abf83eba9007394e0@srs-se1.protection.inumbo.net>)
 id 1teuTd-0004QA-B0
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 11:18:53 +0000
Received: from mail145-20.atl61.mandrillapp.com
 (mail145-20.atl61.mandrillapp.com [198.2.145.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4e73a32-e220-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 12:18:51 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-20.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4YmkX966SRzCf9KMf
 for <xen-devel@lists.xenproject.org>; Mon,  3 Feb 2025 11:18:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8381e2f2b3f2487abf83eba9007394e0; Mon, 03 Feb 2025 11:18:49 +0000
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
X-Inumbo-ID: a4e73a32-e220-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1738581529; x=1738851529;
	bh=ZezoM9ZT0ekiB/W70JdUQePB/ij6OOdEqVZbeq/Nq5c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LV901ssd0ZwtJFxmvT8LbLSU+19R/kn3sQ2+tQJMafSBNgUcVottYjBZLrkUDukH+
	 KFZdhfSgnaHhVyYoTCFxy/Z7lA2a16fBp7Ad8yPCaRCpD8kzIe/70pg7QSA804lexY
	 piAvdigAs9FEQNIsiqgaYJF5fh5ATdf+P3urpTAy8yrFnK7Sc/lPbf4NA0pLNBPTGc
	 nTyQVuY2Va+ew+3i54XJEzIc7K6364shIWPtUqjN6oq3ey8tsJZhOXxwyMWIbPde0O
	 mQzgcr29T8w4G0WKpts4cBWDP0et1X/7dt++M0Hl4ojbf+PAYmcNPQQjkve2dyh3O6
	 d9tjnWfeuvleA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1738581529; x=1738842029; i=teddy.astie@vates.tech;
	bh=ZezoM9ZT0ekiB/W70JdUQePB/ij6OOdEqVZbeq/Nq5c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EdpiXbMpbYh3Fiw/Bkeg6tWTXlMC2ATDGkTGz+6X6qHWB1X6JwzqPSwzPOHp4a+Zt
	 5HaH5tOQud/VANj4r9D14R20Mqorzo7uOjYcCfS9JNhtOmTW5+wb9xORyy4pcSlfxW
	 wiQyLbqgshdx4oc5aDL1j2MZdFzlvFx7ATQmVD3emYS3+7VhaAqdzOa9wSvBOTepZ5
	 qUEXe7Tw+HM4F9CvAyMfyAsOcjkVZ3Y8Ifk8Yv8vLxGH7+tFoPLG485pixaFjmdqGU
	 2snLgr5cyjPzIRUeqAV4F2rrrU/az1SrDgDdJKntEVsFP6hNewzmIFwj9RJcp1SuyJ
	 YXXv3nmnA+aKw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20RFC=20PATCH=20v5=203/5]=20xen/public:=20Introduce=20PV-IOMMU=20hypercall=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1738581524507
Message-Id: <c4351594-e394-4949-8dd1-20cce54ec192@vates.tech>
To: "Jason Andryuk" <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
References: <cover.1737470269.git.teddy.astie@vates.tech> <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech> <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com>
In-Reply-To: <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8381e2f2b3f2487abf83eba9007394e0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250203:md
Date: Mon, 03 Feb 2025 11:18:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Jason,

Le 30/01/2025 =C3=A0 21:17, Jason Andryuk a =C3=A9crit=C2=A0:
> Hi Teddy,
> 
> Thanks for working on this.=C2=A0 I'm curious about your plans for this:
> 
> On 2025-01-21 11:13, Teddy Astie wrote:
>> +/**
>> + * IOMMU_alloc_nested
>> + * Create a nested IOMMU context (needs IOMMUCAP_nested).
>> + *
>> + * This context uses a platform-specific page table from domain 
>> address space
>> + * specified in pgtable_gfn and use it for nested translations.
>> + *
>> + * Explicit flushes needs to be submited with IOMMU_flush_nested on
>> + * modification of the nested pagetable to ensure coherency between 
>> IOTLB and
>> + * nested page table.
>> + *
>> + * This context can be destroyed using IOMMU_free_context.
>> + * This context cannot be modified using map_pages, unmap_pages.
>> + */
>> +struct pv_iommu_alloc_nested {
>> +=C2=A0=C2=A0=C2=A0 /* OUT: allocated IOMMU context number */
>> +=C2=A0=C2=A0=C2=A0 uint16_t ctx_no;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* IN: guest frame number of the nested page table *=
/
>> +=C2=A0=C2=A0=C2=A0 uint64_aligned_t pgtable_gfn;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* IN: nested mode flags */
>> +=C2=A0=C2=A0=C2=A0 uint64_aligned_t nested_flags;
>> +};
>> +typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
>> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
> 
> Is this command intended to be used for GVA -> GPA translation?=C2=A0 Wou=
ld 
> you need some way to associate with another iommu context for GPA -> HPA 
> translation?
> 

It's intended to be used for accelerating IOMMU emulation for the guest. 
So in this case the other GPA->HPA translation is domain's p2m 
page-table (or something similar) such as the translations made from 
this nested context is meaningful from guest point of view.

The idea to use it is to use the "remote_op" sub-command to let the 
device model (e.g QEMU) alter the IOMMU behavior for the affected domain 
(e.g by reattaching devices, making new IOMMU contexts, ...).

I think it can also be used for virtio-iommu pagetable.

> Maybe more broadly, what are your goals for enabling PV-IOMMU?=C2=A0 The 
> examples on your blog post cover a domain restrict device access to 
> specific portions of the the GPA space.=C2=A0 Are you also interested in =
GVA 
> -> GPA?=C2=A0 Does VFIO required GVA -> GPA?
> 

The current way of enabling and using PV-IOMMU is with the dedicated 
Linux IOMMU driver [1] that implements Linux's IOMMU subsystem with this 
proposed interface.
This in practice in the PV case replaces the xen-swiotlb with dma-iommu 
and do all DMA through the paravirtualized IOMMU (e.g creating DMA 
domains, moving devices to it).

Regarding GVA->GPA, this is what this interface provides, and 
restricting device access to memory is one way of using it. This is a 
requirement for VFIO (as it is also one for Linux IOMMU), and I managed 
to make SPDK and DPDK work in Dom0 using VFIO and these patches [2].

[1] Originally 
https://lists.xen.org/archives/html/xen-devel/2024-06/msg01145.html but 
this patch got quite old and probably doesn't work anymore with this new 
Xen patch series.
I have a updated patch in my xen-pviommu branch
https://gitlab.com/xen-project/people/tsnake41/linux/-/commit/125d67a09fa9f=
66a32f9175641cfccca22dbbdb6

[2] You also need to set "vfio_iommu_type1.allow_unsafe_interrupts=3D1" to 
make VFIO work for now.

> And, sorry to bike shed, but ctx_no reads like "Context No" to me.=C2=A0 =
I 
> think ctxid/ctx_id might be clearer.=C2=A0 Others probably have their own=
 
> opinions :)
> 

ctxid/ctx_id would make more sense (we already have names like domid).

> Thanks,
> Jason

Thanks
Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


