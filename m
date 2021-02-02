Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A3D30BE14
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 13:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80531.147359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ufU-0000RY-Ge; Tue, 02 Feb 2021 12:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80531.147359; Tue, 02 Feb 2021 12:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ufU-0000R9-DG; Tue, 02 Feb 2021 12:20:28 +0000
Received: by outflank-mailman (input) for mailman id 80531;
 Tue, 02 Feb 2021 12:20:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ufS-0000R3-Os
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:20:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ufS-0004iM-O6
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:20:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6ufS-0004zK-NN
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 12:20:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6ufP-00021H-GQ; Tue, 02 Feb 2021 12:20:23 +0000
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
	bh=Tv5QIy12FDCUPsCxutoRvGxqSmV8/9YDlxqN1gWL/tA=; b=gWeJYKwbx2RvWbfpi7t2IiywZ0
	ne3zN0Lz/6qGragGn3rstAtSXV+X04MMZiAag87SHKU4saEQzEx8bL2iU6WFlmC1Uyr/NCAfcIU67
	m0cONGJtqtX3FbCN68E+mbqcSgld7XLS9Maturr/k+i/rHuXxby7akmBzvPrut9ofBLI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24601.17287.280124.602809@mariner.uk.xensource.com>
Date: Tue, 2 Feb 2021 12:20:23 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    "Jun  Nakajima" <jun.nakajima@intel.com>,
    Kevin Tian <kevin.tian@intel.com>,
    =?iso-8859-2?Q?Micha=B3_Leszczy=F1ski?= <michal.leszczynski@cert.pl>,
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v9 00/11] acquire_resource size and external IPT monitoring
In-Reply-To: <20210201232703.29275-1-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH v9 00/11] acquire_resource size and external IPT monitoring"):
...
> Therefore, I'd like to request a release exception.

Thanks for this writeup.

There is discussion here of the upside of granting an exception, which
certainly seems substantial enough to give this serious consideration.

> It [is] fairly isolated in terms of interactions with the rest of
> Xen, so the changes of a showstopper affecting other features is
> very slim.

This is encouraging (optimistic, even) but very general.  I would like
to see a frank and detailed assessment of the downside risks, ideally
based on analysis of the individual patches.

When I say a "frank and detailed assessment" I'm hoping to have a list
of the specific design and code changes that pose a risk to non-IPT
configurations, in decreasing order of risk.

For each one there should be brief discussion of the measures that
have exist to control that risk (eg, additional review, additional
testing), and a characterisation of the resulting risk (both in terms
of likelihood and severity of the resulting bug).

All risks that would come to a diligent reviewer's mind should be
mentioned and explicitly delath with, even if it is immediately clear
that they are not a real risk.

Do you think that would be feasible ?  We would want to make a
decision ASAP so it would have to be done quickly too - in the next
few days and certainly by the end of the week.


Since you mentioned patch 1 and asserted it didn't need a release-ack,
I looked at it in a little more detail.  It seems to contain a
moderate amount of (fairly localised) restructuring.  IDK whether
XENMEM_acquire_resource is used by non-IPT configurations but I didn't
see an assertion anywhere that it isn't.

I appreciate that whether something is "straightforward" on the one
hand, vs involving "substantial refactoring" on the ohter, or this is
a matter of judgement, which I have left up to the commiters during
this part of the freeze.  But for the record my view is that this
patch is not a "straightforward bugfix" and needs a release ack.


To give you an idea of what kind of thing I am looking for in a risk
assessment, I have written one up for
  [PATCH v9 03/11] tools/[lib]xl: Add vmtrace_buf_size parameter

Ideally I would like to go through a similar process for the other
patches.


I appreciate that this is rather a more throrough process than we have
adopted in the past.

Thanks,
Ian.

