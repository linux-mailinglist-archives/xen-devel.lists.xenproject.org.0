Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56D3029E6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 19:19:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74250.133418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46Rc-0003As-QZ; Mon, 25 Jan 2021 18:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74250.133418; Mon, 25 Jan 2021 18:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46Rc-0003AT-Mq; Mon, 25 Jan 2021 18:18:32 +0000
Received: by outflank-mailman (input) for mailman id 74250;
 Mon, 25 Jan 2021 18:18:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbX4=G4=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l46Rb-0003AO-0p
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 18:18:31 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9784da8d-f955-4ea5-8234-2092d2b95078;
 Mon, 25 Jan 2021 18:18:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c127so265282wmf.5
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jan 2021 10:18:29 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id f17sm16680129wrv.0.2021.01.25.10.18.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 10:18:27 -0800 (PST)
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
X-Inumbo-ID: 9784da8d-f955-4ea5-8234-2092d2b95078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=zE86PGTY7okwwEDDcmHNjJ8MukNuumBl7S1zKQntOR4=;
        b=JIuGZvYehfhkEL5gKL5RWcuc92lKlUVXXUSt7q+y71TMybis/vG3iiFIzdrZWWAatt
         m52u1foZC85yLUTmUmfwgcik2/XAXUcOA3lWjmFoDZfEAjcvENjAD6qyioMAncSCWgAn
         5Bv90nobxCmMzDOvuSwYOCKH+XukF7HAWN/m3e9eN0i/yqMZ0tyb93UZVn6kLuG5yNVl
         +dMsMOstXOmI0aFu/n0CpZw4El75zdmEIIrVc8s1h/EFU9A/I8rq9UbGOSrdeKHQRIx6
         nIlI5hG4iM4eRlaChFBmjXB6TMH14OgC/kPKTcjHwzzc1GdbNumvhL5yS+QJ+jx6WIiv
         i5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=zE86PGTY7okwwEDDcmHNjJ8MukNuumBl7S1zKQntOR4=;
        b=cUXTC9jLkHQxCGPFO/SXCCtPvoqW2NVlsvnUMIguau6kCL+N1/ZvSTFlzf2m3Baovx
         wRHiRelF8Gw9CHwiOhQvmERdWOsp6DJmVMjbEaCggwIJLu6Vfi+hp5yTsvAek4tCvxgw
         NA7Jd5mgM9wk6c1Z2g6EcNX+eKL5U8oLfy49ym1m238E2aSl29MLoSJzANpkiZ9yj4yq
         asOXv/huug7gpDrq6rbg10FHbTYNEhqrHEA4EOnqf38S6WUgUu4QdodChv+atinvh5p/
         IN98UPj2j8cwUdqWoI+GjWfK2R0xCDTe32cFZg0aL8upuQu53Oj7lLO4kuPX1gGs/hyR
         mV/A==
X-Gm-Message-State: AOAM5313noyXyQvVDiDAOgdNRk6uqR3ncdZf/wuzN5de8i4KWi6BNjhE
	XAMSe4GPZ3L6i/zjFiMnHpY=
X-Google-Smtp-Source: ABdhPJzTgADYHboHxZ+LCMPTdRSy/B7hnHSongrTu4jBswFaO5zsL6NJCvU6TtLqCj42gZxuILiOiQ==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr1273924wmc.39.1611598708458;
        Mon, 25 Jan 2021 10:18:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
	<xen-devel@lists.xenproject.org>
Cc: <iwj@xenproject.org>,
	<wl@xen.org>,
	<andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>,
	<jbeulich@suse.com>,
	<julien@xen.org>,
	<sstabellini@kernel.org>,
	<anthony.perard@citrix.com>,
	<roger.pau@citrix.com>
References: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com> <1610425048-990-2-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1610425048-990-2-git-send-email-igor.druzhinin@citrix.com>
Subject: RE: [PATCH v2 2/2] viridian: allow vCPU hotplug for Windows VMs
Date: Mon, 25 Jan 2021 18:18:26 -0000
Message-ID: <01eb01d6f346$7a3d0d10$6eb72730$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNSytsssxWJzcTJyJyBVC30FTjr4gJuCAE0py2G25A=
Content-Language: en-gb

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 12 January 2021 04:17
> To: xen-devel@lists.xenproject.org
> Cc: iwj@xenproject.org; wl@xen.org; andrew.cooper3@citrix.com; george.dunlap@citrix.com;
> jbeulich@suse.com; julien@xen.org; sstabellini@kernel.org; anthony.perard@citrix.com; paul@xen.org;
> roger.pau@citrix.com; Igor Druzhinin <igor.druzhinin@citrix.com>
> Subject: [PATCH v2 2/2] viridian: allow vCPU hotplug for Windows VMs
> 
> If Viridian extensions are enabled, Windows wouldn't currently allow
> a hotplugged vCPU to be brought up dynamically. We need to expose a special
> bit to let the guest know we allow it. Hide it behind an option to stay
> on the safe side regarding compatibility with existing guests but
> nevertheless set the option on by default.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

