Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE3796E40
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 02:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596982.931136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3MH-0004nL-3u; Thu, 07 Sep 2023 00:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596982.931136; Thu, 07 Sep 2023 00:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3MH-0004kG-0e; Thu, 07 Sep 2023 00:58:57 +0000
Received: by outflank-mailman (input) for mailman id 596982;
 Thu, 07 Sep 2023 00:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe3MF-0004kA-D2
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 00:58:55 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5f4ace3-4d19-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 02:58:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EDB9CCE1843;
 Thu,  7 Sep 2023 00:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57754C433C8;
 Thu,  7 Sep 2023 00:58:45 +0000 (UTC)
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
X-Inumbo-ID: b5f4ace3-4d19-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694048327;
	bh=BGUNHJTXYbUmRxhAX4K3auDJHoBOgYqrC+2uDxN2qMk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eNv9LC+lzZwECF3ZbhB+6AJfPSIIOY8df0Xa8IwbAfQ7PdrQ5Vrtcn+neYsiTZPvb
	 7YfXTM//2v64rxbbPet9dxJsUzEEZIE+aKrQeUt8Fb+84t3SwP7nvraVp1p8tKGv0V
	 Jx3mza/rvCnsPZMeKD7P/DlYJJxSZQtPxO9d8W0vzLnqcxXqI83Qnuv25BiQ/YmtEe
	 MFaeAUF6NkQz+qX9TklNQfH4qR8701z6+2iljk3uYa10CmH6DU+T5bwhMBQRomLaNb
	 KlO17nBNXnMJLpntt7Swn87beNtF/OmRnjzMmmiGyQXIp+jRPceaMQt7W8S9yHINll
	 oJr6QdLV2gzBQ==
Date: Wed, 6 Sep 2023 17:58:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/2] xen: apply deviation for Rule 8.4 (asm-only
 definitions)
In-Reply-To: <babbc14aff87b0d8546f4c617eccac3b@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309061746190.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693585223.git.nicola.vetrini@bugseng.com> <a260399a471b84f3c37c15ac735dc7aec6bd33ea.1693585223.git.nicola.vetrini@bugseng.com> <efb3dfa7-0fd0-83a5-67dc-eafad0a2bb57@suse.com> <babbc14aff87b0d8546f4c617eccac3b@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Sep 2023, Nicola Vetrini wrote:
> > Further in the cover letter you say "Deviating variables needs more care,
> > and
> > is therefore postponed to another patch", yet then here you annotate a
> > couple
> > of variables as well. Could you clarify what the criteria are for "needs
> > more
> > care"?
> > 
> 
> I see. I did not intend for those changes to end up in this patch, although
> those two are
> clearly only used by asm code and therefore are excepted.

I reviewed the patch checking that every function and variable is
actually only called/used from asm. Everything checks out, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

However, I think we should drop the change below (could be done on
commit) because it doesn't make sense to add SAF-1-safe for l1_fixmap_x
but not for l1_fixmap.  l1_fixmap has a declaration in
xen/arch/x86/include/asm/page.h but it is not actually used.

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 28fdf820ef3b..828786932021 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -143,6 +143,7 @@
 /* Mapping of the fixmap space needed early. */
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap[L1_PAGETABLE_ENTRIES];
+/* SAF-1-safe */
 l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     l1_fixmap_x[L1_PAGETABLE_ENTRIES];


