Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A852A8C5D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 02:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20318.46112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kar2W-0008KV-7c; Fri, 06 Nov 2020 01:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20318.46112; Fri, 06 Nov 2020 01:59:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kar2W-0008K6-4b; Fri, 06 Nov 2020 01:59:44 +0000
Received: by outflank-mailman (input) for mailman id 20318;
 Fri, 06 Nov 2020 01:59:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6QlO=EM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kar2U-0008Jy-RR
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 01:59:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62ae4875-9c15-4a15-9e47-a5eb2a995a9c;
 Fri, 06 Nov 2020 01:59:42 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E86BA20719;
 Fri,  6 Nov 2020 01:59:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6QlO=EM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kar2U-0008Jy-RR
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 01:59:42 +0000
X-Inumbo-ID: 62ae4875-9c15-4a15-9e47-a5eb2a995a9c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 62ae4875-9c15-4a15-9e47-a5eb2a995a9c;
	Fri, 06 Nov 2020 01:59:42 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E86BA20719;
	Fri,  6 Nov 2020 01:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604627981;
	bh=9qznLD2HeBlwzP97J34MgKmZHCkX8pUNtayvyQfBzqo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=puFRe2O8cjVb892R2fBPY26c4+YfScVOwr9Z0ch2/Hf/8wVLYLoA8D0WK93kYbxLi
	 cYHiTvUQy52zbMcoPMrze52eShnZjs2pSBs2eIsJ1B0zyWfhAfYVSAIiZoS1cwxF6g
	 btJeOq7K3jrVtAM6uFudJueNN3xjkhqP7ggzLkaE=
Date: Thu, 5 Nov 2020 17:59:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: Don't panic when receiving an unknown
 debug trap
In-Reply-To: <20201105223106.22517-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2011051759330.2323@sstabellini-ThinkPad-T480s>
References: <20201105223106.22517-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Nov 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Even if debug trap are only meant for debugging purpose, it is quite
> harsh to crash Xen if one of the trap sent by the guest is not handled.
> 
> So switch from a panic() to a printk().
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/arch/arm/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 8f40d0e0b6b1..a36f145e6739 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1410,7 +1410,7 @@ static void do_debug_trap(struct cpu_user_regs *regs, unsigned int code)
>          show_execution_state(regs);
>          break;
>      default:
> -        panic("DOM%d: Unhandled debug trap %#x\n", domid, code);
> +        printk("DOM%d: Unhandled debug trap %#x\n", domid, code);
>          break;
>      }
>  }
> -- 
> 2.17.1
> 

