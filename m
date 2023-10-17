Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3D07CB7BF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 03:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617970.961152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYUQ-0005MM-OS; Tue, 17 Oct 2023 01:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617970.961152; Tue, 17 Oct 2023 01:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYUQ-0005J3-KU; Tue, 17 Oct 2023 01:03:18 +0000
Received: by outflank-mailman (input) for mailman id 617970;
 Tue, 17 Oct 2023 01:03:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFgi=F7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qsYUP-0004bB-3t
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 01:03:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f274833a-6c88-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 03:03:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4B6C3CE19A1;
 Tue, 17 Oct 2023 01:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8106C433C7;
 Tue, 17 Oct 2023 01:03:07 +0000 (UTC)
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
X-Inumbo-ID: f274833a-6c88-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697504588;
	bh=r6peTUbeu+FBL2dfOuzxA5dAAeC0Fx9l+Pd+mXmzXZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VlZoSACgRe6FtpTx6ZB7dfHyrMtXxr85au++EDmdIh0jtb3XiFZQEDjpaqioGOU9M
	 Yhicste5NAaWsCfZCQAxLLAtCH1bXxeAIFWg+IHhzNKiZKp1b8CmuMbCIvEgDLDeJo
	 G+ED6dD+JCFxRIgM3rmqrW8qcJYkAdQ3KB4N2fgplU3atguQPWR2x+HWg5JULy9Oah
	 YgpFnwE4G8zlrtiVgD+C3nNbZZCo6E9TByAhxNid9VkJToCr6j2tkV1U8Dg+eegZFf
	 LJSRFYHXqrGV4I2EXW4o5KkMLLS6ltAg2oMazIjuKBsQfJG46W4gH9UCyKXotX9wo7
	 BMlUtYBWxOrsQ==
Date: Mon, 16 Oct 2023 18:03:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 02/10] arm/cpufeature: address violations of MISRA
 C:2012 Rule 8.2
In-Reply-To: <0e5a8d7a-4003-41a1-a041-8c8765351cb6@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310161802370.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <3b28dca993cac9391b997c1744218cf4062907df.1697207038.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2310131610440.965337@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2310131633520.965337@ubuntu-linux-20-04-desktop> <0e5a8d7a-4003-41a1-a041-8c8765351cb6@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Oct 2023, Julien Grall wrote:
> On 14/10/2023 00:34, Stefano Stabellini wrote:
> > On Fri, 13 Oct 2023, Stefano Stabellini wrote:
> > > On Fri, 13 Oct 2023, Federico Serafini wrote:
> > > > Add missing parameter names, no functional change.
> > > > 
> > > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > > ---
> > > >   xen/arch/arm/include/asm/cpufeature.h | 8 ++++----
> > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/xen/arch/arm/include/asm/cpufeature.h
> > > > b/xen/arch/arm/include/asm/cpufeature.h
> > > > index 8011076b8c..41e97c23dd 100644
> > > > --- a/xen/arch/arm/include/asm/cpufeature.h
> > > > +++ b/xen/arch/arm/include/asm/cpufeature.h
> > > > @@ -127,8 +127,8 @@ static inline void cpus_set_cap(unsigned int num)
> > > >   struct arm_cpu_capabilities {
> > > >       const char *desc;
> > > >       u16 capability;
> > > > -    bool (*matches)(const struct arm_cpu_capabilities *);
> > > > -    int (*enable)(void *); /* Called on every active CPUs */
> > > > +    bool (*matches)(const struct arm_cpu_capabilities *caps);
> > > 
> > > all the implementations of matches I found in xen/arch/arm/cpuerrata.c
> > > actually call the parameter "entry"
> > > 
> > > 
> > > > +    int (*enable)(void *ptr); /* Called on every active CPUs */
> > > 
> > > this one instead is "data"
> > 
> > I committed all the other patches in this series to the my for-4.19 branch
> 
> I have left some comments in patch #1. Given this is not the latest master, I
> think we should consider to remove/replace the patch rather than introducing a
> follow-up.

Makes sense. I took out patch #1 of this series and also took the
opportunity to rebase 4.19 on the latest staging

