Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B2776986
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581311.909944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpVU-0002Ro-N2; Wed, 09 Aug 2023 20:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581311.909944; Wed, 09 Aug 2023 20:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpVU-0002PB-Jx; Wed, 09 Aug 2023 20:10:12 +0000
Received: by outflank-mailman (input) for mailman id 581311;
 Wed, 09 Aug 2023 20:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpVT-0002P5-KC
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:10:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd0f2e16-36f0-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 22:10:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5845A6482B;
 Wed,  9 Aug 2023 20:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41BCC433CA;
 Wed,  9 Aug 2023 20:10:05 +0000 (UTC)
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
X-Inumbo-ID: bd0f2e16-36f0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691611807;
	bh=z2Nl5yr8cnBc53hLZ3OJmUrtXEiHAEXf0P6LZhDoq5g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jKYf0vQ+8kd/83X/+uEt6Dp1f0R8WXHXl2nxSd0nBiHYNkDWyDpv+vKlEglvIKvZZ
	 PTXunhxkeFWlsrB7NXIPhHKsT3ipXiNSJw2Sulhl6ex0wOgslLhLyCqZ0YwzQYMG2E
	 xD8aNfILityl50phbZsqRgAMNEsLjpk5kwMaoF6mvyr3VRynCbKvMh3oMG1AXmwuhg
	 x/SltNIL1XV7uJcZWUAwh9OYkcxdAl6TI4ny/T1QlNjIJ1eDmOwnKlRjQLklx6sjR2
	 H31O4F8yZE67wDKU/KxEDr3GTYhDf+pWTVmrQL1rZZigq54nUVkIUbE9qJ/V2gvqNz
	 h8NOIHjkJphKg==
Date: Wed, 9 Aug 2023 13:10:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 4/8] xen/arm: address MISRA C:2012 Rule 8.4
In-Reply-To: <cfbc7569-3714-2200-054c-49ba593d6903@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308091309200.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com> <c2b0bb92a246e5cf149b1ec81c6ed635a275f9df.1691575243.git.nicola.vetrini@bugseng.com> <cfbc7569-3714-2200-054c-49ba593d6903@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Jan Beulich wrote:
> On 09.08.2023 13:02, Nicola Vetrini wrote:
> > 'xen/hypercall.h' is included in 'xen/arch/arm/setup.c' to allow
> > the declaration of 'arch_get_xen_caps' to be visible when
> > defining the function.
> > 
> > The header 'xen/delay.h' is included in 'xen/arch/arm/time.c'
> > to allow the declaration of 'udelay' to be visible.
> > 
> > At the same time, a declaration for 'get_sec' is added in
> > 'xen/include/xen/time.h' to be available for every call site
> > (in particular cper.h).
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > ---
> >  xen/arch/arm/setup.c   | 1 +
> >  xen/arch/arm/time.c    | 1 +
> >  xen/include/xen/cper.h | 3 +--
> >  xen/include/xen/time.h | 1 +
> >  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> I would have almost put this off as Arm-only, but then saw this diffstat.
> How come you consider cper.h Arm-related? This is used only by APEI source
> files, which in turn are used only by x86 afaics. So I think you want to
> split off the movement of the get_sec() declaration.
> 
> As to title and description (perhaps affecting more than just this patch):
> Failing to have declarations in scope where definitions appear is an at
> least latent bug. We fix these as we find them anyway, so Misra is
> secondary here. Hence I'd like to suggest that you declare any such
> change as an actual bugfix, ideally including a Fixes: tag. It is of
> course fine to mention that this then also addresses Misra rule 8.4.

As you split the patches moving cper.h out, and fixing the commit
message, please add my Reviewed-by for the setup.c/time.c/time.h
changes.

