Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255204C87D2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 10:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281038.479197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOymC-0006fo-Ck; Tue, 01 Mar 2022 09:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281038.479197; Tue, 01 Mar 2022 09:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOymC-0006dA-97; Tue, 01 Mar 2022 09:26:36 +0000
Received: by outflank-mailman (input) for mailman id 281038;
 Tue, 01 Mar 2022 09:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qMbA=TM=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1nOymB-0006d4-03
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 09:26:35 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adb1f189-9941-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 10:26:31 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>)
 id 1nOym6-0004XZ-Fu; Tue, 01 Mar 2022 09:26:30 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 93C972EE61E;
 Tue,  1 Mar 2022 09:26:29 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id q1W6nSALjIFN; Tue,  1 Mar 2022 09:26:29 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id 7B8602EE61B;
 Tue,  1 Mar 2022 09:26:29 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 76ECC982; Tue,  1 Mar 2022 09:26:29 +0000 (GMT)
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
X-Inumbo-ID: adb1f189-9941-11ec-8539-5f4723681683
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Tue, 1 Mar 2022 09:26:29 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [RFC] kernel: xenfs parameter to hide deprecated files
Message-ID: <20220301092629.GA3180808@dingwall.me.uk>
References: <20220223180859.GA1412216@dingwall.me.uk>
 <d89c0991-b437-31c3-8432-281c3fa24c41@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d89c0991-b437-31c3-8432-281c3fa24c41@suse.com>
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi Juergen,

On Fri, Feb 25, 2022 at 03:09:05PM +0100, Juergen Gross wrote:
> On 23.02.22 19:08, James Dingwall wrote:
> > Hi,
> > 
> > I have been investigating a very intermittent issue we have with xenstore
> > access hanging.  Typically it seems to happen when all domains are stopped
> > prior to a system reboot.  xenstore is running in a stubdom and using the
> > hypervisor debug keys indicates the domain is still there.
> 
> Could it be dom0 shutdown handling is unloading some modules which are
> needed for Xenstore communication? E.g. xen-evtchn?
> 
> > 
> > I have come across some old list threads which suggested access via
> > /proc/xen/xenbus could cause problems but it seems patches went in to the
> > kernel for 4.10.  However to eliminate this entirely as a possibility
> > I came up with this kernel patch to hide deprecated entries in xenfs.
> 
> I don't see how this patch could help.
> 
> libxenstore is using /dev/xen/xenbus if it is available. So the only
> case where your patch would avoid accessing /proc/xen/xenbus would be
> if /dev/xen/xenbus isn't there. But this wouldn't make Xenstore more
> reactive, I guess. ;-)
> 
> > I found this old thread for a similar change where the entries were made
> > conditional on kernel config options instead of a module parameter but
> > this was never merged.
> > 
> > https://lkml.org/lkml/2015/11/30/761
> > 
> > If this would be a useful feature I would welcome feedback.
> 
> I'm not sure how helpful it is to let the user specify a boot parameter
> for hiding the files. It will probably not get used a lot.

Thank you for taking the time to look this over.  I did suspect it might
not be relevant for most people.  I'll keep it in our build for now to
see if we improve our xenstore stability.

Thank you also for your suggestions about why we might be having a xenstore
problem.  Next time we encounter that I'll check the status of the loaded
modules.

Regards,
James

