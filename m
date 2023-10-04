Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A287B97D5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 00:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612768.952847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoAF2-0003gi-En; Wed, 04 Oct 2023 22:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612768.952847; Wed, 04 Oct 2023 22:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoAF2-0003eL-Bk; Wed, 04 Oct 2023 22:21:16 +0000
Received: by outflank-mailman (input) for mailman id 612768;
 Wed, 04 Oct 2023 22:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XhzZ=FS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoAF0-0003eF-HL
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 22:21:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50efee93-6304-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 00:21:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4783617CE;
 Wed,  4 Oct 2023 22:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A7CC433C9;
 Wed,  4 Oct 2023 22:21:06 +0000 (UTC)
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
X-Inumbo-ID: 50efee93-6304-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696458067;
	bh=U5xXavViYKnla+QbvLLaOMCglpZZgu4ujDcPYa0hJ+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y4goWulYiQTlpj6M2hBC2bc/Gfhzv8/N6BJOjeL9jVHFtNvKYY3dzU9Oo/1fGyPsp
	 t1ppSbWJRONlC3LYAwPAvatYY6zsLa+BGRkcMITTH4QwvL831zVFYFhJvzlQuYqfjZ
	 JbZU9UqoHURTR1AJQE0D3s4yiRm1f51powDCdKMHJs5dq7XN/R+zivhgxvp1I9D/1C
	 AkqgJXKzX7vQMNJ3l9i2Xzw72eG3UM8YxUyzaXjxBuvMUuW0CMp+au7u5LyHVS0QsT
	 /fVYJ39qMjXSkn4JxHp42GDmTeJpUW7MRr2SZjWC/zs4VqZ2IIUM39A5nVKmm5qRgd
	 g/i3kW4h4Sutw==
Date: Wed, 4 Oct 2023 15:21:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
In-Reply-To: <ZR3VidifMWdjDQcv@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.22.394.2310041520200.2348112@ubuntu-linux-20-04-desktop>
References: <ZRvQNKyYpLDVTs0i@MacBookPdeRoger> <ZRxpC7ukhiYvzz5m@mattapan.m5p.com> <ZR0erl_OSkNgIQjx@MacBookPdeRoger> <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org> <ZR1gM19i6-vBaXh7@MacBookPdeRoger> <b00500ae-76b1-441c-8154-bcdd897734dc@xen.org>
 <ZR1rBP_49Y2V8VF6@MacBookPdeRoger> <fe94dcd2-4429-48df-8ebd-59563d43796a@xen.org> <ZR18dlMAbCwEOeH4@MacBookPdeRoger> <f8242725-7ee0-4fca-a608-d234f8f3b564@xen.org> <ZR3VidifMWdjDQcv@mattapan.m5p.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-824023394-1696458067=:2348112"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-824023394-1696458067=:2348112
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 4 Oct 2023, Elliott Mitchell wrote:
> On Wed, Oct 04, 2023 at 03:39:16PM +0200, Roger Pau Monné wrote:
> > On Wed, Oct 04, 2023 at 02:03:43PM +0100, Julien Grall wrote:
> > > 
> > > On 04/10/2023 13:53, Roger Pau Monné wrote:
> > > > 
> > > > When using UEFI there's RAM that will always be in-use by the
> > > > firmware, as runtime services cannot be shut down, and hence the
> > > > firmware must already have a way to remove/reserve such region(s) on
> > > > the memory map.
> > > 
> > > Can either you or Elliott confirm if EDK2 reserve the region?
> > 
> > I will defer to Elliott to check for arm.  I would be quite surprised
> > if it doesn't on x86, or else we would get a myriad of bug reports
> > about guests randomly crashing when using edk2.
> 
> When I had originally looked I thought there was no problem as
> `OvmfPkg/XenPlatformPei/Xen.c`:
> CalibrateLapicTimer()
> 	MapSharedInfoPage(SharedInfo)
> 	...
> 	UnmapXenPage(SharedInfo)
> 
> Later using `find * -type f -print0 | xargs -0 grep -eXENMAPSPACE_shared_info`
> `OvmfPkg/XenBusDxe/XenBusDxe.c`:
> 	XenGetSharedInfoPage()
>   // using reserved page because the page is not released when Linux is
>   // starting because of the add_to_physmap. QEMU might try to access the
>   // page, and fail because it have no right to do so (segv).
> 
> Looks like this second case leaks the shared information page.
> Originally I thought there was no problem as I'd only found the first
> instance.  Appears this second instance is the problem.

I understand this second case is *not* unmapping the SharedInfo page,
but is it reserving it somehow? For instance marking it as reserved in
the EFI memory map?
--8323329-824023394-1696458067=:2348112--

