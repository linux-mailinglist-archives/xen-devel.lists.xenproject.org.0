Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4422528BB6
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 19:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330188.553526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqeJ5-00056G-2k; Mon, 16 May 2022 17:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330188.553526; Mon, 16 May 2022 17:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqeJ4-00052n-W1; Mon, 16 May 2022 17:14:54 +0000
Received: by outflank-mailman (input) for mailman id 330188;
 Mon, 16 May 2022 17:14:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqeJ2-00052h-UV
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 17:14:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqeJ2-0007AG-K4; Mon, 16 May 2022 17:14:52 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqeJ2-0006Qu-Dv; Mon, 16 May 2022 17:14:52 +0000
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
	bh=BLYdd3UlK2MHTVfzjIBq7vkIKbRwswle7whaiLHurbo=; b=S5YezEfycKLvAsLc6KUkM97s8C
	RpjNG/AwB6Dh7FOhevyCHal8gqX02DZnweMiDkperE5Qa/R8DAWMrOJmHTFwmCz0iaKlL+9mg091S
	PMz60hnoORnk0nYbXlBgzEWkSxJ1A5htEs5UMmq+8lFoXG7H3V1HtEGQ3yNfeL54g//o=;
Message-ID: <46f6a909-2f77-021c-a069-6a8f827e53fc@xen.org>
Date: Mon, 16 May 2022 18:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/9] xen/arm: Print a 64-bit number in hex from early
 uart
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <jiamei.xie@arm.com>, Julien Grall <jgrall@amazon.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-2-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220511014639.197825-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/05/2022 02:46, Wei Chen wrote:
> Current putn function that is using for early print
> only can print low 32-bit of AArch64 register. This
> will lose some important messages while debugging
> with early console. For example:
> (XEN) Bringing up CPU5
> - CPU 0000000100000100 booting -
> Will be truncated to
> (XEN) Bringing up CPU5
> - CPU 00000100 booting -
> 
> In this patch, we increased the print loops and shift
> bits to make putn print 64-bit number.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Tested-by: Jiamei Xie <jiamei.xie@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

I have committed this patch.

Patch #3 looks to be suitably acked but I am not sure whether it can be 
committed before #2. So I didn't commit it.

Please let me know if it can be.

Cheers,

-- 
Julien Grall

