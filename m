Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221B79636AC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 02:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785303.1194729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjSgp-0004XB-NT; Thu, 29 Aug 2024 00:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785303.1194729; Thu, 29 Aug 2024 00:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjSgp-0004Uf-K9; Thu, 29 Aug 2024 00:07:03 +0000
Received: by outflank-mailman (input) for mailman id 785303;
 Thu, 29 Aug 2024 00:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kKLr=P4=kernel.org=kuba@srs-se1.protection.inumbo.net>)
 id 1sjSgo-0004UZ-9C
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 00:07:02 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cb47982-659a-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 02:07:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1BB33AE40C3;
 Thu, 29 Aug 2024 00:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9796EC4CEC0;
 Thu, 29 Aug 2024 00:06:58 +0000 (UTC)
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
X-Inumbo-ID: 9cb47982-659a-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724890019;
	bh=0KBomtwl5htJf2KliDq8qRkg58AM7cR5JxLbBwVmD/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LmZLwx+POZ+ZZEuXHKVyWVVwSDgrJjSJCUR3aUrxypd4Z4wK+wbPf9EJE/+P7brK+
	 SxbhLDYEJtEpBdkHd8ZwKsdkFWzDjPHxwjPdbkJNS2jfBZv5jzatoqnUiz0zEG28tw
	 hjUYhdxihOCJgq/u8k3cQcEl7ih41Mn0OJWPBDGbgcpU1aJFA1pEtVgtDBWDmAU/l3
	 SHsHnTvjwc7rGXVGqyuHpCidavb1xuTXQKYBS481Y30pxpCGAw1EwM2rQcFNZH6mAD
	 r6TnzILRj+UQJyfdOrc8aBAzwzd0JC9nICmjlULt7mfWsJxiVe4VWmakJOCcMTOr0t
	 Sn0irpBpH5afg==
Date: Wed, 28 Aug 2024 17:06:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeongjun Park <aha310510@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, wei.liu@kernel.org, paul@xen.org,
 davem@davemloft.net, edumazet@google.com, madhuparnabhowmik04@gmail.com,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net/xen-netback: prevent UAF in xenvif_flush_hash()
Message-ID: <20240828170657.5f493cc6@kernel.org>
In-Reply-To: <CAO9qdTGHJw-SUFH9D16N5wSn4KmaMUcX+GVFuEFu+jqMb3HU1g@mail.gmail.com>
References: <20240822181109.2577354-1-aha310510@gmail.com>
	<fd2a06d5-370f-4e07-af84-cab089b82a4b@redhat.com>
	<CAO9qdTGHJw-SUFH9D16N5wSn4KmaMUcX+GVFuEFu+jqMb3HU1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Aug 2024 21:52:12 +0900 Jeongjun Park wrote:
> > The loop runs with irq disabled, the RCU critical section extends over
> > it, uninterrupted.  
> 
> Basically, list_for_each_entry_rcu is specified to be used under the protection
> of rcu_read_lock(), but this is not the case with xenvif_new_hash(). If it is
> used without the protection of rcu_read_lock(), kfree is called immediately
> after the grace period ends after the call to kfree_rcu() inside
> list_for_each_entry_rcu, so the entry is released, and a UAF occurs when
> fetching with ->next thereafter.

You cut off and didn't answer Paolo's question whether you have a splat
/ saw this actually cause a crash or a KASAN warning.

