Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D85ED211
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 02:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413083.656577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odKzI-00052P-49; Wed, 28 Sep 2022 00:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413083.656577; Wed, 28 Sep 2022 00:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odKzI-0004zz-15; Wed, 28 Sep 2022 00:31:44 +0000
Received: by outflank-mailman (input) for mailman id 413083;
 Wed, 28 Sep 2022 00:31:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1odKzG-0004zo-Mf
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 00:31:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc79e2e-3ec4-11ed-9648-05401a9f4f97;
 Wed, 28 Sep 2022 02:31:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F95761CCB;
 Wed, 28 Sep 2022 00:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8101C433C1;
 Wed, 28 Sep 2022 00:31:38 +0000 (UTC)
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
X-Inumbo-ID: ebc79e2e-3ec4-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664325100;
	bh=WavEQmSW2PYlhzC+baaXFSiw7W8/lPPErAZ6wbKQVGc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bi0BrAQ9HLVkVWCHvm/o1miRP7lYhte86qeJy1Vz+MvKnAhTy+FM5t74MVfLdIsWp
	 tmNwU9QoH9RSX1Y82DjOKCkF5tQZjjG4EP9rPhpBZ3YhSsCt0a6bTwEa/42ixCwhG6
	 VjDrvxJIGJVS0aBlpcJ3hBiZw1D8FP20BAnarsc/R0e7tUyt3wGrvIZLOgQqnITQWr
	 pvILJ7ovCg0I3sHNoYF+LFW8nUAM5M9nIC7F96VxSKPq0oLHuOD+DCgbBPhzJbP4DN
	 3y1qRkuaDf+xkP5I9tOIU2BOeyyWW/3NWTZODSbzjVoJFDT+WpV27I3giDpypgTNWG
	 fliuO4dpYU3JQ==
Date: Tue, 27 Sep 2022 17:31:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17] Build: Drop -no-pie from
 EMBEDDED_EXTRA_CFLAGS
In-Reply-To: <2d8cc77d-073b-1de4-1ccf-43427529e470@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209271658240.922084@ubuntu-linux-20-04-desktop>
References: <20220927154708.15787-1-andrew.cooper3@citrix.com> <2d8cc77d-073b-1de4-1ccf-43427529e470@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Sep 2022, Jan Beulich wrote:
> On 27.09.2022 17:47, Andrew Cooper wrote:
> > This breaks all Clang builds, as demostrated by Gitlab CI.
> > 
> > Contrary to the description in ecd6b9759919, -no-pie is not even an option
> > passed to the linker.  GCC's actual behaviour is to inhibit the passing of
> > -pie to the linker, as well as selecting different cr0 artefacts to be linked.
> > 
> > EMBEDDED_EXTRA_CFLAGS is not used for $(CC)-doing-linking, and not liable to
> > gain such a usecase.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Perhaps the Reported-by: Stefano should be kept, even if you noticed
> the issue as well?
> 
> I would have preferred a mention of the questionable origin of the
> earlier misspelled -nopie, but I guess I'm not going to insist.


Tested-by: Stefano Stabellini <sstabellini@kernel.org>

and committed

