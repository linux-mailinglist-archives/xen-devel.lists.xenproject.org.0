Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKRkDxSFj2mRRQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 21:09:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE713954C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 21:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231808.1536791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqzTn-0008WS-73; Fri, 13 Feb 2026 20:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231808.1536791; Fri, 13 Feb 2026 20:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqzTn-0008Tm-3j; Fri, 13 Feb 2026 20:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1231808;
 Fri, 13 Feb 2026 20:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vqzTl-0008Rt-1A
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 20:09:29 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5f85c30-0917-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 21:09:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F6796091C;
 Fri, 13 Feb 2026 20:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E70FC116C6;
 Fri, 13 Feb 2026 20:09:24 +0000 (UTC)
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
X-Inumbo-ID: e5f85c30-0917-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771013366;
	bh=cZCUcCdA6I34GJrfMm43QWJwY50qUe7vdXKFH3sr5jg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OxFPKc4/7luVnWsnsWGtplumcOyfTlNuGWg6zhnjC7VT7wCESEuu2SNHplll0XA3I
	 GdwpfN1E9bD0qy91uheU+ZzhJwuWReuAgQoQMPWbbznFxK1qwXMkX5EnasCaHuEyDv
	 983nZcdtgTNZ8pjEGrKIW4KbyXTnb4wxpGqUZDNfw4jHSn8AOqsykt/tzosuN4qEwf
	 wf2G11wLF6V+YI7VLTOUHJSBZt0fDeVRRV13rxDIXF8svT92btl3jt8F/mLnMbn1EY
	 HKkqMB1BhKUkQTzqIFdhtF87p//Oj1o3Zs68FqhlHhaw64RXlF+qExBVXmJbPUoo6M
	 QhCwNKiH/Hnqw==
Date: Fri, 13 Feb 2026 12:09:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    grygorii_strashko@epam.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 2/5] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow
 non-hwdom binding
In-Reply-To: <43e80ad6-7b42-42de-b36f-1a9079589912@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602131206040.6031@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop> <20260204233712.3396752-2-stefano.stabellini@amd.com> <82c06e52-1db0-46e5-be9f-7ca0360ffc70@suse.com> <alpine.DEB.2.22.394.2602091520460.1134401@ubuntu-linux-20-04-desktop>
 <43e80ad6-7b42-42de-b36f-1a9079589912@suse.com>
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9FEE713954C
X-Rspamd-Action: no action

On Tue, 10 Feb 2026, Jan Beulich wrote:
> On 10.02.2026 00:23, Stefano Stabellini wrote:
> > On Mon, 9 Feb 2026, Jan Beulich wrote:
> >> On 05.02.2026 00:37, Stefano Stabellini wrote:
> >>> Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
> >>> global to VIRQ_DOMAIN to allow other domains to bind to it.
> >>>
> >>> Note that Linux silently falls back to polling when binding fails, which
> >>> masks the issue.
> >>>
> >>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>
> >> Technically this is an ABI change, and hence I'm uncertain it can go without
> >> that aspect being at least mentioned, perhaps even its implications properly
> >> discussed.
> > 
> > I am not sure if it qualifies as an ABI change or not but I am happy to
> > expand the commit message in any way you might suggest.
> > 
> > The jist of it is already in the commit message, really the key element
> > is that VIRQ_CONSOLE can be bound by multiple domains.
> > 
> > Aside from spelling out "this is an ABI change" what do you have in
> > mind?
> 
> What I mean is discussion of the implications for domains using the vIRQ.
> Previously most domains would have attempts to bind this vIRQ rejected.
> Technically it is possible that kernels had code paths blindly doing the
> binding, relying on it to work only when running as Dom0. And really, you
> appear to break XEN_DOMCTL_set_virq_handler when used with VIRQ_CONSOLE,
> without which its binding wasn't possible at all before (except for the
> hardware domain, which get_global_virq_handler() falls back to when no
> other domain is set). Or am I mis-reading things, as I can't spot any use
> of VIRQ_CONSOLE under tools/, whereas I would have expected provisions
> for (host) console handling to be delegated to a separate control or
> console domain? Of course other toolstacks (the XAPI-based one for
> example) might actually have such provisions.
> 
> And then there's the XSM question: XEN_DOMCTL_set_virq_handler obviously
> is subject to XSM checking. The same isn't true for VIRQ_DOMAIN-type
> vIRQ-s. Yet this vIRQ isn't supposed to be universally available to
> every DomU. Instead the ->console->input_allowed checking is kind of
> substituting such a check, which iirc Daniel said (in more general
> context) shouldn't ever be done. IOW in patch 5 you're actually effecting
> policy, which should be XSM's job aiui.
> 
> Bottom line: The patch may need to be more involved, but at the very
> least the description would need updating to justify it being as simple
> as it is right now.

What do you think of this:

---

xen/console: change VIRQ_CONSOLE from global to per-domain

Previously VIRQ_CONSOLE was a global VIRQ (VIRQ_GLOBAL type), meaning
only the hardware domain (or a domain explicitly set via
XEN_DOMCTL_set_virq_handler) could bind it. Any other domain attempting
to bind would fail with -EBUSY because get_global_virq_handler() would
return hwdom by default.

This patch changes VIRQ_CONSOLE to VIRQ_DOMAIN type, allowing any domain
to bind it independently, similar to VIRQ_ARGO. The console notification
is now sent via send_guest_domain_virq() directly to the focus domain
rather than through send_global_virq().

Implications:

1. Guest kernels that previously called bind on VIRQ_CONSOLE blindly
   will now succeed. Linux handles binding failure gracefully by falling
   back to polling, so this should not cause regressions.

2. XEN_DOMCTL_set_virq_handler can no longer be used with VIRQ_CONSOLE.
   The domctl explicitly rejects non-VIRQ_GLOBAL types. This means
   toolstacks that relied on set_virq_handler to delegate console handling
   to a separate console domain will need to use a different mechanism.
   Note: No known in-tree toolstack uses set_virq_handler with VIRQ_CONSOLE.

3. VIRQ_DOMAIN bindings are not subject to XSM checks beyond the
   standard event channel allocation policy. Access control for console
   input is enforced via the per-domain console->input_allowed flag,
   which is set for:
   - The hardware domain (by default in domain_create())
   - dom0less domains on ARM (in construct_domU())
   - The PV shim domain on x86 (in pv_shim_setup_dom())
   - Domains with vpl011 using the Xen backend (in domain_vpl011_init())

