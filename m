Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A86ABFEB4
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 23:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992586.1376263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqfS-0006Dj-R7; Wed, 21 May 2025 21:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992586.1376263; Wed, 21 May 2025 21:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHqfS-0006BE-O2; Wed, 21 May 2025 21:08:02 +0000
Received: by outflank-mailman (input) for mailman id 992586;
 Wed, 21 May 2025 21:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrLC=YF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHqfR-0006B8-4o
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 21:08:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abb0cc8f-3687-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 23:07:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2EB55444B1;
 Wed, 21 May 2025 21:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9EFC4CEE4;
 Wed, 21 May 2025 21:07:55 +0000 (UTC)
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
X-Inumbo-ID: abb0cc8f-3687-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747861677;
	bh=iCJtP202SBbCFbzyF1CsTxdlhtaL+N1jPWwIS62hgGU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TkI6CxLWFv2v4ZemU/n2AcyjViXipRzOcBbdXIMtSBZBwXKpSjDEHari7nk23qvXO
	 MidJL/3005/zS38agTkC2EavirPCOkdl0F4m075DDQrDcYwGO5ddPRNwS42LFg8J+G
	 rNy7F85kiHJXFRAskMNn1HluUqYd/JtqkD7jeYBZ/8UkQxMAQkAevAnr9ddo94t/iJ
	 c9fITHul2EuWubqHXTqi9qV/pc0cBJMfU+YKitEnoHmWZuucU9Y7kQt7sN3V+kM7tZ
	 Dv0VYZYqs+YTL0d0cVRRoX2gs/1V1jaEJeDfrjepdK9OAjnycxkHU4JcOlJk+Luv9j
	 6D7VPiN4vsbAw==
Date: Wed, 21 May 2025 14:07:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alejandro Vallejo <agarciav@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Michal Orzel <michal.orzel@amd.com>, Jason Andryuk <jason.andryuk@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: Hyperlaunch/dom0less code sharing
In-Reply-To: <f601a1c1-c907-4e2d-878f-dc57507eb295@suse.com>
Message-ID: <alpine.DEB.2.22.394.2505211404260.147219@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <f601a1c1-c907-4e2d-878f-dc57507eb295@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Jan Beulich wrote:
> On 21.05.2025 16:35, Alejandro Vallejo wrote:
> > I think we should aim to share binding code wherever possible, using common
> > datastructures (kernel_info and bootmodule) as dumping ground for the results
> > of the binding parsing functions. I seek agreement on the following 3 points
> > for the end goal of DTB multidomain boots on x86 before I start slicing
> > my hacks into reasonable chunks.
> > 
> >   1. We want common data structures, with arch-specific fields to hold
> >      information from xen,domain DT nodes
> >   2. We want to have a single collection of DTB parsers in the code.
> >   3. We want to operate on the unflattened DTB for the majority of parsing.
> >     (plus a minimal version on the FDT in order to bootstrap, also common)
> 
> +1 on all three, with the caveat that I'm far from being an expert on DT.

+1 from me as well


