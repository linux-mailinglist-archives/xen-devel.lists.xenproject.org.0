Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74064B41466
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 07:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107821.1458050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utg8r-00046K-61; Wed, 03 Sep 2025 05:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107821.1458050; Wed, 03 Sep 2025 05:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utg8r-00043k-2t; Wed, 03 Sep 2025 05:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1107821;
 Wed, 03 Sep 2025 05:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qmmr=3O=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1utg8p-00043e-K7
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 05:34:43 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0cf37fc-8887-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 07:34:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 261BB60233;
 Wed,  3 Sep 2025 05:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38633C4CEF0;
 Wed,  3 Sep 2025 05:34:40 +0000 (UTC)
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
X-Inumbo-ID: b0cf37fc-8887-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756877680;
	bh=Dn99J/wNZcQ8cjepOF0bFowzIyB5iiQnDIx6F1w1350=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLdgKnf5mpupjTIzrlpoUb9vBvABQUmYezdlPzitP7YFyCk6mKabo0tptyM9Z8Cp/
	 8zTiAEwLD2fC3QO2iLBH2KDtxKucr8yG14D+61M8YdSzf20lmBjTppCTWTZk+ejkoQ
	 exY7fWqTAQckpsxBk5+JhJhIjyKhjYu2AFSECO3o=
Date: Wed, 3 Sep 2025 07:34:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, stable@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, kernel test robot <lkp@intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v5.10.y] xen: replace xen_remap() with memremap()
Message-ID: <2025090335-operating-antarctic-39f7@gregkh>
References: <4cc9c1f583fb4bfca02ff7050b9b01cb9abb7e7f.1756803599.git.teddy.astie@vates.tech>
 <2025090203-clothes-bullish-a21f@gregkh>
 <d4d5ce1f-8bcf-46c3-a1a5-f509375e80e9@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4d5ce1f-8bcf-46c3-a1a5-f509375e80e9@vates.tech>

On Tue, Sep 02, 2025 at 04:24:33PM +0000, Teddy Astie wrote:
> Le 02/09/2025 à 13:18, Greg Kroah-Hartman a écrit :
> > On Tue, Sep 02, 2025 at 09:28:32AM +0000, Teddy Astie wrote:
> >> From: Juergen Gross <jgross@suse.com>
> >>
> >> From: Juergen Gross <jgross@suse.com>
> >>
> >> [ upstream commit 41925b105e345ebc84cedb64f59d20cb14a62613 ]
> >>
> >> xen_remap() is used to establish mappings for frames not under direct
> >> control of the kernel: for Xenstore and console ring pages, and for
> >> grant pages of non-PV guests.
> >>
> >> Today xen_remap() is defined to use ioremap() on x86 (doing uncached
> >> mappings), and ioremap_cache() on Arm (doing cached mappings).
> >>
> >> Uncached mappings for those use cases are bad for performance, so they
> >> should be avoided if possible. As all use cases of xen_remap() don't
> >> require uncached mappings (the mapped area is always physical RAM),
> >> a mapping using the standard WB cache mode is fine.
> >>
> >> As sparse is flagging some of the xen_remap() use cases to be not
> >> appropriate for iomem(), as the result is not annotated with the
> >> __iomem modifier, eliminate xen_remap() completely and replace all
> >> use cases with memremap() specifying the MEMREMAP_WB caching mode.
> >>
> >> xen_unmap() can be replaced with memunmap().
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> >> Link: https://lore.kernel.org/r/20220530082634.6339-1-jgross@suse.com
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> Signed-off-by: Teddy Astie <teddy.astie@vates.tech> [backport to 5.10.y]
> >> ---
> >
> > Why is this needed for 5.10.y at all?  What bug does it fix?  And why
> > are you still using Xen on a 5.10.y kernel?  What prevents you from
> > moving to a newer one?
> >
> 
> This patch is only useful for virtual machines (DomU) that runs this
> Linux version (a notable Linux distribution with this kernel branch is
> Debian 11); it's not useful for Dom0 kernels.
> 
> On AMD platforms (and future Intel ones with TME); this patch along with
> [1] makes the caching attribute for access as WB instead of falling back
> to UC due to ioremap (within xen_remap) being used improving the
> performance as explained in the commit.

So this is only a performance improvement?  One that people have not
noticed in over 3 years?  That does not feel like a real bugfix that
stable kernels should have to me.

Again, what is preventing you from just running 5.15.y in your system
instead?  Debian 11 is quite old as well, why not use Debian 13 or 12?
You only have one more year left of 5.10.y kernels so you need to
consider moving off of that as soon as possible.

thanks,

greg k-h

