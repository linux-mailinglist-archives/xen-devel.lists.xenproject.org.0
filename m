Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36338BAE6EF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 21:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134437.1472317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3fu6-0001GR-5q; Tue, 30 Sep 2025 19:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134437.1472317; Tue, 30 Sep 2025 19:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3fu6-0001EB-3B; Tue, 30 Sep 2025 19:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1134437;
 Tue, 30 Sep 2025 19:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3Ea=4J=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1v3fu4-0001DT-N3
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 19:20:48 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fba6d8f-9e32-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 21:20:46 +0200 (CEST)
Received: from [IPV6:2601:646:8081:9484:3373:e8bd:aaa4:7c23]
 ([IPv6:2601:646:8081:9484:3373:e8bd:aaa4:7c23])
 (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 58UJJc0q376069
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 30 Sep 2025 12:19:38 -0700
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
X-Inumbo-ID: 8fba6d8f-9e32-11f0-9809-7dc792cee155
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 58UJJc0q376069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1759259981;
	bh=5jKsWr8QEv1dE0BHGjK4jG5jy4dVCkN+HP+b8pZLYWY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KmHeNLZj/n0P3Bx95LFzhVuxLXrHMsWLMMJ2Gm4H8FNamSlw/ykdibwr0KiTsB1Hx
	 kimmmjaE4PQNu82809DGZ+bXQB5PtFK+1BIkP2kit+wX/G9oZjCTGQQ4NBn3eyeroN
	 igAJ5wylIhFE9616RLBxQ4fa1M/81mz3016d0y5QrZzka0FJXVai2ABAi7s6qurIZU
	 UCt7L6g9U8v2bHT5kR3usV/nGI4JUG2MRe34f5yvbCfc1Wc8a+J7TpEqXyLIfbRGUg
	 AzbRtlbso5/anwJIMETPoxFJcMs4aRnGHHmG/oIvBJHSwcgPCKq+EsfPpQlRB7rZB1
	 WCrrEfyQwfYwQ==
Message-ID: <1412c7a5-8961-4949-b09e-7b9d080ce9bf@zytor.com>
Date: Tue, 30 Sep 2025 12:19:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] x86/msr: Inline rdmsr/wrmsr instructions
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        llvm@lists.linux.dev
Cc: xin@zytor.com, "Kirill A. Shutemov" <kas@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org, Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.makhalov@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
References: <20250930070356.30695-1-jgross@suse.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20250930070356.30695-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-09-30 00:03, Juergen Gross wrote:
> When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
> infrastructure will always use functions for reading or writing MSRs,
> even when running on bare metal.
> 
> Switch to inline RDMSR/WRMSR instructions in this case, reducing the
> paravirt overhead.
> 
> In order to make this less intrusive, some further reorganization of
> the MSR access helpers is done in the first 5 patches.
> 
> The next 5 patches are converting the non-paravirt case to use direct
> inlining of the MSR access instructions, including the WRMSRNS
> instruction and the immediate variants of RDMSR and WRMSR if possible.
> 
> Patch 11 removes the PV hooks for MSR accesses and implements the
> Xen PV cases via calls depending on X86_FEATURE_XENPV, which results
> in runtime patching those calls away for the non-XenPV case.
> 
> Patch 12 is a final little cleanup patch.
> 
> This series has been tested to work with Xen PV and on bare metal.
> 
> This series is inspired by Xin Li, who used a similar approach, but
> (in my opinion) with some flaws. Originally I thought it should be
> possible to use the paravirt infrastructure, but this turned out to be
> rather complicated, especially for the Xen PV case in the *_safe()
> variants of the MSR access functions.
> 

Looks good to me.

(I'm not at all surprised that paravirt_ops didn't do the job. Both I and Xin
had come to the same conclusion.)


Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>

