Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548C441690E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194692.346899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZGy-0003JF-Ep; Fri, 24 Sep 2021 00:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194692.346899; Fri, 24 Sep 2021 00:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZGy-0003Gq-AR; Fri, 24 Sep 2021 00:41:04 +0000
Received: by outflank-mailman (input) for mailman id 194692;
 Fri, 24 Sep 2021 00:41:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZGw-0003Dl-5N
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:41:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16d508e1-1cd0-11ec-ba94-12813bfff9fa;
 Fri, 24 Sep 2021 00:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D4E060F3A;
 Fri, 24 Sep 2021 00:41:00 +0000 (UTC)
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
X-Inumbo-ID: 16d508e1-1cd0-11ec-ba94-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632444060;
	bh=d9sS+FOKFjc8Geb60S3J1WOFkjNcNJU0QtUT+GNO7+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bR7q9ee+DAk96HIm7UxieidBjbKV7oBiQEQj5lwTEFTWeR2oQRnwANkB+Rp/9CmsW
	 P8p3R0LktQH9eu41Q8zo3GaXeCOPN95QvLJ11Nhhq8NmBaCY66dpITXhIkTGUWU19y
	 rdSoDtKQhs5DwbWvBSw2uLw1NfNrYBbMPYLBzDQ7wbMlXfSKClulm8RwofiQPt+Zte
	 jATZ8rrWPaadil3+oygvHOQBxiytLjzpud1AADcHt8+C+mbz+5GyIDMxBcJdDibrxp
	 ZFLGUsIkL6wupwNshdifDJPQD8H5SJMmPXiAliNN1+0IW9yo7fC+9XDGswTs6LpkwQ
	 Jl+ggTX5stG2Q==
Date: Thu, 23 Sep 2021 17:41:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 16/37] xen/x86: export srat_bad to external
In-Reply-To: <20210923120236.3692135-17-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231740510.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-17-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers


On Thu, 23 Sep 2021, Wei Chen wrote:
> srat_bad is used when NUMA initialization code scan SRAT failed.
> It will turn fw_numa to disabled status. Its implementation depends
> on NUMA implementation. We want every NUMA implementation to provide
> this function for common initialization code.
> 
> In this patch, we export srat_bad to external. This will allow to
> have the code mostly common.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/srat.c        | 2 +-
>  xen/include/asm-x86/numa.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 0b8b0b0c95..94bd5b34da 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -163,7 +163,7 @@ static __init void cutoff_node(int i, paddr_t start, paddr_t end)
>  	}
>  }
>  
> -static __init void bad_srat(void)
> +__init void bad_srat(void)
>  {
>  	int i;
>  	printk(KERN_ERR "SRAT: SRAT not used.\n");
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index 295f875a51..a5690a7098 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -32,6 +32,7 @@ extern bool numa_off;
>  
>  
>  extern int srat_disabled(void);
> +extern void bad_srat(void);
>  extern void numa_set_node(int cpu, nodeid_t node);
>  extern nodeid_t setup_node(unsigned int pxm);
>  extern void srat_detect_node(int cpu);
> -- 
> 2.25.1
> 

