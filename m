Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B25EAB8AAB
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 17:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985751.1371619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFaX2-0004sg-9U; Thu, 15 May 2025 15:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985751.1371619; Thu, 15 May 2025 15:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFaX2-0004rI-6j; Thu, 15 May 2025 15:30:00 +0000
Received: by outflank-mailman (input) for mailman id 985751;
 Thu, 15 May 2025 15:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vzs3=X7=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uFaX1-0004rA-BM
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 15:29:59 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74b299ae-31a1-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 17:29:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 03DAF614BC;
 Thu, 15 May 2025 15:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88415C4CEE7;
 Thu, 15 May 2025 15:29:52 +0000 (UTC)
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
X-Inumbo-ID: 74b299ae-31a1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747322995;
	bh=r+vgoHyPQBXrDnAequwJxZxOTi6XM4s7SidDK1toDMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzEkXjNfRDfzQ5GSc7NDBYXzLq2U2bw/Gp4vlC7jEmo5kdO/vJmkmRqKjBbvtvSHE
	 IpmoYfwa4Yw2qifam3LOs0zBS1KEzYLQhiFDffdShYwPtRqVZdiEycadwv7r+PYk5h
	 F4VQ5ffWzzIpOVhb5ugdL/SHgPikVYUBu3BQB8RlWW9b5RVdNuZdwYR/j3G2vIqYqj
	 326h4/FYdiMslKMxeL1TVkHX4WyXFkMbVQsztMT2WgWln04f/pMRIiiyzSARV6zxqK
	 9VzzFrxMxdRi85vDhkSPA6Gs6VcIhSvLUzfyL3pZKhpVKV1IfIDw4C5nguWIlY7ZYC
	 lGmUajFVTt6Uw==
Date: Thu, 15 May 2025 17:29:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
	rafael@kernel.org, lenb@kernel.org
Subject: Re: [PATCH v1 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
Message-ID: <aCYIblffvBGUuxWf@gmail.com>
References: <20250512084552.1586883-1-xin@zytor.com>
 <20250512084552.1586883-3-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512084552.1586883-3-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> xen_read_msr_safe() currently passes an uninitialized argument err to
> xen_do_read_msr().  But as xen_do_read_msr() may not set the argument,
> xen_read_msr_safe() could return err with an unpredictable value.
> 
> To ensure correctness, initialize err to 0 (representing success)
> in xen_read_msr_safe().
> 
> Because xen_read_msr_safe() is essentially a wrapper of xen_do_read_msr(),
> the latter should be responsible for initializing the value of *err to 0.
> Thus initialize *err to 0 in xen_do_read_msr().
> 
> Fixes: 502ad6e5a619 ("x86/msr: Change the function type of native_read_msr_safe()")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/xen-devel/aBxNI_Q0-MhtBSZG@stanley.mountain/
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  arch/x86/xen/enlighten_pv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 3be38350f044..01f1d441347e 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1091,6 +1091,9 @@ static u64 xen_do_read_msr(u32 msr, int *err)
>  {
>  	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
>  
> +	if (err)
> +		*err = 0;
> +
>  	if (pmu_msr_chk_emulated(msr, &val, true))
>  		return val;
>  
> @@ -1162,7 +1165,7 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
>  
>  static int xen_read_msr_safe(u32 msr, u64 *val)
>  {
> -	int err;
> +	int err = 0;
>  
>  	*val = xen_do_read_msr(msr, &err);
>  	return err;

So why not initialize 'err' with 0 in both callers, xen_read_msr_safe() 
and xen_read_msr(), and avoid all the initialization trouble in 
xen_do_read_msr()?

Thanks,

	Ingo

