Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047D9A3BDB6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 13:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892757.1301706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkimS-0001NZ-Ot; Wed, 19 Feb 2025 12:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892757.1301706; Wed, 19 Feb 2025 12:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkimS-0001M2-Lz; Wed, 19 Feb 2025 12:02:20 +0000
Received: by outflank-mailman (input) for mailman id 892757;
 Wed, 19 Feb 2025 12:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLUF=VK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tkimQ-0001Lw-IT
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 12:02:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ac02c1b-eeb9-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 13:02:13 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so1499349f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 04:02:13 -0800 (PST)
Received: from [10.81.43.31] ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b43d4sm17401634f8f.4.2025.02.19.04.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 04:02:12 -0800 (PST)
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
X-Inumbo-ID: 5ac02c1b-eeb9-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739966532; x=1740571332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HxW+beVn0dxA7yYH15QpTw+HUY+6mkFier28qx62qRs=;
        b=KI1VR9RXl6DZ9I/XI4Q2LrXfRcGtwJoeGCdnOnNKLqInUcn9PZMPwzoo2WfHch0ZmA
         Hkw9i1uljTCwBJOWF/Bedp/KXUq9Ygw9JRthNjfHnPwrMqWMF7601RsPRAAnXgS5RCF5
         bss3AEj1EPymRFjwWMR4bIdUEGIpEiDxOXb3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966532; x=1740571332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxW+beVn0dxA7yYH15QpTw+HUY+6mkFier28qx62qRs=;
        b=M3FVG9PinZ1LKhDgIQYhg00eZqkUlV+3mzySTrnj5ew1fX0D3EgLp4rH69mClvRMz1
         DuhL4RhykM1fu9uZhDxnffEGqAfdBWfqVsg5L1YdoufUapwK6edvPwEpElSygSEOxor0
         uR6yJTz2gRhl/s0r3daigOQc1lZ+a5ssotYriUyIZE7uQN/dwjDVthrEDsYiU70SvcOm
         yZr9DkeAsO3EoVZ+5Ol5oyM3BzTqBtQZ/BdqIZfG3Oylcj20YooZppcffQG2HVdp9TEW
         HzNUBBWnqzTFFxxC4DtG+zxgi6OZz4C+YQjxtJVYDhGWGsUTwq+TaMwH/jrW0oq38Vh+
         +Teg==
X-Forwarded-Encrypted: i=1; AJvYcCVwCOpOi00Xzrjw7iYxq1QdEyeOiwjmShFHKt4H6mtyTlsrx5GjnEN4PIU0zyNGYZ/juVhKAXSUKVA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy3ag31R3Oyj6xXmotS5SDjATRHNbggR2rrrHXl4iz/zjIdiQ5
	ofj17Nt8VndNvNKQfx4hNM9eaAkZvnFgPX2DS3NgiX1bIUtl81iG8TSbdwJ4ZD8=
X-Gm-Gg: ASbGnct16KGpPaSRk1x4mrM5SN987mqH+IRAaiL8qvXwU7Eyh2P9bBCy3pRzBavA5s5
	2woc9Xu4J49tnpPHFZnMHK8v7s95xxpjSHYWEcInjjOyuOEOHUAY7q4p2jdU5mDZATI83m2tN5C
	i6RY8s3uxCNn26ipE9LA9awNWaH6r+Uhe0LeUr3SpDr2F222gn5bFnrvzWw0PmpN4ppdOw5DVh2
	8Z+4Bk2jlEvtClz8np3M+KPq0TA4YS2N/RXPzGif5lTuMack1LLnuQ7Fvqai5e6Hvb3LOncSwyW
	zbYGCtEjfYTf/HvVPnWuQH2v
X-Google-Smtp-Source: AGHT+IG7wSXuEB/1V9rp4kZtXDOs0+bSLMnl6kO0kAvzsiJW1aF1HoDvYtA+e9++PEtK0LvHbXUI4Q==
X-Received: by 2002:a05:6000:144e:b0:38d:d701:419c with SMTP id ffacd0b85a97d-38f33f437f2mr13729981f8f.41.1739966532575;
        Wed, 19 Feb 2025 04:02:12 -0800 (PST)
Message-ID: <67d00fac-5d10-49a9-bd15-035c6bb3db12@cloud.com>
Date: Wed, 19 Feb 2025 12:02:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC PATCH v6 02/11] docs/designs: Add a design document for
 PV-IOMMU
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1739785339.git.teddy.astie@vates.tech>
 <ddffc703f6919e8d8004cd58a682682e1e86ec80.1739785339.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Frediano Ziglio <frediano.ziglio@cloud.com>
