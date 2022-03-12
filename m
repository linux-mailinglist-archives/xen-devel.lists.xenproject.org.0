Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF34D6BC9
	for <lists+xen-devel@lfdr.de>; Sat, 12 Mar 2022 03:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289304.490852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSr4I-0002Jn-L3; Sat, 12 Mar 2022 02:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289304.490852; Sat, 12 Mar 2022 02:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSr4I-0002Gh-Hg; Sat, 12 Mar 2022 02:01:18 +0000
Received: by outflank-mailman (input) for mailman id 289304;
 Sat, 12 Mar 2022 02:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b/J2=TX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nSr4G-0002Gb-Ra
 for xen-devel@lists.xenproject.org; Sat, 12 Mar 2022 02:01:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c2fb323-a1a8-11ec-853a-5f4723681683;
 Sat, 12 Mar 2022 03:01:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 136E6B80EF1;
 Sat, 12 Mar 2022 02:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D59C340E9;
 Sat, 12 Mar 2022 02:01:12 +0000 (UTC)
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
X-Inumbo-ID: 4c2fb323-a1a8-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647050472;
	bh=jlJTQC9rL0Ohy92tmOfNWwQooasADfiPhpQpT96wHT8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fbl40iQmu8txLiFBKEbYE87/V1sERSDFH6uAO0+5GS7MChg26w54kZeRfO4Nzrwqj
	 ZbrLkjWJLk2TktdvkZwqaiRpn/Cu0ANALocft3bD+gI2aoYHndgi9m2ylD1KOqYteX
	 siqCfjrZ8kVfjYh7PsfBqBRfGTl0CQHcSE2UqD6dAbbgX47pPeLrvXuG5x5Dp0Ln4n
	 7H7YaPpX/4HKIPs1oOTUJYsCw5Syl/j4HbtAQIdiLQ6Iccwov3+zTQZsBeaiU96pJQ
	 iuH1YRvi3w7fzTFy/pacesE9nssq3TfFIbjhGBiHswZSZBPE4iENNXUQSnIN6t7PEx
	 bXd/T5MfXfOlw==
Date: Fri, 11 Mar 2022 18:01:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Miaoqian Lin <linmq006@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Shannon Zhao <shannon.zhao@linaro.org>, 
    Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm/xen: Fix refcount leak in xen_dt_guest_init
In-Reply-To: <20220309102442.14726-1-linmq006@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203111756000.3497@ubuntu-linux-20-04-desktop>
References: <20220309102442.14726-1-linmq006@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Mar 2022, Miaoqian Lin wrote:
> The of_find_compatible_node() function returns a node pointer with
> refcount incremented, We should use of_node_put() on it when done
> Add the missing of_node_put() to release the refcount.
> 
> Fixes: 9b08aaa3199a ("ARM: XEN: Move xen_early_init() before efi_init()")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Thanks for the patch!


> ---
>  arch/arm/xen/enlighten.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index ec5b082f3de6..262f45f686b6 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -424,6 +424,7 @@ static void __init xen_dt_guest_init(void)
>  
>  	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
>  		pr_err("Xen grant table region is not found\n");
> +		of_node_put(xen_node);
>  		return;
>  	}

This is adding a call to of_node_put on the error path. Shouldn't it
be called also in the non-error path?

Also, there is another instance of of_address_to_resource being called
in this file (in arch_xen_unpopulated_init), does it make sense to call
of_node_put there too?

