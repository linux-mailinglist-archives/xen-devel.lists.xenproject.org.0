Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2DFA83F56
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:49:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945171.1343415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oX9-0007yK-0L; Thu, 10 Apr 2025 09:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945171.1343415; Thu, 10 Apr 2025 09:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oX8-0007vt-Ta; Thu, 10 Apr 2025 09:49:18 +0000
Received: by outflank-mailman (input) for mailman id 945171;
 Thu, 10 Apr 2025 09:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vY8t=W4=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1u2oX7-0007vn-4h
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:49:17 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cbc00e3-15f1-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 11:49:09 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CA84140E0242; 
 Thu, 10 Apr 2025 09:49:07 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8wo44ZIfANvj; Thu, 10 Apr 2025 09:49:04 +0000 (UTC)
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CD7C140E0196;
 Thu, 10 Apr 2025 09:48:53 +0000 (UTC)
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
X-Inumbo-ID: 0cbc00e3-15f1-11f0-9ffb-bf95429c2676
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744278543; bh=+CEoqM5UxK2gsa7RoSFi814yQcDDwJYTR3gCRWdVrPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPsPdNZDGk6SPG0q2GiClvcJ64nWomMCN9Zo08GblxCAZH9xsReeA7O9Z02oGsmSu
	 Foz4f8gW5YLNfgSDYypvEJsnRNl5OiMLGSry3Mhkfbt/rZB3Ac0xdn6wCwCDe9OWpN
	 oqAekZj/G459bIofjTHHDE1AFwhFiqrdouVvs1kplAEXMR8e4OOuz8NSIaf4bIEXd0
	 4GpPwnQK2HElYq4i1qlw8zVQ6piZl5pH7dnQJ3YH+AyK+WleQp8gd9F2kgmTMxkfjj
	 dFQAQcR6NMHDQfomY5shGwo8gMu4AK9DAppW7NQ6YssKvvOxVhIszwJb86q6485sGE
	 WMmsVkCW0y02k1vrnPwvBTC9McRMdghgWwoDe8+g7jy4l5ynMcuOEJzcxK8tKSBE9U
	 Cga1tJVBvNVqedXZqpqWlpWGkJE+lSPDq2/LOyh+s/je+5M96UV0H/Zyf8T8LfBASt
	 nmZqOuy8onYjTmFokDk2laRArgGMefv5O9k7TiDtYZJbO64abI9eX1guBkAqui5Ylp
	 sx7NHKISan6yhfi9S5S369u4vKV3p7+zE8VONOzUqEV/j52RMRBXaYS9AiJ0LoG+mS
	 Nz1hvCHI1y09E0G/wKPm5hb5XzRHa5u03LdCOn6VJVB9NtnPXyjAoZTzghXxazYFFP
	 ruVMbuex2FrOypQCwEpogNHE=
Date: Thu, 10 Apr 2025 11:48:47 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: fix multicall debug feature
Message-ID: <20250410094847.GAZ_eT__ab_VRmb8uk@fat_crate.local>
References: <20250327190602.26015-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327190602.26015-1-jgross@suse.com>

On Thu, Mar 27, 2025 at 08:06:02PM +0100, Juergen Gross wrote:
> Initializing a percpu variable with the address of a struct tagged as
> .initdata is breaking the build with CONFIG_SECTION_MISMATCH_WARN_ONLY
> not set to "y".
> 
> Fix that by using an access function instead returning the .initdata
> struct address if the percpu space of the struct hasn't been
> allocated yet.
> 
> Fixes: 368990a7fe30 ("xen: fix multicall debug data referencing")
> Reported-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/xen/multicalls.c | 26 ++++++++++++++------------
>  arch/x86/xen/smp_pv.c     |  1 -
>  arch/x86/xen/xen-ops.h    |  3 ---
>  3 files changed, 14 insertions(+), 16 deletions(-)

Looks good, doesn't fire here anymore.

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
Tested-by: Borislav Petkov (AMD) <bp@alien8.de>

Thx!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

