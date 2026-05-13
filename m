Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF7OFNDlBGpCQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 22:57:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC153ABF1
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 22:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308473.1579917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGeH-0005wM-Aa; Wed, 13 May 2026 20:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308473.1579917; Wed, 13 May 2026 20:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNGeH-0005uc-7s; Wed, 13 May 2026 20:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1308473;
 Wed, 13 May 2026 20:57:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wNGeF-0005uC-Rh
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 20:57:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNGeF-001hfp-8e
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 22:57:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a04e595-2eae-0a2a0a5409dd-0a2a45038920-32
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:57:43 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a04e5c6-672d-0a2a45030019-ac6904fee0aa-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 22:57:43 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B4BA860126;
 Wed, 13 May 2026 20:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2794FC2BCC7;
 Wed, 13 May 2026 20:57:41 +0000 (UTC)
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
	s=k20201202; t=1778705861;
	bh=QSRr88+bJ+mw8eN2N6nw/WIyoxLc4FX8rbgxy8AkDfE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fhAT6fDqTeswK6p51PnYUUGlrwcmzgdQjVVqHGhAAUH1dWxZYZHJwSETe+C5oOrTf
	 RY/tF0/qY9wR2F17QBgxE2TJ2O79ibwnTStUzzQXmgMfX9ZY9r/QK9gG4pEHTRuvbF
	 6Mshn0skwJtR7qEJ+H15W9mmESCcj8sNoSIoZneg9MS4WGYzkXc2gteGGGrJNlDQJY
	 4bVhOX3ncVPiKcvbxt3niCH8zR74gcZWnxao/9n9bkfausaysvj91eVYJZONLj7lnN
	 QWRsjmF5kEfWwvo7SJR09OWvDjaC7klDrVxeq8ecc7lw3W/AUn9ulTsKQ1dcXUYLj+
	 8yDgpMgC1HM5w==
Date: Wed, 13 May 2026 13:57:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] ns16550: add support for ASIX AX99100 PCIe
 Multi-I/O controller
In-Reply-To: <20260511075415.36538-3-Zhao.Jiaqing@amd.com>
Message-ID: <alpine.DEB.2.22.394.2605131357300.3930@ubuntu-linux-20-04-desktop>
References: <20260511075415.36538-1-Zhao.Jiaqing@amd.com> <20260511075415.36538-3-Zhao.Jiaqing@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1778705863-38B74938-25CF2360/0/0
X-purgate-type: clean
X-purgate-size: 376
X-Rspamd-Queue-Id: 1FCC153ABF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Zhao.Jiaqing@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Mon, 11 May 2026, Jiaqing Zhao wrote:
> Add a PCI device table entry and matching parameter for the ASIX
> AX99100 PCIe to Multi-I/O controller [125b:9910]. Each port on the
> chip is a standalone PCI function, with UART registers on its I/O
> BAR0.
> 
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

