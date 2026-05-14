Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IDSJ3MiBWpySwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 03:16:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E4C53C9F1
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 03:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308572.1579973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNKfm-0008Rs-8q; Thu, 14 May 2026 01:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308572.1579973; Thu, 14 May 2026 01:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNKfm-0008Ps-3D; Thu, 14 May 2026 01:15:34 +0000
Received: by outflank-mailman (input) for mailman id 1308572;
 Thu, 14 May 2026 01:15:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wNKfl-0008Pm-5c
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 01:15:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNKfk-00FiAu-Ix
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 03:15:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a05219e-2eae-0a2a0a5409dd-0a2a4508e5b2-42
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 03:15:32 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a052233-63b5-0a2a45080019-ac6904fedd78-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 03:15:32 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0307660052;
 Thu, 14 May 2026 01:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FBBC19425;
 Thu, 14 May 2026 01:15:30 +0000 (UTC)
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
	s=k20201202; t=1778721330;
	bh=t5sjd5h7AhqCHvVTGxpv77qD10NFeCmZNyaIOsigFEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XY/7cH7CDop3NhMxmyZz8HzJ7yo6jP8EL77u2LyCfOe+Xzn0DGVHhebivc1BfPg6W
	 xXtsNpSMGDi775RwTcN8TNgLZDJA9JwUxE9sR/2mk4FyC46a8uwdSsT5aMnVlNprN+
	 O1RfQx1NV9UQl73zhWnZQfFdcEpr1p6ebaQAwlWrfBwJ5daN1mo9w+h7qb+kORgsiK
	 sRCfZTNDPCY8VuS0V33cJ58/PLZEKIO1IJxord3N3lmIWJ4mw+6UJDk6o+obtp+WOX
	 Tm5v2eBXfoGtQfhklh623ILwgdglZppI5uMvz/i1YMb1TxxJavC3npqdQAlKs/ovtg
	 2cdAzDtvhOBAw==
Date: Wed, 13 May 2026 18:15:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 1/4] xen/public: introduce DOMID_ANY
In-Reply-To: <20260429120619.1013440-2-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2605131815190.3930@ubuntu-linux-20-04-desktop>
References: <20260429120619.1013440-1-jgross@suse.com> <20260429120619.1013440-2-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c1860d/1778721332-C4E78DB1-B2C6B2D4/0/0
X-purgate-type: clean
X-purgate-size: 386
X-Rspamd-Queue-Id: 46E4C53C9F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Wed, 29 Apr 2026, Juergen Gross wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add DOMID_ANY to xen/include/public/xen.h meant to be a wildcard for
> domids.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

