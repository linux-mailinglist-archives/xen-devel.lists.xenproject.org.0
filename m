Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1A84C1AD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 02:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677229.1053712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWRD-0008Q9-3V; Wed, 07 Feb 2024 01:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677229.1053712; Wed, 07 Feb 2024 01:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXWRD-0008Ns-0d; Wed, 07 Feb 2024 01:09:19 +0000
Received: by outflank-mailman (input) for mailman id 677229;
 Wed, 07 Feb 2024 01:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aVye=JQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rXWRB-0008Iy-Qv
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 01:09:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82410d69-c555-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 02:09:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AE724CE1779;
 Wed,  7 Feb 2024 01:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD044C433F1;
 Wed,  7 Feb 2024 01:09:11 +0000 (UTC)
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
X-Inumbo-ID: 82410d69-c555-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707268153;
	bh=33P6WiDsA5f6DH606xSZnLBVDtzbCPwlPelARish9Nc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=njVSLBMGJmRWnrq3eDpfXOSkaVyYakDzELLkpLRh/culTX3YQlNe+fRiDvOggh4Fb
	 aT3px/GBg/LyxO/xgXLKY1WM5AR1xxmrnTJ5kSY13CzpiIr+YU/FHccgMEayMW2bfq
	 MoU+YDMY0cpa6DalqMMNb5+D7vBv9NzIyNNs4jEvXkHyRf5XqXXaffJmRAFpKNfY4O
	 ujaVqtZswdbiF5mojaQNPQbBAv7wG8RiTggfgTQVPyj/KBdKuKcX0BrblA/dbOXFuB
	 19ymnHd+jKZyb99x6C4Vlo1Q9q1OtqGlvfqDVYmIX/zn/33jKX+HRT0s9c0QrdHKcX
	 fXiBpUt1HDiew==
Date: Tue, 6 Feb 2024 17:09:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Federico Serafini <federico.serafini@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE()
In-Reply-To: <0e673e08-6fa8-4e1e-bfde-a2764b121d61@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402061708480.1925432@ubuntu-linux-20-04-desktop>
References: <cover.1706259490.git.federico.serafini@bugseng.com> <42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com> <2c0d22be-0b31-4e62-a8f8-2dc82147e51a@suse.com> <0e673e08-6fa8-4e1e-bfde-a2764b121d61@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Feb 2024, Jan Beulich wrote:
> On 06.02.2024 14:22, Jan Beulich wrote:
> > On 26.01.2024 11:05, Federico Serafini wrote:> --- a/xen/include/xen/compiler.h
> >> +++ b/xen/include/xen/compiler.h
> >> @@ -64,6 +64,13 @@
> >>  # define fallthrough        do {} while (0)  /* fallthrough */
> >>  #endif
> >>  
> >> +/*
> >> + * Add the following macro to check that a program point is considered
> >> + * unreachable by the static analysis performed by the compiler.
> >> + */
> >> +#define STATIC_ASSERT_UNREACHABLE() \
> >> +    asm ( ".error \"static assertion failed: unreachable\"" )
> > 
> > In the comment s/Add/Use/? The macro is there after all when this gets
> > committed. Overall maybe
> > 
> > "Use this macro at program points considered unreachable, to be checked
> >  by the compiler's static analysis."
> > 
> > ?
> > 
> > Also while asm()s without operands are implicitly volatile, I think it
> > would be a good idea to make that explicit nevertheless.
> > 
> > I'd be happy to adjust while committing, so long as you agree. If you
> > agree, and provided diagnostics resulting from this are useful (an
> > example would have been nice in the description):
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Actually, having seen patch 2, I need to withdraw this right away.

To me it looks good enough but let's continue the discussion on patch
#2