LGTM

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> Changes on v2:
> - hide the bit under an option and expose it in libxl
> ---
>  docs/man/xl.cfg.5.pod.in             | 7 ++++++-
>  tools/include/libxl.h                | 6 ++++++
>  tools/libs/light/libxl_types.idl     | 1 +
>  tools/libs/light/libxl_x86.c         | 4 ++++
>  xen/arch/x86/hvm/viridian/viridian.c | 5 ++++-
>  xen/include/public/hvm/params.h      | 7 ++++++-
>  6 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 3467eae..7cdb859 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2267,11 +2267,16 @@ explicitly have any limits on the number of Virtual processors a guest
>  is allowed to bring up. It is strongly recommended to keep this enabled
>  for guests with more than 64 vCPUs.
> 
> +=item B<cpu_hotplug>
> +
> +This set enables dynamic changes to Virtual processor states in Windows
> +guests effectively allowing vCPU hotplug.
> +
>  =item B<defaults>
> 
>  This is a special value that enables the default set of groups, which
>  is currently the B<base>, B<freq>, B<time_ref_count>, B<apic_assist>,
> -B<crash_ctl>, B<stimer> and B<no_vp_limit> groups.
> +B<crash_ctl>, B<stimer>, B<no_vp_limit> and B<cpu_hotplug> groups.
> 
>  =item B<all>
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index be1e288..7c7c541 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -458,6 +458,12 @@
>  #define LIBXL_HAVE_VIRIDIAN_NO_VP_LIMIT 1
> 
>  /*
> + * LIBXL_HAVE_VIRIDIAN_CPU_HOTPLUG indicates that the 'cpu_hotplug' value
> + * is present in the viridian enlightenment enumeration.
> + */
> +#define LIBXL_HAVE_VIRIDIAN_CPU_HOTPLUG 1
> +
> +/*
>   * LIBXL_HAVE_DEVICE_PCI_LIST_FREE indicates that the
>   * libxl_device_pci_list_free() function is defined.
>   */
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 8502b29..00a8e68 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -240,6 +240,7 @@ libxl_viridian_enlightenment = Enumeration("viridian_enlightenment", [
>      (9, "hcall_ipi"),
>      (10, "ex_processor_masks"),
>      (11, "no_vp_limit"),
> +    (12, "cpu_hotplug"),
>      ])
> 
>  libxl_hdtype = Enumeration("hdtype", [
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 5c4c194..91a9fc7 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -310,6 +310,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_APIC_ASSIST);
>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CRASH_CTL);
>          libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT);
> +        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG);
>      }
> 
>      libxl_for_each_set_bit(v, info->u.hvm.viridian_enable) {
> @@ -373,6 +374,9 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
>      if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT))
>          mask |= HVMPV_no_vp_limit;
> 
> +    if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG))
> +        mask |= HVMPV_cpu_hotplug;
> +
>      if (mask != 0 &&
>          xc_hvm_param_set(CTX->xch,
>                           domid,
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index ae1ea86..b906f7b 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -76,6 +76,7 @@ typedef union _HV_CRASH_CTL_REG_CONTENTS
>  } HV_CRASH_CTL_REG_CONTENTS;
> 
>  /* Viridian CPUID leaf 3, Hypervisor Feature Indication */
> +#define CPUID3D_CPU_DYNAMIC_PARTITIONING (1 << 3)
>  #define CPUID3D_CRASH_MSRS (1 << 10)
>  #define CPUID3D_SINT_POLLING (1 << 17)
> 
> @@ -179,8 +180,10 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>          res->a = u.lo;
>          res->b = u.hi;
> 
> +        if ( viridian_feature_mask(d) & HVMPV_cpu_hotplug )
> +           res->d = CPUID3D_CPU_DYNAMIC_PARTITIONING;
>          if ( viridian_feature_mask(d) & HVMPV_crash_ctl )
> -            res->d = CPUID3D_CRASH_MSRS;
> +            res->d |= CPUID3D_CRASH_MSRS;
>          if ( viridian_feature_mask(d) & HVMPV_synic )
>              res->d |= CPUID3D_SINT_POLLING;
> 
> diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
> index 805f4ca..c9d6e70 100644
> --- a/xen/include/public/hvm/params.h
> +++ b/xen/include/public/hvm/params.h
> @@ -172,6 +172,10 @@
>  #define _HVMPV_no_vp_limit 11
>  #define HVMPV_no_vp_limit (1 << _HVMPV_no_vp_limit)
> 
> +/* Enable vCPU hotplug */
> +#define _HVMPV_cpu_hotplug 12
> +#define HVMPV_cpu_hotplug (1 << _HVMPV_cpu_hotplug)
> +
>  #define HVMPV_feature_mask \
>          (HVMPV_base_freq | \
>           HVMPV_no_freq | \
> @@ -184,7 +188,8 @@
>           HVMPV_stimer | \
>           HVMPV_hcall_ipi | \
>           HVMPV_ex_processor_masks | \
> -         HVMPV_no_vp_limit)
> +         HVMPV_no_vp_limit | \
> +         HVMPV_cpu_hotplug)
> 
>  #endif
> 
> --
> 2.7.4



