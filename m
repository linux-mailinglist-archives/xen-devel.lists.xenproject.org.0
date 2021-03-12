Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CCD338F4D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 15:00:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97137.184353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiKK-0005qc-Aq; Fri, 12 Mar 2021 13:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97137.184353; Fri, 12 Mar 2021 13:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiKK-0005qD-79; Fri, 12 Mar 2021 13:59:40 +0000
Received: by outflank-mailman (input) for mailman id 97137;
 Fri, 12 Mar 2021 13:59:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiKI-0005q8-SM
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:59:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiKI-0000jd-Pe
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:59:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiKI-0008Iq-Jt
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:59:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKiKD-000424-UA; Fri, 12 Mar 2021 13:59:33 +0000
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
	bh=1SgGOQ/W1OX3cIf6c9ejXss53ACGDutvhvid4ZSnvxk=; b=gmUswn/ssK+T9cMUX+87hofX9g
	miLRdf4SMHUMsUGb05ISwL6BqlEumv/h1qudwGjQMywkCj2BOWJmmKpjXPxKlCmjjt6Vzl7NdJTJJ
	lElUkEJwCotRBaz1/W5EOELBlT4s4MrXK5/Q1lGpZMhT6X5rdsanh9xntV7vByV3f1HA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.29637.673344.425436@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 13:59:33 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    committers@xenproject.org
Subject: Re: [PATCH v4 0/2][4.15] x86: guest MSR access handling tweaks [and 1 more messages]
In-Reply-To: <9c2e5e0e-041f-03e3-3c08-7abcc82d63c7@suse.com>,
	<7504b027-f106-33e1-214a-eecf8ea5ff5d@citrix.com>
References: <7a84bc56-0045-2111-6888-8db830335ad1@suse.com>
	<90f87aa8-09da-1453-bd82-c722465c2881@suse.com>
	<7504b027-f106-33e1-214a-eecf8ea5ff5d@citrix.com>
	<9c2e5e0e-041f-03e3-3c08-7abcc82d63c7@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v4 0/2][4.15] x86: guest MSR access handling tweaks"):
> Largely to re-base patch 1.
> 
> 1: PV: conditionally avoid raising #GP for early guest MSR reads
> 2: AMD: expose HWCR.TscFreqSel to guests

Jan, thanks for the v4.  Roger, thanks for your reviews and for your
mail to committers@ (on Wednesday).

Andrew Cooper writes ("Re: [PATCH v3 1/2][4.15] x86/PV: conditionally avoid raising #GP for early guest MSR reads"):
> I am still of the firm belief that this is the wrong course of action.

Andrew, thanks for your clearly stated opinion.

It seems to me that, even having taken Andrew's strong objection into
account, Jan and Roger and I all still think this patch is the right
thing to do.

With my release manager hat on I would prefer not to spend any more
time debating this; and, the discussions do not seem to be producing
any new information.

I spoke to Jan on IRC and he confirmed that these patches are finished
on a detailed technical level - that is, there is no reason not to
commit these patches, except for the above objection to the whole
principle.

I therefore intend to commit both these two patches (v4) late this
afternoon, say 5pm UK time.  If anyone thinks that this would be
improper, or has a new reason I shouldn't go ahead, please let me know
ASAP.

Thanks,
Ian.

