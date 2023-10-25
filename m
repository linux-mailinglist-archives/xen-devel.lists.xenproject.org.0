Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227287D7816
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 00:38:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623362.971177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmWD-0006u8-LL; Wed, 25 Oct 2023 22:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623362.971177; Wed, 25 Oct 2023 22:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvmWD-0006rL-I3; Wed, 25 Oct 2023 22:38:29 +0000
Received: by outflank-mailman (input) for mailman id 623362;
 Wed, 25 Oct 2023 22:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvmWC-0006rD-MF
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 22:38:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 368c678d-7387-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 00:38:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 236186319B;
 Wed, 25 Oct 2023 22:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE80C433C8;
 Wed, 25 Oct 2023 22:38:23 +0000 (UTC)
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
X-Inumbo-ID: 368c678d-7387-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698273505;
	bh=YuNHdw8A/UNYaHfQLHZoQpn05c/g+xHoSePvYbdlawk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rl9BUDJbdd3S0uqO0b7fmB4MtG/b3hyLk0O+KXilF98wmFP3oTBogUwEPRD1M+vWV
	 h92iK/BmHc0UEx8jPZhCEaL2+vJf/30lZQ8+rKj398EmMFKE3x0/8O0R7bym0fYSjw
	 z0X47jYcjJjcH+o2awyxZ8YYolP/vf6c3XRWVObCFNhs995ei0lHKFBSraQsXxptAJ
	 3YmkHo9JOWMwXQAsyx1JvVAzLe7qL4j1vnrKARTh6PLoWARrQ1fr3RKL8ewah8GNXG
	 XOrVbAjIM/rBN/VZdKyL3T7qWdXaFh1tesGKJGTsHEGVg1pUT24b3k+fB+nmEBuQ8+
	 giy+0ZgQ3Tyvw==
Date: Wed, 25 Oct 2023 15:38:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
In-Reply-To: <96dd7efb-c214-2155-c5d1-3b9a47c10d33@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310251537460.271731@ubuntu-linux-20-04-desktop>
References: <cover.1697815135.git.nicola.vetrini@bugseng.com> <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com> <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com> <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
 <6d113a237846c7a41aa083e806f172e7@bugseng.com> <5475d9e5-ec1c-7f71-ee77-59ec2e6ee01e@suse.com> <alpine.DEB.2.22.394.2310231340320.3516@ubuntu-linux-20-04-desktop> <dd33e92f-03aa-cf3c-23d7-dcf9cce23c8e@suse.com> <2f88afb2383b5fdecf83d311ebe69bb4@bugseng.com>
 <96dd7efb-c214-2155-c5d1-3b9a47c10d33@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Jan Beulich wrote:
> On 25.10.2023 16:50, Nicola Vetrini wrote:
> > Ok, I'll send a revised version using MASK_LOWEST_BIT, taking into 
> > account also the
> > other comments about the explanation on the macro definition
> > (which some IDEs even show when hovering on its usage, which could 
> > partially address
> > the latter concern).
> 
> You're of course free to do so, but since - as indicated before -
> MASK_LOWEST_BIT() imo isn't a better name than LOWEST_BIT(), I'll
> continue to object.

Jan if you are OK with that I'll ask Julien to break the tie and pick
the name to use. Julien can you please help us move forward?

