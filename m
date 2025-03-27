Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85922A734B3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929499.1332207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoPK-0003nK-0o; Thu, 27 Mar 2025 14:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929499.1332207; Thu, 27 Mar 2025 14:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoPJ-0003kt-Tc; Thu, 27 Mar 2025 14:40:33 +0000
Received: by outflank-mailman (input) for mailman id 929499;
 Thu, 27 Mar 2025 14:40:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uRC/=WO=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1txoPI-0003iJ-VW
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:40:32 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f878e56-0b19-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 15:40:32 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0FB3540E021E; 
 Thu, 27 Mar 2025 14:40:31 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cX1OtxS0K7NX; Thu, 27 Mar 2025 14:40:27 +0000 (UTC)
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2FF3140E0219;
 Thu, 27 Mar 2025 14:40:19 +0000 (UTC)
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
X-Inumbo-ID: 6f878e56-0b19-11f0-9ea3-5ba50f476ded
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743086427; bh=h8MbRz5rBH42dvnddwtNpMmVgLY72LgYihnwCYpQTCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OS1ZF5bAiyc5aUXa8QKfSKVU7QHSsKNm8UTWq85cO3+VRDP5x6xCXiibaoFfeIHEP
	 DtEtO3yVhY4zbfdWq8TOf2KOgGyfZ4IlNNG412WoJQDWb4F/ZPCjleTkOjZfenUga/
	 nOuafGshXliXeuDSDbjCkzhRUXawBmt0N4Hez4ViBZ937msI7BrpZ4x+0A/ivRxZdM
	 wEE9o/osZ3ABM5OaiOxujngBUBMBA5OMI6s1zQvdtpNQ3X9lqms9lA0Ta/pYBnYw1D
	 DKf1F12uEldWKnxcb51uYg6GZqOcMKeptuX9M6/WOmft6hXs2Qagin0jZcC6F3GJNU
	 jsBPgDN14ODSNAzQaYpP2W/Qyto1dITbbeYT63oy4gEs+QC55BYteGgKWBUrgw1ss5
	 oyA/74FPFI5KF+l46obYdSb1Ik8XTrK+eFb2eKzZmTmUhJ5zGqN+9CszT83rTsLmYt
	 ZGW23glDewsU+vNdSupWdKZsE5Gq+7cxEJf7ubxfjBWL9TQLc3q+NzDGDHwwqAJkFh
	 cCd6UltuXmy0AFav49Ypnw+tQZZoyDx78ixXyPnJXpROAqm/GfOcjlrqajIAMeUIOY
	 AiRsKMAyB4ry9iU1Zv7lCu42NGorGalI16S9dw7KeVSCIb09zBLJkkIRYU8v4F9Cex
	 ftSTZ/NcVeWku3bT25/PhLMI=
Date: Thu, 27 Mar 2025 15:40:12 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, oe-kbuild-all@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	kernel test robot <lkp@intel.com>, x86-ml <x86@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
Message-ID: <20250327144012.GAZ-VjTB935oZS3RLa@fat_crate.local>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
 <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
 <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
 <c18a543c-4df2-4744-bf16-e888a832d634@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c18a543c-4df2-4744-bf16-e888a832d634@suse.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 03:21:45PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> Well, that is wasting nearly 3kB of the data section.
>=20
> Maybe not a big deal, but still...

We could do it until the proper fix is in place, no?

3K is meh, especially for the hypervisor kernel, I'd say...

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

