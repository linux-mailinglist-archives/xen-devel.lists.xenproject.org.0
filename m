Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1074073A0
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 00:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184816.333575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpQL-0000rO-G4; Fri, 10 Sep 2021 22:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184816.333575; Fri, 10 Sep 2021 22:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpQL-0000pb-D7; Fri, 10 Sep 2021 22:55:09 +0000
Received: by outflank-mailman (input) for mailman id 184816;
 Fri, 10 Sep 2021 22:55:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOpQK-0000pV-NO
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 22:55:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24c38af8-128a-11ec-b291-12813bfff9fa;
 Fri, 10 Sep 2021 22:55:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEE1C611AD;
 Fri, 10 Sep 2021 22:55:06 +0000 (UTC)
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
X-Inumbo-ID: 24c38af8-128a-11ec-b291-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631314507;
	bh=VJ5ipnbbr7/hh4BSPRAZdwAh7k+W87MfA9moLBnzp0s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WkQpk6kZbm/ZHT+FsrAzCBeXuYhUISywAxkP9plMEH2n2yyeze9UKk7QZTjhgDLXN
	 51ugguyIEa/+V8LllhC/PNyCzFILxyuwld5PTQB2gF4M9FfA5EJt7JAcq3fUkXc44z
	 RjLXp9WELfVVxbNKwIxQ+1Fn2mq3NPHvUxZC/cf6KQkGWTHozf5VM/7/PVvDpAxYv0
	 zQx4Vfyar5oZnFDNHBNymesr4CjJu1q1T9D1vPA995FUeYqCST0KdgOrc2bd+G/sP+
	 xlo2BLhCiOi7UGnuyGemVt7DQkI2HbKUIPvBywaJNaw14X2oT5UAyJCJ2CdShrDZ2Z
	 ZUniSmG/6PxxA==
Date: Fri, 10 Sep 2021 15:55:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 01/12] swiotlb-xen: avoid double free
In-Reply-To: <ce9c2adb-8a52-6293-982a-0d6ece943ac6@suse.com>
Message-ID: <alpine.DEB.2.21.2109101554370.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <ce9c2adb-8a52-6293-982a-0d6ece943ac6@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> Of the two paths leading to the "error" label in xen_swiotlb_init() one
> didn't allocate anything, while the other did already free what was
> allocated.
> 
> Fixes: b82776005369 ("xen/swiotlb: Use the swiotlb_late_init_with_tbl to init Xen-SWIOTLB late when PV PCI is used")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -216,7 +216,6 @@ error:
>  		goto retry;
>  	}
>  	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
> -	free_pages((unsigned long)start, order);
>  	return rc;
>  }
>  
> 

