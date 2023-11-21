Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A257F21F0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:04:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637403.993164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5EFh-0003cA-Rw; Tue, 21 Nov 2023 00:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637403.993164; Tue, 21 Nov 2023 00:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5EFh-0003aA-PH; Tue, 21 Nov 2023 00:04:29 +0000
Received: by outflank-mailman (input) for mailman id 637403;
 Tue, 21 Nov 2023 00:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5EFg-0003a4-Qv
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:04:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 887f48dd-8801-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 01:04:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8150ACE1853;
 Tue, 21 Nov 2023 00:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A225DC433C8;
 Tue, 21 Nov 2023 00:04:21 +0000 (UTC)
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
X-Inumbo-ID: 887f48dd-8801-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700525062;
	bh=pk5Iy/4G5TiEwClhN3GiuVV0qRqvavgm608FBwovgdM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZjouLuMrWDAVxN+HUPz3jHWcZh13N+IR4127tl36WqTOE2CO4ylBJEBTxfVh5im6z
	 UFH7e9+Ear/N+0rJ9Iwzjfn9cieBgglp7PZLOGTyDoJv446vXHQh1u1sEO/c9sXpuz
	 DpRlnMkY2ecfZq3sPdbqMGA5oAzzpvo0Q2rPMG9h3Syq8wjfsqK3B04R/j2AAl3WQ0
	 lgqqSslzcft6UKowN5hMYTDfdKGb7Nb2ejhqH0BCgBic+mNA+/toGyI1YvIXJ28HJw
	 1EmpRfg0uw/abGKUDX/E16bLj/nQbKnjliuXIZZ8P3TZUN+l4POmJAtCwMlJQBoSgM
	 iJtTAmqaYwVLw==
Date: Mon, 20 Nov 2023 16:04:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <51010cec-596a-4249-82dc-ac711c3962c3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311201603220.773207@ubuntu-linux-20-04-desktop>
References: <cover.1700209834.git.federico.serafini@bugseng.com> <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com> <19d887e6-8c07-43f3-a2de-88ce0a0c99ba@suse.com> <b481a966-4f29-4b05-8246-d3f1eec19d0c@bugseng.com>
 <51010cec-596a-4249-82dc-ac711c3962c3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Nov 2023, Jan Beulich wrote:
> On 20.11.2023 14:13, Federico Serafini wrote:
> > On 20/11/23 10:02, Jan Beulich wrote:
> >> On 17.11.2023 09:40, Federico Serafini wrote:
> >>> --- a/xen/include/xen/sort.h
> >>> +++ b/xen/include/xen/sort.h
> >>> @@ -23,8 +23,8 @@
> >>>   extern gnu_inline
> >>>   #endif
> >>>   void sort(void *base, size_t num, size_t size,
> >>> -          int (*cmp)(const void *, const void *),
> >>> -          void (*swap)(void *, void *, size_t))
> >>> +          int (*cmp)(const void *key, const void *elem),
> >>
> >> Why "key" and "elem" here, but ...
> >>
> >>> +          void (*swap)(void *a, void *b, size_t size))
> >>
> >> ... "a" and "b" here? The first example of users of sort() that I'm
> >> looking at right now (x86/extable.c) is consistent in its naming.
> >>
> > 
> > On the Arm side there are {cmp,swap}_memory_node() and
> > {cmp,swap}_mmio_handler(): "key"/"elem" are used for the comparison
> > and "_a"/"_b" for the swap.
> 
> So - re-raising a question Stefano did raise - is Misra concerned about
> such discrepancies? If yes, _all_ instances need harmonizing. If not, I
> see no reason to go with misleading names here.

Federico confirmed that the answer is "no".

I think we can use "key" and "elem" in this patch as they are more
informative than "a" and "b"

