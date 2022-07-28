Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4D5846B1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 21:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377085.610178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH9bG-0005QD-Qa; Thu, 28 Jul 2022 19:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377085.610178; Thu, 28 Jul 2022 19:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH9bG-0005O2-Nw; Thu, 28 Jul 2022 19:55:14 +0000
Received: by outflank-mailman (input) for mailman id 377085;
 Thu, 28 Jul 2022 19:55:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oH9bF-0005Nw-LN
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 19:55:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30cd7ab9-0eaf-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 21:55:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B995B82536;
 Thu, 28 Jul 2022 19:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21030C433C1;
 Thu, 28 Jul 2022 19:55:08 +0000 (UTC)
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
X-Inumbo-ID: 30cd7ab9-0eaf-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659038109;
	bh=LL9v7BetyvBkSEdx6SYnL5aAMDXNKn+AlWrMlfFRQwE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=osMkBos2wP5U5GINtl6d1bK3i1taRYs+WbYcg+cGJigf4wriTIREHu3et8qMLixWn
	 ICLZ0MkmGqDCXsRQtV2Xan6cEGLk0r7X8O//OMnHxKt18WcLKtgBbOD1W7bwCKCEJA
	 0iioRR98c1CzXeS+Aqb9E9qI9Q8c1e8llo4hCtvlqb0pJLu87bFe7kzgeGBc20R6an
	 DH/5y+VzJbI1VPAH3hyejzJBu0MaY/abuSSau7SNlN4B3AZyVNaUg+cHPtMdC8LEOk
	 APp30d/jlZ53JYytsukAYjUgcngnve5duYhhnnIugeBji7m4L4k4QtNakq9XEmW2d6
	 kyLjhCxsE2W5Q==
Date: Thu, 28 Jul 2022 12:55:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: boyoun.park@samsung.com, "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "julien@xen.org" <julien@xen.org>, 
    "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Chungwoo Park <cww.park@samsung.com>, SoungKwan Kimn <sk.kimn@samsung.com>, 
    DongJin PARK <djpax.park@samsung.com>, Gang Li <gang30.li@samsung.com>, 
    Lei Wang <lei19.wang@samsung.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] xen: add late init call in start_xen
In-Reply-To: <88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2207281251160.4648@ubuntu-linux-20-04-desktop>
References: <CGME20220728092237epcms2p53821bba31388763f45b5204d56520c20@epcms2p5> <97499212.9948800.1659000157467@mail-kr2-3> <88025800-66e2-4fb4-facf-5989e75ba08f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Boyoun,

Thanks for your interest in Xen and thanks for your contribution!


On Thu, 28 Jul 2022, Jan Beulich wrote:
> On 28.07.2022 11:22, Boyoun Park wrote:
> > Hello,
> > 
> > This patch added late_initcall to deal with
> > 
> > some init functions which should be called
> > 
> > after other init functions in start_xen.
> > 
> > If this patch is added,
> > 
> > then the original initcall in xen will be treated
> > 
> > as early_initcall and the late_initcall
> > 
> > which is added by this patch will be
> > 
> > called sequentially.
> > 
> > I cannot send patches through git send-email
> > 
> > due to some security issues in my work.
> > 
> > So intead, I just send the patches manually.
> 
> Which is fine, but you want to configure your mail client such that it
> doesn't mangle the patch. Albeit I see that to cover for that at least
> you've also attached both the patch and a cover letter. For a single
> patch a cover letter can normally be omitted, but if you don't then
> even if you're sending without "git send-email" you will want to send
> both as separate mails, with the patch being a reply to the cover
> letter thread root.

Yeah. Boyoun, if you only have a couple of patches then it is fine to
send them manually. Otherwise, if you have many patches, you can send
them in attachment as tarball and I'll send them all to xen-devel using
git-send-email for you (of course keeping you as original author and
retaining all Signed-off-bys).


> > Subject: [PATCH v1] xen: add late init call in start_xen
> > 
> > This patch added late_initcall section in init.data.
> > 
> > The late initcall would be called after initcall
> > 
> > in the start_xen function.
> > 
> > Some initializing works on priority should be run
> > 
> > in do_initcalls and other non-prioritized works
> > 
> > would be run in do_late_initcalls.
> > 
> > To call some functions by late_initcall,
> > 
> > then it is possible by using
> > 
> > __late_initcall(/*Function Name*/);
> > 
> > Signed-off-by: Boyoun Park <boyoun.park@samsung.com>
> 
> So I could imagine this patch to be in a series where a subsequent
> patch then adds an actual use of the new functionality. Without
> that what you're proposing is to add dead code.

Yeah, I think it would be cool to have late initcalls but it makes sense
to add them if we have someone that makes use of them.

