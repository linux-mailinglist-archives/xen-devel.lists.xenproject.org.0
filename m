Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF4A8314D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 21:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944624.1343026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2bV1-0008Kx-Jm; Wed, 09 Apr 2025 19:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944624.1343026; Wed, 09 Apr 2025 19:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2bV1-0008JT-Gm; Wed, 09 Apr 2025 19:54:15 +0000
Received: by outflank-mailman (input) for mailman id 944624;
 Wed, 09 Apr 2025 19:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0lDW=W3=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1u2bV0-0008JN-JG
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 19:54:14 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6849c595-157c-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 21:54:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 67ABD61127;
 Wed,  9 Apr 2025 19:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260C8C4CEE2;
 Wed,  9 Apr 2025 19:54:01 +0000 (UTC)
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
X-Inumbo-ID: 6849c595-157c-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744228450;
	bh=q7KvwDfQqFDNGgQf6PyiHomLFAW6NL2n557EpD26id8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VulSS1YwlnFjfym00iwjm8nZpYCyp06C0ojMIpSCSHZR4u0kCve/HPOLSpwGvY8u5
	 pBTjBb/9vduXt1yHmPU9a+E8F7KAYhYpWKQEBBPX+/hfy20lXzFqyHyY8B+HK6sZUf
	 xN3fYMEJoURP0ouK4XLhP558hxwDPdlv3j55wiCtlhRPkFu/TgXbgsw4c31dujDZWx
	 WI68CmIsMMEvM72xxyr1xE96ssKn4YT5iCMXcjHWRmRp8UzErdBvMQgGb+caLf69ln
	 4GvtnHjQrXPK2u6hCjNy/AUsgKBW8iPDB+syZsrtkVGFcuJdzKsEe35yQuSR5M6flU
	 mNFGcP/z9LOpg==
Date: Wed, 9 Apr 2025 21:53:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Xin Li <xin@zytor.com>,
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
Message-ID: <Z_bQV2oOnJlwbxnk@gmail.com>
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-2-xin@zytor.com>
 <Z-pruogreCuU66wm@gmail.com>
 <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com>
 <a0254e73-bf7c-4876-b64e-b08e96044666@zytor.com>
 <e5770add-9d18-40e1-929d-df7c40f3c7d1@intel.com>
 <ADCFB190-A89A-460D-81A6-80E20AEFBFBC@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ADCFB190-A89A-460D-81A6-80E20AEFBFBC@zytor.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> On April 2, 2025 8:41:07 AM PDT, Dave Hansen <dave.hansen@intel.com> wrote:
> >On 3/31/25 22:53, Xin Li wrote:
> >> Per "struct msr" defined in arch/x86/include/asm/shared/msr.h:
> >> 
> >> struct msr {
> >>         union {
> >>                 struct {
> >>                         u32 l;
> >>                         u32 h;
> >>                 };
> >>                 u64 q;
> >>         };
> >> };
> >> 
> >> Probably *msrq() is what we want?
> >
> > What would folks think about "wrmsr64()"? It's writing a 64-bit 
> > value to an MSR and there are a lot of functions in the kernel that 
> > are named with the argument width in bits.
> 
> Personally, I hate the extra verbosity, mostly visual, since numerals 
> are nearly as prominent as capital letters they tend to attract the 
> eye. There is a reason why they aren't used this way in assembly 
> languages.

So what's the consensus here? Both work for me, but I have to pick one. :-)

Thanks,

	Ingo

