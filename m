Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DB1960D4F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 16:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784109.1193498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwxs-0002Qc-O6; Tue, 27 Aug 2024 14:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784109.1193498; Tue, 27 Aug 2024 14:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwxs-0002Og-LT; Tue, 27 Aug 2024 14:14:32 +0000
Received: by outflank-mailman (input) for mailman id 784109;
 Tue, 27 Aug 2024 14:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sTyg=P2=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1siwxr-0002OV-4L
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 14:14:31 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac83a40e-647e-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 16:14:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0148DA41A34;
 Tue, 27 Aug 2024 14:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3452FC581AA;
 Tue, 27 Aug 2024 14:14:28 +0000 (UTC)
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
X-Inumbo-ID: ac83a40e-647e-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724768068;
	bh=MJFXP/k9RQK0ByF56VDngc+Nl9urhri3xUs+JNYlmhg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P1rv4OLKi6geNW+qmLq+G/zau60NRnAQ8jlm4wMN1kQUU2ml20OJldWMFsgSWrc96
	 IYdXuovm7OoldXaJHbgZEEvsPNZIzvOSDaLhMzn00P+cTuZW7ZvAZeMRHwHbfHN1Sx
	 l0/GYopSKK/pPYOQDCnS/WgGemlfo5O1imN7D9Jdvbhze667OiZ13/DStg7cihbWi0
	 e4nG9IweKQct05F0QVR96vl7xrOPrfXJA0dfZi89PLEzdEXikqOudd6itVMEiH/JQS
	 TXBtn+4U1JrsKNgO7uwpByvLptlo3WcZdR2BpACqfHuke59Q82PokuVWQkZZYEmO9D
	 VcHohoA2LJegw==
Date: Tue, 27 Aug 2024 07:14:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jeongjun Park <aha310510@gmail.com>, wei.liu@kernel.org, paul@xen.org,
 davem@davemloft.net, edumazet@google.com, madhuparnabhowmik04@gmail.com,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net/xen-netback: prevent UAF in xenvif_flush_hash()
Message-ID: <20240827071427.4c45fdb8@kernel.org>
In-Reply-To: <fd2a06d5-370f-4e07-af84-cab089b82a4b@redhat.com>
References: <20240822181109.2577354-1-aha310510@gmail.com>
	<fd2a06d5-370f-4e07-af84-cab089b82a4b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Aug 2024 13:19:59 +0200 Paolo Abeni wrote:
> On 8/22/24 20:11, Jeongjun Park wrote:
> > During the list_for_each_entry_rcu iteration call of xenvif_flush_hash,
> > kfree_rcu does not exist inside the rcu read critical section, so if  
> 
> The above wording is confusing, do you mean "kfree_rcu does not exit 
> from "...?

I think they mean that kfree_rcu() is called without holding RCU read
lock..

> > kfree_rcu is called when the rcu grace period ends during the iteration,
> > UAF occurs when accessing head->next after the entry becomes free.  

.. so it can run immediately. Therefore the loop fetching head->next
may cause a UAF.

> The loop runs with irq disabled, the RCU critical section extends over 
> it, uninterrupted.

Is this an official RCU rule? I remember Paul told us it's the case for
softirq, but IDK if it is also for local IRQ disable.

> Do you have a splat for the reported UAF?
> 
> This does not look the correct solution.

The problem may not exist, but FWIW the change makes sense to me :)
We hold the write lock, and modify the list. for_each_entry_safe()
seems like a better fit than for_each_entry_rcu()

