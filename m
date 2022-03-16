Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FA4DAC2F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 09:02:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291074.493825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUOba-0006lL-LE; Wed, 16 Mar 2022 08:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291074.493825; Wed, 16 Mar 2022 08:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUOba-0006j6-Ge; Wed, 16 Mar 2022 08:02:02 +0000
Received: by outflank-mailman (input) for mailman id 291074;
 Wed, 16 Mar 2022 08:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JE7g=T3=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1nUObY-0006ix-A4
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 08:02:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a8ffdb7-a4ff-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 09:01:58 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA502B81A45;
 Wed, 16 Mar 2022 08:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA7CC340E9;
 Wed, 16 Mar 2022 08:01:54 +0000 (UTC)
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
X-Inumbo-ID: 5a8ffdb7-a4ff-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647417716;
	bh=iU61jj44HSCKXoyq/igNQoibZ+t/Lt8YMfNC/5DL6T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aA+aq++LOmveFW2VrKrCqVYitvDxX0WWx/fi4berY482hYJoNqX5S5xtTc3tXeaHR
	 BZvlr42Khb9uHGO3oD8t7f7l2mE6dFgbPjKfCi7N13cfimUErhkTdfdLMSo6usPTHR
	 ZqD0JkYPUmYntbrA6p8uiLW7P8b07kI9xkMKpV0g=
Date: Wed, 16 Mar 2022 09:01:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/usb: harden xen_hcd against malicious backends
Message-ID: <YjGZb9jihryp//RJ@kroah.com>
References: <20220311103509.12908-1-jgross@suse.com>
 <YjDPtRhdrtY6tpvc@kroah.com>
 <78b16b06-9cfe-5bfd-5d23-b7e8010024fd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78b16b06-9cfe-5bfd-5d23-b7e8010024fd@suse.com>

On Wed, Mar 16, 2022 at 06:29:00AM +0100, Juergen Gross wrote:
> On 15.03.22 18:41, Greg Kroah-Hartman wrote:
> > On Fri, Mar 11, 2022 at 11:35:09AM +0100, Juergen Gross wrote:
> > > Make sure a malicious backend can't cause any harm other than wrong
> > > I/O data.
> > > 
> > > Missing are verification of the request id in a response, sanitizing
> > > the reported actual I/O length, and protection against interrupt storms
> > > from the backend.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > ---
> > >   drivers/usb/host/xen-hcd.c | 57 ++++++++++++++++++++++++++++----------
> > >   1 file changed, 43 insertions(+), 14 deletions(-)
> > 
> > Fails to apply to my tree:
> > 
> > checking file drivers/usb/host/xen-hcd.c
> > Hunk #2 succeeded at 720 (offset -1 lines).
> > Hunk #3 succeeded at 807 (offset -3 lines).
> > Hunk #4 succeeded at 934 (offset -5 lines).
> > Hunk #5 FAILED at 986.
> > Hunk #6 succeeded at 1003 with fuzz 1 (offset -10 lines).
> > Hunk #7 succeeded at 1048 (offset -10 lines).
> > Hunk #8 succeeded at 1072 (offset -10 lines).
> > Hunk #9 succeeded at 1161 (offset -10 lines).
> > Hunk #10 succeeded at 1516 (offset -10 lines).
> > 1 out of 10 hunks FAILED
> > 
> > Any hints?
> 
> Rebase your tree to v5.17-rc8? It is missing the recent security
> patches which modified drivers/usb/host/xen-hcd.c.

I can't rebase, but I can merge.  I'll do that, thanks.

greg k-h

