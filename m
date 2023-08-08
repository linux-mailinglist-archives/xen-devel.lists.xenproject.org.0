Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF9774B86
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 22:49:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580433.908631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTTcz-0006vv-Bc; Tue, 08 Aug 2023 20:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580433.908631; Tue, 08 Aug 2023 20:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTTcz-0006te-89; Tue, 08 Aug 2023 20:48:29 +0000
Received: by outflank-mailman (input) for mailman id 580433;
 Tue, 08 Aug 2023 20:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiCO=DZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTTcx-0006tY-SO
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 20:48:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ead8b7a2-362c-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 22:48:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AF4D62CB8;
 Tue,  8 Aug 2023 20:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CC7C433C7;
 Tue,  8 Aug 2023 20:48:20 +0000 (UTC)
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
X-Inumbo-ID: ead8b7a2-362c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691527702;
	bh=FYbbd7qQVQZaGqd4d1CTFtThoJ1+SUu0wdRwt+YrOEQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T+/6gZNHu+vSZpj3zJrywt3/r4buvzTZKcG7iUEqeRTB9fmnbH2lXAhN2RoX9f3So
	 BcBsQCxu4TVMTg9419/BOjpk8U7S3qSL4jH+R4mW8jKraqb6nRIRuNmdKmnMzZfYkS
	 YdNi4luudmOgoAwfqqHVP8p7/dgPekO1QNOB6hCM7npDTuxLhF0kfb6SMWQHu8f40v
	 hZFqOe3tB+7EmH2xuR71/TSP0Y9i1rxAV2iSCPO5hSrnwJSnzYxoWriu0B9J7QA8rg
	 iWOH3QCfY9pTJMOjNbcizFb4gWbfdvR93NUFlXESjj1+n/Ub8qLPXyiX7BEGr+MsEg
	 OlojuKeOWIQew==
Date: Tue, 8 Aug 2023 13:48:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] mem-sharing: move (x86) / drop (Arm)
 arch_dump_shared_mem_info()
In-Reply-To: <B566D20C-3818-4476-9FB4-4F93721C6E6D@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308081348120.2127516@ubuntu-linux-20-04-desktop>
References: <b0a49d20-8e82-8264-8241-86a108139682@suse.com> <B566D20C-3818-4476-9FB4-4F93721C6E6D@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Aug 2023, Luca Fancellu wrote:
> > On 8 Aug 2023, at 13:02, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > When !MEM_SHARING no useful output is produced. Move the function into
> > mm/mem_sharing.c while conditionalizing the call to it, thus allowing to
> > drop it altogether from Arm (and eliminating the need to introduce stubs
> > on PPC and RISC-V).
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > I wasn't really sure whether introducing a stub in xen/mm.h would be any
> > better than adding the (further) #ifdef to dump_domains().
> > 
> > We could go further and also eliminate the need for the stub variants
> > of mem_sharing_get_nr_{shared,saved}_mfns() by moving the
> > XENMEM_get_sharing_{shared,freed}_pages cases in
> > {,compat_}arch_memory_op() into the already existing #ifdef-s there.
> > Returning an error for those sub-ops may be slightly more appropriate
> > than returning 0 when !MEM_SHARING.
> > 
> > --- a/xen/arch/arm/mm.c
> > +++ b/xen/arch/arm/mm.c
> > @@ -1297,10 +1297,6 @@ void free_init_memory(void)
> >     printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
> > }
> > 
> > -void arch_dump_shared_mem_info(void)
> > -{
> > -}
> > -
> 
> Hi Jan,
> 
> For the arm part:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> #arm

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

