Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pIT0I6ZsimkqKQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 00:24:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED07115608
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 00:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226024.1532589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpab9-00004r-4z; Mon, 09 Feb 2026 23:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226024.1532589; Mon, 09 Feb 2026 23:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpab9-0008V9-0W; Mon, 09 Feb 2026 23:23:19 +0000
Received: by outflank-mailman (input) for mailman id 1226024;
 Mon, 09 Feb 2026 23:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74qY=AN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vpab7-0008V3-P6
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 23:23:17 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e025aff-060e-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 00:23:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C07E460008;
 Mon,  9 Feb 2026 23:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A8BC116C6;
 Mon,  9 Feb 2026 23:23:10 +0000 (UTC)
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
X-Inumbo-ID: 4e025aff-060e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770679392;
	bh=hN4f9pbOLQxB9dajd1xH/ubGDR3mYFCXUYLzi5PXPGY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fM3Gx1E8Ch+SyrTuQ4FDSLA75Z6G9IJ4ZCWitj7MrrG9N2hOpa9rwCx1DsnqEgPvI
	 sVOPC5jvsXm9LUtySqbCRhvccYZuRLL+2t0r7YXLWNvhd9GBqU/YoE3xNy6E8GCgLZ
	 5kaPVgPypqQclnj723yWFac8DFa9sDk8HHIEiLvb7GvBKZX+8XDSC9+dCxW2PBqGCN
	 1x3J1zoFc+/ofX4fIJ/Bclu+dcYuty/jdvtnmBruVzziEhKjXGUcxRvFHiBwMwF5Al
	 j1VfdFdBQeQ+WltlIRfLs/BBKsD6fbmg4Za8E+H3g+s+GVGzZNaaBKcwv1AHm27b10
	 hEYz69WH6azcA==
Date: Mon, 9 Feb 2026 15:23:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    grygorii_strashko@epam.com, anthony.perard@vates.tech, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    jason.andryuk@amd.com, victorm.lira@amd.com, andrew.cooper3@citrix.com, 
    sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 2/5] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow
 non-hwdom binding
In-Reply-To: <82c06e52-1db0-46e5-be9f-7ca0360ffc70@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602091520460.1134401@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop> <20260204233712.3396752-2-stefano.stabellini@amd.com> <82c06e52-1db0-46e5-be9f-7ca0360ffc70@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2ED07115608
X-Rspamd-Action: no action

On Mon, 9 Feb 2026, Jan Beulich wrote:
> On 05.02.2026 00:37, Stefano Stabellini wrote:
> > Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
> > global to VIRQ_DOMAIN to allow other domains to bind to it.
> > 
> > Note that Linux silently falls back to polling when binding fails, which
> > masks the issue.
> > 
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Technically this is an ABI change, and hence I'm uncertain it can go without
> that aspect being at least mentioned, perhaps even its implications properly
> discussed.

I am not sure if it qualifies as an ABI change or not but I am happy to
expand the commit message in any way you might suggest.

The jist of it is already in the commit message, really the key element
is that VIRQ_CONSOLE can be bound by multiple domains.

Aside from spelling out "this is an ABI change" what do you have in
mind?

