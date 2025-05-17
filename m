Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3692ABAA54
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 15:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988251.1373181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGHTV-0003D4-HH; Sat, 17 May 2025 13:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988251.1373181; Sat, 17 May 2025 13:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGHTV-0003Ak-Br; Sat, 17 May 2025 13:21:13 +0000
Received: by outflank-mailman (input) for mailman id 988251;
 Sat, 17 May 2025 13:21:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v69a=YB=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uGHTU-0003Ac-HD
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 13:21:12 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb5e5d4c-3321-11f0-9eb7-5ba50f476ded;
 Sat, 17 May 2025 15:21:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EEE786116F;
 Sat, 17 May 2025 13:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8448AC4CEE3;
 Sat, 17 May 2025 13:21:04 +0000 (UTC)
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
X-Inumbo-ID: cb5e5d4c-3321-11f0-9eb7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747488067;
	bh=sPP8XL7tHXh/bsZIzimqagY+xJVixQzy2ZkOpaT6d08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3kX9IFD3icXogFTLh29FQJgZReIlia2+XrTPBHaiHQWcNHeoYu+rzqDCHPZT5Kx9
	 JuDKi0OdRi9fPMVlRnibMl25ZT+ATpWI2LPAbIxiWdcfH1G1mtOaunDWfbb4Dqxh4F
	 W+nDEAwbfsXvdhray4cosHnqyHWgB8+7DetXkWALXdG8YkSdBLJzqCzB7yHbe8yphw
	 MURfgfhqLyuUW8kpTqgrz4wXYQBSGXe2+pkdnXaeT5auhc6If7QqKCAI5wT9Rh+hPy
	 w+kiiyQmIBlFr93WiLuS4Skd0EK09JEqYRUuaUjkSJFw9ygNhgoEbMk4KSizz4ilyo
	 GmmpO83wkiwgQ==
Date: Sat, 17 May 2025 15:21:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
	rafael@kernel.org, lenb@kernel.org
Subject: Re: [PATCH v1 3/3] x86/msr: Convert a native_wrmsr() use to
 native_wrmsrq()
Message-ID: <aCiNPuwTtrepFc3x@gmail.com>
References: <aCg27zLhBM5d0dAI@gmail.com>
 <EAEB5A61-F19B-481C-B6F0-49B3D509B70A@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EAEB5A61-F19B-481C-B6F0-49B3D509B70A@zytor.com>


* Xin Li <xin@zytor.com> wrote:

> 
> >>> On 5/15/2025 10:54 AM, Xin Li wrote:
> >>> On 5/15/2025 8:27 AM, Ingo Molnar wrote:
> >>>> 
> >>>> * Xin Li (Intel) <xin@zytor.com> wrote:
> >>>> 
> >>>>> Convert a native_wrmsr() use to native_wrmsrq() to zap meaningless type
> >>>>> conversions when a u64 MSR value is splitted into two u32.
> >>>>> 
> >>>> 
> >>>> BTW., at this point we should probably just replace
> >>>> sev_es_wr_ghcb_msr() calls with direct calls to:
> >>>> 
> >>>>     native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, ...);
> >>>> 
> >>>> as sev_es_wr_ghcb_msr() is now basically an open-coded native_wrmsrq().
> >>>> 
> >>> 
> >>> I thought about it, however it looks to me that current code prefers not
> >>> to spread MSR_AMD64_SEV_ES_GHCB in 17 callsites.  And anyway it's a
> >>> __always_inline function.
> >>> 
> >>> But as you have asked, I will make the change unless someone objects.
> >> 
> >> Hi Ingo,
> >> 
> >> I took a further look and found that we can't simply replace
> >> sev_es_wr_ghcb_msr() with native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, ...).
> >> 
> >> There are two sev_es_wr_ghcb_msr() definitions.  One is defined in
> >> arch/x86/boot/compressed/sev.h and it references boot_wrmsr() defined in
> >> arch/x86/boot/msr.h to do MSR write.
> > 
> > Ah, indeed, it's also a startup code wrapper, which wrmsrq() doesn't
> > have at the moment. Fair enough.
> 
> So you want me to drop this patch then?

No, patch #3 is fine as-is in its -v1 form, I was wrong.

Thanks,

	Ingo

