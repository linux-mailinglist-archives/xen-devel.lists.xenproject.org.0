Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBU3AFqEwmkAegQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:32:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A606C30846D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260622.1553879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50vZ-0004OG-Qk; Tue, 24 Mar 2026 12:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260622.1553879; Tue, 24 Mar 2026 12:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50vZ-0004Ls-O5; Tue, 24 Mar 2026 12:32:09 +0000
Received: by outflank-mailman (input) for mailman id 1260622;
 Tue, 24 Mar 2026 12:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+PK3=BY=kroah.com=greg@srs-se1.protection.inumbo.net>)
 id 1w50vY-0004LP-Hi
 for xen-devel@lists.xen.org; Tue, 24 Mar 2026 12:32:08 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75641abe-277d-11f1-b166-2bf370ae4941;
 Tue, 24 Mar 2026 13:32:04 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 3968D7A00D9;
 Tue, 24 Mar 2026 08:32:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 24 Mar 2026 08:32:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Mar 2026 08:32:00 -0400 (EDT)
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
X-Inumbo-ID: 75641abe-277d-11f1-b166-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774355521; x=1774441921; bh=4/kIAkzXCa
	EwyFMWc/BA68EXScKywCVPhm+DDXoZ4JI=; b=fLwuWhYw1wYgcbmS1iao0VKwIQ
	tmw+L/6Bs8aSDk1Rvz7cljScuD/kTOIH/uhzgnItR1TIxwdNsSu+OoJPwOTTIsOi
	3dcZTMxqg0EWSSwNKqocPITA+17Thb/q874T94yPd9unEmQypQBS4x1iATcygKlY
	9GLH9h1NefrfOCA7us9FQIN4Bnjqe0S6+uQnEixGo6K+QTLirZKjePxTf0j8FyFV
	C9fkTFn5pcIRhuOR7jtiHG+0BlyrheKUmgym9pySLF+X2QoD501aRVhka4L5ZXEW
	kAzPxVl22kiNQHJCjbsuBgjDGPxHgMeOrmwntYHLMl8koIQES38Kd76FEaFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774355521; x=1774441921; bh=4/kIAkzXCaEwyFMWc/BA68EXScKywCVPhm+
	DDXoZ4JI=; b=ceLFBZdg29TmDjfTz8rckQGNCeaVEyrp5CnE+oPpYZXwtzglFq2
	//lcToFb8K3RosW0PA0Ff7ujLhjaPd5MCIu5bN/RXQW+ozN1zSNqKo8f65sfQeTt
	idjkyMizfzLXBNHO9TqvcMT7LC5Xl7D5/gLeSBdWh91yoFoA+Q0tdgllI41VBX+I
	c/qFdLOAea18ZhpYEg59QJtNJjqlm8XG1icPAKzzPGkUM+JYd78lhQoLN+gE4p0J
	qLhZWwGJNfMlEhhwJgEd3OWm0GSDYtOsMU3aoZbOSMoOSWwgIH3fnjRJNEphLX54
	Qx36S2CA4/MJW3J0fVh8TJZZIf+3DJBknvg==
X-ME-Sender: <xms:QITCaYqNrPxCchsa687cnOIK3VRjabzDzpOvSMKvHCnZB9PvR1yhHw>
    <xme:QITCaQN9iPbWxhSIdDgRGiIp_Tq3guFR4_BXmtSohJb07INMgvtr5MF03kk8iEWtt
    mcQiaquSqg3NymD4zNbIddzWVmD64o4Vk9kAwzVaMzk4aGIdA>
X-ME-Received: <xmr:QITCaceCvLfaAIb4L32XRHTHzCdH1mylZit0AbPmEN1QToERILNqq2NSnhQt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdduheekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:QITCaWVKNeXD9m7ctI0a5hWaFXLjK3A7jeT0sPMtrzL5ku9fdjAeaA>
    <xmx:QITCadB4PG0Ou5_2Bxq4QoBrBy4MJif-yJjWAUuLrOHlpjlGLMe6jw>
    <xmx:QITCaR7PdOmIYkz4pW66m0dckGv3zCAePyr84jt5_QbWcdSkTLhUlA>
    <xmx:QITCaU1Facm1VeN-2P1LucXwAc2O4PegjPipqZxe2CQ857vhuPv7nQ>
    <xmx:QYTCafDPfpus8IGGyZqrOu839Hrg5YALwiqbLxxynpKi33xvFFUDogu->
Feedback-ID: i787e41f1:Fastmail
Date: Tue, 24 Mar 2026 13:31:38 +0100
From: Greg KH <greg@kroah.com>
To: oss-security@lists.openwall.com
Cc: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
	xen-users@lists.xen.org,
	"Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 482 v2 - Linux privcmd
 driver can circumvent kernel lockdown
Message-ID: <2026032405-faculty-agony-2599@gregkh>
References: <E1w50W0-00Bwo0-1i@xenbits.xenproject.org>
 <2026032453-departed-thrash-f153@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026032453-departed-thrash-f153@gregkh>
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:oss-security@lists.openwall.com,m:xen-announce@lists.xen.org,m:xen-devel@lists.xen.org,m:xen-users@lists.xen.org,m:security-team-members@xen.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[greg@kroah.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:url,kroah.com:dkim,messagingengine.com:dkim];
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
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A606C30846D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 01:16:08PM +0100, Greg KH wrote:
> On Tue, Mar 24, 2026 at 12:05:44PM +0000, Xen.org security team wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA256
> > 
> >                     Xen Security Advisory XSA-482
> >                               version 2
> > 
> >           Linux privcmd driver can circumvent kernel lockdown
> > 
> > UPDATES IN VERSION 2
> > ====================
> > 
> > Public release.
> > 
> > ISSUE DESCRIPTION
> > =================
> > 
> > The Linux kernel's privcmd driver can be abused to circumvent kernel
> > lockdown (secure boot), e.g. by modifying page tables to enable user
> > mode to modify kernel memory.
> > 
> > The CNA covering Linux has refused to assign a CVE at this juncture.
> 
> This is now assigned to CVE-2026-31788

And, to be more clear, the kernel CNA should have given you a CVE
earlier, sorry about that, that was my fault.  We had been "burned" by
other groups/companies asking for CVEs "ahead of time" for Linux for
things that turned out to be wrong or not needing a CVE at all at the
same time you all asked for one, so I reacted much harsher here than you
all deserved by saying we would assign one once the issue was public.  I
should have trusted you as obviously you know what you are doing here
and should have gotten a CVE for your accounting earlier.

Again, my fault, sorry about that, if you all need one in the future for
any issue, we will assign it ahead of time.

greg k-h

