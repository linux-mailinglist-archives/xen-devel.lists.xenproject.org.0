Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CA1E8C8A
	for <lists+xen-devel@lfdr.de>; Sat, 30 May 2020 02:30:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jepNs-0004I0-0q; Sat, 30 May 2020 00:29:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcdI=7M=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jepNq-0004Hv-LZ
 for xen-devel@lists.xenproject.org; Sat, 30 May 2020 00:29:54 +0000
X-Inumbo-ID: ad169d2c-a20c-11ea-a928-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad169d2c-a20c-11ea-a928-12813bfff9fa;
 Sat, 30 May 2020 00:29:52 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:50762
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jepNk-000pHZ-L1 (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Sat, 30 May 2020 01:29:48 +0100
Subject: Re: [PATCH v6 5/5] tools/libxc: make use of domain context
 SHARED_INFO record...
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200527173407.1398-1-paul@xen.org>
 <20200527173407.1398-6-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <51f8cd86-9582-4fba-7e67-0c4b227870d1@citrix.com>
Date: Sat, 30 May 2020 01:29:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527173407.1398-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27/05/2020 18:34, Paul Durrant wrote:
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
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

I was going to fix up the remaining issues and commit this, but there is
a rather major problem in the way.  Therefore, here is a rather more
full review.

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

There is an xc_sr_blob interface, as this is a common pattern.

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

There is only a single caller to this function, so there is a (possibly
latent) memory leak.

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

As noted above, xc_sr_blob domain_context;

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

If I'm following this logic correctly, we're now in the final throws of
completing migration with data in hand, and we ask the hypervisor to
gather the entire domain context for this (not-yet-run) guest, copy it
(twice, even) down into userspace, so we can scan through it to find the
appropriate tag, copy less than a page's worth of data, then pass the
full buffer back to Xen to unserialise the whole thing over the guest.

The restore path shouldn't be calling DOMCTL_get* at all.  It is
conceptually wrong, and a waste of time/effort which would be better
spent with the guest unpaused.

What the restore path should be doing is passing data from the stream,
straight into DOMCTL_set* (and attempting to do this will probably
demonstrate why hvmctxt was an especially poor API to copy).  The layout
of existing migration-v2 blocks was designed around blobs which Xen
produces and consumes directly, specifically to minimise the processing
required.

I think it is a layering violation to have libxc pick apart and reframe
the internals of another layers' blob.

What is not currently clear is whether the domain context wants sending
as a discrete blob itself (and have a new chunk type allocated for the
purpose), or each bit of it is going to want picking apart.  This
largely depends on what else is going in the blob at a Xen level.

Also, I'd like to see the plans for the HVM side of this logic before
deciding on whether the PV side is appropriate.  I know we have a
dedicated SHARED_INFO record right now, but it would be fine (AFAICT) to
relax the migration spec to state that one of {SHARED_INFO,
DOMAIN_CONTEXT} must be sent for PV.

> @@ -854,13 +835,27 @@ static int write_x86_pv_p2m_frames(struct xc_sr_context *ctx)
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
> +    BUILD_BUG_ON(sizeof(*ctx->x86.pv.shinfo) > PAGE_SIZE);
> +    memcpy(rec.data, ctx->x86.pv.shinfo, sizeof(*ctx->x86.pv.shinfo));

These are some very contorted hoops to extend the data size sent.

write_split_record() is the the tool to use here, although the above
suggestions may render this change unnecessary.

> @@ -1041,7 +1036,7 @@ static int x86_pv_setup(struct xc_sr_context *ctx)
>      if ( rc )
>          return rc;
>  
> -    rc = map_shinfo(ctx);
> +    rc = x86_pv_get_shinfo(ctx);
>      if ( rc )
>          return rc;
>  
> @@ -1112,12 +1107,11 @@ static int x86_pv_cleanup(struct xc_sr_context *ctx)
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

This pair highlights an asymmetry in the patch, which will need fixing
by whomever adds a second field to domain_context.  Obtaining the
context for use should shouldn't be a hidden side effect of getting the
shared info.

~Andrew

