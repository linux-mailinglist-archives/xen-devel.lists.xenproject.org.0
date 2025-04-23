Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B939A99694
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 19:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965036.1355696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7dtJ-0004lx-Dp; Wed, 23 Apr 2025 17:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965036.1355696; Wed, 23 Apr 2025 17:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7dtJ-0004jY-BD; Wed, 23 Apr 2025 17:28:09 +0000
Received: by outflank-mailman (input) for mailman id 965036;
 Wed, 23 Apr 2025 17:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZaJ6=XJ=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1u7dtI-0004jS-6X
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 17:28:08 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5116dc26-2068-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 19:28:06 +0200 (CEST)
Received: from [192.168.7.202] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53NHRSwP3822273
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 23 Apr 2025 10:27:28 -0700
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
X-Inumbo-ID: 5116dc26-2068-11f0-9eb0-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53NHRSwP3822273
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745429251;
	bh=3DNEiH9ClADNNdC4s2AFGq03za4/i0hRtsw7HdWhX8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FYHpQRl8w+nTjaGGRqdQx9A21dGh6eRp5/7vZcoeVQfJ9FBrAtuE4a8nbQdhPJpY7
	 C5nTvzzz33F1edToPwWHSeJXgoh6SwIuUPr91pgD6ORF2jN+/5fZh9Ofi3nO2wDCgX
	 NyB6TneZbcSNhKwI3FWPkvGtSRtfl8YKXephFBr2m8UWFGjBObYHKKsepz0L/aTUGo
	 jFGXQZIyrJ70pWBdnFXn75qaBkvkid3XPvRU6MU8TH8CRJxSKjrb4b2UYHO+wGQ51t
	 Z5W8BeQoRoZzPHd5lWutYI7E+jcqOoxDsMyaxvuPKWJE7ftMpslNO0VeQ/i0ZeFCUN
	 zwJslGTaEkwWw==
Message-ID: <0e5cf01a-2cc1-46a2-89c1-3bcc502229c8@zytor.com>
Date: Wed, 23 Apr 2025 10:27:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 08/34] x86/msr: Convert a native_wrmsr() use to
 native_wrmsrq()
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
        linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com,
        peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
        pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
        luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
        haiyangz@microsoft.com, decui@microsoft.com
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-9-xin@zytor.com>
 <2932db03-164a-447e-92cf-1ef6c35c15a4@intel.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <2932db03-164a-447e-92cf-1ef6c35c15a4@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/2025 8:51 AM, Dave Hansen wrote:
> On 4/22/25 01:21, Xin Li (Intel) wrote:
>>   static __always_inline void sev_es_wr_ghcb_msr(u64 val)
>>   {
>> -	u32 low, high;
>> -
>> -	low  = (u32)(val);
>> -	high = (u32)(val >> 32);
>> -
>> -	native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
>> +	native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, val);
>>   }
> 
> A note on ordering: Had this been a native_wrmsr()=>__wrmsr()
> conversion, it could be sucked into the tree easily before the big
> __wrmsr()=>native_wrmsrq() conversion.
> 
> Yeah, you'd have to base the big rename on top of this. But with a
> series this big, I'd prioritize whatever gets it trimmed down.

Okay, I will focus on cleanup first.

