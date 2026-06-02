Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL+KCQYhHmr3hQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 02:17:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBA4626832
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 02:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324290.1589915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCoa-0006tT-6r; Tue, 02 Jun 2026 00:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324290.1589915; Tue, 02 Jun 2026 00:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCoa-0006rU-3w; Tue, 02 Jun 2026 00:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1324290;
 Tue, 02 Jun 2026 00:17:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUCoY-0006rG-QM
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 00:17:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUCoY-001jEH-7F
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 02:17:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e20e3-e002-0a2a0a5209dd-0a2a4505c834-18
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:17:02 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e20fc-aaa8-0a2a45050019-aceafc1fa816-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:17:02 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 39ADE41A47;
 Tue,  2 Jun 2026 00:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14C91F00893;
 Tue,  2 Jun 2026 00:16:59 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780359420;
	bh=BJxsBqAi8+VE+3mmq5Wh+HjFYd6vHIoCh0n2ee9RFSY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Y57Pcu7X59VJumaOVsghTCEpfYoQ3FQlWauIZQM4V223rVVYrAZjLe+WH1akmDVFA
	 3rkQ5yAeYXF7MXt02slHxiVjdQoqH1gPcWmQ/maAJW+oLiUSpWgnZpELTkOduu2Y3R
	 VA3HEv4eoaLU2laMlYxtrB6mywkM+G9VgqTZfFXnFYHB/5PZ7587gLRfmNsv7vMM+g
	 nceBpl0TMlNh77Z0NTKgfovzs7/r8I9mam1Up8flBLrfuaT3wIeRKai3GqkqE5CHiq
	 m/IYM3KZUTpHWYDJYtwN7nvK7GA5HRtwncpqguIbgFc8H4TJujWvULJe6lPrrCkPg1
	 RrOhmcSz7gS4Q==
Date: Mon, 1 Jun 2026 17:16:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, 
    Mykola Kvach <mykola_kvach@epam.com>
Subject: Re: [PATCH v3 3/6] argo: drop argo prefix from argo_dprintk()
 calls
In-Reply-To: <20260526215823.1452619-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2606011716380.550703@ubuntu-linux-20-04-desktop>
References: <20260526215823.1452619-1-dmukhin@ford.com> <20260526215823.1452619-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1780359422-DB16D443-F9E7D2BC/0/0
X-purgate-type: clean
X-purgate-size: 464
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,epam.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,ford.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CCBA4626832
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> argo_dprintk() prefixes all log lines with "argo: " automatically.
> 
> Remove duplicate prefixes from log messages in the Argo module where
> applicable.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

I meant review-by, so resending my reply

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

