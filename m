Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCAuF6iRB2pU9AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 23:35:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142A655833F
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 23:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310565.1581410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wO0Bo-0007y7-C8; Fri, 15 May 2026 21:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310565.1581410; Fri, 15 May 2026 21:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wO0Bo-0007vM-8Z; Fri, 15 May 2026 21:35:24 +0000
Received: by outflank-mailman (input) for mailman id 1310565;
 Fri, 15 May 2026 21:35:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wO0Bn-0007vG-02
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:35:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wO0Bj-009dCH-84
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 23:35:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a07915d-e002-0a2a0a5209dd-0a2a4502ca5c-30
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 23:35:19 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a079195-af86-0a2a45020019-aceafc1f8bfe-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 23:35:19 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE03F42AA5;
 Fri, 15 May 2026 21:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8470BC2BCB0;
 Fri, 15 May 2026 21:35:16 +0000 (UTC)
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
	s=k20201202; t=1778880916;
	bh=ftlewtpiRRoR/qom8h5/jd2k/GrWT6YH1B/pN2hcQqI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pTU9a3SiwqlhBWPW9w1mwn2zAJA7nimm3DoniIaNSHThP9BctlZntIDAIiQcYWREK
	 AOnJ+bdIQ6pzEQICCH2/+ZLTuyrVVuwQL8fpJh/DEgBxON0P4rXySiudU1QII3xexH
	 LCGtf8zbMOv298GvxsZzMWKPQ1yD1Sih5NLiYGPFlmmUCaucULzvWijkkh1D7OiMFh
	 Q1A/wjyFCl9JW8qME65CtYIOJHEGIkQwJSGxY8DzB1gyXUZyc3aGwEOuN2GIx3C5Er
	 gAg7TSKcOogYK7IykI6+eSJbl+EfzcOa4LSdkGrb3Lzs9fbQg56U5IYkGPXQxDmwHd
	 hdGbA9GcHPuzQ==
Date: Fri, 15 May 2026 14:35:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Mykola Kvach <xakep.amatop@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Mykola Kvach <mykola_kvach@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
Subject: Re: [PATCH] arm/gicv3: Detect normal NC ITS command queues
In-Reply-To: <05997446-AB81-433D-84D9-48A5FBE1D62D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2605151434470.52999@ubuntu-linux-20-04-desktop>
References: <4d72da78b9c30f5da62c8e03c3b03a01c24101eb.1778836836.git.mykola_kvach@epam.com> <05997446-AB81-433D-84D9-48A5FBE1D62D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1778880919-8057B161-A0FE682A/0/0
X-purgate-type: clean
X-purgate-size: 1813
X-Rspamd-Queue-Id: 142A655833F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,epam.com,kernel.org,xen.org,arm.com,amd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,epam.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Oleksii, can we have a release ack on this fix?

On Fri, 15 May 2026, Luca Fancellu wrote:
> Hi Mykola,
> 
> > On 15 May 2026, at 10:40, Mykola Kvach <xakep.amatop@gmail.com> wrote:
> > 
> > From: Mykola Kvach <mykola_kvach@epam.com>
> > 
> > GITS_CBASER.InnerCache uses the GIC BASER cacheability encoding.
> > Both 0b000 (Device-nGnRnE) and 0b001 (Normal Inner
> > Non-cacheable) describe non-cacheable accesses to the command queue.
> > 
> > its_map_cbaser() only checked whether the shifted field was zero,
> > so an ITS that reports Normal Inner Non-cacheable would not set
> > HOST_ITS_FLUSH_CMD_QUEUE. Decode the field before comparing it with
> > the unshifted enum value, matching the handling of ITS BASER tables
> > and GICR_PROPBASER.
> > 
> > Fixes: 8ed8d21373be ("ARM: GICv3 ITS: map ITS command buffer")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > xen/arch/arm/gic-v3-its.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index 9005ce8ce5..7560d46c6d 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -424,7 +424,8 @@ static void *its_map_cbaser(struct host_its *its)
> >      * If the command queue memory is mapped as uncached, we need to flush
> >      * it on every access.
> >      */
> > -    if ( !(reg & GITS_BASER_INNER_CACHEABILITY_MASK) )
> > +    if ( MASK_EXTR(reg, GITS_BASER_INNER_CACHEABILITY_MASK) <=
> > +         GIC_BASER_CACHE_nC )
> >     {
> >         its->flags |= HOST_ITS_FLUSH_CMD_QUEUE;
> >         printk(XENLOG_WARNING "using non-cacheable ITS command queue\n");
> > -- 
> > 2.43.0
> > 
> > 
> 
> Looks ok to me
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


