Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2AB34A80F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:26:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101800.194931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmTT-0005a1-0a; Fri, 26 Mar 2021 13:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101800.194931; Fri, 26 Mar 2021 13:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmTS-0005Zc-Tf; Fri, 26 Mar 2021 13:26:02 +0000
Received: by outflank-mailman (input) for mailman id 101800;
 Fri, 26 Mar 2021 13:26:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmTQ-0005ZT-U3
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:26:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmTQ-0007Vm-QU
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:26:00 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmTQ-0007S7-PZ
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:26:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPmTE-0002e6-Sb; Fri, 26 Mar 2021 13:25:48 +0000
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
	bh=ZNCwX/5eqAaSOqbirF/Tz8VKnGwDM0yJfoPB2++kuhA=; b=D6Qm/QQXs1AaQYp/gkrjoN0usT
	b2w00jPoH2OLYZ38sy1XxlBgPFP0cdotcOcu2M0Xjr3BwgRWJ8yeVB1E/1yM9osmNGMSCFjBVGur5
	+M7i/6K4y7jz4YYAxX22MbJDn4SJoSDCi+9J+AGMlOQ2Ra/ZdA7nA/LsEW4dwEu7Wamk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.57564.651716.509953@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 13:25:48 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
    andrew.cooper3@citrix.com,
    roger.pau@citrix.com,
    wl@xen.org,
    stephen.s.brennan@oracle.com,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH][4.15] Performance regression due to XSA-336
In-Reply-To: <0f14edcd-5ac7-0403-bccb-a97bf27bf392@suse.com>
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
	<e3657f74-5b62-fe59-3bbf-41df5fbe4593@suse.com>
	<24669.52030.995324.426028@mariner.uk.xensource.com>
	<0f14edcd-5ac7-0403-bccb-a97bf27bf392@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] Performance regression due to XSA-336"):
> On 26.03.2021 12:53, Ian Jackson wrote:
> > This amounts to a request to consider a release ack for "x86/vpt:
> > Replace per-guest pt_migrate lock with per pt lock".
> 
> Or, as already suggested by Roger, perhaps something simpler. First of
> all I wanted you to be aware.

Thank you, yes.  That is very helpful.

> > That patch fixes a regression due to XSA-336.  XSA-336 affected many
> > versions of Xen.  Therefore this is not a regression between 4.14 and
> > 4.15; rather it's a regresion from pre-XSA-336 to post-XSA-336.
> > 
> > I looked at the patch and I am really not comfortable with that kind
> > of change at this stage of the release.
> > 
> > So I'm afraid the answer is no, unless I have misunderstood something.
> 
> Understood.

I might consider "something simpler" but the bar is very high by now
and it seems unlikely to make the cut.

Thanks,
Ian.

