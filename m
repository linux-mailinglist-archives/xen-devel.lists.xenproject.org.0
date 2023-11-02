Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892BC7DFC53
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 23:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627022.977859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyg5l-0008R4-10; Thu, 02 Nov 2023 22:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627022.977859; Thu, 02 Nov 2023 22:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyg5k-0008Oa-UR; Thu, 02 Nov 2023 22:23:08 +0000
Received: by outflank-mailman (input) for mailman id 627022;
 Thu, 02 Nov 2023 22:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qyg5j-0008OR-ES
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 22:23:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64aa3a66-79ce-11ee-98d7-6d05b1d4d9a1;
 Thu, 02 Nov 2023 23:23:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2634AB81E1A;
 Thu,  2 Nov 2023 22:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56889C433C8;
 Thu,  2 Nov 2023 22:23:03 +0000 (UTC)
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
X-Inumbo-ID: 64aa3a66-79ce-11ee-98d7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698963784;
	bh=e9xvSEN23zZhoD3ITWnhftdjBgoK/PfzmzVsdrC1pQA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aDwDa4o0caCE+Ze3h50U4ZKQLSu1HWPf05Cpqy21V3Ujf0DiPAcSHyQejXCPX5eMx
	 z9LrKiUEQToIkj4nnhKjXHBdgV3A/0vZcyHCMnY2NbdXO53PRWsnijBIC/NrNyRg4o
	 Y6+Z3PLGqyUU95jet4TN6N0kg6O76+dAN/WjPuLCCSeUojeum58C5D70LOQUhfGT5f
	 JZEBABdVaAoA8YuUkNuU6NDTbAdJwAModV6db53YkgrO+vSVF8ljbPXfZVy9neVrmb
	 MgGhIvy3U7s1w0JccbfoN4cxx0qb4o4bVWoULyzQz0I+6SIJjr26VfqIaCZlCPXEa3
	 e4GABYQDyMRHA==
Date: Thu, 2 Nov 2023 15:23:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/lib: remove the overwrtitten string functions
 from x86 build
In-Reply-To: <fd55a636-094f-4c9a-b57c-44fcefa1eb20@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311021521500.2125691@ubuntu-linux-20-04-desktop>
References: <c313895654437fe154e989a7d633cca2ccc710d8.1698914967.git.federico.serafini@bugseng.com> <fd55a636-094f-4c9a-b57c-44fcefa1eb20@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1302277698-1698963784=:2125691"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1302277698-1698963784=:2125691
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Nov 2023, Andrew Cooper wrote:
> On 02/11/2023 10:21 am, Federico Serafini wrote:
> > Remove the generic implementation of memcpy(), memmove() and
> > memset() from the x86 build since a version written in asm is present.
> > This addesses violations of MISRA C:2012 Rule 8.6 ("An identifier with
> > external linkage shall have exactly one external definition").
> >
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> As I said on one of the previous calls, this is an error in analysis,
> not a bug in Xen.
> 
> The behaviour when linking a library is well defined by the toolchain. 
> Disassemble the final hypervisor and observe that there really is only
> one implementation, and it's always the arch-optimised version when both
> exist.

This is done automatically by linker, right? I am asking because I was
curious and searching through the build system but couldn't find a
specific place where the dropping of the lib implementation of things is
done.
--8323329-1302277698-1698963784=:2125691--

