Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7188A6CE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 16:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697793.1088917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romMa-0007NR-Vd; Mon, 25 Mar 2024 15:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697793.1088917; Mon, 25 Mar 2024 15:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romMa-0007Kh-Si; Mon, 25 Mar 2024 15:35:52 +0000
Received: by outflank-mailman (input) for mailman id 697793;
 Mon, 25 Mar 2024 15:35:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMIF=K7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1romMZ-0007Kb-BE
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 15:35:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b203f1c-eabd-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 16:35:49 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4148c681e3bso1455305e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 08:35:49 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b004148a667953sm2622330wmb.8.2024.03.25.08.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 08:35:48 -0700 (PDT)
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
X-Inumbo-ID: 5b203f1c-eabd-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711380949; x=1711985749; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=buP1+Ge855Sd7bv2LVUKWUJRTB9ZGBqIG29F5rApJYg=;
        b=Aezh/A0NQAcVmTy5QheTcUWca4XurMpSbxhW+zTtJTaMMTlxOcDm1vH88oOQoGLTkH
         Jx1rf6AJDP47nlL5zO4Lt/vfBE6j2PmEStlrFGhIHNGWDNG18/aA0e8hdzsR5z8euzCR
         VdeAl9wesf9vmHAVaIjWd0yjsY74SJFO/eL6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711380949; x=1711985749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buP1+Ge855Sd7bv2LVUKWUJRTB9ZGBqIG29F5rApJYg=;
        b=VchMGEI76CHDou+ruo8aQR1QKb9ntnpuwNHlbZfibhCRAid27Cxsir4lpDN6SPZPG5
         I0K5qFKF3jqnKynWysWn0PjhMu5rFwxpvqiQgf37RbQ+AlJlOXigbCxbOW0+x1G0fVM3
         HH/1zucYqIyml+2qUKzhjbebbPuQlUfYlcvnpQ4UA/6IklFwEiPZ5y8/gcTt6OGa5ZBB
         lMBznvJuqNOV7QWMHvbWomehHOYRPgQNicRCQqKGRmLuHKvFkjOiy2RyOZ2Wz+285rTH
         hHXxFivQh6mmyRFQp1jEVrtCYUPKhG91uyiKxofoDuEaw5QI2s+dHgf558EIXqgw7wCY
         2/uw==
X-Gm-Message-State: AOJu0Yzy6VnZbIV2qgn+VVvOL0eIJCipTipPFIXlLQuSCHhphbOuIu+w
	HelR2FtScxm/mj0gcVPm24geAtdTY/11UIVkZpGD1Awf+/tkKlOr4KQ8YHHjFhM=
X-Google-Smtp-Source: AGHT+IGu+STknhlfeLWRgahb2ONynsTNg8rJdUW8VCcmC/kngvR4rDZ002y2a0lYYZ49325E0NniMA==
X-Received: by 2002:a05:600c:1d28:b0:414:6a1d:2013 with SMTP id l40-20020a05600c1d2800b004146a1d2013mr6022575wms.16.1711380948854;
        Mon, 25 Mar 2024 08:35:48 -0700 (PDT)
Date: Mon, 25 Mar 2024 15:35:47 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Henry Wang <xin.wang2@amd.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alec Kwapis <alec.kwapis@medtronic.com>
Subject: Re: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume
 XEN_DOMCTL_get_mem_map
Message-ID: <9162a331-645c-4e45-b5d0-57c6b9b4f79b@perard>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
 <20240308015435.4044339-6-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308015435.4044339-6-xin.wang2@amd.com>

On Fri, Mar 08, 2024 at 09:54:35AM +0800, Henry Wang wrote:
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> index fee93459c4..92c612f6da 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -23,16 +23,30 @@ static int alloc_xs_page(struct xc_interface_core *xch,
>                           libxl_dominfo *info,
>                           uint64_t *xenstore_pfn)
>  {
> -    int rc;
> -    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
> -    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
> +    int rc, i;
> +    xen_pfn_t base = ((xen_pfn_t)-1);
> +    xen_pfn_t p2m = ((xen_pfn_t)-1);
> +    uint32_t nr_regions = XEN_MAX_MEM_REGIONS;
> +    struct xen_mem_region mem_regions[XEN_MAX_MEM_REGIONS] = {0};
> +
> +    rc = xc_get_domain_mem_map(xch, info->domid, mem_regions, &nr_regions);

Shouldn't you check the value of in `rc`?

> +    for ( i = 0; i < nr_regions; i++ )
> +    {
> +        if ( mem_regions[i].type == GUEST_MEM_REGION_MAGIC )
> +        {
> +            base = mem_regions[i].start >> XC_PAGE_SHIFT;
> +            p2m = (mem_regions[i].start >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
> +        }
> +    }

Thanks,

-- 
Anthony PERARD

