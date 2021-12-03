Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD05467702
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237496.411911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Je-00041y-N0; Fri, 03 Dec 2021 12:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237496.411911; Fri, 03 Dec 2021 12:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7Je-00040O-JC; Fri, 03 Dec 2021 12:05:26 +0000
Received: by outflank-mailman (input) for mailman id 237496;
 Fri, 03 Dec 2021 12:05:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mt7Jd-0003za-90
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:05:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt7Jc-0003fw-RA; Fri, 03 Dec 2021 12:05:24 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.21.218]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mt7Jc-0005lv-LN; Fri, 03 Dec 2021 12:05:24 +0000
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
	bh=adGjGgbfhyT+4XXLd4J/8JrDKs9zuriW9xY3SzirS0A=; b=zoyoEk1sh0ztwp/AKv5isUYici
	vBjaRv4jZ3LXC9tynuAWm2aImi1iLGbbvl0zAfx61A8ONKSmzWWVbD9PAjuCneg7+cOCJjR9gSNV0
	W3je0JjjIT2VUzhbxAqd0z5Y1gcdvYGy1aGfxtwxAnh0naRHhcUgg4S7n7Z6cI97I0Ds=;
Message-ID: <4f14f0ec-82f4-df4a-5d87-9c39727b4634@xen.org>
Date: Fri, 3 Dec 2021 12:05:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] arm/vgic: Fix reference to a non-existing function
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211203095837.20394-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211203095837.20394-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 03/12/2021 09:58, Michal Orzel wrote:
> Commit 68dcdf942326ad90ca527831afbee9cd4a867f84
> (xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq)
> forgot to modify a comment about lr_pending list,
> referring to a function that has been renamed.
> Fix that.
> 
> Fixes: 68dcdf942326ad90ca527831afbee9cd4a867f84

The format for fixes tag is a 12 characters sha1 followed by the commit 
message. In this case, it would be:

Fixes: 68dcdf942326 ("xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq")

I can fix it on commit.

Acked-by: Julien Grall <jgrall@amazon.com>

> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/include/asm-arm/vgic.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index e69a59063a..ade427a808 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -195,7 +195,7 @@ struct vgic_cpu {
>        * corresponding LR it is also removed from this list. */
>       struct list_head inflight_irqs;
>       /* lr_pending is used to queue IRQs (struct pending_irq) that the
> -     * vgic tried to inject in the guest (calling gic_set_guest_irq) but
> +     * vgic tried to inject in the guest (calling gic_raise_guest_irq) but
>        * no LRs were available at the time.
>        * As soon as an LR is freed we remove the first IRQ from this
>        * list and write it to the LR register.
> 

Cheers,

-- 
Julien Grall

