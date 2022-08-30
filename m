Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 519065A6AB0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 19:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395118.634695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT55r-0007pY-Tu; Tue, 30 Aug 2022 17:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395118.634695; Tue, 30 Aug 2022 17:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oT55r-0007nj-Qs; Tue, 30 Aug 2022 17:32:07 +0000
Received: by outflank-mailman (input) for mailman id 395118;
 Tue, 30 Aug 2022 17:32:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oT55q-0007nd-HH
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 17:32:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa07cc6c-2889-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 19:32:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 59CF06136C;
 Tue, 30 Aug 2022 17:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04F4C433B5;
 Tue, 30 Aug 2022 17:32:03 +0000 (UTC)
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
X-Inumbo-ID: aa07cc6c-2889-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661880724;
	bh=0f7uIOcyYIxEFVndL8PNhpx3oFyNsiSYaRvG0TyzdWM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YeadI+ITj4dMbfJ/W1zurBI2eV0NY0OlNjmNpfqewO2vFyzJGgOu3OsBd5LJLaLEv
	 /x8Bmbgs4fDjU/0emf+avFqPKY14NyJFweF9BnbH8HP93PA9rXUaAqN6wcQXGsHlFf
	 eE718o6UGuOrcPEjbF4Fohs3xM/Syrm4HcTeJTQ4gc7dbH8z0+w61Z71jgDb9h1xp+
	 vlkZM2CP1dQjp+moe5RxHPcgSOFPhTMeQe/ynmxpF7MTvSDAgVqVamf+pdp17J+0vY
	 XrzLakmZoz58znDRFDnbI3raWdCk/XKRfF5CkbU8DdJYNjLbYGOuJ/7H4lXWSSd+IF
	 5h9bUBy7n2B0w==
Date: Tue, 30 Aug 2022 10:32:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
In-Reply-To: <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2208301030110.1134492@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-3-Henry.Wang@arm.com> <59f69736-a18c-9d08-94dd-791bd264d671@amd.com> <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com> <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Aug 2022, Henry Wang wrote:
> Hi Michal,
> 
> > -----Original Message-----
> > From: Michal Orzel <michal.orzel@amd.com>
> > >>>
> > >> Did you consider putting reserved_heap into bootinfo structure?
> > >
> > > Actually I did, but I saw current bootinfo only contains some structs so
> > > I was not sure if this is the preferred way, but since you are raising this
> > > question, I will follow this method in v2.
> > This is what I think would be better but maintainers will have a decisive vote.
> 
> Then let's wait for more input from maintainers.

I don't have a strong preference and the way the current code is
written, it would actually take less memory as is (the extra bool
xen_heap comes for free.)

I would keep the patch as is for now and for 4.17.

If Julien prefers a refactoring of bootinfo/meminfo I think it could be
done after the release if you are up to it.

