Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD08323E0E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 14:27:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89351.168219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEuBp-00023K-6w; Wed, 24 Feb 2021 13:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89351.168219; Wed, 24 Feb 2021 13:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEuBp-00022v-3W; Wed, 24 Feb 2021 13:26:53 +0000
Received: by outflank-mailman (input) for mailman id 89351;
 Wed, 24 Feb 2021 13:26:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEuBn-00022q-KZ
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:26:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEuBn-00069e-HA
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:26:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEuBn-0001M1-Eb
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:26:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEuBk-000705-7E; Wed, 24 Feb 2021 13:26:48 +0000
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
	bh=zsfChPZ6eRshvqQ362xtptkiwsoOuYeftxuBv6ENnuE=; b=Nw2Vr2er6gI+NQ1R/nFRpwHXD7
	Z0KTvLcv/Nh3R2y0AGA3SWY1NWIDnmOauUlBpCoBz6jPnqpsjT1inyTBKvdnfLWtELU1FPVRPp+gh
	qvkvyzCnbvi7sXkQDH4SS1o0tjuf690tPnj+nxQsX2KzZVVP9Q1o3n47/RYxtCBYsL84=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24630.21527.991285.555074@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 13:26:47 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
In-Reply-To: <c7fe2872-626c-1bd9-02f2-572ce81eabbe@suse.com>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
	<24623.56913.290437.499946@mariner.uk.xensource.com>
	<ce93bd48-7ef3-cdb1-9429-ccd894895e9e@suse.com>
	<24630.20427.917602.787877@mariner.uk.xensource.com>
	<c7fe2872-626c-1bd9-02f2-572ce81eabbe@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
> On 24.02.2021 14:08, Ian Jackson wrote:
> > For 7, I remember what I think was an IRC conversation where someone
> > (you, I think) said you had examined the generated asm and it was
> > unchanged.
> 
> It was in email, and I've inspected only some example of the
> generated asm, not all instances. I would hope that was
> sufficient, but since I'm not entirely certain ...
> 
> > If I have remembered that correctly, then for 7 as well:
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> ... I'll better wait for explicit confirmation of this.

I think that's convincing enough.  Thank you.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

