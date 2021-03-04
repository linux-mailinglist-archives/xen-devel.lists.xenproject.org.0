Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63632D664
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 16:21:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93332.176195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpmJ-0004T9-RM; Thu, 04 Mar 2021 15:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93332.176195; Thu, 04 Mar 2021 15:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpmJ-0004Sj-N3; Thu, 04 Mar 2021 15:20:39 +0000
Received: by outflank-mailman (input) for mailman id 93332;
 Thu, 04 Mar 2021 15:20:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpmI-0004Se-43
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 15:20:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpmH-0005gw-VO
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 15:20:37 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHpmH-0007ml-Se
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 15:20:37 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHpmE-0005cl-MT; Thu, 04 Mar 2021 15:20:34 +0000
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
	bh=9x18qLadbxkQpIoQsoR+n91O/1aBxffFpXjJUt3fBMQ=; b=VGEH90BJDdM4enpv0Ljp/R5DuB
	1aqUkmHJKrAIzOn+td44M51ukgWt49zWviisiY0UZvDUauuVckAC88roiQl05hDhBLiT1dP3iukkz
	FFpXjiJfWmBzux+V1VmGjjGS9KKUmBSyfJpHWJas2zzt+pfSVrqdI7i4HOjX+pMFpRow=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24640.64194.445736.52546@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 15:20:34 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Kevin  Tian <kevin.tian@intel.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
In-Reply-To: <YED5Czp+v2xFSCOG@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
	<24640.62938.427877.757656@mariner.uk.xensource.com>
	<YED5Czp+v2xFSCOG@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior"):
> On Thu, Mar 04, 2021 at 02:59:38PM +0000, Ian Jackson wrote:
> > I think it's almost as bad to have guests which can be migrated in,
> > but which then cannot reboot.
> 
> Ups, yes, right.
> 
> > Historically we have taken the view that new Xen must support old
> > guests, even if that means being bug-compatible.  So I am strongly in
> > favour of avoiding such a usability regression.
> 
> I'm not a xl/libxl expert, but couldn't we set the option in a
> persistent way for migrated-in guests?
> 
> IIRC at domain creation libxl knows whether it's a restore or a fresh
> domain, and hence we could set the option there?
> 
> The part I'm not sure is about how to make it persistent.

The guest could be stopped with xl shutdown and then recrated with xl
create, from the config file.  I don't think we want to break that use
case here either.

Ian.

