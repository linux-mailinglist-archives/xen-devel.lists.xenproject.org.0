Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CBBAC40F3
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 16:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997554.1378379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJYRI-0000tf-Th; Mon, 26 May 2025 14:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997554.1378379; Mon, 26 May 2025 14:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJYRI-0000sE-QX; Mon, 26 May 2025 14:04:28 +0000
Received: by outflank-mailman (input) for mailman id 997554;
 Mon, 26 May 2025 14:04:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJYRH-0000s8-Kp
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 14:04:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJYRH-003NqO-0P;
 Mon, 26 May 2025 14:04:27 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJYRH-00B4Pv-0v;
 Mon, 26 May 2025 14:04:27 +0000
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
	bh=5BgaXdr/vKuzsg8WVwZCxL7LG1BCWICSR08CUjVVBdc=; b=x3/bdbaEuuUEyAz5NWtt+IJYcX
	tCcU+p2N4QeFVT3BS0nyVGuxBbXdgqXKgrmYLrFoUs8h8vvdptMy/4ud6SnrEDD4J1V7uWlcqqSAm
	zNUuAqmKSGUjJ+UrU4hV2iWWSjOoj+ud1ye7At8/Kq/vUANH9/xRK/t5w54QHC0KohU0=;
Date: Mon, 26 May 2025 16:04:25 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 4/5] libxc/PM: Ensure pxstat buffers are correctly
 sized
Message-ID: <aDR06TT7JJFqHc_u@l14>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-5-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512144656.314925-5-ross.lagerwall@citrix.com>

On Mon, May 12, 2025 at 03:46:55PM +0100, Ross Lagerwall wrote:
> diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
> index ff7b5ada053f..cffbd1b8a955 100644
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -46,35 +46,33 @@ int xc_pm_get_pxstat(xc_interface *xch, int cpuid, struct xc_px_stat *pxpt)
>  {
>      struct xen_sysctl sysctl = {};
>      /* Sizes unknown until xc_pm_get_max_px */

This comment can be removed now.

> -    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> -    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, 0, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> +    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt,
> +                                   pxpt->total * pxpt->total,
> +                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> +    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, pxpt->total,
> +                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);

I don't think the macro takes the sizeof(*pt) or sizeof(*trans_pt) into
account when using the size provided. So it doesn't looks like you can
use `pxpt->total` alone, and you still need to multiple it by sizeof(*)
like it was done in the HYPERCALL_BOUNCE_SET_SIZE() call.

[...]
> -    HYPERCALL_BOUNCE_SET_SIZE(trans, max_px * max_px * sizeof(uint64_t));
> -    HYPERCALL_BOUNCE_SET_SIZE(pt, max_px * sizeof(struct xc_px_val));


Thanks,

-- 
Anthony PERARD

