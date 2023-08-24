Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3367787A9A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 23:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590333.922590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZI1K-0004kL-8s; Thu, 24 Aug 2023 21:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590333.922590; Thu, 24 Aug 2023 21:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZI1K-0004if-5b; Thu, 24 Aug 2023 21:37:38 +0000
Received: by outflank-mailman (input) for mailman id 590333;
 Thu, 24 Aug 2023 21:37:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZI1H-0004iY-RW
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 21:37:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb2e37b-42c6-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 23:37:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6C8F625C0;
 Thu, 24 Aug 2023 21:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC416C433C8;
 Thu, 24 Aug 2023 21:37:29 +0000 (UTC)
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
X-Inumbo-ID: 6eb2e37b-42c6-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692913051;
	bh=aQXBuYMvPVZfXsWe9nTY1athPdGWi1r3x5hqaCM1Hk0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NhFsCYnhDhfHoCHFlOfaG/Jm6udLtx1Gnj3Pw+hSSzQEhRcf+Q8yXy7tmpxjbCJut
	 V+RSzWuwZYDM4l7kzob4sHekHwYyZoYd2cH1CeHCnvGZuAK6TeDFkLa3u8MSVx24lY
	 +zDufjKxuphB86kRO5tgevJckTHRvH4w8qvMsoU0Mr3OHfVUU74/+tXWN9O+xoFu4v
	 XYogieyv65v1pSeDUlenBCPaM7QH4rhBLAanToPZJAN1KcW+kzF4IAoYeXLExhMAkr
	 StjFM+TBk5+vAa9SW5ehAzWBVp6rjKEoGQ/9n+MU6+LaL8Ux7gntrprz69I+Tsy7Lu
	 QMW2sxkwBavLg==
Date: Thu, 24 Aug 2023 14:37:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: tamas@tklengyel.com
cc: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org, 
    consulting@bugseng.com, jbeulich@suse.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 06/13] xen/mem_access: address violations of MISRA
 C:2012 Rule 7.3
In-Reply-To: <14f3796e-d591-1eb0-7188-8bb44bc582b9@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308241437230.6458@ubuntu-linux-20-04-desktop>
References: <cover.1691053438.git.simone.ballarin@bugseng.com> <7e4ff67a24206177c5a304055f395cc2983bb994.1691053438.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2308031746340.2127516@ubuntu-linux-20-04-desktop>
 <14f3796e-d591-1eb0-7188-8bb44bc582b9@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Tamas, is it possible that you are not actually subscribed to xen-devel
with your email tamas@tklengyel.com  ?

Sorry for top-posting I wanted to make sure Tamas saw this.


On Thu, 24 Aug 2023, Jan Beulich wrote:
> On 04.08.2023 02:47, Stefano Stabellini wrote:
> > On Thu, 3 Aug 2023, Simone Ballarin wrote:
> >> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> >>
> >> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
> >> states:
> >> "The lowercase character 'l' shall not be used in a literal suffix".
> >>
> >> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
> >> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
> >>
> >> The changes in this patch are mechanical.
> >>
> >> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> >> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I notice this again was committed with an ack by Tamas which has never appeared
> on list. At that time I pointed out that the reason may have been connected to
> the mail (as you had forwarded) having been a HTML one.
> 
> Yet then looks like the same has happened to me, with "Re: Ping: [PATCH]
> mem-sharing: move (x86) / drop (Arm) arch_dump_shared_mem_info()". I can't find
> record of this in the list archive. And that mail, from all I can tell, was a
> plain text one.
> 
> George, for the earlier instance Stefano had Cc-ed you, apparently on the
> assumption that you might be able to do something about this, or initiate that
> something be done. Is there anything that was found out? Just in case I'll
> attach the mail I did receive.
> 
> I also wonder what other mails from you, Tamas, may not have appeared on list,
> and instead were (presumably) only delivered to people explicitly Cc-ed.


