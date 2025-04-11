Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5AA85844
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 11:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946936.1344662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Avt-0006YB-51; Fri, 11 Apr 2025 09:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946936.1344662; Fri, 11 Apr 2025 09:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3Avt-0006W3-1p; Fri, 11 Apr 2025 09:44:21 +0000
Received: by outflank-mailman (input) for mailman id 946936;
 Fri, 11 Apr 2025 09:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CBji=W5=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u3Avr-0006Vx-Mg
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 09:44:19 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8741e79d-16b9-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 11:44:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 475FF49C50;
 Fri, 11 Apr 2025 09:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48808C4CEE2;
 Fri, 11 Apr 2025 09:44:10 +0000 (UTC)
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
X-Inumbo-ID: 8741e79d-16b9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744364653;
	bh=cQlJQWMR1vpM4VqDeSr2vhN4E6SlND+oqKZ9malEpBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGgINeP/Iroy+Euc1kql8/6jR3BdcNgJ1T5VquxKF918ZjjBEw0Im09GA2r6OkzAM
	 NkHvG0FrMFcrHIS3+ImuLCigg7VkY6V1E0N8PVvk4iJin55XreYuwnh2QdrePL/v3P
	 Q8VMP9K+bPV7dWE6isttzEUR1gxmDYJqiPpsnvykf4mv0MtrKg2EB5Z4pugaJGYkaC
	 kHHfU2qEzwMBRqS+4HQtc9xxXqGs1ZnHUrbuUjIDnlvJF+D/CbU0vQa3iAW7QjgI+A
	 hpBKUKpFeXYM99vtcrVanAlI6D+bXl5D/7j1JwaeMVrI/IOh/9SaPly7pXe3iSJfKH
	 QbVsY+mUrQUhA==
Date: Fri, 11 Apr 2025 11:44:07 +0200
From: Ingo Molnar <mingo@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, "Xin Li (Intel)" <xin@zytor.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/xen: Fix __xen_hypercall_setfunc
Message-ID: <Z_jkZw58Ew5Iwj5K@gmail.com>
References: <20250410193106.16353-1-jason.andryuk@amd.com>
 <3c3115a6-f516-4f5f-8998-dafc343c829e@suse.com>
 <Z_jgauFyTTKgVnJy@gmail.com>
 <ff39455a-7fa8-48c1-ba43-33ea4992f6e1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff39455a-7fa8-48c1-ba43-33ea4992f6e1@suse.com>


* Jürgen Groß <jgross@suse.com> wrote:

> On 11.04.25 11:27, Ingo Molnar wrote:
> > 
> > * Juergen Gross <jgross@suse.com> wrote:
> > 
> > > On 10.04.25 21:31, Jason Andryuk wrote:
> > > > Hypercall detection is failing with xen_hypercall_intel() chosen even on
> > > > an AMD processor.  Looking at the disassembly, the call to
> > > > xen_get_vendor() was removed.
> > > > 
> > > > The check for boot_cpu_has(X86_FEATURE_CPUID) was used as a proxy for
> > > > the x86_vendor having been set.  When
> > > > CONFIG_X86_REQUIRED_FEATURE_CPUID=y (the default value), DCE eliminates
> > > > the call to xen_get_vendor().  An uninitialized value 0 means
> > > > X86_VENDOR_INTEL, so the Intel function is always returned.
> > > > 
> > > > Remove the if and always call xen_get_vendor() to avoid this issue.
> > > > 
> > > > Fixes: 3d37d9396eb3 ("x86/cpufeatures: Add {REQUIRED,DISABLED} feature configs")
> > > > Suggested-by: Juergen Gross <jgross@suse.com>
> > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > 
> > > Reviewed-by: Juergen Gross <jgross@suse.com>
> > 
> > Wanna merge this via the Xen tree, or should it go to x86/urgent?
> > 
> > The bug was *caused* by the x86 tree so we'd be glad to merge,
> > but your call.
> 
> x86/urgent is fine for me.

Applied, thanks!

	Ingo





