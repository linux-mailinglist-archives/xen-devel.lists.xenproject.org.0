Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F6F8CE399
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 11:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729226.1134354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sARMd-00061b-Cb; Fri, 24 May 2024 09:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729226.1134354; Fri, 24 May 2024 09:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sARMd-0005zP-96; Fri, 24 May 2024 09:37:27 +0000
Received: by outflank-mailman (input) for mailman id 729226;
 Fri, 24 May 2024 09:37:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sARMb-0005zC-Jz
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 09:37:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sARMa-0006Rh-VL; Fri, 24 May 2024 09:37:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sARMa-0003t8-Oq; Fri, 24 May 2024 09:37:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=M/ap9Jl/BXKwelNgETJCV0tL+eXZ4a2GRGwQsFB6O8o=; b=BUdzL8IVN0nr0XocRyTfCRJ0uR
	0SD3XSPKk9JEyfAdvvLxHQ/Bf5Kuh/AW+NRVZvGExOgvL5rHB6seubfwinE8XHb2n7S5fziqpsTCO
	Tdg+JhsXH567GhikVz9LXO+guj2311oeaVs/WyV9YJo9UDuAc9bCwtM1twxhYbmlZReU=;
Message-ID: <59607ca9-3d78-4f8e-ad02-22df89cd9161@xen.org>
Date: Fri, 24 May 2024 10:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] tools: Introduce the "xl dt-overlay attach"
 command
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: anthony@xenproject.org, sstabellini@kernel.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 Henry Wang <xin.wang2@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
 <20240524021814.2666257-6-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240524021814.2666257-6-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/05/2024 03:18, Stefano Stabellini wrote:
> From: Henry Wang <xin.wang2@amd.com>
> 
> With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
> attach (in the future also detach) devices from the provided DT overlay
> to domains. Support this by introducing a new "xl dt-overlay" command
> and related documentation, i.e. "xl dt-overlay attach. Slightly rework
> the command option parsing logic.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   tools/include/libxl.h               | 15 +++++++++++
>   tools/include/xenctrl.h             |  3 +++
>   tools/libs/ctrl/xc_dt_overlay.c     | 31 +++++++++++++++++++++++
>   tools/libs/light/libxl_dt_overlay.c | 28 +++++++++++++++++++++
>   tools/xl/xl_cmdtable.c              |  4 +--
>   tools/xl/xl_vmcontrol.c             | 39 ++++++++++++++++++++---------
>   6 files changed, 106 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 3b5c18b48b..f2e19ec592 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -643,6 +643,12 @@
>    */
>   #define LIBXL_HAVE_NR_SPIS 1
>   
> +/*
> + * LIBXL_HAVE_OVERLAY_DOMAIN indicates the presence of
> + * libxl_dt_overlay_domain.
> + */
> +#define LIBXL_HAVE_OVERLAY_DOMAIN 1
I think this wants to gain DT_ just before OVERLAY. So from the name it 
is clearer we are talking about the Device-Tree overlay and not 
filesystem (or anything else where overlays are involved).

Cheers,

-- 
Julien Grall

