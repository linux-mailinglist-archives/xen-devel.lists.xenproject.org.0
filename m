Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E244445A1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 17:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221079.382603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miItO-0000G8-Tx; Wed, 03 Nov 2021 16:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221079.382603; Wed, 03 Nov 2021 16:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miItO-0000DK-Qf; Wed, 03 Nov 2021 16:13:38 +0000
Received: by outflank-mailman (input) for mailman id 221079;
 Wed, 03 Nov 2021 16:13:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miItO-0000DE-8u
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:13:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miItO-0004gt-6h
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:13:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miItO-0002bT-5n
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:13:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miItF-0004kk-0k; Wed, 03 Nov 2021 16:13:29 +0000
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
	bh=tN6YB8UXGoO/QYw5dsZ2usugQryNCTLaa3SFgZe3KxI=; b=Rd/8yeRRFj86qfgPzFGdB3lSLd
	ZnVdUQR10TqHvXtrPZ6T3dOG1tCfvVXJkv1OdbSeLgdC/XgSkaQ3ma3lAjF/59KmS1K0tUcUWk0Jq
	zuC/QFrSeRGO3edu87eH6LhiaXRbhzKYUo8jxpScAbyLgMriZzfpYRu2jLnemTYRO+XM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24962.46376.136195.463274@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 16:13:28 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12
In-Reply-To: <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
	<77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12"):
> On 27.10.2021 22:07, Andrew Cooper wrote:
> >   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
> 
> I disagree with the compiler's analysis: While &(pirq)->arch.hvm.dpci
> indeed can't be NULL, that's not the operand of !. The operand of !
> can very well be NULL, when pirq is.
> 
> > which is a hint that the code is should be simplified to just:
> > 
> >   if ( !pirq )
> > 
> > Do so.
> 
> And I further agree with Roger's original reply (despite you
> apparently having managed to convince him): You shouldn't be open-
> coding pirq_dpci(). Your observation that the construct's result
> isn't otherwise used in the function is only one half of it. The
> other half is that hvm_pirq_eoi() gets called from here, and that
> one does require the result to be non-NULL.

Can you (collectively) please come to some agreement here ?
I think this is mostly a question of taste or style.  Please vote on
it if you can't quickly get consensus.

I have added the for-4.16 tag since this seems like a bugfix that
should probably go into 4.16 ?  Unless I have misunderstood.

Thanks,
Ian.
(with RM hat on)

