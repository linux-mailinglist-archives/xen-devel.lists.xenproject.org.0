Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AF4D0A89F
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 15:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198871.1515676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veD5b-0000mx-69; Fri, 09 Jan 2026 14:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198871.1515676; Fri, 09 Jan 2026 14:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veD5b-0000lL-3Y; Fri, 09 Jan 2026 14:03:43 +0000
Received: by outflank-mailman (input) for mailman id 1198871;
 Fri, 09 Jan 2026 14:03:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1veD5a-0000lC-2m
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 14:03:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1veD5W-00Gb6q-1V;
 Fri, 09 Jan 2026 14:03:38 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1veD5V-00FZAX-2B;
 Fri, 09 Jan 2026 14:03:37 +0000
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
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=ycbTpcP2rEIQcuL8GJhr2lp78qmfFmpjbhJwB8/Zpwo=; b=JfSCEld3avjKAMXHiCHmENUh+A
	I3ztVggcU4L4qeYZOGnyiPxXCNgzBMcrPEcJNpT6AQxbhlIOAn1VyYkM/RVkJe3xhrZgWLxxvJ5dT
	of3yd2wF/J1EMK60DTbR+Fp0d2ctO+w+5jF01SHrtbW2lSZLH9zuJjDmPook9mS+0pjU=;
From: dmukhin@xen.org
Date: Fri, 9 Jan 2026 06:03:36 -0800
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	dmukhin@ford.com
Subject: Re: [PATCH v3] xen/domain: introduce DOMID_ANY
Message-ID: <aWEKuE4ccuswO8dy@kraken>
References: <20250924030630.122229-2-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2512091704020.19429@ubuntu-linux-20-04-desktop>
 <f5a7536b-32e5-44d9-b087-556559650fd8@suse.com>
 <aTlD4nZSU5rXIxSo@Mac.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTlD4nZSU5rXIxSo@Mac.lan>

On Wed, Dec 10, 2025 at 10:56:50AM +0100, Roger Pau Monné wrote:
> On Wed, Dec 10, 2025 at 08:36:37AM +0100, Jan Beulich wrote:
> > On 10.12.2025 02:04, Stefano Stabellini wrote:
> > > On Tue, 23 Sep 2025, dmukhin@xen.org wrote:
> > >> From: Denis Mukhin <dmukhin@ford.com> 
> > >>
> > >> Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
> > >> of the code.
> > >>
> > >> Update all relevant domid_alloc() call sites.
> > >>
> > >> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> > >> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > 
> > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > The other day concern was voiced over aliasing DOMID_ANY with DOMID_INVALID.
> > I don't recall though who it was or where.
> 
> I'm afraid it was me (at least) that voiced such concern.  But then I
> completely forgot to reply to the patch.  I don't think this is a good
> idea, aliasing DOMID_ANY with DOMID_INVALID is likely to be dangerous
> in the long run.  In the example here it's fine, because the function
> itself doesn't use DOMID_INVALID (iow: all usages of DOMID_INVALID are
> replaced with DOMID_ANY).
> 
> However I could see a function wanting to use both DOMID_INVALID and
> DOMID_ANY for different purposes.  Having both aliased to the same
> value is not going to work as expected.  If we have to introduce
> DOMID_ANY it must use a different value than DOMID_INVALID.  And given
> the context here I would be fine leaving domid_alloc() to handle
> getting passed DOMID_INVALID as a signal to search for an empty domid
> to use, I don't see a compelling reason to introduce DOMID_ANY.

Thanks for the feedback!

I agree with having a dedicated reservation for DOMID_ANY.
I think introducing a new DOMID_ANY symbol improves code readability
a bit.

> 
> Thanks, Roger.

