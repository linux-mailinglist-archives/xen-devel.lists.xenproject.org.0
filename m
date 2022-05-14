Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8D527130
	for <lists+xen-devel@lfdr.de>; Sat, 14 May 2022 15:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329082.552267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nprjg-0001zf-U4; Sat, 14 May 2022 13:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329082.552267; Sat, 14 May 2022 13:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nprjg-0001xN-R4; Sat, 14 May 2022 13:23:08 +0000
Received: by outflank-mailman (input) for mailman id 329082;
 Sat, 14 May 2022 13:23:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nprje-0001xH-Qd
 for xen-devel@lists.xenproject.org; Sat, 14 May 2022 13:23:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nprje-0002I1-CW; Sat, 14 May 2022 13:23:06 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nprje-0003Qk-5k; Sat, 14 May 2022 13:23:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=rAaL0YyQ50BFIgh8ZTQTnXJacUlZgAiT4TvkfreFlmw=; b=vc0JQ3gUZJITDWgFI7fXopj5LK
	3TatdKXETqkjq/Tjy9liObQyrgG6cEZHgshCce7msL6L0Z8sgzx4A+GithzuMlpEavTs9V9vB7n4W
	SzbinkgZJbBgqZmqw5qcI28e8DmNN/gNkLLB/2arWOseu58gOmweVsnlSmwZGRf6UsH8=;
Message-ID: <898455df-f076-46ac-0c86-d11b3e9e5905@xen.org>
Date: Sat, 14 May 2022 14:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
 <20220513210730.679871-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v7 3/7] xen: introduce xen,enhanced dom0less property
In-Reply-To: <20220513210730.679871-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/05/2022 22:07, Stefano Stabellini wrote:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c4dd211b91..8d148b209d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3157,6 +3157,7 @@ static int __init construct_domU(struct domain *d,
>                                    const struct dt_device_node *node)
>   {
>       struct kernel_info kinfo = {};
> +    const char *dom0less_enhanced;
>       int rc;
>       u64 mem;
>   
> @@ -3172,6 +3173,17 @@ static int __init construct_domU(struct domain *d,
>   
>       kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>   
> +    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
> +    if ( rc == -EILSEQ ||
> +         rc == -ENODATA ||
> +         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
> +    {
> +        if ( hardware_domain )
> +            kinfo.dom0less_enhanced = true;
> +        else
> +            printk("Error: tried to use xen,enhanced without dom0\n");

In general, I prefer if we fail early for configuration error because 
this makes a lot more obvious what the issue is.

So I would switch to panic() and drop "Error:". This can be done on commit:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

