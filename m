Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F28B8C75
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 17:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715339.1116892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2BaM-0007A7-Or; Wed, 01 May 2024 15:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715339.1116892; Wed, 01 May 2024 15:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2BaM-00078N-M7; Wed, 01 May 2024 15:09:30 +0000
Received: by outflank-mailman (input) for mailman id 715339;
 Wed, 01 May 2024 15:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAI4=ME=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s2BaL-00078E-Nj
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 15:09:29 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd97ccc1-07cc-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 17:09:27 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so53410085e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 08:09:27 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b8-20020adfe308000000b003436a3cae6dsm34601838wrj.98.2024.05.01.08.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 08:09:26 -0700 (PDT)
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
X-Inumbo-ID: cd97ccc1-07cc-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714576167; x=1715180967; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLBsUNaDoVONJfDnLGkcsX7757Jxo3cdl4Cr/gz+qUY=;
        b=JJPf82vZgEiWdokwEjP9DE8Bcm9zWZsJr+RCo3X9AxigLuhCUbOcQ6tg8O4SSaNbBi
         ROpWE8K9BWBPxCkgVbeYNjCEtOANu/jW1TQy+8cU4sR0H/IOEYdyjl8jB1jHwn3XUJiU
         AWiDXK3DMfh+8PWRk4xLsehDC2PMrB8VQrmW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714576167; x=1715180967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLBsUNaDoVONJfDnLGkcsX7757Jxo3cdl4Cr/gz+qUY=;
        b=jV0RTNBWNtZfXMTtHbwUAcEqb0Sl0EdrOvAH5QXBrgzVAVuXjqYj30RARFdc/ej//E
         GbVNdKygjc9JY2EsaehRfE4FwRFcN0iW1YyeqsrUuGI0kDiUA6NF3vzG3y9SrrSN+dp/
         UAS8Dh/h3oENUEwNEdgBO6lYorAPB11Qp3SEcDOe0bpSLPxUzTRxRrLeg4xt4oCfNJZg
         dFtXjFDAzTSZokAkj7RmqLSR8pM5xcIz2Sf6myad9qaznmZ1E+iAeBu5WwgdtnhY4nRG
         wPO0CsOTb2WyzrOpq7xQY9KMV63+NV7ayfd8Ghr3GFy/jm5dwe32Uhyw+aTOA2nxpYQS
         AcZw==
X-Gm-Message-State: AOJu0YyZ/N/QmbupYd65MUaT/mrepKS2Mpd105oTj2vmB1T3G6X2VF1X
	Cz3C8uuDf9LsIZlLhed0FJqhVZEbixeTKVzYmaSnIg4uMabVAlhnl0Egm8h8iFU=
X-Google-Smtp-Source: AGHT+IETR9o/DrjmGB19ffxt4f98CuGA2/SSsethogQR9ejLqKKSMQYeo8nWqUGTAigPvDHcBhsQIQ==
X-Received: by 2002:a05:6000:e06:b0:34d:8190:72f4 with SMTP id dx6-20020a0560000e0600b0034d819072f4mr2067461wrb.1.1714576167105;
        Wed, 01 May 2024 08:09:27 -0700 (PDT)
Date: Wed, 1 May 2024 16:09:25 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Henry Wang <xin.wang2@amd.com>
Cc: xen-devel@lists.xenproject.org, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 09/15] tools/libs/light: Modify dtbo to domU linux dtbo
 format
Message-ID: <2c5baf13-7511-4035-91da-02754a2f28c0@perard>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-10-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424033449.168398-10-xin.wang2@amd.com>

