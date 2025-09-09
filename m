Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B3B50866
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 23:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117394.1463511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw6HM-0004QA-Tr; Tue, 09 Sep 2025 21:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117394.1463511; Tue, 09 Sep 2025 21:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw6HM-0004O0-R2; Tue, 09 Sep 2025 21:53:32 +0000
Received: by outflank-mailman (input) for mailman id 1117394;
 Tue, 09 Sep 2025 21:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aO0K=3U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uw6HM-0004Nu-Dn
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 21:53:32 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bc75502-8dc7-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 23:53:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DE5EE601F0;
 Tue,  9 Sep 2025 21:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CDAC4CEF4;
 Tue,  9 Sep 2025 21:53:26 +0000 (UTC)
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
X-Inumbo-ID: 6bc75502-8dc7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757454808;
	bh=Gp2h0aHZdyJJi7aWjXmP1HYFmqQ+auLloFtCPtROtFE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CDmyhDkF//HdvC6rGzi2zPb/oh1ITMFvamETcelOXuLHgozGgEK71kQ02dnsAu1wD
	 DoYPcgppYesE6YEcDgTthuwTV1NouC0Tiw7aGRElj9wsuIAnZ28qW3uaX+lrbho0KN
	 9p0BzTEMw/QvV6tmy0cFAyEctKVA1mmpGgEl2j+LYQ+4ERdkmKjZvCcH1+q4arJRWQ
	 jLT1X67gytt8BVk8EBbU0UHzkpVnoJnZ64mTvwl3vtwqI8kzlzb/3IsLIpL2iMxzTC
	 9D3NjGN1rQSNl64XPps3CfpdWlQs6PR6pJ+7wpe22At1u7wEpUrfV8wH46lAHZGCW0
	 QquV29Z3mDcXg==
Date: Tue, 9 Sep 2025 14:53:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Doug Goldstein <cardoe@cardoe.com>, Victor Lira <victorm.lira@amd.com>, 
    Samuel Thibault <samuel.thibault@ens-lyon.org>, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.21 0/5] CI: Add Debian Trixie
In-Reply-To: <aMAUJehaWkYyyM-E@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2509091452200.1405870@ubuntu-linux-20-04-desktop>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com> <aMAUJehaWkYyyM-E@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1658336827-1757454809=:1405870"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1658336827-1757454809=:1405870
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 9 Sep 2025, Marek Marczykowski-Górecki wrote:
> On Sat, Aug 09, 2025 at 11:12:01PM +0100, Andrew Cooper wrote:
> > I know it's past the last-post deadline, but Trixie was only released today.
> > 
> > In terms of backports, we should at least go back to the bugfix branches.
> 
> What is the state of this series? I'm preparing refresh of my various CI
> series and some add more jobs on debian-12 - I wonder if I should make
> them debian-13 already - but for this I need this series committed...

I have been too busy reviewing the non-gitlab patch series for the
feature freeze last Friday and we have a couple of series still to
process.

Maybe gitlab-related series could be committed also past the feature
freeze.
--8323329-1658336827-1757454809=:1405870--

