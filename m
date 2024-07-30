Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC89412CF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 15:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767779.1178485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmbN-0002ox-0Z; Tue, 30 Jul 2024 13:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767779.1178485; Tue, 30 Jul 2024 13:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmbM-0002nL-Tm; Tue, 30 Jul 2024 13:09:16 +0000
Received: by outflank-mailman (input) for mailman id 767779;
 Tue, 30 Jul 2024 13:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jiA=O6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYmbL-0002mL-AZ
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 13:09:15 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea9cea48-4e74-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 15:09:13 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7ac449a0e6so352691966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 06:09:13 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadafd9asm641983766b.187.2024.07.30.06.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 06:09:12 -0700 (PDT)
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
X-Inumbo-ID: ea9cea48-4e74-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722344953; x=1722949753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro6z/9e5/hibNUVt5SiBLw+J/XDQ+lsrMmENtFUih+g=;
        b=ug4meu1bV1a5Pu40aV8LoYI4d3tjFXWgZOpVt+Cg5Qr6Gcg+xZ9mmTd3aY8VZGxlVI
         8riXMjFD1qFyK/1jRWHWO2Zm5Chh2jZaujUNUsDgphcgcRGtl+e3lj6r9hMenFYt/kof
         bf19ie51nbkz+GvP37Dw283Nyj3AKyc/jyXn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722344953; x=1722949753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro6z/9e5/hibNUVt5SiBLw+J/XDQ+lsrMmENtFUih+g=;
        b=WeFRPiB/+dtVULVxp9/3K6+Uy6x9W2a0h8Kxd8CpxT0VsGWQskHqGzE0vVe7QhVMcS
         nrg1BybYRUyxIW6wOB4K9DSoMCt3uSbPyxRl83WJmc9tWbBEO1njtGMgSltNrlaFuj8M
         dPCdwzOQClndB7qZ1GpxckmfO0UgwHHkRADbVqoYOrYFxMLJ9bpNivVo71gbFrENqwDI
         GoRnV5pzag6lcxaIbJSmL9N5uEvTbMmPIY7AyZJvxMsSZaZL+Qyk61j7b2+IG/ACCjA1
         xKoh9lY/HFcYZr93Y7ScxmazWxHfhRurxW1vvANevksitWw7IQGRX+GQejmrjNfoBqpF
         jDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRvsLnHNpi0Lmc2jK2ljCAohl4Lvcm8VLj3giy+zuoht8KZO8CDH0iasP9/HXP6QJh9vujehWY5JUWuUGHK46n5yv6FQoz7GxxLwiifDI=
X-Gm-Message-State: AOJu0YyXo4683ThWIQQYr+Wx5hjnoXUG/7Ltwry5tDjesvEADPylncRj
	HwIW+VUqaaU0ERxU6Bqqfk6Tloh/OyPCQ2SXMlUIfQPHQcZ1ziFE/cYwZbm5b5E=
X-Google-Smtp-Source: AGHT+IHZQ1MOB74cxyrTx6qGUyB1K8dRWzf9dhjFGCH93K5aY4Wxuv/N+Kr5mpdhUpeQvwSSafVFfQ==
X-Received: by 2002:a17:907:86a2:b0:a7a:d093:f843 with SMTP id a640c23a62f3a-a7d401605afmr709876966b.63.1722344952608;
        Tue, 30 Jul 2024 06:09:12 -0700 (PDT)
Message-ID: <d08179b1-a114-4ae9-a6da-e907f2c027c3@citrix.com>
Date: Tue, 30 Jul 2024 14:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240708114124.407797-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/07/2024 12:41 pm, Jiqian Chen wrote:
> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> a passthrough device by using gsi, see qemu code
> xen_pt_realize->xc_physdev_map_pirq and libxl code
> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
> is not allowed because currd is PVH dom0 and PVH has no
> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>
> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> PHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
> And add a new check to prevent (un)map when the subject domain
> doesn't have a notion of PIRQ.
>
> So that the interrupt of a passthrough device can be
> successfully mapped to pirq for domU with a notion of PIRQ
> when dom0 is PVH
>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  xen/arch/x86/hvm/hypercall.c |  6 ++++++
>  xen/arch/x86/physdev.c       | 12 ++++++++++--
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 0fab670a4871..03ada3c880bd 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -71,8 +71,14 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>      switch ( cmd )
>      {
> +        /*
> +        * Only being permitted for management of other domains.
> +        * Further restrictions are enforced in do_physdev_op.
> +        */
>      case PHYSDEVOP_map_pirq:
>      case PHYSDEVOP_unmap_pirq:
> +        break;
> +
>      case PHYSDEVOP_eoi:
>      case PHYSDEVOP_irq_status_query:
>      case PHYSDEVOP_get_free_pirq:
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index d6dd622952a9..9f30a8c63a06 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -323,7 +323,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( !d )
>              break;
>  
> -        ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
> +        /* Only mapping when the subject domain has a notion of PIRQ */
> +        if ( !is_hvm_domain(d) || has_pirq(d) )
> +            ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
> +        else
> +            ret = -EOPNOTSUPP;
>  
>          rcu_unlock_domain(d);
>  
> @@ -346,7 +350,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( !d )
>              break;
>  
> -        ret = physdev_unmap_pirq(d, unmap.pirq);
> +        /* Only unmapping when the subject domain has a notion of PIRQ */
> +        if ( !is_hvm_domain(d) || has_pirq(d) )
> +            ret = physdev_unmap_pirq(d, unmap.pirq);
> +        else
> +            ret = -EOPNOTSUPP;
>  
>          rcu_unlock_domain(d);
>  

Gitlab is displeased with your offering.

https://gitlab.com/xen-project/xen/-/pipelines/1393459622

This breaks both {adl,zen3p}-pci-hvm-x86-64-gcc-debug, and given the:

(XEN) [    8.150305] HVM restore d1: CPU 0
libxl: error: libxl_pci.c:1491:pci_add_dm_done: Domain
1:xc_physdev_map_pirq irq=18 (error=-1): Not supported
libxl: error: libxl_pci.c:1809:device_pci_add_done: Domain
1:libxl__device_pci_add failed for PCI device 0:3:0.0 (rc -3)
libxl: error: libxl_create.c:1962:domcreate_attach_devices: Domain
1:unable to add pci devices
libxl: error: libxl_xshelp.c:206:libxl__xs_read_mandatory: xenstore read
failed: `/libxl/1/type': No such file or directory
libxl: warning: libxl_dom.c:49:libxl__domain_type: unable to get domain
type for domid=1, assuming HVM
libxl: error: libxl_domain.c:1616:domain_destroy_domid_cb: Domain
1:xc_domain_destroy failed: No such process

I'd say that we're hitting the newly introduced -EOPNOTSUPP path.

In the test scenario, dom0 is PV, and it's an HVM domU which is breaking.

The sibling *-pci-pv-* tests (a PV domU) are working fine.

Either way, I'm going to revert this for now because clearly the "the
subject domain has a notion of PIRQ" hasn't been reasoned about
correctly, and it's important to keep Gitlab CI green across the board.

~Andrew

