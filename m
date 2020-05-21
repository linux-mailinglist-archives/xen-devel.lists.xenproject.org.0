Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F91DCE36
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 15:34:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jblL9-0001KG-JJ; Thu, 21 May 2020 13:34:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zzzg=7D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jblL8-0001KA-Ft
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 13:34:26 +0000
X-Inumbo-ID: c8f99a4a-9b67-11ea-9887-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8f99a4a-9b67-11ea-9887-bc764e2007e4;
 Thu, 21 May 2020 13:34:24 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zVjLvLt9e6qx2PPdBy4Mr7/KIQtphzeMivAVa7L4K3hz7m6Ftr4FPsE2WP0K2ckAE4D797aqVU
 vOCQui2wRGVtku2UC32XwABYxK//bRK1uOXlQcTD2KD4xw9Zlrpr5yTyTDpSkA8y+fsPuOp72t
 61EUibRRX7OLFQF2YpSVFQyusbDawffoXMXg45Z4rcA/QkSoETW2I/iK7CBrp5FdTbTc+y6rGt
 PWO1yzq/QCnTs3h9xghfdTSvwl1J608I3MmWZnKyOnFGim8c5HzzMU13EY4MtAITg7stGZ0Vrq
 0+U=
X-SBRS: 2.7
X-MesageID: 18348881
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18348881"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24262.33627.309482.955954@mariner.uk.xensource.com>
Date: Thu, 21 May 2020 14:34:19 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 5/5] tools/libxc: make use of domain context SHARED_INFO
 record...
In-Reply-To: <20200521085932.10508-6-paul@xen.org>
References: <20200521085932.10508-1-paul@xen.org>
 <20200521085932.10508-6-paul@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH v4 5/5] tools/libxc: make use of domain context SHARED_INFO record..."):
> ... in the save/restore code.
> 
> This patch replaces direct mapping of the shared_info_frame (retrieved
> using XEN_DOMCTL_getdomaininfo) with save/load of the domain context
> SHARED_INFO record.
> 
> No modifications are made to the definition of the migration stream at
> this point. Subsequent patches will define a record in the libxc domain
> image format for passing domain context and convert the save/restore code
> to use that.

Andy, I think this needs your option.

Thanks,
Ian.

> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>
> 
> v3:
>  - Moved basic get/set domain context functions to common code
> 
> v2:
>  - Re-based (now making use of DOMAIN_SAVE_FLAG_IGNORE)
> ---
>  tools/libxc/xc_sr_common.c         | 67 +++++++++++++++++++++++++++
>  tools/libxc/xc_sr_common.h         | 11 ++++-
>  tools/libxc/xc_sr_common_x86_pv.c  | 74 ++++++++++++++++++++++++++++++
>  tools/libxc/xc_sr_common_x86_pv.h  |  3 ++
>  tools/libxc/xc_sr_restore_x86_pv.c | 26 ++++-------
>  tools/libxc/xc_sr_save_x86_pv.c    | 43 ++++++++---------
>  tools/libxc/xg_save_restore.h      |  1 +
>  7 files changed, 181 insertions(+), 44 deletions(-)
> 
> diff --git a/tools/libxc/xc_sr_common.c b/tools/libxc/xc_sr_common.c
> index dd9a11b4b5..1acb3765aa 100644
> --- a/tools/libxc/xc_sr_common.c
> +++ b/tools/libxc/xc_sr_common.c
> @@ -138,6 +138,73 @@ int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec)
>      return 0;
>  };
>  
> +int get_domain_context(struct xc_sr_context *ctx)
> +{
> +    xc_interface *xch = ctx->xch;
> +    size_t len = 0;
> +    int rc;
> +
> +    if ( ctx->domain_context.buffer )
> +    {
> +        ERROR("Domain context already present");
> +        return -1;
> +    }
> +
> +    rc = xc_domain_getcontext(xch, ctx->domid, NULL, &len);
> +    if ( rc < 0 )
> +    {
> +        PERROR("Unable to get size of domain context");
> +        return -1;
> +    }
> +
> +    ctx->domain_context.buffer = malloc(len);
> +    if ( !ctx->domain_context.buffer )
> +    {
> +        PERROR("Unable to allocate memory for domain context");
> +        return -1;
> +    }
> +
> +    rc = xc_domain_getcontext(xch, ctx->domid, ctx->domain_context.buffer,
> +                              &len);
> +    if ( rc < 0 )
> +    {
> +        PERROR("Unable to get domain context");
> +        return -1;
> +    }
> +
> +    ctx->domain_context.len = len;
> +
> +    return 0;
> +}
> +
> +int set_domain_context(struct xc_sr_context *ctx)
> +{
> +    xc_interface *xch = ctx->xch;
> +    int rc;
> +
> +    if ( !ctx->domain_context.buffer )
> +    {
> +        ERROR("Domain context not present");
> +        return -1;
> +    }
> +
> +    rc = xc_domain_setcontext(xch, ctx->domid, ctx->domain_context.buffer,
> +                              ctx->domain_context.len);
> +
> +    if ( rc < 0 )
> +    {
> +        PERROR("Unable to set domain context");
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +void common_cleanup(struct xc_sr_context *ctx)
> +{
> +    free(ctx->domain_context.buffer);
> +}
> +
>  static void __attribute__((unused)) build_assertions(void)
>  {
>      BUILD_BUG_ON(sizeof(struct xc_sr_ihdr) != 24);
> diff --git a/tools/libxc/xc_sr_common.h b/tools/libxc/xc_sr_common.h
> index 5dd51ccb15..0d61978b08 100644
> --- a/tools/libxc/xc_sr_common.h
> +++ b/tools/libxc/xc_sr_common.h
> @@ -208,6 +208,11 @@ struct xc_sr_context
>  
>      xc_dominfo_t dominfo;
>  
> +    struct {
> +        void *buffer;
> +        unsigned int len;
> +    } domain_context;
> +
>      union /* Common save or restore data. */
>      {
>          struct /* Save data. */
> @@ -314,7 +319,7 @@ struct xc_sr_context
>                  /* The guest pfns containing the p2m leaves */
>                  xen_pfn_t *p2m_pfns;
>  
> -                /* Read-only mapping of guests shared info page */
> +                /* Pointer to shared_info (located in context buffer) */
>                  shared_info_any_t *shinfo;
>  
>                  /* p2m generation count for verifying validity of local p2m. */
> @@ -425,6 +430,10 @@ int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec);
>  int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
>                    const xen_pfn_t *original_pfns, const uint32_t *types);
>  
> +int get_domain_context(struct xc_sr_context *ctx);
> +int set_domain_context(struct xc_sr_context *ctx);
> +void common_cleanup(struct xc_sr_context *ctx);
> +
>  #endif
>  /*
>   * Local variables:
> diff --git a/tools/libxc/xc_sr_common_x86_pv.c b/tools/libxc/xc_sr_common_x86_pv.c
> index d3d425cb82..69d9b142b8 100644
> --- a/tools/libxc/xc_sr_common_x86_pv.c
> +++ b/tools/libxc/xc_sr_common_x86_pv.c
> @@ -182,6 +182,80 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
>      return rc;
>  }
>  
> +int x86_pv_get_shinfo(struct xc_sr_context *ctx)
> +{
> +    xc_interface *xch = ctx->xch;
> +    unsigned int off = 0;
> +    int rc;
> +
> +#define GET_PTR(_x)                                                         \
> +    do {                                                                    \
> +        if ( ctx->domain_context.len - off < sizeof(*(_x)) )                \
> +        {                                                                   \
> +            ERROR("Need another %lu bytes of context, only %u available\n", \
> +                  sizeof(*(_x)), ctx->domain_context.len - off);            \
> +            return -1;                                                      \
> +        }                                                                   \
> +        (_x) = ctx->domain_context.buffer + off;                            \
> +    } while (false);
> +
> +    rc = get_domain_context(ctx);
> +    if ( rc )
> +        return rc;
> +
> +    for ( ; ; )
> +    {
> +        struct domain_save_descriptor *desc;
> +
> +        GET_PTR(desc);
> +
> +        off += sizeof(*desc);
> +
> +        switch (desc->typecode)
> +        {
> +        case DOMAIN_SAVE_CODE(SHARED_INFO):
> +        {
> +            DOMAIN_SAVE_TYPE(SHARED_INFO) *s;
> +
> +            GET_PTR(s);
> +
> +            ctx->x86.pv.shinfo = (shared_info_any_t *)s->buffer;
> +            break;
> +        }
> +        default:
> +            break;
> +        }
> +
> +        if ( desc->typecode == DOMAIN_SAVE_CODE(END) )
> +            break;
> +
> +        off += desc->length;
> +    }
> +
> +    if ( !ctx->x86.pv.shinfo )
> +    {
> +        ERROR("Failed to get SHARED_INFO\n");
> +        return -1;
> +    }
> +
> +    return 0;
> +
> +#undef GET_PTR
> +}
> +
> +int x86_pv_set_shinfo(struct xc_sr_context *ctx)
> +{
> +    xc_interface *xch = ctx->xch;
> +
> +    if ( !ctx->x86.pv.shinfo )
> +    {
> +        ERROR("SHARED_INFO buffer not present\n");
> +        return -1;
> +    }
> +
> +    return set_domain_context(ctx);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libxc/xc_sr_common_x86_pv.h b/tools/libxc/xc_sr_common_x86_pv.h
> index 2ed03309af..01442f48fb 100644
> --- a/tools/libxc/xc_sr_common_x86_pv.h
> +++ b/tools/libxc/xc_sr_common_x86_pv.h
> @@ -97,6 +97,9 @@ int x86_pv_domain_info(struct xc_sr_context *ctx);
>   */
>  int x86_pv_map_m2p(struct xc_sr_context *ctx);
>  
> +int x86_pv_get_shinfo(struct xc_sr_context *ctx);
> +int x86_pv_set_shinfo(struct xc_sr_context *ctx);
> +
>  #endif
>  /*
>   * Local variables:
> diff --git a/tools/libxc/xc_sr_restore_x86_pv.c b/tools/libxc/xc_sr_restore_x86_pv.c
> index 904ccc462a..21982a38ad 100644
> --- a/tools/libxc/xc_sr_restore_x86_pv.c
> +++ b/tools/libxc/xc_sr_restore_x86_pv.c
> @@ -865,7 +865,7 @@ static int handle_shared_info(struct xc_sr_context *ctx,
>      xc_interface *xch = ctx->xch;
>      unsigned int i;
>      int rc = -1;
> -    shared_info_any_t *guest_shinfo = NULL;
> +    shared_info_any_t *guest_shinfo;
>      const shared_info_any_t *old_shinfo = rec->data;
>  
>      if ( !ctx->x86.pv.restore.seen_pv_info )
> @@ -878,18 +878,14 @@ static int handle_shared_info(struct xc_sr_context *ctx,
>      {
>          ERROR("X86_PV_SHARED_INFO record wrong size: length %u"
>                ", expected 4096", rec->length);
> -        goto err;
> +        return -1;
>      }
>  
> -    guest_shinfo = xc_map_foreign_range(
> -        xch, ctx->domid, PAGE_SIZE, PROT_READ | PROT_WRITE,
> -        ctx->dominfo.shared_info_frame);
> -    if ( !guest_shinfo )
> -    {
> -        PERROR("Failed to map Shared Info at mfn %#lx",
> -               ctx->dominfo.shared_info_frame);
> -        goto err;
> -    }
> +    rc = x86_pv_get_shinfo(ctx);
> +    if ( rc )
> +        return rc;
> +
> +    guest_shinfo = ctx->x86.pv.shinfo;
>  
>      MEMCPY_FIELD(guest_shinfo, old_shinfo, vcpu_info, ctx->x86.pv.width);
>      MEMCPY_FIELD(guest_shinfo, old_shinfo, arch, ctx->x86.pv.width);
> @@ -904,13 +900,7 @@ static int handle_shared_info(struct xc_sr_context *ctx,
>  
>      MEMSET_ARRAY_FIELD(guest_shinfo, evtchn_mask, 0xff, ctx->x86.pv.width);
>  
> -    rc = 0;
> -
> - err:
> -    if ( guest_shinfo )
> -        munmap(guest_shinfo, PAGE_SIZE);
> -
> -    return rc;
> +    return x86_pv_set_shinfo(ctx);
>  }
>  
>  /* restore_ops function. */
> diff --git a/tools/libxc/xc_sr_save_x86_pv.c b/tools/libxc/xc_sr_save_x86_pv.c
> index f3ccf5bb4b..bf87789340 100644
> --- a/tools/libxc/xc_sr_save_x86_pv.c
> +++ b/tools/libxc/xc_sr_save_x86_pv.c
> @@ -9,25 +9,6 @@ static inline bool is_canonical_address(xen_vaddr_t vaddr)
>      return ((int64_t)vaddr >> 47) == ((int64_t)vaddr >> 63);
>  }
>  
> -/*
> - * Maps the guests shared info page.
> - */
> -static int map_shinfo(struct xc_sr_context *ctx)
> -{
> -    xc_interface *xch = ctx->xch;
> -
> -    ctx->x86.pv.shinfo = xc_map_foreign_range(
> -        xch, ctx->domid, PAGE_SIZE, PROT_READ, ctx->dominfo.shared_info_frame);
> -    if ( !ctx->x86.pv.shinfo )
> -    {
> -        PERROR("Failed to map shared info frame at mfn %#lx",
> -               ctx->dominfo.shared_info_frame);
> -        return -1;
> -    }
> -
> -    return 0;
> -}
> -
>  /*
>   * Copy a list of mfns from a guest, accounting for differences between guest
>   * and toolstack width.  Can fail if truncation would occur.
> @@ -854,13 +835,26 @@ static int write_x86_pv_p2m_frames(struct xc_sr_context *ctx)
>   */
>  static int write_shared_info(struct xc_sr_context *ctx)
>  {
> +    xc_interface *xch = ctx->xch;
>      struct xc_sr_record rec = {
>          .type = REC_TYPE_SHARED_INFO,
>          .length = PAGE_SIZE,
> -        .data = ctx->x86.pv.shinfo,
>      };
> +    int rc;
>  
> -    return write_record(ctx, &rec);
> +    if ( !(rec.data = calloc(1, PAGE_SIZE)) )
> +    {
> +        ERROR("Cannot allocate buffer for SHARED_INFO data");
> +        return -1;
> +    }
> +
> +    memcpy(rec.data, ctx->x86.pv.shinfo, sizeof(*ctx->x86.pv.shinfo));
> +
> +    rc = write_record(ctx, &rec);
> +
> +    free(rec.data);
> +
> +    return rc;
>  }
>  
>  /*
> @@ -1041,7 +1035,7 @@ static int x86_pv_setup(struct xc_sr_context *ctx)
>      if ( rc )
>          return rc;
>  
> -    rc = map_shinfo(ctx);
> +    rc = x86_pv_get_shinfo(ctx);
>      if ( rc )
>          return rc;
>  
> @@ -1112,12 +1106,11 @@ static int x86_pv_cleanup(struct xc_sr_context *ctx)
>      if ( ctx->x86.pv.p2m )
>          munmap(ctx->x86.pv.p2m, ctx->x86.pv.p2m_frames * PAGE_SIZE);
>  
> -    if ( ctx->x86.pv.shinfo )
> -        munmap(ctx->x86.pv.shinfo, PAGE_SIZE);
> -
>      if ( ctx->x86.pv.m2p )
>          munmap(ctx->x86.pv.m2p, ctx->x86.pv.nr_m2p_frames * PAGE_SIZE);
>  
> +    common_cleanup(ctx);
> +
>      return 0;
>  }
>  
> diff --git a/tools/libxc/xg_save_restore.h b/tools/libxc/xg_save_restore.h
> index 303081df0d..296b523963 100644
> --- a/tools/libxc/xg_save_restore.h
> +++ b/tools/libxc/xg_save_restore.h
> @@ -19,6 +19,7 @@
>  
>  #include <xen/foreign/x86_32.h>
>  #include <xen/foreign/x86_64.h>
> +#include <xen/save.h>
>  
>  /*
>  ** We process save/restore/migrate in batches of pages; the below
> -- 
> 2.20.1
> 

