Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01507A1DBD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 13:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603102.940004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh7RB-0001Uh-As; Fri, 15 Sep 2023 11:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603102.940004; Fri, 15 Sep 2023 11:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh7RB-0001SN-77; Fri, 15 Sep 2023 11:56:41 +0000
Received: by outflank-mailman (input) for mailman id 603102;
 Fri, 15 Sep 2023 11:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xr/F=E7=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1qh7R8-0001Nd-Mh
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 11:56:39 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecc133ba-53be-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 13:56:37 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A47DC40E01A5; 
 Fri, 15 Sep 2023 11:56:36 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MMcr_PbPERky; Fri, 15 Sep 2023 11:56:35 +0000 (UTC)
Received: from nazgul.tnic (unknown [78.130.214.203])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 99F6E40E01A3;
 Fri, 15 Sep 2023 11:56:24 +0000 (UTC)
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
X-Inumbo-ID: ecc133ba-53be-11ee-8788-cb3800f73035
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1694778994; bh=175g7SJNtbpOYi+dD8u5/4xm31IXiQXwUxLxD1MYjIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8cGtnXKRVnjSChN1O93tW/N8vt0QAh93FG4TQdEexN19JVHu7blFR45aKl0IZE8c
	 vZiSFDoCH5J8Mw7vTJHC3RN6WSxvRNF5gdm0mf3cNCP1K+UeXTrVwOHMg7mcYhPFdN
	 yH/RYP3EydpidbKUe5FvPGa73bw+o01dwTBvXD89DY6Apc+Rd4PaBuxuVGXzv67D+C
	 /YmKJMLjLt46xdkm5Ee1k24SG7MHmsBOypgZayFAJlt9JhO7SDaOKc3MfFGnQhXdmH
	 Eee9EwbdMi9OcWzl2injyZKxSnI2uw//oaw9crg93KYaLs0vmfCGm7L95RBAgbySi5
	 Kg4EEgppr0hbq1T3Zhc7AOL6Tgh2GHvWYqsb7dcRB+FouKvx0Twar5S4GxNmZbfTRG
	 Gt2kUB6bcAfWtFP6hCq2gvu8V/H+fvpuBjJ8dxnyOMse9WIkMwYFMPXKbOkExSVPBQ
	 TaEsRU8VaEgSorXyGofCgd0lakGGQYtrAcyof9HXUWj6j+DChqJUV43SVWrcDl13vF
	 VXM75IbseVEE9danBltA1OPFBaxHwgWPuJELnLnmTSEN72ZBlrQNQ3Iw+oJL8qbv2S
	 wRDFXRABn56akHvNDIpN/wg1c70r30x8ySAqNSRMokqAWH1IU4m+fqkHQiJdo46MKk
	 9snXBFN2o5WwZkjZeLWZNMV8=
Date: Fri, 15 Sep 2023 13:56:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	smita.koralahallichannabasappa@amd.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, rric@kernel.org,
	james.morse@arm.com
Subject: Re: [PATCH] Revert "EDAC/mce_amd: Do not load edac_mce_amd module on
 guests"
Message-ID: <20230915115631.GAZQRGb0vCmEnUcaZI@fat_crate.local>
References: <20210628172740.245689-1-Smita.KoralahalliChannabasappa@amd.com>
 <ZPqQEHXgmak1LMNh@mattapan.m5p.com>
 <20230908035911.GAZPqcD/EjfKZ0ISrZ@fat_crate.local>
 <ZQM8jRx8uKEbEo00@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQM8jRx8uKEbEo00@mattapan.m5p.com>

On Thu, Sep 14, 2023 at 10:02:05AM -0700, Elliott Mitchell wrote:
> Indeed.  At what point is the lack of information and response long
> enough to simply commit a revert due to those lacks?

At no point.

> Even with the commit message having been rewritten and the link to:
> https://lkml.kernel.org/r/20210628172740.245689-1-Smita.KoralahalliChannabasappa@amd.com
> added, this still reads as roughly:
> 
> "A hypothetical bug on a hypothetivisor"

If "Hypervisors likely do not expose the SMCA feature to the guest"
doesn't explain to you what the problem is this commit is fixing, then
I can't help you.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

