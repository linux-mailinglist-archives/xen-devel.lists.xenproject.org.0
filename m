Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA25ACFE9E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008223.1387473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSvw-0002SU-RX; Fri, 06 Jun 2025 09:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008223.1387473; Fri, 06 Jun 2025 09:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSvw-0002Qa-Nr; Fri, 06 Jun 2025 09:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1008223;
 Fri, 06 Jun 2025 09:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNSvv-0002Dw-I2
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:00:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a937c99d-42b4-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:00:15 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so1348581f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:00:15 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a53246b678sm1226372f8f.101.2025.06.06.02.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:00:13 -0700 (PDT)
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
X-Inumbo-ID: a937c99d-42b4-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749200414; x=1749805214; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIQeF0JzJfg6T+6jInSQ/eMC6mJ4jlezcTRlvUnaYeE=;
        b=gDolB50ZLylGJEIvXqVbwW8t+wUKxDnTYFoyqWieFYF01C2CUGrR7pChNA2ibhNHEG
         raYELR+4iLsQXUDYgrC+88nBfV+z2GjcU2h9pppAzJ5xI141pzn7EAYud4lOyBq1bj8N
         dmm7AkRj/jeuMuiKUFSe2mRoJYKQSxrvRGEO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200414; x=1749805214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIQeF0JzJfg6T+6jInSQ/eMC6mJ4jlezcTRlvUnaYeE=;
        b=bo/R+7mlYCClfn+0tBUYE7T0HXnLQucQLO3HvE5lSU9tKbSIBJOIRs55d1C0XthjUs
         VNl1h/qdbiNR8rISVTiuiVhseZTyFNFOybGEQAOI/npAqLIA01PUnPZYXCUSo01xPm2m
         5rBhrR+/7MZGeeqnIM07TauzO3C3sOR1WPhJv/lf1qxrSUKN9ev3QAdjltzz84iSq+Xu
         XfrCP2fUTiO4AakyFRX6Yci8KvChH2hgTL+wmQGJj/NIlP9hjMs9Ph7RZKxK1kaJqBzO
         7JQTwHeer8RzaTNxl1rjuym6+kr54i8ggUMPK7Rf47lu1VW1tb5sEsM0pAQ9xz/VGdF9
         TQag==
X-Gm-Message-State: AOJu0YwPrbQcH4h9zbrO/LCZAuZosOuliIlZ1GPdmXdf5ZVkZktejK+J
	ovm+e42Bv5mV7cI948zqoH+k4ek0gmKfFu1Adt8t9bMxFLJpPG8dF7VlhcEx8cXt7iw=
X-Gm-Gg: ASbGnctrT41Qms+qbUFDuJ3ck/6Ku3yZwjR0OpVEmaJl2nl6Jqh/jpNNa5eXN8o3mIc
	ESKO6YaeXIgPdGQnFcjR1z2ilOs4nKjqXKXmNchg2fnQ5lMeg9FJWidm/8W8yqfxgd3Bqp/pfsc
	65Z+huKR1b6qyVatKVhL2TJiREZocSPxH+0lJc7dAdyRAZcoutpSFFy/5AKocn7DSF75QPzbCAO
	cSWb/FRuIz7Dpxxvqrz84DKI75ZQkfMkVsVNVUuYOz33Wdx++sOIcOO1CMvRsu0TKp+3uRCzQ6g
	j3CiPqVxqgsm5RFfqEzNjbypEIya0E3Mm5KzH6yzrdIdeRrfv/TsvShYD2LI31dPPs/Qg7WLh9k
	Ldn4h0zVoscxaD0aBYAYFV5gNe5TrhOHXMBE=
X-Google-Smtp-Source: AGHT+IEYUq22b8s6sFSJmvBfWMP1dqZvMXqz4eR7Ov8LwfMBpm/2Gbg4kAYHyB+SjZVx2Uin1H5GoQ==
X-Received: by 2002:a05:6000:2dc9:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a5319a78fcmr1912174f8f.41.1749200414092;
        Fri, 06 Jun 2025 02:00:14 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:00:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 10/11] tools/xl: Expose a "claim_on_node" setting in
 xl.cfg
Message-ID: <aEKuGUlWlWSvv974@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-11-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-11-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:25:01PM +0000, Alejandro Vallejo wrote:
> Expose a setting to explicitly select a NUMA node for created domains
> 
> If the hypervisor can't reserve enough memory in the relevant NUMA node
> it fails the claim early. Also, disable automatic NUMA placement when
> this new option is enabled.

