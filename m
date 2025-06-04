Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB22ACE171
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005694.1385114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMq4k-0004HM-C8; Wed, 04 Jun 2025 15:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005694.1385114; Wed, 04 Jun 2025 15:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMq4k-0004Fv-9M; Wed, 04 Jun 2025 15:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1005694;
 Wed, 04 Jun 2025 15:30:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMq4j-0004Fp-Bz
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:30:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMq4i-001xey-2y;
 Wed, 04 Jun 2025 15:30:44 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMq4j-002VFC-0F;
 Wed, 04 Jun 2025 15:30:44 +0000
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
	bh=DRLG+PyVcgEL1nJqbsbEqw1b4C7pXgsy8kpVYFM30VM=; b=KNOrvLUS6IVNltpBYGObCszLkk
	Mim9aD4rUyBSTbYnAqAVi58ImaS9W+dg4CB0igHPtH2YEz7rTn9ptelQLG3Xyoei6Blf+JBXQUpva
	bW4KG/4hOhb8TzfoLEj47hhGhQ0rzPqbHN0eWDdMHrqBZqVRot+MOF+BG3JXW6xD5fMc=;
Date: Wed, 4 Jun 2025 17:30:42 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 4/5] libxc/PM: Ensure pxstat buffers are correctly
 sized
Message-ID: <aEBmouMKhk56UW8k@l14>
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
 <20250527152635.2451449-5-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527152635.2451449-5-ross.lagerwall@citrix.com>

On Tue, May 27, 2025 at 04:26:34PM +0100, Ross Lagerwall wrote:
> diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
> index ff7b5ada053f..0bd79031044f 100644
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -46,35 +46,34 @@ int xc_pm_get_pxstat(xc_interface *xch, int cpuid, struct xc_px_stat *pxpt)
>  {
>      struct xen_sysctl sysctl = {};
>      /* Sizes unknown until xc_pm_get_max_px */

This comment is wrong now and can be removed.

> -    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> -    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> +    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt,
> +                                   pxpt->total * pxpt->total * sizeof(uint64_t),
> +                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> +    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt,
> +                                   pxpt->total * sizeof(struct xc_px_val),
> +                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);

The rest of the patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

