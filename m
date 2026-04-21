Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOKLMbv352kVDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:18:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797594401C7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289552.1569492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJQJ-0002wx-3t; Tue, 21 Apr 2026 22:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289552.1569492; Tue, 21 Apr 2026 22:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJQJ-0002ur-18; Tue, 21 Apr 2026 22:18:27 +0000
Received: by outflank-mailman (input) for mailman id 1289552;
 Tue, 21 Apr 2026 22:18:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJQH-0002tW-4A
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:18:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJQG-00CVAL-HN
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:18:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f774-bab6-0a2a0a5309dd-0a2a4502dd44-44
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:18:24 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f7af-af86-0a2a45020019-aceafc1fc04c-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:18:24 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC30D44346;
 Tue, 21 Apr 2026 22:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BED6C2BCB0;
 Tue, 21 Apr 2026 22:18:22 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776809902;
	bh=xY5cI7DXMyU9Nx2r71/2aeXZWERBlGLgKOcoLddlEAY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J+8PdrNNgP2NOr9wFVWGRxTvihCzC05lYl5/sncLZI3U2ASpYR+6L5S8FYYizI3VE
	 EzoinrKsC/IWeIqUt55qxs8dZAqg8m9U7a+p36VnMoPRVzRtXUFhvwtqQyzTo2sGz9
	 0YdqrsKX4tfDhnOv93bJpDvY9m7qfMe3/y3q3k2mCfOrTqY58KODoCbaDpzslciiC4
	 Bl06feLTkzBJAD4Qq/QFBMZpIyGjUzWC4IYRlR27YJgpMzVGQmjRP0YL8IZJjO+UNc
	 UHzFnI+QrKBcTPMF0j5oAPppTzulXulcC6reOx5V06mEQ/xoG0uzaEAdAx1qcOWTBz
	 x4Mpkt+sVLS3Q==
Date: Tue, 21 Apr 2026 15:18:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 6/6] xen/dt-overlay: attach resources for child nodes in
 overlay
In-Reply-To: <399078B8-E138-4689-AF98-8BDC6052C080@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211518140.2712345@ubuntu-linux-20-04-desktop>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-7-michal.orzel@amd.com> <399078B8-E138-4689-AF98-8BDC6052C080@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1776809904-8137C161-35518EB2/0/0
X-purgate-type: clean
X-purgate-size: 1224
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 797594401C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 15 Apr 2026, at 12:37, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > handle_attach_overlay_nodes() only calls handle_device() on the
> > top-level overlay nodes tracked in entry->nodes_address[].  Child nodes
> > that have their own reg, interrupts, or iommus properties are never
> > processed, so their IRQs are not routed, MMIO regions are not mapped,
> > and IOMMU setup is skipped.
> > 
> > Introduce handle_device_and_children() which recursively walks the
> > subtree rooted at each overlay node and calls handle_device() on every
> > descendant, ensuring all resources in the overlay are properly attached.
> > 
> > Note that the attach error path has a pre-existing bug: on partial
> > failure, the tracking rangesets are destroyed without first revoking the
> > IRQ/MMIO permissions and IOMMU assignments that were already granted by
> > the successful handle_device() calls.  Add a TODO comment to flag this.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> > 
> 
> Looks ok to me
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

