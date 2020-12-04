Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192C12CED1E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:35:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44572.79869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9NE-00041G-KE; Fri, 04 Dec 2020 11:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44572.79869; Fri, 04 Dec 2020 11:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9NE-00040r-G2; Fri, 04 Dec 2020 11:35:40 +0000
Received: by outflank-mailman (input) for mailman id 44572;
 Fri, 04 Dec 2020 11:35:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9NC-00040j-OO
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:35:38 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce496fa9-c339-473d-a8c4-ddf966bcc699;
 Fri, 04 Dec 2020 11:35:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i2so4998002wrs.4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:35:37 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id f17sm2721488wmh.10.2020.12.04.03.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:35:36 -0800 (PST)
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
X-Inumbo-ID: ce496fa9-c339-473d-a8c4-ddf966bcc699
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B8gPDM+qTyBAwXnMOvGRSEv4u7A/+ghbt9IuqV0i4Sc=;
        b=VXbnrMKyBMGsw49mIoVLtRoytAMaXgmgHEI7E6XDf8617xZNSZ83iES/tGFWYR0eLP
         WQm15K0jg3BxNADfRUQSbBnuWc1erL719uurWpXlLWA1UVj/zCh+EaGg5Fh6GaiB8JgQ
         S+N5IfcPobgqq6G3saQE4QycWEAl/wTjOhVx9t57ldwf5QgUkVC+r33MeB3mNN/2dK6N
         u2gVKXuRn+q9y39kKV6EnFtFlgfa/S/uw/EJz+OlgPbcUvOfhhf8YOYLLuLvwXPwvfpD
         r1rwhhh/gEsm2b4cf8GNfnkXMBb8wfFdZiJFfB7z2dfo7yxsg+eWTMHCBbeqb32SBvdg
         gOrA==
X-Gm-Message-State: AOAM533U1tTDJ4zMOD4+ySTOR4lCxrs6okzTHObWXcA8Jn0dCUFlsJZh
	6Xz8SBvWUWxvJcY7R91sRx4=
X-Google-Smtp-Source: ABdhPJy9ETK3U4N14nx2DDEPe670AotD347l51w1iM7RG9Rxh1AdmR2mR7Dd7Y/eGVcKlvUJEB59jQ==
X-Received: by 2002:a05:6000:104b:: with SMTP id c11mr4401985wrx.329.1607081737135;
        Fri, 04 Dec 2020 03:35:37 -0800 (PST)
Date: Fri, 4 Dec 2020 11:35:35 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 19/23] libxl: modify
 libxl_device_pci_assignable_add/remove/list/list_free()...
Message-ID: <20201204113535.kogsoqqvfykbg32x@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-20-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-20-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:30PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... to use 'libxl_pci_bdf' rather than 'libxl_device_pci'.
> 
> This patch modifies the API and callers accordingly. It also modifies
> several internal functions in libxl_pci.c that support the API to also use
> 'libxl_pci_bdf'.
> 
> NOTE: The OCaml bindings are adjusted to contain the interface change. It
>       should therefore not affect compatibility with OCaml-based utilities.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>

> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: David Scott <dave@recoil.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/include/libxl.h                |  15 +-
>  tools/libs/light/libxl_pci.c         | 213 +++++++++++++++------------
>  tools/ocaml/libs/xl/xenlight_stubs.c |  15 +-
>  tools/xl/xl_pci.c                    |  32 ++--
>  4 files changed, 156 insertions(+), 119 deletions(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 5edacccbd1da..5703fdf367c5 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -469,6 +469,13 @@
>   */
>  #define LIBXL_HAVE_PCI_BDF 1
>  
> +/*
> + * LIBXL_HAVE_PCI_ASSIGNABLE_BDF indicates that the
> + * libxl_device_pci_assignable_add/remove/list/list_free() functions all
> + * use the 'libxl_pci_bdf' type rather than 'libxl_device_pci' type.
> + */
> +#define LIBXL_HAVE_PCI_ASSIGNABLE_BDF 1
> +
>  /*
>   * libxl ABI compatibility
>   *
> @@ -2378,10 +2385,10 @@ int libxl_device_events_handler(libxl_ctx *ctx,
>   * added or is not bound, the functions will emit a warning but return
>   * SUCCESS.
>   */
> -int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
> -int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
> -libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
> -void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
> +int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
> +int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
> +libxl_pci_bdf *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
> +void libxl_device_pci_assignable_list_free(libxl_pci_bdf *list, int num);

Given these APIs are visible to external callers, you will need to
provide fallbacks for the old APIs.

Wei.

