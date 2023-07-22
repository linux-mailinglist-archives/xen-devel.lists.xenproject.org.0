Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5DB75D812
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 02:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567758.887239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0GA-0007gx-RF; Sat, 22 Jul 2023 00:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567758.887239; Sat, 22 Jul 2023 00:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0GA-0007fD-O2; Sat, 22 Jul 2023 00:14:10 +0000
Received: by outflank-mailman (input) for mailman id 567758;
 Sat, 22 Jul 2023 00:14:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thWI=DI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qN0G9-0007f0-4M
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 00:14:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab76de93-2824-11ee-8611-37d641c3527e;
 Sat, 22 Jul 2023 02:14:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3028D61DAE;
 Sat, 22 Jul 2023 00:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02F7C433C7;
 Sat, 22 Jul 2023 00:14:03 +0000 (UTC)
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
X-Inumbo-ID: ab76de93-2824-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689984844;
	bh=8sKC9ALdSao9tdX0iZmb79JF5NWrKuz1wihTRG1+SYs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JjAMBOB49+JbBl28mjnMTk4Gg66EqB8v+KJhva5OAgfghJOOLxss1IGKhI4tSReBu
	 WszjJHqOB2ecCDxISYuNtIH4P8yvTTOsEDPzzGGDHbagUIvOzQG5d8rLPJYUpvDQix
	 PpsyOMPamqqxOaWlJ8QcrT3Xkrm2ules2n98C2MrrYlKM0jNe8eY9Zh7VhVFfm34Os
	 OztYZfthvuPXINPRxZ+05K+KcYhrrvbKhpaXYIsZf/OEPfdCMcbi5TIBb3NEOnAwQV
	 YlncX4UH61lGdQaGrmqJ+J7rQeaaLZj53FVC560iEgedTJIBlKa6RWrKENo+ALejQP
	 tBdXAfBME1AWw==
Date: Fri, 21 Jul 2023 17:14:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    "committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
In-Reply-To: <ZLsd3tdSvTLwIyt3@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2307211712430.3118466@ubuntu-linux-20-04-desktop>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com> <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com> <ZLVLaPeyOwDYYUXL@mail-itl> <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop> <ZLsd3tdSvTLwIyt3@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-162608396-1689984844=:3118466"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-162608396-1689984844=:3118466
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 22 Jul 2023, Marek Marczykowski-Górecki wrote:
> On Fri, Jul 21, 2023 at 04:42:11PM -0700, Stefano Stabellini wrote:
> > On Mon, 17 Jul 2023, Marek Marczykowski-Górecki wrote:
> > > On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper wrote:
> > > > On 17/07/2023 2:09 pm, Marek Marczykowski-Górecki wrote:
> > > > > "staging" branch is mirrored (automatically or manually) to several
> > > > > repositories. Avoid building it several times to not waste runner
> > > > > resources.
> > 
> > Hi Marek,
> > 
> > Let me try to understand the use-case a bit better. You would like the
> > following "staging" branch to run a full pipeline:
> > https://gitlab.com/xen-project/xen
> > 
> > But if someone under xen-project/people is mirroring
> > https://gitlab.com/xen-project/xen, this patch is attempting to skip the
> > additional pipeline. For instance, if I am mirroring staging in my
> > personal repo:
> > 
> > https://gitlab.com/xen-project/people/sstabellini/xen
> > 
> > We are skipping the additional pipeline there.
> 
> Yes.
> 
> > Is that correct? If so, it would be easier to ask everyone to make sure
> > they have "Trigger pipelines for mirror updates" unselected:
> > 
> > https://docs.gitlab.com/ee/user/project/repository/mirror/pull.html#trigger-pipelines-for-mirror-updates
> 
> If that's set in gitlab as pull mirror (instead of push from somewhere
> else), then that indeed may be enough. But is it really in all those
> cases?

Yes, it is an option in the pull mirror, by default should be unselected
I believe.
--8323329-162608396-1689984844=:3118466--

