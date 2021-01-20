Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918522FD384
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71552.128198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FAn-0004I0-41; Wed, 20 Jan 2021 15:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71552.128198; Wed, 20 Jan 2021 15:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FAn-0004Hb-0M; Wed, 20 Jan 2021 15:13:29 +0000
Received: by outflank-mailman (input) for mailman id 71552;
 Wed, 20 Jan 2021 15:13:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FAl-0004HW-Iz
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:13:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FAl-00035L-IA
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:13:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FAl-0002jf-Ge
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:13:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2FAg-0006E3-R4; Wed, 20 Jan 2021 15:13:22 +0000
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
	bh=1q8aISVIUb6CDFir26qNx0hqwSWhNflHnyQlgIox0L4=; b=0+imwsdN3xgPwWydwbF53+5irO
	BKU87s8teqLV41e6tVt2T/Q1UHadFzCKakJ46bph3F+rJIZ0a2B80lxCwKAbfDr1E++pT1/0Jy5yB
	pfMcn7Gl7wK60QgWigdIXvem/S/Zp02XteclboC7oZF98ml92VXu3y0jTyNEnPfIby54=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24584.18578.623201.789017@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 15:13:22 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
In-Reply-To: <20210104102037.GA2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
	<20201214163623.2127-6-bouyer@netbsd.org>
	<20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
	<20210104102037.GA2005@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH 05/24] Introduce locking functions for block device setup on NetBSD"):
> On Tue, Dec 29, 2020 at 12:29:09PM +0100, Roger Pau Monné wrote:
> > I think you want tot CC the tools dev on this one, specially Ian who
> > knows how the Linux one is implemented and can likely give valuable
> > input.
...
> > Seeing the file itself, I don't think there's any NetBSD specific
> > stuff, so we might want to consider putting it in BSD/ instead, so it
> > can be used by FreeBSD also?
> 
> I'm not sure if FreeBSD needs the locking stuff.
> Also, there are certainly differences in block device handling between
> FreeBSD and NetBSD. Both OSes have diverged in this area.

I think most operating systems will want some kind of locking here.

I loooked at the code in the new tools/hotplug/NetBSD/locking.sh.
Unfortunately this area is complex and the available APIs and tools
are awkard, and the field is troubled by broken "traditional"
approaches involving O_EXCL or the moral equivalent, which cannot be
made reliable (if you think reliability implies never being broken due
to stale lock).

I doubt that the code in this patch is correct.  It uses shlock(1)
which is based on link(2) and kill(2) and so on, which I think is
basically an O_EXCL-based approach as I discuss above.  (I don't have
a formal proof of this contention.)  The presence of an invocation of
the "trap" shell builtin in the new NetBSD script is a bad sign - a
reliable locking protocol would need that.

I see from https://man.netbsd.org that NetBSD has flock(1) and
stat(1).  I think this means we could reuse the code in
tools/hotplug/Linux/locking.sh.  Maybe it will need to be lightly
adapted, to NetBSD's flock(1) and stat(1).  Perhaps via some kind of
substitution to avoid all the clone-and-hack.

Regards,
Ian.