In-Reply-To: <ddffc703f6919e8d8004cd58a682682e1e86ec80.1739785339.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/02/2025 10:18, Teddy Astie wrote:
> Some operating systems want to use IOMMU to implement various features (e.g
> VFIO) or DMA protection.
> This patch introduce a proposal for IOMMU paravirtualization for Dom0.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>   docs/designs/pv-iommu.md | 116 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 116 insertions(+)
>   create mode 100644 docs/designs/pv-iommu.md
> 
> diff --git a/docs/designs/pv-iommu.md b/docs/designs/pv-iommu.md
> new file mode 100644
> index 0000000000..7df9fa0b94
> --- /dev/null
> +++ b/docs/designs/pv-iommu.md
> @@ -0,0 +1,116 @@
> +# IOMMU paravirtualization for Dom0
> +
> +Status: Experimental
> +
> +# Background
> +
> +By default, Xen only uses the IOMMU for itself, either to make device adress
> +space coherent with guest adress space (x86 HVM/PVH) or to prevent devices

typo: adress -> address

> +from doing DMA outside it's expected memory regions including the hypervisor
> +(x86 PV).
> +
> +A limitation is that guests (especially privildged ones) may want to use

typo: privildged -> privileged

> +IOMMU hardware in order to implement features such as DMA protection and
> +VFIO [1] as IOMMU functionality is not available outside of the hypervisor
> +currently.
> +
> +[1] VFIO - "Virtual Function I/O" - https://www.kernel.org/doc/html/latest/driver-api/vfio.html
> +
> +# Design
> +
> +The operating system may want to have access to various IOMMU features such as
> +context management and DMA remapping. We can create a new hypercall that allows
> +the guest to have access to a new paravirtualized IOMMU interface.
> +
> +This feature is only meant to be available for the Dom0, as DomU have some
> +emulated devices that can't be managed on Xen side and are not hardware, we
> +can't rely on the hardware IOMMU to enforce DMA remapping.
> +
> +This interface is exposed under the `iommu_op` hypercall.
> +
> +In addition, Xen domains are modified in order to allow existence of several
> +IOMMU context including a default one that implement default behavior (e.g
> +hardware assisted paging) and can't be modified by guest. DomU cannot have
> +contexts, and therefore act as if they only have the default domain.
> +
> +Each IOMMU context within a Xen domain is identified using a domain-specific
> +context number that is used in the Xen IOMMU subsystem and the hypercall
> +interface.
> +
> +The number of IOMMU context a domain is specified by either the toolstack or
> +the domain itself.

I don't understand what you want express with the above sentence.
Maybe it's just me.

> +
> +# IOMMU operations
> +
> +## Initialize PV-IOMMU
> +
> +Initialize PV-IOMMU for the domain.
> +It can only be called once.
> +

Could this operation be done automatically on first context allocation ?

> +## Alloc context
> +
> +Create a new IOMMU context for the guest and return the context number to the
> +guest.
> +Fail if the IOMMU context limit of the guest is reached.
> +
> +A flag can be specified to create a identity mapping.
> +
> +## Free context
> +
> +Destroy a IOMMU context created previously.
> +It is not possible to free the default context.
> +
> +Reattach context devices to default context if specified by the guest.
> +
> +Fail if there is a device in the context and reattach-to-default flag is not
> +specified.
> +
> +## Reattach device
> +
> +Reattach a device to another IOMMU context (including the default one).
> +The target IOMMU context number must be valid and the context allocated.
> +
> +The guest needs to specify a PCI SBDF of a device he has access to.
> +
> +## Map/unmap page
> +
> +Map/unmap a page on a context.
> +The guest needs to specify a gfn and target dfn to map.
> +
> +Refuse to create the mapping if one already exist for the same dfn.
> +
> +## Lookup page
> +
> +Get the gfn mapped by a specific dfn.
> +
> +## Remote command
> +
> +Make a PV-IOMMU operation on behalf of another domain.
> +Especially useful for implementing IOMMU emulation (e.g using QEMU)
> +or initializing PV-IOMMU with enforced limits.
> +
> +# Implementation considerations
> +
> +## Hypercall batching
> +
> +In order to prevent unneeded hypercalls and IOMMU flushing, it is advisable to
> +be able to batch some critical IOMMU operations (e.g map/unmap multiple pages).
> +

I suppose that batching also implies preemption.

> +## Hardware without IOMMU support
> +
> +Operating system needs to be aware on PV-IOMMU capability, and whether it is
> +able to make contexts. However, some operating system may critically fail in
> +case they are able to make a new IOMMU context. Which is supposed to happen
> +if no IOMMU hardware is available.
> +
> +The hypercall interface needs a interface to advertise the ability to create
> +and manage IOMMU contexts including the amount of context the guest is able
> +to use. Using these informations, the Dom0 may decide whether to use or not
> +the PV-IOMMU interface.
> +
> +## Page pool for contexts
> +
> +In order to prevent unexpected starving on the hypervisor memory with a
> +buggy Dom0. We can preallocate the pages the contexts will use and make
> +map/unmap use these pages instead of allocating them dynamically.
> +

Regards,
   Frediano


