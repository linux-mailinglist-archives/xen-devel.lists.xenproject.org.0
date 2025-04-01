Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407D2A77434
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 07:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933454.1335398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzUZx-0003Dv-L2; Tue, 01 Apr 2025 05:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933454.1335398; Tue, 01 Apr 2025 05:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzUZx-0003CP-IV; Tue, 01 Apr 2025 05:54:29 +0000
Received: by outflank-mailman (input) for mailman id 933454;
 Tue, 01 Apr 2025 05:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O7Gc=WT=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1tzUZw-0003CJ-OW
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 05:54:28 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45012fa-0ebd-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 07:54:26 +0200 (CEST)
Received: from [192.168.7.202] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5315rnna3585174
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 31 Mar 2025 22:53:50 -0700
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
X-Inumbo-ID: c45012fa-0ebd-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5315rnna3585174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743486833;
	bh=IsfDg+Xsar+P1dKxOMDHesRyrvTgpQ4ZnItmblKhbNo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mCuaWYHpnRlQenAgliGLWATiV5WBBr6xjToONzu4sHItD9CcH/Hn50bDSEPtXNZHr
	 EmqrAKW9JffJBkWQby7YDNbuh5dAusXyZylpGe//cf2TIpo8U9KQTebtElsvd5V6YU
	 HF8RdPMDVbhf6+t7dYSnb9ysczMAV1Fx5VJE/67I9mU0mkx81L5F9z8nRvdhiz9hLN
	 sCK8LNjY5ocO9OXH0mW1yJE2ZnmLSV7SipWK2RChNsbc23C/QGRt/kc29IMVpQqyvo
	 nZSU48inZXaexf0KV8NOAQgpc90SasTMpL5bfOFSYTA0+0PAcMy4DOrsLjm31CtW80
	 qxOV8xFK/xmlw==
Message-ID: <a0254e73-bf7c-4876-b64e-b08e96044666@zytor.com>
Date: Mon, 31 Mar 2025 22:53:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/15] x86/msr: Replace __wrmsr() with
 native_wrmsrl()
To: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jgross@suse.com,
        andrew.cooper3@citrix.com, peterz@infradead.org, acme@kernel.org,
        namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-2-xin@zytor.com> <Z-pruogreCuU66wm@gmail.com>
 <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <9D15DE81-2E68-4FCD-A133-4963602E18C9@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/2025 1:32 PM, H. Peter Anvin wrote:
> On March 31, 2025 3:17:30 AM PDT, Ingo Molnar <mingo@kernel.org> wrote:
>>
>> * Xin Li (Intel) <xin@zytor.com> wrote:
>>
>>> -	__wrmsr      (MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3, val >> 32);
>>> +	native_wrmsrl(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3);
>>
>> This is an improvement.
>>
>>> -	__wrmsr      (MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
>>> +	native_wrmsrl(MSR_IA32_PQR_ASSOC, (u64)plr->closid << 32 | rmid_p);
>>
>>> -	__wrmsr      (MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
>>> +	native_wrmsrl(MSR_IA32_PQR_ASSOC, (u64)closid_p << 32 | rmid_p);
>>
>> This is not an improvement.
>>
>> Please provide a native_wrmsrl() API variant where natural [rmid_p, closid_p]
>> high/lo parameters can be used, without the shift-uglification...
>>
>> Thanks,
>>
>> 	Ingo
> 
> Directing this question primarily to Ingo, who is more than anyone else the namespace consistency guardian:
> 
> On the subject of msr function naming ... *msrl() has always been misleading. The -l suffix usually means 32 bits; sometimes it means the C type "long" (which in the kernel is used instead of size_t/uintptr_t, which might end up being "fun" when 128-bit architectures appear some time this century), but for a fixed 64-but type we normally use -q.
> 
> Should we rename the *msrl() functions to *msrq() as part of this overhaul?
> 

Per "struct msr" defined in arch/x86/include/asm/shared/msr.h:

struct msr {
         union {
                 struct {
                         u32 l;
                         u32 h;
                 };
                 u64 q;
         };
};

Probably *msrq() is what we want?



