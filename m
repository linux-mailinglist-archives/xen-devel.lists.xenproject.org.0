Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL/RBaD352kVDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:18:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8A440183
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 00:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289529.1569475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPs-0001uT-KL; Tue, 21 Apr 2026 22:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289529.1569475; Tue, 21 Apr 2026 22:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFJPs-0001sv-HG; Tue, 21 Apr 2026 22:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1289529;
 Tue, 21 Apr 2026 22:17:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFJPr-0001qx-CA
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 22:17:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFJPq-00CV3J-PU
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:17:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f774-bab6-0a2a0a5309dd-0a2a4502dd44-22
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:58 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e7f795-af86-0a2a45020019-ac6904febb14-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 00:17:58 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A45161335;
 Tue, 21 Apr 2026 22:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9617C2BCB0;
 Tue, 21 Apr 2026 22:17:56 +0000 (UTC)
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
	s=k20201202; t=1776809877;
	bh=J9vaM3OKaCkqhTApqyllVmpe1yCscLm46h/f+zHtfjE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QsfthhKFZc4jFzf4IQB7RQYeI52PkWCTCojBlyBFd/xsOICz1L921HShVeRLl5h19
	 WRX87wCY0iT9XVoI6bCUNDxXwAfSMmU1Vt7DU+zoWrXJSeN8Udz870zLiQjbN3K92/
	 wGh0G7Cp9ziExB20h1/vVEKeDnMsTK2VfME0nmF3M3bnAmQ8/il6FQI2tJrsSWAlxr
	 qOYjpI3wwIVUfII0VdM+KzFFaNmaQoLLo0grLyvCC7ORA1763GWJgdWIGT1zgWmYnW
	 7oWjdb7JrRcahhPex9wksibOYTx6W6qRGwqcR+gI51wYOK8JscQGTiY63AzWaXoISQ
	 L0lYybZONX1Fw==
Date: Tue, 21 Apr 2026 15:17:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 4/6] xen/dt-overlay: fix silent success in
 dt_overlay_remove_node
In-Reply-To: <30CCBA3C-D43C-4516-9DB7-9333428AE277@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604211517510.2712345@ubuntu-linux-20-04-desktop>
References: <20260415113700.107915-1-michal.orzel@amd.com> <20260415113700.107915-5-michal.orzel@amd.com> <30CCBA3C-D43C-4516-9DB7-9333428AE277@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1776809878-83B60161-B5CB9EEB/0/0
X-purgate-type: clean
X-purgate-size: 872
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,arm.com:email];
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
X-Rspamd-Queue-Id: 0AC8A440183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 15 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 15 Apr 2026, at 12:36, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > dt_overlay_remove_node() silently returns 0 when the target node is not
> > found in the parent's sibling list.  The loop simply exits without
> > matching and falls through to "return 0", making the caller believe the
> > node was successfully removed.
> > 
> > Return -ENODEV after the loop when no match is found, and change the
> > found-path from break to an explicit return 0 so the two outcomes are
> > distinct.
> > 
> > Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Looks ok to me
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


Acked-by: Stefano Stabellini <sstabellini@kernel.org>

