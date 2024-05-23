Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB128CD562
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728521.1133447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA96V-0000QS-ID; Thu, 23 May 2024 14:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728521.1133447; Thu, 23 May 2024 14:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA96V-0000Ow-Eo; Thu, 23 May 2024 14:07:35 +0000
Received: by outflank-mailman (input) for mailman id 728521;
 Thu, 23 May 2024 14:07:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Txa0=M2=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1sA96U-0000Og-5Z
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:07:34 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cba74921-190d-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 16:07:32 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6B13F40E01E8; 
 Thu, 23 May 2024 14:07:30 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ReU00yeVSuf2; Thu, 23 May 2024 14:07:27 +0000 (UTC)
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 03FCC40E0177;
 Thu, 23 May 2024 14:07:13 +0000 (UTC)
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
X-Inumbo-ID: cba74921-190d-11ef-b4bb-af5377834399
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1716473247; bh=qXfYRFhu2JIkgeWZDMQpdFw4OPOQczwivSNHPDfIb/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSNGNko7IGS7Iwb/IMz2WbftiPUUZsi34JmWbuw9cF/vczn/vm8XBrBYzd6pGPT2M
	 YImW1p8FG3vlC1Xf8Z0cAABBywLWdX/JZ6ifMWLyrZrqXdipCloCgH4/n7/Z+zJqx4
	 UJaErATL0eF+Bb6HgUvhb+eu4VQRo2HlYojKzDft1zg/G7qyF96rsQPPl4R4+6EmfH
	 uBS1RN18X2g3c+JjqpriuHArvNtLTQn74JpORYMQLt3tKeOBdT5n/RLRLzKE3olxs3
	 aJb+Kvk8kYDR81MPiy2BeAYDNhvrEKT1av9ldoDuH52sEWXph7eF6YL3LGkKyFveS2
	 Ixa4To0Xlvhl2pl3zYtXQtasJ9WRkrgsP5Z6PFp4wK55hSDZN61O/GOGIpIn4Bs2yr
	 JNhWhu3mWTgxs8UDrqDpr+8PbI3wgwdRv2MeyjqQrm/rzWiTtJBuV5MtK3WtJa1A42
	 OhOok4/xSvpXMkf7BtAcnC8cO/rc+7FoxnISTGFW/yNTGFs8ZNC+58U8dlKVwLc8Sz
	 vREojVz6bstwAcDS2ethJ3b3l88VaIiiaUEL379iIhGqpWLz/Zwj5ZtDRWwcVGb8NO
	 xwnUOieenhIbgNYvzp5mnmKKAshjRISXS9kqdHTYT3gO9NY8qxzyes9RIWg55k5ykZ
	 5DYZCdF6z0lxJDYgeeYl8iZw=
Date: Thu, 23 May 2024 16:07:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] x86/kernel: Move page table macros to new header
Message-ID: <20240523140709.GCZk9NjWBeJQ4Yqa9P@fat_crate.local>
References: <20240410194850.39994-1-jason.andryuk@amd.com>
 <20240410194850.39994-5-jason.andryuk@amd.com>
 <87pltcfx2o.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87pltcfx2o.ffs@tglx>

On Thu, May 23, 2024 at 03:59:43PM +0200, Thomas Gleixner wrote:
> On Wed, Apr 10 2024 at 15:48, Jason Andryuk wrote:
> > ---
> >  arch/x86/kernel/head_64.S            | 22 ++--------------------
> >  arch/x86/kernel/pgtable_64_helpers.h | 28 ++++++++++++++++++++++++++++
> 
> That's the wrong place as you want to include it from arch/x86/platform.
> 
> arch/x86/include/asm/....

... and there already is a header waiting:

arch/x86/include/asm/pgtable_64.h

so no need for a new one.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