On Wed, Apr 24, 2024 at 11:34:43AM +0800, Henry Wang wrote:
> diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
> index cdb62b28cf..eaf11a0f9c 100644
> --- a/tools/libs/light/libxl_dt_overlay.c
> +++ b/tools/libs/light/libxl_dt_overlay.c
> @@ -41,6 +42,69 @@ static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
>      return 0;
>  }
>  
> +static int modify_overlay_for_domU(libxl__gc *gc, void *overlay_dt_domU,
> +                                   size_t size)
> +{
> +    int rc = 0;
> +    int virtual_interrupt_parent = GUEST_PHANDLE_GIC;
> +    const struct fdt_property *fdt_prop_node = NULL;
> +    int overlay;
> +    int prop_len = 0;
> +    int subnode = 0;
> +    int fragment;
> +    const char *prop_name;
> +    const char *target_path = "/";
> +
> +    fdt_for_each_subnode(fragment, overlay_dt_domU, 0) {
> +        prop_name = fdt_getprop(overlay_dt_domU, fragment, "target-path",
> +                                &prop_len);
> +        if (prop_name == NULL) {
> +            LOG(ERROR, "target-path property not found\n");

LOG* macros already takes care of adding \n, no need to add an extra
one.

> +            rc = ERROR_FAIL;
> +            goto err;
> +        }
> +
> +        /* Change target path for domU dtb. */
> +        rc = fdt_setprop_string(overlay_dt_domU, fragment, "target-path",

fdt_setprop_string() isn't a libxl function, store the return value in a
variable named `r` instead.

> +                                target_path);
> +        if (rc) {
> +            LOG(ERROR, "Setting interrupt parent property failed for %s\n",
> +                prop_name);
> +            goto err;
> +        }
> +
> +        overlay = fdt_subnode_offset(overlay_dt_domU, fragment, "__overlay__");
> +
> +        fdt_for_each_subnode(subnode, overlay_dt_domU, overlay)
> +        {
> +            const char *node_name = fdt_get_name(overlay_dt_domU, subnode,
> +                                                 NULL);
> +
> +            fdt_prop_node = fdt_getprop(overlay_dt_domU, subnode,
> +                                        "interrupt-parent", &prop_len);
> +            if (fdt_prop_node == NULL) {
> +                LOG(DETAIL, "%s property not found for %s. Skip to next node\n",
> +                    "interrupt-parent", node_name);

Why do you have "interrupt-parent" in a separate argument? Do you meant
to do something like
    const char *some_name = "interrupt-parent";
and use that in the 4 different places that this string is used? (Using
a variable mean that we (or the compiler) can make sure that they are
all spelled correctly.

> +                continue;
> +            }
> +
> +            rc = fdt_setprop_inplace_u32(overlay_dt_domU, subnode,
> +                                         "interrupt-parent",
> +                                         virtual_interrupt_parent);
> +            if (rc) {
> +                LOG(ERROR, "Setting interrupt parent property failed for %s\n",
> +                    "interrupt-parent");
> +                goto err;
> +            }
> +        }
> +    }
> +
> +return 0;

Missed indentation.

> +
> +err:
> +    return rc;

A few things, looks like `rc` is always going to be ERROR_FAIL here,
unless you find an libxl_error code that better describe the error, so
you could forgo the `rc` variable.

Also, if you don't need to clean up anything in the function or have a
generic error message, you could simply "return " instead of using the
"goto" style.

> +}
> +
>  int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domid, void *overlay_dt,
>                       uint32_t overlay_dt_size, uint8_t overlay_op,
>                       bool auto_mode, bool domain_mapping)
> @@ -73,6 +137,15 @@ int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domid, void *overlay_dt,
>          rc = ERROR_FAIL;
>      }
>  
> +    /*
> +     * auto_mode doesn't apply to dom0 as dom0 can get the physical
> +     * description of the hardware.
> +     */
> +    if (domid && auto_mode) {
> +        if (overlay_op == LIBXL_DT_OVERLAY_ADD)

Shouldn't libxl complain if the operation is different?

> +            rc = modify_overlay_for_domU(gc, overlay_dt, overlay_dt_size);
> +    }
> +
>  out:
>      GC_FREE;
>      return rc;

Thanks,

-- 
Anthony PERARD

