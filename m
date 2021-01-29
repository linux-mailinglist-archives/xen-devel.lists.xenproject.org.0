Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53793089A1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 15:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78204.142174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VD6-00057C-EJ; Fri, 29 Jan 2021 14:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78204.142174; Fri, 29 Jan 2021 14:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5VD6-00056m-Ak; Fri, 29 Jan 2021 14:57:20 +0000
Received: by outflank-mailman (input) for mailman id 78204;
 Fri, 29 Jan 2021 14:57:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5VD5-00056c-5I
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:57:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5VD5-00080b-4T
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:57:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5VD5-0006Pw-3c
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:57:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l5VCx-0007f3-CJ; Fri, 29 Jan 2021 14:57:11 +0000
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
	bh=bY/ez2ezxcfQ9D2+VYLFaaSgEW6zwIapiJ28nVCVvd8=; b=KjFX4tI7NLLwaNpZiHkBYxfPKh
	wQbQhVyt3Bc5zEMMVLtpUk4GJqRyq5Fjg3v75F95h5jUhvCnL/SmqPod4CFr3EiBkt/Q5fe+fn1IT
	2y6PpL0y7DsdjOfrLBL4/9VrFYggciRB7U4lW8dI0d6YdFhTNN/9Mr8h2XvBPXfsmHjM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24596.8775.137437.842312@mariner.uk.xensource.com>
Date: Fri, 29 Jan 2021 14:57:11 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pvh: pass module command line to dom0
In-Reply-To: <YBPZ9iNdMogwTMl9@Air-de-Roger>
References: <20210129090551.15608-1-roger.pau@citrix.com>
	<e41a9832-e5e8-f56d-a0d9-636bf4dfe7ed@suse.com>
	<YBPZ9iNdMogwTMl9@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH] x86/pvh: pass module command line to dom0"):
> On Fri, Jan 29, 2021 at 10:26:31AM +0100, Jan Beulich wrote:
> > On 29.01.2021 10:05, Roger Pau Monne wrote:
> > > Both the multiboot and the HVM start info structures allow passing a
> > > string together with a module. Implement the missing support in
> > > pvh_load_kernel so that module strings found in the multiboot
> > > structure are forwarded to dom0.
> > > 
> > > Fixes: 62ba982424 ('x86: parse Dom0 kernel for PVHv2')
> > 
> > This really is relevant only when it's not an initrd which gets
> > passed as module, I suppose? I'm not fully convinced I'd call
> > this a bug then, but perhaps more a missing feature. Which in
> > turn means I'm not sure about the change's disposition wrt 4.15.
> > Cc-ing Ian.
> 
> Right, the whole kernel loading stuff is IMO not the best one, because
> all the multiboot modules apart from Xen and the dom0 kernel (the
> first 2) should be passed to the dom0 IMO using the HVM start_info
> structure.
> 
> The module command line is just a red herring, as none of the OSes
> that currently have PVH dom0 support need this, but still would be
> nice to get it fixed so that if new OSes are added it works properly.
> It's unexpected that a loader can append a string to a module, but
> then the dom0 kernel finds none in the start_info module list.
> 
> Regarding 4.15 acceptance: I think this is very low risk, as it
> exclusively touches PVH dom0 code which is experimental anyway, but
> I'm not going to insist on it getting committed.

Thanks for the explanation.  I'm not sure from reading this, whether
this is a bugfix, but your analysis is convincing, so:

Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

