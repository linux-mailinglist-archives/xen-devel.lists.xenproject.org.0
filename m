Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5547CFF3F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 18:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619516.964723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVgE-0007V0-Jb; Thu, 19 Oct 2023 16:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619516.964723; Thu, 19 Oct 2023 16:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVgE-0007S9-Ga; Thu, 19 Oct 2023 16:15:26 +0000
Received: by outflank-mailman (input) for mailman id 619516;
 Thu, 19 Oct 2023 16:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtVgD-0006kd-J9
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 16:15:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5c41d94-6e9a-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 18:15:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 81802B82AB5;
 Thu, 19 Oct 2023 16:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CABC433C9;
 Thu, 19 Oct 2023 16:15:22 +0000 (UTC)
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
X-Inumbo-ID: b5c41d94-6e9a-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697732123;
	bh=vB5VkfwPmSVghVj8mrg+kAqhnvfwS+dBOSgJzXw7e1o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N1vb+CX2T1nFMP8MWO5nINH0H9y8yiogQI0Up+R9AGCxEBhtrUPyZDvVOH9kJq1rX
	 j06tc8NCxWu2/bFf4j/KBewqHR8gjcfnlQnkaAi8Dpr2wzaOHaD7A9FMQprA4+dkCY
	 t6WgKa14HlHZ4hE2Wo1SqbsazkghswwqU93RdXlU0pw86Y6RSKUsOb2zsNgUCqD4Ke
	 QR43fmQOCh0ezuTVcuwXEMaDwfVm35cZam8RICF7CVC6kHnCGd6Poh+vNtm0sPz8zs
	 Fovxo9Gi3k/vSL0cf+Hqu4Hc7TSGEsTZz0B1vxEb0VguStL1sop2cO//60klTUE72j
	 1pyMLeN400EjA==
Date: Thu, 19 Oct 2023 09:15:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <george.dunlap@cloud.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, jgross@suse.com, 
    julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
In-Reply-To: <30394e20-04cd-9978-f9fb-575148f87104@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310190914570.1945130@ubuntu-linux-20-04-desktop>
References: <20231013230624.1007969-1-sstabellini@kernel.org> <55f70f98-4a84-401c-f9a4-3cb50ca1418c@suse.com> <alpine.DEB.2.22.394.2310181430550.965337@ubuntu-linux-20-04-desktop> <30394e20-04cd-9978-f9fb-575148f87104@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Jan Beulich wrote:
> On 18.10.2023 23:31, Stefano Stabellini wrote:
> > On Wed, 17 Oct 2023, Jan Beulich wrote:
> >>
> >> On 14.10.2023 01:06, Stefano Stabellini wrote:
> >>> From: George Dunlap <george.dunlap@cloud.com>
> >>>
> >>> Commit fc2b57c9a ("xenstored: send an evtchn notification on
> >>> introduce_domain") introduced the sending of an event channel to the
> >>> guest when first introduced, so that dom0less domains waiting for the
> >>> connection would know that xenstore was ready to use.
> >>>
> >>> Unfortunately, it was introduced in introduce_domain(), which 1) is
> >>> called by other functions, where such functionality is unneeded, and
> >>> 2) after the main XS_INTRODUCE call, calls domain_conn_reset().  This
> >>> introduces a race condition, whereby if xenstored is delayed, a domain
> >>> can wake up, send messages to the buffer, only to have them deleted by
> >>> xenstore before finishing its processing of the XS_INTRODUCE message.
> >>>
> >>> Move the connect-and-notfy call into do_introduce() instead, after the
> >>> domain_conn_rest(); predicated on the state being in the
> >>> XENSTORE_RECONNECT state.
> >>>
> >>> (We don't need to check for "restoring", since that value is always
> >>> passed as "false" from do_domain_introduce()).
> >>>
> >>> Also take the opportunity to add a missing wmb barrier after resetting
> >>> the indexes of the ring in domain_conn_reset.
> >>>
> >>> This change will also remove an extra event channel notification for
> >>> dom0 (because the notification is now done by do_introduce which is not
> >>> called for dom0.) The extra dom0 event channel notification was only
> >>> introduced by fc2b57c9a and was never present before. It is not needed
> >>> because dom0 is the one to tell xenstored the connection parameters, so
> >>> dom0 has to know that the ring page is setup correctly by the time
> >>> xenstored starts looking at it. It is dom0 that performs the ring page
> >>> init.
> >>>
> >>> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>
> >> Should this have had a Fixes: tag thus marking it to pick up for
> >> backport?
> > 
> > Sorry this was committed already
> 
> That's why I used "have had". I still need an answer to the question
> though; your reply only hints towards "yes".

Yes, I would add the Fixes tag

