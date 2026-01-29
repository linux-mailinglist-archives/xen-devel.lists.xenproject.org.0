Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OfDIWLJemk7+gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 03:43:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6EEAB3AE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 03:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216037.1526027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlHzj-00009T-J3; Thu, 29 Jan 2026 02:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216037.1526027; Thu, 29 Jan 2026 02:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlHzj-00007t-F2; Thu, 29 Jan 2026 02:42:55 +0000
Received: by outflank-mailman (input) for mailman id 1216037;
 Thu, 29 Jan 2026 02:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+fBE=AC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlHzi-00007n-D9
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 02:42:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33f2eaeb-fcbc-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 03:42:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9430D60054;
 Thu, 29 Jan 2026 02:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D17C4CEF1;
 Thu, 29 Jan 2026 02:42:47 +0000 (UTC)
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
X-Inumbo-ID: 33f2eaeb-fcbc-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769654569;
	bh=WAi5BgVh2BpUxZlRop1qIplkxyvXAXUqVblVJqIdQG4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fGV42+wECr9y3+gljw7cdJUVmhk4RV8U+AvFZ6XsX4PRuKme8UkpwAi2j427gzwzv
	 8T617g3jac9qaqYODhvWWV+uJussAdlN/1oT2rl146ff29hkBKaySVxbG8ihGqfGmd
	 HqvVqVmJCByq2t3K4m6Aqqzp5oVmHdZwHxMbK004cw65pNJq7rtZauHp1zSm+BVVGf
	 MOLXzz97Pny7XWb4EF4x8GyL7YMdUbGGLSkBiVIeWWD7y4+YOSuM93w3PFTLasYmo4
	 /DSNS/ysi7qpEHTLj/1O4bHu+Qi68Aey5ODiD+4E3q0S/qIA2qL8uG+OG/dTg/cKYs
	 +clwIVmQPSgQA==
Date: Wed, 28 Jan 2026 18:42:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    grygorii_strashko@epam.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/2] xen: enable dom0less guests to use console_io
 hypercalls
In-Reply-To: <91c71a0c-4345-4fae-912b-ae7c9d2160e7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2601281823460.2238666@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop> <20260123010640.1194863-2-stefano.stabellini@amd.com> <91c71a0c-4345-4fae-912b-ae7c9d2160e7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 2B6EEAB3AE
X-Rspamd-Action: no action

On Wed, 28 Jan 2026, Jan Beulich wrote:
> On 23.01.2026 02:06, Stefano Stabellini wrote:
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
> >  
> >      rangeset_destroy(kinfo->xen_reg_assigned);
> >  
> > +    d->console->input_allowed = true;
> 
> Why for all of the domains? Shouldn't this be a per-domain setting?

For all dom0less domains. No, I don't think it should be a per-domain
setting. If you are running dom0less you only have two options: this
one, or vuart and both of them work the same way and require
input_allowed = true.


> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -612,10 +612,18 @@ static void __serial_rx(char c)
> >      if ( !d )
> >          return;
> >  
> > -    if ( is_hardware_domain(d) )
> 
> This check is fully lost; shouldn't it be replaced by ...
> 
> > +#ifdef CONFIG_SBSA_VUART_CONSOLE
> > +    /* Prioritize vpl011 if enabled for this domain */
> > +    if ( d->arch.vpl011.base_addr )
> > +    {
> > +        /* Deliver input to the emulated UART. */
> > +        rc = vpl011_rx_char_xen(d, c);
> > +    }
> > +    else
> > +#endif
> 
> ...
> 
>     if ( d->input_allowed )
> 
> the latest here (not sure about the vpl011 intentions in this regard)?

No because vuart has already input_allowed


> >      {
> >          /*
> > -         * Deliver input to the hardware domain buffer, unless it is
> > +         * Deliver input to the focus domain buffer, unless it is
> >           * already full.
> >           */
> 
> As said there, imo this change belongs in the earlier patch.

I can move them there

