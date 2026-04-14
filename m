Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIJyAgif3mlrGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:09:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8D3FE488
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282070.1564741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCk3q-0002LF-Hs; Tue, 14 Apr 2026 20:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282070.1564741; Tue, 14 Apr 2026 20:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCk3q-0002Jq-DI; Tue, 14 Apr 2026 20:08:38 +0000
Received: by outflank-mailman (input) for mailman id 1282070;
 Tue, 14 Apr 2026 20:08:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wCk3o-0002JR-Ls
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:08:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCk3l-007whr-UN
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 22:08:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69de9ea0-5cb7-0a2a0a5109dd-0a2a4502e8ea-32
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 22:08:35 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69de9ec1-42fa-0a2a45020019-aceafc1fe558-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 22:08:34 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C64D1416F8;
 Tue, 14 Apr 2026 20:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4206FC19425;
 Tue, 14 Apr 2026 20:08:32 +0000 (UTC)
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
	s=k20201202; t=1776197312;
	bh=yjVCZ3a0MrQZ9xudQupVJGsRXbJe5XDuXlr+v1hQPS8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r2fSS6EPlkY+jyQLBgtliy+sf1NAR9PIAYSdJhLd/2rPvH7J2Zlc34WQr6g8V3A2l
	 Ndwx7RIDMsSqmF2/VCY5dgM+c4RRvSudqZzdmu3LU9leWblj+MAYIQPHSH2iaL6H6V
	 BY6ZPV5017q9iKPxBkq/BaN8VmmKM26b8Kk8sSRg8C2zgrhINye9giYyvRnzOCePMv
	 Ue9YDENRDV8GTI5tVtvrPO7Qyoe9TJ2IZlm62pxaEG33Mozgr/jrzcj1i2Jr8NT+Xa
	 MD2J+gFFhNyiP4lP7Xt8AaZkgq1dp56DeFf0kCIWpnJRoJs1tVG2VDyjZMjICkdhvu
	 C4bYDyONnvOjw==
Date: Tue, 14 Apr 2026 13:08:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Teddy Astie <teddy.astie@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 0/2] time: fix time accounting for x86 HVM guests
In-Reply-To: <20260414103327.7420-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2604141308020.1307609@ubuntu-linux-20-04-desktop>
References: <20260414103327.7420-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1776197314-AE524CD1-A6F09630/0/0
X-purgate-type: clean
X-purgate-size: 625
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,citrix.com,vates.tech,kernel.org,xen.org,arm.com,amd.com,epam.com,wdc.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 86E8D3FE488
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 14 Apr 2026, Roger Pau Monne wrote:
> Hello,
> 
> When not emulating the TSC the guest time value calculated by using the
> vCPU time info page in HVM mode would drift between time synchronization
> intervals.  First patch fixes the drift, second patch makes the
> calculation of cpu_khz round up the value for better accuracy.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (2):
>   x86/time: use native TSC scaling factors when TSC is not scaled
>   xen/cpu: round up cpu_khz calculations

Thanks Roger, this fixed an outstanding bug I was seeing!

Tested-by: Stefano Stabellini <sstabellini@kernel.org>

