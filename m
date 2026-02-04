Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJPsG8rWg2lbuwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:31:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19104ED482
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221237.1529501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmKA-0000rl-9v; Wed, 04 Feb 2026 23:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221237.1529501; Wed, 04 Feb 2026 23:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmKA-0000pS-3Y; Wed, 04 Feb 2026 23:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1221237;
 Wed, 04 Feb 2026 23:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUtr=AI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vnmK7-0000pM-Jb
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 23:30:15 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71680c11-0221-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 00:30:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AD23642A72;
 Wed,  4 Feb 2026 23:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F59EC4CEF7;
 Wed,  4 Feb 2026 23:30:06 +0000 (UTC)
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
X-Inumbo-ID: 71680c11-0221-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770247807;
	bh=K1XBJ+iPf0+mEXtlRmo6IsXFzXYMryUhBxLSvA+haUY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OWXVcgk2Re679D7ZYNZEw3FS/uugHAWb5mzmRfwWVaDlSBqtoE95wt79Fw6ZjlfxA
	 3ymveDyhONgh5OXoA09GOHnqrWsH0tPNpvRysVA+bQC9W8x136QUFM9E1B3fquF1gT
	 1wCgfyv1a03VPqNUBwFLPZLrZ8OocyY2iubDHD8o7ql8Et7LjtHAM6a5eIwNhZGL8B
	 QoZ+73pXfVQEAMohdPYjQb45crRqQq+LUxI9G2fRT/f8J50wBg1uh71S05adiPZTjM
	 lGfGrQpPdVSJ/6LiCJ2XHaorNom3uZKMvFQL8DnzL2OzPLhfQw0pbb46jvfJkOT24s
	 b1y0RIQEAuYiQ==
Date: Wed, 4 Feb 2026 15:30:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    grygorii_strashko@epam.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 1/2] xen/console: handle multiple domains using
 console_io hypercalls
In-Reply-To: <0a437580-a373-4aeb-a153-b3dca0cf2bb7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602041524120.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop> <20260129220858.2371938-1-stefano.stabellini@amd.com> <0fc9a80a-8621-4ce4-b2f9-c102e975b05b@suse.com> <alpine.DEB.2.22.394.2602031502000.3175371@ubuntu-linux-20-04-desktop>
 <0a437580-a373-4aeb-a153-b3dca0cf2bb7@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 19104ED482
X-Rspamd-Action: no action

On Wed, 4 Feb 2026, Jan Beulich wrote:
> On 04.02.2026 00:02, Stefano Stabellini wrote:
> > On Tue, 3 Feb 2026, Jan Beulich wrote:
> >> On 29.01.2026 23:08, Stefano Stabellini wrote:
> >>> @@ -555,7 +566,10 @@ static void console_switch_input(void)
> >>>  
> >>>          if ( next_rx++ >= max_console_rx )
> >>>          {
> >>> +            nrspin_lock_irq(&console_lock);
> >>
> >> As indicated earlier, you can't know IRQ state in anything down the call
> >> tree from serial_rx().
> > 
> > I'll switch to the irqsave/restore versions in console_switch_input
> 
> I've seen that you already sent v9, but seeing how getting the locking right
> has proven to be difficult, I have two more remarks towards this.
> 
> 1) Can the locking additions to existing code please be split out into a
>    separate patch?

I did this


> 2) As all of this is for dom0less only (for now at least), did you consider
>    to make all of these changes dependent upon a new Kconfig option, so to
>    avoid impacting other environments in case issues remain when this has
>    gone in?

Effectively it is already the case because:

#define max_console_rx (max_init_domid + 1)

I could easily add an #ifdef around is_focus_domain() so that in case
CONFIG_DOM0LESS_BOOT is disabled it defaults to is_hardware_domain() but
that wouldn't really help because thanks to the definition of
max_console_rx, effectively it works the same way when
CONFIG_DOM0LESS_BOOT is disabled.

I think what you are asking would be more about the locking changes in
guest_console_write, but for those I cannot really use #ifdef to retain
the current position of the locks. The resulting code would not be good.

So I decided to not make any changes in this regard. However, I am happy
to #ifdef is_focus_domain() although as I said I don't think it would
bring much value.

