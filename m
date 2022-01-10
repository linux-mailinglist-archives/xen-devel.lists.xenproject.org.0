Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325FA48A36C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 00:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255571.437981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n73mY-0008NI-Gn; Mon, 10 Jan 2022 23:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255571.437981; Mon, 10 Jan 2022 23:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n73mY-0008KY-CQ; Mon, 10 Jan 2022 23:08:54 +0000
Received: by outflank-mailman (input) for mailman id 255571;
 Mon, 10 Jan 2022 23:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O59d=R2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n73mW-0008KS-H7
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 23:08:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 462c6af4-726a-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 00:08:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCF4FB8180F;
 Mon, 10 Jan 2022 23:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD7DC36AE9;
 Mon, 10 Jan 2022 23:08:49 +0000 (UTC)
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
X-Inumbo-ID: 462c6af4-726a-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641856129;
	bh=J+uHqL/3GVypszrOXBTSHfj7KMFXMdTgutDTOMSr8PI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hZReYH6rvXjdrcLoBCxX4CC2xYSZhELVOJ7T/0Fd/V0LHybYlAU1ADdBqzW/4GGuW
	 Bp11+co0bnydQSUgR4tWOi8uPTw6it8rfWnjvJV6MocXPMZaopuSYD47Vn6vUVtPj6
	 gnGMd6DPlecDGiPIfgxnzPESpclkEiYIackqjr3PvPlMTZaEXLYIUkJgvY//NV2orq
	 W6HwT0n/xzue7XCBYC6mGRfO836cu4q55vB7v485mvaEoBN9oK/c8tQIwbdL0DUv0K
	 ytpoq9+ZuUGkkxR90dnGwaozFnD+KXtmjcOo7fdipiqnoqzR7/iFNK9o2VgK972b3i
	 9N6XIMHHfD8XQ==
Date: Mon, 10 Jan 2022 15:08:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
In-Reply-To: <f3baac82-0eff-f885-f03a-ba987c8e12b6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2201101458520.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-1-sstabellini@kernel.org> <f3baac82-0eff-f885-f03a-ba987c8e12b6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Jan 2022, Jan Beulich wrote:
> On 08.01.2022 01:49, Stefano Stabellini wrote:
> > Introduce a new feature flag to signal that xenstore will not be
> > immediately available at boot time. Instead, xenstore will become
> > available later, and a notification of xenstore readiness will be
> > signalled to the guest using the xenstore event channel.
> 
> In addition to what Julien has said, I'd like to point out that Linux'es
> xenbus driver already has means to deal with xenstored not being around
> right away (perhaps because of living in a stubdom which starts in
> parallel). I therefore wonder whether what you want can't be achieved
> entirely inside that driver, without any new feature flag.

The fewer changes to Linux the better but we couldn't find a way to make
it work with zero changes.

In a way, the patch for Linux is re-using the existing infrastructure to
delay initialization, e.g. xenbus_probe_thread to call xenbus_probe
later.

However, today there is nothing stopping Linux/HVM to continue
initialization immediately except for xs_hvm_defer_init_for_callback
which is not applicable in this case. So we introduced
XENFEAT_xenstore_late_init.

As I wrote in another reply, I think we could do without
XENFEAT_xenstore_late_init if we instead rely on checking for
HVM_PARAM_STORE_EVTCHN being valid and HVM_PARAM_STORE_PFN being zero.

But either way as far as I can tell we need to add a new check to delay
xenstore initialization in Linux/HVM.

