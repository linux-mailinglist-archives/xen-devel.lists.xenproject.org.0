Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E9511C6D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 18:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315302.533778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkoR-0003LQ-4p; Wed, 27 Apr 2022 16:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315302.533778; Wed, 27 Apr 2022 16:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkoR-0003IP-1y; Wed, 27 Apr 2022 16:46:47 +0000
Received: by outflank-mailman (input) for mailman id 315302;
 Wed, 27 Apr 2022 16:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y66U=VF=citrix.com=prvs=1094d0c61=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1njkoP-0003IJ-Dp
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 16:46:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d8427f1-c649-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 18:46:44 +0200 (CEST)
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
X-Inumbo-ID: 9d8427f1-c649-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651078004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=skXQWOW85Qc59F3aFRE2eu+rBo/OjDnk9C/8N+EWr2s=;
  b=M10hyQAyiFpIDcPJrt39D3zpvUDo59EZmQE6p9s7PXJfqCfBjwH7Fqwz
   t4X8QggB6a4e05VwNCyhgm1+r2mx366BWtn+xjtk1L1eEQWi4nVLiofuv
   srIm1WMokN+thp8/I9F1Gj8NmGAt530tDoegS8Asklap/E3S6I4HPnDlV
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69461338
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:T4kFsKrVInTTAmPZVTC5JaT+C0teBmIZZRIvgKrLsJaIsI4StFCzt
 garIBnUOauNZWene491Ot7l8kJXupTRn4NnGwJsqnsyRi0Q+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 4yq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBBYbspssndT9kKB4vPaxPoIOEA0qFmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIxPUieOkYUaj/7Drpjg/+FjX3jeQQHuUmT/YQHwkiK6zd+he2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34TiK6HW3ncfUgDj2HokVEdWQ9PRnnVmSzWw7EwANWB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEefhcK6
 HCzufXVPgM+sLycEU7e1IWuhGbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2j0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJczV/MBuaL9UdF1M2xpiGGeB6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSP7NvMtO93qUJ5CIU3c+TPNDK68UzazSsIpKF/vEN9GOCZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPODFbIGeZtGAbfNYgRsfLbyDg5B
 v4CbqNmPT0EC7agCsQWmKZORW03wY8TWM6m9pQLJrLSSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 BlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:QEiSM66Dnqmf4h8MLAPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="69461338"
Date: Wed, 27 Apr 2022 17:46:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v3] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Message-ID: <YmlzWqVm0lE6LriF@perard.uk.xensource.com>
References: <81ba388c-66ff-e191-0098-2f88a004105c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <81ba388c-66ff-e191-0098-2f88a004105c@suse.com>

On Wed, Apr 27, 2022 at 12:57:17PM +0200, Jan Beulich wrote:
> The reference "to shadow the resident processes" is applicable to
> domains (potentially) running in shadow mode only. Adjust the
> calculations accordingly. This, however, requires further parameters.
> Since the original function is deprecated anyway, and since it can't be
> changed (for being part of a stable ABI), introduce a new (internal
> only) function, with the deprecated one simply becoming a wrapper.
> 
> In dom0_paging_pages() also take the opportunity and stop open-coding
> DIV_ROUND_UP().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Refine expression in dom0_paging_pages(). Update comment there as
>     well.
> v2: Introduce libxl__get_required_paging_memory().
> 
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1017,7 +1017,7 @@ static bool ok_to_default_memkb_in_creat
>       * The result is that the behaviour with old callers is the same
>       * as in 4.13: no additional memory is allocated for shadow and
>       * iommu (unless the caller set shadow_memkb, eg from a call to
> -     * libxl_get_required_shadow_memory).
> +     * libxl__get_required_paging_memory).

I think in this comment, the "caller" is an application using libxl,
which might set shadow_memkb with a value from
libxl_get_required_shadow_memory(). So I don't think there's a need to
change the comment.


Otherwise, the patch looks good.
So with this chunk removed: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

