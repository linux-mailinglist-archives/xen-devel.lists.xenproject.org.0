Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BB681C12
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487213.754759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbHX-0002LF-T3; Mon, 30 Jan 2023 21:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487213.754759; Mon, 30 Jan 2023 21:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMbHX-0002Il-QK; Mon, 30 Jan 2023 21:01:39 +0000
Received: by outflank-mailman (input) for mailman id 487213;
 Mon, 30 Jan 2023 21:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYol=53=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pMbHW-0002IZ-IT
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 21:01:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47adf535-a0e1-11ed-b63b-5f92e7d2e73a;
 Mon, 30 Jan 2023 22:01:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D5A26125D;
 Mon, 30 Jan 2023 21:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2321C433D2;
 Mon, 30 Jan 2023 21:01:32 +0000 (UTC)
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
X-Inumbo-ID: 47adf535-a0e1-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675112494;
	bh=G93K1QW14FKMZfeko/uopY7uHtTyZpgky5yglGIn2WY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O4/HGIvAkepIn+7gIRMzyKnf5KT/nNRno18/d/1JyxCp4Sf+7LRBupdLS1WgkgS2b
	 1aZIyo71GpvlTplzVLWgrwsaecup0G60ODBRWFb+vmUfM6WkHYHTE+JS3gel8t2MRP
	 Mzi8arwjndfqXUFdxLqbzQ3UlAYq0XKanwYAtmOod2gUdma55csLnWEP3NoRPPLxA3
	 MvkWUbjKuYwi+3xiikVlMRYG5iBdt5CVi8nLJB7V54RQdqxOMBzX+D+3Y92gYi2WGN
	 GydZseYS7vWnEYvy1S7EIsCCU+REUQnNbi6U1VYOcCjril5IuVaxLkbdwpb3s0Nvs2
	 E3+6TnXGge7kg==
Date: Mon, 30 Jan 2023 13:01:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen/public: move xenstore related doc into 9pfs.h
In-Reply-To: <65757a42-f55b-55e9-4853-4854ecabbfca@suse.com>
Message-ID: <alpine.DEB.2.22.394.2301301300210.132504@ubuntu-linux-20-04-desktop>
References: <20230130090937.31623-1-jgross@suse.com> <83ea4c36-4762-c06f-28bc-00deedb7efd3@xen.org> <65757a42-f55b-55e9-4853-4854ecabbfca@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Jan 2023, Juergen Gross wrote:
> On 30.01.23 10:18, Julien Grall wrote:
> > Hi Juergen,
> > 
> > On 30/01/2023 09:09, Juergen Gross wrote:
> > > The Xenstore related documentation is currently to be found in
> > > docs/misc/9pfs.pandoc, instead of the related header file
> > > xen/include/public/io/9pfs.h like for most other paravirtualized
> > > device protocols.
> > > 
> > > There is a comment in the header pointing at the document, but the
> > > given file name is wrong. Additionally such headers are meant to be
> > > copied into consuming projects (Linux kernel, qemu, etc.), so pointing
> > > at a doc file in the Xen git repository isn't really helpful for the
> > > consumers of the header.
> > > 
> > > This situation is far from ideal, which is already being proved by the
> > > fact that neither qemu nor the Linux kernel are implementing the
> > > device attach/detach protocol correctly. Additionally the documented
> > > Xenstore entries are not matching the reality, as the "tag" Xenstore
> > > entry is on the frontend side, not on the backend one.
> > > 
> > > There is another bug in the connection sequence: the frontend needs to
> > > wait for the backend to have published its features before being able
> > > to allocate its rings and event-channels.
> > > 
> > > Change that by moving the Xenstore related 9pfs documentation from
> > > docs/misc/9pfs.pandoc into xen/include/public/io/9pfs.h while fixing
> > > the wrong Xenstore entry detail and the connection sequence.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > > V2:
> > > - add reference to header in the pandoc document (Jan Beulich)
> > > V3:
> > > - fix flaw in the connection sequence
> > 
> > Please don't do that in the same patch. This makes a lot more difficult to
> > confirm the doc movement was correct.
> 
> You have to check it manually anyway, as the comment format is prefixing
> " * " to every line.

Just to give an example, in the past I used vim to remove the " * "
prefix on every line then used diff or wdiff to check that the content
of the old and the new files are identical.

