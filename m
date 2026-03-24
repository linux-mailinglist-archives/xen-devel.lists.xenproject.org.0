Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DU/As6AwmlneQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:17:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7AB308079
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:17:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260494.1553798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50gW-0005g4-CH; Tue, 24 Mar 2026 12:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260494.1553798; Tue, 24 Mar 2026 12:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50gW-0005e6-8Y; Tue, 24 Mar 2026 12:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1260494;
 Tue, 24 Mar 2026 12:16:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <greg@kroah.com>)
 id 1w50gU-0005ds-FP; Tue, 24 Mar 2026 12:16:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50gT-006LGu-RD; Tue, 24 Mar 2026 13:16:33 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <greg@kroah.com>)
 id 69c2809f-2eae-0a2a0a5409dd-0a2a4501a62c-6
 for <multiple-recipients>; Tue, 24 Mar 2026 13:16:33 +0100
Received: from [202.12.124.156] (helo=fhigh-b5-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <greg@kroah.com>)
 id 69c2809f-6400-0a2a45010019-ca0c7c9ccf87-3
 for <multiple-recipients>; Tue, 24 Mar 2026 13:16:33 +0100
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id DD4F37A0205;
 Tue, 24 Mar 2026 08:16:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Tue, 24 Mar 2026 08:16:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Mar 2026 08:16:29 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=kroah.com header.i="@kroah.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774354590; x=1774440990; bh=bWcFSwCVPN
	zsCk7pIB4ZzNyRLxmXnF8m1I59uyLy4p4=; b=r5hLWpll9su1TYtuN06CA/8xfD
	4cvvyyfYmhw2Qn8eT01/zXQcpxxxborX/9H8X/DWkIRN27cPsRrTcRyUvzblI+hD
	pYU/lfA2UcAoHgSXA1fh8plMWoE44Qwrcogl4JmykgdJW7OF981L5LIUsi1Uf3O4
	qX4fx5eNYcdqbNntv4jbYxtUTADd38p+aswcvAihKzQz1K813OAQvdKTroKpasHn
	oYpDUw5Z5cJ7LwZa4yIKZqnQmMC5iGC93RLB4/vWqk9pp56f25Mo6e93rnT0lGI0
	bjOcNGPspBDvzdpy7SjCkK0SY6gZNP84zPR23dDbLB2LtDTSvUjvQMJjs3ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774354590; x=1774440990; bh=bWcFSwCVPNzsCk7pIB4ZzNyRLxmXnF8m1I5
	9uyLy4p4=; b=e8In13ggtbu5OWvNnjRBIEDmFFoHmkiCnwdZ5wwo+uKVRmVxvf2
	dK40l0sLAgSMUh309bFKzAzJF7rdTi8QUCZCi4h7GMClvSMjV535Vr0DAVzy8MYO
	oxAvtcyaL5dKbnRBrn7O8xCTFvXBdXwNmU1z2tG5XCYoI1qxIKQT7fUNh7gcbKXK
	yk9pjbbj1XfosyVYVU8RJ57ab0nWpR+QDYbLyMdzd0t+YhuZJomim6xgTRl4GFyf
	ASdo29fLKIaOqdDQ2laAagZBUVhWYZKP7FyxIH1JBxSDeWhaRz7nAz56c0Fp9Izq
	r0ExalDi+HK6j1ACAMswAN403RGU4NXH5Ng==
X-ME-Sender: <xms:noDCabl1RbCMukQTR9sZ7mXxFzt1a9SzuoG8biffpfZbf7Ou3ndIcQ>
    <xme:noDCaQaTkZwdq7H3BKWYRtdYgVZpQiT_5H1bKqsqwlI9qsZnFK-Li0CkD0Y9dokqT
    UUPhE41ivELNBDF-G7vsOnWfMKpYzi3qheC22E-Gpmr16ruJA>
X-ME-Received: <xmr:noDCaQ6UJXhbESbEo1RrL5EF-66ylZteWLXgsPtSSdD7ymoHHD8_IxqhU6IV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdduheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepohhsshdqshgvtghurhhithihsehlihhsthhsrdhophgvnhifrghllhdrtghomhdprh
    gtphhtthhopeigvghnqdgrnhhnohhunhgtvgeslhhishhtshdrgigvnhdrohhrghdprhgt
    phhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnrdhorhhgpdhrtghpthhtoh
    epgigvnhdquhhsvghrsheslhhishhtshdrgigvnhdrohhrghdprhgtphhtthhopehsvggt
    uhhrihhthidqthgvrghmqdhmvghmsggvrhhsseigvghnrdhorhhg
X-ME-Proxy: <xmx:noDCaaBv67Y-DKCr8Izk5mGnGVdKyepT1ybSk4HBX5HqNUhYZ-jCPA>
    <xmx:noDCae9UodmMgiJW_x_8sy4i5fI0SIFjTZygCbQNazYC4a4sbIlU_Q>
    <xmx:noDCaVFivnzCjQEuw0YKXe5GbfVtlx_dLsJjINB5aR4xLRdMM4WbjA>
    <xmx:noDCaQTEAIdgY3s1gTdSe7eU2jqEoet28o_olEaJ26cHBFz9MyOYqQ>
    <xmx:noDCaVMNirIXf5CInnI777AjRf44UisEf2zLwGsLHKpv23DNxTk8hCiY>
Feedback-ID: i787e41f1:Fastmail
Date: Tue, 24 Mar 2026 13:16:08 +0100
From: Greg KH <greg@kroah.com>
To: oss-security@lists.openwall.com
Cc: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
	xen-users@lists.xen.org,
	"Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 482 v2 - Linux privcmd
 driver can circumvent kernel lockdown
Message-ID: <2026032453-departed-thrash-f153@gregkh>
References: <E1w50W0-00Bwo0-1i@xenbits.xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w50W0-00Bwo0-1i@xenbits.xenproject.org>
X-purgate-ID: tlsNG-d62444/1774354593-8ECE3DF3-F7066FAD/0/0
X-purgate-type: clean
X-purgate-size: 738
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oss-security@lists.openwall.com,m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:security-team-members@xen.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[greg@kroah.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,kroah.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: AD7AB308079
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:05:44PM +0000, Xen.org security team wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> 
>                     Xen Security Advisory XSA-482
>                               version 2
> 
>           Linux privcmd driver can circumvent kernel lockdown
> 
> UPDATES IN VERSION 2
> ====================
> 
> Public release.
> 
> ISSUE DESCRIPTION
> =================
> 
> The Linux kernel's privcmd driver can be abused to circumvent kernel
> lockdown (secure boot), e.g. by modifying page tables to enable user
> mode to modify kernel memory.
> 
> The CNA covering Linux has refused to assign a CVE at this juncture.

This is now assigned to CVE-2026-31788

thanks,

greg k-h

