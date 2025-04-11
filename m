Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADE9A85803
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 11:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946909.1344641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3AfL-0007GX-LC; Fri, 11 Apr 2025 09:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946909.1344641; Fri, 11 Apr 2025 09:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3AfL-0007EX-IX; Fri, 11 Apr 2025 09:27:15 +0000
Received: by outflank-mailman (input) for mailman id 946909;
 Fri, 11 Apr 2025 09:27:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CBji=W5=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u3AfK-0007ER-Ry
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 09:27:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 263ea4fb-16b7-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 11:27:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 731395C6709;
 Fri, 11 Apr 2025 09:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6769EC4CEE2;
 Fri, 11 Apr 2025 09:27:08 +0000 (UTC)
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
X-Inumbo-ID: 263ea4fb-16b7-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744363631;
	bh=wlS7DhN8y20vqXzQwNKbHgzXCRcEYtr0nbb6yGv9GHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgrgmilFZ0kvC1CHpR++RB+QquxA4fnfn1/IAgk6OvywpTWhNHi7HpJZohxvmUT8u
	 C0oC+pqEz5aR3HPSZlu8JSH1KtNL5uwZHzVB/SKM8M69LXBPn+B54ySqXALWGqDElO
	 v1XWRUqmp1+5Nm5OwEajeiVhVtZ4iR1roK6UU8ZPzeAQEzgUWX6kuxm4fVoS3JmlA7
	 exmpFUCrm8aTO0v4o9mMLquv5UEkjnPrxb+ny+Jul5UFbuuZ4bmHXcg/G/Yf8F0qle
	 o0fxRZh9RYD8eOye9IK9CeiAdHFQnM5Sr6gABJ8OgK7XyEmInBJFc8p6nnhvs46vjQ
	 PT0uP2zPdIa+g==
Date: Fri, 11 Apr 2025 11:27:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, "Xin Li (Intel)" <xin@zytor.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/xen: Fix __xen_hypercall_setfunc
Message-ID: <Z_jgauFyTTKgVnJy@gmail.com>
References: <20250410193106.16353-1-jason.andryuk@amd.com>
 <3c3115a6-f516-4f5f-8998-dafc343c829e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c3115a6-f516-4f5f-8998-dafc343c829e@suse.com>


* Juergen Gross <jgross@suse.com> wrote:

> On 10.04.25 21:31, Jason Andryuk wrote:
> > Hypercall detection is failing with xen_hypercall_intel() chosen even on
> > an AMD processor.  Looking at the disassembly, the call to
> > xen_get_vendor() was removed.
> > 
> > The check for boot_cpu_has(X86_FEATURE_CPUID) was used as a proxy for
> > the x86_vendor having been set.  When
> > CONFIG_X86_REQUIRED_FEATURE_CPUID=y (the default value), DCE eliminates
> > the call to xen_get_vendor().  An uninitialized value 0 means
> > X86_VENDOR_INTEL, so the Intel function is always returned.
> > 
> > Remove the if and always call xen_get_vendor() to avoid this issue.
> > 
> > Fixes: 3d37d9396eb3 ("x86/cpufeatures: Add {REQUIRED,DISABLED} feature configs")
> > Suggested-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Wanna merge this via the Xen tree, or should it go to x86/urgent?

The bug was *caused* by the x86 tree so we'd be glad to merge,
but your call.

If you'll merge it:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo



