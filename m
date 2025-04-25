Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF28A9BC33
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 03:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967090.1357051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u87gD-0006G8-Ga; Fri, 25 Apr 2025 01:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967090.1357051; Fri, 25 Apr 2025 01:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u87gD-0006Dv-Di; Fri, 25 Apr 2025 01:16:37 +0000
Received: by outflank-mailman (input) for mailman id 967090;
 Fri, 25 Apr 2025 01:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tq29=XL=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1u87gC-0005ro-1R
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 01:16:36 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eccefaf0-2172-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 03:16:34 +0200 (CEST)
Received: from [172.27.3.244] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53P1FaK51878943
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 24 Apr 2025 18:15:37 -0700
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
X-Inumbo-ID: eccefaf0-2172-11f0-9eb3-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53P1FaK51878943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745543740;
	bh=Eqcm/Hif/MkDs4mjYz2tKFyoVP1HuqqqBruNWCY5tSI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bwKC9WDGeH6PKjPk6PbPnscfTUG7uO0p90T8jZtRz/H1uV5R0u0jHyKPLpz4Lzuza
	 jaan86VUYCLDqr62mFWyqSXvvBjaf+ve6G5ZtKNwudj3pQxiq/p0DQHubDAWAL4iVK
	 Num9qesxZzs6c+gaFJIpcjhHqgTrRqcXI4bwh1tGXr1pf3tvinHjceiUPk+LlVYVAf
	 mYaL7M4P9z3kr6aQ69HDJ4GJ4kjHFXVFi/8OoAlHsRrCGt5QgNwZK3Agfp39Cx1S5g
	 BERlMv7+KxMZFAhG9+QYjnrsyKHBCBRF3w4ALl9e3WkwPa1KT4qcT1tq3RLd9c/O5Z
	 dx3hBdqeJAyRA==
Message-ID: <483eb20c-7302-4733-a15f-21d140396919@zytor.com>
Date: Thu, 24 Apr 2025 18:15:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 21/34] x86/msr: Utilize the alternatives mechanism
 to write MSR
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
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <0cdc6e9d-88eb-4ead-8d55-985474257d53@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/24/25 01:14, Jürgen Groß wrote:
>>
>> Actually, that is how we get this patch with the existing alternatives
>> infrastructure.  And we took a step further to also remove the pv_ops
>> MSR APIs...
> 
> And this is what I'm questioning. IMHO this approach is adding more
> code by removing the pv_ops MSR_APIs just because "pv_ops is bad". And
> I believe most refusal of pv_ops is based on no longer valid reasoning.
> 

pvops are a headache because it is effectively a secondary alternatives 
infrastructure that is incompatible with the alternatives one...

>> It looks to me that you want to add a new facility to the alternatives
>> infrastructure first?
> 
> Why would we need a new facility in the alternatives infrastructure?

I'm not sure what Xin means with "facility", but a key motivation for 
this is to:

a. Avoid using the pvops for MSRs when on the only remaining user 
thereof (Xen) is only using it for a very small subset of MSRs and for 
the rest it is just overhead, even for Xen;

b. Being able to do wrmsrns immediate/wrmsrns/wrmsr and rdmsr 
immediate/rdmsr alternatives.

Of these, (b) is by far the biggest motivation. The architectural 
direction for supervisor states is to avoid ad hoc and XSAVES ISA and 
instead use MSRs. The immediate forms are expected to be significantly 
faster, because they make the MSR index available at the very beginning 
of the pipeline instead of at a relatively late stage.

	-hpa


