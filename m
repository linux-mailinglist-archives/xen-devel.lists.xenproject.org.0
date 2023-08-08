Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B19C774CBB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 23:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580464.908681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTU2h-0004ES-Cy; Tue, 08 Aug 2023 21:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580464.908681; Tue, 08 Aug 2023 21:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTU2h-0004CI-A6; Tue, 08 Aug 2023 21:15:03 +0000
Received: by outflank-mailman (input) for mailman id 580464;
 Tue, 08 Aug 2023 21:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiCO=DZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTU2g-0004Bt-Eu
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 21:15:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1659fe9-3630-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 23:14:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 400E762D2D;
 Tue,  8 Aug 2023 21:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA7BC433C7;
 Tue,  8 Aug 2023 21:14:56 +0000 (UTC)
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
X-Inumbo-ID: a1659fe9-3630-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691529297;
	bh=eRLrTUS7VX4+Uznzq3r36Rqo2PTybBhEnPNzTP/L9yE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VtfyeHb81VAvzF3qGjzp+2NOcpzrZoBABTyzM0BrSwyobMOD9aIYq8V9ofbaeD3rH
	 r38fnPotp+kKCJgm/V1QkuRqxyqAJhtMZbFbs3zlOlSdqsP0KyDWuZi7obZ3Ko9iR4
	 RuRSzOmUvaBP2b5LJUiK6VekzspUTLnm8NDm3DXlYNKlF4hcExCCVe6nv3VK+jhLK1
	 D/IUSU5h6UX9GE7rWbldvtguV/J+FD97A1XJbPiQN2ETKCgbTuR3+p6Ae4d3UkO6or
	 Y6q40dkalrpzegzrOTYy0Tnp2xnXkuC0evQZPUkIDbVsej2KphtnbdjNj91FX8iBf6
	 EKx/i7Nyi/kRA==
Date: Tue, 8 Aug 2023 14:14:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
In-Reply-To: <6aac7add-544b-4c8a-b397-2a6b6c6b766c@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308081401400.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com> <db2ac35e-b371-4537-9d56-8703e3648abe@xen.org> <5135e7ac-1025-3a45-7cf6-d049a15b8df5@suse.com>
 <be588477-cafd-4875-aeef-9b17206a5cc5@xen.org> <cde2ae86db8ba9a86ce5afdb9f47a4e4@bugseng.com> <6aac7add-544b-4c8a-b397-2a6b6c6b766c@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Julien Grall wrote:
> On 08/08/2023 16:53, Nicola Vetrini wrote:
> > > > ... "return" alone already tells the compiler that "break" is
> > > > unreachable. You don't need unreachable() for that. As said before,
> > > > "break" like this simply want purging (and Misra is wrong to demand
> > > > "break" everywhere - it should instead demand no [unannotated]
> > > > fall-through, which can also be achieved by return, continue, and
> > > > goto).
> > > 
> > > My suggestion was in the context of this series where we add
> > > ASSERT_UNREACHABLE() before break. From my understanding, we don't
> > > have a lot of leeway here because, from what Nicola wrote, rule 16.3
> > > is mandatory.
> > > 
> > > So I think using unreachable is better if we every decide to use break
> > > after return.
> > > 
> > > Cheers,
> > 
> > 16.3 is not Mandatory, just Required.
> 
> Ah I misread what you wrote. In that case...
> 
> > I was just reluctant to knowingly add one more violation
> > while fixing another before submitting the patch. If indeed 16.3 won't
> > likely be adopted by Xen,
> > then that break should indeed go away.
> > 
> > However, the main thing that's holding me back from doing a slimmed-down v2
> > here is that
> > evidently there's no consensus even on the ASSERT_UNREACHABLE() patches.
> 
> ... I agree with the following statement from Jan:
> 
> "it should instead demand no [unannotated] fall-through, which can also be
> achieved by return, continue, and goto"

I also think it is a better idea to have no unannotated fall-through in
switch statements (unless we have a "case" with nothing underneath, so
two cases next to each other). In other words the following are all OK
in my view:

  case A:
    do();
    break;
  case B:
    do();
    return true;
  case Ca:
  case Cb:
    goto fail;
  case D:
    i++;
    continue;
  case E:
    do();
    /* fall-through */
  case F:
    do();
    break;

While the following is not OK:

  case A:
    do();
  case B:
    do();

This should be what we already do in Xen, although it is not documented
properly. Jan, Julien do you agree?

If so, could Eclair be configured to check for this pattern (or
similar)?

We must have one of the following:
- break, continue, return, goto
- /* fall-through */
- empty case body (case Ca/Cb)

