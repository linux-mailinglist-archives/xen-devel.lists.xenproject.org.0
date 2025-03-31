Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F54A763FB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 12:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932354.1334489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzCDD-0000zB-Oy; Mon, 31 Mar 2025 10:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932354.1334489; Mon, 31 Mar 2025 10:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzCDD-0000xR-Lq; Mon, 31 Mar 2025 10:17:47 +0000
Received: by outflank-mailman (input) for mailman id 932354;
 Mon, 31 Mar 2025 10:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g2Hv=WS=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1tzCDC-0000xL-Ab
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 10:17:46 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 620e6648-0e19-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 12:17:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EA6C5439BC;
 Mon, 31 Mar 2025 10:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515D5C4CEE3;
 Mon, 31 Mar 2025 10:17:33 +0000 (UTC)
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
X-Inumbo-ID: 620e6648-0e19-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743416262;
	bh=OnEcQ86N1b/nWwzloNbMBTvRyH+I2tQtz+Iwgl9ovf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1su6OlesOh1iys2BALYaqexBKG7IcFqHgPaafBKTCbyQo6geGjhLQKz7O0OcoXvT
	 YQIpzmw1tQSWTsF9vwtzrlcdIcF7KcjPFAwykaVs903WQhoAu/+qZ7Ggeiwe7IRAvi
	 Y8aEbjENC3F1wRSXqHhXFrzi6g01c1oFTHI0YEi4v3pDcQrlIYk7ErbPRAXMN1Gvnt
	 gSg2xKJSTtBhyue1C7dnSzI120JEcG6dtEm9tY06MaoOdl/kTFn/fkjNUhbHm5WCdt
	 7HMZ5EnAV1JEKUK7IsVxDNhULSyJAaVCFvsuIggC5RwuFJb0eGVdW8LT9vTHsipJF2
	 GZDbcKOlstJLA==
Date: Mon, 31 Mar 2025 12:17:30 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-edac@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, wei.liu@kernel.org,
	ajay.kaher@broadcom.com, alexey.amakhalov@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
	pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
	luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
	haiyangz@microsoft.com, decui@microsoft.com
Subject: Re: [RFC PATCH v1 01/15] x86/msr: Replace __wrmsr() with
 native_wrmsrl()
Message-ID: <Z-pruogreCuU66wm@gmail.com>
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-2-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331082251.3171276-2-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> -	__wrmsr      (MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3, val >> 32);
> +	native_wrmsrl(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3);

This is an improvement.

> -	__wrmsr      (MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
> +	native_wrmsrl(MSR_IA32_PQR_ASSOC, (u64)plr->closid << 32 | rmid_p);

> -	__wrmsr      (MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
> +	native_wrmsrl(MSR_IA32_PQR_ASSOC, (u64)closid_p << 32 | rmid_p);

This is not an improvement.

Please provide a native_wrmsrl() API variant where natural [rmid_p, closid_p]
high/lo parameters can be used, without the shift-uglification...

Thanks,

	Ingo

