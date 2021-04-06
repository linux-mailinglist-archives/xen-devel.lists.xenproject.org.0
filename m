Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FD6355C14
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 21:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106259.203241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTrAl-0003Fh-9B; Tue, 06 Apr 2021 19:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106259.203241; Tue, 06 Apr 2021 19:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTrAl-0003FI-5j; Tue, 06 Apr 2021 19:15:35 +0000
Received: by outflank-mailman (input) for mailman id 106259;
 Tue, 06 Apr 2021 19:15:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTrAj-0003FD-To
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 19:15:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTrAh-0005W4-1p; Tue, 06 Apr 2021 19:15:31 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTrAg-0000In-PD; Tue, 06 Apr 2021 19:15:30 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vOqxoaLJibgaROJwFxmBiuaCftfq2XidYEhUQcQvsl0=; b=FT4n/AhiKFtKo8/+wAJ+Y87zv3
	V5lqeJ5vUIYpH90JspbsSGftAYIUSnVm4mVdSPOSNKFU9cN03Qs9Dd/K4KQT1bemYG6xToktlojZV
	SMiexm2GHuSx5NtrVNuWcBQ4Yfz1U8ilZcbOTE94f+m5Mec0EWzy2JDTUg4hwvcLYe9E=;
Subject: Re: [PATCH 1/2] xen/arm: kernel: Propagate the error if we fail to
 decompress the kernel
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210402152105.29387-1-julien@xen.org>
 <20210402152105.29387-2-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <5540671d-bd03-dc67-2c2f-e95f746c1030@xen.org>
Date: Tue, 6 Apr 2021 20:15:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402152105.29387-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 02/04/2021 16:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, we are ignoring any error from perform_gunzip() and replacing
> the compressed kernel with the "uncompressed" kernel.
> 
> If there is a gzip failure, then it means that the output buffer may
> contain garbagge. So it can result to various sort of behavior that may
> be difficult to root cause.
> 
> In case of failure, free the output buffer and propagate the error.
> We also need to adjust the return check for kernel_compress() as
> perform_gunzip() may return a positive value.
> 
> Take the opportunity to adjust the code style for the check.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   xen/arch/arm/kernel.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index ab78689ed2a6..f6b60ab77355 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -292,6 +292,12 @@ static __init int kernel_decompress(struct bootmodule *mod)
>       iounmap(input);
>       vunmap(output);
>   
> +    if ( rc )
> +    {
> +        free_domheap_pages(pages);

This breaks the build. I am not sure how I managed to test it before... 
I will send a v2.

Cheers,

-- 
Julien Grall

