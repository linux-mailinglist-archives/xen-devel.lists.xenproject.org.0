Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEFB30636B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 19:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76338.137702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4pd5-0005aS-Mt; Wed, 27 Jan 2021 18:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76338.137702; Wed, 27 Jan 2021 18:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4pd5-0005a2-JU; Wed, 27 Jan 2021 18:33:23 +0000
Received: by outflank-mailman (input) for mailman id 76338;
 Wed, 27 Jan 2021 18:33:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l4pd4-0005Zx-0Q
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 18:33:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4pcz-0004EW-FO; Wed, 27 Jan 2021 18:33:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4pcz-000212-3Z; Wed, 27 Jan 2021 18:33:17 +0000
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
	bh=anPLaxhlCo3dKlgCqrBTOUqNBXDMEW5XLse8gqoYXn0=; b=kgx6copS1UzK0aZJqLEgQMwq2c
	Gt8eicE27VcLziLaDJFdmh64a33d2NBb0Z78hmsDu2QaYN+qYvK+QHfHbcJH1Bh+xDB/hgUlXrGrc
	kFs4n3um3YycJ3+VZsiUB1uI9zIx+AZd7MoLkLNU7B2GYCZGrvIBAoXErQ14bSCJhohk=;
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <67136393-8454-9d28-628a-bfb380fd8fc9@xen.org>
Date: Wed, 27 Jan 2021 18:33:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> +                             struct vcpu *v, mmio_info_t *info)
> +{
> +    struct vcpu_io *vio = &v->io;
> +    ioreq_t p = {
> +        .type = IOREQ_TYPE_COPY,
> +        .addr = info->gpa,
> +        .size = 1 << info->dabt.size,
> +        .count = 1,
> +        .dir = !info->dabt.write,
> +        /*
> +         * On x86, df is used by 'rep' instruction to tell the direction
> +         * to iterate (forward or backward).
> +         * On Arm, all the accesses to MMIO region will do a single
> +         * memory access. So for now, we can safely always set to 0.
> +         */
> +        .df = 0,
> +        .data = get_user_reg(regs, info->dabt.reg),
> +        .state = STATE_IOREQ_READY,
> +    };
> +    struct ioreq_server *s = NULL;
> +    enum io_state rc;
> +
> +    switch ( vio->req.state )
> +    {
> +    case STATE_IOREQ_NONE:
> +        break;
> +
> +    default:
> +        gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
> +        return IO_ABORT;
> +    }

NIT: Given there is only one case, I think this can become a:

if ( vio->req.state != STATE_IOREQ_NONE )
{
   gdprintk(...);
   return IO_ABORT;
}

It is up to you whether you want to fix it now, later, or never :).

Aside the discussion about dm.h, the rest of the code looks good to me. 
It is nice to see the arch part of IOREQ is small :).

Cheers,

-- 
Julien Grall

