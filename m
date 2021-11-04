Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C7445205
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 12:11:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221442.383153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miadx-0004YW-1w; Thu, 04 Nov 2021 11:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221442.383153; Thu, 04 Nov 2021 11:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miadw-0004WT-UG; Thu, 04 Nov 2021 11:10:52 +0000
Received: by outflank-mailman (input) for mailman id 221442;
 Thu, 04 Nov 2021 11:10:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miadv-0004WN-PL
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 11:10:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miadv-0002GZ-OM
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 11:10:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miadv-0002Md-Nj
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 11:10:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miadm-0002VH-Pm; Thu, 04 Nov 2021 11:10:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=+LF0QStxz4XOOvOJPVghT7gYSIbVET7I893lSGCaARw=; b=tqzpVbsZfmDtSjXqLZpDwYalRR
	Y6wwV/EKPvLfNBcwuKOxzJVG1+Gm1Xt5/Jjn3ZYWpHZJwLPzAKHJa//3YM79nBlWhThUsuRixFNmv
	cP938z5YqCP6J5XXIVHkJ8o657d2Zz065GM+rbYUu8av+gk/qisKxHCro0W9xUR/GhQY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24963.49073.792435.490087@mariner.uk.xensource.com>
Date: Thu, 4 Nov 2021 11:10:41 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    Paul Durrant <paul@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/3][4.16] x86/IOMMU: enabled / intremap handling
In-Reply-To: <1d65c4a1-129c-c9ba-15a3-6780c3c8d9a0@suse.com>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
	<a51d6449-caba-8a67-3c11-b593574f3839@suse.com>
	<dde21f84-861f-9c68-5e55-28f5bf407aa4@suse.com>
	<24962.46734.824520.805708@mariner.uk.xensource.com>
	<1d65c4a1-129c-c9ba-15a3-6780c3c8d9a0@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 0/3][4.16] x86/IOMMU: enabled / intremap handling"):
> > Reviewed-by: Ian Jackson <iwj@xenproject.org>
> > 
> >> Patch 2 corrects an (unlikely but not impossible to be taken) error
> >> path, supposedly making systems functional again in case they would
> >> in fact cause that error path to be taken. The risk looks low to me,
> >> given that two function calls with previously assumed to be
> >> identical results now get folded into one with the result latched.
> > 
> > This one also:
> > 
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> Thanks, but your reply leaves me a little confused: Your use of "also"
> may mean R-b for both patches but R-a-b only for patch 2. But I could
> also find a variety of other interpretations, including that the
> first R-b really was meant to be R-a-b (which otherwise I'd need on
> top of the R-b anyway). Please clarify.

Um.  Well spotted.  I meant release-acked-by for both.  I botched the
keystroke in my MUA.  Sorry for the confusion.

So FTAAD I have *not* "Reviewed" either patch (although I did read it,
I don't consider myself qualified to give an R-b).

> > I think, from reading the thread, that patch 3 is not targeting 4.16.
> 
> Correct. The other related one now targeting 4.16 is the separately
> submitted "x86/x2APIC: defer probe until after IOMMU ACPI table
> parsing". But I can see reasons for you to prefer to have that
> deferred.

Thanks,
Ian.

