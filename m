Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D6845027E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 11:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225756.389914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZB6-0000gb-NW; Mon, 15 Nov 2021 10:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225756.389914; Mon, 15 Nov 2021 10:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZB6-0000dZ-Jz; Mon, 15 Nov 2021 10:25:32 +0000
Received: by outflank-mailman (input) for mailman id 225756;
 Mon, 15 Nov 2021 10:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzfO=QC=weissschuh.net=linux@srs-se1.protection.inumbo.net>)
 id 1mmZB4-0000dT-SO
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 10:25:31 +0000
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aaddbbb-45fe-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 11:25:29 +0100 (CET)
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
X-Inumbo-ID: 5aaddbbb-45fe-11ec-9787-a32c541c8605
Date: Mon, 15 Nov 2021 11:25:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1636971925;
	bh=0/bxF+0Ja80KzNIjVBJ20sa/tzr9xnaAs4Q/VbC/BZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UN0gAAvgaQI1b1wSSFpd3xfR2Q8k8FZCdgDo1sUOprnBgHcFDizn1lOs+dsviAqA6
	 i74Z81po7P2w3MltQ9lJYqsazIw7CdcBsmS7BWicf5jvABgylnvaQYKs05q+czWtdT
	 tJCcX/CFYbJPseikFZ57Nlzl1pmHrp7lVPNhrNdE=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/privcmd: make option visible in Kconfig
Message-ID: <28809eae-ea8f-4f6b-b41a-a0895aec6e8c@t-8ch.de>
References: <20211113083821.71060-1-linux@weissschuh.net>
 <889cfabe-6262-d105-c806-105ee9377fef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <889cfabe-6262-d105-c806-105ee9377fef@suse.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6

On 2021-11-15 11:02+0100, Jan Beulich wrote:
> On 13.11.2021 09:38, Thomas Weißschuh wrote:
> > This configuration option provides a misc device as an API to userspace.
> > Make this API usable without having to select the module as a transitive
> > dependency.
> > 
> > This also fixes an issue where localyesconfig would select
> > CONFIG_XEN_PRIVCMD=m because it was not visible and defaulted to
> > building as module.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > 
> > ---
> > 
> > Note: If CONFIG_XEN_PRIVCMD really is only meant to be selected by
> > XENFS, then the issue can be fixed by removing its "default m"
> > definition.
> > ---
> >  drivers/xen/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> > index a1b11c62da9e..c14d8631b8f6 100644
> > --- a/drivers/xen/Kconfig
> > +++ b/drivers/xen/Kconfig
> > @@ -259,7 +259,7 @@ config XEN_SCSI_BACKEND
> >  	  if guests need generic access to SCSI devices.
> >  
> >  config XEN_PRIVCMD
> > -	tristate
> > +	tristate "Xen privileged domain-0 commands"
> >  	depends on XEN
> >  	default m
> 
> While I agree with adding a prompt here, I'm not sure why you've added
> "domain-0" to its wording. Aiui this interface is equally available in
> DomU-s, just that they would be able to only (successfully) use a more
> restricted set of hypercalls. Otherwise the XEN dependency would need
> to be changed to XEN_DOM0 at the same time as adding a prompt, or the
> prompt's visibility be restricted to XEN_DOM0.

I got it from comment at the top of privcmd.c.

To be honest I have no knowledge about Xen and only submitted this patch to get
rid of the spurious module in my localyesconfig.

I can try to find a better wording and submit a v2 but would also be happy if
somebody more knowledgeable about this module wrote a patch, which would
probably be easiest for everybody.

Thanks,
Thomas

