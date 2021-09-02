Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C53FF221
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 19:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177593.323127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLqFf-0008RO-OG; Thu, 02 Sep 2021 17:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177593.323127; Thu, 02 Sep 2021 17:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLqFf-0008PJ-Ju; Thu, 02 Sep 2021 17:11:47 +0000
Received: by outflank-mailman (input) for mailman id 177593;
 Thu, 02 Sep 2021 17:11:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLqFe-0008PD-SV
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:11:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLqFe-0001Mu-Rg
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:11:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mLqFe-0000MA-Qq
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 17:11:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mLqFT-0003Zb-3Q; Thu, 02 Sep 2021 18:11:35 +0100
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
	bh=GeXJrQDQtclWxuJyi9dryyESGh+JES5AlryXjtCzhwo=; b=fVot05xTOOmNdteLjWY4uKKlm0
	8/Z6R/YFBUpdHdO18Cqd0KgA3lT12aevbOHftQsqJnw1PumWNigvx5ArAOzInL2u7UjFKNnZWG5Jf
	uAXlw004OWjPvZ4I1hLLjPwu6+d6bLLVKhI9QLfz4yPYVXTfmz5droqlPBcoGzPponUY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24881.1478.795535.377133@mariner.uk.xensource.com>
Date: Thu, 2 Sep 2021 18:11:34 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    George Dunlap <george.dunlap@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 03/12] libxenguest: short-circuit "all-dirty" handling
In-Reply-To: <f85ee373-b497-549b-242f-0dd9eda1b4cd@suse.com>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
	<55875a26-7f1d-a6d9-9384-b03b3b2cb86d@suse.com>
	<60be051f-7751-f15d-ae4d-2c7e9af82693@citrix.com>
	<f85ee373-b497-549b-242f-0dd9eda1b4cd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 03/12] libxenguest: short-circuit "all-dirty" handling"):
> On 25.06.2021 19:02, Andrew Cooper wrote:
> > Single all-dirty runs are a debugging technique only.  All production
> > cases are live, and you don't want to fail midway through because a
> > late, large, memory allocation failed.
> 
> I'm afraid I don't understand: I don't move _when_ the allocation
> occurs; I only suppress the allocation (altogether) when the allocated
> memory remains unused.

Thanks for this reply, Jan.  I hope it is satisfactory to Andrew; if
not, I hope Andrew will be able to explain.

I am going to give this a provisional

Acked-by: Ian Jackson <iwj@xenproject.org>

I may of course withdraw that ack if it is explained to me that this
is patch is wrong.

> >> +        : (void *)-1L;
> > 
> > This is a pointer loaded with a timebomb, which doesn't trigger NULL
> > pointer checks, and for which {set,clear}_bit(dirty_bitmap, large_pfn)
> > won't fault and will instead corrupt random areas of the address space.
> 
> Yeah, this isn't very nice, and gets done away with again in a later
> patch. I'd prefer to keep it like it is (assuming the later change
> will also go in), but if really deemed necessary I can move that code
> re-arrangement here, such that the use of (void *)-1L wouldn't be
> necessary anymore. (You may have noticed that all I did this for is
> to be able to pass the !dirty_bitmap later in the function, and that
> I deliberately only update the local variable, not the hbuf, making
> pretty certain that this pointer isn't going to be de-referenced.)

I agree that this -1L is very unpleasant.

I'm not going to say that you need to restructure your series, but
please make sure you don't commit this patch without the fix.

Thanks,
Ian.

