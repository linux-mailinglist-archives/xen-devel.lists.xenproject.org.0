Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364834E3105
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 21:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293199.498003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWOFo-0000gH-7E; Mon, 21 Mar 2022 20:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293199.498003; Mon, 21 Mar 2022 20:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWOFo-0000dV-4C; Mon, 21 Mar 2022 20:03:48 +0000
Received: by outflank-mailman (input) for mailman id 293199;
 Mon, 21 Mar 2022 20:03:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/V3S=UA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWOFn-0000dP-8A
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 20:03:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03029981-a952-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 21:03:45 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6E1160F34;
 Mon, 21 Mar 2022 20:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9B3C340E8;
 Mon, 21 Mar 2022 20:03:42 +0000 (UTC)
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
X-Inumbo-ID: 03029981-a952-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647893023;
	bh=VV4s9zGZMV3u2QOUroxoA0t5T7A3al+pvwF+nIzBB70=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q6z/H74f7y1iYZFscp5nNRQ8Opt6jsYPVQSeYehPGplRKCqb72g5pt3CkGn1BPajS
	 w5Imd/LzJHXy3PGcGqlp/nlONEXs1KNHHEGwuo+wdlhu4xIV4w+BEvnmZFVX5mJJT6
	 3eg46udJseYOI7Ad0T1jw6+rO7V1CWyyXRsgBN+WeOyYFzh6ZfedSCZ4olY6EoRogi
	 5bdmkoAA1YlT2VIjaZ/YRXovqllwwt05YTCCTZaY/HyYxs2xuRhZhyrl2g8HzicxHn
	 7ikHnVqHB0h7DP16SmAt8VVwHEztH6wTggA98sIa/GDa1JTFHD3hxf/5eqF1rd9Tsh
	 Rxs1gQ7yAOuEw==
Date: Mon, 21 Mar 2022 13:03:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <Penny.Zheng@arm.com>, nd@arm.com, 
    Penny Zheng <penzhe01@a011292.shanghai.arm.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 02/13] xen/arm: introduce a special domain
 DOMID_SHARED
In-Reply-To: <30a6ef6f-d37c-b66c-d5af-be2208766057@suse.com>
Message-ID: <alpine.DEB.2.22.394.2203211256370.2910984@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-3-Penny.Zheng@arm.com> <eefa9cf2-a04c-ba8d-74cb-0d2aaa35badb@suse.com> <alpine.DEB.2.22.394.2203181443440.2910984@ubuntu-linux-20-04-desktop>
 <30a6ef6f-d37c-b66c-d5af-be2208766057@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Mar 2022, Jan Beulich wrote:
> On 18.03.2022 22:50, Stefano Stabellini wrote:
> > On Fri, 18 Mar 2022, Jan Beulich wrote:
> >> On 11.03.2022 07:11, Penny Zheng wrote:
> >>> In case to own statically shared pages when owner domain is not
> >>> explicitly defined, this commits propose a special domain DOMID_SHARED,
> >>> and we assign it 0x7FF5, as one of the system domains.
> >>>
> >>> Statically shared memory reuses the same way of initialization with static
> >>> memory, hence this commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
> >>> related codes, and this option depends on static memory(CONFIG_STATIC_MEMORY).
> >>>
> >>> We intends to do shared domain creation after setup_virt_paging so shared
> >>> domain could successfully do p2m initialization.
> >>
> >> There's nothing said here, in the earlier patch, or in the cover letter
> >> about the security aspects of this. There is a reason we haven't been
> >> allowing arbitrary, un-supervised sharing of memory between domains. It
> >> wants clarifying why e.g. grants aren't an option to achieve what you
> >> need, and how you mean to establish which domains are / aren't permitted
> >> to access any individual page owned by this domain.
> > 
> > 
> > I'll let Penny write a full reply but I'll chime in to try to help with
> > the explanation.
> > 
> > This is not arbitrary un-supervised sharing of memory between domains,
> > which indeed is concerning.
> > 
> > This is statically-configured, supervised by the system configurator,
> > sharing of memory between domains.
> > 
> > And in fact safety (which is just a different aspect of security) is one
> > of the primary goals for this work.
> > 
> > In safety-critical environments, it is not considered safe to
> > dynamically change important configurations at runtime. Everything
> > should be statically defined and statically verified.
> > 
> > In this case, if the system configuration knows a priori that there are
> > only 2 VM and they need to communication over shared memory, it is safer
> > to pre-configure the shared memory at build time rather than let the VMs
> > attempt to share memory at runtime. It is faster too.
> > 
> > The only way to trigger this static shared memory configuration should
> > be via device tree, which is at the same level as the XSM rules
> > themselves.
> > 
> > Hopefully I made things clearer and not murkier :-)
> 
> It adds some helpful background, yes, but at the same time it doesn't
> address the security concern at all: How are access permissions
> managed when the owning domain is a special one? I haven't spotted
> any recording of the domains which are actually permitted to map /
> access the pages in questions. (But of course I also only looked at
> non-Arm-specific code. I'd expect such code not to live in arch-
> specific files.)

All this static memory sharing is statically done at __init time only.
It should not be possible to trigger any further memory sharing at
runtime (if there is, that would be a bug).  In the Arm patches, all the
related functions are marked as __init and only called at boot time.
They map the memory owned by DOMID_SHARED at given guest
pseudo-physical addresses, also specified in device tree.

There are no new interfaces for the guest to map this memory because it
is already "pre-mapped".

