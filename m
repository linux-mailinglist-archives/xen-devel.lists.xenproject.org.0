Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8362DD8C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 15:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445239.700326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovfYu-0000Gr-6u; Thu, 17 Nov 2022 14:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445239.700326; Thu, 17 Nov 2022 14:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovfYu-0000Ep-4C; Thu, 17 Nov 2022 14:08:16 +0000
Received: by outflank-mailman (input) for mailman id 445239;
 Thu, 17 Nov 2022 14:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rqd=3R=citrix.com=prvs=313e1da35=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ovfYr-0000Eg-Tf
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 14:08:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43fdcc76-6681-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 15:08:11 +0100 (CET)
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
X-Inumbo-ID: 43fdcc76-6681-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668694091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YKHpP6lW34JfMJYVx9EtDiHz3wiqsWRfcLv69bvn/DY=;
  b=RgEyz7ekIjmNkrOG+A+Zc0petcv7bOlw7VKkun24NLUkGnbjgoO8676F
   304KKdqyfBr909sos/QBjdDXAp2JSfQJTiee6MiYUVLYUdxpTn6XdMgS7
   vL4Xi+ey/DmpRhsQHYlsLickjpFzqDp5WAedJIxhNL2s5Z5StcsuRPXSf
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85029151
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vMwkW6CxvfwgsRVW/97jw5YqxClBgxIJ4kV8jS/XYbTApGkmhGZRz
 zQfW2GHPfiMazT2LtB0b47g8BxVvJbQmNNgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpB4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5/9vLUdPz
 /oiLBM2fCKCmM29kJm4Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFJ4TQFJwIxy50o
 Err3XrdPE5GKeez0D6GwkChl77Ptnj0Ddd6+LqQqacx3Qz7KnYoIB8LUVq2p9Gph0j4XMhQQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/JuFOk95BCI27DjyQ+TDWgZTRZMcNUj8sQxQFQC9
 lKPhcKvOjVpv5WcU3fb/bCRxRu4NDIJN2YEaWkBRBEc/tj4iIgpi1TESdMLOL64iJj5FC/9x
 xiOrTMinPMDgMgTzaK58FvbxTW2qfDhbCQ4+wHWVWKN9R5iaciuYInAwUffxeZNKsCeVFbpg
 ZQfs5HAtqZUV8jLzXHTBrVWdF202xqbGCDFmXJJHqMnzTCOwGyRfJ9/62FVJ248Z67oZgTVS
 EPUvApQ4rpaM32rcbJ7buqNNig68UTzPY+7D66JN7KidrA0LVbap382OSZ8yki3yCARfbcD1
 YB3mCpGJVITEuxZwTW/XI/xOpd7l3lllQs/qX0WpilLMIZyhlbPF9/p03PUNIjVCZ9oRy2Lm
 +uzz+PQl31ivBTWO0E6Mec7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPn+N/Idc5wP4Lyb2gE
 pSBtqlwkwOXaZrvcFviV5yeQOm3AcYXQYwTYETAwmpEK1B8ON3yvc/zhrM8fKU99fwL8BKHZ
 6BtRihBa9wRIgn6F8M1N8ih8tM/KU/z32pj/UONOVACQnKpfCSRkveMQ+cl3HBm4vaf3Sfmn
 4Cd6w==
IronPort-HdrOrdr: A9a23:XbrnQawkNawxqmJC51o+KrPwLL1zdoMgy1knxilNoRw8SKKlfu
 SV7ZAmPH7P+VMssR4b9OxoVJPtfZqYz+8T3WBzB8bBYOCFgguVxehZhOOIqQEIWReOldK1vZ
 0QFZSWY+eQMbEVt6nH3DU=
X-IronPort-AV: E=Sophos;i="5.96,171,1665460800"; 
   d="scan'208";a="85029151"
Date: Thu, 17 Nov 2022 14:07:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Message-ID: <Y3ZAPyD+DzaoFF62@perard.uk.xensource.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
 <20221117010804.9384-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221117010804.9384-4-andrew.cooper3@citrix.com>

On Thu, Nov 17, 2022 at 01:08:03AM +0000, Andrew Cooper wrote:
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 2abaab439c4f..f8f7b7e81837 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -1448,6 +1448,25 @@ int libxl_userdata_unlink(libxl_ctx *ctx, uint32_t domid,
>      return rc;
>  }
>  
> +int libxl__domain_set_p2m_pool_size(
> +    libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid)
> +{
> +    libxl_ctx *ctx = libxl__gc_owner(gc);
> +    uint64_t shadow_mem;
> +
> +    shadow_mem = d_config->b_info.shadow_memkb;
> +    shadow_mem <<= 10;
> +
> +    int r = xc_set_paging_mempool_size(ctx->xch, domid, shadow_mem);

Nit: 'ctx' could be replace by using the macro 'CTX', without having to
declare a local ctx variable.


With or without this changed, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

