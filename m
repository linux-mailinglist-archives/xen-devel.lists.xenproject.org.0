Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E55A91A38
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 13:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957383.1350520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5NAE-0001ch-JP; Thu, 17 Apr 2025 11:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957383.1350520; Thu, 17 Apr 2025 11:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5NAE-0001b7-GF; Thu, 17 Apr 2025 11:12:14 +0000
Received: by outflank-mailman (input) for mailman id 957383;
 Thu, 17 Apr 2025 11:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ4N=XD=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u5NAC-0001b1-OA
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 11:12:12 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd389fe3-1b7c-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 13:12:09 +0200 (CEST)
Received: from [192.168.7.202] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53HBB0dU3967739
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 17 Apr 2025 04:11:01 -0700
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
X-Inumbo-ID: cd389fe3-1b7c-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53HBB0dU3967739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744888264;
	bh=zKR49UWsXQlKIMA1VnL+BkqgO+3iF8iLPVDDfF2KoTE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZIADA/NBWFdjMUgJTKpv9M9Wy2YG9IZEPFByL8wYabsxbBoRuZfKRlm/KXHCD1Dct
	 p+vwf14YsIuc+VHp9bDfack/1J0ZEDi3/LMHCo05xDW9TD4JrJ0GM5fVVA/piqxPhD
	 UyV8JWSU0hR2PMwkuYuHLcqgii53bDcW9KmA0ITTnJZG4RxQYf1Gr8LMHk+DKpR9xo
	 v/L3GNQ4ChUSYncpwgOQsPYYlB/v/0qZd/JiW4t/kLzx/6ZLdqruZ97wB6zyl1mziC
	 tKwEE+12hM3fNBR36tO17t9Oq8pShTsP2t1ihwsRhIESP8RHTn9IcCLiPfhw0jeR7+
	 9wRv9KyfJmA3A==
Message-ID: <edbeb41d-3c38-4778-9a7c-255edc7cd5fb@zytor.com>
Date: Thu, 17 Apr 2025 04:10:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 13/15] x86/msr: Use the alternatives mechanism to
 read MSR
To: Francesco Lavra <francescolavra.fl@gmail.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, ajay.kaher@broadcom.com,
        alexander.shishkin@linux.intel.com, andrew.cooper3@citrix.com,
        bcm-kernel-feedback-list@broadcom.com, boris.ostrovsky@oracle.com,
        bp@alien8.de, bpf@vger.kernel.org, dave.hansen@linux.intel.com,
        decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
        irogers@google.com, jgross@suse.com, jolsa@kernel.org,
        kan.liang@linux.intel.com, kvm@vger.kernel.org, kys@microsoft.com,
        linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
        llvm@lists.linux.dev, luto@kernel.org, mark.rutland@arm.com,
        mingo@redhat.com, namhyung@kernel.org, pbonzini@redhat.com,
        peterz@infradead.org, seanjc@google.com, tglx@linutronix.de,
        tony.luck@intel.com, virtualization@lists.linux.dev,
        vkuznets@redhat.com, wei.liu@kernel.org, x86@kernel.org,
        xen-devel@lists.xenproject.org
References: <0f4f2ed70829fffb2eb816e34e26be22681705a5.camel@gmail.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <0f4f2ed70829fffb2eb816e34e26be22681705a5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/2025 10:13 AM, Francesco Lavra wrote:
> This works only if this function has been called directly (e.g. via
> `call asm_xen_write_msr`), but doesn't work with alternative call types
> (like indirect calls). Not sure why one might want to use an indirect
> call to invoke asm_xen_write_msr, but this creates a hidden coupling
> between caller and callee.
> I don't have a suggestion on how to get rid of this coupling, other
> than setting ipdelta in _ASM_EXTABLE_FUNC_REWIND() to 0 and adjusting
> the _ASM_EXTABLE_TYPE entries at the call sites to consider the
> instruction that follows the function call (instead of the call
> instruction) as the faulting instruction (which seems pretty ugly, at
> least because what follows the function call could be an instruction
> that might itself fault). But you may want to make this caveat explicit
> in the comment.

Good idea, will state that in the comment.

