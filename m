Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF48B8C22
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 16:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715333.1116881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2BE7-0003qx-VA; Wed, 01 May 2024 14:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715333.1116881; Wed, 01 May 2024 14:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2BE7-0003oj-SU; Wed, 01 May 2024 14:46:31 +0000
Received: by outflank-mailman (input) for mailman id 715333;
 Wed, 01 May 2024 14:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAI4=ME=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s2BE6-0003od-Qf
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 14:46:30 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9769909e-07c9-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 16:46:28 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e0a2870bceso41471691fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 07:46:28 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b0041bf87e702asm2416912wmq.10.2024.05.01.07.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 07:46:25 -0700 (PDT)
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
X-Inumbo-ID: 9769909e-07c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714574788; x=1715179588; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4ojWbgGKeLlz2RX8smFFr1xJq/YLUKQi3LRjZQ4IgY=;
        b=fF9BX+Euvyz6LiVndbFB+DQmblGHCRTb4OFdZSKYBwzOYGrWOy2qKq0Re1noimF+5P
         PVJ3pNXvV4IFGXLTBip7SqGcPzUTlsM7TuXoz42L//m2LavfIx3WX1hY55onviabIMkp
         9syAopf5gBOIVhyDGdV+/aJhf2rozgheH9KaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714574788; x=1715179588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4ojWbgGKeLlz2RX8smFFr1xJq/YLUKQi3LRjZQ4IgY=;
        b=WPQ0dAaQ8eMbtAajMIIg96tltnj29Ba/qmUc+0RLmQJa7SnZoTjYoM6d4noIjQVhSY
         2j1A1gCIy1PSEkodJfPtQU5Tols8PSyyYfEgdpkzyG3MJSHOMwikuDLn0tr5LRXT3R6M
         A9cvkdONvjoIZ978vAA2rfPxRG8flHAFL4X0CZinAtZJt5iJ/mogWd5jpiA4e9lWpzey
         Xqo/PG9Ueok8tMC8mMaBtFk8RV3A6o4lKUa7ck5tDY5Qg9O+WYhh/Sx2yjzF9A6XeUEZ
         4W+5MeGWp9NpdiDMoml5aaJb1zXMgaUHb9rAvzT68CmqeuiPsQMgWx5398TyDJv+U6XW
         bRvg==
X-Gm-Message-State: AOJu0YwaoScV7MeLbGtxUC/7Pekb7AG1XyxV8EL6Oc+P/l73euVOTvUl
	+Vb3nvxuwVjkb6N7L+EFUyzh3Bsdf46Ewg1mq58v+8FGsebYbB9ldq2VGO27FAsFFboOfUBLagS
	k
X-Google-Smtp-Source: AGHT+IHcq4PJMeZBL+hUyz++eAPEuutXJJmWdYVboovCrPtK61FURQnmMKjxVwuK7+8IqZvb5onRyA==
X-Received: by 2002:a2e:a26a:0:b0:2df:ee50:3c35 with SMTP id k10-20020a2ea26a000000b002dfee503c35mr1860601ljm.0.1714574785728;
        Wed, 01 May 2024 07:46:25 -0700 (PDT)
Date: Wed, 1 May 2024 15:46:24 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Henry Wang <xin.wang2@amd.com>
Cc: xen-devel@lists.xenproject.org, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 08/15] tools: Add domain_id and expert mode for overlay
 operations
Message-ID: <eaea1986-a27e-4d6c-932f-1d0a9918861f@perard>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-9-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424033449.168398-9-xin.wang2@amd.com>

On Wed, Apr 24, 2024 at 11:34:42AM +0800, Henry Wang wrote:
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
> 
> Add domain_id and expert mode for overlay assignment. This enables dynamic
> programming of nodes during runtime.
> 
> Take the opportunity to fix the name mismatch in the xl command, the
> command name should be "dt-overlay" instead of "dt_overlay".

I don't like much these unrelated / opportunistic changes in a patch,
I'd rather have a separate patch. And in this case, if it was on a
separate patch, that separated patch could gain: Fixes: 61765a07e3d8
("tools/xl: Add new xl command overlay for device tree overlay support")
and potentially backported.

> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>  tools/include/libxl.h               |  8 +++++--
>  tools/include/xenctrl.h             |  5 +++--
>  tools/libs/ctrl/xc_dt_overlay.c     |  7 ++++--
>  tools/libs/light/libxl_dt_overlay.c | 17 +++++++++++----
>  tools/xl/xl_vmcontrol.c             | 34 ++++++++++++++++++++++++++---
>  5 files changed, 58 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 62cb07dea6..59a3e1b37c 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -2549,8 +2549,12 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
>  void libxl_device_pci_list_free(libxl_device_pci* list, int num);
>  
>  #if defined(__arm__) || defined(__aarch64__)
> -int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
> -                     uint32_t overlay_size, uint8_t overlay_op);
> +#define LIBXL_DT_OVERLAY_ADD                   1
> +#define LIBXL_DT_OVERLAY_REMOVE                2
> +
> +int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domain_id, void *overlay,
> +                     uint32_t overlay_size, uint8_t overlay_op, bool auto_mode,
> +                     bool domain_mapping);

Sorry, you cannot change the API of an existing libxl function without
providing something backward compatible. We have already a few example
of this changes in libxl.h, e.g.: fded24ea8315 ("libxl: Make libxl_set_vcpuonline async")
So, providing a wrapper called libxl_dt_overlay_0x041800() which call
the new function.

>  #endif
>  
>  /*
> diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
> index a6c709a6dc..cdb62b28cf 100644
> --- a/tools/libs/light/libxl_dt_overlay.c
> +++ b/tools/libs/light/libxl_dt_overlay.c
> @@ -57,10 +58,18 @@ int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, uint32_t overlay_dt_size,
>          rc = 0;
>      }
>  
> -    r = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);
> +    /* Check if user entered a valid domain id. */
> +    rc = libxl_domain_info(CTX, NULL, domid);
> +    if (rc == ERROR_DOMAIN_NOTFOUND) {

Why do you check specifically for "domain not found", what about other
error?

> +        LOGD(ERROR, domid, "Non-existant domain.");
> +        return ERROR_FAIL;

Use `goto out`, and you can let the function return
ERROR_DOMAIN_NOTFOUND if that the error, we can just propagate the `rc`
from libxl_domain_info().

> +    }
> +
> +    r = xc_dt_overlay(ctx->xch, domid, overlay_dt, overlay_dt_size, overlay_op,
> +                      domain_mapping);
>  
>      if (r) {
> -        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.", __func__);
> +        LOG(ERROR, "domain%d: Adding/Removing overlay dtb failed.", domid);

You could replace the macro by LOGD, instead of handwriting "domain%d".

>          rc = ERROR_FAIL;
>      }
>  
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 98f6bd2e76..9674383ec3 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -1270,21 +1270,48 @@ int main_dt_overlay(int argc, char **argv)
>  {
>      const char *overlay_ops = NULL;
>      const char *overlay_config_file = NULL;
> +    uint32_t domain_id = 0;
>      void *overlay_dtb = NULL;
>      int rc;
> +    bool auto_mode = true;
> +    bool domain_mapping = false;
>      uint8_t op;
>      int overlay_dtb_size = 0;
>      const int overlay_add_op = 1;
>      const int overlay_remove_op = 2;
>  
> -    if (argc < 2) {
> -        help("dt_overlay");
> +    if (argc < 3) {
> +        help("dt-overlay");
>          return EXIT_FAILURE;
>      }
>  
> +    if (argc > 5) {
> +        fprintf(stderr, "Too many arguments\n");
> +        return ERROR_FAIL;
> +    }
> +
>      overlay_ops = argv[1];
>      overlay_config_file = argv[2];
>  
> +    if (!strcmp(argv[argc - 1], "-e"))
> +        auto_mode = false;
> +
> +    if (argc == 4 || !auto_mode) {
> +        domain_id = find_domain(argv[argc-1]);
> +        domain_mapping = true;
> +    }
> +
> +    if (argc == 5 || !auto_mode) {
> +        domain_id = find_domain(argv[argc-2]);
> +        domain_mapping = true;
> +    }

Sorry, I can't review that changes, this needs a change in the help
message of dt-overlay, and something in the man page. (and that argument
parsing looks convoluted).

> +
> +    /* User didn't prove any overlay operation. */

I guess you meant "provide" instead of prove. But the comment can be
discarded, it doesn't explain anything useful that the error message
doesn't already explain.

> +    if (overlay_ops == NULL) {
> +        fprintf(stderr, "No overlay operation mode provided\n");
> +        return ERROR_FAIL;

That should be EXIT_FAILURE instead. (and I realise that the function
already return ERROR_FAIL by mistake in several places. (ERROR_FAIL is a
libxl error return value of -3, which isn't really a good exit value for
CLI programmes.))

Thanks,

-- 
Anthony PERARD

