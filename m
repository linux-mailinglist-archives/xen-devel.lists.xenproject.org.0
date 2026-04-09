Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM+RK5e712l0SAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:45:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB363CC29C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277635.1562783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqdK-0002A1-1c; Thu, 09 Apr 2026 14:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277635.1562783; Thu, 09 Apr 2026 14:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAqdJ-000270-V4; Thu, 09 Apr 2026 14:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1277635;
 Thu, 09 Apr 2026 14:45:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <corbet@lwn.net>) id 1wAqdI-00026u-LL
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:45:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAqdF-009cz4-Uu
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:45:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <corbet@lwn.net>)
 id 69d7bb78-bab6-0a2a0a5309dd-0a2a4506bb4c-44
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:45:23 +0200
Received: from [45.79.88.28] (helo=ms.lwn.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <corbet@lwn.net>)
 id 69d7bb81-0df0-0a2a45060019-2d4f581ca456-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:45:22 +0200
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net
 [71.229.227.126])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 33E0F40B2D;
 Thu,  9 Apr 2026 14:45:20 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20201203 header.d=lwn.net header.i="@lwn.net" header.h="From:To:Cc:Subject:In-Reply-To:References:Date"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 33E0F40B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775745920; bh=9UjJsJZfwJanCZGABshmZ68foQfId21dwyXnZXsn0Gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M1oTRvPKdFlczPjiNIi/kCOEUebV1SXduyRsOHJpL6K0vbeF7garYUzALbfVlNJ4K
	 vYb5oD+VFS1redUL+alhViqUA7Azlm07SoiQuXZZlwRqT+qrjdv2/ieKdX7WRLJ2ej
	 bU5jiQnxytqPyM5rusfbuut+ov9uLPaL3OscGK1qaclZ8FP160BA7mZiw1TtzfSfI0
	 wuO00U1Oqh/CUoQ0yrke2WSt2Ab0iRWzeuAfEn//CzU9PUcWjIiVWoYJaqWIouQZsj
	 b+i6lOmTcZVE1487sabU7Vfjgpps3XWTp9w9T3+XQyBQPrCVyMxdsNPjrqVlDN6vSI
	 BWvIqbZO4KlSQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>, jgross@suse.com
Cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 linux-doc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
Subject: Re: [PATCH v2] docs: sysctl: Add documentation for /proc/sys/xen/
In-Reply-To: <20260304150419.16738-1-chakrabortyshubham66@gmail.com>
References: <20260304150419.16738-1-chakrabortyshubham66@gmail.com>
Date: Thu, 09 Apr 2026 08:45:19 -0600
Message-ID: <87fr54b3b4.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-16d1c6/1775745923-AF5383D8-161F3CAB/0/0
X-purgate-type: clean
X-purgate-size: 847
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,vger.kernel.org,lists.xenproject.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:chakrabortyshubham66@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:boris.ostrovsky@oracle.com,m:linux-doc@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5FB363CC29C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

> Add documentation for the Xen hypervisor sysctl controls in
> /proc/sys/xen/balloon/.
>
> Documents the hotplug_unpopulated tunable (available when
> CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is enabled) which controls
> whether unpopulated memory regions are automatically hotplugged
> when the Xen balloon driver needs to reclaim memory.
>
> The documentation is based on source code analysis of
> drivers/xen/balloon.c.
>
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/index.rst |  3 ++-
>  Documentation/admin-guide/sysctl/xen.rst   | 31 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/sysctl/xen.rst

Applied, thanks.

jon

