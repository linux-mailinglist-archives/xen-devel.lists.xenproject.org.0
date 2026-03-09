Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHuXNZDzrmnZKgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 17:21:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7928823CA06
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 17:21:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249576.1547048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzdLQ-0007oC-FI; Mon, 09 Mar 2026 16:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249576.1547048; Mon, 09 Mar 2026 16:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzdLQ-0007lb-CS; Mon, 09 Mar 2026 16:20:36 +0000
Received: by outflank-mailman (input) for mailman id 1249576;
 Mon, 09 Mar 2026 16:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhv8=BJ=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1vzdLO-0007lV-DU
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 16:20:34 +0000
Received: from mx1.somlen.de (breeze.somlen.de [2a00:1828:a019::100:0])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4c14583-1bd3-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 17:20:32 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 8C61850C34C;
 Mon,  9 Mar 2026 17:20:30 +0100 (CET)
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
X-Inumbo-ID: e4c14583-1bd3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1773073230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgzjjuSkW18P1q0YDVh3ZpT1HB0jbglyqdNQdpVWgeE=;
	b=VpK7xzhfQoQ+vMCEEs3kO2SgpkwemEjaHmVrq/Oh865KYw3PZkz9s58OaLZjfRvfRwDm9d
	jR2pXo9UA6/dXR4Qf4/AM4o1s8c+eGIlGT373VwcjwE/WALMEGrD8skESvC25g+r0SdQGk
	B0bITgR410UOthZfQxqVVfM2M+jF/S/Ezj9FL3rYJqadhVNTga4EGrP3huJy+/oXRPjTGi
	nBodxwyqePQBIVUlEwF8S1yK025KKHGrWEu6Yv9S0d7c7RyGd22KeGROksRRkRliKeIYd/
	ar1LhlRPnlMNifYrDg64SYHIBD55Z4Z1wlYW4BGZNtxrCK31SEVVrDkRFtKEQw==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>
Subject:
 Re: [XEN PATCH] libxl: Fix device_add QMP calls with QEMU 9.2 and newer
Date: Mon, 09 Mar 2026 17:20:30 +0100
Message-ID: <1983406.eGJsNajkDb@localhost>
In-Reply-To: <aa7d1kCW8HNejCgQ@l14>
References:
 <20251215135124.11410-1-anthony@xenproject.org>
 <2692705.Lt9SDvczpP@localhost> <aa7d1kCW8HNejCgQ@l14>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 7928823CA06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[daemonizer.de,reject];
	CTE_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[daemonizer.de:s=202303];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[maxi@daemonizer.de,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxi@daemonizer.de,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[daemonizer.de:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Monday, 9 March 2026 15:48:55 CET Anthony PERARD wrote:
> On Thu, Feb 19, 2026 at 02:29:07PM +0100, Maximilian Engelhardt wrote:
[...]
> > Can this patch be picked for the stable branches? I'm in particular
> > interested in 4.20 which is in Debian stable.
> 
> Done, thanks.

Thanks also.

We meanwhile got two reports in Debian from people running into that issue 
(plus me), so it's good to see it fixed.

We will pull the fix with the next xen update in Debian (but not yet the 
upcoming 13.4 point release), which we always base on the upstream stable 
branch.

Maxi



