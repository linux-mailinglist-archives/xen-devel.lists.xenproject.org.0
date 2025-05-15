Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD3AB8A9C
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 17:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985744.1371610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFaUW-0004Lk-UO; Thu, 15 May 2025 15:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985744.1371610; Thu, 15 May 2025 15:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFaUW-0004KD-Rb; Thu, 15 May 2025 15:27:24 +0000
Received: by outflank-mailman (input) for mailman id 985744;
 Thu, 15 May 2025 15:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vzs3=X7=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uFaUV-00046l-8t
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 15:27:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17af7269-31a1-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 17:27:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F421C5C5BC8;
 Thu, 15 May 2025 15:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDA8C4CEE7;
 Thu, 15 May 2025 15:27:15 +0000 (UTC)
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
X-Inumbo-ID: 17af7269-31a1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747322839;
	bh=wUTLgYYkilNyjrqWEPSf4YmaWt7G2OS/5f8TggVtdRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=om0/Zf9oiHVqLN0g5Kt02BQodrs6owd0Bp9mPs3280ydfOkMjNs6d/0BQXVBnRvRy
	 N3wuaoPa6ZbFG+RCk6e+VgdwKN/Io/tnCPkU4aMwslcaNM8/u6fXYJZsgp3j6rP5Hl
	 Xeu2i8CwYOQ6DFXKCmg79L6hRtHEe7h0laqaOySbmv5KG322vpDufDFP+skHwFAqgl
	 0wa4UL7aXfxKa9XMFgjZy0C82i6OZenxiRUQ+qjmnFbyfEZ+d8S3c9ffGQYdoiFtzZ
	 bQBBdD/+agD8A9+mMY1MXm6QeDMlSoYf7PO4WSTfzXkZVYyEjH2/Egg4lKb/Z9x5pH
	 WYcbEP5rOlD6w==
Date: Thu, 15 May 2025 17:27:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
	rafael@kernel.org, lenb@kernel.org
Subject: Re: [PATCH v1 3/3] x86/msr: Convert a native_wrmsr() use to
 native_wrmsrq()
Message-ID: <aCYH0UQzO_Ek27js@gmail.com>
References: <20250512084552.1586883-1-xin@zytor.com>
 <20250512084552.1586883-4-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512084552.1586883-4-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> Convert a native_wrmsr() use to native_wrmsrq() to zap meaningless type
> conversions when a u64 MSR value is splitted into two u32.
> 
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  arch/x86/coco/sev/core.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index ff82151f7718..b3ce6fc8b62d 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -282,12 +282,7 @@ static inline u64 sev_es_rd_ghcb_msr(void)
>  
>  static __always_inline void sev_es_wr_ghcb_msr(u64 val)
>  {
> -	u32 low, high;
> -
> -	low  = (u32)(val);
> -	high = (u32)(val >> 32);
> -
> -	native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
> +	native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, val);

BTW., at this point we should probably just replace 
sev_es_wr_ghcb_msr() calls with direct calls to:

	native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, ...);

as sev_es_wr_ghcb_msr() is now basically an open-coded native_wrmsrq().

Thanks,

	Ingo

