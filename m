Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMKXFAvKemlc+gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 03:46:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061DAB3E9
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 03:46:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216059.1526048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlI38-0001I1-C2; Thu, 29 Jan 2026 02:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216059.1526048; Thu, 29 Jan 2026 02:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlI38-0001F8-8o; Thu, 29 Jan 2026 02:46:26 +0000
Received: by outflank-mailman (input) for mailman id 1216059;
 Thu, 29 Jan 2026 02:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlI36-0001F2-9q
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 02:46:24 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1b36600-fcbc-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 03:46:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 259B26001A;
 Thu, 29 Jan 2026 02:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6734AC4CEF1;
 Thu, 29 Jan 2026 02:46:19 +0000 (UTC)
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
X-Inumbo-ID: b1b36600-fcbc-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769654780;
	bh=Dc5kNbxwbRhIoRgfSkMzcV9NzijyyZX2PX+kv9hY7xg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sLWpr83+Mp4JltWazzYFSU6tXRwPhAZO6YVN2Dz0Sm0llbTjlpgNrwJCArV691rb/
	 Ge0xV5ZGf6EQIHKCOqDGO9O2tTV+8H90X+xaYL5NMXozW7vYgVtQYQW+W7mmMdKgNF
	 CsK41PUryLKAkk/1fk+8ADE4ZPZ8vaWff81VGa9Dv4U+YLGiUiYzSFwvusKRoZb6Go
	 9Dwz908IaQKQ9hcwsm59Ap25D2P9Vo9VHUVmGhoKwGXrz0712NJOrm4blWLXjw4QtU
	 mdmfYOvl14diln9GIXxcfMey7DiMmNaCWiuDzBjEcrn6QlUGvuhPv9d3RwUH72HhUq
	 5vqJRP50HzIaQ==
Date: Wed, 28 Jan 2026 18:46:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    grygorii_strashko@epam.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/2] xen: enable dom0less guests to use console_io
 hypercalls
In-Reply-To: <alpine.DEB.2.22.394.2601281823460.2238666@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2601281844370.2238666@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop> <20260123010640.1194863-2-stefano.stabellini@amd.com> <91c71a0c-4345-4fae-912b-ae7c9d2160e7@suse.com> <alpine.DEB.2.22.394.2601281823460.2238666@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:jbeulich@suse.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0061DAB3E9
X-Rspamd-Action: no action

On Wed, 28 Jan 2026, Stefano Stabellini wrote:
> On Wed, 28 Jan 2026, Jan Beulich wrote:
> > On 23.01.2026 02:06, Stefano Stabellini wrote:
> > > --- a/xen/common/device-tree/dom0less-build.c
> > > +++ b/xen/common/device-tree/dom0less-build.c
> > > @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
> > >  
> > >      rangeset_destroy(kinfo->xen_reg_assigned);
> > >  
> > > +    d->console->input_allowed = true;
> > 
> > Why for all of the domains? Shouldn't this be a per-domain setting?
> 
> For all dom0less domains. No, I don't think it should be a per-domain
> setting. If you are running dom0less you only have two options: this
> one, or vuart and both of them work the same way and require
> input_allowed = true.
> 
> 
> > > --- a/xen/drivers/char/console.c
> > > +++ b/xen/drivers/char/console.c
> > > @@ -612,10 +612,18 @@ static void __serial_rx(char c)
> > >      if ( !d )
> > >          return;
> > >  
> > > -    if ( is_hardware_domain(d) )
> > 
> > This check is fully lost; shouldn't it be replaced by ...
> > 
> > > +#ifdef CONFIG_SBSA_VUART_CONSOLE
> > > +    /* Prioritize vpl011 if enabled for this domain */
> > > +    if ( d->arch.vpl011.base_addr )
> > > +    {
> > > +        /* Deliver input to the emulated UART. */
> > > +        rc = vpl011_rx_char_xen(d, c);
> > > +    }
> > > +    else
> > > +#endif
> > 
> > ...
> > 
> >     if ( d->input_allowed )
> > 
> > the latest here (not sure about the vpl011 intentions in this regard)?
> 
> No because vuart has already input_allowed

Sorry, let me rephrase this. You are right we need a d->input_allowed
check. The check is already done as part of 

    d = console_get_domain();
    if ( !d )
        return;

