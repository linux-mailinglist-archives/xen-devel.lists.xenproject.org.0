Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D120F7CEA04
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 23:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618777.962862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtE8G-0001ew-Oo; Wed, 18 Oct 2023 21:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618777.962862; Wed, 18 Oct 2023 21:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtE8G-0001cf-ME; Wed, 18 Oct 2023 21:31:12 +0000
Received: by outflank-mailman (input) for mailman id 618777;
 Wed, 18 Oct 2023 21:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UegX=GA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtE8E-0001cX-VO
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 21:31:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4978ab3-6dfd-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 23:31:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B108B61913;
 Wed, 18 Oct 2023 21:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE75C433C8;
 Wed, 18 Oct 2023 21:31:03 +0000 (UTC)
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
X-Inumbo-ID: a4978ab3-6dfd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697664664;
	bh=Tcrt9UaD9foHfBbXD3JjKAml/N4h4zdhfLvPd3jPAww=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=umcsGkPbXII4Wi4rMraA+Yn6ay1X7rbiWn0Uz7A46Zc+fNC8aL4DGi2M17VsqNpxn
	 vndUv99Ck/fvcCEqTW2RtIsyDZ7aB8NFUc+h9wzl1oXa3jmuaTQxcd3i34IcBmHtFc
	 gpTSOPsF56IrmYSl+IzNobK4x4pKBIqljpnhmndfd7MBnavPxz0sMFjuW4FiIoXWwA
	 FO7zusKTlvV7XAufTV+q3i+eJcbcr7WhkduQX9xYCWSnZBVBsjtSxfpMYJNNEol0q7
	 ib7hh6Dy5MbmM4p718wzsn9QZxnllyugA5Qmyh/uQY8gZY4v+aQWGLDmxBHOVHKjzV
	 q+Qg50lIgpvHA==
Date: Wed, 18 Oct 2023 14:31:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <george.dunlap@cloud.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, jgross@suse.com, 
    julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
In-Reply-To: <55f70f98-4a84-401c-f9a4-3cb50ca1418c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310181430550.965337@ubuntu-linux-20-04-desktop>
References: <20231013230624.1007969-1-sstabellini@kernel.org> <55f70f98-4a84-401c-f9a4-3cb50ca1418c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Oct 2023, Jan Beulich wrote:
> 
> On 14.10.2023 01:06, Stefano Stabellini wrote:
> > From: George Dunlap <george.dunlap@cloud.com>
> > 
> > Commit fc2b57c9a ("xenstored: send an evtchn notification on
> > introduce_domain") introduced the sending of an event channel to the
> > guest when first introduced, so that dom0less domains waiting for the
> > connection would know that xenstore was ready to use.
> > 
> > Unfortunately, it was introduced in introduce_domain(), which 1) is
> > called by other functions, where such functionality is unneeded, and
> > 2) after the main XS_INTRODUCE call, calls domain_conn_reset().  This
> > introduces a race condition, whereby if xenstored is delayed, a domain
> > can wake up, send messages to the buffer, only to have them deleted by
> > xenstore before finishing its processing of the XS_INTRODUCE message.
> > 
> > Move the connect-and-notfy call into do_introduce() instead, after the
> > domain_conn_rest(); predicated on the state being in the
> > XENSTORE_RECONNECT state.
> > 
> > (We don't need to check for "restoring", since that value is always
> > passed as "false" from do_domain_introduce()).
> > 
> > Also take the opportunity to add a missing wmb barrier after resetting
> > the indexes of the ring in domain_conn_reset.
> > 
> > This change will also remove an extra event channel notification for
> > dom0 (because the notification is now done by do_introduce which is not
> > called for dom0.) The extra dom0 event channel notification was only
> > introduced by fc2b57c9a and was never present before. It is not needed
> > because dom0 is the one to tell xenstored the connection parameters, so
> > dom0 has to know that the ring page is setup correctly by the time
> > xenstored starts looking at it. It is dom0 that performs the ring page
> > init.
> > 
> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Should this have had a Fixes: tag thus marking it to pick up for
> backport?

Sorry this was committed already

