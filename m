Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80BA831AE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 22:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944652.1343047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2blh-0005rA-5g; Wed, 09 Apr 2025 20:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944652.1343047; Wed, 09 Apr 2025 20:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2blh-0005pU-2k; Wed, 09 Apr 2025 20:11:29 +0000
Received: by outflank-mailman (input) for mailman id 944652;
 Wed, 09 Apr 2025 20:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0lDW=W3=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u2blf-0005p5-Lu
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 20:11:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cff78919-157e-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 22:11:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C0ED75C04ED;
 Wed,  9 Apr 2025 20:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71925C4CEE2;
 Wed,  9 Apr 2025 20:11:14 +0000 (UTC)
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
X-Inumbo-ID: cff78919-157e-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744229483;
	bh=FJm/izdFNTfA1jwBlsdk1jJoTUGHKfakmjnarpokATA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D24yujy42QUc8MzaoYIOhqsAt7S0/2X6yekc52w0gwdRwZBMwmU2nUGsZoW5Ns7GD
	 j85elSFL53Wuzj6UvF8uMMGWEYy3lD+JT9cZ0aqP7gtAES0C3utL694NSMXdxOrKJc
	 9kIP4IKosSndbxn+SFfqxSrLVm9pBipvXXrP6J8VxMshOu3nGVg5Xag10MUwIq3jdK
	 Ebzxt4FaeSUl2kGyVYg1LltfzCxBxoV7FKWUvjuBBSV/RcEjM/nammCpLTt/GmU9n5
	 qWMtWEi+RRMn/FMGZcmAdYRRPyz1BTp+SNboYM41JDtFNJnwUWqDkFxGYl1tX5Mz6M
	 qlUYtZ4y1dU2Q==
Date: Wed, 9 Apr 2025 22:11:11 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-edac@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jgross@suse.com,
	andrew.cooper3@citrix.com, peterz@infradead.org, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
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
Message-ID: <Z_bUX06aq6thJ4Uu@gmail.com>
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-2-xin@zytor.com>
 <Z-pruogreCuU66wm@gmail.com>
 <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com>
 <a0254e73-bf7c-4876-b64e-b08e96044666@zytor.com>
 <e5770add-9d18-40e1-929d-df7c40f3c7d1@intel.com>
 <ADCFB190-A89A-460D-81A6-80E20AEFBFBC@zytor.com>
 <Z_bQV2oOnJlwbxnk@gmail.com>
 <29ad84a6-b40c-456a-9eed-9887c87dfb38@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29ad84a6-b40c-456a-9eed-9887c87dfb38@intel.com>


* Dave Hansen <dave.hansen@intel.com> wrote:

> On 4/9/25 12:53, Ingo Molnar wrote:
> >>> What would folks think about "wrmsr64()"? It's writing a 64-bit 
> >>> value to an MSR and there are a lot of functions in the kernel that 
> >>> are named with the argument width in bits.
> >> Personally, I hate the extra verbosity, mostly visual, since numerals 
> >> are nearly as prominent as capital letters they tend to attract the 
> >> eye. There is a reason why they aren't used this way in assembly 
> >> languages.
> > So what's the consensus here? Both work for me, but I have to pick one. 🙂
> 
> I don't feel strongly about it. You're not going to hurt my feelings if
> you pick the "q" one, so go for "q" unless you have a real preference.

Ok, since hpa seems to hate the wrmsr64()/rdmsr64() names due to the 
numeric verbosity, I'll go with wrmsrq()/rdmsrq().

Thanks,

	Ingo


