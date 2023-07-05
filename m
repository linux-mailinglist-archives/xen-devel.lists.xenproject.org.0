Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E41474911F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 00:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559529.874567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBJh-0007KV-8E; Wed, 05 Jul 2023 22:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559529.874567; Wed, 05 Jul 2023 22:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBJh-0007I9-5f; Wed, 05 Jul 2023 22:49:45 +0000
Received: by outflank-mailman (input) for mailman id 559529;
 Wed, 05 Jul 2023 22:49:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHBJg-0007I3-7K
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 22:49:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a386f12-1b86-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 00:49:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EC93615CB;
 Wed,  5 Jul 2023 22:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9626EC433C8;
 Wed,  5 Jul 2023 22:49:38 +0000 (UTC)
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
X-Inumbo-ID: 3a386f12-1b86-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688597380;
	bh=amol4WjrB6hlMYel/91lmijSHoW3Wrghh5fod2Q4kMA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LMSxJr/LPJ7gnd7KDmhmhsUkLH5pDkq6N5aeHo0Gyji4r4G1D2P6mfsaMFLILeH7L
	 ghY9xKqVswzCG+48MIh+g++74afsD3XI32Z9x5O3Et4YK0bxshUV2t7GSsJmYHkp6d
	 tlBSR99Sl044OtMwccwGQxd1kJbn1crcgwlhyKeCXniqjgCVjI92Pjj7LItgReuw6d
	 wKVOTGOLdBGB2N3kYWytcJif2QZjhuFJkFBh7j8kGb3TYAF5XHHRF3Gd8zElFjLtrh
	 Hg4wCV21AHtN5e47qEGYb3xx2fJdXBZRzv+q8xqCF1EMwcwe0n3u9Hz0BZN3Dg+0l3
	 RaFsNMbmYiUbQ==
Date: Wed, 5 Jul 2023 15:49:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 4/5] x86/x86_emulate: change parameter name from 's'
 to 'state'
In-Reply-To: <e7af3c85-92ec-7d0f-0e63-3a1e5d65877e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307051544340.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688049494.git.federico.serafini@bugseng.com> <8c8bc96b96a1111a4651f970f506d304809ea40d.1688049495.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2306291230500.3936094@ubuntu-linux-20-04-desktop>
 <e7af3c85-92ec-7d0f-0e63-3a1e5d65877e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Jul 2023, Jan Beulich wrote:
> On 29.06.2023 21:31, Stefano Stabellini wrote:
> > On Thu, 29 Jun 2023, Federico Serafini wrote:
> >> Change parameter name from 's' to 'state' in function definitions in
> >> order to:
> >> 1) keep consistency with the parameter names used in the corresponding
> >>    declarations;
> >> 2) keep consistency with parameter names used within x86_emulate.h;
> >> 3) fix violations of MISRA C:2012 Rule 8.3.
> >>
> >> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > 
> > You could use x86emul: as tag in the title. I'll let Jan choose the tag
> > he prefers.
> 
> x86emul: or x86/emul: is what we commonly use. That said, I don't like
> this change. The files touched are pretty new, and it was deliberate
> that I used s, not state, for the names. This is shorthand much like
> (globally) we use v (instead of vcpu) and d (instead of domain).

Are you suggesting that the functions changed in this patch should be
adapted in the other direction instead?  Meaning that the declaration is
changed to match the definition instead of the opposite?

If so, are you referring to all the functions changed in this patch? Or
only some?

I am asking so that Federico can know how to proceed exactly.

