Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D96E3870
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 14:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521548.810288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po1sd-00029z-Ty; Sun, 16 Apr 2023 12:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521548.810288; Sun, 16 Apr 2023 12:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po1sd-00027i-Q3; Sun, 16 Apr 2023 12:53:19 +0000
Received: by outflank-mailman (input) for mailman id 521548;
 Sun, 16 Apr 2023 12:53:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po1sc-00027c-F6
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 12:53:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po1sc-0002ZA-5w; Sun, 16 Apr 2023 12:53:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po1sc-0004Xq-1A; Sun, 16 Apr 2023 12:53:18 +0000
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
	bh=GVZZ0J9TiOyDXbYJOrOwpCrGuXjgqWxUp/y97wdmlfY=; b=S4fbaSXbv2NLoqEod64MC0OO4h
	BssaHvLgdRzT7CZsK97ladi6bheqH5kOiolQhKlLKEksxmh+mYsDMzrDBkxIxQg/J/oPLhU2oNq4T
	348WwdvEh6rWS8bhXSppI6PsBnOYYqQ9aHbVppU5vO/xZO7U7WQGdpdWJmG47lLELV7w=;
Message-ID: <5fb567c5-1e82-a048-1cfe-f6f69e0b5ebc@xen.org>
Date: Sun, 16 Apr 2023 13:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] xen/arm: fix unitialized use warning
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-4-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230414185714.292881-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stewart,

On 14/04/2023 19:57, Stewart Hildebrand wrote:
> When building the hypervisor with -Og, we encounter the following error:

Is this with GCC 12 as well?

> arch/arm/domain_build.c: In function ‘make_cpus_node’:
> arch/arm/domain_build.c:2040:12: error: ‘clock_valid’ may be used uninitialized [-Werror=maybe-uninitialized]
>   2040 |         if ( clock_valid )
>        |            ^
> arch/arm/domain_build.c:1947:10: note: ‘clock_valid’ was declared here
>   1947 |     bool clock_valid;
>        |          ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Fix it by initializing the variable.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> See previous discussion here
> https://lists.xenproject.org/archives/html/xen-devel/2022-10/msg00741.html
> ---
>   xen/arch/arm/domain_build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4f9d4f9d8867..18b350734a8e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1944,7 +1944,7 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
>       /* Placeholder for cpu@ + a 32-bit hexadecimal number + \0 */
>       char buf[13];
>       u32 clock_frequency;
> -    bool clock_valid;
> +    bool clock_valid = false;

NIT: I would add "Keep the compiler happy with -Og"

I am happy to add it while committing if you agree.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

