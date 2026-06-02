Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hk4MpYgHmrmhQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 02:15:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B76267B5
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 02:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324271.1589887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUClf-0005Ti-Bm; Tue, 02 Jun 2026 00:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324271.1589887; Tue, 02 Jun 2026 00:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUClf-0005R9-7c; Tue, 02 Jun 2026 00:14:03 +0000
Received: by outflank-mailman (input) for mailman id 1324271;
 Tue, 02 Jun 2026 00:14:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUCld-0005R3-0E
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 00:14:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUClc-0017tz-9p
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 02:14:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e2048-bab6-0a2a0a5309dd-0a2a450a999e-0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:14:00 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e2046-56b3-0a2a450a0019-ac6904feb9a0-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:13:59 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 446FF6001A;
 Tue,  2 Jun 2026 00:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A9C1F00893;
 Tue,  2 Jun 2026 00:13:57 +0000 (UTC)
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
	s=k20260515; t=1780359238;
	bh=/o3fXyBhddv19gcYEwPTDd7WSpF5z8lyfxeMop2lXKc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=VKxs9MWK37/5DMtzGdeU3iwkwHpUT1sgyBG9ychRN78JAGEwNYgucgdkNHiZ4rAFT
	 ffyNX3jUEuuZVIPaNmFNZWC9kQuYvv5FxXckq2jXGQGltxsPALuMBP0RI54TJ4aRWu
	 4Xg4tv9dRgGKk69dSdBOOSA+N0ayMFyTyliATJjFOpyVscJmo3Earg+T+IgGuZqehe
	 PcD3X4ziA6sjHovYOLiiBDAl/CjFxjN3ybTvC+hNQmqBSdv90lVH9KiUec8L96JrnI
	 Q/SOs2o13UDNgPiw9o0pt6ariQshhRaO/utK7ZfaFP4Kfmu//UM4lV3TCsNDpz4OR6
	 ISbCPk3QH7HxA==
Date: Mon, 1 Jun 2026 17:13:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com, 
    Mykola Kvach <mykola_kvach@epam.com>
Subject: Re: [PATCH v3 1/6] argo: lower level of noisy connection-refused
 log
In-Reply-To: <20260526215823.1452619-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2606011713430.550703@ubuntu-linux-20-04-desktop>
References: <20260526215823.1452619-1-dmukhin@ford.com> <20260526215823.1452619-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-4011c0/1780359240-6FD588B7-42BE7662/0/0
X-purgate-type: clean
X-purgate-size: 589
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:mykola_kvach@epam.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,suse.com,xen.org,amd.com,kernel.org,gmail.com,apertussolutions.com,epam.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6F1B76267B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Switch the log line to argo_dprintk() so it is enabled only in debug
> environments, as it can spam the logs when a dom0 service using the Argo
> hypercall tries to communicate with a domain that is still starting up.
> 
> Note that this also lowers the log level to debug when the argo_dprintk()
> facility is enabled.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


