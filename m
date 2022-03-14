Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BEC4D9056
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 00:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290519.492731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTu5z-0002a5-Nr; Mon, 14 Mar 2022 23:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290519.492731; Mon, 14 Mar 2022 23:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTu5z-0002Xo-KY; Mon, 14 Mar 2022 23:27:23 +0000
Received: by outflank-mailman (input) for mailman id 290519;
 Mon, 14 Mar 2022 23:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDqM=TZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nTu5y-0002Xi-LF
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 23:27:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b46203f-a3ee-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 00:27:21 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AFE36147F;
 Mon, 14 Mar 2022 23:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE34C340E9;
 Mon, 14 Mar 2022 23:27:18 +0000 (UTC)
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
X-Inumbo-ID: 4b46203f-a3ee-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647300439;
	bh=3Wap272+qg908H5ORdKriCtZeQQd2FRPtBIoRz+lgjk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=emXu/RobeHBWY1hjjUno1Npso1xtQySGAMbd997JKMfZC4mqDyHv9lOq5wNFIBiR1
	 vkgMg2zGHLchJj1bfOFEkCnTghWhsORQg2WzSE/Ej/HL6oCccZkS8jNtmnNHjJDiOt
	 ZwgrqVqbZ7VGKUvgdICUPwlr58BIlh8rA3C2tW6UDyQ5HMjURNautaP08j6+Uhb7vR
	 5dSreMUfYYJAxtj2NAbOqpFctQbNbJu9cdCwc55TbUXHoz+fY91cO2tNtT+udzxE3H
	 ibDefwxOcD2oD4Zoq6NGc8KCWHdnYDATakgLJEFOVszdx2Mq+GZ3RLP/dv31QYn6w8
	 B/G/cZlwICjlg==
Date: Mon, 14 Mar 2022 16:27:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech, 
    lucmiccio@gmail.com, Julien Grall <jgrall@amazon.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
In-Reply-To: <78cd8ea7-e37a-d3d9-d2d1-6686ca491925@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203141624310.3497@ubuntu-linux-20-04-desktop>
References: <20220309112048.17377-1-julien@xen.org> <20220309112048.17377-5-julien@xen.org> <alpine.DEB.2.22.394.2203111710300.3497@ubuntu-linux-20-04-desktop> <78cd8ea7-e37a-d3d9-d2d1-6686ca491925@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 12 Mar 2022, Julien Grall wrote:
> On 12/03/2022 01:17, Stefano Stabellini wrote:
> > On Wed, 9 Mar 2022, Julien Grall wrote:
> > As far as I can tell this should work for coloring too. In the case of
> > coloring:
> > 
> >      /* running on the old mapping, same as non-coloring */
> >      update_identity_mapping(true);
> > 
> >      /* jumping to the 1:1 mapping of the old Xen and switching to the
> >       * new pagetable */
> >      fn(ttbr);
> > 
> >      /* new pagetable is enabled, now we are back to addresses greater
> >       * than XEN_VIRT_START, which correspond to new cache-colored Xen */
> >      update_identity_mapping(false);
> > 
> > 
> > The only doubt that I have is: are we sure than a single page of 1:1
> > mapping is enough? What if:
> > 
> > virt_to_maddr(switch_ttbr_id) - virt_to_maddr(_start) > PAGE_SIZE
> 
> switch_ttbr_id() is placed before _end_boot (this needs to be renamed). We are
> veryfing a link time (see the check in xen.lds.S) that _end_boot - _start is
> always smaller than 4KB.

Yes I see:
ASSERT( _end_boot - start <= PAGE_SIZE, "Boot code is larger than 4K")

Excellent!


> At the moment, the size is less than 2KB. So we have plenty of space to grow.
> Also, there are some code that is technically not used while using the ID map.
> So if necessary we can shrink the size to always fit in a PAGE_SIZE.

+1


> > We might have to do a 1:1 mapping of size = _end-_start. It would work
> > with coloring too because we are doing a 1:1 mapping of the old copy of
> > Xen which is non-colored and contiguous (not the new copy which is
> > colored and fragmented).
> 
> I would like to keep the size of the ID mapping to the strict minimum. A
> PAGE_SIZE should be sufficient for most of what we need in Xen.

Yep


> This would help to get rid of the old copy of Xen in case of the cache
> coloring. Otherwise, you technically have to keep it forever if you plan to
> support suspend/resume or even allow CPU hotplug.
> 
> Furthemore, if you keep the two copy around, it is more difficult to know
> which mapping is used and we increase the risk to use the wrong one. For
> instance, the current implementation of cache coloring is clearing the wrong
> set of boot pagetables.
 
Right. Given that we know it is a single page, then we could use a 1:1
of the colored copy without issues.

