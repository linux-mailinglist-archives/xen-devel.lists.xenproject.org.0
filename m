Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B03A451F6D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 01:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226049.390522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmmSh-0007eD-Ir; Tue, 16 Nov 2021 00:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226049.390522; Tue, 16 Nov 2021 00:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmmSh-0007bc-Fo; Tue, 16 Nov 2021 00:36:35 +0000
Received: by outflank-mailman (input) for mailman id 226049;
 Tue, 16 Nov 2021 00:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMVQ=QD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mmmSf-0007Zz-6H
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 00:36:33 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d6e18e3-4675-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 01:36:31 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20DF161507;
 Tue, 16 Nov 2021 00:36:29 +0000 (UTC)
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
X-Inumbo-ID: 3d6e18e3-4675-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637022989;
	bh=iXN4h1U4RGVFZxEgDGeu3XUJxBca60SFwQvHlW7aNbY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nzz+IxQvxm8A+MD2Z5DEF1qRx4tYOwV6Q9GozexSQCh1DFapy/iLUtZKdeVuMGgTy
	 To4F+Sjy2XrMo6IUwCPzpvuDa7/8XX/LDdx+Gh9uwWV2XGeAWDn2hTE/RBrcrRj00b
	 wZEwaGwCRPi3MeImnK0bJh2EVMnqhSdVI0MEzFgVELKVk3RHiMOI7v9ToAgmRNhgpf
	 ltCp89wUpTnnlhTV1hQb0IbAjwN1xg0HnRhpA2/JIsBsA9akils7Rp5ip+Cuuapoul
	 IvfNvIDHuC4Z1eH5pu0f3FoUojlJTx8TNLEvVEsr2M1K69poQhjLpI58cjK95P7SAy
	 hjo/FmfgiaWsg==
Date: Mon, 15 Nov 2021 16:36:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 3/5] xen/sort: Switch to an extern inline
 implementation
In-Reply-To: <409d2c17-d1e7-40b3-226a-b6ca4c0a15bf@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111151632160.1412361@ubuntu-linux-20-04-desktop>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com> <20211111175740.23480-4-andrew.cooper3@citrix.com> <409d2c17-d1e7-40b3-226a-b6ca4c0a15bf@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 11 Nov 2021, Julien Grall wrote:
> On 11/11/2021 17:57, Andrew Cooper wrote:
> > There are exactly 3 callers of sort() in the hypervisor.
> > 
> > Both arm callers pass in NULL for the swap function.  While this might seem
> > like an attractive option at first, it causes generic_swap() to be used
> > which
> > forced a byte-wise copy.  Provide real swap functions which the compiler can
> > optimise sensibly.
> 
> I understand the theory, but none of the two calls are in hot paths or deal
> with large set on Arm. So I am rather hesitant to introduce specialised swap
> in each case as it doesn't seem we will gain much from this change.

While I like Andrew's optimization, like Julien, I would also rather not
have to introduce specialized swap functions any time a sort() is
called. Why not keeping around generic_swap as extern gnu_inline in
sort.h as well so that the ARM callers can simply:

    sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
         cmp_memory_node, generic_swap);

?

That looks like a good option, although it would still result in a
small increase in bloat.

