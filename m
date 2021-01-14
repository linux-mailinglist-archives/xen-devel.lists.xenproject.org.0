Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0402F6722
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 18:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67450.120419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l06D5-0001AD-5B; Thu, 14 Jan 2021 17:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67450.120419; Thu, 14 Jan 2021 17:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l06D5-00019m-0p; Thu, 14 Jan 2021 17:14:59 +0000
Received: by outflank-mailman (input) for mailman id 67450;
 Thu, 14 Jan 2021 17:14:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tjHn=GR=kernel.org=kuba@srs-us1.protection.inumbo.net>)
 id 1l06D3-00019h-Eu
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 17:14:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6db3c5db-b392-4370-9c48-c404acad866e;
 Thu, 14 Jan 2021 17:14:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C723238EC;
 Thu, 14 Jan 2021 17:14:54 +0000 (UTC)
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
X-Inumbo-ID: 6db3c5db-b392-4370-9c48-c404acad866e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610644495;
	bh=RDEJdDVwILr1jM/hUHMK43X/Aq2TqFRPO473xjQ/s4U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k4n/STNmaNHIWsT916GZmz4QENJO11kKIpmhTvbk+3HBZbLsJS5+OOU5kdJp8GsqJ
	 jc7NomeF0hPCzT0GF0uPkxUbffiWCJr1vCgbcugvXeJHZonSh7o/oKtcZOT/9Ses5D
	 cZacciofUZDcTAyidREbaNUiW32XgyI3zoa+jFvu05di+mGUv2rGqJEO7IoesrXS5O
	 1eBMFEKEF79c6FsTgQU6A6tHuxBjMVP6GlaxD3sbs/SfjxsYWPCEXyJWCmt+i8czt3
	 9/X4W4WmRiMBPIHSF6tMMy3SVsQJc3YdRAosQp9cOyWYmerHidiQ+Rvdi/KmnmiQSo
	 2+qDHsOaHb3Ng==
Date: Thu, 14 Jan 2021 09:14:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, bpf@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, Dany Madden <drt@linux.ibm.com>,
 Daris A Nevil <dnevil@snmc.com>, "David S. Miller" <davem@davemloft.net>,
 Erik Stahlman <erik@vt.edu>, Geoff Levand <geoff@infradead.org>, Grygorii
 Strashko <grygorii.strashko@ti.com>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Ishizaki Kou <kou.ishizaki@toshiba.co.jp>, Ivan
 Khoronzhuk <ivan.khoronzhuk@linaro.org>, Jens Osterkamp
 <Jens.Osterkamp@de.ibm.com>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Allen <jallen@linux.vnet.ibm.com>, John Fastabend
 <john.fastabend@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, Lijun Pan
 <ljp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman
 <mpe@ellerman.id.au>, netdev@vger.kernel.org, Nicolas Pitre
 <nico@fluxnic.net>, Paul Durrant <paul@xen.org>, Paul Mackerras
 <paulus@samba.org>, Peter Cammaert <pc@denkart.be>, Russell King
 <rmk@arm.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>, Santiago
 Leon <santi_leon@yahoo.com>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, Utz Bacher
 <utz.bacher@de.ibm.com>, Wei Liu <wei.liu@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/7] Rid W=1 warnings in Ethernet
Message-ID: <20210114091453.30177d20@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210114083349.GI3975472@dell>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
	<20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<20210114083349.GI3975472@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 14 Jan 2021 08:33:49 +0000 Lee Jones wrote:
> On Wed, 13 Jan 2021, Jakub Kicinski wrote:
> 
> > On Wed, 13 Jan 2021 16:41:16 +0000 Lee Jones wrote:  
> > > Resending the stragglers again.                                                                                  
> > > 
> > > This set is part of a larger effort attempting to clean-up W=1                                                   
> > > kernel builds, which are currently overwhelmingly riddled with                                                   
> > > niggly little warnings.                                                                                          
> > >                                                                                                                  
> > > v2:                                                                                                              
> > >  - Squashed IBM patches                                                                                      
> > >  - Fixed real issue in SMSC
> > >  - Added Andrew's Reviewed-by tags on remainder  
> > 
> > Does not apply, please rebase on net-next/master.  
> 
> These are based on Tuesday's next/master.

What's next/master?

This is net-next:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

> I just rebased them now with no issue.
> 
> What conflict are you seeing?

Applying: net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
error: patch failed: drivers/net/ethernet/smsc/smc91x.c:2192
error: drivers/net/ethernet/smsc/smc91x.c: patch does not apply
Patch failed at 0001 net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

