Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4148944C27
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 15:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769723.1180621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVRM-0003Rx-9i; Thu, 01 Aug 2024 13:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769723.1180621; Thu, 01 Aug 2024 13:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVRM-0003PX-6Q; Thu, 01 Aug 2024 13:01:56 +0000
Received: by outflank-mailman (input) for mailman id 769723;
 Thu, 01 Aug 2024 13:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8r7L=PA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZVRK-0003PH-Jd
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 13:01:54 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 389f8358-5006-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 15:01:52 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6b797fb1c4aso46999676d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 06:01:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb79e5600bsm27063906d6.33.2024.08.01.06.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 06:01:50 -0700 (PDT)
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
X-Inumbo-ID: 389f8358-5006-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722517311; x=1723122111; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Au+57fpcyFGJDnYuwgFlo6w8InT1GALMqmisZDjrkXQ=;
        b=k8jmb80I9NqTC0o79TNqL2Hof/f+8KP6zv3uELCrJW4BPga5qTw2hpchLOYIXbqRv+
         ohzFeu8l/3GsyEvw9SOb+gEeEm8oqw0Ba8NzpoBWZeIxrtKsM1MPceKrIplxK2nXkrkU
         o5wXg+4cXXaz95DuzB8Yq/i+I5s+bR3/UsOgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722517311; x=1723122111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au+57fpcyFGJDnYuwgFlo6w8InT1GALMqmisZDjrkXQ=;
        b=aTyE4DZ3oTQ1YQcj8Da6HJgZpeeiMhxC93/ezeuAI9ILOSNhRcEYc/Ohn5M2aWS0Cx
         FRgi+X0fMAFJ7KIDy3omrnl3GfvgZohR6QTzYpfJJsApQwNpoyuKOZ+UjIVQSTS44lVP
         L58uczvVuS5j3WWqA66FUACnF10wgzWYsF3sPeDdyYCLU6i4kYLaQMJ/9s9eFNIMhvTY
         eIGTnnaYXlDzwSuEp0FMaQe3MMmc0358A/d0D/UyGNv+bAo+xuBPHySJd8Rf0QBlAq4A
         5qSDNgFjbtRZQTlPCROjUc34J1qbwJ1KB4tWOXY9FfeQAh4NrB76B7XL4ggUqVhzA2/+
         dw+A==
X-Gm-Message-State: AOJu0YxkZD14eDE8jQGyPMgaMHIMfFte8E8JonEfPJ2aJlrcAFGupdCO
	L0XqhuXyMqsBl3Wmx5hb96d1Hg2LirVgSHFMi0vMOYtn5+f6XP0MRdftWtEAZ94=
X-Google-Smtp-Source: AGHT+IGJyBCskeQfAZU9MbzIRlHg5HY7Kq3D+91RyYQvg7ibc2kK1jj4Goe3NR+fPqn3Zdn6Kk18iA==
X-Received: by 2002:a05:6214:5988:b0:6b7:4319:ad6f with SMTP id 6a1803df08f44-6bb8d795792mr4514346d6.36.1722517311329;
        Thu, 01 Aug 2024 06:01:51 -0700 (PDT)
Date: Thu, 1 Aug 2024 15:01:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [RFC XEN PATCH v12 6/7] tools: Add new function to get gsi from
 dev
Message-ID: <ZquHNURGoADdCy6y@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-7-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240708114124.407797-7-Jiqian.Chen@amd.com>

On Mon, Jul 08, 2024 at 07:41:23PM +0800, Jiqian Chen wrote:
> When passthrough a device to domU, QEMU and xl tools use its gsi
> number to do pirq mapping, see QEMU code
> xen_pt_realize->xc_physdev_map_pirq, and xl code
> pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is got
> from file /sys/bus/pci/devices/<sbdf>/irq, that is wrong, because
> irq is not equal with gsi, they are in different spaces, so pirq
> mapping fails.
> 
> And in current codes, there is no method to get gsi for userspace.
> For above purpose, add new function to get gsi, and the
> corresponding ioctl is implemented on linux kernel side.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> ---
> RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
> https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
> This patch must be merged after the patch on linux kernel side
> 
> CC: Anthony PERARD <anthony@xenproject.org>
> Remaining comment @Anthony PERARD:
> Do I need to make " opening of /dev/xen/privcmd " as a single function, then use it in this
> patch and other libraries?
> ---
>  tools/include/xen-sys/Linux/privcmd.h |  7 ++++++
>  tools/include/xenctrl.h               |  2 ++
>  tools/libs/ctrl/xc_physdev.c          | 35 +++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
> index bc60e8fd55eb..4cf719102116 100644
> --- a/tools/include/xen-sys/Linux/privcmd.h
> +++ b/tools/include/xen-sys/Linux/privcmd.h
> @@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
>  	__u64 addr;
>  } privcmd_mmap_resource_t;
>  
> +typedef struct privcmd_gsi_from_pcidev {
> +	__u32 sbdf;
> +	__u32 gsi;
> +} privcmd_gsi_from_pcidev_t;
> +
>  /*
>   * @cmd: IOCTL_PRIVCMD_HYPERCALL
>   * @arg: &privcmd_hypercall_t
> @@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
>  	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
>  #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
>  	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
> +#define IOCTL_PRIVCMD_GSI_FROM_PCIDEV				\
> +	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_gsi_from_pcidev_t))
>  #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
>  	_IOC(_IOC_NONE, 'P', 0xFF, 0)
>  
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 9ceca0cffc2f..3720e22b399a 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1641,6 +1641,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
>                            uint32_t domid,
>                            int pirq);
>  
> +int xc_physdev_gsi_from_pcidev(xc_interface *xch, uint32_t sbdf);
> +
>  /*
>   *  LOGGING AND ERROR REPORTING
>   */
> diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
> index e9fcd755fa62..54edb0f3c0dc 100644
> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -111,3 +111,38 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
>      return rc;
>  }
>  
> +int xc_physdev_gsi_from_pcidev(xc_interface *xch, uint32_t sbdf)

FWIW, I'm not sure it's fine to use the xc_physdev prefix here, as
this is not a PHYSDEVOP hypercall.

As Anthony suggested, it would be better placed in xc_linux.c, and
possibly named xc_pcidev_get_gsi() or similar, to avoid polluting the
xc_physdev namespace.

Thanks, Roger.

