Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD72045CBD6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 19:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230503.398463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwfn-0004EV-Bb; Wed, 24 Nov 2021 18:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230503.398463; Wed, 24 Nov 2021 18:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwfn-0004Br-8h; Wed, 24 Nov 2021 18:07:11 +0000
Received: by outflank-mailman (input) for mailman id 230503;
 Wed, 24 Nov 2021 18:07:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpwfm-0004BS-2O
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 18:07:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpwfm-0004Wa-1e
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 18:07:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mpwfm-0006yx-0l
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 18:07:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mpwff-0003f1-1Q; Wed, 24 Nov 2021 18:07:03 +0000
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
	bh=G+vEv0sXV59aTdxXKeUITquHbxqNDKR3dH/yn7rZkS8=; b=Z8u6GXQGoW6GVFeVdVGEJQG0dO
	s9H/3UQpYpKLbb3vr2c+cSFjTSkACWLP+UOA9q2xG3GMG8Ja1neLb/vszya7mWPxiIBZVaNoNJdbS
	7sIUoTP8BcV9RGJclhdVCIQWMhYsL/UUonU43xM0Vfl+tPNJ4yf92IB+B7igzhtqSBWo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24990.32581.766301.992950@mariner.uk.xensource.com>
Date: Wed, 24 Nov 2021 18:07:01 +0000
To: Roger Pau Monne <roger.pau@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <amc96@srcf.net>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max
 policies
In-Reply-To: <9fd0c2f4-1b8f-bcd3-93bd-eea47b61e445@srcf.net>
References: <20211124161649.83189-1-roger.pau@citrix.com>
	<24990.26451.287618.213116@mariner.uk.xensource.com>
	<9fd0c2f4-1b8f-bcd3-93bd-eea47b61e445@srcf.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

(Hoisting Roger and Jan to the To:)

Andrew Cooper writes ("Re: [PATCH for-4.16] x86/cpuid: do not shrink number of leaves in max policies"):
> On 24/11/2021 16:24, Ian Jackson wrote:
> > Questions from my RM hat:
> >
> > Is there a workaround ?
> 
> No.
> 
> The safety check being tripped is intended to prevent the VM crashing on
> resume, and is functioning correctly.
> 
> > What proportion of machines do we think this might affect ?
> 
> Any pre-xsave machines (~2012 and older), and any newer machines booted
> with no-xsave.
> 
> All AMD machines are actually broken by this, except that failure is
> being masked by other changes in 4.16.  Future AMD machines will break
> in the same way.

This is quite bad, then, I think.  I'm inclined to treat this as a
blocker for the release.

> > Jan, Andy, do you have an opinion ?
> 
> The reversion doesn't go far enough.
> 
> While the shrinking of the max policies manifests as a concrete breakage
> here, there is further breakage caused by shrinking the default
> policies, because it renders some cpuid= settings in VM config files broken.
> 
> There is still no feedback or error checking from individual cpuid=
> settings, so this will manifest as the VM admin settings silently no
> longer taking effect.
> 
> 
> I recommend a full and complete reversion of 540d911c28.  The
> justification for it in the first place is especially weak because it is
> explicitly contrary to how real hardware behaves, and this is the 3rd
> ABI breakage it has caused, with more expected in the future based on
> the analysis of what has gone wrong so far.

I would like to collect as many opinions as possible.  Do we have
other options besides (a) reverting 540d911c28, or (b) releasing with
this bug ?

What bad consequences follow, for users of Xen, from reverting
540d911c28 ?  Presumably it had some purpose which will be undermined
by reverting it.  The commit message speaks of details but doesn't
explain the ultimate impact, at least not to someone like me who only
dimly perceives the underlying technical aspects.

I did an experimental git-revert.  It seemed to go cleanly.
If we go for the revert, we would need a commit message.

I would like to make a decision tomorrow if at all possible.

Thanks,
Ian.

