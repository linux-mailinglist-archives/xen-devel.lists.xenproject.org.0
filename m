Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKfKIFE9gWk8FAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 01:12:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AAD2DB9
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 01:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219100.1528044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vn410-00065Z-F1; Tue, 03 Feb 2026 00:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219100.1528044; Tue, 03 Feb 2026 00:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vn410-00062r-Bs; Tue, 03 Feb 2026 00:11:34 +0000
Received: by outflank-mailman (input) for mailman id 1219100;
 Tue, 03 Feb 2026 00:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0aDa=AH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vn40y-00062l-Je
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 00:11:32 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2911345-0094-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 01:11:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63C4B60010;
 Tue,  3 Feb 2026 00:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EB9C116C6;
 Tue,  3 Feb 2026 00:11:25 +0000 (UTC)
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
X-Inumbo-ID: e2911345-0094-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770077487;
	bh=IWHHgytLEWt062oltx3FQsUSxw3KaDNf5I7nUPrphEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MVXC/8QAySIjUMj4+QNoKHfhx9VIfSPMD3LmeIJmqWgKoWn5hKzl/gbhaqcLDGTw/
	 bmVmgc1NrDPyqh3LcIX/1MedUvpl4c0yqM+ll9MsrG32z+ekbE8uLyJwOmpI6IeT3x
	 0/Cjfq0tifb+meegAiqrmHJtQ5uZMV8ZzHtG6jigtKBT0PyDXnoFN6GjVW6YnXe/Xh
	 fHLPS4QzYzFBsYPSSOCtFbvfXY2XC9CLEiDUryanRxjJkdjxM0DM6RhLXT+foESJlc
	 /mnf7MXaxHftXqFaNtHUmN8RNnse07ftkBODLYExeLZvIXyQ1AZuvb1kEHWLIkpxDm
	 mzQIEOC3Aihbg==
Date: Mon, 2 Feb 2026 16:11:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, grygorii_strashko@epam.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org, 
    roger.pau@citrix.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    jbeulich@suse.com, sstabellini@kernel.org
Subject: Re: [PATCH v8 2/2] xen: enable dom0less guests to use console_io
 hypercalls
In-Reply-To: <bcccb80b-a7d5-4600-8dc5-c4dd8f99ab71@amd.com>
Message-ID: <alpine.DEB.2.22.394.2602021551180.2599007@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop> <20260129220858.2371938-2-stefano.stabellini@amd.com> <bcccb80b-a7d5-4600-8dc5-c4dd8f99ab71@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 296AAD2DB9
X-Rspamd-Action: no action

On Thu, 29 Jan 2026, Jason Andryuk wrote:
> On 2026-01-29 17:08, Stefano Stabellini wrote:
> > Enable dom0less guests on ARM to use console_io hypercalls:
> > - set input_allow = true for dom0less domains
> > - update the in-code comment in console.c
> > - prioritize the VUART check to retain the same behavior as today
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v8:
> > - move in-code comment update to previous patch
> > - add in-code comment about is_focus_domain() check
> > ---
> >   xen/common/device-tree/dom0less-build.c |  2 ++
> >   xen/drivers/char/console.c              | 16 ++++++++++------
> >   2 files changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/xen/common/device-tree/dom0less-build.c
> > b/xen/common/device-tree/dom0less-build.c
> > index 840d14419d..cb7026fa7e 100644
> > --- a/xen/common/device-tree/dom0less-build.c
> > +++ b/xen/common/device-tree/dom0less-build.c
> > @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info
> > *kinfo,
> >         rangeset_destroy(kinfo->xen_reg_assigned);
> >   +    d->console->input_allowed = true;
> > +
> >       return rc;
> >   }
> >   diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index ed8f1ad8f2..418d194cef 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -613,11 +613,20 @@ static void __serial_rx(char c)
> >       if ( console_rx == 0 )
> >           return handle_keypress(c, false);
> >   +    /* Includes an is_focus_domain() check. */
> >       d = console_get_domain();
> >       if ( !d )
> >           return;
> >   -    if ( is_hardware_domain(d) )
> > +#ifdef CONFIG_SBSA_VUART_CONSOLE
> > +    /* Prioritize vpl011 if enabled for this domain */
> > +    if ( d->arch.vpl011.base_addr )
> > +    {
> > +        /* Deliver input to the emulated UART. */
> > +        rc = vpl011_rx_char_xen(d, c);
> > +    }
> > +    else
> > +#endif
> >       {
> >           unsigned long flags;
> >   @@ -636,11 +645,6 @@ static void __serial_rx(char c)
> >            */
> >           send_global_virq(VIRQ_CONSOLE);
> 
> I think we need an additional patch, or included in one of these two, to
> change VIRQ_CONSOLE to a VIRQ_DOMAIN.  Otherwise only hwdom could bind to the
> virq, I think?  It would be the two changes below:

Thank you Jason. I didn't notice this problem because Linux is able to
silently fallback to polling which works surprisingly well. I didn't
notice the difference.

I confirm that the error you highlighted is real and that with the patch
below the error goes away.

My preference is to submit it as a separate patch, it can still be part
of this series. Especially as the other two patches have already been
reviewed and tested independently a few times. But I am happy either
way.

Jan, what do you think?

 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index 67700b050a..dab123f20d 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -138,6 +138,7 @@ static enum virq_type get_virq_type(unsigned int virq)
>          return VIRQ_VCPU;
> 
>      case VIRQ_ARGO:
> +    case VIRQ_CONSOLE:
>          return VIRQ_DOMAIN;
> 
>      case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 903ad912cc..138eeaa14d 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -611,7 +611,7 @@ static void __serial_rx(char c)
>           * Always notify the hardware domain: prevents receive path from
>           * getting stuck.
>           */
> -        send_global_virq(VIRQ_CONSOLE);
> +        send_guest_domain_virq(d, VIRQ_CONSOLE);
>      }
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
>      else
> 

