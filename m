Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F40232D1B4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 12:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93211.175904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHm6D-00042H-SY; Thu, 04 Mar 2021 11:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93211.175904; Thu, 04 Mar 2021 11:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHm6D-00041s-Ot; Thu, 04 Mar 2021 11:24:57 +0000
Received: by outflank-mailman (input) for mailman id 93211;
 Thu, 04 Mar 2021 11:24:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHm6B-00041n-TV
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:24:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHm6B-0001Of-Sk
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:24:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHm6B-0007Hs-S2
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:24:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHm5y-00050y-78; Thu, 04 Mar 2021 11:24:42 +0000
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
	bh=PcE0OBT03GbBGogYo4Yi9bdSbXqeF8kmUyHeV8im1GI=; b=u2NJsczXWqPLU03Pf/sTOHo9eL
	Cy4dOU5sO0GWxtZ0I6ia4Gv4OKDvdnDOdERuFTiKAgHSBXV9iQNwOGhjwxvQDOfW8XIayjs1b5kQ0
	IJdsuYM5qKLUG+AH5/IEeaGCIqyIWuMpEybw2GnpZegHVNv6WKBzka62x3XSKB4ntWxQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24640.50041.969590.549237@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 11:24:41 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Kevin Tian <kevin.tian@intel.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR
 behavior selection
In-Reply-To: <7e9ac991-f575-aa92-5fd8-33c8193cad67@suse.com>
References: <20210301162357.76527-1-roger.pau@citrix.com>
	<bfd185bf-489f-d858-c459-7630cbe7b462@suse.com>
	<YD5TBSwZWzjlwGxD@Air-de-Roger>
	<62be2084-e5fa-e439-8426-6d129a10c379@suse.com>
	<YD+teWWbeu0XDhqm@Air-de-Roger>
	<e84e84f6-8bc3-6a62-53f7-bf309fafa436@suse.com>
	<YECw+LsG17x8Jxev@Air-de-Roger>
	<7e9ac991-f575-aa92-5fd8-33c8193cad67@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR behavior selection"):
> On 04.03.2021 11:05, Roger Pau Monné wrote:
...
> > This one seems like a fine candidate to implement in
> > svm_msr_read_intercept, because Xen needs to return a specific value
> > for this MSR.
> > 
> > Regarding the global approach to fixing the fallout from the MSR
> > policy change, I don't see why we couldn't do a mix between pro-active
> > and reactive.
> > 
> > I think we must have an option to fallback to something similar to the
> > old policy for HVM guests so that users have a way to get their guests
> > running after an update without requiring a code change.
> > 
> > That doesn't mean we can't reactively add the missing MSRs as we go
> > discovering them. I would even print a warning when using such
> > fallback legacy MSR handling option that you need to report the issue
> > to xen-devel because the option might be removed in future releases.
> > 
> > Does the above seem like a sensible plan?
> 
> I think so, yes. I wonder what Andrew thinks, though.

FTR I am on board with this plan.  I would like to see quick progress
on this issue as it seems like one of the major risks in the release.

Thanks,
Ian.

