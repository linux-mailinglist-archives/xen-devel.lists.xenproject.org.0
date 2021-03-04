Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC4932D5C0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 15:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93324.176159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpS3-0001av-II; Thu, 04 Mar 2021 14:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93324.176159; Thu, 04 Mar 2021 14:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpS3-0001aV-E5; Thu, 04 Mar 2021 14:59:43 +0000
Received: by outflank-mailman (input) for mailman id 93324;
 Thu, 04 Mar 2021 14:59:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpS2-0001aP-60
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:59:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpS2-0005J0-2p
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:59:42 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpS2-0006AX-1T
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:59:42 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHpRy-0005YO-M1; Thu, 04 Mar 2021 14:59:38 +0000
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
	bh=SKifOTVH4K20PQ20KfxjuWzSJP4teiRuzKbwZSfJ8K0=; b=F5DMOHCSrFvOTaSu5cJTfIdM2t
	lzRWLM3fw631gUhL67mGQnpDw2y5emeNrd+gXuCtQFFxsVVOYoLYGiz5GX/gcd2Mg2+h0U/uXzEdc
	hgmKDSykvuoNedxDVXcEmvYdzUs1aUI3xaprdqCZloIH5l3xW0NyHrxz3Y2aCo60h+Xw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.62938.427877.757656@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 14:59:38 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Kevin Tian <kevin.tian@intel.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior
In-Reply-To: <20210304144755.35891-1-roger.pau@citrix.com>
References: <20210304144755.35891-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior"):
> Introduce an option to allow selecting a less strict behaviour for
> rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
> commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
> Xen result in the injection of a #GP to the guest. This is a behavior
> change since previously a #GP was only injected if accessing the MSR
> on the real hardware will also trigger a #GP.
...
> I wonder whether we need to to enable this option by default for
> guests being migrated from previous Xen versions? Maybe that's not
> required as the option is helpful mostly for early boot I would
> assume, afterwards an OS should already have the #GP handler setup
> when accessing MSRs.

I think it's almost as bad to have guests which can be migrated in,
but which then cannot reboot.

Historically we have taken the view that new Xen must support old
guests, even if that means being bug-compatible.  So I am strongly in
favour of avoiding such a usability regression.

Which I think means enabling this option by default ?

> >From a release PoV the biggest risk would be breaking some of the
> existing MSR functionality. I think that's a necessary risk in order
> to offer such fallback option, or else we might discover after the
> release that guests that worked on Xen 4.14 don't work anymore in Xen
> 4.15.

Yes.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

