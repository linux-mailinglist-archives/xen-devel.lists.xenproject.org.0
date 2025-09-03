Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A9B42775
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 19:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108812.1458819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utqql-0007zG-VH; Wed, 03 Sep 2025 17:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108812.1458819; Wed, 03 Sep 2025 17:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utqql-0007xn-Sg; Wed, 03 Sep 2025 17:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1108812;
 Wed, 03 Sep 2025 17:00:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1utqqk-0007xh-29
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 17:00:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1utqqj-004gM4-0I;
 Wed, 03 Sep 2025 17:00:45 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1utqqj-00EfpY-01;
 Wed, 03 Sep 2025 17:00:45 +0000
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
	bh=iEeNnU+R5bAInwKCWmP6SzRyhcG+xOojmDNTmaPqRLI=; b=5d1fbF8ZR41KkRyM5TWinR5xR2
	2G1lVw/viUnvdYuA41BSmEh67eWrpuDX+N3C4aLTlk/Jh2+1SEuLpbok7T18dbZTpxEOO8RZHCVkl
	bWYXDFvSP+0i+JRoBbrGnm9910lVZRh6Ey4kQflBWIJS556EDnmT9fVC0neSL9wOpkFo=;
Date: Wed, 3 Sep 2025 19:00:42 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jahan Murudi <jahan.murudi.zg@renesas.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v4 2/4] xentop: add pcpu implementation with proper error
 handling
Message-ID: <aLh0OrD3LxxS5KHS@l14>
References: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
 <20250903102323.2553142-3-jahan.murudi.zg@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903102323.2553142-3-jahan.murudi.zg@renesas.com>

On Wed, Sep 03, 2025 at 03:53:21PM +0530, Jahan Murudi wrote:
> diff --git a/tools/xentop/pcpu.c b/tools/xentop/pcpu.c
> new file mode 100644
> index 0000000000..cdb4cb2131
> --- /dev/null
> +++ b/tools/xentop/pcpu.c
[..]
> +/* Accessor functions for xentop.c */
> +int get_pcpu_count(void)
> +{
> +    return allocated_pcpus;
> +}
> +
> +float get_pcpu_usage(int cpu_index)

You could use `size_t` instead of `int` for the `cpu_index`, and then,
no need to check for negatives. `allocated_pcpus` could also be `size_t`
or `unsigned int`, since "0" mean not available, we don't need "-1" or
other negative numbers.

> +{
> +    if (!pcpu_stats || cpu_index < 0 || cpu_index >= allocated_pcpus) {
> +        return 0.0;
> +    }
> +    return pcpu_stats[cpu_index].usage_pct;
> +}

Thanks,

-- 
Anthony PERARD

