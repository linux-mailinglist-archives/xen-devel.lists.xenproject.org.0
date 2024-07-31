Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E86C942862
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 09:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768258.1179028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ46T-0006Dy-EN; Wed, 31 Jul 2024 07:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768258.1179028; Wed, 31 Jul 2024 07:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ46T-0006Bg-B2; Wed, 31 Jul 2024 07:50:33 +0000
Received: by outflank-mailman (input) for mailman id 768258;
 Wed, 31 Jul 2024 07:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZ46S-0006Ba-Ht
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 07:50:32 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eeb18e3-4f11-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 09:50:30 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6b97097f7fdso34106006d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 00:50:30 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3faf453esm71481326d6.131.2024.07.31.00.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 00:50:29 -0700 (PDT)
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
X-Inumbo-ID: 8eeb18e3-4f11-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722412230; x=1723017030; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DXT14CdfpoGU7FzQLw0XkRt6FSOWSaAp0XKFGX7Sucw=;
        b=mghieoNvfksv0XPP2cltWQzqPWAcxbYQEdKDoRa4tbXy5JJoqH6D1V5mUPPXRa94RP
         D0Ip40AR9yo6lejMzeEdCrQkf2JppdytWOcNjXnIko/hewXt+chqiBMbeSTf6Yu17SB+
         /yrQWyi8JMN32nny4ugNcfFmgx/rykbyN3azk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412230; x=1723017030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXT14CdfpoGU7FzQLw0XkRt6FSOWSaAp0XKFGX7Sucw=;
        b=SiN+bDOlXw4+60IC7c5QS2O1eARgKHXYSBm5q1jvvf62brshTEqvzfDKQZnA1Ox7hb
         dXTLouTILu5K1YFdmPHmxkMwQHM5lqxEKrlA4SlucQjb4ItSBhsz8CfslmL0717s2YuR
         mV9fcey8KhzWTf2ItrA+eGVpqmbJAdd1Q8SY9HvG6zk+xz8AhdUDIdO2fZFvLNZBOc+z
         iMQyuuCrBZporT5PerP8j4S0fWB1dyYUUKFA3DquvDGNVGHOfdwxQSVHhrxBhSAb1EiX
         QJKZdMyUaYdnjLIJXfBN+s+2J3PmiGQ+6fLcAnPdJVMqRVNL8ez1v1xmrqXi/PaCnSHW
         bCEA==
X-Gm-Message-State: AOJu0YzZDOOwM4/vUSwToiCBF3XFfmVQ8fotM+wck0PEVZokt9kB/6do
	o08r7EvM6jt93jwK900tWX/UzrZz4WWrSc5QXn5hqw/I9BEWObMCe9ug17SnCj0=
X-Google-Smtp-Source: AGHT+IED3v6dpu2H30Wa/dLq0yWRyEaCgFCNe7dx7/R9Qu746b+AK0hmlAHQQKKjTy3KtWrq1SYX5g==
X-Received: by 2002:ad4:5ce3:0:b0:6b5:e9f9:f1b2 with SMTP id 6a1803df08f44-6bb559b7304mr222360496d6.13.1722412229518;
        Wed, 31 Jul 2024 00:50:29 -0700 (PDT)
Date: Wed, 31 Jul 2024 09:50:26 +0200
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
Subject: Re: [XEN PATCH v12 2/7] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Message-ID: <Zqnswi7ihOhMxPsi@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-3-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240708114124.407797-3-Jiqian.Chen@amd.com>

On Mon, Jul 08, 2024 at 07:41:19PM +0800, Jiqian Chen wrote:
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

I'm afraid this is not true.  It's fine to map interrupts to HVM
domains that don't have XENFEAT_hvm_pirqs enabled.  has_pirq() simply
allow HVM domains to route interrupts from devices (either emulated or
passed through) over event channels.

It might have worked in the past (when using a version of Xen < 4.19)
because XENFEAT_hvm_pirqs was enabled by default for HVM guests.

physdev_map_pirq() will work fine when used against domains that don't
have XENFEAT_hvm_pirqs enabled, and it needs to be kept this way.

I think you want to allow PHYSDEVOP_{,un}map_pirq for HVM domains, but
keep the code in do_physdev_op() as-is.  You will have to check
whether the current paths in do_physdev_op() are not making
assumptions about XENFEAT_hvm_pirqs being enabled when the calling
domain is of HVM type.  I don't think that's the case, but better
check.

Thanks, Roger.

