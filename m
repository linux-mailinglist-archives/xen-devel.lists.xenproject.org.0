Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148AD8C3066
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 11:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720272.1123380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5jJM-0000SW-2A; Sat, 11 May 2024 09:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720272.1123380; Sat, 11 May 2024 09:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5jJL-0000Pt-VK; Sat, 11 May 2024 09:46:35 +0000
Received: by outflank-mailman (input) for mailman id 720272;
 Sat, 11 May 2024 09:46:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5jJK-0000Pn-9F
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 09:46:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5jJI-0005Ft-Dq; Sat, 11 May 2024 09:46:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5jJI-0000M1-8D; Sat, 11 May 2024 09:46:32 +0000
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
	bh=og76OEDatqruWuco+k6x3qQ+7PlUJSmh337By1tf1J4=; b=x1yfeCO31fdHDr1rLG4xBTK4yR
	tCiyLGRZ9skv1XyMmCcQBQaJavg/9pVFdrxhA0P/TEshcCHpCIYYZkoSfr7Sx7zytHK614D4zI+7U
	YZResUk4Y9n5FNxDmxZEiur2F0hFmOijW+QqsNYHnbPRoHhApKAF4UvqVajT1QbzUdtA=;
Message-ID: <d33ea00d-890d-45cc-9583-64c953abd70f@xen.org>
Date: Sat, 11 May 2024 10:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tools/init-dom0less: Avoid hardcoding
 GUEST_MAGIC_BASE
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
 <20240511005611.83125-4-xin.wang2@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240511005611.83125-4-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 11/05/2024 01:56, Henry Wang wrote:
> Currently the GUEST_MAGIC_BASE in the init-dom0less application is
> hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
> DomUs.
> 
> Since the guest magic region is now allocated from the hypervisor,
> instead of hardcoding the guest magic pages region, use
> xc_hvm_param_get() to get the guest magic region PFN, and based on
> that the XenStore PFN can be calculated. Also, we don't need to set
> the max mem anymore, so drop the call to xc_domain_setmaxmem(). Rename
> the alloc_xs_page() to get_xs_page() to reflect the changes.
> 
> Take the opportunity to do some coding style improvements when possible.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - Update HVMOP keys name.
> ---
>   tools/helpers/init-dom0less.c | 40 +++++++++++++++--------------------
>   1 file changed, 17 insertions(+), 23 deletions(-)
> 
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> index fee93459c4..04039a2a66 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -19,24 +19,20 @@
>   #define XENSTORE_PFN_OFFSET 1

Based on previous discussion, I think this wants to be 0 so the 
hypervisor only need to allocate one page (rather than 2 with the 
current offset).

>   #define STR_MAX_LENGTH 128
>   
> -static int alloc_xs_page(struct xc_interface_core *xch,
> -                         libxl_dominfo *info,
> -                         uint64_t *xenstore_pfn)
> +static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
> +                       uint64_t *xenstore_pfn)
>   {
>       int rc;
> -    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
> -    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
> +    xen_pfn_t magic_base_pfn;
>   
> -    rc = xc_domain_setmaxmem(xch, info->domid,
> -                             info->max_memkb + (XC_PAGE_SIZE/1024));
> -    if (rc < 0)
> -        return rc;
> -
> -    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
> -    if (rc < 0)
> -        return rc;
> +    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_HV_RSRV_BASE_PFN,
> +                          &magic_base_pfn);
> +    if (rc < 0) {
> +        printf("Failed to get HVM_PARAM_HV_RSRV_BASE_PFN\n");
> +        return 1;
> +    }
>   

If we go down the route of using HVM_PARAM... then we should avoid to 
rely on the hypervisor to provide a large enough region. So we should 
check the offset against the size.

Cheers,

-- 
Julien Grall

