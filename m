Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h5SCEOrTqGnpxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:52:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D997E2099F2
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 01:52:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246146.1545420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwxK-0003mn-Dc; Thu, 05 Mar 2026 00:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246146.1545420; Thu, 05 Mar 2026 00:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxwxK-0003ks-Ah; Thu, 05 Mar 2026 00:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1246146;
 Thu, 05 Mar 2026 00:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vxwxJ-0003kl-Az
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 00:52:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d0f3f9b-182d-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 01:52:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 965AC61340;
 Thu,  5 Mar 2026 00:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39414C4CEF7;
 Thu,  5 Mar 2026 00:52:39 +0000 (UTC)
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
X-Inumbo-ID: 9d0f3f9b-182d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772671960;
	bh=fwGZAvEnOWJP1q88WAtMQ66ow+06FNYeMCKKffwLsNk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FqcfnY3P0kA97DAbjwb4HiVnesUTQqEmhtNX2YYJEgXrujXjDqjDZDquiZl0d017M
	 BVyUwf2Kx4hrvxjgVvUHiJ+pTSzRUc+Uyk4aqzdZotfyBqI9yB338+ACLBrkqUpHUK
	 IIhDkllhxR0HLN1yQ/aERVbYq13OW8+4IlBgxx1mXKUWT8UZCYed5Hxr7Fgj8jD9lW
	 UIvbjbBC4fZewgO0zPp4w2I2Vhm6DGTVAv2HY1etoD7QaysKhK7w0dnMNncjrzPzOL
	 YhN7SymeUQMuJo1arxO/0gPuIz22Y1RGKqBqTr5u2k4uSAE6LcoNXXZs5PP2YoD6pC
	 0ll/DQYEvL/WQ==
Date: Wed, 4 Mar 2026 16:52:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    anthony@xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 3/5] physmem: xen: Conditionalize use of the
 mapcache
In-Reply-To: <aajS8ahPOaE_g5q1@zapote>
Message-ID: <alpine.DEB.2.22.394.2603041652200.250016@ubuntu-linux-20-04-desktop>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com> <20260304015222.979224-4-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2603041606480.250016@ubuntu-linux-20-04-desktop> <aajS8ahPOaE_g5q1@zapote>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1595222509-1772671960=:250016"
X-Rspamd-Queue-Id: D997E2099F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@amd.com,m:sstabellini@kernel.org,m:edgar.iglesias@gmail.com,m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:peterx@redhat.com,m:philmd@linaro.org,m:anthony@xenproject.org,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,nongnu.org,redhat.com,linaro.org,xenproject.org,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1595222509-1772671960=:250016
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 5 Mar 2026, Edgar E. Iglesias wrote:
> On Wed, Mar 04, 2026 at 04:07:23PM -0800, Stefano Stabellini wrote:
> > On Wed, 4 Mar 2026, Edgar E. Iglesias wrote:
> > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > 
> > > Conditionalize use of the mapcache. This is in preparation
> > > to optionally disable the mapcache at runtime.
> > > 
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > ---
> > >  system/physmem.c | 13 +++++++------
> > >  1 file changed, 7 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/system/physmem.c b/system/physmem.c
> > > index e5ff26acec..64e6d50f8f 100644
> > > --- a/system/physmem.c
> > > +++ b/system/physmem.c
> > > @@ -578,7 +578,8 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
> > >                                      is_write, true, &as, attrs);
> > >      mr = section.mr;
> > >  
> > > -    if (xen_enabled() && memory_access_is_direct(mr, is_write, attrs)) {
> > > +    if (xen_map_cache_enabled() &&
> > > +        memory_access_is_direct(mr, is_write, attrs)) {
> > >          hwaddr page = ((addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE) - addr;
> > >          *plen = MIN(page, *plen);
> > >      }
> > 
> > All the other changes make sense. For this one, the code inside the if
> > check is not strictly related to the mapcache. Are you sure it should be
> > changed?
> 
> Hi, yes, when the mapcache is on, we limit translations to the current page
> because the next page might not be mapped/locked or could be in a different
> mapcache bucket with a different virtual address. When mapcache is off, guest
> RAM is fully mapped (same as non‑Xen), so we can skip capping plen and allow a
> larger mapping.
> 
> Perhaps we should add a comment to clarify?

Yes please! Add a one-line in-code comment, and with that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1595222509-1772671960=:250016--

