Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709B6D16EB2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 07:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201130.1516826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfYKS-0003AH-Qg; Tue, 13 Jan 2026 06:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201130.1516826; Tue, 13 Jan 2026 06:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfYKS-00037F-Nj; Tue, 13 Jan 2026 06:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1201130;
 Tue, 13 Jan 2026 06:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9S4V=7S=kernel.org=wei.liu@srs-se1.protection.inumbo.net>)
 id 1vfYKR-00035y-DK
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 06:56:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff06fbff-f04c-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 07:56:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4A6026000A;
 Tue, 13 Jan 2026 06:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A50C116C6;
 Tue, 13 Jan 2026 06:56:32 +0000 (UTC)
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
X-Inumbo-ID: ff06fbff-f04c-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768287393;
	bh=B5TuD3XfjPDj4HUep1TvfY2MvFwdAw7YS2657wMNiSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGNrts5Oca/aw3q0q5G9mJdI79ntZnSFN2BEgu1O0ms5lYmLwwJ1YPIF6EEPklpgr
	 +QQ4skyvnbzmXZBmahvdwsqPKH3rNyzL5ZXy/cZIkrjxX/X+KO9w1Guwm1Of66iU72
	 O97Ftehsqk1saj9YHIGjyC9rUQ41F78egDvfrJsbtPoJM26zsxHw98M7bGffFWX/CA
	 PVTrJ3e0syJtu51Wd+9bLX0sh+2qqE0Rtrx0EHeNcwFL4xaTEvxP+RfG2fMIatb1st
	 IJ8L1u4eL2DtzrQhSUwXWuhgnaDmoNxrvgE7+PaHJvxYfcV/LVsWTLMo138SZvJ6lM
	 sq8Tg4Nhe5Trw==
Date: Tue, 13 Jan 2026 06:56:31 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	xen-devel@lists.xenproject.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [PATCH v5 12/21] x86/paravirt: Move paravirt_sched_clock()
 related code into tsc.c
Message-ID: <20260113065631.GC3099059@liuwe-devbox-debian-v2.local>
References: <20260105110520.21356-1-jgross@suse.com>
 <20260105110520.21356-13-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105110520.21356-13-jgross@suse.com>

On Mon, Jan 05, 2026 at 12:05:11PM +0100, Juergen Gross wrote:
> The only user of paravirt_sched_clock() is in tsc.c, so move the code
> from paravirt.c and paravirt.h to tsc.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/include/asm/paravirt.h    | 12 ------------
>  arch/x86/include/asm/timer.h       |  1 +
>  arch/x86/kernel/kvmclock.c         |  1 +
>  arch/x86/kernel/paravirt.c         |  7 -------
>  arch/x86/kernel/tsc.c              | 10 +++++++++-
>  arch/x86/xen/time.c                |  1 +
>  drivers/clocksource/hyperv_timer.c |  2 ++

Acked-by: Wei Liu (Microsoft) <wei.liu@kernel.org>

