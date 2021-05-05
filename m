Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2752374392
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 19:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123250.232459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLXL-0000Ue-B4; Wed, 05 May 2021 17:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123250.232459; Wed, 05 May 2021 17:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leLXL-0000Ry-70; Wed, 05 May 2021 17:42:15 +0000
Received: by outflank-mailman (input) for mailman id 123250;
 Wed, 05 May 2021 17:42:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu7P=KA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1leLXJ-0000Rs-I0
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 17:42:13 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 030085a5-d1c5-4ed7-8586-a6807b44342a;
 Wed, 05 May 2021 17:42:12 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l2so2738284wrm.9
 for <xen-devel@lists.xenproject.org>; Wed, 05 May 2021 10:42:12 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id q12sm5465702wmj.7.2021.05.05.10.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 10:42:11 -0700 (PDT)
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
X-Inumbo-ID: 030085a5-d1c5-4ed7-8586-a6807b44342a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5ck4hA6Xxm2yKJj3VL+ZRwH+wBOpSKpRNDlAP7W/xkY=;
        b=sqQ1P5bx1mEgzNpROO/fxDPLD91nT9gDAoarQLa7BmVjX+WVZbS3rBTTNHLYFjIFDH
         5zj2pxzaeX4XMXJCmuJ6jzw0XeQOFEt2APMz30Aom4+taAvFdx5rM2KAHCYZhx/hu95P
         TrvajzfUn6kYigiFSjofr5NVPr/kEHrz2NAfon1+zIAojtRgbhDWmBW3hWhXus1zpYbi
         0OqHDmOwMs97yExn2XSUhf6RKK2G3i7E0Ji0i/uUwDcXEcqLiywbnNAbo21yz/g1kPW6
         hakyTnxKg2W8Do32DUD9qoCuw6A4LfozyWo2O6VPiBK27Rqpzme96FXVe1X9FavAI7/T
         phCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5ck4hA6Xxm2yKJj3VL+ZRwH+wBOpSKpRNDlAP7W/xkY=;
        b=Y2ymKZtJX6t6Vrb9e4tNXE6lFj1LKx8dItQM8b6IjdFkbZTFwUNl4odrIf+sZTg8SD
         RwvGJvMiAOOeXYyOZQXpihRvj+AI5X7/lUR5ciuX4nDZUTBroRJ5kTsKSf8UDoYRf9gj
         gplOJaifwfdVBR3YObuCPclGRz9b0iU18Jhg3uhi8jZRlu5o/SLbGQAJgQDALFInApRr
         od9QknUryiYn2r1ih3t4Yzc2XPTzYhgxR/efoOgKtMdez0EkdehlIYDSjcaT8cpbS2TY
         SVGmQrGfOrozo5aIOupzwb2B2YyJHHJu9xxiSA0BlwMXlvpJNWOp04fm6OiN2jSeLXJq
         48MQ==
X-Gm-Message-State: AOAM531dMD2LbiVhGtyZDL8xyohVQhkPvtZy25283vubLXG2kgPWyT63
	Hb6Gtj8MNeCe4pAFv/k6VNuDgym6zRs=
X-Google-Smtp-Source: ABdhPJyKeePxveTaMDHr01H0ue6iC6KDu7zCB1oEN0SxiOtXKt6kgydav7ZtpWMIR5bgS3/BkLoc6w==
X-Received: by 2002:adf:a316:: with SMTP id c22mr229727wrb.202.1620236531877;
        Wed, 05 May 2021 10:42:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen: Free xenforeignmemory_resource at exit
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20210430163742.469739-1-anthony.perard@citrix.com>
Message-ID: <32263046-97a5-b163-ff23-746effb5c7e4@xen.org>
Date: Wed, 5 May 2021 18:42:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430163742.469739-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30/04/2021 17:37, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Because Coverity complains about it and this is one leak that Valgrind
> reports.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>   hw/i386/xen/xen-hvm.c       | 9 ++++++---
>   include/hw/xen/xen_common.h | 6 ++++++
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 7ce672e5a5c3..47ed7772fa39 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -109,6 +109,7 @@ typedef struct XenIOState {
>       shared_iopage_t *shared_page;
>       shared_vmport_iopage_t *shared_vmport_page;
>       buffered_iopage_t *buffered_io_page;
> +    xenforeignmemory_resource_handle *fres;
>       QEMUTimer *buffered_io_timer;
>       CPUState **cpu_by_vcpu_id;
>       /* the evtchn port for polling the notification, */
> @@ -1254,6 +1255,9 @@ static void xen_exit_notifier(Notifier *n, void *data)
>       XenIOState *state = container_of(n, XenIOState, exit);
>   
>       xen_destroy_ioreq_server(xen_domid, state->ioservid);
> +    if (state->fres != NULL) {
> +        xenforeignmemory_unmap_resource(xen_fmem, state->fres);
> +    }
>   
>       xenevtchn_close(state->xce_handle);
>       xs_daemon_close(state->xenstore);
> @@ -1321,7 +1325,6 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
>   static int xen_map_ioreq_server(XenIOState *state)
>   {
>       void *addr = NULL;
> -    xenforeignmemory_resource_handle *fres;
>       xen_pfn_t ioreq_pfn;
>       xen_pfn_t bufioreq_pfn;
>       evtchn_port_t bufioreq_evtchn;
> @@ -1333,12 +1336,12 @@ static int xen_map_ioreq_server(XenIOState *state)
>        */
>       QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
>       QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
> -    fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
> +    state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
>                                            XENMEM_resource_ioreq_server,
>                                            state->ioservid, 0, 2,
>                                            &addr,
>                                            PROT_READ | PROT_WRITE, 0);
> -    if (fres != NULL) {
> +    if (state->fres != NULL) {
>           trace_xen_map_resource_ioreq(state->ioservid, addr);
>           state->buffered_io_page = addr;
>           state->shared_page = addr + TARGET_PAGE_SIZE;
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 82e56339dd7e..a8118b41acfb 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -134,6 +134,12 @@ static inline xenforeignmemory_resource_handle *xenforeignmemory_map_resource(
>       return NULL;
>   }
>   
> +static inline int xenforeignmemory_unmap_resource(
> +    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
> +{
> +    return 0;
> +}
> +
>   #endif /* CONFIG_XEN_CTRL_INTERFACE_VERSION < 41100 */
>   
>   #if CONFIG_XEN_CTRL_INTERFACE_VERSION < 41000
> 


