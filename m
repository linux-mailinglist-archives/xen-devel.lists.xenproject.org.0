Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF6A9BD56
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 05:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967144.1357063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8A04-0001xt-P7; Fri, 25 Apr 2025 03:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967144.1357063; Fri, 25 Apr 2025 03:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8A04-0001us-Kp; Fri, 25 Apr 2025 03:45:16 +0000
Received: by outflank-mailman (input) for mailman id 967144;
 Fri, 25 Apr 2025 03:45:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tq29=XL=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u8A02-0001um-S3
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 03:45:15 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b026bbb9-2187-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 05:45:12 +0200 (CEST)
Received: from [IPV6:2601:646:8081:1f93:ace:6989:11eb:d5d3]
 ([IPv6:2601:646:8081:1f93:ace:6989:11eb:d5d3]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P3iRFQ2047105
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 24 Apr 2025 20:44:27 -0700
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
X-Inumbo-ID: b026bbb9-2187-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P3iRFQ2047105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745552672;
	bh=b2EU0c9r4+7Z91N6+uKj1oR80E0vF0IHEbyiUhJnLQA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=h6tkGPZf95yQ3bAcYVi/++g5apF9dA+xDaGqiCLYRc9VcHVlrJdGQsg4l29MEZ7CJ
	 aLVdgM7ERZdGZm+YeYHxkaRoWYmC139k7kZqYZoAzT/znx6Kx6O2GtZpDA/JUfvlJ1
	 CcsBsfRHddjbpCzdM4zIuzpA7epwqsOqTiZB4ua/CkyilKNABnOQlavSOZxha0+wfj
	 cX6ckW2WvvNyLFS1B2A5lWVYkYGzgGJhfmVN53iSVa6vyOu/NY5xsXrNsSQKXTH85b
	 +dwG+fJzWTGalgBqhI1nG1clXUnlMv9jRJvaiZN9wKeE5vSAPLzqIsZZs/a531ezoe
	 HihwH9Nv3ITtg==
Message-ID: <72516271-5b28-434a-838b-d8532e1b4fc1@zytor.com>
Date: Thu, 24 Apr 2025 20:44:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 21/34] x86/msr: Utilize the alternatives mechanism
 to write MSR
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        Xin Li
 <xin@zytor.com>, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, acme@kernel.org,
        andrew.cooper3@citrix.com, peterz@infradead.org, namhyung@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-22-xin@zytor.com>
 <b2624e84-6fab-44a3-affc-ce0847cd3da4@suse.com>
 <f7198308-e8f8-4cc5-b884-24bc5f408a2a@zytor.com>
 <37c88ea3-dd24-4607-9ee1-0f19025aaef3@suse.com>
 <bb8f6b85-4e7d-440a-a8c3-0e0da45864b8@zytor.com>
 <0cdc6e9d-88eb-4ead-8d55-985474257d53@suse.com>
 <483eb20c-7302-4733-a15f-21d140396919@zytor.com>
Content-Language: en-US
In-Reply-To: <483eb20c-7302-4733-a15f-21d140396919@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/24/25 18:15, H. Peter Anvin wrote:
> On 4/24/25 01:14, Jürgen Groß wrote:
>>>
>>> Actually, that is how we get this patch with the existing alternatives
>>> infrastructure.  And we took a step further to also remove the pv_ops
>>> MSR APIs...
>>
>> And this is what I'm questioning. IMHO this approach is adding more
>> code by removing the pv_ops MSR_APIs just because "pv_ops is bad". And
>> I believe most refusal of pv_ops is based on no longer valid reasoning.
>>
> 
> pvops are a headache because it is effectively a secondary alternatives 
> infrastructure that is incompatible with the alternatives one...
> 
>>> It looks to me that you want to add a new facility to the alternatives
>>> infrastructure first?
>>
>> Why would we need a new facility in the alternatives infrastructure?
> 
> I'm not sure what Xin means with "facility", but a key motivation for 
> this is to:
> 
> a. Avoid using the pvops for MSRs when on the only remaining user 
> thereof (Xen) is only using it for a very small subset of MSRs and for 
> the rest it is just overhead, even for Xen;
> 
> b. Being able to do wrmsrns immediate/wrmsrns/wrmsr and rdmsr immediate/ 
> rdmsr alternatives.
> 
> Of these, (b) is by far the biggest motivation. The architectural 
> direction for supervisor states is to avoid ad hoc and XSAVES ISA and 
> instead use MSRs. The immediate forms are expected to be significantly 
> faster, because they make the MSR index available at the very beginning 
> of the pipeline instead of at a relatively late stage.
> 

Note that to support the immediate forms, we *must* do these inline, or 
the const-ness of the MSR index -- which applies to by far the vast 
majority of MSR references -- gets lost. pvops does exactly that.

Furthermore, the MSR immediate instructions take a 64-bit number in a 
single register; as these instructions are by necessity relatively long, 
it makes sense for the alternative sequence to accept a 64-bit input 
register and do the %eax/%edx shuffle in the legacy fallback code... we 
did a bunch of experiments to see what made most sense.

	-hpa


