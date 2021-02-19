Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C120831FD8C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87006.163872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9Dk-0005Qh-BJ; Fri, 19 Feb 2021 17:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87006.163872; Fri, 19 Feb 2021 17:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9Dk-0005QI-89; Fri, 19 Feb 2021 17:05:36 +0000
Received: by outflank-mailman (input) for mailman id 87006;
 Fri, 19 Feb 2021 17:05:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD9Di-0005QB-UO
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:05:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD9Di-0005DG-Rv
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:05:34 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD9Di-0008Jp-QZ
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:05:34 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD9Df-0001Ty-Ly; Fri, 19 Feb 2021 17:05:31 +0000
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
	bh=+EICzCcB8txsTdiA7EvP5djlrzhJs+nXTRVs3jeK/94=; b=0PWmZ8c1AcEk3iU3/sBumcfmwD
	sYik+Q/bfsPuUjGl4K4VolYKtfnZfzLIy08Qnts2sbNcX+lO2Yu9Wyz0/wcjvvREFjEnowo1c5Isy
	iTJE5rllXLFvvQwoSZDAce8dVEQCnxkYTNgLtxTU40/qSaKU7m5K441kj0cgRPyf8bzk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24623.61403.440917.434@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 17:05:31 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Kevin Tian <kevin.tian@intel.com>,
    Julien Grall <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH for-4.15 v2] VMX: use a single, global APIC access page [and 1 more messages]
In-Reply-To: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>,
	<dcada8be-a91d-87f0-c579-30f3c7e3607e@suse.com>
References: <a895386d-db14-2743-d8f9-09f9509a510a@suse.com>
	<dcada8be-a91d-87f0-c579-30f3c7e3607e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v2] VMX: use a single, global APIC access page"):
> The address of this page is used by the CPU only to recognize when to
> access the virtual APIC page instead. No accesses would ever go to this
> page. It only needs to be present in the (CPU) page tables so that
> address translation will produce its address as result for respective
> accesses.
> 
> By making this page global, we also eliminate the need to refcount it,
> or to assign it to any domain in the first place.

Thanks for this.

From this:

Jan Beulich writes ("Re: [PATCH v2] VMX: use a single, global APIC access page"):
> While this patch was triggered not just by Julien's observation of
> the early p2m insertion being a problem, but also many earlier
> times of running into this odd code, it is - especially at this
> stage - perhaps a possible option to split the change into just
> the movement of the set_mmio_p2m_entry() invocation and all the
> rest, in order to defer that rest until after 4.15.

I infer that this contains a bugfix, but perhaps other
changes/improvements too.

George, I think you're our expert on this refcounting stuff - what do
you think of this ?

I guess my key question is whether this change will introduce risk by
messing with the complex refcounting machineryt - or remove it by
removing an interaction with the refcounting.

Thanks,
Ian.

