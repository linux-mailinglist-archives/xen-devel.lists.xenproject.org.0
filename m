Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FA442C165
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 15:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208484.364626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeIX-0005Ru-T7; Wed, 13 Oct 2021 13:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208484.364626; Wed, 13 Oct 2021 13:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeIX-0005Ou-PL; Wed, 13 Oct 2021 13:27:57 +0000
Received: by outflank-mailman (input) for mailman id 208484;
 Wed, 13 Oct 2021 13:27:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maeIW-0005Oo-7G
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 13:27:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maeIW-0005Zd-0Q; Wed, 13 Oct 2021 13:27:56 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.188]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maeIV-0001YY-Qv; Wed, 13 Oct 2021 13:27:55 +0000
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
	bh=76tvdcAKL6FjWgYAzG29HONM2nDBGwCFuwtndCll6zM=; b=Yl53v2ZFx3gWlTnFAM6arvbznr
	WZZHnrWXqduEL0KEkZLYGGX+Gs8e2GqOnAoj6996Rsu2zSOez6D8SuJ8CGqQ8D+vBXc6oM4do9HsM
	Rc+ujLuAQBoLmHMZn+07s2e07tcNj32im/YG8iDLohR3WPEk1+9pdxKrB0IzrYVAOS2I=;
Message-ID: <a31231e3-a1eb-0e1f-59b8-75677d5db51b@xen.org>
Date: Wed, 13 Oct 2021 14:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] arm/docs: Clarify legacy DT bindings on UEFI
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211013121929.30784-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211013121929.30784-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 13/10/2021 13:19, Luca Fancellu wrote:
> Legacy compatible strings for dom0 modules are not
> supported when booting using UEFI, the documentation
> doesn't mention that.

Can you add a summary in the commit message why we consider the legacy 
binding is not supported?

> 
> Add a phrase to docs/misc/arm/device-tree/booting.txt
> to clarify it.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   docs/misc/arm/device-tree/booting.txt | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index c6a775f4e8..017c0f13eb 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -51,6 +51,8 @@ Each node contains the following properties:
>   	Xen 4.4 supported a different set of legacy compatible strings
>   	which remain supported such that systems supporting both 4.4
>   	and later can use a single DTB.
> +	However when booting Xen using UEFI and Device Tree, the legacy

NIT: I would drop "and Device Tree" because this feels a bit redundant 
as this compatible can only be used in the Device-Tree.

> +	compatible strings are not supported.
>   
>   	- "xen,multiboot-module" equivalent to "multiboot,module"
>   	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
> 

Cheers,

-- 
Julien Grall

