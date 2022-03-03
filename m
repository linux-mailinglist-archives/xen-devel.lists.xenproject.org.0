Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094644CC69A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 20:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283709.482805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPrWx-0007aH-3k; Thu, 03 Mar 2022 19:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283709.482805; Thu, 03 Mar 2022 19:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPrWx-0007Xv-0n; Thu, 03 Mar 2022 19:54:31 +0000
Received: by outflank-mailman (input) for mailman id 283709;
 Thu, 03 Mar 2022 19:54:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPrWv-0007Xm-1d
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 19:54:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPrWu-0004rL-Qd; Thu, 03 Mar 2022 19:54:28 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPrWu-0003a3-Kc; Thu, 03 Mar 2022 19:54:28 +0000
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
	bh=W89jw3aPaZtbNNvF0t08YHwc6rQpENDhdTlLSZ7XM8o=; b=jw4xWKE4WNxGwfkSn8i5QpP10X
	LgRbzJ3xRrH0c9rkZPJ4T/pXoxrhwBwaWcIK/uCzIyCrSj8g0wRtnwKD+IzBdc4XbSrl0X1mdc+Ag
	m7iU1vRtRbJ2nq2Oozda7anloO2VlQmbzN2y131E00EPApipNrl6CBlVamM7CyviQkvI=;
Message-ID: <c1da7841-dbfe-69b0-2572-cf133040d7e0@xen.org>
Date: Thu, 3 Mar 2022 19:54:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] xen/arm: gic: Introduce GIC_PRI_{IRQ/IPI}_ALL
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220302095911.161259-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220302095911.161259-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/03/2022 09:59, Michal Orzel wrote:
> Introduce macros GIC_PRI_IRQ_ALL and GIC_PRI_IPI_ALL to be used in all
> the places where we want to set default priority for all the offsets
> in interrupt priority register. This will improve readability and
> allow to get rid of introducing variables just to store this value.
> 
> Take the opportunity to mark GIC_PRI_{IRQ/IPI} as unsigned values
> to suppress static analyzer warnings as they are used in expressions
> exceeding integer range (shifting into signed bit). Modify also other
> priority related macros to be coherent.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

I have committed the patch. Thanks!

Cheers,

-- 
Julien Grall

