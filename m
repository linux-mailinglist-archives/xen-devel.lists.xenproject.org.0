Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD74B7508
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 21:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273534.468757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4P2-0002eP-4m; Tue, 15 Feb 2022 20:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273534.468757; Tue, 15 Feb 2022 20:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4P2-0002c5-12; Tue, 15 Feb 2022 20:26:24 +0000
Received: by outflank-mailman (input) for mailman id 273534;
 Tue, 15 Feb 2022 20:26:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nK4P1-0002bz-8o
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 20:26:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4P0-0001Qo-UT; Tue, 15 Feb 2022 20:26:22 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.8.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nK4P0-0002eG-Nw; Tue, 15 Feb 2022 20:26:22 +0000
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
	bh=45qqZ7TZpVqK1QT+pjY95BXBg9uA6c0PKxyP5am+zEU=; b=jcHWJKNOhGmLs0waCnsLdAqDNx
	X7+pX3I5eKzUNfjsz23cswS7eD1deC+N9ySUFv4zYzC8f5W+M6E1ysM4s0Vj3rsvtSLgFEgm61RXK
	VcrgBQr6JBSDSF674Ra8f9SFZZTpqkfhL86/rSRnoW52+76hB7a+mO5GShKrfQSgRVG8=;
Message-ID: <eb39c5a6-f5b1-ccf3-8d2b-802ae7da68d0@xen.org>
Date: Tue, 15 Feb 2022 20:26:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v6 02/11] xen: introduce CDF_directmap
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 Jan Beulich <jbeulich@suse.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
 <20220214031956.3726764-3-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220214031956.3726764-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Jan)

Hi Penny,

I am CCing Jan to give him a chance to...

On 14/02/2022 03:19, Penny Zheng wrote:
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index cfb0b47f13..24eb4cc7d3 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -31,6 +31,10 @@ void arch_get_domain_info(const struct domain *d,
>   /* CDF_* constant. Internal flags for domain creation. */
>   /* Is this a privileged domain? */
>   #define CDF_privileged           (1U << 0)
> +#ifdef CONFIG_ARM
> +/* Should domain memory be directly mapped? */
> +#define CDF_directmap            (1U << 1)
> +#endif

... comment on this approach. I would be happy to switch to an ASSERT() 
if that's preferred.

Please note that as you modify x86 code (even it is a couple of lines) 
you should technically CC the x86 maintainers. Similarly the changes in 
include/xen/domain.h should have the REST CCed.

We have a script that will find the proper correct CC for each patch 
(see scripts/add_maintainers.pl). The workflow is written down in the 
script itself.

Cheers,

-- 
Julien Grall

