Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AD39117D7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 03:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744973.1152101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKShp-0003n4-4I; Fri, 21 Jun 2024 01:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744973.1152101; Fri, 21 Jun 2024 01:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKShp-0003lY-1c; Fri, 21 Jun 2024 01:04:45 +0000
Received: by outflank-mailman (input) for mailman id 744973;
 Fri, 21 Jun 2024 01:04:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKSho-0003lS-1n
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 01:04:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dcfad8c-2f6a-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 03:04:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D61E0620A2;
 Fri, 21 Jun 2024 01:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C71C2BD10;
 Fri, 21 Jun 2024 01:04:40 +0000 (UTC)
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
X-Inumbo-ID: 3dcfad8c-2f6a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718931881;
	bh=zlaX0qpCKKW4KMtuMQeR0LBSBDo9WEky2UALNOsvfKg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mO5Jj2Joro3jctAJj3oH6DbBXf7V+jL2gIHnZpcHo433ph2j16B+Y7fTO4o6qPCTs
	 jnecYdKgE0tqcNdWQzpF0LGZcA5La45J5gUw262/f/qSHo6dYYSdfH7y/1ZAuzHdTi
	 XwsKk9nnZCzvnDWtvDuth5ANlr26HakBHLs0dNpfJtY1zL4jEA47SSb9BHKMDJbK0f
	 0qgdDWx9sh24JUYmeMky1ImggeinfLvIPtl9ia3KqP8NCIm4gAt9jB+zCYk9I0Q1x2
	 uetbVjAkJSu8HM5wQ7jpHPpxN2PLfHhyEq/pwk3SgZBOo78wyGHtsGZeQuF0uiEOYN
	 YAeMjxuLttz5A==
Date: Thu, 20 Jun 2024 18:04:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: alessandro.zucchelli@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] automation/eclair_analysis: deviate common/unlzo.c for
 MISRA Rule 7.3
In-Reply-To: <c6a2fb51-1ffe-4d13-9894-5ca3169c392e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406201804350.2572888@ubuntu-linux-20-04-desktop>
References: <20342a68627d5fe7c85c50f64e9300e9a587974b.1718704260.git.alessandro.zucchelli@bugseng.com> <63d11da5-4a5a-4354-ab57-67fbb7110f45@suse.com> <alpine.DEB.2.22.394.2406191817310.2572888@ubuntu-linux-20-04-desktop> <566b0cb9b718b5719a6b497b36e90ab4@bugseng.com>
 <c6a2fb51-1ffe-4d13-9894-5ca3169c392e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jun 2024, Jan Beulich wrote:
> On 20.06.2024 15:19, Alessandro Zucchelli wrote:
> > On 2024-06-20 03:17, Stefano Stabellini wrote:
> >> On Tue, 18 Jun 2024, Jan Beulich wrote:
> >>> On 18.06.2024 11:54, Alessandro Zucchelli wrote:
> >>>> The file contains violations of Rule 7.3 which states as following: The
> >>>> lowercase character `l' shall not be used in a literal suffix.
> >>>>
> >>>> This file defines a non-compliant constant used in a macro expanded in a
> >>>> non-excluded file, so this deviation is needed in order to avoid
> >>>> a spurious violation involving both files.
> >>>
> >>> Imo it would be nice to be specific in such cases: Which constant? And
> >>> which macro expanded in which file?
> >>
> >> Hi Alessandro,
> >> if you give me the details, I could add it to the commit message on 
> >> commit
> > 
> > The file common/unlzo.c defines the non-compliant constant 
> > LZO_BLOCK_SIZE as
> > "256*1024l" (note the 'l'). This file is excluded from ECLAIR analysis 
> > but
> > as the constant is used in macro xmalloc_bytes, expanded in non-excluded 
> > file
> > include/xen/xmalloc.h, thus these specific violations need this 
> > configuration
> > in order to be excluded.
> 
> Would it perhaps be easier to swap the l for an L?

+1

