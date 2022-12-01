Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B1563EBA4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 09:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450298.707587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fMJ-0002RZ-3s; Thu, 01 Dec 2022 08:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450298.707587; Thu, 01 Dec 2022 08:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fMJ-0002Oo-12; Thu, 01 Dec 2022 08:55:55 +0000
Received: by outflank-mailman (input) for mailman id 450298;
 Thu, 01 Dec 2022 08:55:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0fMI-0002Oi-84
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 08:55:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0fMI-0003Qx-0Z; Thu, 01 Dec 2022 08:55:54 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0fMH-000418-Pc; Thu, 01 Dec 2022 08:55:53 +0000
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
	bh=Opmvz08GnFM+DlBzR/nXtGgworI14pXZx+EOXpiVfrk=; b=qIvPdVraUWOInMxNNYpryZ4sEU
	urOMP/16wJEUWYttmlyYay7557xUoKvgmd4Y2jBrJWYjJ7y3aBENrjuoZxsyIuuAQHVRNYqjOvUQY
	Xn95Bq3sIfGusM+xWm9acfGEetnEjd4BUtMFHumIVaeF2Nx+I/+KAkVZua8lM7vhkHEc=;
Message-ID: <c8a37c26-93d5-9f46-b4ce-802b583355da@xen.org>
Date: Thu, 1 Dec 2022 08:55:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/2] xen/arm: vpl011: drop extra return in
 vpl011_mmio_read
Content-Language: en-US
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221201080400.1842558-1-jiamei.xie@arm.com>
 <20221201080400.1842558-3-jiamei.xie@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221201080400.1842558-3-jiamei.xie@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/12/2022 09:04, Jiamei Xie wrote:
> In vpl011_mmio_read switch block, all cases have a return. So the
> outside one can be removed.

That's correct today. However, if tomorrow we add a new case and forgot 
to add the return, then ...
>
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> ---
> v3 -> v4
> - Don't consolidate check registers access
> - Don't remove label read_as_zero
> ---
>   xen/arch/arm/vpl011.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index f4a5621fab..35de50760c 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -417,8 +417,6 @@ static int vpl011_mmio_read(struct vcpu *v,
>           goto read_as_zero;
>       }
>   
> -    return 1;
> - >   read_as_zero:

... we would end up to clobber the register. This is far from idea. So 
was this change made because the compiler complained?

If not, then I would prefer if we keep "return 1" and maybe add 
ASSERT_UNREACHABLE() to catch case where the return is not added.

Cheers,

-- 
Julien Grall

