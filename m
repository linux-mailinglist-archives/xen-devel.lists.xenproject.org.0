Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A82ABA8A1
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 09:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988067.1373161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGBj9-0002vM-DF; Sat, 17 May 2025 07:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988067.1373161; Sat, 17 May 2025 07:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGBj9-0002tP-Af; Sat, 17 May 2025 07:12:59 +0000
Received: by outflank-mailman (input) for mailman id 988067;
 Sat, 17 May 2025 07:12:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v69a=YB=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uGBj7-0002tJ-OM
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 07:12:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b0f556-32ee-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 09:12:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0017A5C1042;
 Sat, 17 May 2025 07:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20BEC4CEE3;
 Sat, 17 May 2025 07:12:49 +0000 (UTC)
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
X-Inumbo-ID: 59b0f556-32ee-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747465972;
	bh=Kfh7EworHewU7d8WTF/gnxLsAf6Ep1ThneG8fXa6LWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sIST7hY2mns6caxm2l+fYdD6IU7MQuJBJkZEwNhVsa5Nn71ygw3JR2TRGxkVcSTSt
	 j2HV07l10mW9NJHYPka+W8SchEy/SmWalEIWVdkC6j4qIYR8mbtT1ewXIuKN5IV7Fz
	 XMyxO3b+fkcytYiPpTfD5PxJnLdtoYGMlZjS1nAtOVBODvtEPqwwiqn53yj5ndxFaL
	 aFOpFWQ77LCrXZIp5MtL8dAwasyMKvR0goYWhQ7JevULSEUm7m9RbPq+pUxzv8GQg0
	 73Qm4cNKm82Zz+AvqFoeGNm5CbCQrkQl1iLgEgnwr2P0JQmRXGqgWIrfX8OJBjt6/J
	 7KrceZdHuPsAg==
Date: Sat, 17 May 2025 09:12:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
	rafael@kernel.org, lenb@kernel.org
Subject: Re: [PATCH v1 3/3] x86/msr: Convert a native_wrmsr() use to
 native_wrmsrq()
Message-ID: <aCg27zLhBM5d0dAI@gmail.com>
References: <20250512084552.1586883-1-xin@zytor.com>
 <20250512084552.1586883-4-xin@zytor.com>
 <aCYH0UQzO_Ek27js@gmail.com>
 <68dba45c-a677-4f6d-b7ec-e896aef3d27b@zytor.com>
 <b8f741d6-47a1-4cc8-a5b2-45ee86fcb773@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8f741d6-47a1-4cc8-a5b2-45ee86fcb773@zytor.com>


* Xin Li <xin@zytor.com> wrote:

> On 5/15/2025 10:54 AM, Xin Li wrote:
> > On 5/15/2025 8:27 AM, Ingo Molnar wrote:
> > > 
> > > * Xin Li (Intel) <xin@zytor.com> wrote:
> > > 
> > > > Convert a native_wrmsr() use to native_wrmsrq() to zap meaningless type
> > > > conversions when a u64 MSR value is splitted into two u32.
> > > > 
> > > 
> > > BTW., at this point we should probably just replace
> > > sev_es_wr_ghcb_msr() calls with direct calls to:
> > > 
> > >     native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, ...);
> > > 
> > > as sev_es_wr_ghcb_msr() is now basically an open-coded native_wrmsrq().
> > > 
> > 
> > I thought about it, however it looks to me that current code prefers not
> > to spread MSR_AMD64_SEV_ES_GHCB in 17 callsites.  And anyway it's a
> > __always_inline function.
> > 
> > But as you have asked, I will make the change unless someone objects.
> 
> Hi Ingo,
> 
> I took a further look and found that we can't simply replace
> sev_es_wr_ghcb_msr() with native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, ...).
> 
> There are two sev_es_wr_ghcb_msr() definitions.  One is defined in
> arch/x86/boot/compressed/sev.h and it references boot_wrmsr() defined in
> arch/x86/boot/msr.h to do MSR write.

Ah, indeed, it's also a startup code wrapper, which wrmsrq() doesn't 
have at the moment. Fair enough.

Thanks,

	Ingo

