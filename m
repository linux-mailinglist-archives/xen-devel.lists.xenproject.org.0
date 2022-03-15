Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D154DA176
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 18:41:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290910.493541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUBAh-0006kU-Pv; Tue, 15 Mar 2022 17:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290910.493541; Tue, 15 Mar 2022 17:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUBAh-0006i1-My; Tue, 15 Mar 2022 17:41:23 +0000
Received: by outflank-mailman (input) for mailman id 290910;
 Tue, 15 Mar 2022 17:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8Gi=T2=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1nUBAg-0006hv-Pp
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 17:41:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e9fb63c-a487-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 18:41:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 805A8615D9;
 Tue, 15 Mar 2022 17:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2B7C340E8;
 Tue, 15 Mar 2022 17:41:15 +0000 (UTC)
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
X-Inumbo-ID: 1e9fb63c-a487-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647366077;
	bh=EmukrZJTdPmX8L6VDOzfmJxS+zks3StStKzljU+KjtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vieN7aSfas4bwleZQHaaKc295kUVhZzTXvlvwVkk4vzdb7Wgna7FFSScJko73nmLs
	 8AvMlkMjJuD+XC6wp6kbCMKA5XWcYPdqvQp3rI6nRLi7VBwkLIpauQ06Nik/oDH9ol
	 XP+Ps48LyJwWQ7Kz6051771iMJwhU/gqzkoze/Qk=
Date: Tue, 15 Mar 2022 18:41:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/usb: harden xen_hcd against malicious backends
Message-ID: <YjDPtRhdrtY6tpvc@kroah.com>
References: <20220311103509.12908-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311103509.12908-1-jgross@suse.com>

On Fri, Mar 11, 2022 at 11:35:09AM +0100, Juergen Gross wrote:
> Make sure a malicious backend can't cause any harm other than wrong
> I/O data.
> 
> Missing are verification of the request id in a response, sanitizing
> the reported actual I/O length, and protection against interrupt storms
> from the backend.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  drivers/usb/host/xen-hcd.c | 57 ++++++++++++++++++++++++++++----------
>  1 file changed, 43 insertions(+), 14 deletions(-)

Fails to apply to my tree:

checking file drivers/usb/host/xen-hcd.c
Hunk #2 succeeded at 720 (offset -1 lines).
Hunk #3 succeeded at 807 (offset -3 lines).
Hunk #4 succeeded at 934 (offset -5 lines).
Hunk #5 FAILED at 986.
Hunk #6 succeeded at 1003 with fuzz 1 (offset -10 lines).
Hunk #7 succeeded at 1048 (offset -10 lines).
Hunk #8 succeeded at 1072 (offset -10 lines).
Hunk #9 succeeded at 1161 (offset -10 lines).
Hunk #10 succeeded at 1516 (offset -10 lines).
1 out of 10 hunks FAILED

Any hints?

thanks,

greg k-h

