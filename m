Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5B862078
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 00:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684983.1065301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdebP-0005dG-Hx; Fri, 23 Feb 2024 23:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684983.1065301; Fri, 23 Feb 2024 23:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdebP-0005ar-ES; Fri, 23 Feb 2024 23:05:11 +0000
Received: by outflank-mailman (input) for mailman id 684983;
 Fri, 23 Feb 2024 23:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdebN-0005al-Bs
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 23:05:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fba4aae8-d29f-11ee-98f5-efadbce2ee36;
 Sat, 24 Feb 2024 00:05:07 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA7EC615B9;
 Fri, 23 Feb 2024 23:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE4DC433C7;
 Fri, 23 Feb 2024 23:05:01 +0000 (UTC)
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
X-Inumbo-ID: fba4aae8-d29f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708729503;
	bh=vy5raAayEUzIBDSjL2ecol3dPMK+Bwnm2dkQrQw7L40=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cJvQL8PqyNSuycwskI44peNrHonBUGe5jd72G5PtEb9WKALYNCRNqGnBYwOrjzlgC
	 PfxyuCHkkjG2059WWAtj83tHB3sA5BQR0XJP+U1XUM+cSdwiiiG3zqCnURymPjtVWE
	 U5KYceWGKSnUn75s2AU7UBwip081yML5Qy7dumu/sYA/wEGAcZCHtFBxEQ4u4PPq6J
	 WRk70s5OQsot4eOumv4vYzm0KYBhAW7/v5x1LjW0hN6mpsfUzFg7U+G5d1EJOfLYyt
	 ywZtMZ5v9l+Qr/GQ8LhFoh4FpSpqaMXepkhSDAinsKt3H3VlYS728wTjprhbrIR9gu
	 QOILmgTAjAzqQ==
Date: Fri, 23 Feb 2024 15:05:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
In-Reply-To: <4f3b3d52a3ba20b05ecfa068b916b804@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402231502540.754277@ubuntu-linux-20-04-desktop>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com> <4f3b3d52a3ba20b05ecfa068b916b804@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Feb 2024, Nicola Vetrini wrote:
> On 2024-02-19 16:14, Nicola Vetrini wrote:
> > The cache clearing and invalidation helpers in x86 and Arm didn't
> > comply with MISRA C Rule 17.7: "The value returned by a function
> > having non-void return type shall be used". On Arm they
> > were always returning 0, while some in x86 returned -EOPNOTSUPP
> > and in common/grant_table the return value is saved.
> > 
> > As a consequence, a common helper arch_grant_cache_flush that returns
> > an integer is introduced, so that each architecture can choose whether to
> > return an error value on certain conditions, and the helpers have either
> > been changed to return void (on Arm) or deleted entirely (on x86).
> > 
> > Signed-off-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > ---
> > The original refactor idea came from Julien Grall in [1]; I edited that
> > proposal
> > to fix build errors.
> > 
> > I did introduce a cast to void for the call to flush_area_local on x86,
> > because
> > even before this patch the return value of that function wasn't checked in
> > all
> > but one use in x86/smp.c, and in this context the helper (perhaps
> > incidentally)
> > ignored the return value of flush_area_local.
> > 
> > [1]
> > https://lore.kernel.org/xen-devel/09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org/
> > ---
> >  xen/arch/arm/include/asm/page.h     | 33 ++++++++++++++++++-----------
> >  xen/arch/x86/include/asm/flushtlb.h | 23 ++++++++++----------
> >  xen/common/grant_table.c            |  9 +-------
> >  3 files changed, 34 insertions(+), 31 deletions(-)
> > 
> 
> I'll put this patch in the backlog at the moment: too many intricacies while
> trying to untangle xen/flushtlb from xen/mm.h, and there are easier cases that
> can be done faster. If someone is interested I can post the partial work I've
> done so far, even though it doesn't
> build on x86.

I understand that the blocker is:

diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 69f817d1e6..e90c9de361 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -123,6 +123,7 @@
 
 #ifndef __ASSEMBLY__
 
+#include <public/grant_table.h>
 #include <xen/errno.h>
 #include <xen/types.h>
 #include <xen/lib.h>


And the headers disentagling required to solve it, right?


Let me ask a silly question. public/grant_table.h seems needed by
arch_grant_cache_flush. Can we move arch_grant_cache_flush somewhere
else? It is not like page.h is a perfect fit for it anyway.

For instance, can we move it to 

xen/arch/arm/include/asm/grant_table.h

?

