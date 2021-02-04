Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B3230F291
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 12:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81273.149892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7d1v-0006UX-3x; Thu, 04 Feb 2021 11:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81273.149892; Thu, 04 Feb 2021 11:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7d1v-0006UB-0j; Thu, 04 Feb 2021 11:42:35 +0000
Received: by outflank-mailman (input) for mailman id 81273;
 Thu, 04 Feb 2021 11:42:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7d1t-0006U6-N5
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:42:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7d1t-0001jG-JN
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:42:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7d1t-0005e2-HD
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:42:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7d1o-0007rA-RG; Thu, 04 Feb 2021 11:42:28 +0000
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
	bh=wTb0x+haIpQbBS2CGlCcsDtnKAQ/Shm7LIjVkD0CXjg=; b=RLA6PceSWq2HLt4WUBCV6s1Gg2
	BtOpzlc/4oI7S0idg7sRph2qefETFzOV9KelENHboqGhiZMk9CSkmNeivZBjYYDV9e2Gw+id1IGiy
	AOKopJo5gqtc9wK07x2oWzeFakM0PpKWgo+/+6VcaHROQ5b3cqNaYzMtHpPEK4xl105Y=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24603.56740.581223.845809@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 11:42:28 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xenstored: close socket connections on error
In-Reply-To: <20210204111613.GA2316@antioche.eu.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
	<20210203165421.1550-2-bouyer@netbsd.org>
	<55faec4f-71e3-71c3-e251-74238bb74c11@suse.com>
	<20210204111613.GA2316@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH] xenstored: close socket connections on error"):
> On Thu, Feb 04, 2021 at 12:11:02PM +0100, Jürgen Groß wrote:
> > On 03.02.21 17:54, Manuel Bouyer wrote:
> > > On error, don't keep socket connection in ignored state but close them.
> > > When the remote end of a socket is closed, xenstored will flag it as an
> > > error and switch the connection to ignored. But on some OSes (e.g.
> > > NetBSD), poll(2) will return only POLLIN in this case, so sockets in ignored
> > > state will stay open forever in xenstored (and it will loop with CPU 100%
> > > busy).
> > > 
> > > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > > Fixes: d2fa370d3ef9cbe22d7256c608671cdcdf6e0083
> > 
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> thanks.
> I still don't know if I'm supposed to send a new version of the patch with
> these tags, even if the patch itself doesn't change, or if the commiter
> will handle them ?

The committer will handle them.

Thanks,
Ian.

