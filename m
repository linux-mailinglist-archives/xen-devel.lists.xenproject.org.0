Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34930F5FD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 16:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81343.150180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gOd-00057m-Rz; Thu, 04 Feb 2021 15:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81343.150180; Thu, 04 Feb 2021 15:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gOd-00057N-Oi; Thu, 04 Feb 2021 15:18:15 +0000
Received: by outflank-mailman (input) for mailman id 81343;
 Thu, 04 Feb 2021 15:18:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gOc-00057I-Ge
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:18:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gOc-0005OZ-Cr
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:18:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gOc-0008De-Bi
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:18:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7gOR-0008SE-Lf; Thu, 04 Feb 2021 15:18:03 +0000
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
	bh=IWL7miHS4vJFqkYtjwVAEOJTaAM4P+Rgpz5a4pEd5G0=; b=imMJbscAlOeD+Q9OsOxjGLvQ8d
	NKhDp0E45GDxWfA33sTFPc4My9wlZRIBvPHt/Koc2tlAsQNO7TIN3VWOaUyJxpNlsV65RLPeCWQU2
	+All5snyIpkj89awJl/zneGPGlJ9NnBZRfCl3OZbZUO4RfzQoBQeXP5dnZV6FL9+aOX0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24604.4139.379635.971242@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 15:18:03 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    Dario Faggioli <dfaggioli@suse.com>,
    Julien Grall <julien@xen.org>,
    community.manager@xenproject.org,
    committers@xenproject.org,
    xen-devel@lists.xenproject.org
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of significant
 bugs
In-Reply-To: <86412e13-ed57-8625-18be-38dd7022669e@suse.com>
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
	<24603.58528.901884.980466@mariner.uk.xensource.com>
	<86412e13-ed57-8625-18be-38dd7022669e@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [ANNOUNCE] Xen 4.15 - call for notification/status of significant bugs"):
> On 04.02.2021 13:12, Ian Jackson wrote:
> > OPEN ISSUES
> > -----------
...
> > I reviewed a thread about this and it is not clear to me where we are
> > with this.
> 
> I'm not sure Marek's "Xen crash after S3 suspend - Xen 4.13 and newer"
> falls in either of the two buckets.

I think this is not a regression. though ?  See my reply to Dario.
Unless it is worse in 4.15 than earlier releases I'm not inclined to
see it as a blocker.

> (since you're continuing with E. further down)
> 
> F. The almost-XSA "x86/PV: avoid speculation abuse through guest
> accessors" - the first 4 patches are needed to address the actual
> issue. The next 3 patches are needed to get the tree into
> consistent state again, identifier-wise. The remaining patches
> can probably wait.

Thanks.  I have made a note of this.

I have to allocate the letters or it'll be chaos :-).  I'm calling
this I.

Ian.

