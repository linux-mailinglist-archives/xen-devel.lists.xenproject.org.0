Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220ED20D066
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 19:32:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpxd7-0003FN-Px; Mon, 29 Jun 2020 17:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUBK=AK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jpxd5-0003FI-Pr
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 17:31:39 +0000
X-Inumbo-ID: 632c20f8-ba2e-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 632c20f8-ba2e-11ea-b7bb-bc764e2007e4;
 Mon, 29 Jun 2020 17:31:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 973D423A9E;
 Mon, 29 Jun 2020 17:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593451898;
 bh=pZLE0/dEHdwtp1oF+MjAXEqXTqNgCVHIaSv2gtI5f9s=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=f8qUjanzM6fLEdaY60FSVA2CwIpF7kO3WkjuSqnlYh2jAqvKu+o1wsZn6UNERVwIF
 d5ckFCxNes91ngGOaJMu6uCEBfCbVaipt8RQGri9T2gF+zuWrwVtmqNzy7jmm4wNgB
 LkU2C0N/4opuiae+izYpmAUFEmj7mr1ZBpWbIpd4=
Date: Mon, 29 Jun 2020 10:31:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Xiaofei Tan <tanxiaofei@huawei.com>
Subject: Re: [PATCH] arm/xen: remove the unused macro GRANT_TABLE_PHYSADDR
In-Reply-To: <1593305826-28279-1-git-send-email-tanxiaofei@huawei.com>
Message-ID: <alpine.DEB.2.21.2006291031050.8121@sstabellini-ThinkPad-T480s>
References: <1593305826-28279-1-git-send-email-tanxiaofei@huawei.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, sstabellini@kernel.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, linux@armlinux.org.uk, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, linux-arm-kernel@lists.infradead.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, 28 Jun 2020, Xiaofei Tan wrote:
> Fix the following sparse warning:
> 
> arch/arm64/xen/../../arm/xen/enlighten.c:244: warning: macro
> "GRANT_TABLE_PHYSADDR" is not used [-Wunused-macros]
> 
> It is an isolated macro, and should be removed when its last user
> was deleted in the following commit 3cf4095d7446 ("arm/xen: Use
> xen_xlate_map_ballooned_pages to setup grant table")
> 
> Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  arch/arm/xen/enlighten.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index fd4e1ce1..e93145d 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -241,7 +241,6 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
>   * see Documentation/devicetree/bindings/arm/xen.txt for the
>   * documentation of the Xen Device Tree format.
>   */
> -#define GRANT_TABLE_PHYSADDR 0
>  void __init xen_early_init(void)
>  {
>  	of_scan_flat_dt(fdt_find_hyper_node, NULL);
> -- 
> 2.7.4
> 

