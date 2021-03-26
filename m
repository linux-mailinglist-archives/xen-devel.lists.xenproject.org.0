Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D273D34A93D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 15:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101846.195069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPn7P-00032l-1Z; Fri, 26 Mar 2021 14:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101846.195069; Fri, 26 Mar 2021 14:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPn7O-00032M-UM; Fri, 26 Mar 2021 14:07:18 +0000
Received: by outflank-mailman (input) for mailman id 101846;
 Fri, 26 Mar 2021 14:07:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPn7N-00032H-PF
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:07:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPn7N-0008JC-Ml
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:07:17 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPn7N-0002O0-Ll
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 14:07:17 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPn7F-0002l6-Dy; Fri, 26 Mar 2021 14:07:09 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=mbdj9qMK5fAVTq8jbTpx8PlkEojetXFvmPFUtkRUyhs=; b=kIUEhUJ1Ej+WRI+LvHIzzJ1IeD
	ygupU7Sa2aVZx1O51xwNwYqpJw13+aVGdzbWmmdY5Xyc3SzRhbNLoHgK4q20ozlIdtawwdx4dNgOR
	vIfJCBYnQy7pGlncIMphw7NMzHbW7h752jjsykh5j8saIK/AnUKT5hkHY3297Zqhv4kk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.60045.100353.660483@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 14:07:09 +0000
To: committers@xenproject.org
CC: Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=  <marmarek@invisiblethingslab.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>,
    Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
In-Reply-To: <be87024c-3079-1b4f-5053-bb40bfab406a@suse.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
	<20210325172132.14980-1-andrew.cooper3@citrix.com>
	<24669.52641.499147.88002@mariner.uk.xensource.com>
	<24669.54213.173154.400771@mariner.uk.xensource.com>
	<CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
	<24669.56958.383583.53595@mariner.uk.xensource.com>
	<be87024c-3079-1b4f-5053-bb40bfab406a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally"):
> TBH delaying the release for this specific problem should be seriously
> considered imo. In principle I'm in favor of (3) of the above, if there
> weren't the downsides I did mention in prior mails.

Thanks for putting forward your opinion.  I am always happy to hear
what people say and this input is very valuable.  However:

I am not inclined to delay the release over this.  Delaying the
release might be appropriate if this problem was unforeseen and
recently discovered, late in the freeze.  But it was not.

That there was a significant regression caused by e1de4c196a2e
  x86/timer: Fix boot on Intel systems using ITSSPRC static PIT clock gating
was already known at least by the 24th of February[1].

Since then, that change has been at risk of being reverted if it went
unfixed.  Unfortunately the the first cut of patches to try fix this
something like properly were only posted yesterday.

It is up to everyone who wants something to make it into the release,
to make sure that the code is ready in time.  That includes sorting
out any regressions it introduces.  In the case of e1de4c196a2e that
has not occurred.

It doesn't seem to me that we will have sufficient confidence in the
more comphrenesive fix, for it to go into staging-4.15 today.

I think the appropriate course, therefore, is the conditional (based
on commaned line) revert proposed by Jan.

Sorry,
Ian.

[1] https://lists.xenproject.org/archives/html/xen-devel/2021-02/msg01533.html

