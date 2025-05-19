Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DC4ABBF29
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989834.1373793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0ZG-0006O5-Dy; Mon, 19 May 2025 13:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989834.1373793; Mon, 19 May 2025 13:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0ZG-0006Me-BL; Mon, 19 May 2025 13:30:10 +0000
Received: by outflank-mailman (input) for mailman id 989834;
 Mon, 19 May 2025 13:30:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uH0ZE-0006MY-PY
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:30:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uH0ZE-001NcL-18;
 Mon, 19 May 2025 13:30:08 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uH0ZD-00En8v-2j;
 Mon, 19 May 2025 13:30:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=bIyNiXYHNldGruXG6lNwvZe6rL2DuiNpOvIcWcfxW0E=; b=wRmitf9AwzYlYV1W7JgeVr4X5i
	zilV+Pm1uMb/dQ1+q0tqFd73Mzh/KC7bi/1P0WGiW1ZCIvzleTOz2fBCixbM3cz2UFkifAfBq3Gtp
	6/uZ1l5MBgTwnnLlUY0fvo4Um5TIakdYHI9EdUwpatOfsGuuUfOcTLMGzhU7gkHteheI=;
Date: Mon, 19 May 2025 15:30:05 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 2/4] tools: remove support for running a guest with
 qemu-traditional
Message-ID: <aCsyXZyXNcSLq03I@l14>
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429110636.30518-3-jgross@suse.com>

On Tue, Apr 29, 2025 at 01:06:32PM +0200, Juergen Gross wrote:
> diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
> index 34f6753f61..227b5ceafb 100644
> --- a/tools/libacpi/mk_dsdt.c
> +++ b/tools/libacpi/mk_dsdt.c
> @@ -105,7 +81,7 @@ int main(int argc, char **argv)
>  {
>      unsigned int cpu, max_cpus;
>  #if defined(CONFIG_X86)
> -    dm_version dm_version = QEMU_XEN_TRADITIONAL;
> +    dm_version dm_version = QEMU_INVALID;
>      unsigned int slot, dev, intx, link;
>  
>      max_cpus = HVM_MAX_VCPUS;
> @@ -160,6 +134,11 @@ int main(int argc, char **argv)
>          }
>      }
>  
> +    if (dm_version == QEMU_INVALID) {

`dm_version` is only available if CONFIG_X86 is defined, so that doesn't
build on Arm.

> +        fprintf(stderr, "--dm_version is a mandatory parameter.\n");
> +        return -1;
> +    }
> +
>      /**** DSDT DefinitionBlock start ****/
>      /* (we append to existing DSDT definition block) */
>      indent_level++;
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 4627564c0d..645119b65a 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -2463,16 +2189,15 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
>                          "%s",
>                          libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
>      }
> -    /* Disable relocating memory to make the MMIO hole larger
> -     * unless we're running qemu-traditional and vNUMA is not
> -     * configured. */
> +
> +    /*
> +     * Disable relocating memory, having a lager MMIO hole isn't

I think you wanted to write "larger" and not "lager".

> +     * implemented with qemu-xen.
> +     */
>      libxl__xs_printf(gc, XBT_NULL,
>                       libxl__sprintf(gc, "%s/hvmloader/allow-memory-relocate",
>                                      libxl__xs_get_dompath(gc, guest_domid)),
> -                     "%d",
> -                     guest_config->b_info.device_model_version
> -                        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
> -                     !libxl__vnuma_configured(&guest_config->b_info));
> +                     "0");
>      ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
>      if (ret<0) {
>          LOGED(ERROR, guest_domid, "setting target domain %d -> %d",
> @@ -3196,26 +2917,19 @@ static void device_model_launch(libxl__egc *egc,
>          libxl__xs_printf(gc, XBT_NULL,
>                           GCSPRINTF("%s/hvmloader/bios", path),
>                           "%s", libxl_bios_type_to_string(b_info->u.hvm.bios));
> -        /* Disable relocating memory to make the MMIO hole larger
> -         * unless we're running qemu-traditional and vNUMA is not
> -         * configured. */
> +        /*
> +         * Disable relocating memory, having a lager MMIO hole isn't

Here too, I think you wanted to write "larger" and not "lager".

> +         * implemented with qemu-xen.
> +         */
>          libxl__xs_printf(gc, XBT_NULL,
>                           GCSPRINTF("%s/hvmloader/allow-memory-relocate", path),
> -                         "%d",
> -                         b_info->device_model_version==LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
> -                         !libxl__vnuma_configured(b_info));
> +                         "0");
>          free(path);
>      }

And with those fixed: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
I guess I can fixed those on commit if that's fine by you?

Thanks,

-- 
Anthony PERARD

