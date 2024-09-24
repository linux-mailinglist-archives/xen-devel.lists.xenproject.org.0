Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580DE9849B9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803152.1213601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8VY-0003JE-1Q; Tue, 24 Sep 2024 16:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803152.1213601; Tue, 24 Sep 2024 16:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8VX-0003Hj-V9; Tue, 24 Sep 2024 16:35:23 +0000
Received: by outflank-mailman (input) for mailman id 803152;
 Tue, 24 Sep 2024 16:35:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1st8VW-0003Hd-Ev
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:35:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st8VW-000451-1s; Tue, 24 Sep 2024 16:35:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st8VV-0007Yc-SP; Tue, 24 Sep 2024 16:35:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=AsLC1RJ/xlze0yAmuf/+Ujl+D8hThvxhOlRdUmxpUMw=; b=QIHsn+iPqJvkJd7Y6ZUTJjatcU
	NtetXx2LPY9nn3JystwlcaPb/a20Kln58z0zukogZu7wyuM78OrDQMxK//FPF+OuELBjRRuXr7Nac
	Ep3R8tKoYB9jnHvyIO09we2QR6LRzqCa1fBblwt0exYZYog+lYbsdmpBSojr9iNI3f84=;
Message-ID: <465cb8b5-5f46-42ce-be8f-a38c1c23a805@xen.org>
Date: Tue, 24 Sep 2024 17:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/arm: Reserve resources for virtio-pci
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, dpsmith@apertussolutions.com,
 edgar.iglesias@amd.com
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-3-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240924162359.1390487-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Reserve memory ranges and interrupt lines for an externally
> emulated PCI controller (e.g by QEMU) dedicated to hosting
> Virtio devices and potentially other emulated devices.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   xen/include/public/arch-arm.h | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index e19f0251a6..654b827715 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -494,6 +494,20 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 952GB of RAM @ 8GB */
>   #define GUEST_RAM1_SIZE   xen_mk_ullong(0xee00000000)
>   
> +/* Virtio PCI - Ordered by decreasing size to keep things aligned */
> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE  xen_mk_ullong(0x43000000)
> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE  xen_mk_ullong(0x0f000000000)
> +#define GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE  xen_mk_ullong(0x100000000)
> +
> +#define GUEST_VIRTIO_PCI_ECAM_BASE      (GUEST_VIRTIO_PCI_PREFETCH_MEM_BASE + \
> +                                         GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE)
> +#define GUEST_VIRTIO_PCI_ECAM_SIZE      xen_mk_ullong(0x10000000)
> +
> +#define GUEST_VIRTIO_PCI_MEM_TYPE         xen_mk_ullong(0x02000000)
> +#define GUEST_VIRTIO_PCI_MEM_BASE         (GUEST_VIRTIO_PCI_ECAM_BASE + \
> +                                           GUEST_VIRTIO_PCI_ECAM_SIZE)
> +#define GUEST_VIRTIO_PCI_MEM_SIZE         xen_mk_ullong(0x00002000000)

Why is this specific to virtio PCI? However, I am not entirely convinced 
we should have a second PCI hostbridge exposed to the guest for a few 
reasons:
   1. This require to reserve yet another range in the address space 
(could be solved with a more dynamic layout)
   2. From your instructions, the guest needs to explicitly do a PCI rescan.

So rather than having a second hostbridge, have you considered to extend 
the existing hostbridge (implemented in Xen) to support a mix of 
physical PCI device and virtual one?

Cheers,

-- 
Julien Grall