Overall it would be more helpful for users if soft-affinity was taken
into consideration when doing the claims, as that's the node where the
memory will ultimately be allocated?

Otherwise it's not very helpful IMO, as it's unlikely for the user to
know which NUMA the domain will get assigned to ahead of having
created it.

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/xenguest.h             |  7 +++++++
>  tools/libs/guest/xg_dom_core.c       |  1 +
>  tools/libs/guest/xg_dom_x86.c        | 18 +++++++++---------
>  tools/libs/light/libxl_dom.c         |  2 ++
>  tools/libs/light/libxl_types.idl     |  3 ++-
>  tools/xl/xl_parse.c                  | 11 +++++++++++
>  8 files changed, 35 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index 90846ea8e882..9204020224d5 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1108,6 +1108,7 @@ x.LlcColors[i] = uint32(v)
>  if err := x.ClaimMode.fromC(&xc.claim_mode);err != nil {
>  return fmt.Errorf("converting field ClaimMode: %v", err)
>  }
> +x.ClaimOnNode = uint32(xc.claim_on_node)
>  x.EventChannels = uint32(xc.event_channels)
>  x.Kernel = C.GoString(xc.kernel)
>  x.Cmdline = C.GoString(xc.cmdline)
> @@ -1472,6 +1473,7 @@ cLlcColors[i] = C.uint32_t(v)
>  if err := x.ClaimMode.toC(&xc.claim_mode); err != nil {
>  return fmt.Errorf("converting field ClaimMode: %v", err)
>  }
> +xc.claim_on_node = C.uint32_t(x.ClaimOnNode)
>  xc.event_channels = C.uint32_t(x.EventChannels)
>  if x.Kernel != "" {
>  xc.kernel = C.CString(x.Kernel)}
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index e7667f1ce3a3..1c6319200411 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -577,6 +577,7 @@ Irqs []uint32
>  Iomem []IomemRange
>  LlcColors []uint32
>  ClaimMode Defbool
> +ClaimOnNode uint32
>  EventChannels uint32
>  Kernel string
>  Cmdline string
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index e01f494b772a..08aae1e24e4c 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -185,6 +185,13 @@ struct xc_dom_image {
>      uint32_t guest_domid;
>      int claim_enabled; /* 0 by default, 1 enables it */
>  
> +    /*
> +     * Exact NUMA node on which to allocate memory from.
> +     *
> +     * XC_NUMA_NO_NODE by default.
> +     */
> +    unsigned int claim_on_node;
> +
>      int xen_version;
>      xen_capabilities_info_t xen_caps;
>  
> diff --git a/tools/libs/guest/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
> index 595b0a667c03..152ec8ea6591 100644
> --- a/tools/libs/guest/xg_dom_core.c
> +++ b/tools/libs/guest/xg_dom_core.c
> @@ -775,6 +775,7 @@ struct xc_dom_image *xc_dom_allocate(xc_interface *xch,
>      dom->parms->p2m_base = UNSET_ADDR;
>  
>      dom->flags = SIF_VIRT_P2M_4TOOLS;
> +    dom->claim_on_node = XC_NUMA_NO_NODE;
>  
>      dom->alloc_malloc += sizeof(*dom);
>      return dom;
> diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
> index ac05106a8c1c..4fe816b9bcb4 100644
> --- a/tools/libs/guest/xg_dom_x86.c
> +++ b/tools/libs/guest/xg_dom_x86.c
> @@ -1199,7 +1199,7 @@ static int meminit_pv(struct xc_dom_image *dom)
>      if ( dom->claim_enabled )
>      {
>          rc = xc_domain_claim_pages(dom->xch, dom->guest_domid,
> -                                   XC_NUMA_NO_NODE,
> +                                   dom->claim_on_node,
>                                     dom->total_pages);
>          if ( rc )
>              return rc;
> @@ -1209,9 +1209,10 @@ static int meminit_pv(struct xc_dom_image *dom)
>       * that this is a valid state if libxl doesn't provide any
>       * vNUMA information.
>       *
> -     * The dummy values make libxc allocate all pages from
> -     * arbitrary physical nodes. This is the expected behaviour if
> -     * no vNUMA configuration is provided to libxc.
> +     * If there's an outstanding claim on a node, memory is allocated from that
> +     * node. Otherwise the dummy values make libxc allocate all pages from
> +     * arbitrary physical nodes. This is the expected behaviour if no vNUMA
> +     * configuration is provided to libxc and.

Stray 'and' or truncated sentence?

>       *
>       * Note that the following hunk is just for the convenience of
>       * allocation code. No defaulting happens in libxc.
> @@ -1227,7 +1228,7 @@ static int meminit_pv(struct xc_dom_image *dom)
>  
>          nr_vnodes = 1;
>          vnode_to_pnode = dummy_vnode_to_pnode;
> -        vnode_to_pnode[0] = XC_NUMA_NO_NODE;
> +        vnode_to_pnode[0] = dom->claim_on_node;
>      }
>      else
>      {
> @@ -1357,7 +1358,6 @@ static int meminit_hvm(struct xc_dom_image *dom)
>      unsigned long stat_normal_pages = 0, stat_2mb_pages = 0,
>          stat_1gb_pages = 0;
>      unsigned int memflags = 0;
> -    int claim_enabled = dom->claim_enabled;
>      uint64_t total_pages;
>      xen_vmemrange_t dummy_vmemrange[2];
>      unsigned int dummy_vnode_to_pnode[1];
> @@ -1397,7 +1397,7 @@ static int meminit_hvm(struct xc_dom_image *dom)
>              nr_vmemranges++;
>          }
>  
> -        dummy_vnode_to_pnode[0] = XC_NUMA_NO_NODE;
> +        dummy_vnode_to_pnode[0] = dom->claim_on_node;
>          nr_vnodes = 1;
>          vmemranges = dummy_vmemrange;
>          vnode_to_pnode = dummy_vnode_to_pnode;
> @@ -1443,8 +1443,8 @@ static int meminit_hvm(struct xc_dom_image *dom)
>       * actually allocates memory for the guest. Claiming after memory has been
>       * allocated is pointless.
>       */
> -    if ( claim_enabled ) {
> -        rc = xc_domain_claim_pages(xch, domid, XC_NUMA_NO_NODE,
> +    if ( dom->claim_enabled ) {
> +        rc = xc_domain_claim_pages(xch, domid, dom->claim_on_node,
>                                     target_pages - dom->vga_hole_size);
>          if ( rc != 0 )
>          {
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 94fef374014e..1a5500702239 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -663,6 +663,7 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
>      dom->xenstore_evtchn = state->store_port;
>      dom->xenstore_domid = state->store_domid;
>      dom->claim_enabled = libxl_defbool_val(info->claim_mode);
> +    dom->claim_on_node = info->claim_on_node;
>      dom->max_vcpus = info->max_vcpus;
>  
>      if (info->num_vnuma_nodes != 0) {
> @@ -1090,6 +1091,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
>      mem_size = (uint64_t)(info->max_memkb - info->video_memkb) << 10;
>      dom->target_pages = (uint64_t)(info->target_memkb - info->video_memkb) >> 2;
>      dom->claim_enabled = libxl_defbool_val(info->claim_mode);
> +    dom->claim_on_node = info->claim_on_node;
>      if (info->u.hvm.mmio_hole_memkb) {
>          uint64_t max_ram_below_4g = (1ULL << 32) -
>              (info->u.hvm.mmio_hole_memkb << 10);
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index bd4b8721ff19..a252b36c2b5d 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -617,7 +617,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>      ("irqs",             Array(uint32, "num_irqs")),
>      ("iomem",            Array(libxl_iomem_range, "num_iomem")),
>      ("llc_colors",       Array(uint32, "num_llc_colors")),
> -    ("claim_mode",	     libxl_defbool),
> +    ("claim_mode",       libxl_defbool),
> +    ("claim_on_node",    uint32),
>      ("event_channels",   uint32),
>      ("kernel",           string),
>      ("cmdline",          string),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 089a88935aff..5880a032e6d6 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1558,6 +1558,17 @@ void parse_config_data(const char *config_source,
>          exit(1);
>  
>      libxl_defbool_set(&b_info->claim_mode, claim_mode);
> +    e = xlu_cfg_get_bounded_long (config, "claim_on_node", 0,

You seem to introduce a new xl.cfg option, but there are no man page
changes as part of the patch?

> +                                  254, &l, 1);
> +    if (e == ESRCH) /* not specified */
> +        b_info->claim_on_node = ~0U;
> +    else if (!e) {
> +        libxl_defbool_set(&b_info->numa_placement, false);
> +        libxl_defbool_set(&b_info->claim_mode, true);
> +        b_info->claim_on_node = l;
> +    }

This setting of defaults should better be done in
libxl__domain_build_info_setdefault() IMO.

Thanks, Roger.

