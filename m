Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC73A76428
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 12:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932366.1334511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzCLr-0005C9-Mf; Mon, 31 Mar 2025 10:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932366.1334511; Mon, 31 Mar 2025 10:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzCLr-0005A8-J9; Mon, 31 Mar 2025 10:26:43 +0000
Received: by outflank-mailman (input) for mailman id 932366;
 Mon, 31 Mar 2025 10:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g2Hv=WS=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1tzCLq-0005A2-Ft
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 10:26:42 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1ea79db-0e1a-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 12:26:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5202661120;
 Mon, 31 Mar 2025 10:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C478CC4CEE5;
 Mon, 31 Mar 2025 10:26:29 +0000 (UTC)
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
X-Inumbo-ID: a1ea79db-0e1a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743416798;
	bh=4YXZdHVM0TkXA+0kc8GIpKW5NQU7AZ4Je/lg8aqKF/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNKRTAv+gMnEVEwVPROIdVIANRJxm8LbYKcIVbFb3ADa4Tkur5F2mIuL95LZ7LZb1
	 5fqJ0aBp2v5cFupU9A4gdGZiDQ1FWpWF3RCKNziWJG18GDcV6Jku/oKEjoRuxnV9/n
	 tqlZBxLFrIHJZzvGETM/513c/sebuShZlti7+3NBoNv5JHNxaHW/38O4XPILpzN97I
	 97iuaFpjHX7UB0m+lxE7N2TRS5XllBFMdKrljOLOTYBow7YWoYoVOY+uLAOAiLaGN5
	 pBXF5L41ks0BVBoY1cpe8K/TydBaKSrGHdJwYFT4xSUwiCnyQTV/TVlvgKRxOXMEvV
	 AeHP4P5OJqZDg==
Date: Mon, 31 Mar 2025 12:26:21 +0200
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
Subject: Re: [RFC PATCH v1 02/15] x86/msr: Replace __rdmsr() with
 native_rdmsrl()
Message-ID: <Z-ptzZBePzh05HQI@gmail.com>
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-3-xin@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331082251.3171276-3-xin@zytor.com>


* Xin Li (Intel) <xin@zytor.com> wrote:

> __rdmsr() is the lowest level primitive MSR read API, and its direct 
> use is NOT preferred.  Use its wrapper function native_rdmsrl() 
> instead.

This description is very misleading. As of today, native_rdmsrl() 
doesn't exist in-tree, so it cannot be 'preferred' in any fashion.

We have native_read_msr(), a confusingly similar function name, and 
this changelog doesn't make it clear, at all, why the extra 
native_rdmsrl() indirection is introduced.

Please split this into two changes and explain them properly:

 - x86/msr: Add the native_rdmsrl() helper
 - x86/msr: Convert __rdmsr() uses to native_rdmsrl() uses

For the first patch you should explain why you want an extra layer of 
indirection within these APIs and how it relates to native_read_msr() 
and why there is a _read_msr() and a _rdmsr() variant...

Thanks,

	Ingo

