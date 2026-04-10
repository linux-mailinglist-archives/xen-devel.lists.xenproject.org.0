Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b7x1O2g/2GnhaQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 02:08:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653073D0B7F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 02:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278216.1563142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAzPh-0005Yc-4g; Fri, 10 Apr 2026 00:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278216.1563142; Fri, 10 Apr 2026 00:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAzPh-0005WE-1t; Fri, 10 Apr 2026 00:07:57 +0000
Received: by outflank-mailman (input) for mailman id 1278216;
 Fri, 10 Apr 2026 00:07:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wAzPg-0005W8-9R
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 00:07:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAzPe-00AcVV-0K
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 02:07:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69d83f12-2eae-0a2a0a5409dd-0a2a450be9a6-48
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:07:55 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <sstabellini@kernel.org>)
 id 69d83f59-bca8-0a2a450b0019-aceafc1fdd72-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:07:55 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 337E0438CA;
 Fri, 10 Apr 2026 00:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2885DC4CEF7;
 Fri, 10 Apr 2026 00:07:52 +0000 (UTC)
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
	s=k20201202; t=1775779673;
	bh=J9eE0IfMExM5GO3+0tjrn1qX87H+H2jmgNPBdEUsm3E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o9GZDfCdgI9++ImF51a1TRXVTXeEHqwYQrqFAO+QospzWEq1KhcIvx6nR1uIXFOeb
	 1JVVikRcDMqSQfgGAgMxHLhzo8CJ+UuB8rcuNB3+d8PTsLnT4kRhtcF8uVk/j26jIT
	 r2G5NLJvstF34bgpfHsEJ3ttfGYFqKiNb6wcayR+NsJB7T8R54gQe6KwCEBa/KFQPi
	 zEfvtIG1ZO3iGZcdDnEg2Ru0SzBD6qKfuepzf7AbBD5+1LR4jMuX5GoCuBuYRtrELy
	 gTMA+7xYaimRzOqNKx3bDEF4atLBv+Lv9hJ3Gz1FTa5btywGrwfdSN5uKIibPQ04xU
	 7ntUkPpdsMpAQ==
Date: Thu, 9 Apr 2026 17:07:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: gic-v3: Use vsize instead of csize for
 virtual CPU interface
In-Reply-To: <995B8A68-0DE0-4FE8-AC80-21E5DE498170@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604091707430.2873990@ubuntu-linux-20-04-desktop>
References: <20260409113934.197619-1-michal.orzel@amd.com> <20260409113934.197619-4-michal.orzel@amd.com> <995B8A68-0DE0-4FE8-AC80-21E5DE498170@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-42698a/1775779675-175432A1-30903594/0/0
X-purgate-type: clean
X-purgate-size: 652
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 653073D0B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > gicv3_iomem_deny_access() incorrectly uses csize (physical CPU
> > interface size) instead of vsize (virtual CPU interface size) when
> > calculating the number of pages to deny for the virtual CPU interface
> > region at vbase.
> > 
> > Fixes: 8300b3377e ("arm/gic: Add a new callback to deny Dom0 access to GIC regions")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

