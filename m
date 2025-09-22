Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1771CB93685
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 23:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128058.1468546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0oWP-0004P3-H1; Mon, 22 Sep 2025 21:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128058.1468546; Mon, 22 Sep 2025 21:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0oWP-0004N0-E8; Mon, 22 Sep 2025 21:56:33 +0000
Received: by outflank-mailman (input) for mailman id 1128058;
 Mon, 22 Sep 2025 21:56:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1v0oWO-0004Mu-Fb
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 21:56:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1v0oWJ-004pxL-1B;
 Mon, 22 Sep 2025 21:56:27 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1v0oWJ-007nRZ-12;
 Mon, 22 Sep 2025 21:56:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=Klu5QEiSkhnW8sBi6uPAWE9QN7Q6Qb+CqegtJdVzPB8=; b=
	P927ngAtdQayCkZuXXsabyNvgjhKrzJepVgHDlz04/w+uNM5P2t2RHcaOEwneuJvEDwzTf56NChZK
	yPou+a2YdUI/vhDjo6IN+8+ZwtxhpoFEBrmw8iU4GKpsLpFb9BzMAkWbWTamc3LZ1cd+uN+1cmX7h
	F6ylMEfnhjCzh1Nuc=;
From: dmukhin@xen.org
Date: Mon, 22 Sep 2025 14:56:26 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/domain: introduce DOMID_ANY
Message-ID: <aNHGCmItdmjEAdZK@kraken>
References: <20250920174732.1207847-2-dmukhin@ford.com>
 <c7e17ae4-0630-4061-b0e8-495cba02bc20@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7e17ae4-0630-4061-b0e8-495cba02bc20@suse.com>

On Mon, Sep 22, 2025 at 05:23:37PM +0200, Jan Beulich wrote:
> On 20.09.2025 19:47, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
> > of the code.
> > 
> > Update all relevant domid_alloc() call sites.
> > 
> > Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v1:
> > - moved DOMID_ANY from the public header
> 
> This addresses my comment, but not Andrew's subsequent response, specifically
> aiming at ...

AFAIU, toolstack should start using DOMID_ANY instead of 0 in
XEN_DOMCTL_createdomain.

I was planning to send a separate patch to address it if that's OK.

> 
> > --- a/tools/tests/domid/harness.h
> > +++ b/tools/tests/domid/harness.h
> > @@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
> >  
> >  #define DOMID_FIRST_RESERVED            (100)
> >  #define DOMID_INVALID                   (101)
> > +#define DOMID_ANY                       DOMID_INVALID
> 
> ... avoiding the need for any such secondary definitions.

In the current design, unit test harness.h has to define DOMID_ANY.
Enabling xen/domain.h to compile for unit test is a separate task, IMO.

> 
> Jan

