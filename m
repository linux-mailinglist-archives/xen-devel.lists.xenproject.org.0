Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77834A6A4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 12:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101727.194717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPl2C-00028T-HH; Fri, 26 Mar 2021 11:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101727.194717; Fri, 26 Mar 2021 11:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPl2C-000283-E4; Fri, 26 Mar 2021 11:53:48 +0000
Received: by outflank-mailman (input) for mailman id 101727;
 Fri, 26 Mar 2021 11:53:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPl2A-00027y-Tc
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:53:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPl2A-0005tn-Pf
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:53:46 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPl2A-0008JN-Oq
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:53:46 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPl1z-0002K3-6Q; Fri, 26 Mar 2021 11:53:35 +0000
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
	bh=c5aNGwLinAeVYu9H8GNs+QPI3/kTyPAs2J8h1C8Rb1E=; b=AGkave4JlrKttIvwr/y0YS5Vfr
	tQC8HhvN3MgxCGx7JhGroyHfNUwsyPbOYz1Kx4O/7zyptA8xLFA5G9E7SDX46V6yITneE34ayjeJ3
	A+fyIIL3gLHvJC9su06j2hNMXqcomgGK+Ogp5Zloow4DtuMWePq4fo4ruw1YSjwz2BTo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.52030.995324.426028@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 11:53:34 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
    andrew.cooper3@citrix.com,
    roger.pau@citrix.com,
    wl@xen.org,
    stephen.s.brennan@oracle.com,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH][4.15] Performance regression due to XSA-336
In-Reply-To: <e3657f74-5b62-fe59-3bbf-41df5fbe4593@suse.com>
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
	<e3657f74-5b62-fe59-3bbf-41df5fbe4593@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] Performance regression due to XSA-336"):
> While the change is more intrusive than one would like at this point, an
> up-to-40% regression imo makes this at least a change to be considered
> for 4.15. I will admit though that before next week I won't get around
> to look at this in any more detail than just having read through this
> cover letter. But perhaps someone else might find time earlier.

As I understand it:

This amounts to a request to consider a release ack for "x86/vpt:
Replace per-guest pt_migrate lock with per pt lock".

That patch fixes a regression due to XSA-336.  XSA-336 affected many
versions of Xen.  Therefore this is not a regression between 4.14 and
4.15; rather it's a regresion from pre-XSA-336 to post-XSA-336.

I looked at the patch and I am really not comfortable with that kind
of change at this stage of the release.

So I'm afraid the answer is no, unless I have misunderstood something.

Regards,
Ian.

